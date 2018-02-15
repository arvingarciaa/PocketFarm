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
Sheet 4 5
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
L Conn_01x03_Male J7
U 1 1 5A7DB43F
P 5800 4150
F 0 "J7" H 5800 4350 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5800 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5800 4150 50  0001 C CNN
F 3 "" H 5800 4150 50  0001 C CNN
	1    5800 4150
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x03_Male J10
U 1 1 5A7DB446
P 6750 4150
F 0 "J10" H 6750 4350 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6750 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6750 4150 50  0001 C CNN
F 3 "" H 6750 4150 50  0001 C CNN
	1    6750 4150
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x03_Male J8
U 1 1 5A7DB44D
P 5800 4850
F 0 "J8" H 5800 5050 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5800 4650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5800 4850 50  0001 C CNN
F 3 "" H 5800 4850 50  0001 C CNN
	1    5800 4850
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x03_Male J11
U 1 1 5A7DB454
P 6750 4850
F 0 "J11" H 6750 5050 50  0000 C CNN
F 1 "Conn_01x03_Male" H 6750 4650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 6750 4850 50  0001 C CNN
F 3 "" H 6750 4850 50  0001 C CNN
	1    6750 4850
	0    -1   1    0   
$EndComp
$Comp
L RJ45 J9
U 1 1 5A7DB45B
P 6300 2450
F 0 "J9" H 6500 2950 50  0000 C CNN
F 1 "RJ45_CLOSER" H 6150 2950 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 6300 2450 50  0001 C CNN
F 3 "" H 6300 2450 50  0001 C CNN
	1    6300 2450
	1    0    0    -1  
$EndComp
Text Label 6850 5100 1    60   ~ 0
A
Text Label 6750 5100 1    60   ~ 0
+
Text Label 6650 5100 1    60   ~ 0
-
$Comp
L RJ45 J6
U 1 1 5A7DB465
P 5200 2450
F 0 "J6" H 5400 2950 50  0000 C CNN
F 1 "RJ45_AWAY" H 5050 2950 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 5200 2450 50  0001 C CNN
F 3 "" H 5200 2450 50  0001 C CNN
	1    5200 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4350 5800 4600
Wire Wire Line
	5800 5050 5800 5300
Wire Wire Line
	6750 4350 6750 4650
Wire Wire Line
	6850 5250 6850 5050
Wire Wire Line
	5900 5250 6850 5250
Wire Wire Line
	5900 5250 5900 5050
Wire Wire Line
	5950 5250 5950 4500
Wire Wire Line
	5950 4500 5900 4500
Wire Wire Line
	5900 4500 5900 4350
Connection ~ 5950 5250
Wire Wire Line
	6000 5250 6000 4500
Wire Wire Line
	6000 4500 6850 4500
Wire Wire Line
	6850 4500 6850 4350
Connection ~ 6000 5250
Wire Wire Line
	6750 5050 6750 5400
Wire Wire Line
	6650 5050 6650 5500
Wire Wire Line
	6650 4350 6650 4650
Wire Wire Line
	5700 4350 5700 4450
Wire Wire Line
	5700 5050 5700 5300
NoConn ~ 6850 2100
NoConn ~ 5750 2100
Text Label 4950 2900 3    60   ~ 0
VCC
Text Label 6050 2900 3    60   ~ 0
VCC
Text Label 4850 2900 3    60   ~ 0
GND
Text Label 5950 2900 3    60   ~ 0
GND
Text Label 6150 2900 3    60   ~ 0
GND
Text Label 6350 2900 3    60   ~ 0
GND
Text Label 6550 2900 3    60   ~ 0
GND
Text Label 5050 2900 3    60   ~ 0
GND
Text Label 5250 2900 3    60   ~ 0
GND
Text Label 5450 2900 3    60   ~ 0
GND
Text Label 5150 2900 3    60   ~ 0
SEN1_A
Text Label 6250 2900 3    60   ~ 0
SEN1_C
Text Label 5350 2900 3    60   ~ 0
SEN2_A
Text Label 6450 2900 3    60   ~ 0
SEN2_C
Text Label 5550 2900 3    60   ~ 0
SEN3_A
Text Label 6650 2900 3    60   ~ 0
SEN3_C
Wire Wire Line
	4850 2900 4850 5500
Wire Wire Line
	4850 5500 6650 5500
Connection ~ 6650 5150
Wire Wire Line
	4950 2900 4950 5400
Wire Wire Line
	4950 5400 6750 5400
Connection ~ 6750 5200
Wire Wire Line
	5150 2900 5150 4450
Wire Wire Line
	5150 4450 5700 4450
Wire Wire Line
	5350 2900 5350 5300
Wire Wire Line
	5550 2900 5550 4650
Wire Wire Line
	5550 4650 6650 4650
Wire Wire Line
	5950 2900 5950 3500
Wire Wire Line
	6650 2900 6650 3000
Wire Wire Line
	6650 3000 6950 3000
Wire Wire Line
	6950 3000 6950 4650
Wire Wire Line
	6450 2900 6450 3100
Wire Wire Line
	6450 3100 7150 3100
Wire Wire Line
	7150 3100 7150 5300
Wire Wire Line
	7150 5300 5800 5300
Wire Wire Line
	5350 5300 5700 5300
Wire Wire Line
	6950 4650 6750 4650
Wire Wire Line
	6250 2900 6250 4600
Wire Wire Line
	6250 4600 5800 4600
Wire Wire Line
	4850 3500 6550 3500
Connection ~ 4850 3500
Wire Wire Line
	6050 2900 6050 3400
Wire Wire Line
	6050 3400 4950 3400
Connection ~ 4950 3400
Wire Wire Line
	6150 3500 6150 2900
Connection ~ 5950 3500
Wire Wire Line
	6350 3500 6350 2900
Connection ~ 6150 3500
Wire Wire Line
	6550 3500 6550 2950
Connection ~ 6350 3500
Wire Wire Line
	5050 2900 5050 3500
Connection ~ 5050 3500
Wire Wire Line
	5250 2900 5250 3500
Connection ~ 5250 3500
Wire Wire Line
	5450 2900 5450 3500
Connection ~ 5450 3500
$EndSCHEMATC
