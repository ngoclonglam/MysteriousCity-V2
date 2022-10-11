
-------------------------------------------- General --------------------------------------------
Config = {}
Config.Framework = "newbq" -- newqb, oldqb, esx
Config.Mysql = "oxymsql" -- mysql-async, ghmattimysql, oxmysql
Config.Voice = "pma" -- mumble, saltychat, pma
Config.DefaultHud = "malibuhud" -- Default hud when player first login avaliable huds [venicehud, malibuhud, belairhud]
Config.DefaultCarHud = "mayhemhud" -- Default hud when player first login avaliable huds [vertexhud, mayhemhud, perspecthud]
Config.EnableDynamicStatusFirstJoin = false -- Enable dynamic status first join
Config.DefaultSpeedUnit = "kmh" -- Default speed unit when player first login avaliable speed units [kmh, mph]
Config.HudSettingsCommand = 'hud' -- Command for open hud settings
Config.DisplayMapOnWalk = true -- true - Show map when walking | false - Hide map when walking
Config.DisplayRealTime = false -- if you set this to true will show the real time according to player local time | if false it will show the game time
Config.EnableSpamNotification = true -- Spam preventation for seatbelt, cruise etc.
Config.EnableDateDisplay = true -- Determines if display date or nor
Config.DefaultSpeedometerSize = 1.2 -- 0.5 - 1.3
Config.DefaultHudSize = 1.0 -- 0.5 - 1.0
Config.EnableAmmoHud = true -- Determines if display ammo hud or nor
Config.RefreshRates = {
    ["armor"] = 1750,
    ["health"] = 1750,
    ["ammo"] = 2000,
}

Config.EnableHudSettings = {
    --SHOOOOOOOOOOW image link
    -- https://cdn.discordapp.com/attachments/983471660684423240/1019920558604951592/unknown.png
    ['alltextmenu'] = true,

    -- VENİCE HUD  SETTİNGS
    ["venicehudhealt"] = true,
    ["venicehudarmour"] = true,
    ["venicehudthirst"] = true,
    ["venicehudhunger"] = true,
    ["venicehudstamina"] = true,
    ["venicehudstress"] = true,
    ["venicehudoxy"] = true,


    -- MALİBUHUD SETTINGS 
    ["malibuhudhealt"] = true,
    ["malibuhudarmour"] = true,
    ["malibuhudthirst"] = true,
    ["malibuhudhunger"] = true,
    ["malibuhudstamina"] = true,
    ["malibuhudstress"] = true,
    ["malibuhudoxy"] = true,

      -- Belair SETTINGS 
    ["belairhudhealt"] = true,
    ["belairhudarmour"] = true,
    ["belairhudthirst"] = true,
    ["belairhudhunger"] = true,
    ["belairhudstamina"] = true,
    ["belairhudstress"] = true,
    ["belairhudoxy"] = true,

    --CAR HUD 

    ["vertexhud"] = true,
    ["mayhemhud"] = true,
    ["perspecthud"] = true,

}


Config.CarnameandStreetname = true --- true === disabled  --  false === enabled

Config.DefaultHudColors = {
    ["venicehud"] = {
        ["health"] = "#FF4848ac",
        ["armor"] = "#FFFFFFac",
        ["hunger"] = "#FFA048ac",
        ["thirst"] = "#4886FFac",
        ["stress"] = "#48A7FFac",
        ["stamina"] = "#C4FF48ac",
        ["oxy"] = "#48A7FFac",
        ["parachute"] = "#48FFBDac",
        ["nitro"] = "#AFFF48ac",
        ["altitude"] = "#00FFF0ac",
    },
    ["malibuhud"] = {
        ["health"] = "#FF4848",
        ["armor"] = "#FFFFFF",
        ["hunger"] = "#FFA048",
        ["thirst"] = "#4886FF",
        ["stress"] = "#48A7FF",
        ["stamina"] = "#C4FF48",
        ["parachute"] = "#48FFBD",
        ["oxy"] = "#48A7FF",
        ["nitro"] = "#AFFF48",
        ["altitude"] = "#00FFF0",
    },    
    ["belairhud"] = {
        ["health"] = "#FF8A00",
        ["armor"] = "#2E3893",
        ["hunger"] = "#FF8A00",
        ["thirst"] = "#00C6BA",
        ["stress"] = "#CD007B",
        ["oxy"] = "#48A7FFac",
        ["stamina"] = "#c4ff48",
        ["parachute"] = "#48ffde",
        ["nitro"] = "#8eff48",
        ["altitude"] = "#48deff",
    },
}
Config.DefaultCarHudColors = {
    ["mayhemhud"] = {
        ["circle"] = "#FF4848",
        ["shift"] = "#FF4848",
        ["needle"] = "#FF4848",
        ["speed"] = "#FF4848",
        ["s0"] = "#00ffff84",
        ["s20"] = "#00ffff",
        ["s40"] = "#00ffff84",
        ["s60"] = "#00ffff",
        ["s80"] = "#00ffff84",
        ["s100"] = "#00ffff",
        ["s120"] = "#00ffff84",
        ["s140"] = "#00ffff",
        ["s160"] = "#00ffff84",
        ["s180"] = "#00ffff",
        ["s200"] = "#00ffff84",
        ["s220"] = "#00ffff",
        ["s240"] = "#00ffff84",
        ["s260"] = "#00ffff",
        ["gas"] = "#00ffff",
        ["health"] = "#FF4848",
        ["nitro"] = "#00ffff",
        ["wind"] = "#FF4848",
        ["altitude"] = "#00ffff",
    },
    ["vertexhud"] = {
        ["health"] = "#00FFF0",
        ["speed"] = "#00FFF0",
        ["gas"] = "#00FFF0"
    },
    ["perspecthud"] = {
        ["wind"] = "#00FFF0",
        ["nitro"] = "#00FFF0",
        ["shift"] = "#00FFF0" ,
        ["health"] = "#00FFF0" ,
        ["gas"] = "#00FFF0" ,
        ["speed"] = "#00FFF0" ,
        ["altitude"] = "#00FFF0" ,
        ["roads"] = "#00FFF0" ,
    },
}


-------------------------------------------- Locale --------------------------------------------
Config.Locale = {
    ["STATUS"] = 'Tình Trạng',
    ["SPEEDOMETER"] = 'Đồng Hồ Tốc Độ',
    ["SHOW_HUD"] = 'Hiện Hud',
    ["HIDE_HUD"] = 'Ẩn Hud',
    ["CINEMATIC_MODE"] = 'Chế Độ Điện Ảnh',
    ["RESET_HUD"] = 'Reset Hud',
    ["SELECT"] = 'Chọn',
    ["EDIT"] = 'Sửa',
    ["ID"] = 'ID',
    ["ONLINE"] = 'Online',
    ["CHANGE_ALL_COLORS"] = 'Đổi Màu',
    ["DRAG_DROP"] = 'Kéo & Thả',
    ["DEFAULT"] = 'Mặc Định',
    ["CIRCLE"] = 'Circle',
    ["SHIFT"] = 'Shift',
    ["NEEDLE"] = 'Needle',
    ["SPEED"] = 'Tốc Độ',
    ["GAS"] = 'Gas',
    ["HEALTH"] = 'Máu',
    ["NITRO"] = 'Nitro',
    ["WIND"] = 'Gió',
    ["ROADS"] = 'Đường',
    ["ALTITUDE"] = 'Altitude',
    ["ARMOUR"] = 'Giáp',
    ["THIRST"] = 'Độ Khát',
    ["HUNGER"] = 'Độ Đói',
    ["STRESS"] = 'Stress',
    ["LUNGS"] = 'Phổi',
    ["STAMINA"] = 'Thể Lực',
    ["AT"] = 'at',
    ["RESET"] = 'Reset',
    ["HIDE_ID"] = 'Ẩn ID',
    ["SHOW_ID"] = 'Hiện ID',
    ["HIDE_ONLINE"] = 'Ẩn Online',
    ["SHOW_ONLINE"] = 'Hiện Online',
    ["HIDE_MONEY"] = 'Ẩn Tiền',
    ["SHOW_MONEY"] = 'Hiện Tiền',
    ["HIDE_JOB"] = 'Ẩn Nghề',
    ["SHOW_JOB"] = 'Hiện Nghề',
    ["HIDE_AMMO"] = 'Ẩn Đạn',
    ["SHOW_AMMO"] = 'Hiện Đạn',
    ["SHOW_PHONE_KEY"] = 'Hiện Nút Phone',
    ["HIDE_PHONE_KEY"] = 'Ẩn Nút Phone',
    ["HIDE_INVENTORY_KEY"] = 'Ẩn Nút Túi Đồ',
    ["SHOW_INVENTORY_KEY"] = 'Hiện Nút Túi Đồ',
    ["HIDE_MENU_KEY"] = 'Ẩn Nút Menu',
    ["SHOW_MENU_KEY"] = 'Hiện Nút Menu',
    ["HIDE_MIC_KEY"] = 'Ẩn Nút Micro',
    ["SHOW_MIC_KEY"] = 'Hiện Nút Micro',
    ["SHOW_LOGO"] = 'Hiện Logo',
    ["HIDE_LOGO"] = 'Ẩn Logo',
    ["EDIT_PAGE"] = 'Chỉnh Sửa Trang',
    ["HUD"] = 'HUD',
    ["STYLE_SELECTOR"] = 'Chọn Phong Cách',
    ["DISABLED"] = 'Không Hoạt Động',






}


-------------------------------------------- Settings hud --------------------------------------------
Config.HelperTextEnable = true  --- true enable --- false disable
Config.HelperText = {
    ['phone'] = 'Phone',['phonepress'] = 'F1',
    ['inventory'] = 'Inventory', ['inventorypress'] = 'F2',
    ['menu'] = 'Menu',['menupress'] = 'F3',
    ['mic'] = 'Mic',['micpress'] = 'N',
}
-------------------------------------------- general text hud --------------------------------------------

Config.ShowMenu = {
    ['showid'] = true,
    ['showonline'] = true,
    ['showmoney'] = true,
    ['showjob'] = true,
    ['showammo'] = true,
    ['showphonekey'] = true,
    ['showinventorykey'] = true,
    ['showmenukey'] = true,
    ['showmickey'] = true,
    ['showlogo'] = true,
}



-------------------------------------------- Watermark hud --------------------------------------------
Config.DisableWaterMarkTextAndLogo = true -- true - Disable watermark text and logo 
Config.UseWaterMarkText = true -- if true text will be shown | if  false logo will be shown
Config.WaterMarkText1 = "CODEM" -- Top right server text
Config.WaterMarkText2 = "SCRiPTS"  -- Top right server text
Config.WaterMarkLogo = "https://cdn.discordapp.com/attachments/862018783391252500/967359920703942686/Frame_303.png" -- Logo url
Config.LogoWidth = "11.875rem"
Config.LogoHeight = "3.313rem"
Config.OnlinePlayers = true --Determines if display online players or nor
Config.EnableId = true -- Determines if display server id or nor
Config.EnableBankandCashBorder = true --Determines if display cash or nor
Config.EnableWatermarkCash = true -- Determines if display cash or nor
Config.EnableWatermarkBankMoney = true -- Determines if display bank money or nor
Config.EnableWatermarkJob = true -- Determines if display job or nor
Config.EnableWaterMarkHud = true -- Determines if right-top hud is enabled or not

Config.Text1Style = {
    ["color"] = '#e960c7',
    ["text-shadow"] = "0px 0.38rem 2.566rem rgba(116, 5, 147, 0.55)",
}

Config.Text2Style = {
    ["color"] = "#ffffff",
}

-------------------------------------------- Map Clock streetname compass --------------------------------------------
Config.CompassStreetnameClock = true -- true  show -- false hide

-------------------------------------------- Keys --------------------------------------------
Config.DefaultCruiseControlKey = "y" -- Default control key for cruise. Players can change the key according to their desire 
Config.DefaultSeatbeltControlKey = "b" -- Default control key for seatbelt. Players can change the key according to their desire 
Config.VehicleEngineToggleKey = "g" -- Default control key for toggle engine. Players can change the key according to their desire 
Config.NitroKey = "," -- Default control key for use nitro. Players can change the key according to their desire 

-------------------------------------------- Nitro --------------------------------------------
Config.Nitro = false --- just html icon
Config.RemoveNitroOnpress = 2 -- Determines of how much you want to remove nitro when player press nitro key
Config.NitroItem = "nitro" -- item to install nitro to a vehicle
Config.EnableNitro = true -- Determines if nitro system is enabled or not
Config.NitroForce = 40.0 -- Nitro force when player using nitro

-------------------------------------------- Money commands --------------------------------------------

Config.EnableCashAndBankCommands = true -- true  enabled -- false  -- disabled

Config.CashCommand= 'cash'
Config.BankCommand= 'bank'

-------------------------------------------- Engine Toggle --------------------------------------------
Config.EnableEngineToggle = true -- Determines if engine toggle is enabled or not

-------------------------------------------- Vehicle Functionality --------------------------------------------
Config.EnableCruise = true -- Determines if cruise mode is active
Config.EnableSeatbelt = true -- Determines if seatbelt is active

-------------------------------------------- Settings text --------------------------------------------
Config.SettingsLocale = { -- Settings texts
    ["text_hud_1"] = "text",
    ["text_hud_2"] = "hud",
    ["classic_hud_1"] = "classic",
    ["classic_hud_2"] = "hud",
    ["radial_hud_1"] = "radial",
    ["radial_hud_2"] = "hud",
    ["hide_hud"] = "Ẩn Hud",
    ["health"] = "Máu",
    ["armor"] = "Giáp",
    ["thirst"] = "Độ Khát",
    ["stress"] = "Stress",
    ["oxy"] = "Oxygen",
    ["hunger"] = "Độ Đói",
    ["show_hud"] = "Hiện Hud",
    ["stamina"] = "Thể Lực",
    ["nitro"] = "Nitro",
    ["Altitude"] = "Altitude",
    ["Parachute"] = "Dù",
    ["enable_cinematicmode"] = "Chế Độ Điện Ảnh",
    ["disable_cinematicmode"] = "Tắt Chế Độ Điện Ảnh",
    ["exit_settings_1"] = "EXIT FROM",
    ["exit_settings_2"] = "CÀI ĐẶT",
    ["speedometer"] = "ĐỒNG HỒ TỐC ĐỘ",
    ["map"] = "BẢN ĐỒ",
    ["show_compass"] = "Hiện La Bàn",
    ["hide_compass"] = "Ẩn La Bàn",
    ["rectangle"] = "Rectangle",
    ["radial"] = "Radial",
    ["dynamic"] = "DYNAMiC",
    ["status"] = "STATUS",
    ["enable"] = "BẬT",
    ["hud_size"] = "Status size",
    ["disable"] = "TẮT",
    ["hide_at"] = "Hide at",
    ["and_above"] = "and above",
    ["and_below"] = "and below",
    ["enable_edit_mode"] = "Drag HUD (One by one)",
    ["enable_edit_mode_2"] = "Drag HUD (All)",
    ["change_status_size"] = "Change status size",
    ["change_color"] = "Thay đổi màu sắc của HUD đã chọn ",
    ["disable_edit_mode"] = "Tắt Chế Độ Chỉnh Sửa",
    ["reset_hud_positions"] = "Reset Vị Trí Hud",
    ["info_text"] = "Cẩn thận tăng tốc độ làm mới có thể làm giảm hiệu suất trò chơi của bạn!",
    ["speedometer_size"] = "Kích Thước Bảng Tốc Độ",
    ["refresh_rate"] = "Refresh Rate",
    ["esc_to_exit"] = "PRESS ESC TO EXIT EDIT MODE",
    ["toggle_minimap"] = "Bật Minimap",
}

-------------------------------------------- Fuel --------------------------------------------
Config.UseLegacyFuel = false --Enable this if you use legacy fuel

Config.GetVehicleFuel = function(vehicle) -- you can change LegacyFuel export if you use another fuel system 
    if Config.UseLegacyFuel then
        return exports["LegacyFuel"]:GetFuel(vehicle)
    else
        return GetVehicleFuelLevel(vehicle)
    end
end

-------------------------------------------- Stress --------------------------------------------

Config.UseStress = true -- if you set this to false the stress hud will be removed
Config.StressWhitelistJobs = { -- Add here jobs you want to disable stress 
    'police', 'ambulance'
}

Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}

Config.AddStress = {
    ["on_shoot"] = {
        min = 1,
        max = 3,
        enable = true,
    },
    ["on_fastdrive"] = {
        min = 1,
        max = 3,
        enable = true,
    },
}

Config.RemoveStress = { -- You can set here amounts by your desire
    ["on_eat"] = {
        min = 5,
        max = 10,
        enable = false,

    },
    ["on_drink"] = {
        min = 5,
        max = 10,
        enable = false,

    },
    ["on_swimming"] = {
        min = 5,
        max = 10,
        enable = false,

    },
    ["on_running"] = {
        min = 5,
        max = 10,
        enable = false,
    },

}



-------------------------------------------- Notifications --------------------------------------------

Config.Notifications = { -- Notifications
    ["stress_gained"] = {
        message = 'Bị căng thẳng',
        type = "error",
    },
    ["stress_relive"] = {
        message =  'Bạn đang thư giãn',
        type = "success",
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "Bạn đã cởi dây an toàn.",
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "Bạn đã thắt dây an toàn.",
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Kiểm soát tốc độ kích hoạt.",
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Kiểm soát tốc độ bị vô hiệu hóa.",
    },
    ["spam"] = {
        type = "error",
        message = "Vui lòng đợi trong vài giây.",
    },
    ["engine_on"] = {
        type = "success",
        message = "Động cơ đang bật.",
    },
    ["engine_off"] = {
        type = "success",
        message = "Động cơ bị tắt.",
    },
    ["cant_install_nitro"] = {
        type = "error",
        message = "Bạn không thể cài đặt Nitro bên trong xe.",
    },
    ["no_veh_nearby"] = {
        type = "error",
        message = "Không có xe gần đó.",
    },
    ["cash_display"] = {
        type = "success",
        message = "Bạn có $%s trong túi của bạn.",
    },
    ["bank_display"] = {
        type = "success",
        message = "Bạn có $%s trong ngân hàng của bạn.",
    },
}

Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end 




CreateThread(function()
    frameworkObject = GetFrameworkObject()
    Config.GetStatus = function()
        Wait(100)
        while true do
                if Config.Framework == "newqb" or Config.Framework == "oldqb"  then
                    WaitPlayer()
                    local myhunger = frameworkObject.Functions.GetPlayerData().metadata["hunger"]
                    local mythirst = frameworkObject.Functions.GetPlayerData().metadata["thirst"]

                    SendNUIMessage({
                        type = "set_status",
                        statustype = "hunger",
                        value =  myhunger,
                    })
                    SendNUIMessage({
                        type = "set_status",
                        statustype = "thirst",
                        value =  mythirst,
                    })        
                end
                if Config.Framework == "esx" then
                    TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
                        TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                            local myhunger = hunger.getPercent()
                            local mythirst = thirst.getPercent()
                            SendNUIMessage({
                                type = "set_status",
                                statustype = "hunger",
                                value =  myhunger,
                            })
                            SendNUIMessage({
                                type = "set_status",
                                statustype = "thirst",
                                value =  mythirst,
                            })
                        end)
                    end)               
                end
          
            Wait(7000)
        end
    end

end)

