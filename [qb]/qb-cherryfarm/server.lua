-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("hell_cherryfarmer:sell", function()
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local coords = GetEntityCoords(GetPlayerPed(_source))
    local dist = #(coords - vector3(-58.21, 6522.49, 31.49))
    local item = xPlayer.Functions.GetItemByName('cherry')
    local money = 70
    local reason = "Cheat bán Cherry"
    if dist >= 10 then
        TriggerEvent("qb-log:server:CreateLog", "anticheat", "Anti-Cheat", "white", "Ban **" .. xPlayer.PlayerData.charinfo.lastname .. xPlayer.PlayerData.charinfo.firstname .. "** \n Lý do: **" .. reason .. "** \nDiscord: ** <@".. discord .. "> **", false)
        DropPlayer(_source, 'Phát hiện cheat')
    end
    if item then
        xPlayer.Functions.AddMoney('cash', money * item.amount, 'Bán cherry')
        xPlayer.Functions.RemoveItem('cherry', item.amount)
        TriggerClientEvent('okokNotify:Alert', _source, 'Bán Cherry', 'Bạn đã bán các quả cherry và nhận được $' .. money * item.amount, 5000, 'success')
    else
        TriggerClientEvent('okokNotify:Alert', _source, 'Bán Cherry', 'Bạn không có quả cherry để bán', 5000, 'error')
    end
    
end)

RegisterNetEvent('hell_cherryfarmer:rentCar', function(type, price, money)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local dist = #(vector3(-2173.88, 4282.2, 49.12) - GetEntityCoords(GetPlayerPed(source)))
    local reason = 'Cheat thuê xe cherry'
    if dist >= 10 then
        TriggerEvent("qb-log:server:CreateLog", "anticheat", "Anti-Cheat", "white", "Ban **" .. xPlayer.PlayerData.charinfo.lastname .. xPlayer.PlayerData.charinfo.firstname .. "** \n Lý do: **" .. reason .. "** \nDiscord: ** <@".. discord .. "> **", false)
        DropPlayer(source, 'Phát hiện cheat')
    end
    if money == 'remove' then
        xPlayer.Functions.RemoveMoney(type, price, 'Thuê xe Cherry')
        TriggerClientEvent('okokNotify:Alert', source, 'Thuê Xe', 'Bạn đã thuê xe và cọc $' .. price, 5000, 'success')
    elseif money == 'add' then
        xPlayer.Functions.AddMoney(type, price, 'Lấy tiền thuê xe Cherry')
        TriggerClientEvent('okokNotify:Alert', source, 'Thuê Xe', 'Bạn đã trả lại xe và nhận được $' .. price, 5000, 'success')
    else
        return QBCore.Functions.Notify('Có lỗi gì đó đã xảy ra', 'error')
    end
end)

RegisterNetEvent('hell_cherryfarmer:washReward', function(amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local dist = #(vector3(94.03, 6355.89, 31.38) - GetEntityCoords(GetPlayerPed(source)))
    local reason = "Cheat rửa Cherry"
    if dist >= 10 then
        TriggerEvent("qb-log:server:CreateLog", "anticheat", "Anti-Cheat", "white", "Ban **" .. xPlayer.PlayerData.charinfo.lastname .. xPlayer.PlayerData.charinfo.firstname .. "** \n Lý do: **" .. reason .. "** \nDiscord: ** <@".. discord .. "> **", false)
        DropPlayer(source, 'Phát hiện cheat')
    end

    if xPlayer.Functions.RemoveItem('w_cherry', amount) then
        xPlayer.Functions.AddItem('cherry', amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cherry'], "add")
    elseif xPlayer.Functions.RemoveItem('w_cherry', 1) then
        xPlayer.Functions.AddItem('cherry', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cherry'], "add")
    end

end)

RegisterNetEvent('hell_cherryfarmer:itemReward', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local dist = #(vector3(306.9, 6517.72, 29.41) - GetEntityCoords(GetPlayerPed(source)))
    if dist >= 120 then return DropPlayer(source, 'Phát hiện cheat') end
    xPlayer.Functions.AddItem('w_cherry', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['w_cherry'], "add")

end)