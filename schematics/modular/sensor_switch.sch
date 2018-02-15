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
Sheet 5 5
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
L RJ45 J13
U 1 1 5A7DB59A
P 5700 3400
F 0 "J13" H 5900 3900 50  0000 C CNN
F 1 "RJ45_ARDUINO" H 5550 3900 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 5700 3400 50  0001 C CNN
F 3 "" H 5700 3400 50  0001 C CNN
	1    5700 3400
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J14
U 1 1 5A7DB5A1
P 6700 4550
F 0 "J14" H 6900 5050 50  0000 C CNN
F 1 "RJ45_RIGHT" H 6550 5050 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 6700 4550 50  0001 C CNN
F 3 "" H 6700 4550 50  0001 C CNN
	1    6700 4550
	0    1    1    0   
$EndComp
$Comp
L RJ45 J12
U 1 1 5A7DB5A8
P 4650 4550
F 0 "J12" H 4850 5050 50  0000 C CNN
F 1 "RJ45_LEFT" H 4500 5050 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 4650 4550 50  0001 C CNN
F 3 "" H 4650 4550 50  0001 C CNN
	1    4650 4550
	0    -1   1    0   
$EndComp
NoConn ~ 4300 5100
NoConn ~ 7050 5100
NoConn ~ 6250 3050
$Comp
L VCC #PWR09
U 1 1 5A7E4601
P 5200 3950
F 0 "#PWR09" H 5200 3800 50  0001 C CNN
F 1 "VCC" H 5200 4100 50  0000 C CNN
F 2 "" H 5200 3950 50  0001 C CNN
F 3 "" H 5200 3950 50  0001 C CNN
	1    5200 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5A7E4624
P 6150 3900
F 0 "#PWR010" H 6150 3650 50  0001 C CNN
F 1 "GND" H 6150 3750 50  0000 C CNN
F 2 "" H 6150 3900 50  0001 C CNN
F 3 "" H 6150 3900 50  0001 C CNN
	1    6150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4200 6250 4200
Wire Wire Line
	5100 4300 6250 4300
Wire Wire Line
	5100 4400 6250 4400
Wire Wire Line
	5100 4500 6250 4500
Wire Wire Line
	5100 4600 6250 4600
Wire Wire Line
	5100 4700 6250 4700
Wire Wire Line
	5100 4800 6250 4800
Wire Wire Line
	5100 4900 6250 4900
Connection ~ 5950 4800
Wire Wire Line
	5850 3850 5850 4700
Connection ~ 5850 4700
Wire Wire Line
	5750 3850 5750 4600
Connection ~ 5750 4600
Wire Wire Line
	5650 3850 5650 4500
Connection ~ 5650 4500
Wire Wire Line
	5550 3850 5550 4400
Connection ~ 5550 4400
Wire Wire Line
	5450 3850 5450 4300
Connection ~ 5450 4300
Wire Wire Line
	5350 3850 5350 4200
Connection ~ 5350 4200
Wire Wire Line
	5200 3950 5450 3950
Connection ~ 5450 3950
Wire Wire Line
	6150 3900 5950 3900
Connection ~ 5950 3900
Wire Wire Line
	5950 3850 5950 4800
Connection ~ 5950 4200
Connection ~ 5950 4400
Connection ~ 5950 4600
Wire Wire Line
	6050 3850 6050 4900
Connection ~ 6050 4900
$EndSCHEMATC
