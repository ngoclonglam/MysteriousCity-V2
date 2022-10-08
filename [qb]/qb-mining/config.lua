Config = Config or {}

Config.UseBlips = true                                               -- True / false option for toggling farm blips
Config.Timeout  = 5000                                               -- 5 seconds

--Blips Config
MiningLocation = {
    targetZone = vector3(2957.14, 2745.35, 42.53),                  -- qb-target vector
    targetHeading = 280.88,                                         -- qb-target box zone
    coords = vector4(2957.14, 2745.35, 42.53, 280.88),              -- Move Location (Ped and blip)
    SetBlipSprite = 414,                                            -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                             -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.85,                                            -- Blip Size
    SetBlipColour = 21,                                             -- Blip Color
    BlipLabel = "Khu Mỏ Đá",                                        -- Blip Label
    minZ = 41.53,                                                   -- Max Z
    maxZ = 45.53,                                                   -- Max Z
}
WashLocation = {
    targetZone = vector3(77.17, 3150.86, 28.79),
    targetHeading = 80.46,
    coords = vector4(77.17, 3150.86, 28.79, 80.46),
    SetBlipSprite = 162,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 26,
    BlipLabel = "Nơi Rửa Đá",
    minZ = 27,
    maxZ = 31,
}
SmeltLocation = {
    coords = vector4(1090.11, -1991.51, 32.27, 56.22),
    SetBlipSprite = 162,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 36,
    BlipLabel = "Nhà máy Nun",
}
SellLocation = {
    targetZone = vector3(579.11, -2804.96, 5.06),
    targetHeading = 242.63,
    coords = vector4(579.11, -2804.96, 5.06, 242.63),
    SetBlipSprite = 431,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 28,
    BlipLabel = "Thu mua Khoáng Sản",
    minZ = 3,
    maxZ = 7,
}
--Job Config
MiningJob = {
    Miner = "s_m_y_construct_02",                                   -- Ped model  https://wiki.rage.mp/index.php?title=Peds
    MinerHash = 0xC5FEFADE,                                         -- Hash numbers for ped model

    Washer = "ig_cletus",
    WasherHash = 0xE6631195,

    MiningTimer = 10 * 1000,                                        -- 20 second timer
    WashingTimer = 5 * 1000,                                        -- 15 second timer
    IronTimer = 5 * 1000,                                           -- 25 seconds
    CopperTimer = 10 * 1000,                                        -- 30 seconds
    GoldTimer = 15 * 1000,                                          -- 35 seconds

    PickAxePrice = 2500,                                              -- PickAxe Price ($75)
    WashPanPrice = 35,                                               -- Washing Pan Price ($5)

    StoneMin = 3,                                                   -- Min amount from mining
    StoneMax = 6,                                                   -- Max amount from mining
    
    -- Washing Min And Max
    IronFragMin = 3,
    IronFragMax = 6,
    GoldNugMin = 1,
    GoldNugMax = 3,
    CopperFragMin = 4,
    CopperFragMax = 7,

    -- Smelting Min and Max
    SmeltIronMin = 7,
    SmeltIronMax = 10,
    SmeltCopperMin = 4,
    SmeltCooperMax = 7,
    SmeltGoldMin = 7,
    SmeltGoldMax = 10,

    -- Bars Received
    IronBarsMin = 1,
    IronBarsMax = 2,
    CopperBarsMin = 1,
    CopperBarsMax = 2,
    GoldBarsMin = 1,
    GoldBarsMax = 2,
}


-- vector4(77.17, 3150.86, 29.79, 80.46)
Config.MiningLocation = {
    [1] = {
        ["coords"] = vector3(2958.44, 2820.84, 42.78),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [2] = {
        ["coords"] = vector3(2954.62, 2819.69, 42.48),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [3] = {
        ["coords"] = vector3(2949.78, 2816.56, 42.26),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [4] = {
        ["coords"] = vector3(2947.24, 2819.76, 42.74),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [5] = {
        ["coords"] = vector3(2945.04, 2819.07, 42.92),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [6] = {
        ["coords"] = vector3(2937.75, 2813.82, 43.2),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [7] = {
        ["coords"] = vector3(2922.33, 2799.58, 41.32),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [8] = {
        ["coords"] = vector3(2924.98, 2795.5, 40.81),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [9] = {
        ["coords"] = vector3(2927.38, 2792.79, 40.53),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [10] = {
        ["coords"] = vector3(2929.17, 2789.55, 40.05),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [11] = {
        ["coords"] = vector3(2931.76, 2786.79, 39.61),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [12] = {
        ["coords"] = vector3(2933.78, 2785.08, 39.5),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [13] = {
        ["coords"] = vector3(2937.68, 2775.27, 39.22),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [14] = {
        ["coords"] = vector3(2938.5, 2772.11, 39.26),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [15] = {
        ["coords"] = vector3(2938.85, 2770.45, 39.15),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [16] = {
        ["coords"] = vector3(2947.21, 2766.83, 39.21),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [17] = {
        ["coords"] = vector3(2952.06, 2769.65, 39.05),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [18] = {
        ["coords"] = vector3(2956.78, 2772.24, 39.62),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [19] = {
        ["coords"] = vector3(2968.18, 2774.68, 38.23),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [20] = {
        ["coords"] = vector3(2972.1, 2776.56, 38.53),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [21] = {
        ["coords"] = vector3(2977.6, 2791.4, 40.82),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [22] = {
        ["coords"] = vector3(2971.25, 2798.78, 41.32),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    -- [23] = {
    --     ["coords"] = vector3(2938.85, 2770.45, 39.15),
    --     ["isMined"] = false,
    --     ["isOccupied"] = false,
    -- },
}

Config.Sell = {
    ["mining_washedstone"] = {
        ["price"] = math.random(5, 10)                             -- Seller Price
    },
    ["mining_stone"] = {
        ["price"] = 2
    },
    -- ["mining_ironfragment"] = {
    --     ["price"] = math.random(35, 45)
    -- },
    ["mining_ironbar"] = {
        ["price"] = math.random(120, 140)
    },
    -- ["mining_goldnugget"] = {
    --     ["price"] = math.random(75, 80)
    -- },
    ["mining_goldbar"] = {
        ["price"] = math.random(200, 220)
    },
    -- ["mining_copperfragment"] = {
    --     ["price"] = math.random(25, 35)
    -- },
    ["mining_copperbar"] = {
        ["price"] = math.random(100, 120)
    },
}

--- Config Alerts
Config.Text = {
    ['itemamount'] = 'Bạn đang cố gắng nhập một số không hợp lệ!',
    
    ['MenuHeading'] = 'Ông chủ khoáng sản',
    ['MenuPickAxe'] = 'Mua cây xẻng',
    ['PickAxeText'] = 'Cây xẻng đùng để đào đá với giá $'..MiningJob.PickAxePrice,

    ["MenuTarget"] = 'Nói chuyện với ông chủ',
    ["goback"] = '<- Quay Lại!',

    ['WashHeading'] = 'Bán đồ rửa đá',
    ['MenuWashPan'] = 'Mua đồ rửa đá',
    ['PanText'] = 'Đồ này dùng để rửa đá với giá $' ..MiningJob.WashPanPrice,
    ['Menu_pTarget'] = 'Nói chuyện với chuyên gia rửa đá',

    ['SmethHeading'] = 'Tùy Chọn Nung',
    ['Semlt_Iron'] = 'Nung Sắt',
    ['smelt_IText'] = 'Nung Thành Thanh Sắt',
    ['Semlt_Copper'] = 'Nung Đồng',
    ['smelt_CText'] = 'Nung Thành Thanh Đồng',
    ['Smelt_Gold'] = 'Nung Vàng',
    ['smelt_GText'] = 'Nung Thành Thanh Vàng',

    ['Pickaxe_Bought'] = 'Bạn đã mua cây xẻng với giá $' ..MiningJob.PickAxePrice.. ' ... Chúc may mắn!',
    ['Pickaxe_Check'] = 'Hình như bạn đã có cây xẻng',
    ['MiningAlert'] = 'Bạn vừa nhìn thấy cái gì rất sáng chói',
    ['StartMining'] = '[E] Bắt đầu đáo đá',

    ['error_mining'] = 'Bạn không có xẻng để đào đá',
    ['Pan_Bought'] = 'Bạn mua đồ rửa đá với giá $' ..MiningJob.WashPanPrice,
    ['Pan_check'] = 'Bạn đã có đồ rửa đá',
    ['error_pan'] = 'Bạn không có đồ rửa đá',

    ['Mining_ProgressBar'] = 'Đào Khoáng Sản',

    ['Washing_Target'] = 'Rửa Đá',

    ['error_minerstone'] = 'Bạn không có đá để rửa',
    ['error_washpan'] = 'Bạn cần đồ rửa đá để làm điều này!',

    ['Washing_Rocks'] = 'Rửa đá',

    ['Smeth_Rocks'] = 'Nung Đá',
    
    ['smelt_iron'] = 'Nung Sắt',
    ['smelt_copper'] = 'Nung Đồng',
    ['smelt_gold'] = 'Nung Vàng',

    ['cancel'] = 'Bạn đã hủy quá trình đang thực hiện',

    ['error_ironCheck'] = 'Bạn không có Sắt để nung',
    ['error_goldCheck'] = 'Bạn không có Vàng để nung',
    ['error_copperCheck'] = 'Bạn không có Đồng để nung',

    ['ironSmelted'] = 'Bạn đã nung ',
    ['ironSmeltedMiddle'] = ' Amount of Iron Fragments for ',
    ['ironSmeltedEnd'] = ' Thanh Sắt',

    ['CopperSmelted'] = 'Bạn đã nung ',
    ['CopperSmeltedMiddle'] = ' Amount of Copper Fragments for ',
    ['CopperSmeltedEnd'] = ' Thanh Đồng',

    ['GoldSmelted'] = 'Bạn đã nung ',
    ['GoldSmeltedMiddle'] = ' Amount of Gold Nugget for ',
    ['GoldSmeltedEnd'] = ' Thanh Vàng',

    ['error_alreadymined'] = 'Chỗ này đã bị đào trước đó',

    ['Seller'] = 'Nói chuyện với người mua khoáng sản',
    ['successfully_sold'] = 'Họ đã mua khoáng sản',

}

