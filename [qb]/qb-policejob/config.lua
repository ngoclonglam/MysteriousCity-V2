Config = {}

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.MaxSpikes = 5

Config.HandCuffItem = 'handcuffs'

Config.LicenseRank = 2

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Locations = {
    ["duty"] = {
        [1] = vector3(442.69, -981.89, 30.69),
        [2] = vector3(1852.96, 3686.73, 34.27)
    },
    -- ["vehicle"] = {
    --     [1] = vector4(448.159, -1017.41, 28.562, 90.654),
    --     [2] = vector4(1868.38, 3695.17, 33.6, 208.27),
    --     [3] = vector4(-462.4, 6009.64, 31.34, 89.65)

    -- },
    ["stash"] = {
        [1] = vector3(486.3, -995.51, 30.69),
        [2] = vector3(1847.28, 3691.35, 34.27),
    },
    ["impound"] = {
        [1] = vector4(474.42, -1019.19, 27.46, 276.38),
        [2] = vector3(-436.14, 5982.63, 31.34),
    },
    ["helicopter"] = {
        [1] = vector4(449.168, -981.325, 43.691, 87.234),
        --[2] = vector4(1874.35, 3701.68, 33.94, 206.21),
    },
    ["armory"] = {
        [1] = vector3(482.45, -995.28, 30.69),
        [2] = vector3(1861.0, 3688.18, 34.27),
    },
    ["trash"] = {
        [1] = vector3(474.28, -988.31, 26.27),
    },
    ["fingerprint"] = {
        [1] = vector3(474.3, -990.99, 26.27),
        [2] = vector3(1858.46, 3687.01, 30.27),
    },
    ["evidence"] = {
        [1] = vector3(474.3, -999.99, 26.27),
        [2] = vector3(-440.54, 5986.98, 31.72),
    },
    ["evidence2"] = {
        [1] = vector3(579.3, -990.99, 26.27),
    },
    ["evidence3"] = {
        [1] = vector3(578.3, -990.99, 26.27),
    },
    ["stations"] = {
        [1] = {label = "Đồn cảnh sát", coords = vector4(428.23, -984.28, 29.76, 3.5)},
        [2] = {label = "Nhà tù", coords = vector4(1845.903, 2585.873, 45.672, 272.249)},
        [3] = {label = "Đồn cảnh sát ngoại ô", coords = vector4(-451.55, 6014.25, 31.716, 223.81)},
        [4] = {label = "Đồn cảnh sát sa mạc", coords = vector4(1856.29, 3681.32, 34.27, 208.34)},
    },
}

Config.ArmoryWhitelist = {}

Config.PoliceHelicopter = "POLMAV"

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", coords = vector3(257.45, 210.07, 109.08), r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", coords = vector3(232.86, 221.46, 107.83), r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", coords = vector3(252.27, 225.52, 103.99), r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", coords = vector3(-53.1433, -1746.714, 31.546), r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", coords = vector3(-718.153, -909.211, 21.49), r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", coords = vector3(23.885, -1342.441, 31.672), r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", coords = vector3(1151.93, -320.389, 71.33), r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", coords = vector3(383.402, 328.915, 105.541), r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", coords = vector3(-1832.057, 789.389, 140.436), r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", coords = vector3(-3046.749, 592.491, 9.808), r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", coords = vector3(-3246.489, 1010.408, 14.705), r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", coords = vector3(539.773, 2664.904, 44.056), r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", coords = vector3(2673.579, 3281.265, 57.541), r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", coords = vector3(1966.24, 3749.545, 34.143), r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", coords = vector3(1729.522, 6419.87, 37.262), r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", coords = vector3(309.341, -281.439, 55.88), r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", coords = vector3(144.871, -1043.044, 31.017), r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", coords = vector3(-355.7643, -52.506, 50.746), r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", coords = vector3(-1214.226, -335.86, 39.515), r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", coords = vector3(-2958.885, 478.983, 17.406), r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", coords = vector3(-102.939, 6467.668, 33.424), r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", coords = vector3(-163.75, 6323.45, 33.424), r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Jewelery CAM#1", coords = vector3(-627.54, -239.74, 40.33), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Jewelery CAM#2", coords = vector3(-627.51, -229.51, 40.24), r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Jewelery CAM#3", coords = vector3(-620.3, -224.31, 40.23), r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Jewelery CAM#4", coords = vector3(-622.57, -236.3, 40.31), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    },
}

-- Config.AuthorizedVehicles = {
-- 	-- Grade 0
-- 	[0] = {
-- 		["police"] = "Police Car 1",
-- 		["police2"] = "Police Car 2",
-- 		["police3"] = "Police Car 3",
-- 		["police4"] = "Police Car 4",
-- 		["policeb"] = "Police Car 5",
-- 		["policet"] = "Police Car 6",
-- 		["sheriff"] = "Sheriff Car 1",
-- 		["sheriff2"] = "Sheriff Car 2",
-- 	},
-- 	-- Grade 1
-- 	[1] = {
-- 		["police"] = "Police Car 1",
-- 		["police2"] = "Police Car 2",
-- 		["police3"] = "Police Car 3",
-- 		["police4"] = "Police Car 4",
-- 		["policeb"] = "Police Car 5",
-- 		["policet"] = "Police Car 6",
-- 		["sheriff"] = "Sheriff Car 1",
-- 		["sheriff2"] = "Sheriff Car 2",

-- 	},
-- 	-- Grade 2
-- 	[2] = {
-- 		["police"] = "Police Car 1",
-- 		["police2"] = "Police Car 2",
-- 		["police3"] = "Police Car 3",
-- 		["police4"] = "Police Car 4",
-- 		["policeb"] = "Police Car 5",
-- 		["policet"] = "Police Car 6",
-- 		["sheriff"] = "Sheriff Car 1",
-- 		["sheriff2"] = "Sheriff Car 2",
-- 	},
-- 	-- Grade 3
-- 	[3] = {
-- 		["police"] = "Police Car 1",
-- 		["police2"] = "Police Car 2",
-- 		["police3"] = "Police Car 3",
-- 		["police4"] = "Police Car 4",
-- 		["policeb"] = "Police Car 5",
-- 		["policet"] = "Police Car 6",
-- 		["sheriff"] = "Sheriff Car 1",
-- 		["sheriff2"] = "Sheriff Car 2",
-- 	},
-- 	-- Grade 4
-- 	[4] = {
-- 		["police"] = "Police Car 1",
-- 		["police2"] = "Police Car 2",
-- 		["police3"] = "Police Car 3",
-- 		["police4"] = "Police Car 4",
-- 		["policeb"] = "Police Car 5",
-- 		["policet"] = "Police Car 6",
-- 		["sheriff"] = "Sheriff Car 1",
-- 		["sheriff2"] = "Sheriff Car 2",
-- 	}
-- }

Config.WhitelistedVehicles = {}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Large caliber bullet",
}

Config.Radars = {
	vector4(-623.44421386719, -823.08361816406, 25.25704574585, 145.0),
	vector4(-652.44421386719, -854.08361816406, 24.55704574585, 325.0),
	vector4(1623.0114746094, 1068.9924316406, 80.903594970703, 84.0),
	vector4(-2604.8994140625, 2996.3391113281, 27.528566360474, 175.0),
	vector4(2136.65234375, -591.81469726563, 94.272926330566, 318.0),
	vector4(2117.5764160156, -558.51013183594, 95.683128356934, 158.0),
	vector4(406.89505004883, -969.06286621094, 29.436267852783, 33.0),
	vector4(657.315, -218.819, 44.06, 320.0),
	vector4(2118.287, 6040.027, 50.928, 172.0),
	vector4(-106.304, -1127.5530, 30.778, 230.0),
	vector4(-823.3688, -1146.980, 8.0, 300.0),
}

-- Config.CarItems = {
--     [1] = {
--         name = "heavyarmor",
--         amount = 2,
--         info = {},
--         type = "item",
--         slot = 1,
--     },
--     [2] = {
--         name = "empty_evidence_bag",
--         amount = 10,
--         info = {},
--         type = "item",
--         slot = 2,
--     },
--     [3] = {
--         name = "police_stormram",
--         amount = 1,
--         info = {},
--         type = "item",
--         slot = 3,
--     },
-- }

Config.Items = {
    label = "Police Armory",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_stungun",
            price = 1000,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [2] = {
            name = "weapon_nightstick",
            price = 500,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [3] = {
            name = "handcuffs",
            price = 300,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [4] = {
            name = "weapon_flashlight",
            price = 200,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 4,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [5] = {
            name = "weapon_pistol",
            price = 0,
            amount = 10,
            info = {
                serie = "POLICE",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_AR_SUPP_02", label ="Suppressor"}
                }
            },
            type = "weapon",
            slot = 5,
            authorizedJobGrades = {5, 6}
        },
        [6] = {
            name = "pistol_ammo",
            price = 1000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 6,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [7] = {
            name = "armor",
            price = 1000,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [8] = {
            name = "heavyarmor",
            price = 2000,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [9] = {
            name = "radio",
            price = 200,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [10] = {
            name = "policecard",
            price = 200,
            amount = 1,
            type = "item",
            info = {},
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6}
        },
        [11] = {
            name = "empty_evidence_bag",
            price = 50,
            amount = 10,
            info = {},
            type = "item",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
        -- [3] = {
        --     name = "weapon_pumpshotgun",
        --     price = 0,
        --     amount = 1,
        --     info = {
        --         serie = "",
        --         attachments = {
        --             {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
        --         }
        --     },
        --     type = "weapon",
        --     slot = 3,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [4] = {
        --     name = "weapon_smg",
        --     price = 0,
        --     amount = 1,
        --     info = {
        --         serie = "",
        --         attachments = {
        --             {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
        --             {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
        --         }
        --     },
        --     type = "weapon",
        --     slot = 4,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [5] = {
        --     name = "weapon_carbinerifle",
        --     price = 0,
        --     amount = 1,
        --     info = {
        --         serie = "",
        --         attachments = {
        --             {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
        --             {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "3x Scope"},
        --         }
        --     },
        --     type = "weapon",
        --     slot = 5,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [6] = {
        --     name = "weapon_nightstick",
        --     price = 0,
        --     amount = 1,
        --     info = {},
        --     type = "weapon",
        --     slot = 6,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        
        -- [8] = {
        --     name = "smg_ammo",
        --     price = 0,
        --     amount = 5,
        --     info = {},
        --     type = "item",
        --     slot = 8,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [9] = {
        --     name = "shotgun_ammo",
        --     price = 0,
        --     amount = 5,
        --     info = {},
        --     type = "item",
        --     slot = 9,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [10] = {
        --     name = "rifle_ammo",
        --     price = 0,
        --     amount = 5,
        --     info = {},
        --     type = "item",
        --     slot = 10,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [11] = {
        --     name = "handcuffs",
        --     price = 0,
        --     amount = 1,
        --     info = {},
        --     type = "item",
        --     slot = 11,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [12] = {
        --     name = "weapon_flashlight",
        --     price = 0,
        --     amount = 1,
        --     info = {},
        --     type = "weapon",
        --     slot = 12,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [13] = {
        --     name = "empty_evidence_bag",
        --     price = 0,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 13,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [14] = {
        --     name = "police_stormram",
        --     price = 0,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 14,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [15] = {
        --     name = "armor",
        --     price = 0,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 15,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [16] = {
        --     name = "radio",
        --     price = 0,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 16,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- },
        -- [17] = {
        --     name = "heavyarmor",
        --     price = 0,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 17,
        --     authorizedJobGrades = {0, 1, 2, 3, 4}
        -- }
    }
}

Config.VehicleSettings = {
    ["car1"] = { --- Model name
        ["extras"] = {
            ["1"] = true, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        },
		["livery"] = 1,
    },
    ["car2"] = {
        ["extras"] = {
            ["1"] = true,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        },
		["livery"] = 1,
    }
}
