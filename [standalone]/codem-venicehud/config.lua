
-------------------------------------------- General --------------------------------------------
Config = {}
Config.Framework = "newqb" -- newqb, oldqb, esx
Config.Mysql = "oxmysql" -- mysql-async, ghmattimysql, oxmysql
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
    ["STATUS"] = 'Status',
    ["SPEEDOMETER"] = 'Speedometer',
    ["SHOW_HUD"] = 'Show Hud',
    ["HIDE_HUD"] = 'Hide Hud',
    ["CINEMATIC_MODE"] = 'Cinematic Mode',
    ["RESET_HUD"] = 'Reset Hud',
    ["SELECT"] = 'Select',
    ["EDIT"] = 'Edit',
    ["ID"] = 'ID',
    ["ONLINE"] = 'Online',
    ["CHANGE_ALL_COLORS"] = 'Change All Colors',
    ["DRAG_DROP"] = 'Drag & Drop',
    ["DEFAULT"] = 'Default',
    ["CIRCLE"] = 'Circle',
    ["SHIFT"] = 'Shift',
    ["NEEDLE"] = 'Needle',
    ["SPEED"] = 'Speed',
    ["GAS"] = 'Gas',
    ["HEALTH"] = 'Health',
    ["NITRO"] = 'Nitro',
    ["WIND"] = 'Wind',
    ["ROADS"] = 'Roads',
    ["ALTITUDE"] = 'Altitude',
    ["ARMOUR"] = 'Armour',
    ["THIRST"] = 'Thirst',
    ["HUNGER"] = 'Hunger',
    ["STRESS"] = 'Stress',
    ["LUNGS"] = 'Lungs',
    ["STAMINA"] = 'Stamina',
    ["AT"] = 'at',
    ["RESET"] = 'Reset',
    ["HIDE_ID"] = 'Hide ID',
    ["SHOW_ID"] = 'Show ID',
    ["HIDE_ONLINE"] = 'Hide Online',
    ["SHOW_ONLINE"] = 'Show Online',
    ["HIDE_MONEY"] = 'Hide Money',
    ["SHOW_MONEY"] = 'Show Money',
    ["HIDE_JOB"] = 'Hide Job',
    ["SHOW_JOB"] = 'Show Job',
    ["HIDE_AMMO"] = 'Hide Ammo',
    ["SHOW_AMMO"] = 'Show Ammo',
    ["SHOW_PHONE_KEY"] = 'Show Phone Key',
    ["HIDE_PHONE_KEY"] = 'Hide Phone Key',
    ["HIDE_INVENTORY_KEY"] = 'Hide Inventory Key',
    ["SHOW_INVENTORY_KEY"] = 'Show Inventory Key',
    ["HIDE_MENU_KEY"] = 'Hide Menu Key',
    ["SHOW_MENU_KEY"] = 'Show Menu Key',
    ["HIDE_MIC_KEY"] = 'Hide Mic Key',
    ["SHOW_MIC_KEY"] = 'Show Mic Key',
    ["SHOW_LOGO"] = 'Show Logo',
    ["HIDE_LOGO"] = 'Hide Logo',
    ["EDIT_PAGE"] = 'Edit Page',
    ["HUD"] = 'HUD',
    ["STYLE_SELECTOR"] = 'Style Selector',
    ["DISABLED"] = 'Not active',






}


-------------------------------------------- Settings hud --------------------------------------------
Config.HelperTextEnable = false  --- true enable --- false disable
Config.HelperText = {
    ['phone'] = 'Phone',['phonepress'] = 'Mysql',
    ['inventory'] = 'Inventory', ['inventorypress'] = 'TAB',
    ['menu'] = 'Menu',['menupress'] = 'F3',
    ['mic'] = 'Mic',['micpress'] = 'N',
}
-------------------------------------------- general text hud --------------------------------------------

Config.ShowMenu = {
    ['showid'] = false,
    ['showonline'] = false,
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
Config.DisableWaterMarkTextAndLogo = false -- true - Disable watermark text and logo 
Config.UseWaterMarkText = true -- if true text will be shown | if  false logo will be shown
Config.WaterMarkText1 = "MYSTERIOUS" -- Top right server text
Config.WaterMarkText2 = "CITY"  -- Top right server text
Config.WaterMarkLogo = "https://cdn.discordapp.com/attachments/987700392521527296/998846149094015026/logo2.png" -- Logo url
Config.LogoWidth = "11.875rem"
Config.LogoHeight = "3.313rem"
Config.OnlinePlayers = false --Determines if display online players or nor
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
Config.NitroKey = "X" -- Default control key for use nitro. Players can change the key according to their desire 

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
    ["hide_hud"] = "Hide Hud",
    ["health"] = "Health",
    ["armor"] = "Armor",
    ["thirst"] = "Thirst",
    ["stress"] = "Stress",
    ["oxy"] = "Oxygen",
    ["hunger"] = "Hunger",
    ["show_hud"] = "Show Hud",
    ["stamina"] = "Stamina",
    ["nitro"] = "Nitro",
    ["Altitude"] = "Altitude",
    ["Parachute"] = "Parachute",
    ["enable_cinematicmode"] = "Cinematic Mode",
    ["disable_cinematicmode"] = "Disable Cinematic",
    ["exit_settings_1"] = "EXIT FROM",
    ["exit_settings_2"] = "SETTINGS",
    ["speedometer"] = "SPEEDOMETER",
    ["map"] = "MAP",
    ["show_compass"] = "Show Compass",
    ["hide_compass"] = "Hide Compass",
    ["rectangle"] = "Rectangle",
    ["radial"] = "Radial",
    ["dynamic"] = "DYNAMiC",
    ["status"] = "STATUS",
    ["enable"] = "Enable",
    ["hud_size"] = "Status size",
    ["disable"] = "Disable",
    ["hide_at"] = "Hide at",
    ["and_above"] = "and above",
    ["and_below"] = "and below",
    ["enable_edit_mode"] = "Drag HUD (One by one)",
    ["enable_edit_mode_2"] = "Drag HUD (All)",
    ["change_status_size"] = "Change status size",
    ["change_color"] = "Change color of selected hud ",
    ["disable_edit_mode"] = "Disable Edit Mode",
    ["reset_hud_positions"] = "Reset Hud Positions",
    ["info_text"] = "Be aware increasing refresh rate may decrease your in game perfomance!",
    ["speedometer_size"] = "Speedometer Size",
    ["refresh_rate"] = "Refresh Rate",
    ["esc_to_exit"] = "PRESS ESC TO EXIT EDIT MODE",
    ["toggle_minimap"] = "Toggle Minimap",
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
        max = 2,
        enable = true,
    },
    ["on_fastdrive"] = {
        min = 1,
        max = 2,
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
        message = 'Getting Stressed',
        type = "error",
    },
    ["stress_relive"] = {
        message =  'You Are Relaxing',
        type = "success",
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "You took off seatbelt.",
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "You took seatbelt.",
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Cruise activated.",
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Cruise disabled.",
    },
    ["spam"] = {
        type = "error",
        message = "Please wait for a few seconds.",
    },
    ["engine_on"] = {
        type = "success",
        message = "Engine is on.",
    },
    ["engine_off"] = {
        type = "success",
        message = "Engine is off.",
    },
    ["cant_install_nitro"] = {
        type = "error",
        message = "You can't install nitro inside vehicle.",
    },
    ["no_veh_nearby"] = {
        type = "error",
        message = "No vehicle nearby.",
    },
    ["cash_display"] = {
        type = "success",
        message = "You have $%s in your pocket.",
    },
    ["bank_display"] = {
        type = "success",
        message = "You have $%s in your bank.",
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




Citizen.CreateThread(function()
    frameworkObject = GetFrameworkObject()
    Config.GetStatus = function()
        Citizen.Wait(100)
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

            Citizen.Wait(7000)
        end
    end

end)

