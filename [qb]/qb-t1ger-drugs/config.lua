-------------------------------------
------- Created by T1GER#9080 -------
-------------------------------------

-- ## GENERAL CONFIG SETTINGS ## --

Config = {
    ProgressBars        = true,		                -- set to false if you do not use progressBars or using your own
    K4MB1_Labs          = false,                     -- only set to true if u own latest HIGH END DRUG LABS by K4MB1

    Police = {
        Jobs            = {'police', 'lspd'},       -- police job names in database
        Timer           = 5,                        -- time in minutes to fetch police count (5 min is a decent time, not suggested below)
        Alerts = {
            enable      = true,                     -- enable police alerts
            blip        = 'police'                  -- police alert blip settings (Config.Blips['police'])
        }
    },

    DrugSale = {
        blacklisted     = {             -- blacklisted ped models for selling;
            's_m_y_cop_01', 's_m_y_dealer_01', 'mp_m_shopkeep_01', 's_m_y_xmech_02_mp', 'mp_m_weed_01', 'ig_chef'
        },
        min_cops        = 2,            -- required cops online to sell drugs to NPC's.
        sell_chance     = 70,           -- chance in % to sell drugs to NPC.
        report_chance   = 50,           -- chance in % for NPC to call cops on failed drug sale
        wait_timer      = 5000,         -- wait timer between each drug sale in MS
        sell_time       = 3000,         -- time in MS to negotiate with NPC
        amount = {
            min         = 1,            -- min amount of drugs to sell
            max         = 20            -- max amount of drugs to sell (only if item.count allows it of course)
        },
        max_cap         = 150,          -- max amount of drugs to be sold per server restart per player, to disable set to 0.
        dirty_cash      = true,         -- set to false to receive normal cash
        command         = 'selldrugss'   -- command to enable/disable selling drugs (or fetch drug inventory)
    },

}

-- ## Plant Drugs ## --
Config.PlantProps = {
    ["stage-a"] = "bkr_prop_weed_01_small_01c",
    ["stage-b"] = "bkr_prop_weed_01_small_01b",
    ["stage-c"] = "bkr_prop_weed_01_small_01a",
    ["stage-d"] = "bkr_prop_weed_med_01b",
    ["stage-e"] = "bkr_prop_weed_lrg_01a",
    ["stage-f"] = "bkr_prop_weed_lrg_01b",
    ["stage-g"] = "bkr_prop_weed_lrg_01b",
}
-- ## Plant Drugs ## --


-- ## DRUG JOBS ## --
Config.DrugJobs = {

    Settings = {
        phoneMSG        = true,                         -- set to false to use ESX.ShowNotification for job messages.
        cooldown        = {enable = true, time = 12},   -- cooldowns for job and time in minutes.
        lockpick        = {key = 47, time = 5},         -- time in seconds to lockpick job vehicle and key to lockpick (DEFAULT: [G])
        alarm           = {enable = true, timer = 25},  -- enable/disable veh alarm and set time in seconds
        cancel_job      = 'drugs_cancel',               -- command to cancel drug job
    },

    NPC = {
        -- pos         = vector3(420.56,-2059.41,22.24),   -- pos for the NPC
        pos         = vector3(0, 0, 0),
        heading     = 134.63,                             -- heading for the NPC
        model       = 's_m_y_dealer_01',                -- NPC Model
        name        = 'LONG#2509',                     -- NPC name/number (if using phone msg)
        scenario    = 'WORLD_HUMAN_AA_SMOKE',			-- npc idle scenario
        keybind     = 38,                               -- Default: [E] - key to interact with npc

        -- player anim with NPC; Set dict, lib and duration time in seconds:
        ply_anim = { dict = 'missheistdockssetup1ig_5@base', lib = 'workers_talking_base_dockworker1', time = 3 },

        -- blip settings for NPC:
        blip = 'npc',   -- set type and edit blip settings in Config.Blips

        -- jobs that NPC offers from menu:
        menu = {
            -- enable/disable job | required cops to start | type of drug | label for job name | fees to start job
            [1] = { type = 'weed', label = 'Weed Job [$%s]', enable = true, fees = 1000, minCops = 1 },
            [2] = { type = 'meth', label = 'Meth Job [$%s]', enable = true, fees = 1250, minCops = 1 },
            [3] = { type = 'coke', label = 'Coke Job [$%s]', enable = true, fees = 1500, minCops = 1 }
        }
    },

    Jobs = {
        [1] = {
            -- pos         = vector3(-219.02,6382.34,31.61),   -- job veh position
            pos         = vector3(0, 0, 0),
            heading     = 41.46,                            -- job veh heading
            inUse = false, veh_spawned = false, goons_spawned = false, player = false, -- do not touch!!!
            blip        = 'job',              -- set blip settings in Config.Blips['job']
            goons   = {
                -- set pos, heading, model, anim dict & lib, weapon, armor and accuracy:
                [1] = {pos = vector3(-224.59,6383.22,31.51), heading = 347.59, model = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                [2] = {pos = vector3(-222.18,6390.82,31.73), heading = 132.96, model = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                [3] = {pos = vector3(-207.90,6375.73,31.54), heading = 77.10, model = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                -- add more if u want to
            },
            -- set lockpick pos and heading:
            lockpick = {pos = vector3(-220.72,6381.32,31.55), heading = 316.11},
        },
        [2] = {
            -- pos         = vector3(-679.55,5797.94,17.33),   -- job veh position
            pos         = vector3(0, 0, 0),
            heading     = 244.95,                           -- job veh heading
            inUse = false, veh_spawned = false, goons_spawned = false, player = false, -- do not touch!!!
            blip        = 'job',              -- set blip settings in Config.Blips['job']
            goons   = {
                -- set pos, heading, model, anim dict & lib, weapon, armor and accuracy:
                [1] = {pos = vector3(-679.20,5801.80,19.74), heading = 188.85, model = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                [2] = {pos = vector3(-684.60,5796.04,17.33), heading = 155.99, model = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                [3] = {pos = vector3(-669.90,5796.82,17.33), heading = 133.18, model = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armor = 100, accuracy = 60 },
                -- add more if u want to
            },
            -- set lockpick pos and heading:
            lockpick = {pos = vector3(-678.38,5798.88,17.33), heading = 163.68},
            -- set job blip:
        },
        -- add more jobs if u want
    },

    Vehicles = {'rumpo2', 'speedo'},                         -- vehicles used in jobs (randomized)

    Delivery = {
        -- add delivery locations (randomized), set marker type and blip type (Config.Markers & Config.Blips)
        [1] = { pos = vector3(1243.63,-3263.36,5.59), marker = 'delivery', blip = 'delivery' },
        [2] = { pos = vector3(1016.09,-2904.82,5.9), marker = 'delivery', blip = 'delivery' },
    },

    Reward = {
        -- add item label and name, chance, min and max amount
        ['weed'] = {
            [1] = { label = 'Weed Leaf', item = 'weed_leaf', chance = 100, amount = {min = 1, max = 3} }
        },
        ['meth'] = {
            [1] = { label = 'Meth Ingredient', item = 'meth_ingredient', chance = 100, amount = {min = 10, max = 15} },
            [2] = { label = 'Chemicals', item = 'chemicals', chance = 100, amount = {min = 4, max = 10} },
        },
        ['coke'] = {
            [1] = { label = 'Coca Leaf', item = 'coca_leaf', chance = 100, amount = {min = 12, max = 18} },
            [2] = { label = 'Chemicals', item = 'chemicals', chance = 100, amount = {min = 2, max = 10} },
            [3] = { label = 'Cutted Coke', item = 'coke_cutted', chance = 20, amount = {min = 1, max = 3} },
        },
    }
}

-- ## DRUG EFFECTS ## --
Config.DrugEffects = {
    ['coke_packaged'] = {                                                   -- item name
        progressBar = { enable = true, text = "SMOKING CRACK COKE", },      -- progbar enable and progbar text
        scenario = {name = 'WORLD_HUMAN_SMOKING_POT', timer = 5000},        -- scenario name and duration in ms
        duration = 30,                                                      -- effect duration seconds
        timeCycleMod = {enable = true, type = "spectator5"},                -- enable time cycle modifier and set type (https://pastebin.com/kVPwMemE)
        sprint = {enable = true, value = 1.2},                              -- enable faster sprint and set value (default 1.0)
        motion_blur = true,             							        -- enable or disable motion blur while on drugs
        stamina = true,              							            -- enable or disable unlimited stamina
        armor = {enable = false, value = 10},              					-- apply body armor when using drugs and set value that will be added.
        health = {enable = false, value = 20},              				-- apply health when using drugs and set value that will be added.
    },
    ['meth_packaged'] = {                                                   -- item name
        progressBar = { enable = true, text = "SMOKING METH", },            -- progbar enable and progbar text
        scenario = {name = 'WORLD_HUMAN_SMOKING_POT', timer = 5000},        -- scenario name and duration in ms
        duration = 30,                                                      -- effect duration seconds
        timeCycleMod = {enable = true, type = "spectator5"},                -- enable time cycle modifier and set type (https://pastebin.com/kVPwMemE)
        sprint = {enable = false, value = 1.2},                              -- enable faster sprint and set value (default 1.0)
        motion_blur = true,             							        -- enable or disable motion blur while on drugs
        stamina = false,              							            -- enable or disable unlimited stamina
        armor = {enable = false, value = 10},              					-- apply body armor when using drugs and set value that will be added.
        health = {enable = true, value = 20},              				    -- apply health when using drugs and set value that will be added.
    },
    ['weed_joint'] = {                                                      -- item name
        progressBar = { enable = true, text = "SMOKING WEED", },            -- progbar enable and progbar text
        scenario = {name = 'WORLD_HUMAN_SMOKING_POT', timer = 5000},        -- scenario name and duration in ms
        duration = 30,                                                      -- effect duration seconds
        timeCycleMod = {enable = true, type = "spectator5"},                -- enable time cycle modifier and set type (https://pastebin.com/kVPwMemE)
        sprint = {enable = false, value = 1.2},                              -- enable faster sprint and set value (default 1.0)
        motion_blur = true,             							        -- enable or disable motion blur while on drugs
        stamina = false,              							            -- enable or disable unlimited stamina
        armor = {enable = true, value = 10},              					-- apply body armor when using drugs and set value that will be added.
        health = {enable = false, value = 20},              				-- apply health when using drugs and set value that will be added.
    }
}

-- ## DRUG LABS ## --

Config.Shells = {
    ['coke1'] = {prop = GetHashKey('shell_coke2'), type = 'coke'},
    ['meth1'] = {prop = GetHashKey('shell_meth'), type = 'meth'},
    ['weed1'] = {prop = GetHashKey('shell_weed2'), type = 'weed'},
    ['coke2'] = {prop = GetHashKey('k4coke_shell'), enable = Config.K4MB1_Labs, type = 'coke'},
    ['meth2'] = {prop = GetHashKey('k4meth_shell'), enable = Config.K4MB1_Labs, type = 'meth'},
    ['weed2'] = {prop = GetHashKey('k4weed_shell'), enable = Config.K4MB1_Labs, type = 'weed'},
}

Config.DrugLabs = {
    -- [1] = { pos = vector3(0, 0, 0), h = 267.81, type = 'coke', shell = 'coke1', blip = false, cache = {} },   -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
    -- [2] = { pos = vector3(0, 0, 0), h = 35.33, type = 'meth', shell = 'meth1', blip = false, cache = {} },  -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
    [1] = { pos = vector3(1400.75, 2169.9, 97.9), h = 86.16, type = 'weed', shell = 'weed1', blip = false, cache = {} },  -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
    -- [4] = { pos = vector3(853.15,-2207.42,30.57), h = 263.88, type = 'coke', shell = 'coke2', blip = false, cache = {} },  -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
    -- [5] = { pos = vector3(-969.52,-266.42,38.55), h = 118.02, type = 'meth', shell = 'meth2', blip = false, cache = {} },  -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
    -- [6] = { pos = vector3(359.68, 356.37, 104.33), h = 342.53, type = 'weed', shell = 'weed2', blip = false, cache = {} },  -- set pos, heading, type, shell, blip (enable/disable) for drug labs (don't touch 'cache')
}

Config.Offsets = {
    ['coke1'] = {
        heading     = 180.51,                           -- player heading when spawned inside shell
        exit        = vector3(-6.28,8.69,-1.93),        -- exit offset pos
        process_pos = vector3(5.99,-2.71,-1.93),        -- npc/process offset pos
        process_h   = 176.43,                           -- npc/process heading
        package_pos = vector3(-4.66,-0.48,-1.93),       -- package pos
        package_h   = 358.33,                           -- package heading
        scene_pos   = vector3(-1.8, -0.35, -0.33),      -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, -180.0),        -- offset rotation for scene
    },
    ['meth1'] = {
        heading     = 178.93,                           -- player heading when spawned inside shell
        exit        = vector3(-6.32,8.62,-1.93),        -- exit offset pos
        process_pos = vector3(-0.28,-2.28,-1.93),       -- npc/process offset pos
        process_h   = 181.38,                           -- npc/process heading
        package_pos = vector3(6.51,2.94,-1.93),         -- package pos
        package_h   = 358.78,                           -- package heading
        scene_pos   = vector3(4.6, 1.6, 0.0),           -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, 0.0),           -- offset rotation for scene
    },
    ['weed1'] = {
        heading     = 88.79,                            -- player heading when spawned inside shell
        exit        = vector3(17.81,11.63,-3.07),       -- exit offset pos
        process_pos = vector3(-15.27,-8.29,-2.09),      -- npc/process offset pos
        process_h   = 133.45,                           -- npc/process heading
        package_pos = vector3(-15.95,-12.30,-2.09),     -- package pos
        package_h   = 269.65,                           -- package heading
        scene_pos   = vector3(-0.7, 0.1, 0.0),           -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, -90.0),           -- offset rotation for scene
    },
    ['coke2'] = {
        heading     = 266.66,                           -- player heading when spawned inside shell
        exit        = vector3(-10.79,-2.51,-1.05),      -- exit offset pos
        process_pos = vector3(5.00,-3.22,-3.65),        -- npc/process offset pos
        process_h   = 176.79,                           -- npc/process heading
        package_pos = vector3(-1.15,1.22,-3.65),        -- package pos
        package_h   = 177.52,                           -- package heading
        scene_pos   = vector3(1.8, 0.35, -0.33),        -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, 0.0),           -- offset rotation for scene
    },
    ['meth2'] = {
        heading     = 266.66,                           -- player heading when spawned inside shell
        exit        = vector3(-10.79,-2.51,-1.05),      -- exit offset pos
        process_pos = vector3(0.02,-2.83,-3.65),        -- npc/process offset pos
        process_h   = 180.29,                           -- npc/process heading
        package_pos = vector3(6.34,3.21,-3.65),         -- package pos
        package_h   = 356.97,                           -- package heading
        scene_pos   = vector3(4.6, 1.6, 0.0),           -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, 0.0),           -- offset rotation for scene
    },
    ['weed2'] = {
        heading     = 266.66,                           -- player heading when spawned inside shell
        exit        = vector3(-10.79,-2.51,-1.05),      -- exit offset pos
        process_pos = vector3(-6.19,-2.97,-3.65),       -- npc/process offset pos
        process_h   = 178.56,                           -- npc/process heading
        package_pos = vector3(4.33,3.30,-3.65),         -- package pos
        package_h   = 359.0,                            -- package heading
        scene_pos   = vector3(-0.1, -0.7, 0.0),           -- offset for scene pos
        scene_rot   = vector3(0.0, 0.0, 0.0),           -- offset rotation for scene
    },
}

-- Define all drug types in here:
Config.DrugTypes = {
    ['coke'] = {
        sell = {
            items = {
                ['coke_packaged'] = {min = 700, max = 1100},                 -- item name, min & max sell price
                -- add more sellable coke items in here if u want to.
            },
            multiplier = {enable = false, min_cops = 1, value = 10}
        },
        enter = { text = '~r~[E]~s~ Enter Coke Lab', key = 38},             -- draw text & key to enter lab (DEFAULT [E])
        exit = { text = '~r~[E]~s~ Leave Coke Lab', key = 38 },             -- draw text & key to exit lab (DEFAULT [E])
        process = {
            model       = 's_m_y_dealer_01',                                -- ped model for process NPC
            anim_dict   = 'anim@amb@business@coc@coc_unpack_cut_left@',     -- anim dict for process NPC
            anim_lib    = 'coke_cut_v5_coccutter',                          -- anim lib for process NPC
            props = {
                [1] = {model = 'prop_cs_credit_card', boneIndex = 18905, pos = vector3(0.12, 0.0, 0.04), rot = vector3(0.0, 0.0, 65.0)},
                [2] = {model = 'prop_cs_credit_card', boneIndex = 57005, pos = vector3(0.13, 0.0, -0.03), rot = vector3(0.0, 0.0, 75.0)}
            },
            give        = {text = '~r~[G]~s~ Process Coke', key = 47},          -- draw text & key to process/give (DEFAULT [G])
            collect     = {text = '~r~[E]~s~ Collect Cutted Coke', key = 38},   -- draw text & key to collect (DEFAULT [E])
            input = {
                [1] = {label = 'Coca Leaf', item = 'coca_leaf', amount = 5},    -- input/required item, label and amount to process output.amount.min
                [2] = {label = 'Chemicals', item = 'chemicals', amount = 2}     -- input/required item, label and amount to process output.amount.min
            },
            output = {
                label   = 'Cutted Coke',    -- output/reward item label
                item    = 'coke_cutted',    -- output/reward item name
                amount  = {
                    min = 10,               -- minimum amount of output/reward item to process
                    max = 200               -- maximum amount of output/reward item to process
                }
            },
            time        = 1                 -- time in minutes till NPC is done processing.
        },
        package = {
            text                = '~r~[E]~s~ Package Coke',     -- draw text to package
            key                 = 38,                           -- key to package (DEFAULT [E])
            input = {
                [1] = {label = 'Cutted Coke', item = 'coke_cutted', amount = 1},    -- input/required item, label and amount to package output.amount.min
                [2] = {label = 'Plastic Bags', item = 'plastic_bags', amount = 1}   -- input/required item, label and amount to package output.amount.min
            },
            output = {
                label           = 'Packaged Coke',      -- output/reward item label
                item            = 'coke_packaged',      -- output/reward item name
                amount  = {
                    min         = 5,                    -- minimum amount of output/reward item to package
                    max         = 200                   -- maximum amount of output/reward item to package
                },
                scale = {
                    enable      = true,                 -- enable/disable multiplying outcome, if player has a scale in inventory
                    item        = 'hq_scale',           -- scale item
                    percent     = 10                    -- % of output that player receives additionally, so if (10%) and outcome is 50 player receives 55.
                }
            }
        }
    },
    ['meth'] = {
        sell = {
            items = {
                ['meth_packaged'] = {min = 1100, max = 1300},                 -- item name, min & max sell price
                -- add more sellable coke items in here if u want to.
            },
            multiplier = {enable = false, min_cops = 2, value = 10}
        },
        enter = { text = '~r~[E]~s~ Enter Meth Lab', key = 38},             -- draw text & key to enter lab (DEFAULT [E])
        exit = { text = '~r~[E]~s~ Leave Meth Lab', key = 38 },             -- draw text & key to exit lab (DEFAULT [E])
        process = {
            model       = 'ig_chef',                                -- ped model for process NPC
            anim_dict   = 'anim@amb@business@meth@meth_monitoring_cooking@monitoring@',     -- anim dict for process NPC
            anim_lib    = 'check_guages_v2_monitor',                                        -- anim lib for process NPC
            props = {
                [1] = {model = 'bkr_prop_fakeid_clipboard_01a', boneIndex = 18905, pos = vector3(-0.03, 0.08, 0.05), rot = vector3(-20.0,15.5,-10.0)}
            },
            give        = {text = '~r~[G]~s~ Process Meth', key = 47},          -- draw text & key to process/give (DEFAULT [G])
            collect     = {text = '~r~[E]~s~ Collect Pure Meth', key = 38},   -- draw text & key to collect (DEFAULT [E])
            input = {
                [1] = {label = 'Meth Ingredient', item = 'meth_ingredient', amount = 4},    -- input/required item, label and amount to process output.amount.min
                [2] = {label = 'Chemicals', item = 'chemicals', amount = 3}                 -- input/required item, label and amount to process output.amount.min
            },
            output = {
                label   = 'Pure Meth',    -- output/reward item label
                item    = 'meth_pure',    -- output/reward item name
                amount  = {
                    min = 10,               -- minimum amount of output/reward item to process
                    max = 200               -- maximum amount of output/reward item to process
                }
            },
            time        = 1                 -- time in minutes till NPC is done processing.
        },
        package = {
            text                = '~r~[E]~s~ Package Meth',     -- draw text to package
            key                 = 38,                           -- key to package (DEFAULT [E])
            input = {
                [1] = {label = 'Pure Meth', item = 'meth_pure', amount = 1},        -- input/required item, label and amount to package output.amount.min
                [2] = {label = 'Plastic Bags', item = 'plastic_bags', amount = 1}   -- input/required item, label and amount to package output.amount.min
            },
            output = {
                label           = 'Packaged Meth',      -- output/reward item label
                item            = 'meth_packaged',      -- output/reward item name
                amount  = {
                    min         = 5,                    -- minimum amount of output/reward item to package
                    max         = 200                   -- maximum amount of output/reward item to package
                },
                scale = {
                    enable      = true,                 -- enable/disable multiplying outcome, if player has a scale in inventory
                    item        = 'hq_scale',           -- scale item
                    percent     = 10                    -- % of output that player receives additionally, so if (10%) and outcome is 50 player receives 55.
                }
            }
        }
    },
    ['weed'] = {
        sell = {
            items = {
                ['weed_packaged'] = {min = 1000, max = 1200},                 -- item name, min & max sell price
                -- add more sellable coke items in here if u want to.
            },
            multiplier = {enable = false, min_cops = 2, value = 10}
        },
        enter = { text = '~r~[E]~s~ Enter Weed Lab', key = 38},             -- draw text & key to enter lab (DEFAULT [E])
        exit = { text = '~r~[E]~s~ Leave Weed Lab', key = 38 },             -- draw text & key to exit lab (DEFAULT [E])
        process = {
            model       = 'mp_m_weed_01',                                   -- ped model for process NPC
            anim_dict   = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',     -- anim dict for process NPC
            anim_lib    = 'weed_spraybottle_crouch_idle_02_inspector',                                        -- anim lib for process NPC
            props       = {},
            give        = {text = '~r~[G]~s~ Process Weed', key = 47},              -- draw text & key to process/give (DEFAULT [G])
            collect     = {text = '~r~[E]~s~ Collect Untrimmed Weed', key = 38},    -- draw text & key to collect (DEFAULT [E])
            input = {
                [1] = {label = 'Weed Leaf', item = 'weed_leaf', amount = 3},        -- input/required item, label and amount to process output.amount.min
            },
            output = {
                label   = 'Untrimmed Weed',     -- output/reward item label
                item    = 'weed_untrimmed',     -- output/reward item name
                amount  = {
                    min = 1,                   -- minimum amount of output/reward item to process
                    max = 1                   -- maximum amount of output/reward item to process
                }
            },
            time        = 0.5                     -- time in minutes till NPC is done processing.
        },
        package = {
            text                = '~r~[E]~s~ Package Weed',     -- draw text to package
            key                 = 38,                           -- key to package (DEFAULT [E])
            input = {
                [1] = {label = 'Untrimmed Weed', item = 'weed_untrimmed', amount = 1},  -- input/required item, label and amount to package output.amount.min
                [2] = {label = 'Plastic Bags', item = 'plastic_bags', amount = 1}       -- input/required item, label and amount to package output.amount.min
            },
            output = {
                label           = 'Packaged Weed',      -- output/reward item label
                item            = 'weed_packaged',      -- output/reward item name
                amount  = {
                    min         = 1,                    -- minimum amount of output/reward item to package
                    max         = 1                   -- maximum amount of output/reward item to package
                },
                scale = {
                    enable      = true,                 -- enable/disable multiplying outcome, if player has a scale in inventory
                    item        = 'hq_scale',           -- scale item
                    percent     = 10                    -- % of output that player receives additionally, so if (10%) and outcome is 50 player receives 55.
                }
            }
        },
    },
}

Config.DrugItemConverter = {
    -- ROLLING JOINTS:
    ['weed_packaged'] = {                                                   -- Useable item name
        output = {item = 'weed_joint', amount = {a = 1, b = 3}},            -- output item and amount, a is without scale and b is with scale.
        requirements = {
            [1] = { item = 'rolling_paper', amount = {a = 1, b = 3} }       -- required items to do conversion, a is without scale and b is with scale.
        },
        scale = {item = 'hq_scale', enable = false},                         -- scale item and enable/disable, if disabled, script will just use amount.a and not the b value!
        text = 'ROLLING JOINT',                                             -- progressbars text
        time = 3000                                                         -- time in ms to convert
    },
    -- ADD MORE CONVERSION HERE:
}


Config.Scenes = {
    ['coke'] = {
        dict = 'anim@amb@business@coc@coc_unpack_cut_left@',
        player_anim = 'coke_cut_v5_coccutter',
        entity_anims = {
            bakingsoda  = 'coke_cut_v5_bakingsoda',
            creditcard = 'coke_cut_v5_creditcard',
            creditcard_01 = 'coke_cut_v5_creditcard^1'
        },
        objects = {
            bakingsoda  = 'bkr_prop_coke_bakingsoda_o',
            creditcard = 'prop_cs_credit_card',
            creditcard_01 = 'prop_cs_credit_card'
        },
        time = 21000,
        text = 'PACKAGING COKE'
    },
    ['meth'] = {
        dict = 'anim@amb@business@meth@meth_smash_weight_check@',
        player_anim = 'break_weigh_v2_char01',
        entity_anims = {
            box01      = 'break_weigh_v2_box01',
            box01_01      = 'break_weigh_v2_box01^1',
            clipboard = 'break_weigh_v2_clipboard',
            methbag01  = 'break_weigh_v2_methbag01',
            methbag01_01  = 'break_weigh_v2_methbag01^1',
            methbag01_02  = 'break_weigh_v2_methbag01^2',
            methbag01_03  = 'break_weigh_v2_methbag01^3',
            methbag01_04  = 'break_weigh_v2_methbag01^4',
            methbag01_05  = 'break_weigh_v2_methbag01^5',
            methbag01_06  = 'break_weigh_v2_methbag01^6',
            pen       = 'break_weigh_v2_pen',
            scale     = 'break_weigh_v2_scale',
            scoop     = 'break_weigh_v2_scoop'
        },
        objects = {
            box01      = 'bkr_prop_meth_bigbag_04a',
            box01_01      = 'bkr_prop_meth_bigbag_03a',
            clipboard = 'bkr_prop_fakeid_clipboard_01a',
            methbag01  = 'bkr_prop_meth_openbag_02',
            methbag01_01  = 'bkr_prop_meth_openbag_02',
            methbag01_02  = 'bkr_prop_meth_openbag_02',
            methbag01_03  = 'bkr_prop_meth_openbag_02',
            methbag01_04  = 'bkr_prop_meth_openbag_02',
            methbag01_05  = 'bkr_prop_meth_openbag_02',
            methbag01_06  = 'bkr_prop_meth_openbag_02',
            pen       = 'bkr_prop_fakeid_penclipboard',
            scale     = 'bkr_prop_coke_scale_01',
            scoop     = 'bkr_prop_meth_scoop_01a'
        },
        time = 28000,
        text = 'PACKAGING METH'
    },
    ['weed'] = {
        dict = 'anim@amb@business@weed@weed_sorting_seated@',
        player_anim = 'sorter_right_sort_v3_sorter02',
        entity_anims = {
            weeddry01a      = 'sorter_right_sort_v3_weeddry01a',
            weeddry01a_01   = 'sorter_right_sort_v3_weeddry01a^1',
            weedleaf01a     = 'sorter_right_sort_v3_weedleaf01a',
            weedleaf01a_01  = 'sorter_right_sort_v3_weedleaf01a^1',
            weedbag01a      = 'sorter_right_sort_v3_weedbag01a',
            weedbud02b      = 'sorter_right_sort_v3_weedbud02b',
            weedbud02b_01   = 'sorter_right_sort_v3_weedbud02b^1',
            weedbud02b_02   = 'sorter_right_sort_v3_weedbud02b^2',
            weedbud02b_03   = 'sorter_right_sort_v3_weedbud02b^3',
            weedbud02b_04   = 'sorter_right_sort_v3_weedbud02b^4',
            weedbud02b_05   = 'sorter_right_sort_v3_weedbud02b^5',
            weedbud02a      = 'sorter_right_sort_v3_weedbud02a',
            weedbud02a_01   = 'sorter_right_sort_v3_weedbud02a^1',
            weedbud02a_02   = 'sorter_right_sort_v3_weedbud02a^2',
            weedbagpile01a  = 'sorter_right_sort_v3_weedbagpile01a',
            bucket01a       = 'sorter_right_sort_v3_bucket01a',
            bucket01a_01    = 'sorter_right_sort_v3_bucket01a^1'
        },
        objects = {
            weeddry01a      = 'bkr_prop_weed_dry_01a',
            weeddry01a_01   = 'bkr_prop_weed_dry_01a',
            weedleaf01a     = 'bkr_prop_weed_leaf_01a',
            weedleaf01a_01  = 'bkr_prop_weed_leaf_01a',
            weedbag01a      = 'bkr_prop_weed_bag_01a',
            weedbud02b      = 'bkr_prop_weed_bud_02b',
            weedbud02b_01   = 'bkr_prop_weed_bud_02b',
            weedbud02b_02   = 'bkr_prop_weed_bud_02b',
            weedbud02b_03   = 'bkr_prop_weed_bud_02b',
            weedbud02b_04   = 'bkr_prop_weed_bud_02b',
            weedbud02b_05   = 'bkr_prop_weed_bud_02b',
            weedbud02a      = 'bkr_prop_weed_bud_02a',
            weedbud02a_01   = 'bkr_prop_weed_bud_02a',
            weedbud02a_02   = 'bkr_prop_weed_bud_02a',
            weedbagpile01a  = 'bkr_prop_weed_bag_pile_01a',
            bucket01a       = 'bkr_prop_weed_bucket_open_01a',
            bucket01a_01    = 'bkr_prop_weed_bucket_open_01a'
        },
        chair_prop = 'prop_chair_04b',
        time = 30000,
        text = 'PACKAGING WEED'
    }
}

Config.Timeout = 15000

-- Config.Weed = {
--     [1] = {
--         ["coords"] = vector3(2216.25, 5577.53, 52.84),
--         ["isPicked"] = false,
--         ["heading"] = 96.48
--     },
--     [2] = {
--         ["coords"] = vector3(2218.53, 5577.35, 52.86),
--         ["isPicked"] = false,
--         ["heading"] = 275.37
--     },
--     [3] = {
--         ["coords"] = vector3(2220.54, 5577.25, 52.85),
--         ["isPicked"] = false,
--         ["heading"] = 136.55
--     },
--     [4] = {
--         ["coords"] = vector3(2223.06, 5577.11, 52.84),
--         ["isPicked"] = false,
--         ["heading"] = 233.8
--     },
--     [5] = {
--         ["coords"] = vector3(2225.32, 5576.92, 52.86),
--         ["isPicked"] = false,
--         ["heading"] = 245.34
--     },
--     [6] = {
--         ["coords"] = vector3(2227.68, 5576.77, 52.88),
--         ["isPicked"] = false,
--         ["heading"] = 96.62
--     },
--     [7] = {
--         ["coords"] = vector3(2230.17, 5576.59, 52.96),
--         ["isPicked"] = false,
--         ["heading"] = 33.98
--     },
--     [8] = {
--         ["coords"] = vector3(2232.64, 5576.41, 53.04),
--         ["isPicked"] = false,
--         ["heading"] = 245.92
--     }
-- }

Config.Markers = {
    -- job delivery marker:
    ['delivery'] = { drawDist = 10.0, type = 20, scale = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 240, g = 52, b = 52, a = 100} },
    -- drug lab coke marker:
    ['coke'] = {drawDist = 10.0, type = 20, scale = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 240, g = 52, b = 52, a = 100} },
    -- drug lab meth marker:
    ['meth'] = {drawDist = 10.0, type = 20, scale = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 240, g = 52, b = 52, a = 100} },
    -- drug lab weed marker:
    ['weed'] = {drawDist = 10.0, type = 20, scale = {x = 0.5, y = 0.5, z = 0.5}, color = {r = 240, g = 52, b = 52, a = 100} },
}

Config.Blips = {
    -- npc ped job blip:
    ['npc'] = {enable = false, sprite = 280, color = 5, scale = 0.8, label = Lang['npc_blip'], display = 4},
    -- job vehicle blip:
    ['job'] = {enable = false, sprite = 1, color = 5, scale = 0.65, label = Lang['drug_blip'], display = 4, route = true},
    -- job delivery blip:
    ['delivery'] = {enable = false, sprite = 1, color = 5, scale = 0.75, label = Lang['delivery_blip'], display = 4, route = true},
    -- police alert blip on map
    ['police'] = {show = false, time = 20, radius = 50, alpha = 250, color = 3},
    -- coke lab blip:
    ['coke'] = {enable = false, sprite = 51, color = 0, scale = 0.75, label = Lang['coke_lab'], display = 4},
    -- meth lab blip:
    ['meth'] = {enable = false, sprite = 51, color = 54, scale = 0.75, label = Lang['meth_lab'], display = 4},
    -- weed lab blip:
    ['weed'] = {enable = false, sprite = 51, color = 25, scale = 0.75, label = Lang['weed_lab'], display = 4},
}
