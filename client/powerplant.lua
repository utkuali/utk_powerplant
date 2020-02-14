ESX = nil
local Program = 0
local scaleform = nil
local lives = 5
local ClickReturn
local SorF = false
local Hacking = false
local UsingComputer = false
local RouletteWords = {
    "UTK4EVER",
    "LOVEFIST",
    "SUPERDAN",
    "DOCTRINE",
    "IMPERIUS",
    "DELIRIUM",
    "MAETHRIL"
}
UTK = {
    guards = 1972614767,
    police = 2046537925,
    others = 1403091332,
    hackdone = false,
    hacksuccess = false,
    hackfail = false,
    hackres = false,
    showtime = 60,
    currenthack,
    planted1,
    planted2,
    planted3,
    planted4,
    planted5,
    planted6,
    hacked1,
    hacked2,
    hacked3,
    hacked4,
    hacked5,
    hacked6,

    info = {},
    --[[prison = {
        planted1,
        planted2,
        planted3,
        planted4,
        planted6,
        planted7,
        planted8,
        planted9,
        planted10,
        planted11,
        planted12,
    },]]
    locations ={
        loud = {
            start = {x=2655.91, y=1641.92, z=24.59},
            bomb1 = {x=2809.77, y=1547.20, z=24.53},
            bomb2 = {x=2800.69, y=1513.80, z=24.53},
            bomb3 = {x=2792.19, y=1482.00, z=24.53},
            bomb4 = {x=2771.49, y=1548.19, z=24.50},
            bomb5 = {x=2764.38, y=1521.63, z=24.50},
            bomb6 = {x=2750.77, y=1470.91, z=24.50}
        },
        silent = {
            start = {x=2830.83, y=1673.68, z=24.66, h=267.51},
            hack1 = {x=2864.92, y=1509.36, z=23.50, h=168.81},
            hack2 = {x=2768.95, y=1392.27, z=23.50, h=270.13},
            hack3 = {x=2716.51, y=1463.28, z=23.50, h=343.34},
            hack4 = {x=2670.41, y=1625.46, z=23.50, h=87.95},
            hack5 = {x=2722.81, y=1509.28, z=43.15, h=256.79},
            hack6 = {x=2714.67, y=1479.15, z=43.15, h=256.79}
        },
        --[[prison = {
            bomb1 = {x=1772.07, y=2509.74, z=55.14, h=126.06},
            bomb2 = {x=1688.72, y=2445.00, z=55.16, h=87.43},
            bomb3 = {x=1683.36, y=2450.05, z=55.16, h=86.68},
            bomb4 = {x=1687.31, y=2462.92, z=55.16, h=89.49},
            bomb5 = {x=1638.93, y=2476.70, z=55.19, h=42.40},
            bomb6 = {x=1621.12, y=2463.05, z=55.19, h=49.71},
            bomb7 = {x=1606.65, y=2475.19, z=55.19, h=55.93},
            bomb8 = {x=1605.84, y=2484.23, z=55.19, h=142.23},
            bomb9 = {x=1596,00, y=2534.48, z=55.19, h=3.45},
            bomb10 = {x=1574.02, y=2557.91, z=55.19, h=2.07},
            bomb11 = {x=1579.02, y=2563.22, z=55.19, h=358.55},
            bomb12 = {x=1591.84, y=2559.49, z=55.19, h=6.10}
        }]]
    },
    texts = {
        blackout = "BLACKOUT!",
        loud = {
            start = "[~g~E~w~] Start ~r~LOUD~w~ Power Plant hit",
            bomb = "[~g~E~w~] Plant C4 Explosives for main generator",
            backup = "[~g~E~w~] Plant C4 Explosives for backup generator",
            time = "200 seconds to blackout!",
            planted = "C4 planted"
        },
        silent = {
            start = "[~g~E~w~] Start ~r~SILENT~w~ Power Plant hit",
            hack = "[~g~E~w~] Start hacking",
            plant = "[~g~E~w~] Plant C4 charge",
            time = "50 seconds to blackout!",
            caught = "You have seen!",
            hacked = "Hack successful"
        },
        --[[prison = {
            bomb = "[~g~E~w~] Plant C4 to power generator"
        }]]
    },
    npc = {
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2788.70, y= 1573.78, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2776.38, y= 1526.86, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2768.34, y= 1479.04, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2785.88, y= 1635.55, z= 24.50, h = 5.39  , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2786.35, y= 1647.95, z= 24.50, h = 186.69, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2826.07, y= 1554.79, z= 24.57, h = 76.41 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2811.56, y= 1469.77, z= 24.77, h = 348.38, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2761.70, y= 1469.50, z= 47.95, h = 347.11, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 2778.69, y= 1447.29, z= 24.57, h = 76.66 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2745.15, y= 1452.82, z= 24.49, h = 168.40, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2807.43, y= 1504.16, z= 24.73, h = 80.54 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2839.41, y= 1517.75, z= 24.73, h = 346.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2846.00, y= 1533.27, z= 24.73, h = 164.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2796.50, y= 1470.91, z= 34.35, h = 343.56, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2844.99, y= 1458.65, z= 32.75, h = 86.90 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2764.37, y= 1482.91, z= 30.79, h = 258.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2746.92, y= 1496.42, z= 38.29, h = 258.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2709.12, y= 1509.42, z= 24.50, h = 71.90 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2735.39, y= 1559.20, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2733.80, y= 1551.47, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2765.91, y= 1561.49, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2751.40, y= 1565.97, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2758.31, y= 1537.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2741.76, y= 1541.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2750.47, y= 1527.15, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2734.70, y= 1531.33, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2746.28, y= 1476.46, z= 24.50, h = 359.14, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2761.11, y= 1527.15, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2770.64, y= 1563.69, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2751.78, y= 1451.11, z= 24.50, h = 161.89, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2709.18, y= 1466.70, z= 24.50, h = 96.71 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2703.85, y= 1487.98, z= 24.50, h = 79.07 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2707.36, y= 1473.13, z= 42.25, h = 77.42 , m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
    },
    --[[npc2 = {
        {a = nil, x= 1538.99, y= 2583.59, z= 62.70, h = 255.91, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1572.66, y= 2677.80, z= 62.75, h = 218.38, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1650.53, y= 2754.01, z= 62.89, h = 197.42, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1772.23, y= 2758.93, z= 62.90, h = 157.42, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1845.03, y= 2699.09, z= 62.98, h = 97.77, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1819.88, y= 2621.54, z= 62.97, h = 83.97, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1820.57, y= 2477.26, z= 62.70, h = 59.31, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1759.91, y= 2413.98, z= 62.73, h = 22.29, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1660.83, y= 2398.32, z= 62.74, h = 332.87, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1544.34, y= 2470.99, z= 62.73, h = 288.38, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1829.77, y= 2605.15, z= 45.57, h = 266.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1823.38, y= 2602.17, z= 45.60, h = 3.53, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1805.52, y= 2614.10, z= 45.55, h = 181.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.37, y= 2608.51, z= 45.56, h = 272.84, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.26, y= 2601.28, z= 45.56, h = 272.84, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1757.52, y= 2599.39, z= 45.56, h = 1.66, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1757.42, y= 2611.64, z= 45.56, h = 180.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1792.16, y= 2622.11, z= 55.47, h = 273.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.65, y= 2565.42, z= 55.47, h = 273.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1761.75, y= 2565.33, z= 55.47, h = 144.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.40, y= 2563.46, z= 55.47, h = 183.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1718.90, y= 2609.21, z= 55.47, h = 269.94, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1725.16, y= 2595.53, z= 55.47, h = 4.57, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.41, y= 2599.38, z= 45.56, h = 91.76, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.45, y= 2612.55, z= 45.56, h = 91.76, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1758.85, y= 2515.00, z= 55.47, h = 81.18, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1740.79, y= 2504.65, z= 55.41, h = 345.99, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1703.22, y= 2478.54, z= 55.44, h = 43.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1682.51, y= 2478.49, z= 55.43, h = 314.92, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1639.35, y= 2491.35, z= 55.43, h = 10.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1623.48, y= 2504.39, z= 55.42, h = 271.59, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1607.34, y= 2543.41, z= 55.42, h = 318.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1607.20, y= 2564.06, z= 55.42, h = 226.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1665.57, y= 2565.75, z= 55.44, h = 136.68, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1692.11, y= 2553.21, z= 55.04, h = 274.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1689.64, y= 2554.01, z= 55.04, h = 92.93, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1686.41, y= 2528.88, z= 54.88, h = 138.44, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1695.60, y= 2528.62, z= 54.88, h = 217.15, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.41, y= 2493.29, z= 45.57, h = 302.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1754.90, y= 2462.44, z= 45.57, h = 219.48, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1720.63, y= 2439.99, z= 45.57, h = 269.31, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1720.97, y= 2486.40, z= 45.56, h = 271.90, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1669.82, y= 2435.15, z= 45.57, h = 183.11, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1657.73, y= 2485.73, z= 45.56, h = 230.18, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1602.72, y= 2465.36, z= 45.56, h = 147.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1612.63, y= 2519.51, z= 45.56, h = 320.88, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1610.84, y= 2525.66, z= 45.56, h = 270.01, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1572.23, y= 2525.52, z= 45.56, h = 168.88, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1563.53, y= 2576.77, z= 45.56, h = 91.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1614.88, y= 2582.00, z= 45.56, h = 15.13, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1625.49, y= 2568.08, z= 45.56, h = 89.97, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1614.13, y= 2567.08, z= 45.56, h = 192.05, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.66, y= 2567.73, z= 45.56, h = 184.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1645.31, y= 2585.75, z= 45.56, h = 4.92, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1630.54, y= 2589.73, z= 52.62, h = 269.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1630.59, y= 2607.88, z= 52.62, h = 317.87, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1652.17, y= 2641.62, z= 51.94, h = 231.48, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1650.93, y= 2655.11, z= 55.43, h = 271.32, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.21, y= 2670.71, z= 55.42, h = 187.05, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1700.54, y= 2687.10, z= 55.42, h = 230.61, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.11, y= 2686.94, z= 55.42, h = 138.46, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1759.80, y= 2676.15, z= 55.42, h = 193.91, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1776.85, y= 2664.39, z= 55.42, h = 107.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1619.24, y= 2646.28, z= 45.56, h = 269.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1788.47, y= 2650.87, z= 45.56, h = 235.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1812.25, y= 2692.67, z= 45.56, h = 322.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.20, y= 2651.68, z= 55.45, h = 308.99, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1758.93, y= 2616.35, z= 55.44, h = 95.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1662.82, y= 2618.78, z= 55.44, h = 49.23, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1689.59, y= 2633.18, z= 55.04, h = 90.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1694.95, y= 2658.15, z= 54.88, h = 292.31, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1686.13, y= 2658.48, z= 54.88, h = 42.36, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1688.54, y= 2621.66, z= 45.56, h = 4.94, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.44, y= 2650.35, z= 45.56, h = 44.26, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1609.93, y= 2666.52, z= 45.56, h = 142.55, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1639.03, y= 2708.85, z= 45.56, h = 49.45, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1681.35, y= 2681.35, z= 45.58, h = 199.83, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1687.43, y= 2730.70, z= 45.56, h = 1.59, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1738.63, y= 2725.92, z= 45.57, h = 270.20, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1739.73, y= 2679.80, z= 45.57, h = 178.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1774.51, y= 2719.32, z= 45.56, h = 323.29, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1772.19, y= 2526.95, z= 45.56, h = 297.41, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1775.75, y= 2537.90, z= 45.56, h = 72.36, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1715.93, y= 2565.70, z= 55.44, h = 214.50, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.84, y= 2563.32, z= 55.44, h = 154.27, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.48, y= 2595.23, z= 55.44, h = 1.83, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        --[[{a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
    }]]
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()
    TriggerServerEvent("utk_pb:checkblackout")
    AddRelationshipGroup("guards")
    AddRelationshipGroup("police")
    AddRelationshipGroup("others")
    SetRelationshipBetweenGroups(5, UTK.guards, UTK.others)
    SetRelationshipBetweenGroups(0, UTK.guards, UTK.police)
    UTK:GetStage()
end)

function UTK:GetStage(...)
    ESX.TriggerServerCallback("utk_pb:GetData", function(output)
        self.info = output
        return self:HandleInfo()
    end)
end
function UTK:HandleInfo(...)
    if not self.info.locked then
        if self.info.stage == 0 then
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(1)
                    local pedcoords = GetEntityCoords(PlayerPedId())
                    local startloud = GetDistanceBetweenCoords(pedcoords, self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z, true)
                    local startsilent = GetDistanceBetweenCoords(pedcoords, self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z, true)

                    if startloud <= 6 then
                        DrawText3D(self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z, self.texts.loud.start, 0.40)
                        DrawMarker(1, self.locations.loud.start.x, self.locations.loud.start.y, self.locations.loud.start.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if startloud <= 1.5 and IsControlJustReleased(0, 38) then
                            TriggerServerEvent("utk_pb:lock")
                            self.info.stage = 1
                            self.info.style = 1
                            return self:HandleInfo()
                        end
                    end
                    if startsilent <= 6 then
                        DrawText3D(self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z, self.texts.silent.start, 0.40)
                        DrawMarker(1, self.locations.silent.start.x, self.locations.silent.start.y, self.locations.silent.start.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                        if startsilent <= 1.5 and IsControlJustReleased(0, 38) then
                            TriggerServerEvent("utk_pb:lock")
                            self.info.stage = 1
                            self.info.style = 2
                            self.currenthack = 0
                            return self:Hack()
                        end
                    end
                end
            end)
        elseif self.info.stage == 1 then
            if self.info.style == 1 then
                self:NPCSpawn()
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1)
                        local pedcoords = GetEntityCoords(PlayerPedId())

                        if not UTK.planted1 then
                            local bomb1 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, true)

                            if bomb1 <= 5 and not UTK.planted1 then
                                DrawText3D(self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, self.texts.loud.backup, 0.40)
                                DrawMarker(1, self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb1 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted1 = true
                                            self.currentplant = 1
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if not UTK.planted2 then
                            local bomb2 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, true)

                            if bomb2 <= 5 and not UTK.planted2 then
                                DrawText3D(self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, self.texts.loud.backup, 0.40)
                                DrawMarker(1, self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb2 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted2 = true
                                            self.currentplant = 2
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if not UTK.planted3 then
                            local bomb3 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, true)

                            if bomb3 <= 5 and not UTK.planted3 then
                                DrawText3D(self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, self.texts.loud.backup, 0.40)
                                DrawMarker(1, self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb3 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted3 = true
                                            self.currentplant = 3
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if not UTK.planted4 then
                            local bomb4 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, true)

                            if bomb4 <= 5 and not UTK.planted4 then
                                DrawText3D(self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb4 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted4 = true
                                            self.currentplant = 4
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if not UTK.planted5 then
                            local bomb5 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, true)

                            if bomb5 <= 5 and not UTK.planted5 then
                                DrawText3D(self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb5 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted5 = true
                                            self.currentplant = 5
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if not UTK.planted6 then
                            local bomb6 = GetDistanceBetweenCoords(pedcoords, self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, true)

                            if bomb6 <= 5 and not UTK.planted6 then
                                DrawText3D(self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, self.texts.loud.bomb, 0.40)
                                DrawMarker(1, self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if bomb6 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            UTK.planted6 = true
                                            self.currentplant = 6
                                            TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                            self:PlantBomb()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                        end
                                    end, "normal_c4")
                                end
                            end
                        end
                        if UTK.planted1 and UTK.planted2 and UTK.planted3 and UTK.planted4 and UTK.planted5 and UTK.planted6 then
                            self.info.stage = 2
                            return self:HandleInfo()
                        end
                    end
                end)
            elseif self.info.style == 2 then
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1)
                        local pedcoords = GetEntityCoords(PlayerPedId())

                        if not UTK.hacked1 then
                            local hack1 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z, true)

                            if hack1 <= 5 and not UTK.hacked1 then
                                DrawText3D(self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z+1, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack1.x, self.locations.silent.hack1.y, self.locations.silent.hack1.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack1 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = 1
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have hacker laptop.")
                                        end
                                    end, "laptop_h")
                                end
                            end
                        end
                        if not UTK.hacked2 then
                            local hack2 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z, true)

                            if hack2 <= 5 and not UTK.hacked2 then
                                DrawText3D(self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z+1, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack2.x, self.locations.silent.hack2.y, self.locations.silent.hack2.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack2 <= 1.5 and  IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = 2
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have hacker laptop.")
                                        end
                                    end, "laptop_h")
                                end
                            end
                        end
                        if not UTK.hacked3 then
                            local hack3 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z, true)

                            if hack3 <= 5 and not UTK.hacked3 then
                                DrawText3D(self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z+1, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack3.x, self.locations.silent.hack3.y, self.locations.silent.hack3.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack3 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = 3
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have hacker laptop.")
                                        end
                                    end, "laptop_h")
                                end
                            end
                        end
                        if not UTK.hacked4 then
                            local hack4 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z, true)

                            if hack4 <= 5 and not UTK.hacked4 then
                                DrawText3D(self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z+1, self.texts.silent.hack, 0.40)
                                DrawMarker(1, self.locations.silent.hack4.x, self.locations.silent.hack4.y, self.locations.silent.hack4.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack4 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = 4
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have hacker laptop.")
                                        end
                                    end, "laptop_h")
                                end
                            end
                        end
                        if not UTK.hacked5 then
                            local hack5 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z, true)

                            if hack5 <= 5 and not UTK.hacked5 then
                                DrawText3D(self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z+1, self.texts.silent.plant, 0.40)
                                DrawMarker(1, self.locations.silent.hack5.x, self.locations.silent.hack5.y, self.locations.silent.hack5.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack5 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = "hack1"
                                            TriggerServerEvent("utk_pb:removeItem", "mini_c4")
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have mini C4.")
                                        end
                                    end, "mini_c4")
                                end
                            end
                        end
                        if not UTK.hacked6 then
                            local hack6 = GetDistanceBetweenCoords(pedcoords, self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z, true)

                            if hack6 <= 5 and not UTK.hacked6 then
                                DrawText3D(self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z+1, self.texts.silent.plant, 0.40)
                                DrawMarker(1, self.locations.silent.hack6.x, self.locations.silent.hack6.y, self.locations.silent.hack6.z , 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                                if hack6 <= 1.5 and IsControlJustReleased(0, 38) then
                                    ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                        if cb then
                                            self.currenthack = "hack2"
                                            TriggerServerEvent("utk_pb:removeItem", "mini_c4")
                                            self:Hack()
                                        elseif not cb then
                                            exports['mythic_notify']:SendAlert("error", "You don't have mini C4.")
                                        end
                                    end, "mini_c4")
                                end
                            end
                        end
                        if UTK.hacked1 and UTK.hacked2 and UTK.hacked3 and UTK.hacked4 and UTK.hacked5 and UTK.hacked6 then
                            self.info.stage = 2
                            return self:HandleInfo()
                        end
                    end
                end)
            end
        elseif self.info.stage == 2 then
            if self.info.style == 1 then
                UTK.showtime = 60
                self.info.stage = 3
                self.info.locked = true
                self:Blackout()
                TriggerServerEvent("utk_pb:updateUTK", self)
                return
            elseif self.info.style == 2 then
                UTK.showtime = 60
                self.info.stage = 3
                self.info.locked = true
                self:Blackout()
                TriggerServerEvent("utk_pb:updateUTK", self)
                return
            end
        end
    --[[elseif self.info.locked then -- don't enable this, it's for prisonbreak but it's not finished
        print("3")
        if self.info.stage == 3 then
            print("4")
            self:NPCSpawnPrison()
            print("5")
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(1)
                    local coord = GetEntityCoords(PlayerPedId())

                    if not UTK.prison.planted1 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb1.x, self.locations.prison.bomb1.y, self.locations.prison.bomb1.z, true)

                        if dst <= 5 and not UTK.prison.planted1 then
                            DrawText3D(self.locations.prison.bomb1.x, self.locations.prison.bomb1.y, self.locations.prison.bomb1.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb1.x, self.locations.prison.bomb1.y, self.locations.prison.bomb1.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted1 = true
                                        self.currentplant = 2.1
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted2 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb2.x, self.locations.prison.bomb2.y, self.locations.prison.bomb2.z, true)

                        if dst <= 5 and not UTK.prison.planted2 then
                            DrawText3D(self.locations.prison.bomb2.x, self.locations.prison.bomb2.y, self.locations.prison.bomb2.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb2.x, self.locations.prison.bomb2.y, self.locations.prison.bomb2.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted2 = true
                                        self.currentplant = 2.2
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted3 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb3.x, self.locations.prison.bomb3.y, self.locations.prison.bomb3.z, true)

                        if dst <= 5 and not UTK.prison.planted3 then
                            DrawText3D(self.locations.prison.bomb3.x, self.locations.prison.bomb3.y, self.locations.prison.bomb3.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb3.x, self.locations.prison.bomb3.y, self.locations.prison.bomb3.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted3 = true
                                        self.currentplant = 2.3
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted4 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb4.x, self.locations.prison.bomb4.y, self.locations.prison.bomb4.z, true)

                        if dst <= 5 and not UTK.prison.planted4 then
                            DrawText3D(self.locations.prison.bomb4.x, self.locations.prison.bomb4.y, self.locations.prison.bomb4.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb4.x, self.locations.prison.bomb4.y, self.locations.prison.bomb4.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted4 = true
                                        self.currentplant = 2.4
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted5 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb5.x, self.locations.prison.bomb5.y, self.locations.prison.bomb5.z, true)

                        if dst <= 5 and not UTK.prison.planted5 then
                            DrawText3D(self.locations.prison.bomb5.x, self.locations.prison.bomb5.y, self.locations.prison.bomb5.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb5.x, self.locations.prison.bomb5.y, self.locations.prison.bomb5.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted5 = true
                                        self.currentplant = 2.5
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted6 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb6.x, self.locations.prison.bomb6.y, self.locations.prison.bomb6.z, true)

                        if dst <= 5 and not UTK.prison.planted6 then
                            DrawText3D(self.locations.prison.bomb6.x, self.locations.prison.bomb6.y, self.locations.prison.bomb6.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb6.x, self.locations.prison.bomb6.y, self.locations.prison.bomb6.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted6 = true
                                        self.currentplant = 2.6
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted7 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb7.x, self.locations.prison.bomb7.y, self.locations.prison.bomb7.z, true)

                        if dst <= 5 and not UTK.prison.planted7 then
                            DrawText3D(self.locations.prison.bomb7.x, self.locations.prison.bomb7.y, self.locations.prison.bomb7.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb7.x, self.locations.prison.bomb7.y, self.locations.prison.bomb7.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted7 = true
                                        self.currentplant = 2.7
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted8 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb8.x, self.locations.prison.bomb8.y, self.locations.prison.bomb8.z, true)

                        if dst <= 5 and not UTK.prison.planted8 then
                            DrawText3D(self.locations.prison.bomb8.x, self.locations.prison.bomb8.y, self.locations.prison.bomb8.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb8.x, self.locations.prison.bomb8.y, self.locations.prison.bomb8.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted8 = true
                                        self.currentplant = 2.8
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted9 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb9.x, self.locations.prison.bomb9.y, self.locations.prison.bomb9.z, true)

                        if dst <= 5 and not UTK.prison.planted9 then
                            DrawText3D(self.locations.prison.bomb9.x, self.locations.prison.bomb9.y, self.locations.prison.bomb9.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb9.x, self.locations.prison.bomb9.y, self.locations.prison.bomb9.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted9 = true
                                        self.currentplant = 2.9
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted10 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb10.x, self.locations.prison.bomb10.y, self.locations.prison.bomb10.z, true)

                        if dst <= 5 and not UTK.prison.planted10 then
                            DrawText3D(self.locations.prison.bomb10.x, self.locations.prison.bomb10.y, self.locations.prison.bomb10.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb10.x, self.locations.prison.bomb10.y, self.locations.prison.bomb10.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted10 = true
                                        self.currentplant = 2.10
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted11 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb11.x, self.locations.prison.bomb11.y, self.locations.prison.bomb11.z, true)

                        if dst <= 5 and not UTK.prison.planted11 then
                            DrawText3D(self.locations.prison.bomb11.x, self.locations.prison.bomb11.y, self.locations.prison.bomb11.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb11.x, self.locations.prison.bomb11.y, self.locations.prison.bomb11.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted11 = true
                                        self.currentplant = 2.11
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if not UTK.prison.planted12 then
                        local dst = GetDistanceBetweenCoords(coord, self.locations.prison.bomb12.x, self.locations.prison.bomb12.y, self.locations.prison.bomb12.z, true)

                        if dst <= 5 and not UTK.prison.planted12 then
                            DrawText3D(self.locations.prison.bomb12.x, self.locations.prison.bomb12.y, self.locations.prison.bomb12.z, self.texts.prison.bomb, 0.40)
                            DrawMarker(1, self.locations.prison.bomb12.x, self.locations.prison.bomb12.y, self.locations.prison.bomb12.z - 1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.8, 236, 80, 80, 155, false, false, 2, false, 0, 0, 0, 0)
                            if dst <= 1.5 and IsControlJustReleased(0, 38) then
                                ESX.TriggerServerCallback("utk_pb:checkItem", function(cb)
                                    if cb then
                                        UTK.prison.planted12 = true
                                        self.currentplant = 2.12
                                        TriggerServerEvent("utk_pb:removeItem", "normal_c4")
                                        self:PlantBomb()
                                    elseif not cb then
                                        exports['mythic_notify']:SendAlert("error", "You don't have C4 charge.")
                                    end
                                end, "normal_c4")
                            end
                        end
                    end
                    if UTK.prison.planted1 and UTK.prison.planted2 and UTK.prison.planted3 and UTK.prison.planted4 and UTK.prison.planted5 and UTK.prison.planted6 and UTK.prison.planted7 and UTK.prison.planted8 and UTK.prison.planted9 and UTK.prison.planted10 and UTK.prison.planted11 and UTK.prison.planted12 then
                        self.info.stage = 0
                        self.info.style = nil
                        self.info.locked = true
                        return TriggerServerEvent("utk_pb:updateUTK", self)
                    end
                end
            end)
        end]]
    end
end
function HandlePlayers()
    if PlayerData.job.name == "police" then
        SetPedRelationshipGroupHash(PlayerPedId(), UTK.police)
    else
        SetPedRelationshipGroupHash(PlayerPedId(), UTK.others)
    end
end
function UTK:PlantBomb(...)
    if self.currentplant == 1 then
        loc = self.locations.loud.bomb1
        heading = 71.85
    elseif self.currentplant == 2 then
        loc = self.locations.loud.bomb2
        heading = 71.85
    elseif self.currentplant == 3 then
        loc = self.locations.loud.bomb3
        heading = 71.85
    elseif self.currentplant == 4 then
        loc = self.locations.loud.bomb4
        heading = 71.85
    elseif self.currentplant == 5 then
        loc = self.locations.loud.bomb5
        heading = 71.85
    elseif self.currentplant == 6 then
        loc = self.locations.loud.bomb6
        heading = 71.85
    elseif self.currentplant == "hack1" then
        loc = self.locations.silent.hack5
        loc.x = loc.x + 1.42
        loc.y = loc.y - 0.70
        loc.z = loc.z + 1
        heading = 254.35
    elseif self.currentplant == "hack2" then
        loc = self.locations.silent.hack6
        loc.x = loc.x + 1.42
        loc.y = loc.y - 0.70
        loc.z = loc.z + 1
        heading = 254.35
    elseif self.currentplant == 2.1 then
        loc.x = self.locations.prison.bomb1.x
        loc.y = self.locations.prison.bomb1.y
        loc.z = self.locations.prison.bomb1.z
        heading = self.locations.prison.bomb1.h
    elseif self.currentplant == 2.2 then
        loc.x = self.locations.prison.bomb2.x
        loc.y = self.locations.prison.bomb2.y
        loc.z = self.locations.prison.bomb2.z
        heading = self.locations.prison.bomb2.h
    elseif self.currentplant == 2.3 then
        loc.x = self.locations.prison.bomb3.x
        loc.y = self.locations.prison.bomb3.y
        loc.z = self.locations.prison.bomb3.z
        heading = self.locations.prison.bomb3.h
    elseif self.currentplant == 2.4 then
        loc.x = self.locations.prison.bomb4.x
        loc.y = self.locations.prison.bomb4.y
        loc.z = self.locations.prison.bomb4.z
        heading = self.locations.prison.bomb4.h
    elseif self.currentplant == 2.5 then
        loc.x = self.locations.prison.bomb5.x
        loc.y = self.locations.prison.bomb5.y
        loc.z = self.locations.prison.bomb5.z
        heading = self.locations.prison.bomb5.h
    elseif self.currentplant == 2.6 then
        loc.x = self.locations.prison.bomb6.x
        loc.y = self.locations.prison.bomb6.y
        loc.z = self.locations.prison.bomb6.z
        heading = self.locations.prison.bomb6.h
    elseif self.currentplant == 2.7 then
        loc.x = self.locations.prison.bomb7.x
        loc.y = self.locations.prison.bomb7.y
        loc.z = self.locations.prison.bomb7.z
        heading = self.locations.prison.bomb7.h
    elseif self.currentplant == 2.8 then
        loc.x = self.locations.prison.bomb8.x
        loc.y = self.locations.prison.bomb8.y
        loc.z = self.locations.prison.bomb8.z
        heading = self.locations.prison.bomb8.h
    elseif self.currentplant == 2.9 then
        loc.x = self.locations.prison.bomb9.x
        loc.y = self.locations.prison.bomb9.y
        loc.z = self.locations.prison.bomb9.z
        heading = self.locations.prison.bomb9.h
    elseif self.currentplant == 2.10 then
        loc.x = self.locations.prison.bomb10.x
        loc.y = self.locations.prison.bomb10.y
        loc.z = self.locations.prison.bomb10.z
        heading = self.locations.prison.bomb10.h
    elseif self.currentplant == 2.11 then
        loc.x = self.locations.prison.bomb11.x
        loc.y = self.locations.prison.bomb11.y
        loc.z = self.locations.prison.bomb11.z
        heading = self.locations.prison.bomb11.h
    elseif self.currentplant == 2.12 then
        loc.x = self.locations.prison.bomb12.x
        loc.y = self.locations.prison.bomb12.y
        loc.z = self.locations.prison.bomb12.z
        heading = self.locations.prison.bomb12.h
    end

    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("prop_bomb_01")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasModelLoaded("prop_bomb_01")do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, heading)
    Citizen.Wait(100)
    local rot = vec3(GetEntityRotation(ped))
    local bagscene = NetworkCreateSynchronisedScene(loc.x - 0.70, loc.y + 0.50, loc.z, rot, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), loc.x, loc.y, loc.z,  true,  true, false)

    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    exports['progressBars']:startUI(4500, "Planting")
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("prop_bomb_01"), x, y, z + 0.2,  true,  true, true)

    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(3000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    NetworkStopSynchronisedScene(bagscene)
    exports['mythic_notify']:SendAlert("success", "C4 Planted")
    if self.currentplant == "hack1" then
        SmallExp(1)
    elseif self.currentplant == "hack2" then
        SmallExp(2)
    elseif self.currentplant == 2.1 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb1.x, self.locations.prison.bomb1.y, self.locations.prison.bomb1.z))
    elseif self.currentplant == 2.2 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb2.x, self.locations.prison.bomb2.y, self.locations.prison.bomb2.z))
    elseif self.currentplant == 2.3 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb3.x, self.locations.prison.bomb3.y, self.locations.prison.bomb3.z))
    elseif self.currentplant == 2.4 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb4.x, self.locations.prison.bomb4.y, self.locations.prison.bomb4.z))
    elseif self.currentplant == 2.5 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb5.x, self.locations.prison.bomb5.y, self.locations.prison.bomb5.z))
    elseif self.currentplant == 2.6 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb6.x, self.locations.prison.bomb6.y, self.locations.prison.bomb6.z))
    elseif self.currentplant == 2.7 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb7.x, self.locations.prison.bomb7.y, self.locations.prison.bomb7.z))
    elseif self.currentplant == 2.8 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb8.x, self.locations.prison.bomb8.y, self.locations.prison.bomb8.z))
    elseif self.currentplant == 2.9 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb9.x, self.locations.prison.bomb9.y, self.locations.prison.bomb9.z))
    elseif self.currentplant == 2.10 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb10.x, self.locations.prison.bomb10.y, self.locations.prison.bomb10.z))
    elseif self.currentplant == 2.11 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb11.x, self.locations.prison.bomb11.y, self.locations.prison.bomb11.z))
    elseif self.currentplant == 2.12 then
        SmallExp(self.currentplant, vector3(self.locations.prison.bomb12.x, self.locations.prison.bomb12.y, self.locations.prison.bomb12.z))
    end
end
function UTK:Hack(...)
    UTK.hackdone = false
    UTK.phonedone = false
    UTK.phonefail = false
    local loc = nil
    local locationinfo = nil
    local heading =  nil

    if self.currenthack == 0 then
        loc = self.locations.silent.start
    elseif self.currenthack == 1 then
        loc = self.locations.silent.hack1
        loc.z = self.locations.silent.hack1.z + 1
    elseif self.currenthack == 2 then
        loc = self.locations.silent.hack2
        loc.z = self.locations.silent.hack2.z + 1
    elseif self.currenthack == 3 then
        loc = self.locations.silent.hack3
        loc.z = self.locations.silent.hack3.z + 1
    elseif self.currenthack == 4 then
        loc = self.locations.silent.hack4
        loc.z = self.locations.silent.hack4.z + 1
    elseif self.currenthack == 5 then
        loc = self.locations.silent.hack5
        loc.z = self.locations.silent.hack5.z + 1
    elseif self.currenthack == 6 then
        loc = self.locations.silent.hack6
        loc.z = self.locations.silent.hack6.z + 1
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, loc.h)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioAtPosition(ped, "WORLD_HUMAN_STAND_MOBILE", loc.x, loc.y, loc.z, loc.h, 0, 0, 1)
    Citizen.Wait(2000)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", 5, 20, PhoneHacking)
    while not UTK.phonedone do
        Citizen.Wait(1)
    end
    ClearPedTasks(ped)
    Citizen.Wait(2500)
    if not UTK.phonefail then
        if self.currenthack == 1 then
            loc.z = self.locations.silent.hack1.z + 0.55
            loc.y = self.locations.silent.hack1.y + 0.50
        elseif self.currenthack == 2 then
            loc.z = self.locations.silent.hack2.z - 0.16
        elseif self.currenthack == 3 then
            loc.z = self.locations.silent.hack3.z + 0.10
        elseif self.currenthack == 4 then
            loc.z = self.locations.silent.hack4.z + 1.40
        elseif self.currenthack == 5 then
            loc.z = self.locations.silent.hack5.z + 0.10
        elseif self.currenthack == 6 then
            loc.z = self.locations.silent.hack6.z + 0.10
        end
        local animDict = "anim@heists@ornate_bank@hack"

        RequestAnimDict(animDict)
        RequestModel("hei_prop_hst_laptop")
        RequestModel("hei_p_m_bag_var22_arm_s")
        RequestModel("hei_prop_heist_card_hack_02")
        while not HasAnimDictLoaded(animDict)
            or not HasModelLoaded("hei_prop_hst_laptop")
            or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
            or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
        end
        local targetRotation =vec3(GetEntityRotation(ped))
        local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", loc.x, loc.y, loc.z - 0.25, loc.x, loc.y, loc.z, 0, 2)
        local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", loc.x, loc.y, loc.z - 0.25, loc.x, loc.y, loc.z, 0, 2)
        local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), GetEntityCoords(PlayerPedId()), 1, 1, 0)
        local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), 1, 1, 0)

        local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)

        local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        Citizen.Wait(200)
        NetworkStartSynchronisedScene(netScene2)
        Citizen.Wait(2500)
        Brute()
        while not UTK.hackdone do
            Citizen.Wait(1)
        end
        Citizen.Wait(1500)
        NetworkStartSynchronisedScene(netScene3)
        Citizen.Wait(2000)
        NetworkStopSynchronisedScene(netScene3)
        DeleteObject(bag)
        DeleteObject(laptop)
        FreezeEntityPosition(ped, false)
        SetPedComponentVariation(ped, 5, 45, 0, 0)
        if not UTK.hackres then
            if self.currenthack == 0 then
                self:NPCSpawn()
                self:HandleInfo()
            elseif self.currenthack == 1 then
                UTK.hacked1 = true
            elseif self.currenthack == 2 then
                UTK.hacked2 = true
            elseif self.currenthack == 3 then
                UTK.hacked3 = true
            elseif self.currenthack == 4 then
                UTK.hacked4 = true
            elseif self.currenthack == 5 then
                UTK.hacked5 = true
            elseif self.currenthack == 6 then
                UTK.hacked6 = true
            end
        elseif UTK.hackres then
            self.locations = UTK.locations
            self:HandleInfo()
        end
    elseif UTK.phonefail then
        FreezeEntityPosition(ped, false)
    end
end
function UTK:NPCSpawn(...)
    RequestModel(0x2EFEAFD5)
    while not HasModelLoaded(0x2EFEAFD5) do
        Citizen.Wait(1)
    end
    for i = 1, #self.npc, 1 do
        self.npc[i].a = CreatePed(26, self.npc[i].m, self.npc[i].x, self.npc[i].y, self.npc[i].z, self.npc[i].h, 1, 1)
        SetPedRelationshipGroupHash(self.npc[i].a, self.guards)
        SetPedCombatAttributes(self.npc[i].a, 1, true)
        SetPedCombatAttributes(self.npc[i].a, 2, true)
        SetPedCombatAttributes(self.npc[i].a, 5, true)
        SetPedCombatAttributes(self.npc[i].a, 16, true)
        SetPedCombatAttributes(self.npc[i].a, 26, true)
        SetPedCombatAttributes(self.npc[i].a, 46, true)
        SetPedCombatAttributes(self.npc[i].a, 52, true)
        SetPedFleeAttributes(self.npc[i].a, 0, 0)
        SetPedDiesWhenInjured(self.npc[i].a, false)
        TaskStandGuard(self.npc[i].a, self.npc[i].x, self.npc[i].y, self.npc[i].z, self.npc[i].h, "Standing")
        SetPedArmour(self.npc[i].a, 5000)
        SetPedAlertness(self.npc[i].a, 3)
        SetPedAccuracy(self.npc[i].a, 90)
        SetPedToInformRespectedFriends(self.npc[i].a, 200, 100)
        GiveWeaponToPed(self.npc[i].a, self.npc[i].w, 900, false, true)
        SetPedCombatRange(self.npc[i].a, self.npc[i].r)
        SetPedHighlyPerceptive(self.npc[i].a, true)
        SetPedDropsWeaponsWhenDead(self.npc[i].a, false)
    end
    SetModelAsNoLongerNeeded(0x2EFEAFD5)
    TriggerServerEvent("utk_pb:handlePlayers")
end
--[[function UTK:NPCSpawnPrison(...)
    RequestModel(0x2EFEAFD5)
    while not HasModelLoaded(0x2EFEAFD5) do
        Citizen.Wait(1)
    end
    for i = 1, #self.npc2, 1 do
        self.npc2[i].a = CreatePed(26, self.npc2[i].m, self.npc2[i].x, self.npc2[i].y, self.npc2[i].z, self.npc2[i].h, 1, 1)
        SetPedRelationshipGroupHash(self.npc2[i].a, self.guards)
        SetPedCombatAttributes(self.npc2[i].a, 1, true)
        SetPedCombatAttributes(self.npc2[i].a, 2, true)
        SetPedCombatAttributes(self.npc2[i].a, 5, true)
        SetPedCombatAttributes(self.npc2[i].a, 16, true)
        SetPedCombatAttributes(self.npc2[i].a, 26, true)
        SetPedCombatAttributes(self.npc2[i].a, 46, true)
        SetPedCombatAttributes(self.npc2[i].a, 52, true)
        SetPedFleeAttributes(self.npc2[i].a, 0, 0)
        SetPedDiesWhenInjured(self.npc2[i].a, false)
        TaskStandGuard(self.npc2[i].a, self.npc2[i].x, self.npc2[i].y, self.npc2[i].z, self.npc2[i].h, "Standing")
        SetPedArmour(self.npc2[i].a, 5000)
        SetPedAlertness(self.npc2[i].a, 3)
        SetPedAccuracy(self.npc2[i].a, 90)
        SetPedToInformRespectedFriends(self.npc2[i].a, 200, 100)
        GiveWeaponToPed(self.npc2[i].a, self.npc2[i].w, 900, false, true)
        SetPedCombatRange(self.npc2[i].a, self.npc2[i].r)
        SetPedHighlyPerceptive(self.npc2[i].a, true)
        SetPedDropsWeaponsWhenDead(self.npc2[i].a, false)
    end
    SetModelAsNoLongerNeeded(0x2EFEAFD5)
    TriggerServerEvent("utk_pb:handlePlayers")
end]]
function UTK:Blackout(...)
    TriggerEvent("utk_pb:showtime", 1)
    repeat
        Citizen.Wait(1000)
        UTK.showtime = UTK.showtime - 1
    until UTK.showtime == 0
    if self.info.style == 1 then
        local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(camera, 2812.16, 1554.07, 26.72)
        SetCamRot(camera, 0, 0, 158.55, 2)
        RenderScriptCams(1, 0, 0, 1, 1)
        Citizen.Wait(2000)
        AddExplosion(self.locations.loud.bomb3.x, self.locations.loud.bomb3.y, self.locations.loud.bomb3.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        AddExplosion(self.locations.loud.bomb2.x, self.locations.loud.bomb2.y, self.locations.loud.bomb2.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        AddExplosion(self.locations.loud.bomb1.x, self.locations.loud.bomb1.y, self.locations.loud.bomb1.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        DestroyCam(camera, 0)
        local camera2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(camera2, 2748.44, 1468.96, 27.45)
        SetCamRot(camera2, 0, 0, 0, 2)
        RenderScriptCams(1, 0, 0, 1, 1)
        Citizen.Wait(1000)
        AddExplosion(self.locations.loud.bomb4.x, self.locations.loud.bomb4.y, self.locations.loud.bomb4.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        AddExplosion(self.locations.loud.bomb5.x, self.locations.loud.bomb5.y, self.locations.loud.bomb5.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        AddExplosion(self.locations.loud.bomb6.x, self.locations.loud.bomb6.y, self.locations.loud.bomb6.z, 34, 20.0, true, false, 1.0, true)
        Citizen.Wait(600)
        DestroyCam(camera2, 0)
        RenderScriptCams(0, 0, 1, 1, 1)
        SetFocusEntity(PlayerPedId())
    end
    TriggerServerEvent("utk_pb:blackout", true)
    exports['mythic_notify']:SendAlert("success", "BLACKOUT!")
end
function SmallExp(method, coords)
    UTK.mintime = 5
    TriggerEvent("utk_pb:showtime", 2)
    repeat
        Citizen.Wait(1000)
        UTK.mintime = UTK.mintime - 1
    until UTK.mintime == 0
    if method == 1 then
        AddExplosion(2723.53, 1509.07, 44.149, 33, 1.0, true, false, 1.0, true)
    elseif method == 2 then
        AddExplosion(2715.39, 1478.94, 44.149, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.1 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.2 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.3 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.4 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.5 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.6 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.7 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.8 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.9 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.10 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.11 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    elseif method == 2.12 then
        AddExplosion(coords, 33, 1.0, true, false, 1.0, true)
    end
end

RegisterNetEvent("utk_pb:reset")
RegisterNetEvent("utk_pb:handlePlayers_c")
RegisterNetEvent("utk_pb:upUTK")
RegisterNetEvent("utk_pb:lock_c")
RegisterNetEvent("utk_pb:power")
RegisterNetEvent("utk_pb:showtime")

AddEventHandler("utk_pb:reset", function()
    UTK = UTKreset
    UTK:GetStage()
end)
AddEventHandler("utk_pb:lock_c", function()
    UTK.info.locked = true
    UTK:HandleInfo()
end)
AddEventHandler("utk_pb:upUTK", function(table) -- BURADA KALDIN
    UTK.info = table
    UTK:HandleInfo()
end)
AddEventHandler("utk_pb:handlePlayers_c", function()
    HandlePlayers()
end)
AddEventHandler("utk_pb:power", function(status)
    SetArtificialLightsState(status)
    if not status then
        exports['mythic_notify']:SendAlert("success", "Power is back on!")
    elseif status then
        UTK.info.locked = true
    end
end)
AddEventHandler("utk_pb:showtime", function(method)
    if method == 1 then
        while UTK.showtime > 0 do
            Citizen.Wait(1)
            ShowTimer(1)
        end
    elseif method == 2 then
        while UTK.mintime > 0 do
            Citizen.Wait(1)
            ShowTimer(2)
        end
    end
end)
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        SetArtificialLightsState(false)
    end
end)

-----------------

function DrawText3D(x, y, z, text, scale) local onScreen, _x, _y = World3dToScreen2d(x, y, z) local pX, pY, pZ = table.unpack(GetGameplayCamCoords()) SetTextScale(scale, scale) SetTextFont(4) SetTextProportional(1) SetTextEntry("STRING") SetTextCentre(true) SetTextColour(255, 255, 255, 215) AddTextComponentString(text) DrawText(_x, _y) local factor = (string.len(text)) / 700 DrawRect(_x, _y + 0.0150, 0.095 + factor, 0.03, 41, 11, 41, 100) end
function Brute()
    scaleform = Initialize("HACKING_PC")
    UsingComputer = true
end
function ScaleformLabel(label)
    BeginTextCommandScaleformString(label)
    EndTextCommandScaleformString()
end
function PhoneHacking(output, time)
    if output then
        TriggerEvent('mhacking:hide')
        UTK.phonedone = true
        UTK.phonefail = false
    else
        TriggerEvent('mhacking:hide')
        UTK.phonedone = true
        UTK.phonefail = true
    end
end
function ShowTimer(method)
    if method == 1 then
        SetTextFont(0)
        SetTextProportional(0)
        SetTextScale(0.42, 0.42)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextEntry("STRING")
        AddTextComponentString("~r~"..UTK.showtime.."~w~")
        DrawText(0.682, 0.96)
    elseif method == 2 then
        SetTextFont(0)
        SetTextProportional(0)
        SetTextScale(0.42, 0.42)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextEntry("STRING")
        AddTextComponentString("~r~"..UTK.mintime.."~w~")
        DrawText(0.682, 0.96)
    end
end

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovieInteractive(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end

        local CAT = 'hack'
        local CurrentSlot = 0
        while HasAdditionalTextLoaded(CurrentSlot) and not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
            Citizen.Wait(0)
            CurrentSlot = CurrentSlot + 1
        end

        if not HasThisAdditionalTextLoaded(CAT, CurrentSlot) then
            ClearAdditionalText(CurrentSlot, true)
            RequestAdditionalText(CAT, CurrentSlot)
            while not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
                Citizen.Wait(0)
            end
        end
        PushScaleformMovieFunction(scaleform, "SET_LABELS")
        ScaleformLabel("H_ICON_1")
        ScaleformLabel("H_ICON_2")
        ScaleformLabel("H_ICON_3")
        ScaleformLabel("H_ICON_4")
        ScaleformLabel("H_ICON_5")
        ScaleformLabel("H_ICON_6")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterString("Power Off")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(1)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(2)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(3)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(4)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(5)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(6)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(7)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()


        return scaleform
    end
    scaleform = Initialize("HACKING_PC")
    while true do
        Citizen.Wait(0)
        if UsingComputer then
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()
            if IsDisabledControlJustPressed(0,24) and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not Hacking and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            end
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasScaleformMovieLoaded(scaleform) and UsingComputer then
            UTK.DisableInput = true
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            if GetScaleformMovieFunctionReturnBool(ClickReturn) then
                Program = GetScaleformMovieFunctionReturnInt(ClickReturn)
                if Program == 83 and not Hacking then
                    lives = 5

                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(1.0)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                    PushScaleformMovieFunctionParameterString(RouletteWords[math.random(#RouletteWords)])
                    PopScaleformMovieFunctionVoid()

                    Hacking = true
                elseif Program == 82 and not Hacking then
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and Program == 87 then
                    lives = lives - 1
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(lives)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and Program == 92 then
                    PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                elseif Hacking and Program == 86 then
                    SorF = true
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel("WINBRUTE")
                    PopScaleformMovieFunctionVoid()
                    Wait(0)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                    if Method == 1 then
                        exports['mythic_notify']:SendAlert("success", _U("hacked"))
                    elseif Method == 2 then
                        exports['mythic_notify']:SendAlert("success", _U("hacked"))
                    end
                    UTK.hacksuccess = true
                    UsingComputer = false
                    UTK.hackdone = true
                    UTK.hackres = false
                elseif Program == 6 then
                    UsingComputer = false
                    UTK.hackres = true
                    UTK.hackdone = true
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                end

                if Hacking then
                    PushScaleformMovieFunction(scaleform, "SHOW_LIVES")
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunctionVoid()
                    if lives <= 0 then
                        SorF = true
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(false)
                        ScaleformLabel("LOSEBRUTE")
                        PopScaleformMovieFunctionVoid()
                        Wait(1000)
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        UTK.hackfail = true
                        UTK.DisableInput = false
                        Hacking = false
                        SorF = false
                        UTK.info.stage = 0
                        UTK.info.style = nil
                        UTK:HandleInfo()
                        FreezeEntityPosition(PlayerPedId(), false)
                    end
                end
            end
        else
            Wait(250)
        end
    end
end)

UTKreset = {
    guards = 1972614767,
    police = 2046537925,
    others = 1403091332,
    hackdone = false,
    hacksuccess = false,
    hackfail = false,
    hackres = false,
    showtime,
    currenthack,
    planted1,
    planted2,
    planted3,
    planted4,
    planted5,
    planted6,
    hacked1,
    hacked2,
    hacked3,
    hacked4,
    hacked5,
    hacked6,

    info = {},
    --[[prison = {
        planted1,
        planted2,
        planted3,
        planted4,
        planted6,
        planted7,
        planted8,
        planted9,
        planted10,
        planted11,
        planted12,
    },]]
    locations ={
        loud = {
            start = {x=2655.91, y=1641.92, z=24.59},
            bomb1 = {x=2809.77, y=1547.20, z=24.53},
            bomb2 = {x=2800.69, y=1513.80, z=24.53},
            bomb3 = {x=2792.19, y=1482.00, z=24.53},
            bomb4 = {x=2771.49, y=1548.19, z=24.50},
            bomb5 = {x=2764.38, y=1521.63, z=24.50},
            bomb6 = {x=2750.77, y=1470.91, z=24.50}
        },
        silent = {
            start = {x=2830.83, y=1673.68, z=24.66, h=267.51},
            hack1 = {x=2864.92, y=1509.36, z=23.50, h=168.81},
            hack2 = {x=2768.95, y=1392.27, z=23.50, h=270.13},
            hack3 = {x=2716.51, y=1463.28, z=23.50, h=343.34},
            hack4 = {x=2670.41, y=1625.46, z=23.50, h=87.95},
            hack5 = {x=2722.81, y=1509.28, z=43.15, h=256.79},
            hack6 = {x=2714.67, y=1479.15, z=43.15, h=256.79}
        },
        --[[prison = {
            bomb1 = {x=1772.07, y=2509.74, z=55.14, h=126.06},
            bomb2 = {x=1688.72, y=2445.00, z=55.16, h=87.43},
            bomb3 = {x=1683.36, y=2450.05, z=55.16, h=86.68},
            bomb4 = {x=1687.31, y=2462.92, z=55.16, h=89.49},
            bomb5 = {x=1638.93, y=2476.70, z=55.19, h=42.40},
            bomb6 = {x=1621.12, y=2463.05, z=55.19, h=49.71},
            bomb7 = {x=1606.65, y=2475.19, z=55.19, h=55.93},
            bomb8 = {x=1605.84, y=2484.23, z=55.19, h=142.23},
            bomb9 = {x=1596,00, y=2534.48, z=55.19, h=3.45},
            bomb10 = {x=1574.02, y=2557.91, z=55.19, h=2.07},
            bomb11 = {x=1579.02, y=2563.22, z=55.19, h=358.55},
            bomb12 = {x=1591.84, y=2559.49, z=55.19, h=6.10}
        }]]
    },
    texts = {
        blackout = "BLACKOUT!",
        loud = {
            start = "[~g~E~w~] Start ~r~LOUD~w~ Power Plant hit",
            bomb = "[~g~E~w~] Plant C4 Explosives for main generator",
            backup = "[~g~E~w~] Plant C4 Explosives for backup generator",
            time = "200 seconds to blackout!",
            planted = "C4 planted"
        },
        silent = {
            start = "[~g~E~w~] Start ~r~SILENT~w~ Power Plant hit",
            hack = "[~g~E~w~] Start hacking",
            plant = "[~g~E~w~] Plant C4 charge",
            time = "50 seconds to blackout!",
            caught = "You have seen!",
            hacked = "Hack successful"
        },
        --[[prison = {
            bomb = "[~g~E~w~] Plant C4 to power generator"
        }]]
    },
    npc = {
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2788.70, y= 1573.78, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2776.38, y= 1526.86, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2768.34, y= 1479.04, z= 30.79, h = 255.80, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2785.88, y= 1635.55, z= 24.50, h = 5.39  , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2786.35, y= 1647.95, z= 24.50, h = 186.69, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2826.07, y= 1554.79, z= 24.57, h = 76.41 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2811.56, y= 1469.77, z= 24.77, h = 348.38, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2761.70, y= 1469.50, z= 47.95, h = 347.11, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 2778.69, y= 1447.29, z= 24.57, h = 76.66 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2745.15, y= 1452.82, z= 24.49, h = 168.40, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2807.43, y= 1504.16, z= 24.73, h = 80.54 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2839.41, y= 1517.75, z= 24.73, h = 346.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2846.00, y= 1533.27, z= 24.73, h = 164.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2796.50, y= 1470.91, z= 34.35, h = 343.56, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2844.99, y= 1458.65, z= 32.75, h = 86.90 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2764.37, y= 1482.91, z= 30.79, h = 258.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2746.92, y= 1496.42, z= 38.29, h = 258.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2709.12, y= 1509.42, z= 24.50, h = 71.90 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2735.39, y= 1559.20, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2733.80, y= 1551.47, z= 24.50, h = 73.31 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2765.91, y= 1561.49, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2751.40, y= 1565.97, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2758.31, y= 1537.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2741.76, y= 1541.00, z= 24.50, h = 340.25, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2750.47, y= 1527.15, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2734.70, y= 1531.33, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2746.28, y= 1476.46, z= 24.50, h = 359.14, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2740.85, y= 1498.29, z= 24.50, h = 161.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2761.11, y= 1527.15, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2770.64, y= 1563.69, z= 37.68, h = 267.74, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2751.78, y= 1451.11, z= 24.50, h = 161.89, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2709.18, y= 1466.70, z= 24.50, h = 96.71 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2703.85, y= 1487.98, z= 24.50, h = 79.07 , m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2707.36, y= 1473.13, z= 42.25, h = 77.42 , m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
    },
    --[[npc2 = {
        {a = nil, x= 1538.99, y= 2583.59, z= 62.70, h = 255.91, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1572.66, y= 2677.80, z= 62.75, h = 218.38, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1650.53, y= 2754.01, z= 62.89, h = 197.42, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1772.23, y= 2758.93, z= 62.90, h = 157.42, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1845.03, y= 2699.09, z= 62.98, h = 97.77, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1819.88, y= 2621.54, z= 62.97, h = 83.97, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1820.57, y= 2477.26, z= 62.70, h = 59.31, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1759.91, y= 2413.98, z= 62.73, h = 22.29, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1660.83, y= 2398.32, z= 62.74, h = 332.87, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1544.34, y= 2470.99, z= 62.73, h = 288.38, m = 0x2EFEAFD5, r = 2, w = "weapon_sniperrifle"},
        {a = nil, x= 1829.77, y= 2605.15, z= 45.57, h = 266.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1823.38, y= 2602.17, z= 45.60, h = 3.53, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1805.52, y= 2614.10, z= 45.55, h = 181.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.37, y= 2608.51, z= 45.56, h = 272.84, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.26, y= 2601.28, z= 45.56, h = 272.84, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1757.52, y= 2599.39, z= 45.56, h = 1.66, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1757.42, y= 2611.64, z= 45.56, h = 180.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1792.16, y= 2622.11, z= 55.47, h = 273.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.65, y= 2565.42, z= 55.47, h = 273.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1761.75, y= 2565.33, z= 55.47, h = 144.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.40, y= 2563.46, z= 55.47, h = 183.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1718.90, y= 2609.21, z= 55.47, h = 269.94, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1725.16, y= 2595.53, z= 55.47, h = 4.57, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.41, y= 2599.38, z= 45.56, h = 91.76, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.45, y= 2612.55, z= 45.56, h = 91.76, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1758.85, y= 2515.00, z= 55.47, h = 81.18, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1740.79, y= 2504.65, z= 55.41, h = 345.99, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1703.22, y= 2478.54, z= 55.44, h = 43.49, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1682.51, y= 2478.49, z= 55.43, h = 314.92, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1639.35, y= 2491.35, z= 55.43, h = 10.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1623.48, y= 2504.39, z= 55.42, h = 271.59, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1607.34, y= 2543.41, z= 55.42, h = 318.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1607.20, y= 2564.06, z= 55.42, h = 226.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1665.57, y= 2565.75, z= 55.44, h = 136.68, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1692.11, y= 2553.21, z= 55.04, h = 274.85, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1689.64, y= 2554.01, z= 55.04, h = 92.93, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1686.41, y= 2528.88, z= 54.88, h = 138.44, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1695.60, y= 2528.62, z= 54.88, h = 217.15, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1791.41, y= 2493.29, z= 45.57, h = 302.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1754.90, y= 2462.44, z= 45.57, h = 219.48, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1720.63, y= 2439.99, z= 45.57, h = 269.31, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1720.97, y= 2486.40, z= 45.56, h = 271.90, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1669.82, y= 2435.15, z= 45.57, h = 183.11, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1657.73, y= 2485.73, z= 45.56, h = 230.18, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1602.72, y= 2465.36, z= 45.56, h = 147.12, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1612.63, y= 2519.51, z= 45.56, h = 320.88, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1610.84, y= 2525.66, z= 45.56, h = 270.01, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1572.23, y= 2525.52, z= 45.56, h = 168.88, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1563.53, y= 2576.77, z= 45.56, h = 91.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1614.88, y= 2582.00, z= 45.56, h = 15.13, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1625.49, y= 2568.08, z= 45.56, h = 89.97, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1614.13, y= 2567.08, z= 45.56, h = 192.05, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.66, y= 2567.73, z= 45.56, h = 184.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1645.31, y= 2585.75, z= 45.56, h = 4.92, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1630.54, y= 2589.73, z= 52.62, h = 269.71, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1630.59, y= 2607.88, z= 52.62, h = 317.87, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1652.17, y= 2641.62, z= 51.94, h = 231.48, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1650.93, y= 2655.11, z= 55.43, h = 271.32, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1664.21, y= 2670.71, z= 55.42, h = 187.05, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1700.54, y= 2687.10, z= 55.42, h = 230.61, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.11, y= 2686.94, z= 55.42, h = 138.46, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1759.80, y= 2676.15, z= 55.42, h = 193.91, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1776.85, y= 2664.39, z= 55.42, h = 107.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1619.24, y= 2646.28, z= 45.56, h = 269.34, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1788.47, y= 2650.87, z= 45.56, h = 235.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1812.25, y= 2692.67, z= 45.56, h = 322.02, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.20, y= 2651.68, z= 55.45, h = 308.99, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1758.93, y= 2616.35, z= 55.44, h = 95.09, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1662.82, y= 2618.78, z= 55.44, h = 49.23, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1689.59, y= 2633.18, z= 55.04, h = 90.10, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1694.95, y= 2658.15, z= 54.88, h = 292.31, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1686.13, y= 2658.48, z= 54.88, h = 42.36, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1688.54, y= 2621.66, z= 45.56, h = 4.94, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.44, y= 2650.35, z= 45.56, h = 44.26, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1609.93, y= 2666.52, z= 45.56, h = 142.55, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1639.03, y= 2708.85, z= 45.56, h = 49.45, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1681.35, y= 2681.35, z= 45.58, h = 199.83, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1687.43, y= 2730.70, z= 45.56, h = 1.59, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1738.63, y= 2725.92, z= 45.57, h = 270.20, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1739.73, y= 2679.80, z= 45.57, h = 178.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1774.51, y= 2719.32, z= 45.56, h = 323.29, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1772.19, y= 2526.95, z= 45.56, h = 297.41, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1775.75, y= 2537.90, z= 45.56, h = 72.36, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1715.93, y= 2565.70, z= 55.44, h = 214.50, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1721.84, y= 2563.32, z= 55.44, h = 154.27, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 1751.48, y= 2595.23, z= 55.44, h = 1.83, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        --[[{a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
        {a = nil, x= 2677.87, y= 1593.11, z= 32.51, h = 263.42, m = 0x2EFEAFD5, r = 1, w = "weapon_smg"},
    }]]
}
