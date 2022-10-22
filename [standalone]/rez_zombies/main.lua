local QBCore = exports['qb-core']:GetCoreObject()
local pumpkins = {}

local function spawnObj(prop, coords)

end

local function loadPumpkin()
    for _, v in pairs(Config.Pumpkins) do
        pumpkins[#pumpkins+1] = spawnObj(Config.prop, v.coords)
    end
end

local function searchEpic(model)
    if IsEntityDead(model) then
        QBCore.Functions.Progressbar('search_Epic', 'Tìm kiếm đồ', 3000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
          }, {
            animDict = 'random@domestic',
            animName = 'pickup_low',
            flags = 16
          }, {}, {}, function()
            -- Done
            local lucky = math.random(1, 100)
            local ammo = math.random(36, 72)
            ClearPedSecondaryTask(PlayerPedId())
            local entity = GetEntityModel(model)
            SetEntityAsNoLongerNeeded(entity)
            SetModelAsNoLongerNeeded(model)
            DeleteEntity(entity)
            if lucky <= 20 then
                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                exports['okokNotify']:Alert('Halloween', 'Bạn đã lấy được một cây súng lục', 3000, 'success')
            end
            TriggerServerEvent('rez_zombies:server:lootItem', 'Epic')
        end)
    end
end

local function searchItem(entity)
    if IsEntityDead(entity) then
        QBCore.Functions.Progressbar('search_Item', 'Tìm kiếm đồ', 3000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
          }, {
            animDict = 'random@domestic',
            animName = 'pickup_low',
            flags = 16
          }, {}, {}, function()
            -- Done
            local lucky = math.random(1, 100)
            local ammo = math.random(24, 48)
            ClearPedSecondaryTask(PlayerPedId())
            local model = GetEntityModel(entity)
            SetEntityAsNoLongerNeeded(model)
            SetModelAsNoLongerNeeded(entity)
            DeleteEntity(model)
            if lucky <= 40 then
                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                exports['okokNotify']:Alert('Halloween', 'Bạn đã lấy được một cây súng lục', 3000, 'success')
            end
            TriggerServerEvent('rez_zombies:server:lootItem', 'normal')
        end)
    end
end

CreateThread(function()
    print('check')
    exports['qb-target']:AddTargetModel(Config.MutantModels, {
        options = {
            {
                icon = "fas fa-sack-dollar",
                label = "Kiếm đồ",
                action = function(entity)
                    searchEpic(entity)
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
                    searchItem(entity)
                end,
            },
        },
        distance = 2.5,
    })
end)