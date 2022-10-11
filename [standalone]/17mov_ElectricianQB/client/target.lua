function SpawnStartingPed()
    local model = `a_m_m_indian_01`
    RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
    spawnedPed = CreatePed(0, model, Config.Locations.DutyToggle.Coords[1].x, Config.Locations.DutyToggle.Coords[1].y, Config.Locations.DutyToggle.Coords[1].z - 1.0, 152.16, false, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetEntityInvincible(spawnedPed, true)
    exports["qb-target"]:AddTargetEntity(spawnedPed, {
        options = {
            {
                event = "multiplayerElectro:OpenMainMenu",
                icon = "fa-solid fa-handshake-simple",
                label = "Start Job",
                -- job = "RequiredJob",
                canInteract = function(entity)
                    return #(GetEntityCoords(PlayerPedId()) - vec3(Config.Locations.DutyToggle.Coords[1].x, Config.Locations.DutyToggle.Coords[1].y, Config.Locations.DutyToggle.Coords[1].z)) < 5.0
                end
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent("multiplayerElectro:OpenMainMenu", function()
    OpenDutyMenu()
end)

function AddBoxZoneToTaget(coords, label, _clientType, _difficulty)
    exports["qb-target"]:AddBoxZone("multiplayerElectro:Interaction", coords, 1.0, 1.0, 
    {
        name = "multiplayerElectro:Interaction",
        heading = 0.0,
        debugPoly = false,
        minZ = coords.z - 2.5,
        maxZ = coords.z + 1.5,
    }, {
        options = {
            {
                event = "multiplayerElectro:Interact",
                icon = "fa-solid fa-screwdriver-wrench",
                label = label,
                clientType = _clientType,
                difficulty = _difficulty
                -- job = "RequiredJob",
            },
        },
        distance = 2.5
    })
end


RegisterNetEvent("multiplayerElectro:Interact", function(data)
    Interaction(data.clientType, data.difficulty)
end)

function DeleteBoxZone()
    exports["qb-target"]:RemoveZone("multiplayerElectro:Interaction")
end