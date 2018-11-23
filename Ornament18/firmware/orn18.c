#include <avr/io.h>
#include <util/delay.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/wdt.h>


uint8_t LED_ADDRESS[] = {
    (0<<PB3) | (0<<PB2) | (1<<PB1),
    (0<<PB3) | (1<<PB2) | (0<<PB1),
    (0<<PB3) | (1<<PB2) | (1<<PB1),
    (1<<PB3) | (0<<PB2) | (0<<PB1),
    (1<<PB3) | (0<<PB2) | (1<<PB1),
    (1<<PB3) | (1<<PB2) | (0<<PB1),
    (1<<PB3) | (1<<PB2) | (1<<PB1)
};



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


void sleep_helper(int schedule_wakeup)
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
    sleep_helper(1);
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


void init(void)
{
    power_adc_disable();
    ADCSRA &= ~(1<<ADEN); // disable ADC
    ACSR |= (1<<ACD); // disable analog comparator

    // no input/floating pins
    DDRB = (1<<PB4) | (1<<PB3) | (1<<PB2) | (1<<PB1) | (1<<PB0);
    PORTB = 0;

    sei();
}


void shutdown(void)
{
    sleep_helper(0);
}


void delay(void)
{
    // 1/256 prescaler for delay busy loop
    CLKPR =
        (1<<CLKPCE)
        | (1<<CLKPS3) | (0<<CLKPS2) | (0<<CLKPS1) | (0<<CLKPS0)
        ;

    _delay_us(500);

    // no prescaler
    CLKPR =
        (1<<CLKPCE)
        | (0<<CLKPS3) | (0<<CLKPS2) | (0<<CLKPS1) | (0<<CLKPS0)
        ;
}


int main(void)
{
    init();

    uint8_t current_led = 0;
    uint8_t random = 0;

    // for (uint16_t j = 0; j < 20000; ++j) // run for about 3 hours
    for (;;)
    {
        uint8_t next_led = 0;
        do
        {
            random = 5 * random + 13;
            next_led = random % 7;
        }
        while (current_led == next_led);

        current_led = next_led;
        PORTB = LED_ADDRESS[current_led];

        start_pwm();

        int16_t pwm_intensity = 0;

        for (int i = 0; i < 64; ++i)
        {
            pwm_intensity += 4;
            set_pwm(pwm_intensity);
            delay();
        }

        sleep();

        for (int i = 0; i < 64; ++i)
        {
            pwm_intensity -= 4;
            set_pwm(pwm_intensity);
            delay();
        }

        stop_pwm();

        sleep();
    }

    shutdown();
}

