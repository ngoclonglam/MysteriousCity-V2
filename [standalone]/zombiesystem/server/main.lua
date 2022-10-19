local QBCore = exports['qb-core']:GetCoreObject()

players = {}

RegisterServerEvent("qb-zombie:newplayer")
AddEventHandler("qb-zombie:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("qb-zombie:playerupdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("qb-zombie:clear", source)
    TriggerClientEvent("qb-zombie:playerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("qb-zombie:clear", -1)
end)

RegisterServerEvent('qb-zombie:moneyloot')
AddEventHandler('qb-zombie:moneyloot', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local random = math.random(1, 20)
    xPlayer.addMoney(random)
    TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. random .. ' dolars'))
end)

RegisterServerEvent('qb-zombie:itemloot')
AddEventHandler('qb-zombie:itemloot', function(item)
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
