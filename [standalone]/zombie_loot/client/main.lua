local QBCore = exports['qb-core']:GetCoreObject()

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
                            local ammo = math.random(36, 48)
                            print('lucky', lucky)
                            if lucky <= 40 then
                                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                                exports['okokNotify']:Alert('Halloween', 'Bạn đã kiếm được một khẩu súng lục', 3000, 'success')
                            end
                            TriggerServerEvent("zombie_loot:server:lootItem", 'epic')
                            print('entity', entity)
                            ClearPedSecondaryTask(PlayerPedId())
                            local model = GetEntityModel(entity)
                            SetEntityAsNoLongerNeeded(model)
                            SetModelAsNoLongerNeeded(entity)
                            DeleteEntity(model)
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
                            print('lucky', lucky)
                            if lucky <= 20 then
                                GiveWeaponToPed(PlayerPedId(), 'weapon_pistol', ammo, true, true)
                                exports['okokNotify']:Alert('Halloween', 'Bạn đã kiếm được một khẩu súng lục', 3000, 'success')
                            end
                            TriggerServerEvent("zombie_loot:server:lootItem", 'normal')
                            ClearPedSecondaryTask(PlayerPedId())
                            print('entity', entity)
                            local model = GetEntityModel(entity)
                            SetEntityAsNoLongerNeeded(model)
                            SetModelAsNoLongerNeeded(entity)
                            DeleteEntity(model)
                        end, function() -- Cancel
                            QBCore.Functions.Notifsy("Hủy bỏ", "error")
                        end)
                    end
                end,
            },
        },
        distance = 2.5,
    })
end)