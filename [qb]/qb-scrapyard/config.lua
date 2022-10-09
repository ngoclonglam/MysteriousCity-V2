Config = {}

Config.UseTarget = GetConvar("UseTarget", "false") == "true"

Config.Debug = true

Config.EnableAddOnAlert = true
Config.EnableAddOnNotifer = true

Config.MinimumRequiredPolice = 2
Config.NotificationTimeout = 10000

Config.JobMetadata = "carchoppoints"

Config.JobRank = {
    { title = "Tấm chiếu mới", pts = 0 },
    { title = "Nghiệp dư", pts = 20 },
    { title = "Bán chuyên", pts = 60 },
    { title = "Bờ rào", pts = 120 },
    { title = "Đụng là mất", pts = 200 },
    { title = "Đồ tể 4 bánh", pts = 300 }
}

Config.Peds = {
    ["request"] = {
        ["model"] = `csb_ballasog`, -- Model name as a hash.
        ["coords"] = vector4(137.54, -1695.86, 29.29, 321.25), -- Hawick Ave (X, Y, Z, Heading)
        ["gender"] = 'male', -- The gender of the ped, used for the CreatePed native.
        ["animDict"] = "anim@amb@nightclub@peds@",
        ["animName"] = "rcmme_amanda1_stand_loop_cop"
    }
}

Config.Locations = {
    [1] = {
        ["main"] = vector3(2397.42, 3089.44, 49.92),
        ["deliver"] = vector3(2351.5, 3132.96, 48.2),
        ["list"] = vector3(2403.51, 3127.95, 48.15),
        ["showBlip"] = false,
    }
}

Config.MaxItemAmountReceived = 45
Config.MinItemAmountReceived = 25
Config.AmountDeducted = 15 -- If not enough police count, item's amount received will be deducted by this value
Config.MaxAllowedJobs = 3 -- Max jobs/vehicles can be scrapped per day

Config.Items = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
    "leather",
}

Config.CurrentVehicles = {}
Config.CompleteJobs = {}

Config.Vehicles = {
    [1] = {
        "ninef",
        "ninef2",
        "banshee",
        "alpha",
        "baller",
        "bison",
        "huntley",
        "f620",
        "asea",
        "pigalle",
        "bullet",
        "dominator",
        "blade",
        "chino",
        "sabregt",
        "bati",
        "carbonrs",
        "akuma",
        "thrust",
        "exemplar",
        "felon",
        "sentinel",
        "blista",
        "fusilade",
        "jackal",
        "blista2",
        "rocoto",
        "seminole",
        "landstalker",
        "picador",
        "prairie",
        "bobcatxl",
        "gauntlet",
        "virgo",
        "fq2",
        "rhapsody",
        "feltzer2",
    },
    [2] = {
        "turismor",
        "zentorno",
        "jester",
    },
}

Config.JobInfo = {
    [1] = {
        ['maxguard'] = 1,
    },
    [2] = {
        ['maxguard'] = 2,
    },
}

Config.Goons = {
    ['Model'] = {
        'G_M_Y_Lost_02',
        'G_M_Y_MexGang_01',
        'G_M_Y_SalvaBoss_01',
    },
    ['Anim'] = {
        {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'},
        {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'},
        {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'},
    },
}

Config.GoonAttributes = {
    [1] = {
        armor = 100, accuracy = 60
    },
    [2] = {
        armor = 100, accuracy = 70
    }
}

Config.GoonWeapons = {
    [1] = {
        'WEAPON_BAT',
        'WEAPON_GOLFCLUB',
        'WEAPON_SWITCHBLADE'
    },
    [2] = {
        'WEAPON_PISTOL',
        'WEAPON_PISTOL_MK2',
        'WEAPON_COMBATPISTOL',
        'weapon_hammer',
        'weapon_machete'
    },
}

Config.SpawnLocations = {
    [1] = {
        {
            ['name'] = 'mirrorpark',
            ['ParkingSpots'] = {
                vector4(1023.5, -756.15, 57.48, 225.44),
                vector4(1020.64, -758.19, 57.49, 225.22),
                vector4(1017.57, -760.75, 57.47, 222.83),
                vector4(1014.9, -763.11, 57.4, 223.82),
            }
        }, {
            ['name'] = 'casinop',
            ['ParkingSpots'] = {
                vector4(874.36, -77.52, 78.34, 326.7),
                vector4(868.22, -74.12, 78.34, 327.6),
                vector4(865.89, -71.32, 78.34, 327.2),
                vector4(862.79, -70.26, 78.34, 327.35),
            },
        }, {
            ['name'] = 'leigonsquarealley',
            ['ParkingSpots'] = {
                vector4(19.23, -880.71, 29.8, 341.54),
                vector4(22.45, -882.16, 29.79, 340.09),
                vector4(25.93, -883.46, 29.79, 343.72),
                vector4(37.8, -887.64, 29.77, 160.81),
            },
        }, {
            ['name'] = 'motelgarage',
            ['ParkingSpots'] = {
                vector4(277.62, -340.01, 44.5, 70.08),
                vector4(284.0, -342.32, 44.5, 70.09),
                vector4(278.33, -336.51, 44.49, 70.34),
                vector4(284.94, -338.87, 44.5, 70.28),
            }
        }, {
            ['name'] = 'sapcounsel',
            ['ParkingSpots'] = {
                vector4(-356.89, -749.29, 33.54, 270.15),
                vector4(-356.83, -753.66, 33.54, 269.64),
                vector4(-357.22, -756.74, 33.54, 269.93),
                vector4(-357.17, -760.01, 33.54, 269.71),
            }
        }, {
            ['name'] = 'caears24',
            ['ParkingSpots'] = {
                vector4(54.49, 19.49, 69.14, 339.68),
                vector4(57.48, 17.98, 68.92, 340.13),
                vector4(60.49, 16.99, 68.8, 338.05),
                vector4(64.03, 16.28, 68.75, 337.71),
            }
        },
    },
    [2] = {
        {
            ['name'] = '686',
            ['ParkingSpots'] = {
                vector4(-937.55, 195.08, 67.27, 166.97),
                vector4(-953.61, 187.75, 65.99, 82.22),
            }
        },
        {
            ['name'] = '686b',
            ['ParkingSpots'] = {
                vector4(-907.96, 190.45, 68.84, 138.52),
                vector4(-907.95, 198.18, 68.89, 181.07),
            }
        },
        {
            ['name'] = '676',
            ['ParkingSpots'] = {
                vector4(-992.98, 143.72, 60.06, 288.42),
            }
        },
    },
}