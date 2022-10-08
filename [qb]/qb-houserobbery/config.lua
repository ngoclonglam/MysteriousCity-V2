Config = {}

Config.Debug = false

Config.EnableAddOnNotifer = true
Config.EnableAddOnAlert = true
Config.MinZOffset = 45

Config.MinimumHouseRobberyPolice = 2

Config.MinimumTime = 5
Config.MaximumTime = 20

Config.MaxAvailableJobs = 2

Config.SkillMetadata = "houserobberypoints"

Config.JobState = {
    Ready = 0,
    Queued = 1,
    Assigned = 2,
    InProgress = 3,
    Success = 4,
    Failed = 5,
}

Config.Boss = {
    ["request"] = {
        ["model"] = `csb_ballasog`, -- Model name as a hash.
        ["coords"] = vector4(412.57, 2965.25, 41.89, 41.51), -- Hawick Ave (X, Y, Z, Heading)
        ["gender"] = 'male', -- The gender of the ped, used for the CreatePed native.
        ["animDict"] = "anim@amb@nightclub@peds@",
        ["animName"] = "rcmme_amanda1_stand_loop_cop"
    }
}

Config.SkillLevels = {
    { title = "Nghiệp dư", pts = 700 },
    { title = "Bán chuyên", pts = 1400 },
    { title = "Bờ rào", pts = 2100 },
    { title = "Đụng là mất", pts = 2800 },
    { title = "Lau sạch banh", pts = 3500 }
}

Config.Rewards = {
    [1] = {
        ["cabin"] = {"plastic", "diamond", "emerald", "diamond_ring", "goldchain", "weed_skunk", "thermite", "cryptostick", --[[ "weapon_golfclub" ]]},
        ["kitchen"] = {"tosti", "diamond", "emerald", "sandwich", "goldchain"},
        ["chest"] = {"plastic", "diamond","emerald", "rolex", "diamond_ring", "goldchain", "weed_skunk", "thermite", "cryptostick", --[[ "weapon_combatpistol" ]]},
        ["livingroom"] = {"plastic", "diamond","emerald", "rolex", "diamond_ring", "goldchain", "thermite", "cryptostick", "tablet", --[[ "pistol_ammo" ]]}
    }
}

Config.Houses = {
    -- Tier 3
--[[    ["perfectdrive1"] = {
        ["coords"] = {
            ["x"] = -784.72,
            ["y"] = 459.77,
            ["z"] = 100.39,
            ["h"] = 34.89
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive2"] = {
        ["coords"] = {
            ["x"] = -762.21,
            ["y"] = 430.96,
            ["z"] = 100.2,
            ["h"] = 198.27
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive3"] = {
        ["coords"] = {
            ["x"] = -678.01,
            ["y"] = 512.13,
            ["z"] = 113.53,
            ["h"] = 12.05
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive4"] = {
        ["coords"] = {
            ["x"] = -640.92,
            ["y"] = 520.61,
            ["z"] = 109.88,
            ["h"] = 9.94
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive5"] = {
        ["coords"] = {
            ["x"] = -622.84,
            ["y"] = 488.88,
            ["z"] = 108.88,
            ["h"] = 186.87
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["perfectdrive6"] = {
        ["coords"] = {
            ["x"] = -595.55,
            ["y"] = 530.28,
            ["z"] = 107.75,
            ["h"] = 13.0
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad1"] = {
        ["coords"] = {
            ["x"] = -536.67,
            ["y"] = 477.36,
            ["z"] = 103.19,
            ["h"] = 235.55
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad2"] = {
        ["coords"] = {
            ["x"] = -526.64,
            ["y"] = 516.97,
            ["z"] = 112.94,
            ["h"] = 226.17
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad3"] = {
        ["coords"] = {
            ["x"] = -554.48,
            ["y"] = 541.26,
            ["z"] = 110.71,
            ["h"] = 338.6
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["miltonroad4"] = {
        ["coords"] = {
            ["x"] = -500.82,
            ["y"] = 551.92,
            ["z"] = 120.6,
            ["h"] = 159.51
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive1"] = {
        ["coords"] = {
            ["x"] = -418.09,
            ["y"] = 568.99,
            ["z"] = 125.06,
            ["h"] = 333.59
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive2"] = {
        ["coords"] = {
            ["x"] = -411.06,
            ["y"] = 529.18,
            ["z"] = 122.18,
            ["h"] = 167.27
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive3"] = {
        ["coords"] = {
            ["x"] = -348.73,
            ["y"] = 514.95,
            ["z"] = 120.65,
            ["h"] = 316.96
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["didiondrive4"] = {
        ["coords"] = {
            ["x"] = -355.93,
            ["y"] = 469.76,
            ["z"] = 112.65,
            ["h"] = 104.28
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest1"] = {
        ["coords"] = {
            ["x"] = -908.66,
            ["y"] = 693.67,
            ["z"] = 151.44,
            ["h"] = 104.28
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest2"] = {
        ["coords"] = {
            ["x"] = -951.28,
            ["y"] = 682.65,
            ["z"] = 153.58,
            ["h"] = 177.85
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["hillcrest3"] = {
        ["coords"] = {
            ["x"] = -1056.34,
            ["y"] = 761.34,
            ["z"] = 167.32,
            ["h"] = 92.27
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon1"] = {
        ["coords"] = {
            ["x"] = -1130.87,
            ["y"] = 784.44,
            ["z"] = 163.89,
            ["h"] = 56.39
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon2"] = {
        ["coords"] = {
            ["x"] = -1117.77,
            ["y"] = 761.48,
            ["z"] = 164.29,
            ["h"] = 205.7
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon3"] = {
        ["coords"] = {
            ["x"] = -1065.02,
            ["y"] = 772.17,
            ["z"] = 170.06,
            ["h"] = 179.03
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon4"] = {
        ["coords"] = {
            ["x"] = -962.7,
            ["y"] = 814.09,
            ["z"] = 177.57,
            ["h"] = 0.44
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["northsheldon5"] = {
        ["coords"] = {
            ["x"] = -867.34,
            ["y"] = 785.0,
            ["z"] = 191.93,
            ["h"] = 182.44
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats1"] = {
        ["coords"] = {
            ["x"] = 80.09,
            ["y"] = 486.26,
            ["z"] = 148.2,
            ["h"] = 25.28
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats2"] = {
        ["coords"] = {
            ["x"] = 57.56,
            ["y"] = 449.68,
            ["z"] = 147.03,
            ["h"] = 147.72
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["wildoats3"] = {
        ["coords"] = {
            ["x"] = -110.05,
            ["y"] = 501.83,
            ["z"] = 143.38,
            ["h"] = 171.41
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    }, ]]

    -- Tier 1
    ["jamestown1"] = {
        ["coords"] = {
            ["x"] = 385.18,
            ["y"] = -1881.78,
            ["z"] = 26.03,
            ["h"] = 40.83
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown2"] = {
        ["coords"] = {
            ["x"] = 412.47,
            ["y"] = -1856.38,
            ["z"] = 27.32,
            ["h"] = 129.24
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["jamestown3"] = {
        ["coords"] = {
            ["x"] = 427.21,
            ["y"] = -1842.09,
            ["z"] = 28.46,
            ["h"] = 134.19
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow1"] = {
        ["coords"] = {
            ["x"] = 348.77,
            ["y"] = -1820.95,
            ["z"] = 28.89,
            ["h"] = 135.8
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow2"] = {
        ["coords"] = {
            ["x"] = 329.42,
            ["y"] = -1845.8,
            ["z"] = 27.75,
            ["h"] = 228.98
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["roylow3"] = {
        ["coords"] = {
            ["x"] = 320.27,
            ["y"] = -1854.06,
            ["z"] = 27.51,
            ["h"] = 225.09
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant1"] = {
        ["coords"] = {
            ["x"] = 192.29,
            ["y"] = -1883.23,
            ["z"] = 25.06,
            ["h"] = 326.47
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant2"] = {
        ["coords"] = {
            ["x"] = 171.52,
            ["y"] = -1871.53,
            ["z"] = 24.4,
            ["h"] = 245.19
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant3"] = {
        ["coords"] = {
            ["x"] = 128.24,
            ["y"] = -1897.02,
            ["z"] = 23.67,
            ["h"] = 239.54
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["covenant4"] = {
        ["coords"] = {
            ["x"] = 130.6,
            ["y"] = -1853.22,
            ["z"] = 25.23,
            ["h"] = 329.64
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove1"] = {
        ["coords"] = {
            ["x"] = 76.36,
            ["y"] = -1948.1,
            ["z"] = 21.17,
            ["h"] = 44.97
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove2"] = {
        ["coords"] = {
            ["x"] = 101.03,
            ["y"] = -1912.16,
            ["z"] = 21.41,
            ["h"] = 331.84
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove3"] = {
        ["coords"] = {
            ["x"] = 126.73,
            ["y"] = -1930.12,
            ["z"] = 21.38,
            ["h"] = 210.98
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grove4"] = {
        ["coords"] = {
            ["x"] = 114.25,
            ["y"] = -1961.19,
            ["z"] = 21.33,
            ["h"] = 198.18
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },

    -- Tier 2
--[[    ["prosperity1"] = {
        ["coords"] = {
            ["x"] = -1076.33,
            ["y"] = -1026.96,
            ["z"] = 4.54,
            ["h"] = 118.14
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity2"] = {
        ["coords"] = {
            ["x"] = -1064.64,
            ["y"] = -1057.42,
            ["z"] = 6.41,
            ["h"] = 115.35
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity3"] = {
        ["coords"] = {
            ["x"] = -1063.77,
            ["y"] = -1054.99,
            ["z"] = 2.15,
            ["h"] = 120.47
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity4"] = {
        ["coords"] = {
            ["x"] = -1054.07,
            ["y"] = -1000.2,
            ["z"] = 6.41,
            ["h"] = 296.69
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity5"] = {
        ["coords"] = {
            ["x"] = -985.89,
            ["y"] = -1121.74,
            ["z"] = 4.55,
            ["h"] = 297.63
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity6"] = {
        ["coords"] = {
            ["x"] = -1024.42,
            ["y"] = -1140.0,
            ["z"] = 2.75,
            ["h"] = 213.84
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity7"] = {
        ["coords"] = {
            ["x"] = -1074.13,
            ["y"] = -1152.73,
            ["z"] = 2.16,
            ["h"] = 118.65
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity8"] = {
        ["coords"] = {
            ["x"] = -1063.57,
            ["y"] = -1160.35,
            ["z"] = 2.75,
            ["h"] = 210.36
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity10"] = {
        ["coords"] = {
            ["x"] = -869.53,
            ["y"] = -1103.41,
            ["z"] = 6.45,
            ["h"] = 29.2
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["prosperity11"] = {
        ["coords"] = {
            ["x"] = -869.07,
            ["y"] = -1105.48,
            ["z"] = 2.49,
            ["h"] = 25.76
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    }, ]]

    -- Tier 1
    ["grapeseed1"] = {
        ["coords"] = {
            ["x"] = -715.16,
            ["y"] = -996.59,
            ["z"] = 18.33,
            ["h"] = 298.82
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["grapeseed2"] = {
        ["coords"] = {
            ["x"] = -741.65,
            ["y"] = -982.33,
            ["z"] = 17.44,
            ["h"] = 202.78
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto1"] = {
        ["coords"] = {
            ["x"] = -809.53,
            ["y"] = -978.36,
            ["z"] = 14.22,
            ["h"] = 307.28
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto2"] = {
        ["coords"] = {
            ["x"] = -805.86,
            ["y"] = -959.27,
            ["z"] = 18.22,
            ["h"] = 66.95
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto3"] = {
        ["coords"] = {
            ["x"] = -775.23,
            ["y"] = -891.55,
            ["z"] = 21.6,
            ["h"] = 179.1
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto4"] = {
        ["coords"] = {
            ["x"] = -984.14,
            ["y"] = -889.56,
            ["z"] = 2.15,
            ["h"] = 39.45
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto5"] = {
        ["coords"] = {
            ["x"] = -987.42,
            ["y"] = -891.48,
            ["z"] = 2.15,
            ["h"] = 30.85
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paleto6"] = {
        ["coords"] = {
            ["x"] = -975.31,
            ["y"] = -909.48,
            ["z"] = 2.16,
            ["h"] = 219.64
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels1"] = {
        ["coords"] = {
            ["x"] = 5.97,
            ["y"] = 108.91,
            ["z"] = 79.02,
            ["h"] = 254.45
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
    ["paletoHotels2"] = {
        ["coords"] = {
            ["x"] = 92.64,
            ["y"] = 49.34,
            ["z"] = 73.52,
            ["h"] = 250.32
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 4.15, ["y"] = 7.82, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Bedside Cabinet"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 5.95, ["y"] = 9.34, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Closet"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -1.03, ["y"] = 0.78, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {["x"] = 6.904, ["y"] = 3.987, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 0.933, ["y"] = 1.254, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Drawers"
            },
            [6] = {
                ["type"] = "cabin",
                ["coords"] = {["x"] = 6.19, ["y"] = 3.35, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Night Stand Cabinet"
            },
            [7] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -2.20, ["y"] = -0.30, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through the kitchen cabinets"
            },
            [8] = {
                ["type"] = "kitchen",
                ["coords"] = {["x"] = -4.35, ["y"] = -0.64, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [9] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.90, ["y"] = 4.42, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
            [10] = {
                ["type"] = "livingroom",
                ["coords"] = {["x"] = -6.98, ["y"] = 7.91, ["z"] = 1.0},
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search through shelves"
            },
        }
    },
}

Config.MaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true
}

Config.FemaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true
}
