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
LIBS:raspberry_shielded-cache
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
F 2 "Modded Shield:Arduino_Uno_Shield" H 10650 8000 60  0001 C CNN
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
L GND #PWR02
U 1 1 5A81CDF9
P 6750 1750
F 0 "#PWR02" H 6750 1500 50  0001 C CNN
F 1 "GND" H 6750 1600 50  0000 C CNN
F 2 "" H 6750 1750 50  0001 C CNN
F 3 "" H 6750 1750 50  0001 C CNN
	1    6750 1750
	1    0    0    -1  
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
P 1850 1200
F 0 "J1" H 1850 1410 50  0000 C CNN
F 1 "Jack-DC" H 1850 1025 50  0000 C CNN
F 2 "Connectors:BARREL_JACK" H 1900 1160 50  0001 C CNN
F 3 "" H 1900 1160 50  0001 C CNN
	1    1850 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5A81CF9C
P 2300 1350
F 0 "#PWR03" H 2300 1100 50  0001 C CNN
F 1 "GND" H 2300 1200 50  0000 C CNN
F 2 "" H 2300 1350 50  0001 C CNN
F 3 "" H 2300 1350 50  0001 C CNN
	1    2300 1350
	1    0    0    -1  
$EndComp
NoConn ~ 2150 1200
$Comp
L PWR_FLAG #FLG04
U 1 1 5A81D14D
P 7150 1750
F 0 "#FLG04" H 7150 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 7150 1900 50  0000 C CNN
F 2 "" H 7150 1750 50  0001 C CNN
F 3 "" H 7150 1750 50  0001 C CNN
	1    7150 1750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 5A81D1AD
P 7150 1750
F 0 "#PWR05" H 7150 1600 50  0001 C CNN
F 1 "+5V" H 7150 1890 50  0000 C CNN
F 2 "" H 7150 1750 50  0001 C CNN
F 3 "" H 7150 1750 50  0001 C CNN
	1    7150 1750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR06
U 1 1 5A81E6A0
P 7350 4750
F 0 "#PWR06" H 7350 4500 50  0001 C CNN
F 1 "GND" H 7350 4600 50  0000 C CNN
F 2 "" H 7350 4750 50  0001 C CNN
F 3 "" H 7350 4750 50  0001 C CNN
	1    7350 4750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5A81E78E
P 7400 5150
F 0 "#PWR07" H 7400 5000 50  0001 C CNN
F 1 "+5V" H 7400 5290 50  0000 C CNN
F 2 "" H 7400 5150 50  0001 C CNN
F 3 "" H 7400 5150 50  0001 C CNN
	1    7400 5150
	1    0    0    -1  
$EndComp
NoConn ~ 3050 1200
NoConn ~ 3050 1300
NoConn ~ 2650 1600
$Comp
L GND #PWR08
U 1 1 5A81E64E
P 2750 1600
F 0 "#PWR08" H 2750 1350 50  0001 C CNN
F 1 "GND" H 2750 1450 50  0000 C CNN
F 2 "" H 2750 1600 50  0001 C CNN
F 3 "" H 2750 1600 50  0001 C CNN
	1    2750 1600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 5A81E67D
P 7550 1750
F 0 "#FLG09" H 7550 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 7550 1900 50  0000 C CNN
F 2 "" H 7550 1750 50  0001 C CNN
F 3 "" H 7550 1750 50  0001 C CNN
	1    7550 1750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR010
U 1 1 5A81E690
P 7550 1750
F 0 "#PWR010" H 7550 1600 50  0001 C CNN
F 1 "+3V3" H 7550 1890 50  0000 C CNN
F 2 "" H 7550 1750 50  0001 C CNN
F 3 "" H 7550 1750 50  0001 C CNN
	1    7550 1750
	-1   0    0    1   
$EndComp
$Comp
L SW_SPST SW1
U 1 1 5A81E6B6
P 6000 5550
F 0 "SW1" H 6000 5675 50  0000 C CNN
F 1 "SW_SPST" H 6000 5450 50  0000 C CNN
F 2 "switch:SPST-2-PIN_6mm_thru" H 6000 5550 50  0001 C CNN
F 3 "" H 6000 5550 50  0001 C CNN
	1    6000 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5A81E777
P 6200 5550
F 0 "#PWR011" H 6200 5300 50  0001 C CNN
F 1 "GND" H 6200 5400 50  0000 C CNN
F 2 "" H 6200 5550 50  0001 C CNN
F 3 "" H 6200 5550 50  0001 C CNN
	1    6200 5550
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Male J3
U 1 1 5A81E87A
P 4250 5700
F 0 "J3" H 4250 5900 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4250 5500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4250 5700 50  0001 C CNN
F 3 "" H 4250 5700 50  0001 C CNN
	1    4250 5700
	0    -1   -1   0   
$EndComp
Text Label 4150 5450 1    60   ~ 0
+3V3
Text Label 4250 5450 1    60   ~ 0
+5V
Text Label 4350 5450 1    60   ~ 0
GND
Text Label 5200 5450 1    60   ~ 0
GPIO3
Text Label 5400 5450 1    60   ~ 0
TXD0_14
Text Label 5500 5450 1    60   ~ 0
RXD0_15
$Comp
L GND #PWR012
U 1 1 5A81EC30
P 4350 5250
F 0 "#PWR012" H 4350 5000 50  0001 C CNN
F 1 "GND" H 4350 5100 50  0000 C CNN
F 2 "" H 4350 5250 50  0001 C CNN
F 3 "" H 4350 5250 50  0001 C CNN
	1    4350 5250
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR013
U 1 1 5A81EC3C
P 4250 5300
F 0 "#PWR013" H 4250 5150 50  0001 C CNN
F 1 "+5V" H 4250 5440 50  0000 C CNN
F 2 "" H 4250 5300 50  0001 C CNN
F 3 "" H 4250 5300 50  0001 C CNN
	1    4250 5300
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR014
U 1 1 5A81EC42
P 4150 5250
F 0 "#PWR014" H 4150 5100 50  0001 C CNN
F 1 "+3V3" H 4150 5390 50  0000 C CNN
F 2 "" H 4150 5250 50  0001 C CNN
F 3 "" H 4150 5250 50  0001 C CNN
	1    4150 5250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 5A81EE51
P 2300 1100
F 0 "#PWR015" H 2300 950 50  0001 C CNN
F 1 "+5V" H 2300 1240 50  0000 C CNN
F 2 "" H 2300 1100 50  0001 C CNN
F 3 "" H 2300 1100 50  0001 C CNN
	1    2300 1100
	1    0    0    -1  
$EndComp
$Comp
L USB_A J2
U 1 1 5A81E5F4
P 2750 1200
F 0 "J2" H 2550 1650 50  0000 L CNN
F 1 "USB_A" H 2550 1550 50  0000 L CNN
F 2 "Connectors:USB_A" H 2900 1150 50  0001 C CNN
F 3 "" H 2900 1150 50  0001 C CNN
	1    2750 1200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 5A81EF00
P 3050 1000
F 0 "#PWR016" H 3050 850 50  0001 C CNN
F 1 "+5V" H 3050 1140 50  0000 C CNN
F 2 "" H 3050 1000 50  0001 C CNN
F 3 "" H 3050 1000 50  0001 C CNN
	1    3050 1000
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04_Male J4
U 1 1 5A81F0AD
P 5300 5700
F 0 "J4" H 5300 5900 50  0000 C CNN
F 1 "Conn_01x04_Male" H 5300 5400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 5300 5700 50  0001 C CNN
F 3 "" H 5300 5700 50  0001 C CNN
	1    5300 5700
	0    -1   -1   0   
$EndComp
Text Label 5300 5450 1    60   ~ 0
GPIO18
$Comp
L 2N7000 Q3
U 1 1 5A81F261
P 5600 3700
F 0 "Q3" H 5800 3775 50  0000 L CNN
F 1 "2N7000" H 5800 3700 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 5800 3625 50  0001 L CIN
F 3 "" H 5600 3700 50  0001 L CNN
	1    5600 3700
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 5A81F305
P 5700 4050
F 0 "R6" V 5780 4050 50  0000 C CNN
F 1 "10k" V 5700 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 4050 50  0001 C CNN
F 3 "" H 5700 4050 50  0001 C CNN
	1    5700 4050
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 5A81F3AC
P 5700 3400
F 0 "R5" V 5780 3400 50  0000 C CNN
F 1 "10k" V 5700 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 3400 50  0001 C CNN
F 3 "" H 5700 3400 50  0001 C CNN
	1    5700 3400
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR017
U 1 1 5A81F4FB
P 5950 3600
F 0 "#PWR017" H 5950 3450 50  0001 C CNN
F 1 "+3V3" H 5950 3740 50  0000 C CNN
F 2 "" H 5950 3600 50  0001 C CNN
F 3 "" H 5950 3600 50  0001 C CNN
	1    5950 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 5A81F521
P 5950 3250
F 0 "#PWR018" H 5950 3100 50  0001 C CNN
F 1 "+5V" H 5950 3390 50  0000 C CNN
F 2 "" H 5950 3250 50  0001 C CNN
F 3 "" H 5950 3250 50  0001 C CNN
	1    5950 3250
	1    0    0    -1  
$EndComp
$Comp
L 2N7000 Q2
U 1 1 5A81F67D
P 4350 3700
F 0 "Q2" H 4550 3775 50  0000 L CNN
F 1 "2N7000" H 4550 3700 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 4550 3625 50  0001 L CIN
F 3 "" H 4350 3700 50  0001 L CNN
	1    4350 3700
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 5A81F683
P 4450 4050
F 0 "R4" V 4530 4050 50  0000 C CNN
F 1 "10k" V 4450 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4380 4050 50  0001 C CNN
F 3 "" H 4450 4050 50  0001 C CNN
	1    4450 4050
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5A81F689
P 4450 3400
F 0 "R3" V 4530 3400 50  0000 C CNN
F 1 "10k" V 4450 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4380 3400 50  0001 C CNN
F 3 "" H 4450 3400 50  0001 C CNN
	1    4450 3400
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR019
U 1 1 5A81F69A
P 4700 3600
F 0 "#PWR019" H 4700 3450 50  0001 C CNN
F 1 "+3V3" H 4700 3740 50  0000 C CNN
F 2 "" H 4700 3600 50  0001 C CNN
F 3 "" H 4700 3600 50  0001 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR020
U 1 1 5A81F6A0
P 4700 3250
F 0 "#PWR020" H 4700 3100 50  0001 C CNN
F 1 "+5V" H 4700 3390 50  0000 C CNN
F 2 "" H 4700 3250 50  0001 C CNN
F 3 "" H 4700 3250 50  0001 C CNN
	1    4700 3250
	1    0    0    -1  
$EndComp
$Comp
L 2N7000 Q1
U 1 1 5A81F72D
P 3150 3700
F 0 "Q1" H 3350 3775 50  0000 L CNN
F 1 "2N7000" H 3350 3700 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Narrow_Oval" H 3350 3625 50  0001 L CIN
F 3 "" H 3150 3700 50  0001 L CNN
	1    3150 3700
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 5A81F733
P 3250 4050
F 0 "R2" V 3330 4050 50  0000 C CNN
F 1 "10k" V 3250 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3180 4050 50  0001 C CNN
F 3 "" H 3250 4050 50  0001 C CNN
	1    3250 4050
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5A81F739
P 3250 3400
F 0 "R1" V 3330 3400 50  0000 C CNN
F 1 "10k" V 3250 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3180 3400 50  0001 C CNN
F 3 "" H 3250 3400 50  0001 C CNN
	1    3250 3400
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR021
U 1 1 5A81F74A
P 3500 3600
F 0 "#PWR021" H 3500 3450 50  0001 C CNN
F 1 "+3V3" H 3500 3740 50  0000 C CNN
F 2 "" H 3500 3600 50  0001 C CNN
F 3 "" H 3500 3600 50  0001 C CNN
	1    3500 3600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR022
U 1 1 5A81F750
P 3500 3250
F 0 "#PWR022" H 3500 3100 50  0001 C CNN
F 1 "+5V" H 3500 3390 50  0000 C CNN
F 2 "" H 3500 3250 50  0001 C CNN
F 3 "" H 3500 3250 50  0001 C CNN
	1    3500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1100 2300 1100
Wire Wire Line
	2150 1300 2300 1300
Wire Wire Line
	2300 1300 2300 1350
Wire Wire Line
	6200 3200 7550 3200
Wire Wire Line
	6100 3300 7550 3300
Wire Wire Line
	10150 3900 10700 3900
Wire Wire Line
	10700 3900 10700 2750
Wire Wire Line
	10700 2750 3050 2750
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
	7400 5150 7400 5300
Wire Wire Line
	7350 4750 7500 4750
Connection ~ 7500 4800
Wire Wire Line
	5400 4550 5400 5500
Wire Wire Line
	5300 4650 5300 5500
Wire Wire Line
	5200 5100 5200 5500
Wire Wire Line
	4350 5500 4350 5250
Wire Wire Line
	4250 5500 4250 5300
Wire Wire Line
	4150 5500 4150 5250
Wire Wire Line
	5200 5100 4950 5100
Wire Wire Line
	4950 5100 4950 5850
Wire Wire Line
	4950 5850 5800 5850
Wire Wire Line
	5800 5850 5800 5550
Wire Wire Line
	5500 3900 5500 5500
Wire Wire Line
	5500 4050 5550 4050
Wire Wire Line
	5550 3400 5500 3400
Wire Wire Line
	5500 2950 5500 3500
Wire Wire Line
	5850 3400 5950 3400
Wire Wire Line
	5950 3400 5950 3250
Wire Wire Line
	5950 4050 5850 4050
Wire Wire Line
	5950 3600 5950 4050
Wire Wire Line
	5800 3700 5950 3700
Connection ~ 5950 3700
Wire Wire Line
	4250 3900 4250 4550
Wire Wire Line
	4250 4050 4300 4050
Wire Wire Line
	4300 3400 4250 3400
Wire Wire Line
	4250 2850 4250 3500
Wire Wire Line
	4600 3400 4700 3400
Wire Wire Line
	4700 3400 4700 3250
Wire Wire Line
	4700 4050 4600 4050
Wire Wire Line
	4700 3600 4700 4050
Wire Wire Line
	4550 3700 4700 3700
Connection ~ 4700 3700
Wire Wire Line
	3050 3900 3050 4650
Wire Wire Line
	3050 4050 3100 4050
Wire Wire Line
	3100 3400 3050 3400
Wire Wire Line
	3050 2750 3050 3500
Wire Wire Line
	3400 3400 3500 3400
Wire Wire Line
	3500 3400 3500 3250
Wire Wire Line
	3500 4050 3400 4050
Wire Wire Line
	3500 3600 3500 4050
Wire Wire Line
	3350 3700 3500 3700
Connection ~ 3500 3700
Wire Wire Line
	6100 3300 6100 2950
Wire Wire Line
	6100 2950 5500 2950
Connection ~ 5500 3400
Wire Wire Line
	6200 3200 6200 2850
Wire Wire Line
	6200 2850 4250 2850
Connection ~ 4250 3400
Connection ~ 3050 3400
Connection ~ 5500 4050
Wire Wire Line
	4250 4550 5400 4550
Connection ~ 4250 4050
Wire Wire Line
	3050 4650 5300 4650
Connection ~ 3050 4050
Wire Wire Line
	7400 5300 7550 5300
Connection ~ 7400 5200
Wire Wire Line
	7200 5100 7550 5100
$Comp
L +3V3 #PWR?
U 1 1 5A82097A
P 7200 5100
F 0 "#PWR?" H 7200 4950 50  0001 C CNN
F 1 "+3V3" H 7200 5240 50  0000 C CNN
F 2 "" H 7200 5100 50  0001 C CNN
F 3 "" H 7200 5100 50  0001 C CNN
	1    7200 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
