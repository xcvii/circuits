#include <stdbool.h>

#include <util/delay.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/power.h>
#include <avr/sleep.h>
#include <avr/wdt.h>


bool g_running = false;


uint8_t LED_ADDRESS[] = {
    (0<<PB3) | (0<<PB2) | (1<<PB1),
    (0<<PB3) | (1<<PB2) | (0<<PB1),
    (0<<PB3) | (1<<PB2) | (1<<PB1),
    (1<<PB3) | (0<<PB2) | (0<<PB1),
    (1<<PB3) | (0<<PB2) | (1<<PB1),
    (1<<PB3) | (1<<PB2) | (0<<PB1),
    (1<<PB3) | (1<<PB2) | (1<<PB1),
};


#define delay_ms(time_ms) \
    do { \
    CLKPR = (1<<CLKPCE) | (1<<CLKPS3); \
    _delay_ms(time_ms); \
    CLKPR = (1<<CLKPCE); \
    } while (0)


void start_pwm(void)
{
    TCCR0A =
        (1<<COM0A1) | (0<<COM0A0) // clear on match, set on top
        | (1<<WGM01) | (1<<WGM00) // fast PWM
        ;

    TCCR0B =
        (0<<CS02) | (0<<CS01) | (1<<CS00) // no prescaling
        ;
}


void stop_pwm(void)
{
    TCCR0A = 0;
}


void set_pwm(int16_t intensity)
{
    if (intensity < 0)
    {
        OCR0A = 0;
    }
    else if (0x100 <= intensity)
    {
        OCR0A = 0xff;
    }
    else
    {
        OCR0A = (uint8_t)intensity;
    }
}


void sleep_helper(bool schedule_wakeup)
{
    if (schedule_wakeup)
    {
        WDTCR =
            (1<<WDCE)
            | (0<<WDE) | (1<<WDTIE)                         // interrupt mode
            | (0<<WDP3) | (0<<WDP2) | (0<<WDP1) | (1<<WDP0) // 32ms
            ;
        wdt_reset();
    }

    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    sleep_enable();
    sleep_cpu();
}


void sleep(void)
{
    sleep_helper(true);
}


void wakeup(void)
{
    sleep_disable();
    wdt_reset();
    WDTCR = (1<<WDCE) | (0<<WDTIE); // stopped
}


ISR(WDT_vect)
{
    wakeup();
}


bool is_pressed(void)
{
    for (int i = 0; i < 4; ++i)
    {
        if (PINB & (1<<PB4))
        {
            return false;
        }

        delay_ms(10);
    }

    return true;
}


ISR(PCINT0_vect)
{
    if (is_pressed())
    {
        g_running = !g_running;

        if (g_running)
        {
            wakeup();
            start_pwm();
        }
        else
        {
            stop_pwm();
            PORTB = 0;
        }
    }
}


void init(void)
{
    // don't need adc or analog comparator
    power_adc_disable();
    ADCSRA = 0;
    ACSR = (1<<ACD);

    // PB4: switch
    // PB3, PB2, PB1: LED address
    // PB0: PWM
    DDRB = (0<<PB4) | (1<<PB3) | (1<<PB2) | (1<<PB1) | (1<<PB0);
    PORTB = 0;

    GIMSK = (1<<PCIE);
    PCMSK = (1<<PCINT4);

    sei();
}


void shutdown(void)
{
    sleep_helper(false);
}


void run_ee(void)
{
    uint8_t current_led;
    uint8_t led_order[] = {1,0,2,3,4,5,6};
    for (uint16_t i = 0; g_running && i < 4200; ++i)
    {
        current_led = led_order[i % 7];
        PORTB = LED_ADDRESS[current_led] | (1<<PB0);
        delay_ms(75);
    }
}


int main(void)
{
    uint8_t current_led = 0;
    uint8_t random = 0;
    uint8_t hold_count = 0;

    for (;;)
    {
        init();

        while(g_running)
        {
            PORTB = LED_ADDRESS[current_led];

            uint8_t next_led = 0;
            do
            {
                random = 5 * random + 13;
                next_led = random % 7;
            }
            while (current_led == next_led);

            current_led = next_led;

            start_pwm();

            int16_t pwm_intensity = 0;

            for (int i = 0; i < 64; ++i)
            {
                pwm_intensity += 4;
                set_pwm(pwm_intensity);
                delay_ms(5);
            }

            sleep();

            for (int i = 0; i < 64; ++i)
            {
                pwm_intensity -= 4;
                set_pwm(pwm_intensity);
                delay_ms(5);
            }

            stop_pwm();

            sleep();

            if (!(PINB & (1<<PB4)))
            {
                if (17 <= ++hold_count)
                {
                    run_ee();
                    PORTB = 0;
                }
            }
            else
            {
                hold_count = 0;
            }
        }

        shutdown();
    }
}

