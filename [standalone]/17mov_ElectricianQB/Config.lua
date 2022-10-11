Config = {}
Config.MinimumCoursesToMedium = 15      -- One course will give player one point. So if Config.MinimumCoursesToMedium = 15, then player will need to make first 15 easy courses
Config.MinimumCoursesToHard = 30        -- Same as above but with hard level :D
Config.EnableRedArrowMarker = true      -- Set to false to hide big red arrow over a target location
Config.UseTarget = false                -- Set to true if you want to use Target System. You can configure your target under /client/target.lua file.
Config.RequiredJob = "none"             -- Set to "none" if you dont want using jobs. If you are using target, you have to set "job" parameter inside every export in target.lua

Config.Blips = {                        -- Here you can configure Job Blip
    [1] = {
        Sprite = 590,
        Color = 26,
        Scale = 0.8,
        Pos = vector3(751.06, 222.85, 87.42),
        Label = 'Electrician'
    },
}

Config.Payments = {                    -- Reward for completing one level with a given difficulty level
    ["easy"] = 500,
    ["medium"] = 750,
    ["hard"] = 1000,
}

Config.VehicleCauction = 500           -- Deposit for the car collected at the time of pulling out, and refunded when returning the car

Config.MarkerSettings = {              -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
    Active = {
        r = 255, 
        g = 153,
        b = 20,
        a = 200,
    },
    UnActive = {
        r = 255,
        g = 20,
        b = 20,
        a = 200,
    }
}

Config.SpawnPoint = vector4(804.57, 206.54, 81.2, 239.12)       -- Job Vehicle spawnpoint
Config.VehicleModel = "baller"                                  -- Job Vehicle model
Config.Locations = {                                            -- Here you can configure Markers Locations :D
    DutyToggle = {
        Coords = {
            vector3(751.06, 222.85, 87.42),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0}
    },
    StoreVeh = {
        Coords = {
            vector3(804.57, 206.54, 81.2),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~store ~s~car.',
        type = 'duty',
        scale = {x = 3.0, y = 3.0, z = 3.0}
    },
}


Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["hostSuccess"] = "Congratulations! Now wait for your partner to fix the defect.",
    ["wrongCar"] = "You must be in a company vehicle to get your bail bond back!",
    ["AlreadyTaken"] = "You or someone from the team has taken out a company vehicle before!",
    ["nobodyAround"] = "No Persons around!",
    ["cantInvite"] = "Only the Team Owner can invite others.",
    ["kickNotify"] = "You kicked %s out of the team",
    ["plyIsBusy"] = "First, complete the previous order.",
    ["leftTeam"] = "You have left the Team!",
    ["tooFar"] = "Your team has started work, but you are too far away from headquarters. You can still join them.",
    ["cantSpawn"] = "The truck's spawn location is occupied.",
    ["waitingForReady"] = "Waiting for a partner to be ready....",
    ["failedHostSide"] = "Your Partner failed to fix the fault. Go to the base to take another order!",
    ["failedClientSide"] = "You failed to fix the fault. Go to the base to take another order!",
    ["doneHostSide"] = "Your Partner managed to fix the fault.",
    ["doneClientSide"] = "You have successfully fixed the fault. Job completed.",
    ["dontGiveVehicle2ndTime"] = "You didn't return the previous car, so we're not giving you another one!",
    ["turnOffVoltage"] = "Turn off the voltage",
    ["FixFault"] = "Fix the Fault",
    ["no_permission"] = "Only the team owner can do it",
    ["Leave"] = "Leave",
    ["walkedAway"] = "Your partner turned off the voltage, but you walked away from the place. Return to the place to continue",
    ["spawnPointBusy"] = "The car's spawn site is occupied",
    ["notDriver"] = "You are not the driver of this vehicle",

    -- Server
    ['PromotionMedium'] = 'Congratulations! The boss has promoted you in the company. From now on you can take Medium orders!',
    ['PromotionHard'] = 'Congratulations! The boss has promoted you in the company. From now on you can take hard orders!',
    ['Promotion'] = 'Congratulations! The boss has promoted you in the company. From now on you can take difficult orders!',
    ['ReturnDeposit'] = 'The deposit for the owner of the vehicle was returned!',
    ['Deposit'] = 'Deposits of $500 were collected',
    ["isAlreadyHost"] = "This player leads his team.",
    ["isBusy"] = "This player already belongs to another team.", 
    ["hasActiveInvite"] = "This Player already has an active invitation from someone.",
    ["HaveActiveInvite"] = "You already have an active invitation to join the team.",
    ["InviteDeclined"] = "Your invitation has been declined.",
    ["InviteAccepted"] = "Your invitation has been accepted!",
    ["error"] = "There was a Problem joining a team. Please try again later.",
    ["kickedOut"] = "You've been kicked out of the garbage team!",
    ["reward"] = "You have received a payout of $",
    ["RequireOneFriend"] = "This job requires one team member",
    ["dontHaveReqItem"] = "You do not have the required item to start work"
}

Config.Clothes = {

    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.

    male = {          
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 64},{["component_id"] = 4, ["texture"] = 7, ["drawable"] = 9},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 25},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 54},},
    },         
    female = {
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 75},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 30},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 25},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 47},},
    }
}

Config.JobLocations = {

    -- Here you can change, or add some targets locations for given difficulties:

    ["easy"] = {
        [1] = {
            [1] = vector3(195.31, -1476.15, 29.31),
            [2] = vector3(193.72, -1475.4, 29.31),
        },
        [2] = {
            [1] = vector3(58.09, -1433.78, 29.31),
            [2] = vector3(53.94, -1449.04, 29.31),
        },
        [3] = {
            [1] = vector3(-96.01, -1512.71, 33.73),
            [2] = vector3(-95.01, -1511.67, 33.72),
        },
        [4] = {
            [1] = vector3(-115.81, -1553.53, 33.95),
            [2] = vector3(-114.58, -1554.29, 33.91),
        },
        [5] = {
            [1] = vector3(-7.64, -1648.91, 29.32),
            [2] = vector3(-32.07, -1673.6, 29.49),
        },
        [6] = {
            [1] = vector3(-33.5, -1723.18, 29.29),
            [2] = vector3(-32.07, -1722.37, 29.29),
        },
        [7] = {
            [1] = vector3(59.26, -1734.47, 29.31),
            [2] = vector3(41.4, -1755.47, 29.3),
        },
        [8] = {
            [1] = vector3(33.72, -1764.82, 29.32),
            [2] = vector3(23.6, -1777.01, 29.33),
        },
        [9] = {
            [1] = vector3(75.61, -1895.55, 21.89),
            [2] = vector3(74.79, -1896.54, 21.79),
        },
        [10] = {
            [1] = vector3(-88.04, -1750.34, 29.54),
            [2] = vector3(-88.71, -1751.79, 29.76),
        },
        [11] = {
            [1] = vector3(-299.99, -932.17, 31.08),
            [2] = vector3(-301.53, -931.48, 31.08),
        },
        [12] = {
            [1] = vector3(-1182.37, -904.19, 13.46),
            [2] = vector3(-1181.77, -903.82, 13.48),
        },
        [13] = {
            [1] = vector3(-1254.73, -875.22, 12.17),
            [2] = vector3(-1253.91, -874.43, 12.19),
        },
        [14] = {
            [1] = vector3(-1255.61, -866.8, 12.3),
            [2] = vector3(-1267.87, -863.68, 22.28),
        }
    },

    ["medium"] = {
        [1] = {
            [1] = vector3(-1274.09, -850.47, 13.1),
            [2] = vector3(-1286.14, -834.59, 17.1),
        },
        [2] = {
            [1] = vector3(-1263.18, -818.07, 17.1),
            [2] = vector3(-1287.46, -791.12, 17.58),
        },
        [3] = {
            [1] = vector3(-1318.4, -799.73, 17.56),
            [2] = vector3(-1304.59, -803.61, 17.58),
        },
        [4] = {
            [1] = vector3(-1302.11, -775.62, 19.47),
            [2] = vector3(-1313.89, -764.16, 20.31),
        },
        [5] = {
            [1] = vector3(-1317.51, -759.52, 20.42),
            [2] = vector3(-1323.3, -744.39, 31.66),
        },
        [6] = {
            [1] = vector3(-1462.74, -684.9, 26.47),
            [2] = vector3(-1442.32, -690.56, 26.41),
        },
        [7] = {
            [1] = vector3(-1464.25, -683.63, 26.47),
            [2] = vector3(-1439.21, -687.91, 26.41),
        },
        [8] = {
            [1] = vector3(-1426.09, -643.47, 28.67),
            [2] = vector3(-1431.96, -628.8, 38.9),
        },
        [9] = {
            [1] = vector3(-1412.41, -634.54, 28.67),
            [2] = vector3(-1421.1, -618.03, 38.9),
        },
        [10] = {
            [1] = vector3(-7.77, -201.9, 52.61),
            [2] = vector3(2.05, -195.72, 58.64),
        },
        [11] = {
            [1] = vector3(-583.33, 197.39, 71.48),
            [2] = vector3(-583.62, 215.56, 75.74),
        },
        [12] = {
            [1] = vector3(-1163.5, -1551.52, 4.38),
            [2] = vector3(-1148.59, -1566.39, 4.43),
        },
        [13] = {
            [1] = vector3(-736.62, -1505.02, 5),
            [2] = vector3(-757.25, -1514.19, 5),
        },
        [14] = {
            [1] = vector3(209.73, -1854.54, 27.2),
            [2] = vector3(222.77, -1846.47, 31.22),
        },
    },
    ["hard"] = {
        [1] = {
            [1] = vector3(-599.73, 209.54, 74.17),
            [2] = vector3(-618.49, 212.3, 91.87),
        },
        [2] = {
            [1] = vector3(-591.4, 208.74, 74.17),
            [2] = vector3(-600.8, 213.78, 91.42),
        },
        [3] = {
            [1] = vector3(-114.87, -1036.81, 27.35),
            [2] = vector3(-115.31, -1036.52, 69.79),
        },
        [4] = {
            [1] = vector3(131.26, -347.19, 43.35),
            [2] = vector3(130.37, -347.48, 99.08),
        },
        [5] = {
            [1] = vector3(47.01, -463.69, 40.18),
            [2] = vector3(46.97, -462.64, 96.35),
        },
        [6] = {
            [1] = vector3(-252.91, -160.2, 78.34),
            [2] = vector3(-202.52, -232.84, 78.34),
        },
        [7] = {
            [1] = vector3(-1513.79, -887.61, 10.2),
            [2] = vector3(-1499.21, -897.68, 19.23),
        },
        [8] = {
            [1] = vector3(493.5, -937.63, 26.83),
            [2] = vector3(517.02, -970.87, 27.43),
        },
        [9] = {
            [1] = vector3(491.27, -1543.53, 28.28),
            [2] = vector3(489.67, -1537.61, 34.07),
        },
        [10] = {
            [1] = vector3(103.5, -1084.38, 29.19),
            [2] = vector3(118.57, -1093.17, 35.66),
        },
        [11] = {
            [1] = vector3(-322.86, -739.53, 33.96),
            [2] = vector3(-322.86, -739.38, 38.78),
        },
        [12] = {
            [1] = vector3(-139.26, -2496.25, 39.64),
            [2] = vector3(-141.77, -2494.38, 48.07),
        },
        [13] = {
            [1] = vector3(893.83, -1722.09, 32.16),
            [2] = vector3(898.61, -1713.28, 42.46),
        },
        [14] = {
            [1] = vector3(870.65, -1619.98, 30.33),
            [2] = vector3(875.58, -1628.07, 38.01),
        },
    },
}

