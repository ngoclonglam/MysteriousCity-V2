Config = {}
Config.MailboxRenewalTime = 45000 * 60      -- Only one letter can be taken from one box. This is global, so if one player takes from one mailbox, then the next player can no longer take from it. This is the renewal time, in this case after 45 minutes you will be able to take letters from that particular mailbox again

Config.Props = {
    --Props from which letters can be collected
    `prop_postbox_01a`,
    -- Add more if u want!
}

Config.UseTarget = true                        -- Change it to true if you want to use a target system. All setings about the target system are under target.lua file.
Config.RequiredJob = "none"                     -- Set to "none" if you dont want using jobs. If you are using target, you have to set "job" parameter inside every export in target.lua
Config.RequiredItem = "none"                    -- Required Item needed to start the job. Set to "none", if you dont want to use RequiredItem
Config.RequireOneFriendMinimum = false          -- Set to true if you want to force players to create teams
Config.Scenario = "prop_human_parking_meter"    -- An animation that plays while searching a crate. Note: this must be a Scenario, not an animation
Config.JobVehicleModel = "minivan"              -- Vehicle Job Model
Config.VehicleDeposit = 1500                    -- Deposit for the car collected at the time of pulling out, and refunded when returning the car
Config.Price = 150                                -- 2$ per one letter
Config.splitReward = true                       -- If it is true, the payout is: (Config.Price * collectedLetters) / PartyCount, if false then: (Config.Price * collectedLetters)

Config.Blips = {                                -- Here you can configure Company blip.
    [1] = {
        Sprite = 365,
        Color = 44,
        Scale = 0.8,
        Pos = vector3(-232.16, -915.15, 32.31),
        Label = 'Postman Job'
    },
}

Config.MarkerSettings = {                       -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
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

Config.Locations = {                            -- Here u can change all of the base job locations. 
    DutyToggle = {
        Coords = {
            vector3(-232.16, -915.15, 32.31),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0}
    },
    FinishJob = {
        Coords = {
            vector3(-276.66, -894.68, 31.08),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Nhấn E để ngưng công việc',
        scale = {x = 3.0, y = 3.0, z = 3.0}
    },

}

Config.SpawnPoint = vector4(-276.66, -894.68, 31.08, 337.31)  -- Vehicle spawn point
Config.EnableCloakroom = true                                 -- Set to false if you want to hide the "CLoakroom" button under WorkMenu

Config.Clothes = {

    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.

    male = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 10},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 36},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 250},},
    female = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 14},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 6},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 0, ["drawable"] = 15},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 258},},
}

Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["no_permission"] = "Chỉ có chủ sở hữu mới có thể làm!",
    ["keybind"] = 'Marker Interaction',
    ["too_far"] = "Nhóm của bạn đang làm việc, nhưng bạn ở quá xa trụ sở chính. Bạn vẫn có thể tham gia cùng họ.",
    ["kicked"] = "Bạn đã đuổi %s khỏi nhóm của bạn",
    ["alreadyWorking"] = "Đầu tiên, hoàn thành đơn đặt hàng trước.",
    ["quit"] = "Bạn đã rời khỏi đội",
    ["cantSpawnVeh"] = "Chỗ lấy xe đã có xe khác",
    ["nobodyNearby"] = "Không có ai xung quanh",
    ["pickLetter"] = "Lấy thư",
    ["checking"] = "Bạn đang kiểm tra hộp thư",
    ["spawnPointBusy"] = "Chỗ lấy xe đã có xe khác",

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
    ["deposit"] = "Chúng tôi đã lấy tiền cọc cho chiếc  xe",
    ["depositReturned"] = "Chúng tôi đã trả tiền cọc cho chiếc xe",
    ["empty"] = "Có người đã lấy lá thư từ hộp này, hãy thử lại sau",
    ["collected"] = "Bạn đã lấy lá thư",
    ["broken"] = "Hộp thư đã bị hỏng, không thể lấy được thư",
    ["dontHaveReqItem"] = "Bạn không có vật phẩm cần có để làm"
}