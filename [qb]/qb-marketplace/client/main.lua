local QBCore = exports['qb-core']:GetCoreObject()

local mKeys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Util functions

function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end

-- Local functions

local function createPeds(value, key)
    CreateThread(function ()
        if exports['ms-peds'] and Config.UsePed then
            local ped = value.ped

            exports['ms-peds']:RegisterPed(ped)

            exports['qb-target']:AddBoxZone("ScrapShop"..key, ped.coords, 1, 1, {
                name = "ScrapShop"..key,
                heading = ped.coords.heading,
                debugPoly = false,
                minZ = ped.coords.z - 2,
                maxZ = ped.coords.z + 2,
            }, {
                options = {
                    {
                    type = "client",
                    event = "qb-marketplace:client:bossMenu",
                    icon = "Fas Fa-hands",
                    label = Lang:t('target.boss'),
                    },
                },
                distance = 1.0
            })
        else
            exports['qb-target']:AddBoxZone('ScrapShop'..key, value.coords, value.length, value.width, {
                name = 'ScrapShop'..key,
                heading = value.coords.heading,
                minZ = value.coords.z - 2,
                maxZ = value.coords.z + 2,
                debugPoly = value.debugPoly,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'qb-marketplace:client:bossMenu',
                        icon = 'fas fa-ring',
                        label = 'Pawn Shop',
                    },
                },
                distance = value.distance
            })
        end
    end)
end

local function createMarkers(value)
    CreateThread( function ()
        local coords = value.coords
        while true do
            Wait(1)
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, coords.x, coords.y, coords.z)
            if dist <= 20.0 then
                DrawMarker(27, coords.x, coords.y, coords.z-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
            else
                Wait(1500)
            end

            if dist <= 2.5 then
                if Config.UseTarget then
                    DrawText3D2(coords.x, coords.y, coords.z, "~g~[Alt]~w~ Để mở Shop")
                else
                    DrawText3D2(coords.x, coords.y, coords.z, "~g~[E]~w~ Để mở Shop")
                end
            end
        end
    end)
end

-- Core Functions

CreateThread(function()
    for _, value in pairs(Config.ShopLocation) do
        if value.showBlip then
            local blip = AddBlipForCoord(value.coords.x, value.coords.y, value.coords.z)
            SetBlipSprite(blip, 431)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.7)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, 5)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Lang:t('info.title'))
            EndTextCommandSetBlipName(blip)
        end
    end
end)

CreateThread(function()
    if not Config.UsePed or not Config.UseTarget then
        for _, value in pairs(Config.ShopLocation) do
            createMarkers(value)
        end
    end

    if Config.UseTarget then
        for key, value in pairs(Config.ShopLocation) do
            createPeds(value, key)
        end
    else
        local zone = {}
        for key, value in pairs(Config.ShopLocation) do
            zone[#zone+1] = BoxZone:Create(value.coords, value.length, value.width, {
                name = 'PawnShop'..key,
                heading = value.coords.heading,
                minZ = value.coords.z - 2,
                maxZ = value.coords.z + 2,
            })
        end
        local pawnShopCombo = ComboZone:Create( zone, { name = 'NewPawnShopCombo', debugPoly = false })
        local isInsideZone = false
        pawnShopCombo:onPlayerInOut(function(isPointInside)
            isInsideZone = isPointInside
            if isInsideZone then
                CreateThread(function ()
                    repeat
                        Wait(1)
                        if IsControlJustPressed(0, mKeys['E']) then -- "E"
                            TriggerEvent('qb-marketplace:client:bossMenu')
                        end
                    until not isInsideZone
                end)
            end
        end)
    end
end)

RegisterNetEvent('qb-marketplace:client:bossMenu', function()
    if Config.UseTimes then
        if GetClockHours() < Config.TimeOpen or GetClockHours() > Config.TimeClosed then
            QBCore.Functions.Notify(Lang:t('info.market_closed', { value = Config.TimeOpen, value2 = Config.TimeClosed }))
            return
        end
    end
    local menu = {}
    -- Header
    menu[#menu+1] = {
        header = Lang:t('info.title'),
        isMenuHeader = true,
    }
    -- Body
    for _, shop in pairs(Config.Shops) do
        menu[#menu+1] = {
            header = Lang:t('info.shop', { value = shop.label }),
            icon = shop.icon,
            params = {
                event = 'qb-marketplace:client:openShop',
                args = {
                    shop = shop,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('qb-marketplace:client:openShop', function(data)
    local shop = data.shop
    local sellTxt = Lang:t('info.sell_shop', { value = shop.label })
    local buyTxt = Lang:t('info.buy_shop', { value = shop.label })
    local sellIcon = "fa-solid fa-hand-holding-dollar"
    local buyIcon = "fa-solid fa-basket-shopping"
    local menu = {
        {
            icon = shop.icon,
            header = shop.label,
            isMenuHeader = true,
        },
        {
            icon = sellIcon,
            header = Lang:t('info.sell'),
            txt = sellTxt,
            params = {
                event = 'qb-marketplace:client:openSell',
                args = {
                    items = shop.items,
                    txt = sellTxt,
                    icon = sellIcon,
                    name = shop.name,
                }
            }
        },
        {
            icon = buyIcon,
            header = Lang:t('info.buy'),
            txt = buyTxt,
            params = {
                event = 'qb-marketplace:client:openBuy',
                args = {
                    items = shop.items,
                    label = shop.label,
                    name = shop.name,
                }
            }
        }
    }
    menu[#menu + 1] = {
        header = Lang:t('info.back'),
        params = {
            event = 'qb-marketplace:client:bossMenu'
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('qb-marketplace:client:openSell', function(shop)
    shop = shop or {}
    QBCore.Functions.TriggerCallback('qb-marketplace:server:getInv', function(inventory)
        local PlyInv = inventory
        local menu = {
            {
                icon = shop.icon,
                header = shop.txt,
                isMenuHeader = true,
            }
        }
        for _, v in pairs(PlyInv) do
            for _, item in pairs(shop.items) do
                if v.name == item.name then
                    item.info = item.info or {}
                    local quality = item.info.quality or 100
                    menu[#menu + 1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = Lang:t('info.sell_items', { price = item.price, quality = quality }),
                        params = {
                            event = 'qb-marketplace:client:sellitems',
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                price = item.price,
                                shop = shop.name,
                                name = v.name,
                                amount = v.amount
                            }
                        }
                    }
                end
            end
        end
        menu[#menu + 1] = {
            header = Lang:t('info.back'),
            params = {
                event = 'qb-marketplace:client:bossMenu'
            }
        }
        exports['qb-menu']:openMenu(menu)
    end)
end)

RegisterNetEvent('qb-marketplace:client:sellitems', function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = Lang:t('info.title'),
        submitText = Lang:t('info.sell'),
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = Lang:t('info.max', { value = item.amount })
            }
        }
    })
    if sellingItem then
        if not sellingItem.amount then
            return
        end

        if tonumber(sellingItem.amount) > 0 then
            TriggerServerEvent('qb-marketplace:server:sellItems', item.shop, item.name, sellingItem.amount, item.price)
        else
            QBCore.Functions.Notify(Lang:t('error.negative'), 'error')
        end
    end
end)

RegisterNetEvent('qb-marketplace:client:openBuy', function(shop)
    shop = shop or {}
    QBCore.Functions.TriggerCallback('qb-marketplace:server:getAvailItems', function(items)
        if items then
            local ShopItems = {}
            ShopItems.items = items
            ShopItems.label = shop.label
            for k in pairs(ShopItems.items) do
                ShopItems.items[k].slot = k
            end
            ShopItems.slots = 30
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_" .. shop.name, ShopItems)
        end
    end, shop.name)
end)

-- Events
RegisterNetEvent("qb-shops:client:UpdateShop", function(shop, itemData, amount)
    -- Only trigger server event if shop defined
    if Config.Shops[shop] then
        TriggerServerEvent("qb-marketplace:server:UpdateShopItems", shop, itemData, amount)
    end
end)