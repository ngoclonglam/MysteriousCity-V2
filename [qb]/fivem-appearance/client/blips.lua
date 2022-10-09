local Blips = {}

local function ShowBlip(blipConfig, blip, job, gang)
    if blip.job and blip.job ~= job then
        return false
    elseif blip.gang and blip.gang ~= gang then
        return false
    end

    return (blipConfig.Show and blip.showBlip == nil) or blip.showBlip
end

local function SetupBlips(job, gang)
    for k, _ in pairs (Config.Stores) do
        local blipConfig = Config.Blips[Config.Stores[k].shopType]
        if ShowBlip(blipConfig, Config.Stores[k], job, gang) then
            local blip = AddBlipForCoord(Config.Stores[k].coords.x, Config.Stores[k].coords.y, Config.Stores[k].coords.z)
            SetBlipSprite(blip, blipConfig.Sprite)
            SetBlipColour(blip, blipConfig.Color)
            SetBlipScale(blip, blipConfig.Scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipConfig.Name)
            EndTextCommandSetBlipName(blip)
            Blips[#Blips + 1] = blip
        end
    end
end

function ResetBlips(job, gang)
    for i = 1, #Blips do
        RemoveBlip(Blips[i])
    end
    Blips = {}
    SetupBlips(job, gang)
end



if exports['nearbylocation'] then
    RegisterNetEvent("fivem-appearance:client:ShowNearestLocation", function(data)
        local locations = {}
        for k, location in pairs(Config.Stores) do
            if location then
                locations[#locations+1] = location.coords
            end
        end

        local blipOptions = {
            blipscale = 0.75,
            blipsprite = 73,
            blipdisplay = 4,
            blipcolor = 47,
            blipRadius = 5,
            blipshortrange = true,
            label = "Tiệm Quần Áo",
        }
        exports['nearbylocation']:ShowNearestLocation(locations, blipOptions)
    end)
end
