Config = Config or {}
Config.Job = false                                                  -- False = Job is not required / True = Job is required
Config.UseBlips = false                                              -- True / false option for toggling farm blips
Config.Timeout = 30000                                               -- 30 seconds
Config.UseTarget = GetConvar("UseTarget", "false") == "true"
Config.Time = { from = 5, to = 18}                                   -- Open hours for job
Config.UseMiniGame = false

-- Blips
LumberDepo = {
    -- Customized: ZIP code 3002
    targetZone = vector3(-572.78, 5360.28, 69.22),                 -- qb-target vector
    targetHeading = 283.38,                                         -- qb-target box zone
    coords = vector4(-572.78, 5360.28, 69.22, 283.38),
    -- Move Location (Ped and blip)
    SetBlipSprite = 85,                                             -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                             -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.85,                                            -- Blip Size
    SetBlipColour = 5,                                              -- Blip Color
    BlipLabel = "Nghề Mộc",                                         -- Blip Label
    Vehicle = 'tiptruck',                                           -- Job Vehicle
    VehicleCoords = vector4(1162.27, -1318.55, 34.74, 173.91),      -- Job Vehcile Coords
}

LumberSeller = {
    targetZone = vector3(1167.73, -1347.27, 33.92),                 -- qb-target vector
    targetHeading = 273.47,                                         -- qb-target box zone
    coords = vector4(1167.73, -1347.27, 33.92, 273.47),             -- Move Location (Ped and blip)
    SetBlipSprite = 605,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 45,
    BlipLabel = "Bán Gỗ",
}

LumberJob = {
    LumberModel = "s_m_y_construct_01",                             -- Ped model  https://wiki.rage.mp/index.php?title=Peds
    LumberHash = 0xD7DA9E99,                                        -- Hash numbers for ped model
    
    ChoppingTreeTimer = 3 * 1000,                                  -- timer for 1 lumber chopped
    ProcessingTime = 3 * 1000,                                         -- timer for 1 lumber processed

    LumberAmount_Min = 4,
    LumberAmount_Max = 8,

    TreeBarkAmount_Min = 1,
    TreeBarkAmount_Max = 5,

    TradeAmount_Min = 3,
    TradeAmount_Max = 6,

    TradeRecevied_Min = 1,
    TradeRecevied_Max = 3,

    AxePrice = 100,                                                 -- Axe Price ($100)
}

Config.Sell = {
    ["tree_lumber"] = {
        ["price"] = math.random(35, 50)                             -- Seller Price
    },
    ["tree_bark"] = {
        ["price"] = math.random(10, 15)
    },
    ["wood_proc"] = {
        ["price"] = math.random(45, 60)
    },
}

Config.Axe = {
    [`weapon_hatchet`] = {}
}

Config.TreeLocations = {
    [1] = {
        ["coords"] = vector3(-504.47, 5392.09, 75.82),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [2] = {
        ["coords"] = vector3(-510.08, 5389.15, 73.71),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [3] = {
        ["coords"] = vector3(-558.32, 5418.98, 62.78),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [4] = {
        ["coords"] = vector3(-561.47, 5420.32, 62.39),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [5] = {
        ["coords"] = vector3(-578.9, 5427.22, 58.54),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [6] = {
        ["coords"] = vector3(-600.28, 5397.03, 52.48),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [7] = {
        ["coords"] = vector3(-614.04, 5399.73, 50.86),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [8] = {
        ["coords"] = vector3(-616.38, 5403.72, 50.59),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [9] = {
        ["coords"] = vector3(-553.08, 5445.65, 64.16),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [10] = {
        ["coords"] = vector3(-500.53, 5401.34, 75.05),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [11] = {
        ["coords"] = vector3(-491.78, 5395.47, 77.57),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [12] = {
        ["coords"] = vector3(-457.24, 5398.19, 79.35),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [13] = {
        ["coords"] = vector3(-456.87, 5408.32, 79.26),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [14] = {
        ["coords"] = vector3(-627.6, 5322.19, 59.86),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [15] = {
        ["coords"] = vector3(-626.05, 5315.49, 60.87),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [16] = {
        ["coords"] = vector3(-628.47, 5286.07, 63.75),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [17] = {
        ["coords"] = vector3(-604.23, 5243.57, 71.53),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [18] = {
        ["coords"] = vector3(-599.94, 5239.87, 71.87),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [19] = {
        ["coords"] = vector3(-556.65, 5233.61, 72.53),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [20] = {
        ["coords"] = vector3(-557.92, 5224.02, 77.24),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [21] = {
        ["coords"] = vector3(-546.26, 5219.38, 77.94),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [22] = {
        ["coords"] = vector3(-537.93, 5226.47, 78.52),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [23] = {
        ["coords"] = vector3(-628.32, 5286.04, 63.76),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [24] = {
        ["coords"] = vector3(-633.1, 5275.56, 69.11),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [25] = {
        ["coords"] = vector3(-604.37, 5243.69, 71.89),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [26] = {
        ["coords"] = vector3(-646.03, 5269.73, 74.01),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [27] = {
        ["coords"] = vector3(-644.29, 5241.2, 76.3),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [28] = {
        ["coords"] = vector3(-657.02, 5296.15, 69.35),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [29] = {
        ["coords"] = vector3(-659.05, 5293.48, 70.02),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [30] = {
        ["coords"] = vector3(-664.32, 5277.7, 74.4),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [31] = {
        ["coords"] = vector3(-615.24, 5433.06, 54.3),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [32] = {
        ["coords"] = vector3(-616.14, 5424.5, 51.71),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
    [33] = {
        ["coords"] = vector3(-690.07, 5304.85, 70.51),
        ["isChopped"] = false,
        ["isOccupied"] = false,
    },
}

Config.Alerts = {
    ['cancel'] = 'Hủy bỏ',
    ['error_lumber'] = 'Bạn không có gỗ để làm điều này',
    ['error_axe'] = 'Bạn không có rìu để chặt cây',
    ['lumber_progressbar'] = 'Trao đổi gỗ để lấy gỗ đã qua xử lý',
    ['itemamount'] = 'Ông chủ muốn nhiều hơn số gỗ đang có. Hãy thử lại xem!',
    ['lumber_processed_trade'] = 'Bạn đã giao dịch thành công ',
    ['lumber_processed_lumberamount'] = ' Gỗ ',
    ['lumber_processed_received'] = ' Ván gỗ',
    ['error_sold'] = 'Bạn không có gỗ để bán ở đây!',
    ['successfully_sold'] = 'Bạn đã bán gỗ của bạn',

    ["axe_check"] = 'Bạn đã có rìu',
    ["axe_bought"] = 'Bạn đã mua một rìu từ ông chủ mất $' ..LumberJob.AxePrice,

    ['phone_sender'] = 'Giám sát nhà máy gỗ',
    ['phone_subject'] = 'Nhiệm vụ công việc',
    ['phone_message'] = 'Bạn đã được giao nhiệm vụ để thu thập gỗ xẻ gần Paleto Bay Lumber Mill.Một khi bạn đã hoàn thành việc thu thập gỗ xẻ nói với ông chủ Mill để xử lý gỗ.',

    ['chopping_tree'] = 'Chặt gỗ.',

    ['Tree_label'] = 'Bắt đầu chặt gỗ',
    ['depo_label'] = 'Nói chuyện với ông chủ',
    ['mill_label'] = 'Nói chuyện với ông chủ Mill',

    ['depo_blocked'] = 'Vehicle blocking depo',
    ['depo_stored'] = 'Job Vehicle Stored',

    ['vehicle_header'] = 'Lumber Jack Vehicles',
    ['vehicle_get'] = 'Logger Vehicle',
    ['vehicle_text'] = 'Job Vehicle',

    ['battleaxe_label'] = 'Rìu gỗ',
    ['battleaxe_text'] = 'Rìu dùng để chặt cây',
    
    ['vehicle_remove'] = 'Remove Vehicle',
    ['remove_text'] = 'Remove Job Vehicle',

    ['lumber_mill'] = 'Nhà máy gỗ xẻ',
    ['lumber_header'] = 'Xử lý gỗ',
    ['lumber_text'] = 'Trao đổi gỗ đã xử lý',

    ['Lumber_Seller'] = 'Bán gỗ',

    ['on_duty_label'] = 'Nhận việc',
    ['on_duty_text'] = 'Nhận công việc Thợ Mộc từ '..Config.Time.from..':00 tới '..Config.Time.to..':00',

    ['off_duty_label'] = 'Nghỉ việc',
    ['off_duty_text'] = 'Éo muốn làm nữa chim cút đây!',

    ['goback'] = '< Quay lại',
}