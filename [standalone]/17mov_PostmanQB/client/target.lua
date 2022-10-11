function SpawnStartingPed()
    local model = `a_m_m_golfer_01`
    RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
    spawnedPed = CreatePed(0, model, Config.Locations.DutyToggle.Coords[1].x, Config.Locations.DutyToggle.Coords[1].y, Config.Locations.DutyToggle.Coords[1].z - 1.0, 337.5, false, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetEntityInvincible(spawnedPed, true)
    exports["qb-target"]:AddTargetEntity(spawnedPed, {
        options = {
            {
                event = "multiplayerpostman:OpenMainMenu",
                icon = "fa-solid fa-handshake-simple",
                label = "Start Job",
                -- job = "RequiredJob"
                canInteract = function(entity)
                    return #(GetEntityCoords(PlayerPedId()) - vec3(Config.Locations.DutyToggle.Coords[1].x, Config.Locations.DutyToggle.Coords[1].y, Config.Locations.DutyToggle.Coords[1].z)) < 5.0
                end
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent("multiplayerpostman:OpenMainMenu", function()
    OpenDutyMenu()
end)


function AddPostBoxToTarget()
    exports["qb-target"]:AddTargetModel(Config.Props, {
        options = {
            {
                event = "multiplayerpostman:CollectLetters",
                icon = "fa-solid fa-envelopes-bulk",
                label = Config.Lang["pickLetter"],
                canInteract = function()
                    if not IsPedInAnyVehicle(PlayerPedId(), true) then
                        return OnDuty
                    else
                        return false 
                    end
                end
                -- job = "RequiredJob",
            },
        },
        distance = 2
    })
end

RegisterNetEvent("multiplayerpostman:CollectLetters", function(data)
    SearchMailBox(data.entity)
end)