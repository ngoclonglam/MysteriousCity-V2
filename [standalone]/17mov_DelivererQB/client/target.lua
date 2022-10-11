function SpawnStartingPed()
    local model = `a_f_m_bevhills_02`
    RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
    spawnedPed = CreatePed(0, model, Config.Locations.DutyToggle.Coords[1].x, Config.Locations.DutyToggle.Coords[1].y, Config.Locations.DutyToggle.Coords[1].z - 0.85, 252.01, false, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetEntityInvincible(spawnedPed, true)
    exports["qb-target"]:AddTargetEntity(spawnedPed, {
        options = {
            {
                event = "multiplayerdeliverer:OpenMainMenu",
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

RegisterNetEvent("multiplayerdeliverer:OpenMainMenu", function()
    OpenDutyMenu()
end)


function AddJobVehicleToTargetSystem()
    exports["qb-target"]:AddTargetBone({"door_dside_r", "door_pside_r"},{
        options = {
            {
                event = "multiplayerdeliverer:TakeParcel",
                icon = "fa-solid fa-box",
                label = Config.Lang["takeParcel"],
                -- job = "RequiredJob"
                canInteract = function(entity)
                    if entity == JobVehicle and canInteractWithVeh() then
                        return true
                    end
                    return false
                end
            },
        },
        distance = 1,
    })
end

RegisterNetEvent("multiplayerdeliverer:TakeParcel", function(data)
    Pick('hei_prop_heist_box', 'anim@heists@box_carry@', 'idle', GetEntityCoords(data.entity))
end)


function AddBoxZoneToTargetSystem(coords)
    exports["qb-target"]:AddBoxZone("multiplayerdeliverer:Interaction", coords, 1.0, 1.0, 
    {
        name = "multiplayerdeliverer:Interaction",
        heading = 0.0,
        debugPoly = false,
        minZ = coords.z - 2.5,
        maxZ = coords.z + 1.5,
    }, {
        options = {
            {
                event = "multiplayerdeliverer:deliver",
                icon = "fa-solid fa-hand-holding-hand",
                label = Config.Lang["deliverParcel"],
                -- job = "RequiredJob",
                _coords = coords
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent("multiplayerdeliverer:deliver", function(data)
    KnockDoorAnim(data._coords)
end)