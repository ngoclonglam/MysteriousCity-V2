Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {}

Config.jobrequirement = false --whether work requires a job
Config.jobname = 'tanker' --name of the job that is required


Config.TruckPrice = 50000 --price for the first truck
Config.TruckOutPrice = 1000 --price for retrieving the vehicle

Config.PayOutMin = 2200 --Minimum Payout
Config.PayOutMax = 2950 --Maximum Payout

Config.tanker = {
	['BossSpawn'] = {
		Pos = {x = 1739.86, y = -1606.79, z = 112.49, h = 78.64},
		Type  = 'a_m_m_farmer_01', --model ped
    },
    ['TruckMan'] = {
		Pos = {x = 1704.89, y = -1637.69, z = 112.49, h = 279.88},
		Type  = 'a_m_m_rurmeth_01', --model ped
    },
    ['TruckOut'] = {
		Pos = {x = 1716.69, y = -1659.48, z = 112.73, h = 7.78},
        Vehicle = 'hauler' --model vehicle
    },
    ['Manager'] = {
		Pos = {x = 1730.84, y = -1542.82, z = 112.71, h = 244.43},
        Type  = 'a_m_y_business_02', --model ped
    },
    ['Semitrailer'] = {
		Pos = {x = 1745.63, y = -1538.55, z = 112.85, h = 252.26}, --marker for pulling out a semi-trailer
        PosSpawn = {x = 1739.85, y = -1536.75, z = 112.66, h = 250.29}, --where the trailer is supposed to appear
        Vehicle  = 'tanker', --model trailer
    },
    ['Refueling'] = {
		Pos = {x = 1691.36, y = -1458.89, z = 112.93, h = 155.57}, --marker for regueling
    },
}

Config.Places = {
    [1] = {
        Ped = {model='a_m_m_prolhost_01', x = 1167.69, y = -325.01, z = 69.26, h = 280.46}, --ped model and its location.
        RefulingPlace = {x = 1169.70, y = -317.10, z = 69.18, h = 285.58} --Where does the hose connection machine show up
    },
    [2] = {
        Ped = {model='a_m_m_prolhost_01', x = -47.61, y = -1764.26, z = 29.37, h = 112.11},
        RefulingPlace = {x = -52.84, y = -1770.00, z = 29.18, h = 32.38}
    },
    [3] = {
        Ped = {model='a_m_m_prolhost_01', x = -716.34, y = -917.39, z = 19.21, h = 168.28},
        RefulingPlace = {x = -727.35, y = -908.77, z = 19.01, h = 136.27}
    },
    [4] = {
        Ped = {model='a_m_m_prolhost_01', x = -528.74, y = -1221.09, z = 18.45, h = 314.13},
        RefulingPlace = {x = -520.77, y = -1226.88, z = 18.45, h = 342.98}
    },
    [5] = {
        Ped = {model='a_m_m_prolhost_01', x = 818.80, y = -1039.90, z = 26.75, h = 14.10},
        RefulingPlace = {x = 813.90, y = -1043.41, z = 26.76, h = 45.27}
    },
    [6] = {
        Ped = {model='a_m_m_prolhost_01', x = 639.60, y = 257.65, z = 103.30, h = 85.85},
        RefulingPlace = {x = 633.81, y = 247.34, z = 103.30, h = 118.04}
    },
    [7] = {
        Ped = {model='a_m_m_prolhost_01', x = 2588.37, y = 430.92, z = 108.61, h = 165.05},
        RefulingPlace = {x = 2589.72, y = 421.51, z = 108.46, h = 162.01}
    },
    [8] = {
        Ped = {model='a_m_m_prolhost_01', x = -2538.49, y = 2317.98, z = 33.22, h = 349.57},
        RefulingPlace = {x = -2525.63, y = 2319.46, z = 33.22, h = 85.70}
    },
    [9] = {
        Ped = {model='a_m_m_prolhost_01', x = 50.12, y = 2786.91, z = 57.88, h = 132.44},
        RefulingPlace = {x = 44.50, y = 2802.30, z = 57.88, h = 136.25}
    },
    [10] = {
        Ped = {model='a_m_m_prolhost_01', x = 1034.79, y = 2665.03, z = 39.55, h = 35.66},
        RefulingPlace = {x = 1029.58, y = 2654.08, z = 39.55, h = 196.38}
    },
    [11] = {
        Ped = {model='a_m_m_prolhost_01', x = 1997.94, y = 3777.98, z = 32.24, h = 189.03},
        RefulingPlace = {x = 1988.36, y = 3780.01, z = 32.18, h = 12.86}
    },
    [12] = {
        Ped = {model='a_m_m_prolhost_01', x = 1700.43, y = 4933.76, z = 42.08, h = 57.44},
        RefulingPlace = {x = 1714.37, y = 4940.82, z = 42.08, h = 224.55}
    },
}


Config.Clothes = {
        male = {
            ['tshirt_1'] = 259,  ['tshirt_2'] = 0,
            ['torso_1'] = 331,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 8,   ['pants_2'] = 0,
            ['shoes_1'] = 7,   ['shoes_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 236,  ['tshirt_2'] = 1,
            ['torso_1'] = 273,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 214,
            ['pants_1'] = 274,   ['pants_2'] = 0,
            ['shoes_1'] = 224,   ['shoes_2'] = 0,
            ['chain_1'] = -1,    ['chain_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }    
}

