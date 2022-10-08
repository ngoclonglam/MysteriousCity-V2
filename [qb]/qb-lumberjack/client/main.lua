local QBCore = exports['qb-core']:GetCoreObject()
local chopping = false
local tree = 0
local onDuty = false

RegisterNetEvent('tr-lumberjack:getLumberStage', function(stage, state, k)
    Config.TreeLocations[k][stage] = state
end)

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(3)
    end
end

local function axe()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, v in pairs(Config.Axe) do
        if pedWeapon == k then
            return true
        end
    end
    QBCore.Functions.Notify(Config.Alerts["error_axe"], 'error')
end

local function ChopLumber(k)
    local animDict = "melee@hatchet@streamed_core"
    local animName = "plyr_rear_takedown_b"
    local trClassic = PlayerPedId()
    local choptime = LumberJob.ChoppingTreeTimer
    chopping = true
    FreezeEntityPosition(trClassic, true)
    QBCore.Functions.TriggerCallback('tr-lumberjack:recivelumber', function(lumber)
        if lumber then
            QBCore.Functions.Progressbar("Chopping_Tree", Config.Alerts["chopping_tree"], lumber * choptime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent('tr-lumberjack:setLumberStage', "isChopped", true, k)
                TriggerServerEvent('tr-lumberjack:setLumberStage', "isOccupied", false, k)
                TriggerServerEvent('tr-lumberjack:recivelumber', lumber)
                TriggerServerEvent('tr-lumberjack:setChoppedTimer')
                -- TriggerEvent('weapons:server:decreaseQuality', lumber * 0.5)
                chopping = false
                TaskPlayAnim(trClassic, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                FreezeEntityPosition(trClassic, false)
            end, function()
                ClearPedTasks(trClassic)
                TriggerServerEvent('tr-lumberjack:setLumberStage', "isOccupied", false, k)
                chopping = false
                TaskPlayAnim(trClassic, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
                FreezeEntityPosition(trClassic, false)
            end)
        end
    end)
    TriggerServerEvent('tr-lumberjack:setLumberStage', "isOccupied", true, k)
    CreateThread(function()
        while chopping do
            loadAnimDict(animDict)
            TaskPlayAnim(trClassic, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Wait(3000)
        end
    end)
end

RegisterNetEvent('tr-lumberjack:StartChopping', function()
    if tree > 0 and not Config.TreeLocations[tree]["isChopped"] then
        if axe() then
            ChopLumber(tree)
        end
    end
end)

CreateThread(function()
    local header = false
    local inRange = false
    -- TODO: There's improvement that we can use Polyzone istead of while loop
    while true do 
        local sleep = 2000
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.TreeLocations) do
            if not v["isChopped"] and not v["isOccupied"] and #(pos - vector3(v.coords.x, v.coords.y, v.coords.z)) <= 10 then
                sleep = 5
                DrawMarker(2, v.coords.x - 1, v.coords.y + 1, v.coords.z - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if #(pos - vector3(v.coords.x, v.coords.y, v.coords.z)) <= 2 then
                    inRange = true
                    tree = k
                    Wait(1000)
                else
                    inRange = false
                end
            end
        end

        if Config.UseTarget then
            goto next
        end

        if inRange then
            if not header then 
                header = true
                exports['qb-menu']:showHeader({
                    {
                        header = 'Chặt Gỗ',
                        params = {
                            event = 'tr-lumberjack:StartChopping',
                        }
                    }
                })
            end
        else
            if header then
                header = false
                exports['qb-menu']:closeMenu()
            end
        end
        ::next::
        Wait(sleep)
    end
end)

CreateThread(function()
    if Config.UseTarget then
        for k, v in pairs(Config.TreeLocations) do
            exports["qb-target"]:AddBoxZone("trees" .. k, v.coords, 3, 3, {
                    name = "trees" .. k,
                    heading = 40,
                    minZ = v.coords["z"] - 3,
                    maxZ = v.coords["z"] + 3,
                    debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            if axe() then
                                ChopLumber(k)
                            end
                        end,
                        type = "client",
                        event = "tr-lumberjack:StartChopping",
                        icon = "fa fa-hand",
                        label = Config.Alerts["Tree_label"],
                        canInteract = function()
                            if not onDuty or v["isChopped"] or v["isOccupied"] then
                                return false
                            end
                            return true
                        end,
                    }
                },
                distance = 1.0
            })
        end
    end
end)

exports['qb-target']:AddBoxZone("lumberjackdepo", LumberDepo.targetZone, 1, 1, {
    name = "Lumberjackdepo",
    heading = LumberDepo.targetHeading,
    debugPoly = false,
    minZ = LumberDepo.targetZone.z - 2,
    maxZ = LumberDepo.targetZone.z + 2,
}, {
    options = {
    {
        type = "client",
        event = "tr-lumberjack:bossmenu",
        icon = "Fas Fa-hands",
        label = Config.Alerts["depo_label"],
    },
    },
    distance = 1.0
})

exports['qb-target']:AddBoxZone("LumberSeller", LumberSeller.targetZone, 1, 1, {
    name = "LumberProcessor",
    heading = LumberSeller.targetHeading,
    debugPoly = false,
    minZ = LumberSeller.targetZone.z - 2,
    maxZ = LumberSeller.targetZone.z + 2,
}, {
    options = {
    {
        type = "server",
        event = "tr-lumberjack:sellItems",
        icon = "fa fa-usd",
        label = Config.Alerts["Lumber_Seller"],
    },
    },
    distance = 1.0
})

RegisterNetEvent('tr-lumberjack:vehicle', function()
    local vehicle = LumberDepo.Vehicle
    local coords = LumberDepo.VehicleCoords
    local TR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(JobVehicle,  true)
        SetEntityAsMissionEntity(JobVehicle,  true,  true)
        exports['ps-fuel']:SetFuel(JobVehicle, 100.0)
        local id = NetworkGetNetworkIdFromEntity(JobVehicle)
        DoScreenFadeOut(1500)
        Wait(1500)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(JobVehicle))
        DoScreenFadeIn(1500)
        Wait(2000)
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Config.Alerts["phone_sender"],
            subject = Config.Alerts["phone_subject"],
            message = Config.Alerts["phone_message"],
        })
    else
        QBCore.Functions.Notify(Config.Alerts["depo_blocked"], "error")
    end
end)

RegisterNetEvent('tr-lumberjack:removevehicle', function()
    local TR92 = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(TR92,true)
    DeleteVehicle(vehicle)
    QBCore.Functions.Notify(Config.Alerts["depo_stored"])
end)

RegisterNetEvent('tr-lumberjack:getaxe', function()
    TriggerServerEvent('tr-lumberjack:BuyAxe')
end)

RegisterNetEvent('tr-lumberjack:bossmenu', function()
    local dutyLbl = Config.Alerts["on_duty_label"]
    local dutyTxt = Config.Alerts["on_duty_text"]
    if onDuty then
        dutyLbl = Config.Alerts["off_duty_label"]
        dutyTxt = Config.Alerts["off_duty_text"]
    end
    local menu = {
        {
            icon = "fa-solid fa-comment",
            header = Config.Alerts["depo_label"],
            isMenuHeader = true,
        },
        {
            header = dutyLbl,
            txt = dutyTxt,
            icon = "fa-solid fa-briefcase",
            params = {
                event = 'QBCore:Client:On2ndJobUpdate',
                args = 'lumberjack'
            }
        },
        {
            header = Config.Alerts["lumber_header"],
            txt = Config.Alerts["lumber_text"],
            icon = "fa-solid fa-arrow-right-arrow-left",
            params = {
                event = 'tr-lumberjack:processor',
            }
        },
        {
            header = Config.Alerts["goback"],
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

local function processLumber(lumber)
    TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
    QBCore.Functions.Progressbar('lumber_trader', Config.Alerts['lumber_progressbar'], LumberJob.ProcessingTime * lumber, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("tr-lumberjack:lumberprocessed", lumber)
    end, function() 
    QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
end

RegisterNetEvent('tr-lumberjack:processor', function()
    QBCore.Functions.TriggerCallback('tr-lumberjack:lumber', function(lumber)
        if Config.UseMiniGame and lumber then
            local ped = PlayerPedId()
            local skillbar = exports['qb-skillbar']:GetSkillbarObject()
            local succeededAttempts = 0
            local neededAttempts = math.random(1, lumber - LumberJob.TradeAmount_Min + 1)
            -- Animation here
            FreezeEntityPosition(ped, true)
            skillbar.Start({
                duration = math.random(3000, 4500),
                pos = math.random(10, 30),
                width = math.random(10, 20),
            }, function()
                if succeededAttempts + 1 >= neededAttempts then
                    ClearPedTasks(PlayerPedId())
                    FreezeEntityPosition(ped, false)
                    processLumber(lumber)
                    succeededAttempts = 0
                else
                    skillbar.Repeat({
                        duration = math.random(700, 1250),
                        pos = math.random(10, 40),
                        width = math.random(10, 13),
                    })
                    succeededAttempts = succeededAttempts + 1
                end
            end, function()
                ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify("Hủy Bỏ", "error", 3500)
                succeededAttempts = 0
                FreezeEntityPosition(ped, false)
            end)
        elseif lumber then
            processLumber(lumber)
        elseif not lumber then
            QBCore.Functions.Notify(Config.Alerts['error_lumber'], "error", 3000)
        end
    end)
end)

RegisterNetEvent('QBCore:Client:On2ndJobUpdate', function(JobInfo)
    if JobInfo == "lumberjack" then
        onDuty = not onDuty
        Config.UseBlips = onDuty
    else
        Config.UseBlips = false
    end
    ToogleBlips()
end)