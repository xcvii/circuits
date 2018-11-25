EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:orn18-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY13A-SSU U1
U 1 1 5BF16C9C
P 4350 4200
F 0 "U1" H 3550 4600 50  0000 C CNN
F 1 "ATTINY13A-SSU" H 5000 3800 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 4950 4200 50  0001 C CIN
F 3 "" H 3550 4550 50  0001 C CNN
	1    4350 4200
	-1   0    0    -1  
$EndComp
$Comp
L 74LS138 U2
U 1 1 5BF16CF5
P 6450 3800
F 0 "U2" H 6550 4300 50  0000 C CNN
F 1 "74LS138" H 6600 3251 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6450 3800 50  0001 C CNN
F 3 "" H 6450 3800 50  0001 C CNN
	1    6450 3800
	1    0    0    -1  
$EndComp
NoConn ~ 7050 3450
Wire Wire Line
	5350 3950 5850 3950
Wire Wire Line
	5350 4050 5450 4050
Wire Wire Line
	5450 4050 5450 3450
Wire Wire Line
	5450 3450 5850 3450
Wire Wire Line
	5350 4150 5550 4150
Wire Wire Line
	5550 4150 5550 3550
Wire Wire Line
	5550 3550 5850 3550
Wire Wire Line
	5350 4250 5650 4250
Wire Wire Line
	5650 4250 5650 3650
Wire Wire Line
	5650 3650 5850 3650
Wire Wire Line
	5850 4050 5850 4250
$Comp
L GND #PWR01
U 1 1 5BF17374
P 5850 4250
F 0 "#PWR01" H 5850 4000 50  0001 C CNN
F 1 "GND" H 5850 4100 50  0000 C CNN
F 2 "" H 5850 4250 50  0001 C CNN
F 3 "" H 5850 4250 50  0001 C CNN
	1    5850 4250
	1    0    0    -1  
$EndComp
Connection ~ 5850 4150
$Comp
L GND #PWR02
U 1 1 5BF17455
P 3150 4650
F 0 "#PWR02" H 3150 4400 50  0001 C CNN
F 1 "GND" H 3150 4500 50  0000 C CNN
F 2 "" H 3150 4650 50  0001 C CNN
F 3 "" H 3150 4650 50  0001 C CNN
	1    3150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4650 3150 4450
Wire Wire Line
	3150 4450 3350 4450
Wire Wire Line
	3350 3950 3150 3950
Wire Wire Line
	6450 3350 6450 3150
Wire Wire Line
	6450 3150 6150 3150
Text Label 6150 3150 0    60   ~ 0
VCC
Wire Wire Line
	6450 4250 6450 4550
$Comp
L GND #PWR03
U 1 1 5BF174EB
P 6450 4550
F 0 "#PWR03" H 6450 4300 50  0001 C CNN
F 1 "GND" H 6450 4400 50  0000 C CNN
F 2 "" H 6450 4550 50  0001 C CNN
F 3 "" H 6450 4550 50  0001 C CNN
	1    6450 4550
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 5BF1750D
P 7650 3850
F 0 "D4" H 7650 3950 50  0000 C CNN
F 1 "LED" H 7650 3750 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 3850 50  0001 C CNN
F 3 "" H 7650 3850 50  0001 C CNN
	1    7650 3850
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 5BF17560
P 7650 3450
F 0 "D3" H 7650 3550 50  0000 C CNN
F 1 "LED" H 7650 3350 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 3450 50  0001 C CNN
F 3 "" H 7650 3450 50  0001 C CNN
	1    7650 3450
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 5BF175AF
P 7650 3050
F 0 "D2" H 7650 3150 50  0000 C CNN
F 1 "LED" H 7650 2950 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 3050 50  0001 C CNN
F 3 "" H 7650 3050 50  0001 C CNN
	1    7650 3050
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 5BF175DE
P 7650 2650
F 0 "D1" H 7650 2750 50  0000 C CNN
F 1 "LED" H 7650 2550 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 2650 50  0001 C CNN
F 3 "" H 7650 2650 50  0001 C CNN
	1    7650 2650
	1    0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 5BF17629
P 7650 4250
F 0 "D5" H 7650 4350 50  0000 C CNN
F 1 "LED" H 7650 4150 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 4250 50  0001 C CNN
F 3 "" H 7650 4250 50  0001 C CNN
	1    7650 4250
	1    0    0    -1  
$EndComp
$Comp
L LED D6
U 1 1 5BF17663
P 7650 4650
F 0 "D6" H 7650 4750 50  0000 C CNN
F 1 "LED" H 7650 4550 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 4650 50  0001 C CNN
F 3 "" H 7650 4650 50  0001 C CNN
	1    7650 4650
	1    0    0    -1  
$EndComp
$Comp
L LED D7
U 1 1 5BF1769F
P 7650 5050
F 0 "D7" H 7650 5150 50  0000 C CNN
F 1 "LED" H 7650 4950 50  0000 C CNN
F 2 "LEDs:LED_0805_HandSoldering" H 7650 5050 50  0001 C CNN
F 3 "" H 7650 5050 50  0001 C CNN
	1    7650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3850 7500 3850
Wire Wire Line
	7050 3550 7150 3550
Wire Wire Line
	7150 3550 7150 2650
Wire Wire Line
	7150 2650 7500 2650
Wire Wire Line
	7050 3650 7250 3650
Wire Wire Line
	7250 3650 7250 3050
Wire Wire Line
	7250 3050 7500 3050
Wire Wire Line
	7050 3750 7350 3750
Wire Wire Line
	7350 3750 7350 3450
Wire Wire Line
	7350 3450 7500 3450
Wire Wire Line
	7050 4150 7150 4150
Wire Wire Line
	7150 4150 7150 5050
Wire Wire Line
	7150 5050 7500 5050
Wire Wire Line
	7050 4050 7250 4050
Wire Wire Line
	7250 4050 7250 4650
Wire Wire Line
	7250 4650 7500 4650
Wire Wire Line
	7050 3950 7350 3950
Wire Wire Line
	7350 3950 7350 4250
Wire Wire Line
	7350 4250 7500 4250
$Comp
L R R1
U 1 1 5BF177DF
P 8200 3850
F 0 "R1" V 8280 3850 50  0000 C CNN
F 1 "330" V 8200 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8130 3850 50  0001 C CNN
F 3 "" H 8200 3850 50  0001 C CNN
	1    8200 3850
	0    1    1    0   
$EndComp
NoConn ~ 5350 4450
Wire Wire Line
	8050 3850 7800 3850
Wire Wire Line
	8050 2650 8050 5050
Wire Wire Line
	8050 3450 7800 3450
Wire Wire Line
	8050 3050 7800 3050
Connection ~ 8050 3450
Wire Wire Line
	8050 2650 7800 2650
Connection ~ 8050 3050
Connection ~ 8050 3850
Wire Wire Line
	8050 4250 7800 4250
Wire Wire Line
	8050 4650 7800 4650
Connection ~ 8050 4250
Wire Wire Line
	8050 5050 7800 5050
Connection ~ 8050 4650
Wire Wire Line
	8350 3850 8650 3850
Text Label 8450 3850 0    60   ~ 0
VCC
Text Label 3150 3950 0    60   ~ 0
VCC
$Comp
L Battery_Cell BT1
U 1 1 5BF91350
P 3850 3150
F 0 "BT1" H 3950 3250 50  0000 L CNN
F 1 "Battery_Cell" H 3950 3150 50  0000 L CNN
F 2 "orn18:Keystone_3035" V 3850 3210 50  0001 C CNN
F 3 "" V 3850 3210 50  0001 C CNN
	1    3850 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5BF91448
P 3850 3400
F 0 "#PWR04" H 3850 3150 50  0001 C CNN
F 1 "GND" H 3850 3250 50  0000 C CNN
F 2 "" H 3850 3400 50  0001 C CNN
F 3 "" H 3850 3400 50  0001 C CNN
	1    3850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3400 3850 3250
Wire Wire Line
	3850 2950 3850 2850
Wire Wire Line
	3850 2850 4150 2850
Text Label 4000 2850 0    60   ~ 0
VCC
$Comp
L SW_Push SW1
U 1 1 5BF9158F
P 5850 5350
F 0 "SW1" H 5900 5450 50  0000 L CNN
F 1 "SW_Push" H 5850 5290 50  0000 C CNN
F 2 "orn18:Tactile_Switch_6mm_x_6mm" H 5850 5550 50  0001 C CNN
F 3 "" H 5850 5550 50  0001 C CNN
	1    5850 5350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5BF9164E
P 5650 5050
F 0 "R2" V 5730 5050 50  0000 C CNN
F 1 "10K" V 5650 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5580 5050 50  0001 C CNN
F 3 "" H 5650 5050 50  0001 C CNN
	1    5650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4900 5650 4800
Wire Wire Line
	5650 4800 6000 4800
Text Label 5850 4800 0    60   ~ 0
VCC
Wire Wire Line
	5650 5200 5650 5350
Wire Wire Line
	5650 5350 5500 5350
Wire Wire Line
	5500 5350 5500 4350
Wire Wire Line
	5500 4350 5350 4350
Connection ~ 5650 5350
Wire Wire Line
	6050 5350 6200 5350
$Comp
L GND #PWR05
U 1 1 5BF918A6
P 6200 5450
F 0 "#PWR05" H 6200 5200 50  0001 C CNN
F 1 "GND" H 6200 5300 50  0000 C CNN
F 2 "" H 6200 5450 50  0001 C CNN
F 3 "" H 6200 5450 50  0001 C CNN
	1    6200 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5350 6200 5450
$EndSCHEMATC