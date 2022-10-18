local QBCore = exports['qb-core']:GetCoreObject()
local calon = ''

QBCore.Functions.CreateCallback('qb-bar:server:checkItem', function(source, cb, type)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if type == "whiskey" then
        for _, v in pairs(Config.Item['whiskey']) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item and item.amount >= 40 then
                cb(true)
            else
                cb(false)
            end
        end
    elseif type == "beer" then
        for _, v in pairs(Config.Item['beer']) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item and item.amount >= 20 then
                cb(true)
            else
                cb(false)
            end
        end
    elseif type == "chicken" then
        for _, v in pairs(Config.Item['chicken']) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item and item.amount >= 1 then
                cb(true)
            else
                cb(false)
            end
        end
    elseif type == "fruit" then
        for _, v in pairs(Config.Item['fruit']) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item and item.amount >= 2 then
                cb(true)
            else
                cb(false)
            end
        end
    -- elseif type == "slice" then
    --     local have = false
    --     for _, v in pairs(Config.Item['slice']) do
    --         local item = xPlayer.Functions.GetItemByName(v)
    --         if item and v == 'killerwhalemeat' then
    --             calon = 'killerwhalemeat'
    --             have = true
    --         elseif item and v == 'tigersharkmeat' then
    --             calon = 'tigersharkmeat'
    --             have = true
    --         elseif item and v == 'stingraymeat' then
    --             calon = 'stingraymeat'
    --             have = true
    --         end
    --     end
        
    --     if have then print ('yes') cb(true) else print('false') cb(false) end
    elseif type == "slice" then
        for _, v in pairs(Config.Item['slice']) do
            
        end
    elseif type == "supvica" then
        local package = xPlayer.Functions.GetItemByName('packaged_chicken')

        if not package then return cb(false) end

        for _, v in pairs(Config.Item['supvica']) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item and item.amount >= 1 then
                cb(true)
            else
                cb(false)
            end
        end
    end
end)

RegisterNetEvent('qb-bar:server:makeViCa', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('vica', 1)
    Player.Functions.RemoveItem('packaged_chicken', 1)
    Player.Functions.AddItem('supvica', 1)
end)

RegisterNetEvent('qb-bar:server:makeSlice', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem(calon, 1)
    Player.Functions.AddItem('vica', 1)
end)

RegisterNetEvent('qb-bar:server:makeWhiskey', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('wheat', 40)
    Player.Functions.RemoveItem('coffeee', 40)
    Player.Functions.RemoveItem('orange', 40)
    Player.Functions.AddItem('whiskey', 5)
end)

RegisterNetEvent('qb-bar:server:makeBeer', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('wheat', 20)
    Player.Functions.RemoveItem('bean', 20)
    Player.Functions.RemoveItem('cherry', 20)
    Player.Functions.AddItem('beer', 5)
end)

RegisterNetEvent('qb-bar:server:makeChicken', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('packaged_chicken', 1)
    Player.Functions.AddItem('gaquay', 1)
end)

RegisterNetEvent('qb-bar:server:makeFruit', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('cherry', 2)
    Player.Functions.RemoveItem('orange', 8)
    Player.Functions.AddItem('traicay', 1)
end)