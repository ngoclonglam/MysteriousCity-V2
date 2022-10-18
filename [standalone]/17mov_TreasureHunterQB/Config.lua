Config = {}
Config.UseTarget = true                     -- Change it to true if you want to use a target system. All setings about the target system are under target.lua file.
Config.RequiredJob = "none"                 -- Set to "none" if you dont want using jobs. If you are using target, you have to set "job" parameter inside every export in target.lua
Config.RequireOneFriendMinimum = false      -- Set to true if you want to force players to create teams
Config.JobVehicleModel = "dinghy"           -- Job Boat model
Config.TreasureProp = `prop_box_wood01a`    -- Treasure Prop Model
Config.EasyMode = false                      -- Set to true if you want smaller radius on map, and display marker above treasure. Stay false for more immsersive searching :D
Config.EnableTrackerSound = true            -- Tracker Sound on idle
Config.TrakcerSoundMinimumDistance = 5.0   -- if Player Distance to treasure is smaller than this value, loop the tracker distance
Config.ShowBlipWhenNearby = true            -- Show blip on map when player is nearby, and play a sound. Set to false if you want more immersive seaarching :D
Config.TreaureBlipDistance = 15.0           -- If Player distance to the treasure is smaller than this value, then shut down the tracker sound, and show blip on map
Config.FakeLocationChance = 0               -- Chance to randomize a location and not spawn any treasure. [FAKE LOCATION WITHOUT TREASURE]
Config.FakeRestart = 25000 * 60             -- Restart location if treasure is fake after 45 seconds, if treasure is real, then location will be active as long as somebody will find it.
Config.AnchorBone = "headlight_l"           -- Bone used only when Config.UseTarget == false. On coords of this bone script display a 3D Text.

Config.Blips = {                        -- Here you can configure Company blip.
    [1] = {
        Sprite = 366,
        Color = 50,
        Scale = 0.8,
        Pos = vector3(167.82, -2222.7, 7.24),
        Label = 'Treasure Hunter'
    },
}

Config.reward = 3000                    -- Reward for one treasure. If you want to use a item reward then modify Pay() function under /server/functions.lua
Config.splitReward = true              -- If it is true, the payout is: (Config.Price * foundTreasured) / PartyCount, if false then: (Config.Price * foundTreasured)
Config.MarkerSettings = {               -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
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

Config.Locations = {                    -- Here u can change all of the base job locations. 
    DutyToggle = {
        Coords = {
            vector3(167.82, -2222.7, 7.24),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0}
    },
    FinishJob = {
        Coords = {
            vector3(163.3, -2263.33, 1.5),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Nhấn E để kết thúc công việc',
        scale = {x = 3.0, y = 3.0, z = 3.0}
    },

}

Config.SpawnPoint = vector4(163.3, -2263.33, 0.11, 268.86)  -- Vehicle spawn point

Config.Clothes = {

    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.

    male = {
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 8},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 94},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 67},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 243},}    },

    female = {
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 3},{["component_id"] = 4, ["texture"] = 1, ["drawable"] = 97},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 70},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 1, ["drawable"] = 251},},
    }
}

Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["no_permission"] = "Chỉ có người chủ nhóm mới có thể làm!",
    ["keybind"] = 'Diving Marker Interaction',
    ["too_far"] = "Nhóm của bạn đang làm việc, nhưng bạn ở quá xa trụ sở chính. Bạn vẫn có thể tham gia cùng họ.",
    ["kicked"] = "Bạn đã đuổi %s khỏi nhóm của bạn",
    ["alreadyWorking"] = "Đầu tiên, hoàn thành đơn đặt hàng trước.",
    ["quit"] = "Bạn đã rời khỏi đội",
    ["cantSpawnVeh"] = "Chỗ lấy thuyền đã bị sử dụng.",
    ["nobodyNearby"] = "Không có ai ở gần",
    ["newTarget"] = "Kho báu đã được tìm thấy hoặc ông chủ đã chỉ ra một địa điểm mới",
    ["treasureBlipName"] = "Kho Báu",
    ["collectTreasure"] = "Lấy Kho Báu",
    ["dropAnchor"] = "Thả hoặc nâng neo",
    ["anchorNotifytrue"] = "Neo đã được bỏ xuống",
    ["anchorNotifyfalse"] = "Neo đã được nâng lên",
    ["wrongCar"] = "Đây không phải là chiếc thuyền bắt đầu của bạn!",
    ["treasure"] = "Kho Báu",

    -- Server
    ["isAlreadyHost"] = "Người chơi này dẫn dắt đội của bạn",
    ["isBusy"] = "Người chơi này đã thuộc về một đội khác.",
    ["hasActiveInvite"] = "Người chơi này đã có một lời mời từ ai đó.",
    ["HaveActiveInvite"] = "Bạn đã có một lời mời để tham gia nhóm.",
    ["InviteDeclined"] = "Lời mời của bạn đã bị từ chối.",
    ["InviteAccepted"] = "Lời mời của bạn đã được chấp nhận!",
    ["error"] = "Có một vấn đề khi tham gia một đội, vui lòng thử lại sau.",
    ["kickedOut"] = "Bạn đã bị đuổi khỏi đội thợ lặn!",
    ["reward"] = "Bạn đã nhận được một khoản thanh toán là $",
    ["RequireOneFriend"] = "Công việc này yêu cầu ít nhất một thành viên trong nhóm",
    ["yourTeamWon"] = "Nhóm của bạn đã tìm thấy một kho báu, đi đến căn cứ và hoàn thành công việc để được trả tiền, hoặc tiếp tục tìm kiếm!",

}

Config.TreasureLocations = {

    -- Here you can modify/add some treasure coords.

    vector3(1815.49768, -2954.997, -45.5570831),
    vector3(1864.00513, -2943.36328, -45.1559143),
    vector3(2087.157, -3039.93726, -47.4239426),
    vector3(2193.7627, -3127.48364, -94.57767),
    vector3(2378.85034, -2499.71631, -35.8349953),
    vector3(2627.7478, -2413.352, -54.75626),
    vector3(2626.367, -2423.33521, -55.3033142),
    vector3(2846.15332, -2222.815, -41.333744),
    vector3(2859.74365, -1891.47119, -34.197506),
    vector3(2984.12964, -1498.41418, -27.9075184),
    vector3(3177.29468, -581.065247, -127.739563),
    vector3(3281.40527, -402.4866, -117.204651),
    vector3(3299.69238, -406.8575, -124.827339),
    vector3(3299.3125, -397.5286, -116.688576),
    vector3(3256.39038, -420.755249, -77.03309),
    vector3(3201.50244, -402.942261, -25.67505),
    vector3(3412.09766, -74.54607, -140.977844),
    vector3(3460.43457, 378.9865, -122.711594),
    vector3(3422.76685, 965.6635, -128.906647),
    vector3(3317.28442, 1120.36389, -112.818596),
    vector3(3355.995, 1508.01233, -139.310776),
    vector3(3410.40137, 1958.86682, -51.6830864),
    vector3(3902.61035, 3058.50049, -29.4393253),
    vector3(3883.802, 3039.01636, -25.3941383),
    vector3(3583.80859, 2718.93262, -27.3160973),
}