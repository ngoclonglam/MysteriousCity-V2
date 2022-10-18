local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('qb-bar:client:openTable', function(data)
    TriggerEvent("inventory:client:SetCurrentStash", "table" .. data.key )
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "table" .. data.key, {
        maxweight = 100000,
        slots = 10,
    })
end)

RegisterNetEvent('qb-bar:client:makeAlcohol', function(data)
    QBCore.Functions.TriggerCallback('qb-bar:server:checkItem', function(result)
        if result then
            QBCore.Functions.Progressbar("makeBeer", Lang:t('progress.make_whiskey'), 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                if data.type == "whiskey" then
                    TriggerServerEvent("qb-bar:server:makeWhiskey")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whiskey"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một chai Whiskey', 3000, 'success')
                elseif data.type == "beer" then
                    TriggerServerEvent("qb-bar:server:makeBeer")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beer"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một chai Beer', 3000, 'success')
                end
            end, function()
                QBCore.Functions.Notify("Hủy Bỏ..", "error")
            end)
        else
            exports['okokNotify']:Alert('Quán Bar', 'Bạn không có đủ nguyên liệu', 3000, 'error')
        end
    end, data.type)
end)

RegisterNetEvent('qb-bar:client:makeFood', function(data)
    QBCore.Functions.TriggerCallback('qb-bar:server:checkItem', function(result)
        if result then
            QBCore.Functions.Progressbar("makeFood", Lang:t('progress.make_food'), 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                if data.type == "chicken" then
                    TriggerServerEvent("qb-bar:server:makeChicken")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gaquay"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một dĩa Gà', 3000, 'success')
                elseif data.type == "fruit" then
                    TriggerServerEvent("qb-bar:server:makeFruit")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["traicay"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một dĩa Trái Cây', 3000, 'success')
                elseif data.type == "supvica" then
                    TriggerServerEvent("qb-bar:server:makeViCa")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["supvica"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một tô Súp Vi Cá', 3000, 'success')
                end
            end, function()
                QBCore.Functions.Notify("Hủy Bỏ..", "error")
            end)
        else
            exports['okokNotify']:Alert('Quán Bar', 'Bạn không có đủ nguyên liệu', 3000, 'error')
        end
    end, data.type)
end)

RegisterNetEvent('qb-bar:client:makeSlice', function(data)
    QBCore.Functions.TriggerCallback('qb-bar:server:checkItem', function(result)
        if result then
            QBCore.Functions.Progressbar("makeSlice", Lang:t('progress.make_slice'), 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                if data.type == "slice" then
                    TriggerServerEvent("qb-bar:server:makeSlice")
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vica"], "add")
                    exports['okokNotify']:Alert('Quán Bar', 'Bạn đã làm ra một Vi Cá', 3000, 'success')
                end
            end, function()
                QBCore.Functions.Notify("Hủy Bỏ..", "error")
            end)
        else
            exports['okokNotify']:Alert('Quán Bar', 'Bạn không có đủ nguyên liệu', 3000, 'error')
        end
    end, data.type)
end)

RegisterNetEvent('qb-bar:client:openBar', function()
    local barMenu = {}

    barMenu[#barMenu + 1] = {
        isMenuheader = true,
        header = Lang:t('menu.bar_header'),
        icon = 'fa-solid fa-shop'
    }

    barMenu[#barMenu + 1] = {
        header = Lang:t('menu.bar_whiskey'),
        txt = Lang:t('txt.bar_whiskey'),
        icon = "qb-inventory/html/images/whiskey.png",
        params = {
            event = "qb-bar:client:makeAlcohol",
            args = {
                type = 'whiskey'
            }
        }
    }

    barMenu[#barMenu + 1] = {
        header = Lang:t('menu.bar_beer'),
        txt = Lang:t('txt.bar_beer'),
        icon = "qb-inventory/html/images/beer.png",
        params = {
            event = "qb-bar:client:makeAlcohol",
            args = {
                type = 'beer'
            }
        }
    }

    barMenu[#barMenu + 1] = {
        header = Lang:t('menu.bar_close'),
        icon = 'fa-solid fa-xmark',
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(barMenu)
end)

RegisterNetEvent('qb-bar:client:openFood', function()
    local foodMenu = {}

    foodMenu[#foodMenu + 1] = {
        isMenuheader = true,
        header = Lang:t('food.bar_header'),
        icon = 'fa-solid fa-shop'
    }

    foodMenu[#foodMenu + 1] = {
        header = Lang:t('food.bar_chicken'),
        icon = "qb-inventory/html/images/gaquay.png",
        txt = Lang:t('txt.bar_chicken'),
        params = {
            event = "qb-bar:client:makeFood",
            args = {
                type = 'chicken'
            }
        }
    }

    foodMenu[#foodMenu + 1] = {
        header = Lang:t('food.bar_fruit'),
        icon = "qb-inventory/html/images/traicay.png",
        txt = Lang:t('txt.bar_fruit'),
        params = {
            event = "qb-bar:client:makeFood",
            args = {
                type = 'fruit'
            }
        }
    }

    foodMenu[#foodMenu + 1] = {
        header = Lang:t('food.bar_vica'),
        icon = "qb-inventory/html/images/supvica.png",
        txt = Lang:t('txt.bar_vica'),
        params = {
            event = "qb-bar:client:makeFood",
            args = {
                type = 'supvica'
            }
        }
    }

    foodMenu[#foodMenu + 1] = {
        header = Lang:t('menu.bar_close'),
        icon = 'fa-solid fa-xmark',
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(foodMenu)
end)

RegisterNetEvent('qb-bar:client:openFridge', function()
    TriggerEvent("inventory:client:SetCurrentStash", "MythBar")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "MythBar", {
        maxweight = 3000000,
        slots = 40,
    })
end)

RegisterNetEvent('qb-bar:client:sliceFish', function()
    local sliceMenu = {}

    sliceMenu[#sliceMenu + 1] = {
        isMenuheader = true,
        header = Lang:t('food.bar_header'),
        icon = 'fa-solid fa-shop'
    }

    sliceMenu[#sliceMenu + 1] = {
        header = Lang:t('food.bar_slice'),
        icon = "qb-inventory/html/images/vica.png",
        txt = Lang:t('txt.bar_slice'),
        params = {
            event = "qb-bar:client:makeSlice",
            args = {
                type = 'slice'
            }
        }
    }

    sliceMenu[#sliceMenu + 1] = {
        header = Lang:t('menu.bar_close'),
        icon = 'fa-solid fa-xmark',
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(sliceMenu)
end)

CreateThread(function()
    for k in pairs(Config.Bar["Table"]) do
        exports['qb-target']:AddBoxZone("Table" .. k, Config.Bar["Table"][k]["coords"], 1, 1.2, {
            name = "Table" .. k,
            heading = Config.Bar["Table"][k]["heading"],
            minZ = Config.Bar["Table"][k]["coords"].z - 1,
            maxZ = Config.Bar["Table"][k]["coords"].z + 1,
            debugPoly = false
        },{
            options = {
                {
                    event = "qb-bar:client:openTable",
                    icon  = "fa fa-clipboard",
                    key = k,
                    label = "Bàn Số " .. k,
                },
            },
            distance = 1.5
        })
    end

    for k in pairs(Config.Bar["Craft"]) do
        exports['qb-target']:AddBoxZone("Craft" .. k, Config.Bar["Craft"][k]["coords"], 1, 1.2, {
            name = "Craft" .. k,
            heading = Config.Bar["Craft"][k]["heading"],
            minZ = Config.Bar["Craft"][k]["coords"].z - 1,
            maxZ = Config.Bar["Craft"][k]["coords"].z + 1,
            debugPoly = false
        },{
            options = {
                {
                    event = "qb-bar:client:openBar",
                    icon  = "fa fa-clipboard",
                    key = k,
                    label = "Bàn Chế Rượu Số " .. k,
                    job = 'vu'
                },
            },
            distance = 1.5
        })
    end

    for k in pairs(Config.Bar["Food"]) do
        exports['qb-target']:AddBoxZone("Food" .. k, Config.Bar["Food"][k]["coords"], 1, 1.2, {
            name = "Food" .. k,
            heading = Config.Bar["Food"][k]["heading"],
            minZ = Config.Bar["Food"][k]["coords"].z - 1,
            maxZ = Config.Bar["Food"][k]["coords"].z + 1,
            debugPoly = false
        },{
            options = {
                {
                    event = "qb-bar:client:openFood",
                    icon  = "fa fa-clipboard",
                    key = k,
                    label = "Bàn Làm Đồ Ăn " .. k,
                    job = 'vu'
                },
            },
            distance = 1.5
        })
    end

    for k in pairs(Config.Bar["Fridge"]) do
        exports['qb-target']:AddBoxZone("Fridge" .. k, Config.Bar["Fridge"][k]["coords"], 1, 1.2, {
            name = "Fridge" .. k,
            heading = Config.Bar["Fridge"][k]["heading"],
            minZ = Config.Bar["Fridge"][k]["coords"].z - 1,
            maxZ = Config.Bar["Fridge"][k]["coords"].z + 1,
            debugPoly = false
        },{
            options = {
                {
                    event = "qb-bar:client:openFridge",
                    icon  = "fa fa-clipboard",
                    key = k,
                    label = "Tủ Lạnh " .. k,
                    job = 'vu'
                },
            },
            distance = 1.5
        })
    end

    for k in pairs(Config.Bar["Slice"]) do
        exports['qb-target']:AddBoxZone("Slice" .. k, Config.Bar["Slice"][k]["coords"], 1, 1.2, {
            name = "Slice" .. k,
            heading = Config.Bar["Slice"][k]["heading"],
            minZ = Config.Bar["Slice"][k]["coords"].z - 1,
            maxZ = Config.Bar["Slice"][k]["coords"].z + 1,
            debugPoly = false
        },{
            options = {
                {
                    event = "qb-bar:client:sliceFish",
                    icon  = "fa fa-clipboard",
                    key = k,
                    label = "Làm Vi Cá",
                    job = 'vu'
                },
            },
            distance = 1.5
        })
    end
end)