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
LIBS:1N4001
LIBS:SparkFun_SchematicComponents
LIBS:modular_sensors-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L RJ45 J4
U 1 1 5A7DB213
P 4450 3700
F 0 "J4" H 4650 4200 50  0000 C CNN
F 1 "RJ45_BREAKOUT" H 4300 4200 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 4450 3700 50  0001 C CNN
F 3 "" H 4450 3700 50  0001 C CNN
	1    4450 3700
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x05_Male J5
U 1 1 5A7DB21A
P 4600 2350
F 0 "J5" H 4600 2650 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4600 2050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 4600 2350 50  0001 C CNN
F 3 "" H 4600 2350 50  0001 C CNN
	1    4600 2350
	0    1    1    0   
$EndComp
Text Label 4700 3200 1    60   ~ 0
VCC
Text Label 4800 3200 1    60   ~ 0
GND
NoConn ~ 3900 4050
Text Label 4500 3200 1    60   ~ 0
SEN1
Text Label 4300 3200 1    60   ~ 0
SEN2
Text Label 4100 3200 1    60   ~ 0
SEN3
Wire Wire Line
	4700 3250 4700 3050
Wire Wire Line
	4700 3050 4900 3050
Wire Wire Line
	4900 3050 4900 2550
Wire Wire Line
	4900 2550 4800 2550
Wire Wire Line
	4800 2600 4800 3250
Wire Wire Line
	4800 2600 4700 2600
Wire Wire Line
	4700 2600 4700 2550
Wire Wire Line
	4600 3250 4600 2950
Wire Wire Line
	4600 2950 4800 2950
Connection ~ 4800 2950
Wire Wire Line
	4400 3250 4400 2850
Wire Wire Line
	4400 2850 4800 2850
Connection ~ 4800 2850
Wire Wire Line
	4200 3250 4200 2700
Wire Wire Line
	4200 2700 4800 2700
Connection ~ 4800 2700
Wire Wire Line
	4500 3250 4500 2800
Wire Wire Line
	4500 2800 4600 2800
Wire Wire Line
	4600 2800 4600 2550
Wire Wire Line
	4300 3250 4300 2750
Wire Wire Line
	4300 2750 4500 2750
Wire Wire Line
	4500 2750 4500 2550
Wire Wire Line
	4100 3250 4100 2650
Wire Wire Line
	4100 2650 4400 2650
Wire Wire Line
	4400 2650 4400 2550
$EndSCHEMATC
