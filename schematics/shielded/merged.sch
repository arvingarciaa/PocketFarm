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
LIBS:arduino
LIBS:shielded-cache
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
L Arduino_Uno_Shield XA1
U 1 1 5A81CD65
P 8850 4250
F 0 "XA1" V 8950 4250 60  0000 C CNN
F 1 "Arduino_Uno_Shield" V 8750 4250 60  0000 C CNN
F 2 "Arduino:Arduino_Uno_Shield" H 10650 8000 60  0001 C CNN
F 3 "" H 10650 8000 60  0001 C CNN
	1    8850 4250
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG01
U 1 1 5A81CDBA
P 6750 1750
F 0 "#FLG01" H 6750 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 6750 1900 50  0000 C CNN
F 2 "" H 6750 1750 50  0001 C CNN
F 3 "" H 6750 1750 50  0001 C CNN
	1    6750 1750
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 5A81CDDC
P 7150 1750
F 0 "#FLG02" H 7150 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 7150 1900 50  0000 C CNN
F 2 "" H 7150 1750 50  0001 C CNN
F 3 "" H 7150 1750 50  0001 C CNN
	1    7150 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A81CDF9
P 6750 1750
F 0 "#PWR03" H 6750 1500 50  0001 C CNN
F 1 "GND" H 6750 1600 50  0000 C CNN
F 2 "" H 6750 1750 50  0001 C CNN
F 3 "" H 6750 1750 50  0001 C CNN
	1    6750 1750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 5A81CE18
P 7150 1750
F 0 "#PWR04" H 7150 1600 50  0001 C CNN
F 1 "VCC" H 7150 1900 50  0000 C CNN
F 2 "" H 7150 1750 50  0001 C CNN
F 3 "" H 7150 1750 50  0001 C CNN
	1    7150 1750
	-1   0    0    1   
$EndComp
NoConn ~ 7550 3500
NoConn ~ 7550 3600
NoConn ~ 7550 3900
NoConn ~ 7550 4000
NoConn ~ 7550 4100
NoConn ~ 7550 4200
NoConn ~ 7550 4300
NoConn ~ 7550 4400
NoConn ~ 7550 4500
NoConn ~ 7550 5100
NoConn ~ 10150 3200
NoConn ~ 10150 3300
NoConn ~ 10150 3400
NoConn ~ 10150 3500
NoConn ~ 10150 3600
NoConn ~ 10150 3700
NoConn ~ 10150 3800
NoConn ~ 10150 4000
NoConn ~ 10150 4100
NoConn ~ 10150 4200
NoConn ~ 10150 4300
NoConn ~ 10150 4500
NoConn ~ 10150 4600
NoConn ~ 10150 4700
NoConn ~ 10150 4800
NoConn ~ 10150 4900
NoConn ~ 10150 5000
NoConn ~ 10150 5200
NoConn ~ 10150 5300
$Comp
L Jack-DC J1
U 1 1 5A81CF9A
P 2900 4950
F 0 "J1" H 2900 5160 50  0000 C CNN
F 1 "Jack-DC" H 2900 4775 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 2950 4910 50  0001 C CNN
F 3 "" H 2950 4910 50  0001 C CNN
	1    2900 4950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 5A81CF9B
P 3350 4850
F 0 "#PWR05" H 3350 4700 50  0001 C CNN
F 1 "VCC" H 3350 5000 50  0000 C CNN
F 2 "" H 3350 4850 50  0001 C CNN
F 3 "" H 3350 4850 50  0001 C CNN
	1    3350 4850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5A81CF9C
P 3350 5100
F 0 "#PWR06" H 3350 4850 50  0001 C CNN
F 1 "GND" H 3350 4950 50  0000 C CNN
F 2 "" H 3350 5100 50  0001 C CNN
F 3 "" H 3350 5100 50  0001 C CNN
	1    3350 5100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR07
U 1 1 5A81CF9E
P 6350 2800
F 0 "#PWR07" H 6350 2650 50  0001 C CNN
F 1 "VCC" H 6350 2950 50  0000 C CNN
F 2 "" H 6350 2800 50  0001 C CNN
F 3 "" H 6350 2800 50  0001 C CNN
	1    6350 2800
	1    0    0    -1  
$EndComp
$Comp
L TIP120 Q1
U 1 1 5A81CF9F
P 6250 3650
F 0 "Q1" H 6500 3725 50  0000 L CNN
F 1 "TIP120" H 6500 3650 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Horizontal" H 6500 3575 50  0001 L CIN
F 3 "" H 6250 3650 50  0001 L CNN
	1    6250 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5A81CFA0
P 6350 3950
F 0 "#PWR08" H 6350 3700 50  0001 C CNN
F 1 "GND" H 6350 3800 50  0000 C CNN
F 2 "" H 6350 3950 50  0001 C CNN
F 3 "" H 6350 3950 50  0001 C CNN
	1    6350 3950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A81CFA1
P 5700 3650
F 0 "R1" V 5780 3650 50  0000 C CNN
F 1 "1k" V 5700 3650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5630 3650 50  0001 C CNN
F 3 "" H 5700 3650 50  0001 C CNN
	1    5700 3650
	0    1    1    0   
$EndComp
NoConn ~ 3200 4950
$Comp
L D D1
U 1 1 5A81CFA3
P 6550 3200
F 0 "D1" H 6550 3300 50  0000 C CNN
F 1 "1N4001" H 6550 3100 50  0000 C CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 6550 3200 50  0001 C CNN
F 3 "" H 6550 3200 50  0001 C CNN
	1    6550 3200
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 5A81D14D
P 7550 1750
F 0 "#FLG09" H 7550 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 7550 1900 50  0000 C CNN
F 2 "" H 7550 1750 50  0001 C CNN
F 3 "" H 7550 1750 50  0001 C CNN
	1    7550 1750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 5A81D1AD
P 7550 1750
F 0 "#PWR010" H 7550 1600 50  0001 C CNN
F 1 "+5V" H 7550 1890 50  0000 C CNN
F 2 "" H 7550 1750 50  0001 C CNN
F 3 "" H 7550 1750 50  0001 C CNN
	1    7550 1750
	-1   0    0    1   
$EndComp
Text Label 5000 3550 0    60   ~ 0
GND
Text Label 5000 3450 0    60   ~ 0
+5V
$Comp
L +5V #PWR011
U 1 1 5A81D341
P 5250 3300
F 0 "#PWR011" H 5250 3150 50  0001 C CNN
F 1 "+5V" H 5250 3440 50  0000 C CNN
F 2 "" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0001 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04_Male J4
U 1 1 5A81D3E7
P 4750 4900
F 0 "J4" H 4750 5100 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4750 4600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4750 4900 50  0001 C CNN
F 3 "" H 4750 4900 50  0001 C CNN
	1    4750 4900
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x02 J5
U 1 1 5A81CF9D
P 6000 3150
F 0 "J5" H 6000 3250 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 6000 2950 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_bornier-2_P5.08mm" H 6000 3150 50  0001 C CNN
F 3 "" H 6000 3150 50  0001 C CNN
	1    6000 3150
	-1   0    0    -1  
$EndComp
Text Label 5000 4800 0    60   ~ 0
D9
Text Label 5000 4900 0    60   ~ 0
D10
Text Label 5000 5000 0    60   ~ 0
D1_RX1
Text Label 5000 5100 0    60   ~ 0
D0_TX1
Text Label 5000 3650 0    60   ~ 0
VCC
$Comp
L Conn_01x04_Male J3
U 1 1 5A81D9F1
P 4750 3550
F 0 "J3" H 4750 3750 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4750 3250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4750 3550 50  0001 C CNN
F 3 "" H 4750 3550 50  0001 C CNN
	1    4750 3550
	1    0    0    -1  
$EndComp
Text Label 5000 3750 0    60   ~ 0
A0
$Comp
L RJ45 J2
U 1 1 5A81DE3E
P 3000 3050
F 0 "J2" H 3200 3550 50  0000 C CNN
F 1 "RJ45_BUILTIN" H 2850 3550 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 3000 3050 50  0001 C CNN
F 3 "" H 3000 3050 50  0001 C CNN
	1    3000 3050
	-1   0    0    1   
$EndComp
Text Label 3250 2550 1    60   ~ 0
+5V
Text Label 3350 2550 1    60   ~ 0
GND
NoConn ~ 2450 3400
Text Label 3050 2550 1    60   ~ 0
A0_SEN1
$Comp
L +5V #PWR012
U 1 1 5A81E1AC
P 3800 1700
F 0 "#PWR012" H 3800 1550 50  0001 C CNN
F 1 "+5V" H 3800 1840 50  0000 C CNN
F 2 "" H 3800 1700 50  0001 C CNN
F 3 "" H 3800 1700 50  0001 C CNN
	1    3800 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5A81E1DB
P 3800 2050
F 0 "#PWR013" H 3800 1800 50  0001 C CNN
F 1 "GND" H 3800 1900 50  0000 C CNN
F 2 "" H 3800 2050 50  0001 C CNN
F 3 "" H 3800 2050 50  0001 C CNN
	1    3800 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5A81E6A0
P 7350 4750
F 0 "#PWR014" H 7350 4500 50  0001 C CNN
F 1 "GND" H 7350 4600 50  0000 C CNN
F 2 "" H 7350 4750 50  0001 C CNN
F 3 "" H 7350 4750 50  0001 C CNN
	1    7350 4750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR015
U 1 1 5A81E720
P 7250 5150
F 0 "#PWR015" H 7250 5000 50  0001 C CNN
F 1 "VCC" H 7250 5300 50  0000 C CNN
F 2 "" H 7250 5150 50  0001 C CNN
F 3 "" H 7250 5150 50  0001 C CNN
	1    7250 5150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 5A81E78E
P 7400 5150
F 0 "#PWR016" H 7400 5000 50  0001 C CNN
F 1 "+5V" H 7400 5290 50  0000 C CNN
F 2 "" H 7400 5150 50  0001 C CNN
F 3 "" H 7400 5150 50  0001 C CNN
	1    7400 5150
	1    0    0    -1  
$EndComp
$Comp
L RJ45 J6
U 1 1 5A81ECD3
P 1300 3000
F 0 "J6" H 1500 3500 50  0000 C CNN
F 1 "RJ45_SENSOR" H 1150 3500 50  0000 C CNN
F 2 "Connectors:RJ45_8" H 1300 3000 50  0001 C CNN
F 3 "" H 1300 3000 50  0001 C CNN
	1    1300 3000
	-1   0    0    1   
$EndComp
Text Label 1550 2500 1    60   ~ 0
+5V
Text Label 1650 2500 1    60   ~ 0
GND
NoConn ~ 750  3350
Text Label 1350 2500 1    60   ~ 0
A0_SEN1
$Comp
L GND #PWR017
U 1 1 5A81ECEA
P 2100 2000
F 0 "#PWR017" H 2100 1750 50  0001 C CNN
F 1 "GND" H 2100 1850 50  0000 C CNN
F 2 "" H 2100 2000 50  0001 C CNN
F 3 "" H 2100 2000 50  0001 C CNN
	1    2100 2000
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Male J7
U 1 1 5A81EE01
P 1450 1400
F 0 "J7" H 1450 1600 50  0000 C CNN
F 1 "Conn_01x03_Male" H 1450 1200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 1450 1400 50  0001 C CNN
F 3 "" H 1450 1400 50  0001 C CNN
	1    1450 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 4850 3350 4850
Wire Wire Line
	3200 5050 3350 5050
Connection ~ 6350 2800
Wire Wire Line
	6350 3850 6350 3950
Wire Wire Line
	5850 3650 6050 3650
Wire Wire Line
	4950 3550 5050 3550
Wire Wire Line
	5050 3550 5050 3950
Wire Wire Line
	5050 3950 6350 3950
Wire Wire Line
	3350 5050 3350 5100
Wire Wire Line
	6350 3400 6550 3400
Wire Wire Line
	6550 3400 6550 3350
Connection ~ 6350 3400
Wire Wire Line
	6350 3050 6550 3050
Connection ~ 6350 3050
Wire Wire Line
	6350 3150 6200 3150
Connection ~ 6350 3150
Wire Wire Line
	6200 3250 6350 3250
Connection ~ 6350 3250
Wire Wire Line
	6350 2800 6350 3150
Wire Wire Line
	6350 3250 6350 3450
Wire Wire Line
	4950 4800 6900 4800
Wire Wire Line
	4950 4900 5550 4900
Wire Wire Line
	4950 5000 7150 5000
Wire Wire Line
	4950 5100 7100 5100
Wire Wire Line
	5550 4900 5550 3650
Wire Wire Line
	5400 3650 5400 2900
Wire Wire Line
	5400 2900 6350 2900
Connection ~ 6350 2900
Wire Wire Line
	7550 3200 7100 3200
Wire Wire Line
	7100 3200 7100 5100
Wire Wire Line
	7550 3300 7150 3300
Wire Wire Line
	7150 3300 7150 5000
Wire Wire Line
	10150 3900 10700 3900
Wire Wire Line
	10700 3900 10700 2750
Wire Wire Line
	10700 2750 6900 2750
Wire Wire Line
	6900 2750 6900 4800
Wire Wire Line
	4950 3650 5400 3650
Wire Wire Line
	5250 3450 5250 3300
Connection ~ 5250 3450
Wire Wire Line
	4950 3450 5250 3450
Wire Wire Line
	4950 3750 5350 3750
Wire Wire Line
	3050 1850 3050 2600
Wire Wire Line
	3250 2600 3250 1950
Wire Wire Line
	3250 1950 3800 1950
Wire Wire Line
	3350 2050 3350 2600
Wire Wire Line
	2650 2050 3800 2050
Wire Wire Line
	3050 1850 5350 1850
Wire Wire Line
	5350 1850 5350 3750
Wire Wire Line
	3800 1950 3800 1700
Wire Wire Line
	2650 2600 2650 2050
Connection ~ 3350 2050
Wire Wire Line
	3150 2600 3150 2050
Connection ~ 3150 2050
Wire Wire Line
	2950 2600 2950 2050
Connection ~ 2950 2050
Wire Wire Line
	2850 2600 2850 2050
Connection ~ 2850 2050
Wire Wire Line
	2750 2600 2750 2050
Connection ~ 2750 2050
Wire Wire Line
	7500 4800 7550 4800
Wire Wire Line
	7500 4900 7550 4900
Wire Wire Line
	7500 4750 7500 5000
Wire Wire Line
	7500 5000 7550 5000
Connection ~ 7500 4900
Wire Wire Line
	7550 5200 7400 5200
Wire Wire Line
	7400 5200 7400 5150
Wire Wire Line
	7550 5300 7250 5300
Wire Wire Line
	7250 5300 7250 5150
Wire Wire Line
	7350 4750 7500 4750
Connection ~ 7500 4800
Wire Wire Line
	1350 1800 1350 2550
Wire Wire Line
	1550 2550 1550 1900
Wire Wire Line
	1550 1900 1450 1900
Wire Wire Line
	1650 2000 1650 2550
Wire Wire Line
	950  2000 2100 2000
Wire Wire Line
	950  2550 950  2000
Connection ~ 1650 2000
Wire Wire Line
	1450 2550 1450 2000
Connection ~ 1450 2000
Wire Wire Line
	1250 2550 1250 2000
Connection ~ 1250 2000
Wire Wire Line
	1150 2550 1150 2000
Connection ~ 1150 2000
Wire Wire Line
	1050 2550 1050 2000
Connection ~ 1050 2000
Wire Wire Line
	1350 1800 1550 1800
Wire Wire Line
	1550 1800 1550 1600
Wire Wire Line
	1450 1900 1450 1600
Connection ~ 1550 1900
Wire Wire Line
	1350 1600 1350 1700
Wire Wire Line
	1350 1700 1750 1700
Wire Wire Line
	1750 1700 1750 2000
Connection ~ 1750 2000
$EndSCHEMATC
