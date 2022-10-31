Config = {}

--[[---------------------------------------------------------------------------
░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝
---------------------------------------------------------------------------]]--

Config.Framework = 'newqb' -- esx, newqb, oldqb or autodetect
Config.MySQL = 'oxmysql' -- oxmysql, ghmattimysql, mysql-async
Config.ReOpenPausemenu = true -- if this is enabled it'll open the pausemenu again after player opened and closed settings/map
Config.SpamCheck = true -- this option prevents players from constantly opening and closing the menu
Config.SpamCount = 2 --  This option determines how many times players can spam to open menu before the cooldown is activated
Config.BotToken = 'OTk5NzIwODQ5OTI4MDkzNzk3.GFSiUx.7qpzx9ZBZRggyMTr3qXKWwFXn4tHCqOwy225JQ'  -- How to create a bot token https://www.youtube.com/watch?v=-m-Z7Wav-fM
Config.Theme = 'white' -- purple, red, green, blue, white
Config.UseRegisterKeyMappingSystem = true -- if this option set to true the script will use the RegisterKeyMapping system or false will use the traditional system
--[[
    if you set the option above to true you can reference here if you want to change MenuOpenKey
    https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

    if false you can reference here to change MenuOpenKey
    https://docs.fivem.net/docs/game-references/controls/

    Note : If Config.UseRegisterKeyMappingSystem is set to true, even if you change the Config.MenuOpenKey value after logging into the server it will still be the same in-game. You can do a few things to fix this
    1- Change the script name
    This will reset the key for everyone and new key you've written in Config.MenuOpenKey will be apply to everyone

    2- Change the key from settings/keybinds/fivem
    This will be only apply to you and other players also need to change from settings

    3- Set Config.UseRegisterKeyMappingSystem to false
    This is not the recommend way because script may consume more resmon value
]]--
-- Config.MenuOpenKey = 'ESCAPE'
-- Config.MapOpenKey = 'P'
Config.MenuOpenKey = 'O'
Config.MapOpenKey = 'ESCAPE'
Config.StoreURL = 'https://discord.gg/SCHEwKQxQ8' -- URL of store button
Config.LogoURL = 'https://i.imgur.com/HvoZTjZ.png'


Config.MenuOpen = function() -- This Executed when the menu is opened (useful to hide hud or any other elements on the screen)
    TriggerEvent('codem-blackhudv2:SetForceHide', true, true)
    TriggerEvent('codem-venicehud:SetForceHide', true)
end

Config.MenuClose = function() -- This Executed when the menu is opened (useful to show hud again or any other elements on the screen)
    TriggerEvent('codem-blackhudv2:SetForceHide', false, false)
    TriggerEvent('codem-venicehud:SetForceHide', false)
end

Config.DisplayPage = {
    ['AWARDSPAGE'] = true,
    ['BATTLEPASSPAGE'] = true,
    ['LIVECALLPAGE'] = true,
    ['OOCCHATPAGE'] = true
}


Config.Locale = {
    ["PING"] = 'Ping',
    ["CASHMONEY"] = 'Tiền Mặt',
    ["BANK"] = 'Ngân Hàng',
    ['ONLINEPLAYER'] = 'Online Players',
    ['OCCCHAT'] = 'OCC CHAT',
    ['STORE'] = 'Cửa Hàng',
    ['WELCOME'] = 'Xin chào',
    ['ROLEPLAY'] = 'Bạn đã bí ẩn được',
    ['CLAIMYOURDAILY'] = 'Lấy quà hằng ngày !',
    ['DAY'] = 'Ngày',
    ['VIEWALLAWARDS'] = 'Xem Phần Thưởng',
    ['BATTLEPASS'] = 'Mysterious Pass',
    ['VIEWYOURPROGRESS'] = 'Xem Tiến Độ',
    ["TYPE_SOMETHING"] = 'Hãy nhập nội dung của bạn vào khung CHAT...',
    ["XP_REQUIRED"] = 'Cần thêm ',
    ["XP_EXTRA"] = "XP để lên cấp !",
    ["LEVEL"] = 'Cấp',
    ["ENTER_TBX_ID"] = 'Hãy nhập tbx-id của bạn vào đây để lấy Mysterious Pass...',
    ["CLICK_ITEM"] = 'Nhấn vào vật phẩm để lấy phần thưởng!',
    ["LV"] = 'Cấp',
    ["REQUIRED"] = 'Cần!',
    ["EXPIRED"] = 'Hết Hạn',
    ["CLAIMED"] = 'Nhận Thưởng',
    ["EXITED"] = 'Thoát Game',
    ['BATTLEPASSPROGRESS'] = 'Quá Trình Mysterious Pass',
    ['DAYSLEFT'] = 'ngày còn lại',
    ['CONTACTLIVEASSISTAN'] = 'Liên hệ với BQT',
    ['ADMINSAREONLINE'] = 'BQT đang trực tuyến',
    ['CREATECALL'] = 'Gọi Điện',
    ['CALL'] = 'Gọi',
    ['PATCHNOTES'] = 'Bản Vá',
    ['UPDATE'] = 'Ngày',
    ['BATTLEPASSTEXT'] = '10 mn in game worths',
    ['1000XP'] = '1000 XP',
    ['BATTLEPASSMISSION'] = 'Nhiệm Vụ Mysterious Pass',
    ['GOBACK'] = 'Quay Về',
    ['MISSIONAWARD'] = 'Phần Thưởng Nhiệm Vụ',
    ['TEBEXLINK'] = 'Tbx-id của bạn đi kèm với Email khi bạn đăng ký, hãy kiểm tra email và copy nó vào đây ...',
    ['SURETEXT'] = 'Tôi đồng ý mua nội dung bí ẩn ở trong thành phố, và sẽ chấp nhận các điều khoản',
    ['ALREADYTEXT'] = 'Mysterious Pass đang miễn phí',
    ['FREE'] = 'Miễn Phí',
    ['PREMIUM'] = 'Cao Cấp',
    ['UNLOCK_BATTLEPASS'] = 'Mở Mysterious Pass',
    ['ALREADYUNLOCKED'] = 'Đã Mở Khóa',
    ['UNLOCKED'] = 'Mở Khóa',
    ['READ_LESS'] = 'Đọc ít lại',
    ['READ_MORE'] = 'Đọc nhiều hơn',
    ['ALLDAILYAWARDS'] = 'Phần Thưởng Hằng Ngày',
    ['WELCOMETOLIVE'] = 'Xin Chào Tới Tổng Đài Hỗ Trợ',
    ['SEND'] = 'Gửi',
    ['CALLS'] = 'Gọi',
    ['SETTINGS'] = 'Cài Đặt',
    ['MAP'] = 'Bản Đồ',
    ['RESUME'] = 'Tiếp Tục',
    ['KEYBINDS'] = 'Nút',
    ['EXIT']='Thoát Game',
    ['DISABLED']='Tắt',
}


Config.NotificationText = {
    ["CLAIMED_VEHICLE"] = {
        text = 'Nhận %s',
        timeout = 3000,
    },
    ["CLAIMED_ITEM"] = {
        text = 'Nhận %sx %s',
        timeout = 3000,
    },
    ["CLAIMED_CASH"] = {
        text = 'Nhận $%s tiền mặt',
        timeout = 3000,
    },
    ["PREMIUM_ITEM"] = {
        text = 'Đây là một mặt hàng cao cấp',
        timeout = 3000,
    },
    ["PURCHASED_BATTLEPASS"] = {
        text = 'Đã mua thành công BattlePass',
        timeout = 3000,
    },
    ["ALREADY_PURCHASED"] = {
        text = "Bạn đã mua BattlePass hoặc là nó miễn phí",
        timeout = 3000,
    },
    ["MISSON_COMPLETED"] = {
        text = 'Hoàn thành nhiệm vụ BattlePass',
        type = "success",
        timeout = 3000,
    },
    ["ADMIN_ERROR"] = {
        text = 'Bạn không phải là admin hoặc tham số đã sai (%s)',
        type = 'error',
        timeout = 3000,
    },
    ["NEW_CALL"] = {
        text = 'Bạn đã tạo một cuộc gọi',
        type = 'success',
        timeout = 3000
    },
    ["NEW_MESSAGE"] = {
        text = 'Tin nhắn đã được gửi tới.',
        type = 'success',
        timeout = 3000
    },
    ["LIVE_CALL_TERMINATED"] = {
        text = 'Cuộc gọi đã bị hủy',
        timeout = 3000,
    },
    ["BLACKLISTED_WORD"] = {
        text = 'Thông điệp của bạn chứa từ trong danh sách đen',
        timeout = 3000,
    },
    ["NOT_LOADED"] = {
        text = 'Bảng dừng đang chưa được tải',
        type = 'error',
        timeout = 3000,
    },
    ["SPAM_CONTROL"] = {
        text = 'Điều khiển thư rác được bật, vui lòng thử lại vài giây sau',
        type = 'error',
        timeout = 3000,
    },

}

Config.PatchNotes = { -- Each text you write here will show up in the update notes in the pausemenu
    date = '29.10.2022',
    updates = {
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",
        "Mysterious City.",

    },
}

Config.ChatBlacklistedWords = { -- This prevents players type chat blacklisted words
    'faggot',
    'bitch',
    'b1tch',
    'du ma',
    'duma',
    'dume',
    'du me',
}

--[[------------------------------------------------------------------------------------------
██████╗░░█████╗░████████╗████████╗██╗░░░░░███████╗██████╗░░█████╗░░██████╗░██████╗
██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║░░░░░██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝
██████╦╝███████║░░░██║░░░░░░██║░░░██║░░░░░█████╗░░██████╔╝███████║╚█████╗░╚█████╗░
██╔══██╗██╔══██║░░░██║░░░░░░██║░░░██║░░░░░██╔══╝░░██╔═══╝░██╔══██║░╚═══██╗░╚═══██╗
██████╦╝██║░░██║░░░██║░░░░░░██║░░░███████╗███████╗██║░░░░░██║░░██║██████╔╝██████╔╝
╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░░╚══════╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═════╝░╚═════╝░
------------------------------------------------------------------------------------------]]--

Config.BattlepassDayCountDown = 30 -- When you launch codem-pausemenu on your server, battlepass will be activated and this option determines how many days battlepass should be active before resetting everybody's battlepass data
Config.FreeBattlepass = false -- This option makes battlepass free for everyone (if this set to true you don't have to make tebex integration)
Config.BattlepassMissionsPerDay = 6 -- [[

    -- Missions in codem-pausemenu's battlepass system are created from the Config.BattlepassMissions pool, and this option determines how many missions the system should get from the pool per day.
    -- Note : for example if this option is set to 6 and amount of missions in the pool is less than 6 then the script will generate a random number between 1 and maximum missions amount
--]]

Config.BattlepassMissions = {
    {
        id = 1,
        label = 'Eat',
        desc = 'Eat any 5 food',
        repeatAmount = 5,
        xpAmount = 1000,
        func = function(_self)
            if Config.Framework == 'esx' then
                RegisterNetEvent('esx_basicneeds:onEat')
                AddEventHandler('esx_basicneeds:onEat', function()
                    TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id)
                end)
            else
                RegisterNetEvent('consumables:client:Eat')
                AddEventHandler('consumables:client:Eat', function()
                    TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id)
                end)
            end
        end,
    },
    {
        id = 2,
        label = 'Drink',
        desc = 'Drink something 3 times',
        repeatAmount = 3,
        xpAmount = 1000,
        func = function(_self)
            if Config.Framework == 'esx' then
                RegisterNetEvent('esx_basicneeds:onDrink')
                AddEventHandler('esx_basicneeds:onDrink', function()
                    TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id)
                end)
            else
                RegisterNetEvent('consumables:client:Drink')
                AddEventHandler('consumables:client:Drink', function()
                    TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id)
                end)
            end
        end,
    },
    {
        id = 3,
        label = 'Drive',
        desc = 'Drive for 5 km',
        repeatAmount = 5,
        xpAmount = 1000,
        func = function(_self)
            local lastCoords
            Citizen.CreateThread(function()
                while true do
                    local player = PlayerPedId()
                    local veh = GetVehiclePedIsIn(player)
                    if veh ~= 0 then
                        local coords = GetEntityCoords(player)
                        if IsVehicleOnAllWheels(veh) then
                            if not lastCoords then
                                lastCoords = GetEntityCoords(player)
                            end
                            local dst = #(coords - lastCoords)
                            TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id, math.floor(dst*1.33)/1000)
                            lastCoords = GetEntityCoords(player)
                        end
                    end
                    Citizen.Wait(3000)
                end
            end)
        end,
    },
    {
        id = 4,
        label = 'Drive',
        desc = 'Drive for an hour',
        repeatAmount = 60,
        xpAmount = 1000,
        func = function(_self)
            local drivingSeconds = 0
            Citizen.CreateThread(function()
                while true do
                    local player = PlayerPedId()
                    local veh = GetVehiclePedIsIn(player)
                    if veh ~= 0 then
                        if GetEntitySpeed(veh) > 0 then
                            drivingSeconds = drivingSeconds + 1
                            if drivingSeconds > 60 then
                                drivingSeconds = 0
                                TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id, 1)
                            end
                        end
                    end
                    Citizen.Wait(1000)
                end
            end)
        end,
    },
    {
        id = 5,
        label = 'Drive',
        desc = 'Drive at 140 km/h or more for 3 minutes',
        repeatAmount = 3,
        xpAmount = 1000,
        func = function(_self)
            local drivingSeconds = 0

            Citizen.CreateThread(function()
                while true do
                    local player = PlayerPedId()
                    local veh = GetVehiclePedIsIn(player)
                    if veh ~= 0 then
                        local speed = GetEntitySpeed(veh) * 3.6
                        if speed > 140 then
                            drivingSeconds = drivingSeconds + 1
                            if drivingSeconds > 60 then
                                drivingSeconds = 0
                                TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id)
                            end
                        end
                    end
                    Citizen.Wait(1000)
                end
            end)
        end,
    },
    {
        id = 6,
        label = 'Drive',
        desc = 'Walk or run for 2km',
        repeatAmount = 2,
        xpAmount = 1000,
        func = function(_self)
            local lastCoords
            Citizen.CreateThread(function()
                while true do
                    local player = PlayerPedId()
                    local coords = GetEntityCoords(player)
                    if IsPedRunning(player) or IsPedWalking(player) or IsPedSprinting(player) and not IsPedInAnyVehicle(player) then
                        if not lastCoords then
                            lastCoords = GetEntityCoords(player)
                        end
                        local dst = #(coords - lastCoords)
                        TriggerServerEvent('codem-pausemenu:AddBattlepassMissionProgress', _self.id, math.floor(dst*1.33)/1000)
                        lastCoords = GetEntityCoords(player)
                    end
                    Citizen.Wait(3000)
                end
            end)
        end,
    },
}

Config.BattlepassItem = {
    {
        amount = 5000,
        label = 'Cash',
        image = 'cash.png',
        type = 'money',
        requiredXP = 1000,
        level = 1,
        premium = true,
    },
    {
        name = 'water_bottle',
        label = 'Water',
        image = 'water.png',
        amount = 2,
        type = 'item',
        requiredXP = 1500,
        level = 2,
        premium = true,

    },
    {
        name = 'advancedrepairkit',
        label = 'Repair Kit',
        image = 'advancedrepairkit.png',
        amount = 1,
        type = 'item',
        requiredXP = 2000,
        level = 3,
        premium = true,

    },
    {
        name = 'weapon_pistol',
        label = 'Pistol',
        image = 'advancedrepairkit.png',
        amount = 1,
        type = 'weapon',
        requiredXP = 1000,
        level = 4,
        premium = true,

    },
    {
        name = 'adder',
        label = 'Adder',
        image = 'Adder.png', -- check html/assets/car_images for more car images
        type = 'vehicle',
        requiredXP = 5000,
        level = 5,
        premium = true,
        garage = 'motelgarage', -- Set this option only on qb-core
    },
    {
        label = 'Items Box',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        requiredXP = 5000,
        level = 6,
        items = {
            {
                name = 'adder',
                label = 'Adder',
                type = 'vehicle',
                garage = 'motelgarage', -- Set this option only on qb-core
            },
            {
                name = 'phone',
                label = 'Phone',
                amount = 1,
                type = 'item',
            },
            {
                name = 'water_bottle',
                label = 'Water',
                amount = 2,
                type = 'item',
            },
            {
                amount = 5000,
                label = 'Cash',
                type = 'money',
            },
        },
        premium = true,

    },
    {
        name = 'adder',
        label = 'Adder',
        image = 'Adder.png', -- check html/assets/car_images for more car images
        type = 'vehicle',
        requiredXP = 5000,
        level = 7,
        premium = true,
        garage = 'motelgarage', -- Set this option only on qb-core


    },
}

--[[----------------------------------------------------------------------------------------------
██████╗░░█████╗░██╗██╗░░░░░██╗░░░██╗░█████╗░░██╗░░░░░░░██╗░█████╗░██████╗░██████╗░░██████╗
██╔══██╗██╔══██╗██║██║░░░░░╚██╗░██╔╝██╔══██╗░██║░░██╗░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
██║░░██║███████║██║██║░░░░░░╚████╔╝░███████║░╚██╗████╗██╔╝███████║██████╔╝██║░░██║╚█████╗░
██║░░██║██╔══██║██║██║░░░░░░░╚██╔╝░░██╔══██║░░████╔═████║░██╔══██║██╔══██╗██║░░██║░╚═══██╗
██████╔╝██║░░██║██║███████╗░░░██║░░░██║░░██║░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║██████╔╝██████╔╝
╚═════╝░╚═╝░░╚═╝╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═════╝░
----------------------------------------------------------------------------------------------]]--

Config.DailyAwardsItem = {
    {
        amount = 5000,
        label = 'Tiền Mặt',
        image = 'cash.png',
        type = 'money',
    },
    {
        label = 'Hộp Bánh Nước',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        items = {
            {
                name = 'water_bottle',
                label = 'Nước',
                amount = 10,
                type = 'item',
            },
            {
                name = 'tosti',
                amount = 10,
                label = 'Bánh Nướng',
                type = 'item',
            },
        }
    },
    {
        name = 'advancedlockpick',
        label = 'Khóa Nâng Cấp',
        image = 'advancedlockpick.png',
        amount = 2,
        type = 'item',
    },
    {
        name = 'ifaks',
        label = 'Thuốc',
        image = 'ifaks.png',
        amount = 5,
        type = 'item',
    },
    {
        name = 'binoculars',
        label = 'Ống Nhòm',
        image = 'binoculars.png',
        amount = 1,
        type = 'item',
    },
    {
        name = 'parachute',
        label = 'Dù',
        image = 'parachute.png',
        amount = 1,
        type = 'item',
    },
    {
        label = 'Hộp Thợ Lặn',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        items = {
            {
                name = 'diving_gear',
                label = 'Bình Lặn',
                amount = 1,
                type = 'item',
            },
            {
                name = 'diving_fill',
                amount = 2,
                label = 'Ống Thở',
                type = 'item',
            },
        }
    },
    {
        label = 'Hộp Bánh Nước',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        items = {
            {
                name = 'water_bottle',
                label = 'Nước',
                amount = 20,
                type = 'item',
            },
            {
                name = 'tosti',
                amount = 20,
                label = 'Bánh Nướng',
                type = 'item',
            },
        }
    },
    {
        name = 'joint',
        label = 'Điếu Cần',
        image = 'joint.png',
        amount = 5,
        type = 'item',
    },
    {
        amount = 15000,
        label = 'Tiền Mặt',
        image = 'cash.png',
        type = 'money',
    },
    {
        name = 'dice',
        label = 'Xí Ngầu',
        image = 'dice.png',
        amount = 10,
        type = 'item',
    },
    {
        name = 'slimmaterialrod',
        label = 'Cần Câu',
        image = 'slimmaterialrod.png',
        amount = 1,
        type = 'item',
    },

    {
        name = 'threesidedbait',
        label = 'Mồi Câu',
        image = 'threesidedbait.png',
        amount = 50,
        type = 'item',
    },
    {
        name = 'screwdriverset',
        label = 'Bộ Vít',
        image = 'screwdriverset.png',
        amount = 6,
        type = 'item',
    },
    {
        name = 'vouhcher_bar',
        label = 'Voucher MystBar',
        image = 'voucher_bar.png',
        amount = 2,
        type = 'item',
    },
    {
        label = 'Hộp Hạt Giống',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        items = {
            {
                name = 'wheat_seed',
                label = 'Hạt Lúa',
                amount = 15,
                type = 'item',
            },
            {
                name = 'orange_seed',
                amount = 15,
                label = 'Hạt Cam',
                type = 'item',
            },
            {
                name = 'bean_seed',
                amount = 15,
                label = 'Hạt Đậu',
                type = 'item',
            },
            {
                name = 'coffee_seed',
                amount = 15,
                label = 'Hạt Caffe',
                type = 'item',
            },
        }
    },

    {
        name = 'weed_seed',
        label = 'Hạt Cần',
        image = 'weed_seed.png',
        amount = 30,
        type = 'item',
    },
    {
        name = 'plastic_bags',
        label = 'Túi Nhựa',
        image = 'plastic_bags.png',
        amount = 100,
        type = 'item',
    },
    {
        name = 'giesskanne_voll',
        label = 'Nước Tưới Cây',
        image = 'giesskanne_voll.png',
        amount = 60,
        type = 'item',
    },
    {
        name = 'voucher_tunner',
        label = 'Voucher Độ Xe',
        image = 'voucher_tunner.png',
        amount = 1,
        type = 'item',
    },

    {
        name = 'ifaks',
        label = 'Thuốc',
        image = 'ifaks.png',
        amount = 15,
        type = 'item',
    },
    {
        amount = 20000,
        label = 'Tiền Mặt',
        image = 'cash.png',
        type = 'money',
    },
    {
        name = 'leather',
        label = 'Da Thuộc',
        image = 'leather.png',
        amount = 10,
        type = 'item',
    },
    {
        name = 'advancedrepairkit',
        label = 'Hộp Sửa Xe',
        image = 'advancedrepairkit.png',
        amount = 2,
        type = 'item',
    },
    {
        name = 'voucher_car',
        label = 'Voucher Xe',
        image = 'voucher_car.png', -- check html/assets/car_images for more car images
        type = 'item',
        amount = 1,
        -- garage = 'motelgarage', -- Set this option only on qb-core
    },
    {
        label = 'Hộp Ngọc Qúy',
        image = 'box.png', -- check html/assets/car_images for more car images
        type = 'box',
        items = {
            {
                name = 'diamond',
                label = 'Kim Cương',
                amount = 5,
                type = 'item',
            },
            {
                name = 'emerald',
                label = 'Lục Bảo',
                amount = 5,
                type = 'item',
            },
        }
    },
    {
        name = 'goldbar',
        label = 'Thỏi Vàng',
        image = 'goldbar.png',
        amount = 1,
        type = 'item',
    },
    {
        name = 'renamecard',
        label = 'Thẻ Đổi Tên',
        image = 'renamecard.png',
        amount = 1,
        type = 'item',
    },
    {
        name = 'megaphone',
        label = 'Loa Phát Thanh',
        image = 'megaphone.png',
        amount = 1,
        type = 'item',
    },
}

--[[---------------------------------------------------------------------------
░█████╗░████████╗██╗░░██╗███████╗██████╗░░██████╗
██╔══██╗╚══██╔══╝██║░░██║██╔════╝██╔══██╗██╔════╝
██║░░██║░░░██║░░░███████║█████╗░░██████╔╝╚█████╗░
██║░░██║░░░██║░░░██╔══██║██╔══╝░░██╔══██╗░╚═══██╗
╚█████╔╝░░░██║░░░██║░░██║███████╗██║░░██║██████╔╝
░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░
---------------------------------------------------------------------------]]--

Config.ClientNotification = function(message, type, length) -- You can change notification event here
    if Config.Framework == "esx" then
        TriggerEvent("esx:showNotification", message)
    else
        TriggerEvent('QBCore:Notify', message, type, length)
    end
end

Config.ServerNotification = function(source, message, type, length) -- You can change notification event here
    if Config.Framework == "esx" then
        TriggerClientEvent("esx:showNotification",source, message)
    else
        TriggerClientEvent('QBCore:Notify', source, message, type, length)
    end
end

Config.CheckPermissions = function()
    -- This is required to get admins for livecall system
    if Config.Framework == "esx" then
        Config.AdminPermissions = {
            "superadmin",
            "admin",
            "mod",

        }
    else
        Config.AdminPermissions = {
            "god",
            "admin",
        }
    end

end

