EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1050 3000 2    50   ~ 0
~FLOPPY_RD
$Comp
L 74xx:74LS163 U2
U 1 1 61BEAA8E
P 4600 6550
F 0 "U2" H 4600 6550 50  0000 C CNN
F 1 "74ACT163" H 4800 7200 50  0000 C CNN
F 2 "" H 4600 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 4600 6550 50  0001 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC14 U1
U 1 1 61BEB32C
P 1650 5800
F 0 "U1" H 1650 6117 50  0000 C CNN
F 1 "74HC14" H 1650 6026 50  0000 C CNN
F 2 "" H 1650 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 1650 5800 50  0001 C CNN
	1    1650 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 61BF1A1D
P 1650 6800
F 0 "Y1" H 1650 7068 50  0000 C CNN
F 1 "Crystal" H 1650 6977 50  0000 C CNN
F 2 "" H 1650 6800 50  0001 C CNN
F 3 "~" H 1650 6800 50  0001 C CNN
	1    1650 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 61BF23CE
P 1300 7000
F 0 "C1" H 1415 7046 50  0000 L CNN
F 1 "20p" H 1415 6955 50  0000 L CNN
F 2 "" H 1338 6850 50  0001 C CNN
F 3 "~" H 1300 7000 50  0001 C CNN
	1    1300 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 61BF2BFD
P 2000 7000
F 0 "C2" H 2115 7046 50  0000 L CNN
F 1 "20p" H 2115 6955 50  0000 L CNN
F 2 "" H 2038 6850 50  0001 C CNN
F 3 "~" H 2000 7000 50  0001 C CNN
	1    2000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6850 2000 6800
Wire Wire Line
	2000 6800 1800 6800
Wire Wire Line
	1300 6800 1500 6800
Wire Wire Line
	1300 6800 1300 6850
$Comp
L power:GND #PWR01
U 1 1 61BFA999
P 1300 7150
F 0 "#PWR01" H 1300 6900 50  0001 C CNN
F 1 "GND" H 1305 6977 50  0000 C CNN
F 2 "" H 1300 7150 50  0001 C CNN
F 3 "" H 1300 7150 50  0001 C CNN
	1    1300 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61BFB061
P 2000 7150
F 0 "#PWR02" H 2000 6900 50  0001 C CNN
F 1 "GND" H 2005 6977 50  0000 C CNN
F 2 "" H 2000 7150 50  0001 C CNN
F 3 "" H 2000 7150 50  0001 C CNN
	1    2000 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61BFEDAC
P 2000 6550
F 0 "R2" H 2070 6596 50  0000 L CNN
F 1 "5k" H 2070 6505 50  0000 L CNN
F 2 "" V 1930 6550 50  0001 C CNN
F 3 "~" H 2000 6550 50  0001 C CNN
	1    2000 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61BFF6F4
P 1650 6300
F 0 "R1" V 1443 6300 50  0000 C CNN
F 1 "1M" V 1534 6300 50  0000 C CNN
F 2 "" V 1580 6300 50  0001 C CNN
F 3 "~" H 1650 6300 50  0001 C CNN
	1    1650 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 5800 1300 5800
Wire Wire Line
	1300 5800 1300 6300
Connection ~ 1300 6800
Wire Wire Line
	1300 6300 1500 6300
Connection ~ 1300 6300
Wire Wire Line
	1300 6300 1300 6800
Wire Wire Line
	1800 6300 2000 6300
Wire Wire Line
	2000 6300 2000 6400
Wire Wire Line
	2000 6700 2000 6800
Connection ~ 2000 6800
Wire Wire Line
	2000 5800 1950 5800
Wire Wire Line
	2000 5800 2000 6300
Connection ~ 2000 6300
$Comp
L 74xx:74HC14 U1
U 2 1 61C1BD67
P 2350 5800
F 0 "U1" H 2350 6117 50  0000 C CNN
F 1 "74HC14" H 2350 6026 50  0000 C CNN
F 2 "" H 2350 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 2350 5800 50  0001 C CNN
	2    2350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5800 2000 5800
Connection ~ 2000 5800
Wire Wire Line
	2650 5800 2900 5800
Text Label 2900 5800 2    50   ~ 0
4MHz
Text Label 3250 6850 0    50   ~ 0
4MHz
Wire Wire Line
	3250 6850 4100 6850
Wire Wire Line
	4100 7050 3950 7050
$Comp
L power:VCC #PWR016
U 1 1 61C2CCFD
P 3950 7050
F 0 "#PWR016" H 3950 6900 50  0001 C CNN
F 1 "VCC" H 4050 7100 50  0000 C CNN
F 2 "" H 3950 7050 50  0001 C CNN
F 3 "" H 3950 7050 50  0001 C CNN
	1    3950 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6750 3950 6750
Wire Wire Line
	3950 6750 3950 6650
Wire Wire Line
	3950 6650 4100 6650
Wire Wire Line
	3950 6750 3700 6750
$Comp
L power:VCC #PWR015
U 1 1 61C33E98
P 3700 6750
F 0 "#PWR015" H 3700 6600 50  0001 C CNN
F 1 "VCC" H 3800 6800 50  0000 C CNN
F 2 "" H 3700 6750 50  0001 C CNN
F 3 "" H 3700 6750 50  0001 C CNN
	1    3700 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6350 3700 6350
$Comp
L power:VCC #PWR014
U 1 1 61C378E8
P 3700 6350
F 0 "#PWR014" H 3700 6200 50  0001 C CNN
F 1 "VCC" H 3800 6400 50  0000 C CNN
F 2 "" H 3700 6350 50  0001 C CNN
F 3 "" H 3700 6350 50  0001 C CNN
	1    3700 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6250 4000 6250
Wire Wire Line
	4000 6250 4000 6150
Wire Wire Line
	4000 6150 4100 6150
Wire Wire Line
	4000 6150 4000 6050
Wire Wire Line
	4000 6050 4100 6050
Connection ~ 4000 6150
Wire Wire Line
	4000 6050 3700 6050
Connection ~ 4000 6050
$Comp
L power:GND #PWR013
U 1 1 61C42808
P 3700 6050
F 0 "#PWR013" H 3700 5800 50  0001 C CNN
F 1 "GND" H 3800 5950 50  0000 C CNN
F 2 "" H 3700 6050 50  0001 C CNN
F 3 "" H 3700 6050 50  0001 C CNN
	1    3700 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6550 3250 6550
Text Label 3250 6550 0    50   ~ 0
~FLOPPY_RD
Connection ~ 3950 6750
$Comp
L power:GND #PWR017
U 1 1 61C85D3C
P 4600 7350
F 0 "#PWR017" H 4600 7100 50  0001 C CNN
F 1 "GND" H 4700 7250 50  0000 C CNN
F 2 "" H 4600 7350 50  0001 C CNN
F 3 "" H 4600 7350 50  0001 C CNN
	1    4600 7350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 61C86240
P 4600 5750
F 0 "#PWR012" H 4600 5600 50  0001 C CNN
F 1 "VCC" H 4700 5800 50  0000 C CNN
F 2 "" H 4600 5750 50  0001 C CNN
F 3 "" H 4600 5750 50  0001 C CNN
	1    4600 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6350 5550 6350
Text Label 5550 6350 2    50   ~ 0
CLK
NoConn ~ 5100 6050
NoConn ~ 5100 6150
NoConn ~ 5100 6250
NoConn ~ 5100 6550
$Comp
L 74xx:74HC595 U3
U 1 1 61CA8343
P 9100 2150
F 0 "U3" H 9100 2150 50  0000 C CNN
F 1 "74HC595" H 9300 2700 50  0000 C CNN
F 2 "" H 9100 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 9100 2150 50  0001 C CNN
	1    9100 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U4
U 1 1 61CAA110
P 9100 3750
F 0 "U4" H 9100 3750 50  0000 C CNN
F 1 "74HC595" H 9300 4300 50  0000 C CNN
F 2 "" H 9100 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 9100 3750 50  0001 C CNN
	1    9100 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2350 8500 2350
Wire Wire Line
	8700 3950 8500 3950
Wire Wire Line
	8700 3550 8300 3550
Wire Wire Line
	8300 3550 8300 1950
Wire Wire Line
	8300 1950 8700 1950
Wire Wire Line
	8700 2250 8400 2250
Wire Wire Line
	8400 2250 8400 3850
Wire Wire Line
	8400 3850 8700 3850
Wire Wire Line
	8700 3650 8500 3650
Wire Wire Line
	8700 2050 8500 2050
Wire Wire Line
	8700 3350 8600 3350
Wire Wire Line
	8600 3350 8600 3000
Wire Wire Line
	8600 3000 9600 3000
Wire Wire Line
	9600 3000 9600 2650
Wire Wire Line
	9600 2650 9500 2650
$Comp
L power:VCC #PWR07
U 1 1 61CCD29A
P 9100 3150
F 0 "#PWR07" H 9100 3000 50  0001 C CNN
F 1 "VCC" H 9200 3200 50  0000 C CNN
F 2 "" H 9100 3150 50  0001 C CNN
F 3 "" H 9100 3150 50  0001 C CNN
	1    9100 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 61CCDA75
P 9100 4450
F 0 "#PWR011" H 9100 4200 50  0001 C CNN
F 1 "GND" H 9200 4450 50  0000 C CNN
F 2 "" H 9100 4450 50  0001 C CNN
F 3 "" H 9100 4450 50  0001 C CNN
	1    9100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 61CCDF08
P 8500 3950
F 0 "#PWR010" H 8500 3700 50  0001 C CNN
F 1 "GND" H 8600 3850 50  0000 C CNN
F 2 "" H 8500 3950 50  0001 C CNN
F 3 "" H 8500 3950 50  0001 C CNN
	1    8500 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61CCE34C
P 8500 2350
F 0 "#PWR05" H 8500 2100 50  0001 C CNN
F 1 "GND" H 8600 2250 50  0000 C CNN
F 2 "" H 8500 2350 50  0001 C CNN
F 3 "" H 8500 2350 50  0001 C CNN
	1    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 61CCE794
P 8500 3650
F 0 "#PWR09" H 8500 3500 50  0001 C CNN
F 1 "VCC" H 8600 3700 50  0000 C CNN
F 2 "" H 8500 3650 50  0001 C CNN
F 3 "" H 8500 3650 50  0001 C CNN
	1    8500 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR04
U 1 1 61CCEB67
P 8500 2050
F 0 "#PWR04" H 8500 1900 50  0001 C CNN
F 1 "VCC" H 8600 2100 50  0000 C CNN
F 2 "" H 8500 2050 50  0001 C CNN
F 3 "" H 8500 2050 50  0001 C CNN
	1    8500 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 61CCF116
P 9100 1550
F 0 "#PWR03" H 9100 1400 50  0001 C CNN
F 1 "VCC" H 9200 1600 50  0000 C CNN
F 2 "" H 9100 1550 50  0001 C CNN
F 3 "" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61CCF58A
P 9100 2850
F 0 "#PWR06" H 9100 2600 50  0001 C CNN
F 1 "GND" H 9200 2850 50  0000 C CNN
F 2 "" H 9100 2850 50  0001 C CNN
F 3 "" H 9100 2850 50  0001 C CNN
	1    9100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3450 10000 3450
Wire Wire Line
	9500 3650 10000 3650
Wire Wire Line
	9500 3850 10000 3850
Wire Wire Line
	9500 1750 9850 1750
Wire Wire Line
	9500 1950 9850 1950
Wire Wire Line
	9500 2150 9850 2150
Wire Wire Line
	9500 2350 9850 2350
Wire Wire Line
	9500 3550 9850 3550
Wire Wire Line
	9500 3750 9850 3750
Wire Wire Line
	9500 3950 9850 3950
Wire Wire Line
	9500 3350 9850 3350
Wire Wire Line
	9500 4050 10000 4050
Wire Wire Line
	9500 2450 10000 2450
Wire Wire Line
	9500 2250 10000 2250
Wire Wire Line
	9500 2050 10000 2050
Wire Wire Line
	9500 1850 10000 1850
Wire Bus Line
	9850 3950 9850 1550
Wire Bus Line
	10000 4050 10000 1750
Wire Bus Line
	9850 1550 10350 1550
Wire Bus Line
	10000 1750 10350 1750
Text Label 10350 1550 2    50   ~ 0
FM_DATA
Text Label 10350 1750 2    50   ~ 0
FM_CLK
Wire Wire Line
	8400 3850 8050 3850
Wire Wire Line
	8050 3850 8050 3750
Connection ~ 8400 3850
$Comp
L power:VCC #PWR08
U 1 1 61E61CB6
P 8050 3450
F 0 "#PWR08" H 8050 3300 50  0001 C CNN
F 1 "VCC" H 8150 3500 50  0000 C CNN
F 2 "" H 8050 3450 50  0001 C CNN
F 3 "" H 8050 3450 50  0001 C CNN
	1    8050 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61E6248B
P 8050 3600
F 0 "R3" H 8120 3646 50  0000 L CNN
F 1 "330" H 8120 3555 50  0000 L CNN
F 2 "" V 7980 3600 50  0001 C CNN
F 3 "~" H 8050 3600 50  0001 C CNN
	1    8050 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3850 7500 3850
Connection ~ 8050 3850
Wire Wire Line
	8300 1950 7500 1950
Connection ~ 8300 1950
Text Label 7500 1950 0    50   ~ 0
CLK
Wire Wire Line
	8700 1750 8600 1750
Text Label 7500 1750 0    50   ~ 0
~FLOPPY_RD
$Comp
L 74xx:74HC14 U1
U 5 1 61E7545C
P 8300 1750
F 0 "U1" H 8300 2067 50  0000 C CNN
F 1 "74HC14" H 8300 1976 50  0000 C CNN
F 2 "" H 8300 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 8300 1750 50  0001 C CNN
	5    8300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1750 7500 1750
Text Label 7500 3850 0    50   ~ 0
SR_RCLK
Text Notes 1050 1000 2    50   ~ 0
~FLOPPY_RD
Wire Wire Line
	1100 900  1350 900 
Wire Wire Line
	1350 900  1350 1100
Wire Wire Line
	1350 1100 1550 1100
Wire Wire Line
	1550 1100 1550 900 
Wire Wire Line
	1550 900  2150 900 
Wire Wire Line
	2150 900  2150 1100
Wire Wire Line
	2150 1100 2350 1100
Wire Wire Line
	2350 1100 2350 900 
Wire Wire Line
	2350 900  2950 900 
Wire Wire Line
	2950 900  2950 1100
Wire Wire Line
	2950 1100 3150 1100
Wire Wire Line
	3150 1100 3150 900 
Wire Wire Line
	4550 900  4550 1100
Wire Wire Line
	4550 1100 4750 1100
Wire Wire Line
	4750 1100 4750 900 
Wire Wire Line
	4750 900  5350 900 
Wire Wire Line
	5350 900  5350 1100
Wire Wire Line
	5350 1100 5550 1100
Wire Wire Line
	5550 1100 5550 900 
Wire Wire Line
	3150 900  4550 900 
Wire Wire Line
	5550 900  6050 900 
Wire Notes Line
	1550 1050 2150 1050
Text Notes 1800 1050 0    50   ~ 0
3us
Wire Notes Line
	3150 1050 4550 1050
Text Notes 3800 1050 0    50   ~ 0
7us
Wire Notes Line
	1350 950  1550 950 
Text Notes 1400 950  0    50   ~ 0
1us
Wire Notes Line
	2350 1050 2950 1050
Text Notes 2600 1050 0    50   ~ 0
3us
Text Notes 1850 -2850 2    50   ~ 0
CLK
Text Notes 2600 -2850 2    50   ~ 0
1
Text Notes 3450 -2850 2    50   ~ 0
CLK
Text Notes 5050 -2850 2    50   ~ 0
CLK
Text Notes 4200 -2850 2    50   ~ 0
0
Text Notes 5800 -2850 2    50   ~ 0
1
Text Notes 1400 -2850 2    50   ~ 0
FM meaning
Text Notes 1050 1500 2    50   ~ 0
8271's\n~DATA_WINDOW
Wire Wire Line
	1100 1350 1350 1350
Wire Wire Line
	1350 1350 1350 1550
Wire Wire Line
	1350 1550 4100 1550
Wire Wire Line
	4100 1550 4100 1350
Wire Wire Line
	4100 1350 4550 1350
Wire Wire Line
	4550 1350 4550 1550
Wire Wire Line
	4550 1550 6050 1550
Wire Notes Line
	1350 1100 1350 1350
Text Notes 1350 1550 0    50   ~ 0
0
Text Notes 1550 1550 0    50   ~ 0
1
Text Notes 1750 1550 0    50   ~ 0
2
Text Notes 1950 1550 0    50   ~ 0
3
Text Notes 2150 1550 0    50   ~ 0
0
Text Notes 2350 1550 0    50   ~ 0
1
Text Notes 2550 1550 0    50   ~ 0
2
Text Notes 2750 1550 0    50   ~ 0
3
Text Notes 2950 1550 0    50   ~ 0
0
Text Notes 3150 1550 0    50   ~ 0
1
Text Notes 3350 1550 0    50   ~ 0
2
Text Notes 3550 1550 0    50   ~ 0
3
Text Notes 3750 1550 0    50   ~ 0
4
Text Notes 3950 1550 0    50   ~ 0
5
Text Notes 4100 1550 0    50   ~ 0
5.7us
Text Notes 4550 1550 0    50   ~ 0
0
Text Notes 4750 1550 0    50   ~ 0
1
Text Notes 4950 1550 0    50   ~ 0
2
Text Notes 5150 1550 0    50   ~ 0
3
Text Notes 5350 1550 0    50   ~ 0
0
Text Notes 5550 1550 0    50   ~ 0
1
Text Notes 5750 1550 0    50   ~ 0
2
Text Notes 5950 1550 0    50   ~ 0
3
Wire Notes Line
	4550 1100 4550 1350
Text Notes 2000 1700 0    31   ~ 0
low => short
Text Notes 4400 1700 0    31   ~ 0
high => long
Text Notes 2800 1700 0    31   ~ 0
low => short
Text Notes 5200 1700 0    31   ~ 0
low => short
Text Notes 1350 1350 1    31   ~ 0
reset
Text Notes 2150 1350 1    31   ~ 0
reset
Text Notes 2950 1350 1    31   ~ 0
reset
Text Notes 4550 1350 1    31   ~ 0
reset
Text Notes 5350 1350 1    31   ~ 0
reset
Text Notes 1300 1700 0    31   ~ 0
8271's interpretation:
Text Notes 550  1550 0    31   ~ 0
(one-shot retriggerable timer)
Wire Notes Line
	2150 1100 2150 1650
Wire Notes Line
	2950 1100 2950 1650
Wire Notes Line
	4550 1550 4550 1650
Wire Notes Line
	5350 1100 5350 1650
Wire Wire Line
	1450 -2550 1700 -2550
Wire Wire Line
	1700 -2550 1700 -2350
Wire Wire Line
	1700 -2350 1900 -2350
Wire Wire Line
	1900 -2350 1900 -2550
Wire Wire Line
	1900 -2550 2500 -2550
Wire Wire Line
	2500 -2550 2500 -2350
Wire Wire Line
	2500 -2350 2700 -2350
Wire Wire Line
	2700 -2350 2700 -2550
Wire Wire Line
	2700 -2550 3300 -2550
Wire Wire Line
	3300 -2550 3300 -2350
Wire Wire Line
	3300 -2350 3500 -2350
Wire Wire Line
	3500 -2350 3500 -2550
Wire Wire Line
	4900 -2550 4900 -2350
Wire Wire Line
	4900 -2350 5100 -2350
Wire Wire Line
	5100 -2350 5100 -2550
Wire Wire Line
	5100 -2550 5700 -2550
Wire Wire Line
	5700 -2550 5700 -2350
Wire Wire Line
	5700 -2350 5900 -2350
Wire Wire Line
	5900 -2350 5900 -2550
Wire Wire Line
	3500 -2550 4900 -2550
Wire Wire Line
	5900 -2550 6400 -2550
Text Notes 1400 -2050 2    50   ~ 0
Ideal CLK
Wire Wire Line
	1800 -2000 1800 -2200
Wire Wire Line
	1800 -2200 2200 -2200
Wire Wire Line
	2200 -2200 2200 -2000
Wire Wire Line
	2200 -2000 2600 -2000
Wire Wire Line
	2600 -2000 2600 -2200
Wire Wire Line
	2600 -2200 3000 -2200
Wire Wire Line
	3000 -2200 3000 -2000
Wire Wire Line
	3000 -2000 3400 -2000
Wire Wire Line
	3400 -2000 3400 -2200
Wire Wire Line
	3400 -2200 3800 -2200
Wire Wire Line
	3800 -2200 3800 -2000
Wire Wire Line
	3800 -2000 4200 -2000
Wire Wire Line
	4200 -2000 4200 -2200
Wire Wire Line
	4200 -2200 4600 -2200
Wire Wire Line
	4600 -2200 4600 -2000
Wire Wire Line
	4600 -2000 5000 -2000
Wire Wire Line
	5000 -2000 5000 -2200
Wire Wire Line
	5000 -2200 5400 -2200
Wire Wire Line
	5400 -2200 5400 -2000
Wire Wire Line
	5400 -2000 5800 -2000
Wire Wire Line
	5800 -2000 5800 -2200
Wire Wire Line
	5800 -2200 6200 -2200
Wire Wire Line
	6200 -2200 6200 -2000
Wire Wire Line
	6200 -2000 6600 -2000
Wire Wire Line
	1800 -2000 1450 -2000
Wire Notes Line style dotted rgb(200, 0, 0)
	1800 -2200 1800 -2350
NoConn ~ 1800 -2350
NoConn ~ 2600 -2350
NoConn ~ 3400 -2350
NoConn ~ 4200 -2550
Text Notes 1400 -2450 2    50   ~ 0
~FLOPPY_RD
Wire Notes Line
	1700 -2500 1900 -2500
Text Notes 1750 -2500 0    50   ~ 0
1us
Wire Notes Line
	1900 -2600 2500 -2600
Text Notes 2150 -2600 0    50   ~ 0
3us
Wire Notes Line
	3500 -2600 4900 -2600
Text Notes 4150 -2600 0    50   ~ 0
7us
Wire Notes Line
	2700 -2600 3300 -2600
Text Notes 2950 -2600 0    50   ~ 0
3us
Wire Wire Line
	1450 -1400 1700 -1400
Wire Wire Line
	1700 -1400 1700 -1200
Wire Wire Line
	1700 -1200 1900 -1200
Wire Wire Line
	1900 -1200 1900 -1400
Wire Wire Line
	1900 -1400 2500 -1400
Wire Wire Line
	2500 -1400 2500 -1200
Wire Wire Line
	2500 -1200 2700 -1200
Wire Wire Line
	2700 -1200 2700 -1400
Wire Wire Line
	2700 -1400 3300 -1400
Wire Wire Line
	3300 -1400 3300 -1200
Wire Wire Line
	3300 -1200 3500 -1200
Wire Wire Line
	3500 -1200 3500 -1400
Wire Wire Line
	4900 -1400 4900 -1200
Wire Wire Line
	4900 -1200 5100 -1200
Wire Wire Line
	5100 -1200 5100 -1400
Wire Wire Line
	5100 -1400 5700 -1400
Wire Wire Line
	5700 -1400 5700 -1200
Wire Wire Line
	5700 -1200 5900 -1200
Wire Wire Line
	5900 -1200 5900 -1400
Wire Wire Line
	3500 -1400 4900 -1400
Wire Wire Line
	5900 -1400 6400 -1400
Text Notes 1400 -550 2    50   ~ 0
CLK\n(counter bit 3)
Wire Wire Line
	2300 -700 2300 -500
Wire Wire Line
	2300 -500 2550 -500
Wire Wire Line
	2550 -500 2550 -700
Wire Wire Line
	3350 -500 3350 -700
Wire Notes Line
	1700 -700 1700 -1200
Text Notes 1400 -1300 2    50   ~ 0
~FLOPPY_RD
Wire Notes Line
	1700 -1350 1900 -1350
Text Notes 1750 -1350 0    50   ~ 0
1us
Wire Notes Line
	1900 -1450 2500 -1450
Text Notes 2150 -1450 0    50   ~ 0
3us
Wire Notes Line
	3500 -1450 4900 -1450
Text Notes 4150 -1450 0    50   ~ 0
7us
Wire Notes Line
	2700 -1450 3300 -1450
Text Notes 2950 -1450 0    50   ~ 0
3us
Text Notes 1700 -1150 3    31   ~ 0
start reset
Text Notes 1950 -700 0    31   ~ 0
9
Text Notes 2000 -700 0    31   ~ 0
A
Text Notes 2050 -700 0    31   ~ 0
B
Text Notes 2100 -700 0    31   ~ 0
C
Text Notes 2150 -700 0    31   ~ 0
D
Text Notes 2200 -700 0    31   ~ 0
E
Text Notes 2250 -700 0    31   ~ 0
F
Text Notes 1900 -700 0    31   ~ 0
8
Text Notes 1850 -700 0    31   ~ 0
8
Text Notes 1800 -700 0    31   ~ 0
8
Text Notes 1750 -700 0    31   ~ 0
8
Wire Notes Line
	1900 -700 1900 -1200
Text Notes 1900 -1150 3    31   ~ 0
end reset
Text Notes 2300 -500 0    31   ~ 0
0
Text Notes 2350 -500 0    31   ~ 0
1
Text Notes 2400 -500 0    31   ~ 0
2
Text Notes 2450 -500 0    31   ~ 0
3
Wire Wire Line
	3100 -700 3100 -500
Wire Notes Line
	2500 -700 2500 -1200
Text Notes 2500 -1150 3    31   ~ 0
start reset
Text Notes 2750 -700 0    31   ~ 0
9
Text Notes 2800 -700 0    31   ~ 0
A
Text Notes 2850 -700 0    31   ~ 0
B
Text Notes 2900 -700 0    31   ~ 0
C
Text Notes 2950 -700 0    31   ~ 0
D
Text Notes 3000 -700 0    31   ~ 0
E
Text Notes 3050 -700 0    31   ~ 0
F
Text Notes 2700 -700 0    31   ~ 0
8
Text Notes 2650 -700 0    31   ~ 0
8
Text Notes 2600 -700 0    31   ~ 0
8
Text Notes 2550 -700 0    31   ~ 0
8
Text Notes 2500 -500 0    31   ~ 0
4
Wire Notes Line
	2700 -700 2700 -1200
Text Notes 2700 -1150 3    31   ~ 0
end reset
Wire Wire Line
	2550 -700 3100 -700
Wire Wire Line
	3100 -500 3350 -500
Text Notes 3100 -500 0    31   ~ 0
0
Text Notes 3150 -500 0    31   ~ 0
1
Text Notes 3200 -500 0    31   ~ 0
2
Text Notes 3250 -500 0    31   ~ 0
3
Wire Wire Line
	3900 -700 3900 -500
Wire Notes Line
	3300 -700 3300 -1200
Text Notes 3300 -1150 3    31   ~ 0
start reset
Text Notes 3550 -700 0    31   ~ 0
9
Text Notes 3600 -700 0    31   ~ 0
A
Text Notes 3650 -700 0    31   ~ 0
B
Text Notes 3700 -700 0    31   ~ 0
C
Text Notes 3750 -700 0    31   ~ 0
D
Text Notes 3800 -700 0    31   ~ 0
E
Text Notes 3850 -700 0    31   ~ 0
F
Text Notes 3500 -700 0    31   ~ 0
8
Text Notes 3450 -700 0    31   ~ 0
8
Text Notes 3400 -700 0    31   ~ 0
8
Text Notes 3350 -700 0    31   ~ 0
8
Text Notes 3300 -500 0    31   ~ 0
4
Wire Notes Line
	3500 -700 3500 -1200
Text Notes 3500 -1150 3    31   ~ 0
end reset
Text Notes 3900 -500 0    31   ~ 0
0
Text Notes 3950 -500 0    31   ~ 0
1
Text Notes 4000 -500 0    31   ~ 0
2
Text Notes 4050 -500 0    31   ~ 0
3
Wire Wire Line
	3350 -700 3900 -700
Text Notes 4100 -500 0    31   ~ 0
4
Text Notes 4150 -500 0    31   ~ 0
5
Text Notes 4200 -500 0    31   ~ 0
6
Text Notes 4250 -500 0    31   ~ 0
7
Wire Wire Line
	4700 -700 4700 -500
Text Notes 4350 -700 0    31   ~ 0
9
Text Notes 4400 -700 0    31   ~ 0
A
Text Notes 4450 -700 0    31   ~ 0
B
Text Notes 4500 -700 0    31   ~ 0
C
Text Notes 4550 -700 0    31   ~ 0
D
Text Notes 4600 -700 0    31   ~ 0
E
Text Notes 4650 -700 0    31   ~ 0
F
Text Notes 4300 -700 0    31   ~ 0
8
Wire Wire Line
	4300 -700 4700 -700
Text Notes 4700 -500 0    31   ~ 0
0
Wire Wire Line
	4300 -700 4300 -500
Wire Wire Line
	4300 -500 3900 -500
Wire Wire Line
	1750 -700 1750 -500
Wire Wire Line
	1750 -700 2300 -700
Wire Wire Line
	1450 -500 1750 -500
Text Notes 4700 -500 0    31   ~ 0
0
Text Notes 4750 -500 0    31   ~ 0
1
Text Notes 4800 -500 0    31   ~ 0
2
Wire Wire Line
	4950 -500 4950 -700
Wire Wire Line
	4700 -500 4950 -500
Text Notes 4850 -500 0    31   ~ 0
3
Text Notes 4900 -1150 3    31   ~ 0
start reset
Text Notes 5150 -700 0    31   ~ 0
9
Text Notes 5200 -700 0    31   ~ 0
A
Text Notes 5250 -700 0    31   ~ 0
B
Text Notes 5300 -700 0    31   ~ 0
C
Text Notes 5350 -700 0    31   ~ 0
D
Text Notes 5400 -700 0    31   ~ 0
E
Text Notes 5450 -700 0    31   ~ 0
F
Text Notes 5100 -700 0    31   ~ 0
8
Text Notes 5050 -700 0    31   ~ 0
8
Text Notes 5000 -700 0    31   ~ 0
8
Text Notes 4950 -700 0    31   ~ 0
8
Text Notes 4900 -500 0    31   ~ 0
4
Wire Notes Line
	5100 -700 5100 -1200
Text Notes 5100 -1150 3    31   ~ 0
end reset
Wire Notes Line style dotted rgb(200, 0, 0)
	3350 -700 3350 -1200
Wire Notes Line style dotted rgb(200, 0, 0)
	4950 -700 4950 -1200
Wire Notes Line style dotted rgb(200, 0, 0)
	2550 -700 2550 -1200
Wire Notes Line
	4900 -700 4900 -1200
Wire Notes Line style dotted rgb(200, 0, 0)
	4300 -700 4300 -1400
Wire Notes Line style dotted rgb(200, 0, 0)
	1750 -700 1750 -1200
Wire Notes Line
	3500 -850 4300 -850
Text Notes 3800 -850 0    50   ~ 0
4us
Wire Wire Line
	5500 -700 5500 -500
Wire Wire Line
	5500 -500 5750 -500
Wire Wire Line
	5750 -500 5750 -700
Text Notes 5500 -500 0    31   ~ 0
0
Text Notes 5550 -500 0    31   ~ 0
1
Text Notes 5600 -500 0    31   ~ 0
2
Text Notes 5650 -500 0    31   ~ 0
3
Wire Wire Line
	6300 -700 6300 -500
Wire Notes Line
	5700 -700 5700 -1200
Text Notes 5700 -1150 3    31   ~ 0
start reset
Text Notes 5950 -700 0    31   ~ 0
9
Text Notes 6000 -700 0    31   ~ 0
A
Text Notes 6050 -700 0    31   ~ 0
B
Text Notes 6100 -700 0    31   ~ 0
C
Text Notes 6150 -700 0    31   ~ 0
D
Text Notes 6200 -700 0    31   ~ 0
E
Text Notes 6250 -700 0    31   ~ 0
F
Text Notes 5900 -700 0    31   ~ 0
8
Text Notes 5850 -700 0    31   ~ 0
8
Text Notes 5800 -700 0    31   ~ 0
8
Text Notes 5750 -700 0    31   ~ 0
8
Text Notes 5700 -500 0    31   ~ 0
4
Wire Notes Line
	5900 -700 5900 -1200
Text Notes 5900 -1150 3    31   ~ 0
end reset
Wire Wire Line
	5750 -700 6300 -700
Wire Wire Line
	6300 -500 6550 -500
Text Notes 6300 -500 0    31   ~ 0
0
Wire Wire Line
	4950 -700 5500 -700
Wire Notes Line style dotted rgb(200, 0, 0)
	5750 -700 5750 -1200
Wire Notes Line style dotted rgb(200, 0, 0)
	2600 -2200 2600 -2350
Wire Notes Line style dotted rgb(200, 0, 0)
	3400 -2200 3400 -2350
Wire Notes Line style dotted rgb(200, 0, 0)
	4200 -2200 4200 -2550
Wire Notes Line style dotted rgb(200, 0, 0)
	5000 -2200 5000 -2350
NoConn ~ 5000 -2350
Wire Wire Line
	1100 2850 1250 2850
Wire Wire Line
	1250 2850 1250 3050
Wire Wire Line
	1250 3050 1300 3050
Wire Wire Line
	1300 3050 1300 2850
Wire Wire Line
	1300 2850 1450 2850
Wire Wire Line
	1450 2850 1450 3050
Wire Wire Line
	1450 3050 1500 3050
Wire Wire Line
	1500 3050 1500 2850
Wire Wire Line
	1500 2850 1650 2850
Wire Wire Line
	1650 2850 1650 3050
Wire Wire Line
	1650 3050 1700 3050
Wire Wire Line
	1700 3050 1700 2850
Wire Wire Line
	1700 2850 1850 2850
Wire Wire Line
	1850 2850 1850 3050
Wire Wire Line
	1850 3050 1900 3050
Wire Wire Line
	1900 3050 1900 2850
Wire Wire Line
	1900 2850 2050 2850
Wire Wire Line
	2050 2850 2050 3050
Wire Wire Line
	2050 3050 2100 3050
Wire Wire Line
	2100 3050 2100 2850
Wire Wire Line
	2450 2850 2450 3050
Wire Wire Line
	2450 3050 2500 3050
Wire Wire Line
	2500 3050 2500 2850
Wire Wire Line
	2850 2850 2850 3050
Wire Wire Line
	2850 3050 2900 3050
Wire Wire Line
	2900 3050 2900 2850
Wire Wire Line
	2900 2850 3050 2850
Wire Wire Line
	3050 2850 3050 3050
Wire Wire Line
	3050 3050 3100 3050
Wire Wire Line
	3100 3050 3100 2850
Wire Wire Line
	3100 2850 3250 2850
Wire Wire Line
	3250 2850 3250 3050
Wire Wire Line
	3250 3050 3300 3050
Wire Wire Line
	3300 3050 3300 2850
Wire Wire Line
	3650 2850 3650 3050
Wire Wire Line
	3650 3050 3700 3050
Wire Wire Line
	3700 3050 3700 2850
Wire Wire Line
	4050 2850 4050 3050
Wire Wire Line
	4050 3050 4100 3050
Wire Wire Line
	4100 3050 4100 2850
Wire Wire Line
	4450 2850 4450 3050
Wire Wire Line
	4450 3050 4500 3050
Wire Wire Line
	4500 3050 4500 2850
Wire Wire Line
	4500 2850 4650 2850
Wire Wire Line
	4650 2850 4650 3050
Wire Wire Line
	4650 3050 4700 3050
Wire Wire Line
	4700 3050 4700 2850
Wire Wire Line
	4700 2850 4850 2850
Wire Wire Line
	4850 2850 4850 3050
Wire Wire Line
	4850 3050 4900 3050
Wire Wire Line
	4900 3050 4900 2850
Wire Wire Line
	4900 2850 5050 2850
Wire Wire Line
	5050 2850 5050 3050
Wire Wire Line
	5050 3050 5100 3050
Wire Wire Line
	5100 3050 5100 2850
Wire Wire Line
	5100 2850 5250 2850
Wire Wire Line
	5250 2850 5250 3050
Wire Wire Line
	5250 3050 5300 3050
Wire Wire Line
	5300 3050 5300 2850
Wire Wire Line
	5300 2850 5450 2850
Wire Wire Line
	5450 2850 5450 3050
Wire Wire Line
	5450 3050 5500 3050
Wire Wire Line
	5500 3050 5500 2850
Wire Wire Line
	5500 2850 5650 2850
Wire Wire Line
	5650 2850 5650 3050
Wire Wire Line
	5650 3050 5700 3050
Wire Wire Line
	5700 3050 5700 2850
Wire Wire Line
	6050 2850 6050 3050
Wire Wire Line
	6050 3050 6100 3050
Wire Wire Line
	6100 3050 6100 2850
Wire Wire Line
	6100 2850 6250 2850
Wire Wire Line
	6250 2850 6250 3050
Wire Wire Line
	6250 3050 6300 3050
Wire Wire Line
	6300 3050 6300 2850
Wire Wire Line
	6300 2850 6450 2850
Wire Wire Line
	6450 2850 6450 3050
Wire Wire Line
	6450 3050 6500 3050
Wire Wire Line
	6500 3050 6500 2850
Wire Wire Line
	6850 2850 6850 3050
Wire Wire Line
	6850 3050 6900 3050
Wire Wire Line
	6900 3050 6900 2850
Wire Wire Line
	7250 2850 7250 3050
Wire Wire Line
	7250 3050 7300 3050
Wire Wire Line
	7300 3050 7300 2850
Wire Wire Line
	7300 2850 7450 2850
Wire Wire Line
	7450 2850 7450 3050
Wire Wire Line
	7450 3050 7500 3050
Wire Wire Line
	7500 3050 7500 2850
Wire Wire Line
	2100 2850 2450 2850
Wire Wire Line
	2500 2850 2850 2850
Wire Wire Line
	3300 2850 3650 2850
Wire Wire Line
	3700 2850 4050 2850
Wire Wire Line
	4100 2850 4450 2850
Wire Wire Line
	5700 2850 6050 2850
Wire Wire Line
	6500 2850 6850 2850
Wire Wire Line
	6900 2850 7250 2850
Text Notes 7450 2700 0    47   ~ 0
1
Text Notes 7050 2700 0    47   ~ 0
0
Text Notes 6650 2700 0    47   ~ 0
0
Text Notes 6250 2700 0    47   ~ 0
1
Text Notes 5850 2700 0    47   ~ 0
0
Text Notes 5450 2700 0    47   ~ 0
1
Text Notes 5050 2700 0    47   ~ 0
1
Text Notes 4650 2700 0    47   ~ 0
1
Text Notes 4250 2700 0    47   ~ 0
0
Text Notes 3850 2700 0    47   ~ 0
0
Text Notes 3450 2700 0    47   ~ 0
0
Text Notes 3050 2700 0    47   ~ 0
1
Text Notes 2650 2700 0    47   ~ 0
0
Text Notes 2250 2700 0    47   ~ 0
0
Text Notes 1850 2700 0    47   ~ 0
1
Text Notes 1450 2700 0    47   ~ 0
1
Text Notes 1050 2550 2    47   ~ 0
FM clock
Text Notes 1250 2550 0    47   ~ 0
1
Text Notes 1050 2700 2    47   ~ 0
FM data
Text Notes 2000 -4200 2    50   ~ 0
CLK
Text Notes 2750 -4200 2    50   ~ 0
1
Text Notes 3600 -4200 2    50   ~ 0
CLK
Text Notes 5200 -4200 2    50   ~ 0
CLK
Text Notes 4350 -4200 2    50   ~ 0
0
Text Notes 5950 -4200 2    50   ~ 0
1
Text Notes 1550 -4200 2    50   ~ 0
FM meaning
Wire Wire Line
	1600 -3900 1850 -3900
Wire Wire Line
	1850 -3900 1850 -3700
Wire Wire Line
	1850 -3700 2050 -3700
Wire Wire Line
	2050 -3700 2050 -3900
Wire Wire Line
	2050 -3900 2650 -3900
Wire Wire Line
	2650 -3900 2650 -3700
Wire Wire Line
	2650 -3700 2850 -3700
Wire Wire Line
	2850 -3700 2850 -3900
Wire Wire Line
	2850 -3900 3450 -3900
Wire Wire Line
	3450 -3900 3450 -3700
Wire Wire Line
	3450 -3700 3650 -3700
Wire Wire Line
	3650 -3700 3650 -3900
Wire Wire Line
	5050 -3900 5050 -3700
Wire Wire Line
	5050 -3700 5250 -3700
Wire Wire Line
	5250 -3700 5250 -3900
Wire Wire Line
	5250 -3900 5850 -3900
Wire Wire Line
	5850 -3900 5850 -3700
Wire Wire Line
	5850 -3700 6050 -3700
Wire Wire Line
	6050 -3700 6050 -3900
Wire Wire Line
	3650 -3900 5050 -3900
Wire Wire Line
	6050 -3900 6550 -3900
Text Notes 1550 -3800 2    50   ~ 0
~FLOPPY_RD
Wire Notes Line
	1850 -3850 2050 -3850
Text Notes 1900 -3850 0    50   ~ 0
1us
Wire Notes Line
	2050 -3950 2650 -3950
Text Notes 2300 -3950 0    50   ~ 0
3us
Wire Notes Line
	3650 -3950 5050 -3950
Text Notes 4300 -3950 0    50   ~ 0
7us
Wire Notes Line
	2850 -3950 3450 -3950
Text Notes 3100 -3950 0    50   ~ 0
3us
Text Notes 9150 -3150 0    50   ~ 0
00
Text Notes 9350 -3150 0    50   ~ 0
00
Text Notes 9550 -3150 0    50   ~ 0
00
Text Notes 9750 -3150 0    50   ~ 0
00
Text Notes 9950 -3150 0    50   ~ 0
00
Text Notes 10150 -3150 0    50   ~ 0
00
Text Notes 10350 -3150 0    50   ~ 0
FE
Text Notes 10550 -3150 0    50   ~ 0
trk
Wire Notes Line
	9300 -3300 9300 -3100
Wire Notes Line
	9100 -3100 9100 -3300
Wire Notes Line
	9500 -3300 9500 -3100
Wire Notes Line
	9700 -3300 9700 -3100
Wire Notes Line
	9900 -3300 9900 -3100
Wire Notes Line
	10100 -3300 10100 -3100
Wire Notes Line
	10300 -3300 10300 -3100
Wire Notes Line
	10500 -3300 10500 -3100
Wire Notes Line
	10700 -3300 10700 -3100
Wire Notes Line
	10900 -3300 10900 -3100
Wire Notes Line
	11100 -3300 11100 -3100
Wire Notes Line
	11300 -3300 11300 -3100
Text Notes 10700 -3150 0    50   ~ 0
head
Text Notes 10950 -3150 0    50   ~ 0
sec
Text Notes 11150 -3150 0    50   ~ 0
len
Text Notes 11400 -3150 0    50   ~ 0
crc16
Wire Notes Line
	11500 -3300 11500 -3250
Wire Notes Line
	11500 -3100 11500 -3150
Wire Notes Line
	11700 -3100 11700 -3300
Wire Notes Line
	9100 -3300 11700 -3300
Wire Notes Line
	9100 -3100 11700 -3100
Text Notes 10450 -3200 0    50   ~ 0
*
Text Notes 12100 -3100 0    50   ~ 0
Clock byte = FF\nexcept where\nmarked with *
$Comp
L 74xx:74HC595 U3
U 1 1 61F5F071
P 14050 2250
F 0 "U3" H 14050 2250 50  0000 C CNN
F 1 "74HC595" H 14250 2800 50  0000 C CNN
F 2 "" H 14050 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 14050 2250 50  0001 C CNN
	1    14050 2250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC595 U4
U 1 1 61F5F077
P 14050 3850
F 0 "U4" H 14050 3850 50  0000 C CNN
F 1 "74HC595" H 14250 4400 50  0000 C CNN
F 2 "" H 14050 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 14050 3850 50  0001 C CNN
	1    14050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 2450 13450 2450
Wire Wire Line
	13650 4050 13450 4050
Wire Wire Line
	13650 3650 13250 3650
Wire Wire Line
	13250 3650 13250 2050
Wire Wire Line
	13250 2050 13650 2050
Wire Wire Line
	13650 2350 13350 2350
Wire Wire Line
	13350 2350 13350 3950
Wire Wire Line
	13350 3950 13650 3950
Wire Wire Line
	13650 3750 13450 3750
Wire Wire Line
	13650 2150 13450 2150
Wire Wire Line
	13650 3450 13550 3450
Wire Wire Line
	13550 3450 13550 3100
Wire Wire Line
	13550 3100 14550 3100
Wire Wire Line
	14550 3100 14550 2750
Wire Wire Line
	14550 2750 14450 2750
$Comp
L power:VCC #PWR?
U 1 1 61F5F08C
P 14050 3250
F 0 "#PWR?" H 14050 3100 50  0001 C CNN
F 1 "VCC" H 14150 3300 50  0000 C CNN
F 2 "" H 14050 3250 50  0001 C CNN
F 3 "" H 14050 3250 50  0001 C CNN
	1    14050 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F5F092
P 14050 4550
F 0 "#PWR?" H 14050 4300 50  0001 C CNN
F 1 "GND" H 14150 4550 50  0000 C CNN
F 2 "" H 14050 4550 50  0001 C CNN
F 3 "" H 14050 4550 50  0001 C CNN
	1    14050 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F5F098
P 13450 4050
F 0 "#PWR?" H 13450 3800 50  0001 C CNN
F 1 "GND" H 13550 3950 50  0000 C CNN
F 2 "" H 13450 4050 50  0001 C CNN
F 3 "" H 13450 4050 50  0001 C CNN
	1    13450 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F5F09E
P 13450 2450
F 0 "#PWR?" H 13450 2200 50  0001 C CNN
F 1 "GND" H 13550 2350 50  0000 C CNN
F 2 "" H 13450 2450 50  0001 C CNN
F 3 "" H 13450 2450 50  0001 C CNN
	1    13450 2450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61F5F0A4
P 13450 3750
F 0 "#PWR?" H 13450 3600 50  0001 C CNN
F 1 "VCC" H 13550 3800 50  0000 C CNN
F 2 "" H 13450 3750 50  0001 C CNN
F 3 "" H 13450 3750 50  0001 C CNN
	1    13450 3750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61F5F0AA
P 13450 2150
F 0 "#PWR?" H 13450 2000 50  0001 C CNN
F 1 "VCC" H 13550 2200 50  0000 C CNN
F 2 "" H 13450 2150 50  0001 C CNN
F 3 "" H 13450 2150 50  0001 C CNN
	1    13450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61F5F0B0
P 14050 1650
F 0 "#PWR?" H 14050 1500 50  0001 C CNN
F 1 "VCC" H 14150 1700 50  0000 C CNN
F 2 "" H 14050 1650 50  0001 C CNN
F 3 "" H 14050 1650 50  0001 C CNN
	1    14050 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61F5F0B6
P 14050 2950
F 0 "#PWR?" H 14050 2700 50  0001 C CNN
F 1 "GND" H 14150 2950 50  0000 C CNN
F 2 "" H 14050 2950 50  0001 C CNN
F 3 "" H 14050 2950 50  0001 C CNN
	1    14050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 3550 14850 3550
Wire Wire Line
	14450 3750 14850 3750
Wire Wire Line
	14450 3950 14850 3950
Wire Wire Line
	14450 1850 14700 1850
Wire Wire Line
	14450 2050 14700 2050
Wire Wire Line
	14450 2250 14700 2250
Wire Wire Line
	14450 2450 14700 2450
Wire Wire Line
	14450 3850 14700 3850
Wire Wire Line
	14450 4050 14700 4050
Wire Wire Line
	14450 3450 14700 3450
Wire Wire Line
	14450 4150 14850 4150
Wire Wire Line
	14450 2550 14850 2550
Wire Wire Line
	13350 3950 13000 3950
Wire Wire Line
	13000 3950 13000 3850
Connection ~ 13350 3950
$Comp
L power:VCC #PWR?
U 1 1 61F5F0D5
P 13000 3550
F 0 "#PWR?" H 13000 3400 50  0001 C CNN
F 1 "VCC" H 13100 3600 50  0000 C CNN
F 2 "" H 13000 3550 50  0001 C CNN
F 3 "" H 13000 3550 50  0001 C CNN
	1    13000 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61F5F0DB
P 13000 3700
F 0 "R3" H 13070 3746 50  0000 L CNN
F 1 "330" H 13070 3655 50  0000 L CNN
F 2 "" V 12930 3700 50  0001 C CNN
F 3 "~" H 13000 3700 50  0001 C CNN
	1    13000 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 3950 12450 3950
Connection ~ 13000 3950
Wire Wire Line
	13250 2050 12450 2050
Connection ~ 13250 2050
Text Label 12450 2050 0    50   ~ 0
CLK
Wire Wire Line
	13650 1850 13550 1850
Text Label 12450 1850 0    50   ~ 0
~FLOPPY_RD
$Comp
L 74xx:74HC14 U1
U 5 1 61F5F0E8
P 13250 1850
F 0 "U1" H 13250 2167 50  0000 C CNN
F 1 "74HC14" H 13250 2076 50  0000 C CNN
F 2 "" H 13250 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC14" H 13250 1850 50  0001 C CNN
	5    13250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	12950 1850 12450 1850
Text Label 12450 3950 0    50   ~ 0
SR_RCLK
Text Label 14850 1950 2    50   ~ 0
C0
Text Label 14700 2050 2    50   ~ 0
D1
Text Label 14850 2350 2    50   ~ 0
C2
Text Label 14700 2450 2    50   ~ 0
D3
Text Label 14850 3550 2    50   ~ 0
C4
Text Label 14700 3650 2    50   ~ 0
D5
Text Label 14850 3950 2    50   ~ 0
C6
Text Label 14700 4050 2    50   ~ 0
D7
Text Label 14850 2150 2    50   ~ 0
C1
Text Label 14850 2550 2    50   ~ 0
C3
Text Label 14850 3750 2    50   ~ 0
C5
Text Label 14850 4150 2    50   ~ 0
C7
Text Label 14700 1850 2    50   ~ 0
D0
Text Label 14700 2250 2    50   ~ 0
D2
Text Label 14700 3450 2    50   ~ 0
D4
Text Label 14700 3850 2    50   ~ 0
D6
$Comp
L 74xx:74LS32 U?
U 1 1 62173533
P 15650 2700
F 0 "U?" H 15650 2933 50  0001 C CNN
F 1 "74LS32" H 15650 2934 50  0001 C CNN
F 2 "" H 15650 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 15650 2700 50  0001 C CNN
	1    15650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	14450 1950 15250 1950
Wire Wire Line
	14450 2150 15200 2150
Wire Wire Line
	14450 2350 15150 2350
Wire Wire Line
	15250 3650 15250 2800
Wire Wire Line
	15250 2800 15350 2800
Wire Wire Line
	14450 3650 15250 3650
Wire Wire Line
	15150 2350 15150 2750
Wire Wire Line
	15150 2750 15550 2750
Wire Wire Line
	15200 2650 15550 2650
Wire Wire Line
	15250 2600 15350 2600
Wire Wire Line
	15250 1950 15250 2600
Wire Wire Line
	15200 2150 15200 2650
NoConn ~ 14450 4350
Wire Wire Line
	15950 2700 16500 2700
Text Label 16500 2700 2    50   ~ 0
~ADDRMARK
Text Notes 13900 5950 2    50   ~ 0
Clock Recovery
Text Notes 15350 6000 2    50   ~ 0
Clock/Data\nSeparation
Text Notes 16800 5900 2    50   ~ 0
Address Mark
Text Notes 18150 6000 2    50   ~ 0
Byte Clock\nGeneration
Wire Notes Line
	13200 5600 14000 5600
Wire Notes Line
	14000 5600 14000 6250
Wire Notes Line
	14000 6250 13200 6250
Wire Notes Line
	13200 6250 13200 5600
Wire Notes Line
	21550 4950 20750 4950
Wire Notes Line
	20750 4950 20750 4300
Wire Notes Line
	21550 4300 21550 4950
Wire Notes Line
	20750 4300 21550 4300
Wire Notes Line
	15550 6250 14750 6250
Wire Notes Line
	14750 6250 14750 5600
Wire Notes Line
	15550 5600 15550 6250
Wire Notes Line
	14750 5600 15550 5600
Wire Notes Line
	16950 6250 16150 6250
Wire Notes Line
	16150 6250 16150 5600
Wire Notes Line
	16950 5600 16950 6250
Wire Notes Line
	16150 5600 16950 5600
Wire Notes Line
	18350 6250 17550 6250
Wire Notes Line
	17550 6250 17550 5600
Wire Notes Line
	18350 5600 18350 6250
Wire Notes Line
	17550 5600 18350 5600
Text Notes 16700 6000 2    50   ~ 0
Detection
Wire Wire Line
	13200 6100 12500 6100
Wire Wire Line
	13000 5400 13000 5750
Wire Wire Line
	13000 5750 13200 5750
Connection ~ 13000 5400
Wire Wire Line
	13000 5400 12500 5400
Wire Wire Line
	14550 5400 14550 5750
Wire Wire Line
	14550 5750 14750 5750
Wire Wire Line
	13000 5400 14550 5400
Wire Bus Line
	15550 5750 16150 5750
Wire Bus Line
	15550 5950 16150 5950
Text Label 16050 5750 2    50   ~ 0
FM_CLOCK
Text Label 16000 5950 2    50   ~ 0
FM_DATA
Wire Wire Line
	16950 5750 17550 5750
Wire Wire Line
	14550 6550 14550 6100
Text Label 12500 6100 0    50   ~ 0
4MHz
Text Label 12500 5400 0    50   ~ 0
~FLOPPY_RD
Text Label 14050 6100 0    50   ~ 0
BIT_CLOCK
Wire Wire Line
	16150 6100 16000 6100
Wire Wire Line
	16000 6100 16000 6550
Connection ~ 16000 6550
Wire Wire Line
	16000 6550 17400 6550
Wire Wire Line
	17550 6100 17400 6100
Wire Wire Line
	17400 6100 17400 6550
Wire Wire Line
	18350 5750 18900 5750
Text Label 18900 5750 2    50   ~ 0
BYTE_CLOCK
Text Label 17450 5750 2    50   ~ 0
~ADDRMARK
Connection ~ 14550 6100
Wire Wire Line
	14550 6100 14750 6100
Wire Wire Line
	14550 6550 16000 6550
Wire Wire Line
	14000 6100 14550 6100
Text Notes 1650 2550 0    47   ~ 0
1
Text Notes 2050 2550 0    47   ~ 0
1
Text Notes 2450 2550 0    47   ~ 0
1
Text Notes 2850 2550 0    47   ~ 0
1
Text Notes 3250 2550 0    47   ~ 0
1
Text Notes 3650 2550 0    47   ~ 0
1
Text Notes 4050 2550 0    47   ~ 0
1
Text Notes 4450 2550 0    47   ~ 0
1
Text Notes 4850 2550 0    47   ~ 0
1
Text Notes 5250 2550 0    47   ~ 0
1
Text Notes 5650 2550 0    47   ~ 0
1
Text Notes 6050 2550 0    47   ~ 0
1
Text Notes 6450 2550 0    47   ~ 0
1
Text Notes 6850 2550 0    47   ~ 0
1
Text Notes 7250 2550 0    47   ~ 0
1
Wire Notes Line
	1600 3150 1600 3350
Wire Notes Line
	4800 3350 4800 3150
Text Notes 4150 3250 2    50   ~ 0
C1
Text Notes 3750 3250 2    50   ~ 0
C2
Text Notes 3350 3250 2    50   ~ 0
C3
Text Notes 2950 3250 2    50   ~ 0
C4
Text Notes 2550 3250 2    50   ~ 0
C5
Text Notes 2150 3250 2    50   ~ 0
C6
Text Notes 1750 3250 2    50   ~ 0
C7
Text Notes 1950 3250 2    50   ~ 0
D7
Text Notes 2350 3250 2    50   ~ 0
D6
Text Notes 2750 3250 2    50   ~ 0
D5
Text Notes 3150 3250 2    50   ~ 0
D4
Text Notes 3550 3250 2    50   ~ 0
D3
Text Notes 3950 3250 2    50   ~ 0
D2
Text Notes 4350 3250 2    50   ~ 0
D1
Text Notes 4750 3250 2    50   ~ 0
D0
Text Notes 4550 3250 2    50   ~ 0
C0
Text Notes 3600 3450 2    50   ~ 0
one byte = 16 bit-clocks
Wire Notes Line
	1600 3350 4800 3350
Wire Wire Line
	-525 -275 -525 -75 
Wire Wire Line
	-525 -75  -475 -75 
Wire Wire Line
	-475 -75  -475 -275
Wire Wire Line
	-475 -275 -325 -275
Wire Wire Line
	-325 -275 -325 -75 
Wire Wire Line
	-325 -75  -275 -75 
Wire Wire Line
	-875 -275 -525 -275
Text Notes -4000 1500 2    50   ~ 0
FF
Text Notes -3700 1500 2    50   ~ 0
FF
Text Notes -3400 1500 2    50   ~ 0
FF
Text Notes -3100 1500 2    50   ~ 0
C7
Text Notes -2800 1500 2    50   ~ 0
FF
Text Notes -2500 1500 2    50   ~ 0
FF
Text Notes -2200 1500 2    50   ~ 0
FF
Text Notes -4000 1650 2    50   ~ 0
00
Text Notes -3100 1650 2    50   ~ 0
FE
Text Notes -3700 1650 2    50   ~ 0
00
Text Notes -3400 1650 2    50   ~ 0
00
Text Notes -2800 1650 2    50   ~ 0
??
Text Notes -4300 1500 2    50   ~ 0
Clock Hex
Text Notes -4300 1650 2    50   ~ 0
Data Hex
Text Notes -4350 2400 2    50   ~ 0
1
Text Notes -4150 2400 2    50   ~ 0
1
Text Notes -3950 2400 2    50   ~ 0
1
Text Notes -3750 2400 2    50   ~ 0
1
Text Notes -3550 2400 2    50   ~ 0
1
Text Notes -3350 2400 2    50   ~ 0
1
Text Notes -3150 2400 2    50   ~ 0
1
Text Notes -2950 2400 2    50   ~ 0
1
Text Notes -2750 2400 2    50   ~ 0
0
Text Notes -2550 2400 2    50   ~ 0
0
Text Notes -2350 2400 2    50   ~ 0
0
Text Notes -2150 2400 2    50   ~ 0
1
Text Notes -1950 2400 2    50   ~ 0
1
Text Notes -1750 2400 2    50   ~ 0
1
Text Notes -1550 2400 2    50   ~ 0
1
Text Notes -1350 2400 2    50   ~ 0
1
Text Notes -7550 2400 2    50   ~ 0
1
Text Notes -7350 2400 2    50   ~ 0
1
Text Notes -7150 2400 2    50   ~ 0
1
Text Notes -6950 2400 2    50   ~ 0
1
Text Notes -6750 2400 2    50   ~ 0
1
Text Notes -6550 2400 2    50   ~ 0
1
Text Notes -6350 2400 2    50   ~ 0
1
Text Notes -6150 2400 2    50   ~ 0
1
Text Notes -5950 2400 2    50   ~ 0
1
Text Notes -5750 2400 2    50   ~ 0
1
Text Notes -5550 2400 2    50   ~ 0
1
Text Notes -5350 2400 2    50   ~ 0
1
Text Notes -5150 2400 2    50   ~ 0
1
Text Notes -4950 2400 2    50   ~ 0
1
Text Notes -4750 2400 2    50   ~ 0
1
Text Notes -4550 2400 2    50   ~ 0
1
Text Notes -3050 2500 2    50   ~ 0
1
Text Notes -2850 2500 2    50   ~ 0
1
Text Notes -2650 2500 2    50   ~ 0
1
Text Notes -2450 2500 2    50   ~ 0
1
Text Notes -2250 2500 2    50   ~ 0
1
Text Notes -2050 2500 2    50   ~ 0
1
Text Notes -1850 2500 2    50   ~ 0
1
Text Notes -1650 2500 2    50   ~ 0
0
Text Notes -1450 2500 2    50   ~ 0
?
Text Notes -7850 2500 2    50   ~ 0
0
Text Notes -7650 2500 2    50   ~ 0
0
Text Notes -7450 2500 2    50   ~ 0
0
Text Notes -7250 2500 2    50   ~ 0
0
Text Notes -7050 2500 2    50   ~ 0
0
Text Notes -6850 2500 2    50   ~ 0
0
Text Notes -6650 2500 2    50   ~ 0
0
Text Notes -6450 2500 2    50   ~ 0
0
Text Notes -6250 2500 2    50   ~ 0
0
Text Notes -6050 2500 2    50   ~ 0
0
Text Notes -5850 2500 2    50   ~ 0
0
Text Notes -5650 2500 2    50   ~ 0
0
Text Notes -5450 2500 2    50   ~ 0
0
Text Notes -5250 2500 2    50   ~ 0
0
Text Notes -5050 2500 2    50   ~ 0
0
Text Notes -4850 2500 2    50   ~ 0
0
Text Notes -4650 2500 2    50   ~ 0
0
Text Notes -4450 2500 2    50   ~ 0
0
Text Notes -4250 2500 2    50   ~ 0
0
Text Notes -4050 2500 2    50   ~ 0
0
Text Notes -3850 2500 2    50   ~ 0
0
Text Notes -3650 2500 2    50   ~ 0
0
Text Notes -3450 2500 2    50   ~ 0
0
Text Notes -3250 2500 2    50   ~ 0
0
Text Notes -1150 2400 2    50   ~ 0
1
Text Notes -1250 2500 2    50   ~ 0
?
Text Notes -950 2400 2    50   ~ 0
1
Text Notes -1050 2500 2    50   ~ 0
?
Text Notes -850 2500 2    50   ~ 0
?
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 2550 -3200 2550
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 2300 -3200 2300
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 2300 -1650 2550
Wire Notes Line style solid rgb(0, 192, 0)
	-3200 2300 -3200 2550
Wire Notes Line style solid rgb(192, 192, 0)
	-3250 2550 -3250 2300
Wire Notes Line style solid rgb(192, 192, 0)
	-3250 2300 -4800 2300
Wire Notes Line style solid rgb(192, 192, 0)
	-4800 2300 -4800 2550
Wire Notes Line style solid rgb(192, 192, 0)
	-4800 2550 -3250 2550
Wire Notes Line style solid rgb(192, 192, 0)
	-4850 2550 -4850 2300
Wire Notes Line style solid rgb(192, 192, 0)
	-4850 2300 -6400 2300
Wire Notes Line
	-6400 2300 -6400 2550
Wire Notes Line style solid rgb(192, 192, 0)
	-6400 2550 -4850 2550
Wire Notes Line
	-6450 2300 -6450 2550
Wire Notes Line
	-6450 2550 -8000 2550
Wire Notes Line
	-7850 2300 -6450 2300
Text Notes -2500 1650 2    50   ~ 0
??
Text Notes -2200 1650 2    50   ~ 0
??
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 2300 -1600 2550
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 2550 -50  2550
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 2300 -50  2300
Text Notes -3725 3000 1    50   ~ 0
C7
Text Notes -3525 3000 1    50   ~ 0
C6
Text Notes -3325 3000 1    50   ~ 0
C5
Text Notes -3125 3000 1    50   ~ 0
C4
Text Notes -2925 3000 1    50   ~ 0
C3
Text Notes -2725 3000 1    50   ~ 0
C2
Text Notes -2525 3000 1    50   ~ 0
C1
Text Notes -2325 3000 1    50   ~ 0
C0
Text Notes -3625 3150 1    50   ~ 0
D7
Text Notes -3425 3150 1    50   ~ 0
D6
Text Notes -3225 3150 1    50   ~ 0
D5
Text Notes -3025 3150 1    50   ~ 0
D4
Text Notes -2825 3150 1    50   ~ 0
D3
Text Notes -2625 3150 1    50   ~ 0
D2
Text Notes -2425 3150 1    50   ~ 0
D1
Text Notes -2225 3150 1    50   ~ 0
D0
Text Notes -2750 3300 2    50   ~ 0
Shift registers
Text Notes -2000 2250 2    50   ~ 0
address mark (C7/FE)
Text Notes -3700 2250 2    50   ~ 0
sync byte (00)
Text Notes -4900 2250 2    50   ~ 0
sync byte (00)
Wire Notes Line style dotted rgb(118, 118, 118)
	-2375 2400 -2375 2900
Wire Notes Line style dotted rgb(255, 0, 0)
	-2275 2500 -2275 3050
Wire Notes Line style dotted rgb(255, 0, 0)
	-2475 2500 -2475 3050
Wire Notes Line style dotted rgb(255, 0, 0)
	-2675 2500 -2675 3050
Wire Notes Line style dotted rgb(255, 0, 0)
	-2875 2500 -2875 3050
Wire Notes Line style dotted rgb(255, 0, 0)
	-3075 2500 -3075 3050
Wire Notes Line style dotted rgb(255, 0, 0)
	-3375 2400 -3375 2900
Wire Notes Line style dotted rgb(255, 0, 0)
	-3575 2400 -3575 2900
Wire Notes Line style dotted rgb(255, 0, 0)
	-3775 2400 -3775 2900
Wire Notes Line style dotted rgb(118, 118, 118)
	-3275 2500 -3275 3050
Wire Notes Line style dotted rgb(118, 118, 118)
	-3475 2500 -3475 3050
Wire Notes Line style dotted rgb(118, 118, 118)
	-3675 2500 -3675 3050
Wire Notes Line style dotted rgb(118, 118, 118)
	-2575 2400 -2575 2900
Wire Notes Line style dotted rgb(255, 0, 0)
	-3175 2400 -3175 2900
Wire Notes Line style dotted rgb(255, 0, 0)
	-2975 2400 -2975 2900
Wire Notes Line style dotted rgb(118, 118, 118)
	-2775 2400 -2775 2900
Wire Notes Line style solid
	-3800 3175 -3025 3175
Wire Notes Line style solid
	-3025 3175 -3025 2850
Wire Notes Line style solid
	-3025 2850 -3800 2850
Wire Notes Line style solid
	-3800 2850 -3800 3175
Wire Notes Line style solid
	-3000 2850 -3000 3175
Wire Notes Line style solid
	-3000 3175 -2225 3175
Wire Notes Line style solid
	-2225 3175 -2225 2850
Wire Notes Line style solid
	-2225 2850 -3000 2850
Text Notes -750 2400 2    50   ~ 0
1
Text Notes -550 2400 2    50   ~ 0
1
Text Notes -650 2500 2    50   ~ 0
?
Text Notes -350 2400 2    50   ~ 0
1
Text Notes -450 2500 2    50   ~ 0
?
Text Notes -150 2400 2    50   ~ 0
1
Text Notes -250 2500 2    50   ~ 0
?
Text Notes -50  2500 2    50   ~ 0
?
Text Notes -3650 1325 2    50   ~ 0
sync
Text Notes -3075 1350 2    50   ~ 0
addr\nmark
Text Notes -2350 1325 2    50   ~ 0
field data
Text Notes -2000 1500 2    50   ~ 0
...
Text Notes -2000 1650 2    50   ~ 0
...
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 1175 -3325 1175
Wire Notes Line style solid rgb(192, 192, 0)
	-3325 1175 -3325 1700
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 1175 -3025 1700
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 1700 -3275 1700
Wire Notes Line style solid rgb(128, 128, 128)
	-2975 1700 -2975 1175
Wire Notes Line style solid rgb(128, 128, 128)
	-2975 1175 -1900 1175
Wire Notes Line width 3 style solid
	-3300 1700 -3225 2300
Wire Notes Line width 3 style solid
	-3000 1700 -1625 2300
Wire Notes Line width 3 style solid
	-3900 1700 -6425 2300
Wire Notes Line width 3 style solid
	-4825 2300 -3600 1700
Wire Notes Line width 3 style solid
	-2675 1700 -25  2300
Wire Notes Line style solid rgb(0, 192, 0)
	-3275 1175 -3275 1700
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 1175 -3275 1175
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 1700 -3325 1700
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 1175 -4200 1700
Wire Notes Line style solid rgb(128, 128, 128)
	-1900 1175 -1900 1700
Wire Notes Line style solid rgb(128, 128, 128)
	-1900 1700 -2975 1700
Text Notes -875 2250 2    50   ~ 0
field data
Text Notes -4000 4725 2    50   ~ 0
FF
Text Notes -3700 4725 2    50   ~ 0
FF
Text Notes -3400 4725 2    50   ~ 0
FF
Text Notes -3100 4725 2    50   ~ 0
C7
Text Notes -2800 4725 2    50   ~ 0
FF
Text Notes -2500 4725 2    50   ~ 0
FF
Text Notes -2200 4725 2    50   ~ 0
FF
Text Notes -4000 4875 2    50   ~ 0
00
Text Notes -3100 4875 2    50   ~ 0
FE
Text Notes -3700 4875 2    50   ~ 0
00
Text Notes -3400 4875 2    50   ~ 0
00
Text Notes -2800 4875 2    50   ~ 0
??
Text Notes -4300 4725 2    50   ~ 0
Clock Hex
Text Notes -4300 4875 2    50   ~ 0
Data Hex
Text Notes -4350 5625 2    50   ~ 0
1
Text Notes -4150 5625 2    50   ~ 0
1
Text Notes -3950 5625 2    50   ~ 0
1
Text Notes -3750 5625 2    50   ~ 0
1
Text Notes -3550 5625 2    50   ~ 0
1
Text Notes -3350 5625 2    50   ~ 0
1
Text Notes -3150 5625 2    50   ~ 0
1
Text Notes -2950 5625 2    50   ~ 0
1
Text Notes -2750 5625 2    50   ~ 0
0
Text Notes -2550 5625 2    50   ~ 0
0
Text Notes -2350 5625 2    50   ~ 0
0
Text Notes -2150 5625 2    50   ~ 0
1
Text Notes -1950 5625 2    50   ~ 0
1
Text Notes -1750 5625 2    50   ~ 0
1
Text Notes -1550 5625 2    50   ~ 0
1
Text Notes -1350 5625 2    50   ~ 0
1
Text Notes -7550 5625 2    50   ~ 0
1
Text Notes -7350 5625 2    50   ~ 0
1
Text Notes -7150 5625 2    50   ~ 0
1
Text Notes -6950 5625 2    50   ~ 0
1
Text Notes -6750 5625 2    50   ~ 0
1
Text Notes -6550 5625 2    50   ~ 0
1
Text Notes -6350 5625 2    50   ~ 0
1
Text Notes -6150 5625 2    50   ~ 0
1
Text Notes -5950 5625 2    50   ~ 0
1
Text Notes -5750 5625 2    50   ~ 0
1
Text Notes -5550 5625 2    50   ~ 0
1
Text Notes -5350 5625 2    50   ~ 0
1
Text Notes -5150 5625 2    50   ~ 0
1
Text Notes -4950 5625 2    50   ~ 0
1
Text Notes -4750 5625 2    50   ~ 0
1
Text Notes -4550 5625 2    50   ~ 0
1
Text Notes -3050 5725 2    50   ~ 0
1
Text Notes -2850 5725 2    50   ~ 0
1
Text Notes -2650 5725 2    50   ~ 0
1
Text Notes -2450 5725 2    50   ~ 0
1
Text Notes -2250 5725 2    50   ~ 0
1
Text Notes -2050 5725 2    50   ~ 0
1
Text Notes -1850 5725 2    50   ~ 0
1
Text Notes -1650 5725 2    50   ~ 0
0
Text Notes -1450 5725 2    50   ~ 0
?
Text Notes -7850 5725 2    50   ~ 0
0
Text Notes -7650 5725 2    50   ~ 0
0
Text Notes -7450 5725 2    50   ~ 0
0
Text Notes -7250 5725 2    50   ~ 0
0
Text Notes -7050 5725 2    50   ~ 0
0
Text Notes -6850 5725 2    50   ~ 0
0
Text Notes -6650 5725 2    50   ~ 0
0
Text Notes -6450 5725 2    50   ~ 0
0
Text Notes -6250 5725 2    50   ~ 0
0
Text Notes -6050 5725 2    50   ~ 0
0
Text Notes -5850 5725 2    50   ~ 0
0
Text Notes -5650 5725 2    50   ~ 0
0
Text Notes -5450 5725 2    50   ~ 0
0
Text Notes -5250 5725 2    50   ~ 0
0
Text Notes -5050 5725 2    50   ~ 0
0
Text Notes -4850 5725 2    50   ~ 0
0
Text Notes -4650 5725 2    50   ~ 0
0
Text Notes -4450 5725 2    50   ~ 0
0
Text Notes -4250 5725 2    50   ~ 0
0
Text Notes -4050 5725 2    50   ~ 0
0
Text Notes -3850 5725 2    50   ~ 0
0
Text Notes -3650 5725 2    50   ~ 0
0
Text Notes -3450 5725 2    50   ~ 0
0
Text Notes -3250 5725 2    50   ~ 0
0
Text Notes -1150 5625 2    50   ~ 0
1
Text Notes -1250 5725 2    50   ~ 0
?
Text Notes -950 5625 2    50   ~ 0
1
Text Notes -1050 5725 2    50   ~ 0
?
Text Notes -850 5725 2    50   ~ 0
?
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 5775 -3200 5775
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 5525 -3200 5525
Wire Notes Line style solid rgb(0, 192, 0)
	-1650 5525 -1650 5775
Wire Notes Line style solid rgb(0, 192, 0)
	-3200 5525 -3200 5775
Wire Notes Line style solid rgb(192, 192, 0)
	-3250 5775 -3250 5525
Wire Notes Line style solid rgb(192, 192, 0)
	-3250 5525 -4800 5525
Wire Notes Line style solid rgb(192, 192, 0)
	-4800 5525 -4800 5775
Wire Notes Line style solid rgb(192, 192, 0)
	-4800 5775 -3250 5775
Wire Notes Line style solid rgb(192, 192, 0)
	-4850 5775 -4850 5525
Wire Notes Line style solid rgb(192, 192, 0)
	-4850 5525 -6400 5525
Wire Notes Line
	-6400 5525 -6400 5775
Wire Notes Line style solid rgb(192, 192, 0)
	-6400 5775 -4850 5775
Wire Notes Line
	-6450 5525 -6450 5775
Wire Notes Line
	-6450 5775 -8000 5775
Wire Notes Line
	-7850 5525 -6450 5525
Text Notes -2500 4875 2    50   ~ 0
??
Text Notes -2200 4875 2    50   ~ 0
??
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 5525 -1600 5775
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 5775 -50  5775
Wire Notes Line style solid rgb(128, 128, 128)
	-1600 5525 -50  5525
Text Notes -3125 6225 1    50   ~ 0
C7
Text Notes -2925 6225 1    50   ~ 0
C6
Text Notes -2725 6225 1    50   ~ 0
C5
Text Notes -2525 6225 1    50   ~ 0
C4
Text Notes -2325 6225 1    50   ~ 0
C3
Text Notes -2125 6225 1    50   ~ 0
C2
Text Notes -1925 6225 1    50   ~ 0
C1
Text Notes -1725 6225 1    50   ~ 0
C0
Text Notes -3025 6375 1    50   ~ 0
D7
Text Notes -2825 6375 1    50   ~ 0
D6
Text Notes -2625 6375 1    50   ~ 0
D5
Text Notes -2425 6375 1    50   ~ 0
D4
Text Notes -2225 6375 1    50   ~ 0
D3
Text Notes -2025 6375 1    50   ~ 0
D2
Text Notes -1825 6375 1    50   ~ 0
D1
Text Notes -1625 6375 1    50   ~ 0
D0
Text Notes -2150 6525 2    50   ~ 0
Shift registers
Text Notes -2000 5475 2    50   ~ 0
address mark (C7/FE)
Text Notes -3700 5475 2    50   ~ 0
sync byte (00)
Text Notes -4900 5475 2    50   ~ 0
sync byte (00)
Wire Notes Line style dotted rgb(118, 118, 118)
	-2375 5625 -2375 6125
Wire Notes Line style dotted rgb(118, 118, 118)
	-1675 5725 -1675 6275
Wire Notes Line style dotted rgb(255, 0, 0)
	-1875 5725 -1875 6275
Wire Notes Line style dotted rgb(255, 0, 0)
	-2075 5725 -2075 6275
Wire Notes Line style dotted rgb(255, 0, 0)
	-2275 5725 -2275 6275
Wire Notes Line style dotted rgb(255, 0, 0)
	-2475 5725 -2475 6275
Wire Notes Line style dotted rgb(255, 0, 0)
	-2175 5625 -2175 6125
Wire Notes Line style dotted rgb(255, 0, 0)
	-2975 5625 -2975 6125
Wire Notes Line style dotted rgb(255, 0, 0)
	-3175 5625 -3175 6125
Wire Notes Line style dotted rgb(118, 118, 118)
	-2675 5725 -2675 6275
Wire Notes Line style dotted rgb(192, 0, 0)
	-2875 5725 -2875 6275
Wire Notes Line style dotted rgb(192, 0, 0)
	-3075 5725 -3075 6275
Wire Notes Line style dotted rgb(118, 118, 118)
	-2575 5625 -2575 6125
Wire Notes Line style dotted rgb(255, 0, 0)
	-1975 5625 -1975 6125
Wire Notes Line style dotted rgb(255, 0, 0)
	-1775 5625 -1775 6125
Wire Notes Line style dotted rgb(118, 118, 118)
	-2775 5625 -2775 6125
Wire Notes Line style solid
	-3200 6400 -2425 6400
Wire Notes Line style solid
	-2425 6400 -2425 6075
Wire Notes Line style solid
	-2425 6075 -3200 6075
Wire Notes Line style solid
	-3200 6075 -3200 6400
Wire Notes Line style solid
	-2400 6075 -2400 6400
Wire Notes Line style solid
	-2400 6400 -1625 6400
Wire Notes Line style solid
	-1625 6400 -1625 6075
Wire Notes Line style solid
	-1625 6075 -2400 6075
Text Notes -750 5625 2    50   ~ 0
1
Text Notes -550 5625 2    50   ~ 0
1
Text Notes -650 5725 2    50   ~ 0
?
Text Notes -350 5625 2    50   ~ 0
1
Text Notes -450 5725 2    50   ~ 0
?
Text Notes -150 5625 2    50   ~ 0
1
Text Notes -250 5725 2    50   ~ 0
?
Text Notes -50  5725 2    50   ~ 0
?
Text Notes -3650 4550 2    50   ~ 0
sync
Text Notes -3075 4575 2    50   ~ 0
addr\nmark
Text Notes -2350 4550 2    50   ~ 0
field data
Text Notes -2000 4725 2    50   ~ 0
...
Text Notes -2000 4875 2    50   ~ 0
...
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 4400 -3325 4400
Wire Notes Line style solid rgb(192, 192, 0)
	-3325 4400 -3325 4925
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 4400 -3025 4925
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 4925 -3275 4925
Wire Notes Line style solid rgb(128, 128, 128)
	-2975 4925 -2975 4400
Wire Notes Line style solid rgb(128, 128, 128)
	-2975 4400 -1900 4400
Wire Notes Line width 3 style solid
	-3300 4925 -3225 5525
Wire Notes Line width 3 style solid
	-3000 4925 -1625 5525
Wire Notes Line width 3 style solid
	-3900 4925 -6425 5525
Wire Notes Line width 3 style solid
	-4825 5525 -3600 4925
Wire Notes Line width 3 style solid
	-2675 4925 -25  5525
Wire Notes Line style solid rgb(0, 192, 0)
	-3275 4400 -3275 4925
Wire Notes Line style solid rgb(0, 192, 0)
	-3025 4400 -3275 4400
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 4925 -3325 4925
Wire Notes Line style solid rgb(192, 192, 0)
	-4200 4400 -4200 4925
Wire Notes Line style solid rgb(128, 128, 128)
	-1900 4400 -1900 4925
Wire Notes Line style solid rgb(128, 128, 128)
	-1900 4925 -2975 4925
Text Notes -875 5475 2    50   ~ 0
field data
$Sheet
S 1450 4050 1300 950 
U 63305740
F0 "MoreDiagrams" 50
F1 "morediagrams.sch" 50
$EndSheet
$EndSCHEMATC
