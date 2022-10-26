local QBCore = exports['qb-core']:GetCoreObject()
local pumpkins = {}

-- CLIENT
CreateThread(function()
    while true do
        local pedPool = GetGamePool('CPed')
        for _, v in pairs(pedPool) do
            local entity = GetEntityModel(v)
            local deadPeds = {}
            print('entity', entity)
            -- if IsEntityDead(entity) then
                deadPeds[#deadPeds+1] = entity
            -- end
            TriggerServerEvent("deleteEntitiesAcrossClients", deadPeds)
        end
        Wait(45000)
    end
end)


RegisterNetEvent('deleteEntitiesFromServer', function(entities)
    for _, entity in pairs(entities) do
        SetEntityAsNoLongerNeeded(entity)
        DeleteEntity(entity)
    end
end)

RegisterNetEvent('zombie_loot:client:lootItem', function(data)
    -- local debug = true
    -- if debug then return QBCore.Functions.Notify('Bí ngô đang bảo trì', 'error') end
    QBCore.Functions.Progressbar("loot_item", 'Tìm kiếm đồ..', 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {
        animDict = "random@domestic",
        anim = "pickup_low",
        flags = 16
    }, {}, {}, function() -- Done
        local lucky = math.random(1, 100)
        local ammo = math.random(30, 40)
        if lucky <= 10 then
            TriggerEvent('weapons:client:SetCurrentWeapon', nil, true)
            GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
            exports['okokNotify']:Alert('Halloween', 'Bạn đã kiếm được một khẩu súng lục', 3000, 'success')
        end
        TriggerServerEvent("zombie_loot:server:lootItem", 'pumpkin')
        ClearPedSecondaryTask(PlayerPedId())
        DeleteObject(data.pumpkin)
        for k, v in pairs(pumpkins) do
            if v == data.pumpkin then
                DeleteObject(v)
                table.remove(pumpkins, k)
                break
            end
        end
    end, function() -- Cancel
        QBCore.Functions.Notify("Hủy bỏ", "error")
    end)
end)

local function spawnObj(model, coords, heading)
    local modelHash = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
    end

    local object = CreateObject(modelHash, coords.x, coords.y, coords.z - 1, false, false, false)
    while not DoesEntityExist(object) do
        Wait(10)
    end

    PlaceObjectOnGroundProperly(object)
    SetEntityAsMissionEntity(object, true, true)
    FreezeEntityPosition(object, true)
    SetEntityHeading(object, heading)


    exports['qb-target']:AddTargetEntity(object, {
        options = {
            {
                event = 'zombie_loot:client:lootItem',
                pumpkin = object,
                icon = "fa-solid fa-hammer",
                label = "Lụm bí ngô",
            }
        },
        distance = 1.5
   })

   return object
end

local function loadPumpkin()
    for _, v in pairs(Config.Pumpkin) do
        pumpkins[#pumpkins+1] = spawnObj(Config.Prop, v.coords, v.heading)
    end
end

CreateThread(function()
    loadPumpkin()
    Wait(60000 * 60)
    for _, prop in pairs(pumpkins) do
        DeleteObject(prop)
        Wait(500)
    end
    pumpkins = {}
    Wait(5000)
    loadPumpkin()
end)

CreateThread(function()
    for _, v in pairs(Config.Blip) do
        local blip = AddBlipForRadius(v.coords, v.radius)
        SetBlipHighDetail(blip, true)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, 128)
        SetBlipAsShortRange(blip, true)
    end

    for _, v in pairs(Config.Blip) do
        local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite(blip, 84)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Vùng Nguy Hiểm")
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.MutantModels, {
        options = {
            {
                icon = "fas fa-sack-dollar",
                label = "Kiếm đồ",
                action = function(entity)
                    if IsEntityDead(entity) then
                        QBCore.Functions.Progressbar("loot_item", 'Tìm kiếm đồ..', 3000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = true,
                            disableCombat = true,
                        }, {
                            animDict = "random@domestic",
                            animName = "pickup_low",
                            flags = 16
                        }, {}, {}, function() -- Done
                            local lucky = math.random(1, 100)
                            local ammo = math.random(20, 30)
                            if lucky <= 40 then
                                TriggerEvent('weapons:client:SetCurrentWeapon', nil, true)
                                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                                exports['okokNotify']:Alert('Halloween', 'Bạn đã kiếm được một khẩu súng lục', 3000, 'success')
                            end
                            TriggerServerEvent("zombie_loot:server:lootItem", 'epic')
                            ClearPedSecondaryTask(PlayerPedId())
                            SetEntityAsNoLongerNeeded(entity)
                            DeleteEntity(entity)
                        end, function() -- Cancel
                            QBCore.Functions.Notify("Hủy bỏ", "error")
                        end)
                    end
                end,
            },
        },
        distance = 2.5,
    })

    exports['qb-target']:AddTargetModel(Config.PedModels, {
        options = {
            {
                icon = "fas fa-sack-dollar",
                label = "Kiếm đồ",
                action = function(entity)
                    if IsEntityDead(entity) then
                        QBCore.Functions.Progressbar("loot_item", 'Tìm kiếm đồ..', 3000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = true,
                            disableCombat = true,
                        }, {
                            animDict = "random@domestic",
                            anim = "pickup_low",
                            flags = 16
                        }, {}, {}, function() -- Done
                            local lucky = math.random(1, 100)
                            local ammo = math.random(12, 24)
                            if lucky <= 20 then
                                TriggerEvent('weapons:client:SetCurrentWeapon', nil, true)
                                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                                exports['okokNotify']:Alert('Halloween', 'Bạn đã kiếm được một khẩu súng lục', 3000, 'success')
                            end
                            TriggerServerEvent("zombie_loot:server:lootItem", 'normal')
                            ClearPedSecondaryTask(PlayerPedId())
                            SetEntityAsNoLongerNeeded(entity)
                            DeleteEntity(entity)
                        end, function() -- Cancel
                            QBCore.Functions.Notify("Hủy bỏ", "error")
                        end)
                    end
                end,
            },
        },
        distance = 2.5,
    })
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, prop in pairs(pumpkins) do
            DeleteObject(prop)
        end
    end
end)