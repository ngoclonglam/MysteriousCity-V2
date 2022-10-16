Config = {}
Config.UseTarget = true                                             -- Change it to true if you want to use a target system. All setings about the target system are under target.lua file.
Config.RequiredJob = "none"                                         -- Set to "none" if you dont want using jobs. If you are using target, you have to set "job" parameter inside every export in target.lua
Config.RequireOneFriendMinimum = false                              -- Set to true if you want to force players to create teams
Config.JobVehicleModel = "boxville2"                                -- Vehicle Job Model
Config.VehicleBackBone = "handle_dside_r"                           -- Only used when Config.Target == false. On coords of this bone, the 3D Text about interact with vehicle is displayed.
Config.VehicleBootOffset = 5                                        -- Means 5 meters back from basic vehicle coords. Used when trying to take parcel out of the vehicle.
Config.VehicleSearchingScenario = "prop_human_parking_meter"        -- Scenario used while "searcing" inside vehicle.
Config.VehicleDeposit = 1500                                        -- Deposit for the car collected at the time of pulling out, and refunded when returning the car
Config.Price = 300                                                  -- 100$ per one delivery
Config.splitReward = true                                           -- If it is true, the payout is: (Config.Price * deliveries) / PartyCount, if false then: (Config.Price * deliveries)

Config.Blips = {                                                    -- Here you can configure Company blip.
    [1] = {
        Sprite = 568,
        Color = 48,
        Scale = 0.8,
        Pos = vector3(78.66, 111.75, 81.17),
        Label = 'Deliverer Job'
    },
}

Config.MarkerSettings = {                                           -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
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

Config.Locations = {                                               -- Here u can change all of the base job locations. 
    DutyToggle = {
        Coords = {
            vector3(78.5, 111.98, 81.17),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0}
    },
    FinishJob = {
        Coords = {
            vector3(72.67, 120.83, 79.18),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Nhấn E để kết thúc công việc',
        scale = {x = 3.0, y = 3.0, z = 3.0}
    },

}

Config.SpawnPoint = vector4(72.67, 120.83, 79.18, 158.66)  -- Vehicle spawn point
Config.EnableCloakroom = true                                 -- Set to false if you want to hide the "CLoakroom" button under WorkMenu

Config.Clothes = {

    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.

    male = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 11},{["component_id"] = 4, ["texture"] = 2, ["drawable"] = 10},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 54},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 57},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 13},},
    female = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 9},{["component_id"] = 4, ["texture"] = 2, ["drawable"] = 6},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 52},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 1, ["drawable"] = 9},},
}

Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["no_permission"] = "Chỉ có người chủ nhóm mới có thể làm!",
    ["keybind"] = 'Marker Interaction',
    ["too_far"] = "Nhóm của bạn đang làm việc, nhưng bạn ở quá xa trụ sở chính. Bạn vẫn có thể tham gia cùng họ.",
    ["kicked"] = "Bạn đã đuổi %s khỏi nhóm của bạn",
    ["alreadyWorking"] = "Đầu tiên, hoàn thành đơn đặt hàng trước.",
    ["quit"] = "Bạn đã rời khỏi đội",
    ["cantSpawnVeh"] = "Chỗ lấy xe đã có xe khác",
    ["nobodyNearby"] = "Không có ai ở gần",
    ["TargetCoords"] = "Điểm Đến Giao Hàng",
    ["deliverParcel"] = "Cung Cấp Bưu Kiện",
    ["takeParcel"] = "Lấy bưu kiện",
    ["wait"] = "Bây giờ đợi ai đó đến và mở cửa",
    ["missingParcel"] = "Bạn không có gói hàng ở đó, hãy ra xe và lấy",
    ["spawnPointBusy"] = "Chỗ lấy xe đang có người dùng",

    -- Server
    ["isAlreadyHost"] = "Người chơi này dẫn dắt đội của bạn",
    ["isBusy"] = "Người chơi này đã thuộc về một đội khác.",
    ["hasActiveInvite"] = "Người chơi này đã có một lời mời từ ai đó.",
    ["HaveActiveInvite"] = "Bạn đã có một lời mời để tham gia nhóm.",
    ["InviteDeclined"] = "Lời mời của bạn đã bị từ chối.",
    ["InviteAccepted"] = "Lời mời của bạn đã được chấp nhận!",
    ["error"] = "Có một vấn đề khi tham gia một đội, vui lòng thử lại sau.",
    ["kickedOut"] = "Bạn đã bị đuổi khỏi đội!",
    ["reward"] = "Bạn đã nhận được một khoản thanh toán là $",
    ["RequireOneFriend"] = "Công việc này yêu cầu ít nhất một thành viên trong nhóm",
    ["dontHaveReqItem"] = "Bạn không có vật phẩm yêu cầu để bắt đầu công việc"

}

-- Homes Locations:

Config.TargetLocations = {
    {-- Mirror Park: 
        vector3(1060.51, -378.2, 68.23),
        vector3(1010.45, -423.49, 65.35),
        vector3(1028.82, -408.31, 66.34),
        vector3(967.2, -451.53, 62.8),
        vector3(944.38, -463.08, 61.55),
        vector3(921.87, -477.86, 61.08),
        vector3(906.35, -489.36, 59.44),
        vector3(878.34, -497.98, 58.1),
        vector3(861.56, -508.98, 57.65),
        vector3(850.22, -532.74, 57.93),
        vector3(843.98, -562.65, 57.99),
        vector3(861.73, -583.51, 58.16),
        vector3(886.75, -608.18, 58.44),
        vector3(902.95, -615.46, 58.45),
        vector3(928.9, -639.81, 58.24),
        vector3(943.19, -653.34, 58.65),
        vector3(959.98, -669.91, 58.45),
        vector3(987.43, -433.03, 64.03),
        vector3(970.82, -701.46, 58.48),
        vector3(979.11, -716.16, 58.22),
        vector3(996.9, -729.59, 57.82),
        vector3(980.19, -627.67, 59.24),
        vector3(964.22, -596.14, 59.9),
        vector3(976.61, -580.7, 59.85),
        vector3(1009.66, -572.53, 60.59),
        vector3(999.55, -593.78, 59.63),
        vector3(1056.17, -448.91, 66.26),
        vector3(1051.08, -470.48, 64.3),
        vector3(1046.36, -498.17, 64.27),
        vector3(945.77, -519.09, 60.81),
    },

    {-- Grove Street: 
        vector3(85.94, -1959.76, 21.12),
        vector3(114.31, -1961.23, 21.33),
        vector3(126.91, -1929.9, 21.38),
        vector3(118.34, -1921.08, 21.32),
        vector3(100.73, -1911.99, 21.4),
        vector3(76.48, -1947.96, 21.17),
        vector3(72.08, -1938.97, 21.37),
        vector3(56.42, -1922.59, 21.91),
        vector3(39.0, -1911.58, 21.95),
        vector3(22.97, -1896.78, 22.97),
        vector3(5.21, -1884.26, 23.7),
        vector3(-4.82, -1872.19, 24.15),
        vector3(-20.65, -1859.06, 25.4),
        vector3(-34.17, -1847.08, 26.19),
        vector3(21.17, -1844.85, 24.6),
        vector3(29.75, -1854.61, 24.07),
        vector3(46.07, -1864.24, 23.28),
        vector3(54.54, -1873.15, 22.78),
        vector3(104.16, -1885.55, 24.32),
        vector3(115.3, -1888.01, 23.93),
        vector3(128.17, -1897.08, 23.67),
        vector3(148.67, -1904.45, 23.51),
        vector3(130.67, -1853.28, 25.23),
        vector3(150.03, -1864.67, 24.59),
        vector3(171.57, -1871.68, 24.4),
        vector3(192.39, -1883.39, 25.06),
        vector3(250.72, -1935.12, 24.72),
        vector3(258.35, -1927.22, 25.44),
        vector3(270.52, -1917.07, 26.18),
        vector3(282.78, -1899.03, 27.25),
        vector3(320.23, -1854.08, 27.51),
        vector3(329.43, -1845.78, 27.75),
        vector3(338.8, -1829.65, 28.34),
    },

    {-- Vinewood / Luxury / Beverly :
        vector3(-1038.06, 222.25, 64.38),
        vector3(-971.58, 122.31, 57.05),
        vector3(-998.27, 158.17, 62.32),
        vector3(-1043.04, 237.24, 64.16),
        vector3(-940.42, 202.52, 67.96),
        vector3(-902.19, 191.48, 69.45),
        vector3(-830.39, 115.11, 56.04),
        vector3(-819.36, 267.95, 86.39),
        vector3(-881.39, 363.73, 85.36),
        vector3(-875.64, 485.77, 87.92),
        vector3(-842.79, 467.01, 87.6),
        vector3(-848.74, 508.59, 90.82),
        vector3(-873.38, 562.86, 96.62),
        vector3(-904.37, 588.01, 101.19),
        vector3(-924.75, 561.3, 100.16),
        vector3(-907.71, 544.98, 100.39),
        vector3(-947.77, 567.76, 101.5),
        vector3(-974.36, 581.81, 103.15),
        vector3(-1022.6, 586.94, 103.43),
        vector3(-1090.14, 548.72, 103.63),
        vector3(-1107.7, 594.53, 104.45),
        vector3(-1167.13, 568.66, 101.83),
        vector3(-1192.97, 564.04, 100.34),
        vector3(-1217.59, 506.63, 95.85),
        vector3(-1277.88, 497.13, 97.89),
        vector3(-1308.31, 448.89, 100.97),
        vector3(-1294.37, 454.34, 97.57),
        vector3(-1289.03, 500.7, 97.56),
        vector3(-1371.49, 444.12, 105.86),
        vector3(-1413.68, 462.24, 109.21),
        vector3(-1453.99, 512.2, 117.8),
        vector3(-1452.89, 545.58, 120.84),
        vector3(-1405.13, 561.92, 125.41),
        vector3(-1372.21, 585.13, 131.45),
        vector3(-1367.36, 611.04, 133.88),
        vector3(-1337.14, 605.93, 134.38),
        vector3(-1056.39, 761.52, 167.32),
        vector3(-1009.25, 765.58, 171.38),
        vector3(-1032.75, 685.94, 161.3),
        vector3(-951.24, 682.55, 153.58),
        vector3(-931.46, 690.99, 153.47),
        vector3(-908.77, 693.75, 151.44),
        vector3(-884.53, 699.23, 151.27),
        vector3(-852.83, 695.12, 148.99),
        vector3(-596.93, 851.41, 211.48),
        vector3(-658.43, 886.25, 229.3),
        vector3(-678.9, 512.09, 113.53),
    },
}

-- Random Peds spawned on door delivery

Config.PedModels = {
   `a_f_m_bevhills_01`,
   `a_f_m_bevhills_02`,
   `a_f_m_business_02`,
   `a_f_m_downtown_01`,
   `a_f_m_eastsa_01`,
   `a_f_m_eastsa_02`,
   `a_f_m_fatbla_01`,
   `a_f_m_ktown_01`,
   `a_f_m_ktown_02`,
   `a_f_m_prolhost_01`,
   `a_f_m_skidrow_01`,
   `a_f_m_tramp_01`,
   `a_f_m_soucentmc_01`,
   `a_f_m_soucent_01`,
   `a_f_o_salton_01`,
   `a_f_y_business_04`,
   `a_f_y_eastsa_03`,
   `a_f_y_epsilon_01`,
   `a_f_y_eastsa_01`,
   `a_f_y_golfer_01`,
   `a_f_y_soucent_01`,
   `a_f_y_soucent_03`,
   `a_f_y_vinewood_03`,

    `a_m_m_bevhills_02`,
    `a_m_m_business_01`,
    `a_m_m_genfat_01`,
    `a_m_m_eastsa_01`,
    `a_m_m_eastsa_02`,
    `a_m_m_hillbilly_01`,
    `a_m_m_malibu_01`,
    `a_m_m_rurmeth_01`,
    `a_m_m_salton_03`,
    `a_m_m_skater_01`,
    `a_m_m_skidrow_01`,
    `a_m_m_socenlat_01`,
    `a_m_m_soucent_01`,
    `a_m_o_salton_01`,
    `a_m_o_soucent_01`,
    `a_m_y_beachvesp_01`,
    `a_m_y_bevhills_01`,
    `a_m_y_bevhills_02`,
    `a_m_y_busicas_01`,
    `a_m_y_business_02`,
    `a_m_y_business_03`,
    `a_m_m_hasjew_01`,
}