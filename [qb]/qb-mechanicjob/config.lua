Config = {}

-- **** IMPORTANT ****
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Targets = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    -- "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = Lang:t('labels.engine'),
    ["body"] = Lang:t('labels.bodsy'),
    ["radiator"] = Lang:t('labels.radiator'),
    ["axle"] = Lang:t('labels.axle'),
    ["brakes"] = Lang:t('labels.brakes'),
    ["clutch"] = Lang:t('labels.clutch'),
    ["fuel"] = Lang:t('labels.fuel'),
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 7,
    },
    ["body"] = {
        item = "plastic",
        costs = 7,
    },
    ["radiator"] = {
        item = "steel",
        costs = 7,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 7,
    },
    ["clutch"] = {
        item = "copper",
        costs = 5,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
        coords = vector4(-323.28, -132.05, 38.35, 70.11),
        boxData = {
            heading = 70,
            length = 5,
            width = 2.5,
            debugPoly = false
        },
        AttachedVehicle = nil,
    },
    [2] = {
        coords = vector4(-321.05, -126.05, 38.38, 71.9),
        boxData = {
            heading = 72,
            length = 5,
            width = 2.5,
            debugPoly = false
        },
        AttachedVehicle = nil,
    },
    [3] = {
        coords = vector4(-319.13, -119.86, 38.4, 69.9),
        boxData = {
            heading = 70,
            length = 5,
            width = 2.5,
            debugPoly = false
        },
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(-339.04, -135.53, 39),
    -- ["duty"] = vector3(-348.77, -130.04, 38.98),
    ["duty"] = vector3(-348.96, -129.44, 39.01),
    ["stash"] = vector3(-341.69, -142.05, 39.05),
    ["vehicle"] = vector4(-364.05, -144.61, 38.38, 71.86),
}

Config.Vehicles = {
    ["flatbed"] = "Flatbed",
    ["towtruck"] = "Towtruck",
    ["minivan"] = "Minivan (Rental Car)",
    ["blista"] = "Blista",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
