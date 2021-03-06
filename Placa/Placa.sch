EESchema Schematic File Version 4
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
LIBS:Capacimetro-cache
EELAYER 29 0
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
L Display_Character:CA56-12CGKWA U3
U 1 1 5CAA115E
P 8700 1600
F 0 "U3" H 8700 2267 50  0000 C CNN
F 1 "CA56-12CGKWA" H 8700 2176 50  0000 C CNN
F 2 "Display_7Segment:CA56-12CGKWA" H 8700 1000 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/CA56-12CGKWA(Ver.9A).pdf" H 8270 1630 50  0001 C CNN
	1    8700 1600
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L78L05_TO92 U1
U 1 1 5CAA279C
P 2450 1300
F 0 "U1" H 2450 1542 50  0000 C CNN
F 1 "L78L05_TO92" H 2450 1451 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2450 1525 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 2450 1250 50  0001 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5CACE89D
P 1050 1300
F 0 "J1" H 1158 1481 50  0000 C CNN
F 1 "ALIMENT" H 1158 1390 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 1300 50  0001 C CNN
F 3 "~" H 1050 1300 50  0001 C CNN
	1    1050 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5CAD16C2
P 1950 1450
F 0 "C2" H 2068 1496 50  0000 L CNN
F 1 "10uF" H 2068 1405 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H5.0mm_P2.00mm" H 1988 1300 50  0001 C CNN
F 3 "~" H 1950 1450 50  0001 C CNN
	1    1950 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CAD2A99
P 2950 1450
F 0 "C3" H 3065 1496 50  0000 L CNN
F 1 "100nF" H 3065 1405 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2988 1300 50  0001 C CNN
F 3 "~" H 2950 1450 50  0001 C CNN
	1    2950 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1300 1950 1300
Connection ~ 1950 1300
Wire Wire Line
	2750 1300 2950 1300
$Comp
L power:+5V #PWR0102
U 1 1 5CAD486A
P 2950 1100
F 0 "#PWR0102" H 2950 950 50  0001 C CNN
F 1 "+5V" H 2965 1273 50  0000 C CNN
F 2 "" H 2950 1100 50  0001 C CNN
F 3 "" H 2950 1100 50  0001 C CNN
	1    2950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1300 2950 1100
Connection ~ 2950 1300
$Comp
L power:+5V #PWR0104
U 1 1 5CAD7498
P 2450 3000
F 0 "#PWR0104" H 2450 2850 50  0001 C CNN
F 1 "+5V" H 2465 3173 50  0000 C CNN
F 2 "" H 2450 3000 50  0001 C CNN
F 3 "" H 2450 3000 50  0001 C CNN
	1    2450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3200 2450 3000
Wire Wire Line
	2550 3200 2550 3000
Wire Wire Line
	2550 3000 2450 3000
Connection ~ 2450 3000
$Comp
L Device:R R5
U 1 1 5CAD8B34
P 3800 5000
F 0 "R5" V 3593 5000 50  0000 C CNN
F 1 "10K" V 3684 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3730 5000 50  0001 C CNN
F 3 "~" H 3800 5000 50  0001 C CNN
	1    3800 5000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5CAD906B
P 4050 5000
F 0 "#PWR0106" H 4050 4850 50  0001 C CNN
F 1 "+5V" H 4065 5173 50  0000 C CNN
F 2 "" H 4050 5000 50  0001 C CNN
F 3 "" H 4050 5000 50  0001 C CNN
	1    4050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5000 4050 5000
$Comp
L Device:Crystal Y1
U 1 1 5CADA0F9
P 3650 4400
F 0 "Y1" V 3604 4531 50  0000 L CNN
F 1 "16MHz" V 3695 4531 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 3650 4400 50  0001 C CNN
F 3 "~" H 3650 4400 50  0001 C CNN
	1    3650 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5CADB1B6
P 4200 4250
F 0 "C5" V 3948 4250 50  0000 C CNN
F 1 "22pF" V 4039 4250 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4238 4100 50  0001 C CNN
F 3 "~" H 4200 4250 50  0001 C CNN
	1    4200 4250
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5CADC336
P 4200 4550
F 0 "C6" V 3948 4550 50  0000 C CNN
F 1 "22pF" V 4039 4550 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4238 4400 50  0001 C CNN
F 3 "~" H 4200 4550 50  0001 C CNN
	1    4200 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 4550 4050 4550
Wire Wire Line
	3650 4250 4050 4250
Wire Wire Line
	4350 4250 4350 4550
Connection ~ 4350 4550
$Comp
L Device:C C1
U 1 1 5CAE01B2
P 1550 3650
F 0 "C1" H 1665 3696 50  0000 L CNN
F 1 "100nF" H 1665 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 1588 3500 50  0001 C CNN
F 3 "~" H 1550 3650 50  0001 C CNN
	1    1550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3500 1850 3500
$Comp
L Device:R R1
U 1 1 5CAE1E7B
P 3450 6300
F 0 "R1" H 3520 6346 50  0000 L CNN
F 1 "47K 1%" H 3520 6255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3380 6300 50  0001 C CNN
F 3 "~" H 3450 6300 50  0001 C CNN
	1    3450 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CAE2BF1
P 3450 6700
F 0 "R2" H 3520 6746 50  0000 L CNN
F 1 "47K 1%" H 3520 6655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3380 6700 50  0001 C CNN
F 3 "~" H 3450 6700 50  0001 C CNN
	1    3450 6700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5CAE3D2A
P 3450 6100
F 0 "#PWR01" H 3450 5950 50  0001 C CNN
F 1 "+5V" H 3465 6273 50  0000 C CNN
F 2 "" H 3450 6100 50  0001 C CNN
F 3 "" H 3450 6100 50  0001 C CNN
	1    3450 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5CAE48F9
P 3450 6900
F 0 "#PWR02" H 3450 6650 50  0001 C CNN
F 1 "GND" H 3455 6727 50  0000 C CNN
F 2 "" H 3450 6900 50  0001 C CNN
F 3 "" H 3450 6900 50  0001 C CNN
	1    3450 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6150 3450 6100
$Comp
L Device:R R4
U 1 1 5CAE59EE
P 3750 5800
F 0 "R4" V 3543 5800 50  0000 C CNN
F 1 "120R" V 3634 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3680 5800 50  0001 C CNN
F 3 "~" H 3750 5800 50  0001 C CNN
	1    3750 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5CAE622B
P 4150 5800
F 0 "R6" V 3943 5800 50  0000 C CNN
F 1 "330K 1%" V 4034 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4080 5800 50  0001 C CNN
F 3 "~" H 4150 5800 50  0001 C CNN
	1    4150 5800
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5CAE7CE2
P 4400 5700
F 0 "#PWR06" H 4400 5550 50  0001 C CNN
F 1 "+5V" H 4415 5873 50  0000 C CNN
F 2 "" H 4400 5700 50  0001 C CNN
F 3 "" H 4400 5700 50  0001 C CNN
	1    4400 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5800 3600 5800
Wire Wire Line
	4300 5800 4400 5800
Wire Wire Line
	4400 5800 4400 5700
Wire Wire Line
	3450 6450 3450 6500
Wire Wire Line
	3050 5900 3050 6500
Wire Wire Line
	3050 6500 3450 6500
Connection ~ 3450 6500
Wire Wire Line
	3450 6500 3450 6550
Wire Wire Line
	3050 5000 3600 5000
Text GLabel 3150 4900 2    50   Input ~ 0
A
Text GLabel 3150 4800 2    50   Input ~ 0
B
Text GLabel 3150 4700 2    50   Input ~ 0
C
Text GLabel 3150 4600 2    50   Input ~ 0
D
Text GLabel 3150 4500 2    50   Input ~ 0
E
Text GLabel 3150 4400 2    50   Input ~ 0
F
Wire Wire Line
	3150 4400 3050 4400
Wire Wire Line
	3050 4500 3150 4500
Wire Wire Line
	3050 4600 3150 4600
Wire Wire Line
	3050 4700 3150 4700
Wire Wire Line
	3050 4800 3150 4800
Wire Wire Line
	3050 4900 3150 4900
Text GLabel 3150 3700 2    50   Input ~ 0
G
Text GLabel 3100 3600 2    50   Input ~ 0
DP
Wire Wire Line
	3150 3700 3050 3700
Wire Wire Line
	3050 3600 3100 3600
$Comp
L Device:R R11
U 1 1 5CB0900E
P 7350 1300
F 0 "R11" V 7143 1300 50  0000 C CNN
F 1 "1K" V 7234 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7280 1300 50  0001 C CNN
F 3 "~" H 7350 1300 50  0001 C CNN
	1    7350 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5CB09ABD
P 7050 1400
F 0 "R7" V 6843 1400 50  0000 C CNN
F 1 "1K" V 6934 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 1400 50  0001 C CNN
F 3 "~" H 7050 1400 50  0001 C CNN
	1    7050 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5CB09F6C
P 7350 1500
F 0 "R12" V 7143 1500 50  0000 C CNN
F 1 "1K" V 7234 1500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7280 1500 50  0001 C CNN
F 3 "~" H 7350 1500 50  0001 C CNN
	1    7350 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5CB0A54A
P 7050 1600
F 0 "R8" V 6843 1600 50  0000 C CNN
F 1 "1K" V 6934 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 1600 50  0001 C CNN
F 3 "~" H 7050 1600 50  0001 C CNN
	1    7050 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5CB0A9C0
P 7350 1700
F 0 "R13" V 7143 1700 50  0000 C CNN
F 1 "1K" V 7234 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7280 1700 50  0001 C CNN
F 3 "~" H 7350 1700 50  0001 C CNN
	1    7350 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5CB0ACA1
P 7050 1800
F 0 "R9" V 6843 1800 50  0000 C CNN
F 1 "1K" V 6934 1800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 1800 50  0001 C CNN
F 3 "~" H 7050 1800 50  0001 C CNN
	1    7050 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5CB0B19D
P 7350 1900
F 0 "R14" V 7143 1900 50  0000 C CNN
F 1 "1K" V 7234 1900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7280 1900 50  0001 C CNN
F 3 "~" H 7350 1900 50  0001 C CNN
	1    7350 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5CB0B725
P 7050 2000
F 0 "R10" V 6843 2000 50  0000 C CNN
F 1 "1K" V 6934 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 2000 50  0001 C CNN
F 3 "~" H 7050 2000 50  0001 C CNN
	1    7050 2000
	0    1    1    0   
$EndComp
Text GLabel 6750 1300 0    50   Input ~ 0
A
Text GLabel 6750 1400 0    50   Input ~ 0
B
Text GLabel 6750 1500 0    50   Input ~ 0
C
Text GLabel 6750 1600 0    50   Input ~ 0
D
Text GLabel 6750 1700 0    50   Input ~ 0
E
Text GLabel 6750 1800 0    50   Input ~ 0
F
Text GLabel 6750 1900 0    50   Input ~ 0
G
Text GLabel 6800 2000 0    50   Input ~ 0
DP
Wire Wire Line
	7500 1300 7600 1300
Wire Wire Line
	7200 1300 6750 1300
Wire Wire Line
	6750 1400 6900 1400
Wire Wire Line
	7200 1400 7600 1400
Wire Wire Line
	6750 1500 7200 1500
Wire Wire Line
	7500 1500 7600 1500
Wire Wire Line
	6750 1600 6900 1600
Wire Wire Line
	7200 1600 7600 1600
Wire Wire Line
	6750 1700 7200 1700
Wire Wire Line
	7500 1700 7600 1700
Wire Wire Line
	6750 1800 6900 1800
Wire Wire Line
	7200 1800 7600 1800
Wire Wire Line
	6750 1900 7200 1900
Wire Wire Line
	7500 1900 7600 1900
Wire Wire Line
	7600 2000 7200 2000
Wire Wire Line
	6900 2000 6800 2000
Text GLabel 9900 1700 2    50   Input ~ 0
DIG1
Text GLabel 9900 1800 2    50   Input ~ 0
DIG2
Text GLabel 9900 1900 2    50   Input ~ 0
DIG3
Text GLabel 9900 2000 2    50   Input ~ 0
DIG4
Wire Wire Line
	9800 1700 9900 1700
Wire Wire Line
	9800 1800 9900 1800
Wire Wire Line
	9800 1900 9900 1900
Wire Wire Line
	9800 2000 9900 2000
Text GLabel 3200 5400 2    50   Input ~ 0
DIG3
Text GLabel 3200 5500 2    50   Input ~ 0
DIG4
Wire Wire Line
	3050 5400 3200 5400
Wire Wire Line
	3050 5500 3200 5500
Text GLabel 3200 5600 2    50   Input ~ 0
DIG1
Text GLabel 3200 5700 2    50   Input ~ 0
DIG2
Wire Wire Line
	3050 5600 3200 5600
Wire Wire Line
	3050 5700 3200 5700
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5CB2EAD4
P 5250 5100
F 0 "J2" H 5330 5092 50  0000 L CNN
F 1 "PROG" H 5330 5001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 5250 5100 50  0001 C CNN
F 3 "~" H 5250 5100 50  0001 C CNN
	1    5250 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5200 5050 5200
Wire Wire Line
	3050 5300 5050 5300
Wire Wire Line
	5050 5100 4050 5100
Wire Wire Line
	4050 5100 4050 5000
Connection ~ 4050 5000
$Comp
L Device:C C7
U 1 1 5CB3C470
P 4800 5400
F 0 "C7" V 4548 5400 50  0000 C CNN
F 1 "100nF" V 4639 5400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 4838 5250 50  0001 C CNN
F 3 "~" H 4800 5400 50  0001 C CNN
	1    4800 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 5400 4950 5400
Wire Wire Line
	4650 5400 3600 5400
Wire Wire Line
	3600 5400 3600 5000
Connection ~ 3600 5000
Wire Wire Line
	3600 5000 3650 5000
$Comp
L Switch:SW_Push SW1
U 1 1 5CB442B3
P 4850 3600
F 0 "SW1" H 4850 3885 50  0000 C CNN
F 1 "SW_Push" H 4850 3794 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H5mm" H 4850 3800 50  0001 C CNN
F 3 "~" H 4850 3800 50  0001 C CNN
	1    4850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4550 3350 4550
Wire Wire Line
	3350 4550 3350 4200
Wire Wire Line
	3350 4200 3050 4200
Connection ~ 3650 4550
Wire Wire Line
	3050 4100 3650 4100
Wire Wire Line
	3650 4100 3650 4250
Connection ~ 3650 4250
Wire Wire Line
	4350 4550 5050 4550
Wire Wire Line
	5050 4550 5050 4900
$Comp
L Switch:SW_Push SW2
U 1 1 5CB585C6
P 4850 4000
F 0 "SW2" H 4850 4285 50  0000 C CNN
F 1 "SW_Push" H 4850 4194 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H5mm" H 4850 4200 50  0001 C CNN
F 3 "~" H 4850 4200 50  0001 C CNN
	1    4850 4000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5CB58B61
P 4850 4400
F 0 "SW3" H 4850 4685 50  0000 C CNN
F 1 "SW_Push" H 4850 4594 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H5mm" H 4850 4600 50  0001 C CNN
F 3 "~" H 4850 4600 50  0001 C CNN
	1    4850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3600 5050 4000
Wire Wire Line
	5050 4000 5050 4400
Connection ~ 5050 4000
Wire Wire Line
	5050 4400 5050 4550
Connection ~ 5050 4400
Connection ~ 5050 4550
Wire Wire Line
	3050 4000 4500 4000
Wire Wire Line
	4500 4000 4500 4400
Wire Wire Line
	4500 4400 4650 4400
Wire Wire Line
	3050 3900 4550 3900
Wire Wire Line
	4550 3900 4550 4000
Wire Wire Line
	4550 4000 4650 4000
Wire Wire Line
	3050 3800 4550 3800
Wire Wire Line
	4550 3800 4550 3600
Wire Wire Line
	4550 3600 4650 3600
$Comp
L Device:R R3
U 1 1 5CB67DD5
P 3500 2850
F 0 "R3" V 3293 2850 50  0000 C CNN
F 1 "1K" V 3384 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3430 2850 50  0001 C CNN
F 3 "~" H 3500 2850 50  0001 C CNN
	1    3500 2850
	0    1    1    0   
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 5CB6DB9D
P 4100 2450
F 0 "BZ1" H 4252 2479 50  0000 L CNN
F 1 "Buzzer" H 4252 2388 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 4075 2550 50  0001 C CNN
F 3 "~" V 4075 2550 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5CB6EF81
P 4000 2200
F 0 "#PWR04" H 4000 2050 50  0001 C CNN
F 1 "+5V" H 4015 2373 50  0000 C CNN
F 2 "" H 4000 2200 50  0001 C CNN
F 3 "" H 4000 2200 50  0001 C CNN
	1    4000 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2850 3700 2850
Wire Wire Line
	4000 2550 4000 2650
Wire Wire Line
	3050 3500 3200 3500
Wire Wire Line
	3200 3500 3200 2850
Wire Wire Line
	3200 2850 3350 2850
Wire Wire Line
	4000 2350 4000 2200
NoConn ~ 5050 5000
Wire Wire Line
	2150 1300 1950 1300
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5CBB3547
P 1950 1150
F 0 "#FLG0101" H 1950 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1950 1323 50  0000 C CNN
F 2 "" H 1950 1150 50  0001 C CNN
F 3 "~" H 1950 1150 50  0001 C CNN
	1    1950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1150 1950 1300
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U2
U 1 1 5CAA3148
P 2450 4700
F 0 "U2" H 1806 4746 50  0000 R CNN
F 1 "ATmega328P-PU" H 1806 4655 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2450 4700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2450 4700 50  0001 C CNN
	1    2450 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5CBBB611
P 2450 6300
F 0 "#PWR0105" H 2450 6050 50  0001 C CNN
F 1 "GND" H 2455 6127 50  0000 C CNN
F 2 "" H 2450 6300 50  0001 C CNN
F 3 "" H 2450 6300 50  0001 C CNN
	1    2450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6200 2450 6300
$Comp
L power:GND #PWR0101
U 1 1 5CBC9FB8
P 2950 1800
F 0 "#PWR0101" H 2950 1550 50  0001 C CNN
F 1 "GND" H 2955 1627 50  0000 C CNN
F 2 "" H 2950 1800 50  0001 C CNN
F 3 "" H 2950 1800 50  0001 C CNN
	1    2950 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5CBCE2F2
P 4850 4900
F 0 "#PWR0107" H 4850 4650 50  0001 C CNN
F 1 "GND" H 4855 4727 50  0000 C CNN
F 2 "" H 4850 4900 50  0001 C CNN
F 3 "" H 4850 4900 50  0001 C CNN
	1    4850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4900 5050 4900
Connection ~ 5050 4900
$Comp
L power:GND #PWR0109
U 1 1 5CBDB1B5
P 3950 6300
F 0 "#PWR0109" H 3950 6050 50  0001 C CNN
F 1 "GND" H 3955 6127 50  0000 C CNN
F 2 "" H 3950 6300 50  0001 C CNN
F 3 "" H 3950 6300 50  0001 C CNN
	1    3950 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5CBDF1A0
P 4000 3150
F 0 "#PWR0110" H 4000 2900 50  0001 C CNN
F 1 "GND" H 4005 2977 50  0000 C CNN
F 2 "" H 4000 3150 50  0001 C CNN
F 3 "" H 4000 3150 50  0001 C CNN
	1    4000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3050 4000 3150
$Comp
L power:GND #PWR0108
U 1 1 5CBE35F3
P 1550 3900
F 0 "#PWR0108" H 1550 3650 50  0001 C CNN
F 1 "GND" H 1555 3727 50  0000 C CNN
F 2 "" H 1550 3900 50  0001 C CNN
F 3 "" H 1550 3900 50  0001 C CNN
	1    1550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3900 1550 3800
Wire Wire Line
	2950 1600 2950 1800
Wire Wire Line
	1950 1600 2450 1600
Wire Wire Line
	2450 1600 2950 1600
Connection ~ 2450 1600
Connection ~ 2950 1600
$Comp
L power:GND #PWR0103
U 1 1 5CAEB561
P 1550 1550
F 0 "#PWR0103" H 1550 1300 50  0001 C CNN
F 1 "GND" H 1555 1377 50  0000 C CNN
F 2 "" H 1550 1550 50  0001 C CNN
F 3 "" H 1550 1550 50  0001 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1550 1550 1400
Wire Wire Line
	1550 1400 1250 1400
Connection ~ 1250 1400
Wire Wire Line
	3450 6900 3450 6850
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5CAFF13D
P 1250 1500
F 0 "#FLG0102" H 1250 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 1250 1673 50  0000 C CNN
F 2 "" H 1250 1500 50  0001 C CNN
F 3 "~" H 1250 1500 50  0001 C CNN
	1    1250 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 1400 1250 1500
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5CB123D1
P 4300 6100
F 0 "J3" H 4272 5982 50  0000 R CNN
F 1 "Capacitor" H 4272 6073 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4300 6100 50  0001 C CNN
F 3 "~" H 4300 6100 50  0001 C CNN
	1    4300 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 5800 3950 5800
Wire Wire Line
	4100 6000 3950 6000
Wire Wire Line
	3950 6000 3950 5800
Connection ~ 3950 5800
Wire Wire Line
	3950 5800 4000 5800
Wire Wire Line
	3950 6300 3950 6100
Wire Wire Line
	3950 6100 4100 6100
$Comp
L Device:Q_NPN_CBE Q1
U 1 1 5CB305A2
P 3900 2850
F 0 "Q1" H 4090 2896 50  0000 L CNN
F 1 "2N2222" H 4090 2805 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 4100 2950 50  0001 C CNN
F 3 "~" H 3900 2850 50  0001 C CNN
	1    3900 2850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
