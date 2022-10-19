local QBCore = exports['qb-core']:GetCoreObject()

players = {}

RegisterServerEvent("esx_zombiesystem:newplayer")
AddEventHandler("esx_zombiesystem:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("esx_zombiesystem:clear", -1)
end)

RegisterServerEvent('esx_zombiesystem:moneyloot')
AddEventHandler('esx_zombiesystem:moneyloot', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local random = math.random(1, 20)
    xPlayer.addMoney(random)
    TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. random .. ' dolars'))
end)

RegisterServerEvent('esx_zombiesystem:itemloot')
AddEventHandler('esx_zombiesystem:itemloot', function(item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local random = math.random(1, 3)
    if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. item))
    else
        xPlayer.showNotification('You cannot pickup that because your inventory is full!')
    end
end)

entitys = {}

RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
	TriggerClientEvent("ZombieSync", -1, entity)
	table.insert(entitys, entity)
end)
