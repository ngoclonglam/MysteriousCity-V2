local QBCore = exports['qb-core']:GetCoreObject()
local seatsTaken = {}

RegisterNetEvent('tr-sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('tr-sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

QBCore.Functions.CreateCallback('tr-sit:getPlace', function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)
