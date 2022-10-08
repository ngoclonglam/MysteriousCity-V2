local mCurrentBlips = {}
local mCurrentPolyzone = {}

local function createBlip(coords, blipOptions)
    if not blipOptions or type(blipOptions) ~= "table" or not next(blipOptions) then return end
	local blip = AddBlipForCoord(coords)

	SetBlipSprite(blip, blipOptions.blipsprite)
	SetBlipScale(blip, blipOptions.blipscale)
	SetBlipColour(blip, blipOptions.blipcolor)
	SetBlipDisplay(blip, blipOptions.blipdisplay or 4)
	SetBlipAsShortRange(blip, blipOptions.blipshortrange)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipOptions.label)
	EndTextCommandSetBlipName(blip)

	return blip
end

local function resetBlips()
    -- Reset current blips
    for k, _ in ipairs(mCurrentBlips) do
        if DoesBlipExist(mCurrentBlips[k]) then
            RemoveBlip(mCurrentBlips[k])
        end
    end
    mCurrentBlips = {}
end

local function resetPolyzones()
    -- Reset current blips
    for k, _ in ipairs(mCurrentPolyzone) do
        if mCurrentPolyzone[k] then
            mCurrentPolyzone[k]:destroy()
        end
    end
    mCurrentPolyzone = {}
end

function ShowNearestLocation(locations, blipOptions)
    CreateThread(function()
        resetBlips()
        resetPolyzones()
        local coords = GetEntityCoords(PlayerPedId())
        local closest = -1
        local closestCoords
        local dstcheck

        for k, locationCoords in ipairs(locations) do
            locationCoords = vector3(locationCoords.x, locationCoords.y, locationCoords.z)
            dstcheck = #(coords - locationCoords)

            if Config.ShowAllLocations then
                local blip = createBlip(locationCoords, blipOptions)
                mCurrentBlips[#mCurrentBlips+1] = blip

                local radius = blipOptions.blipRadius or 5
                local polyZone = CircleZone:Create(locationCoords, radius, {
                    name=blipOptions.label..k,
                    useZ=true,
                    debugPoly=false,
                })
                polyZone:onPlayerInOut(function(isPointInside)
                    if isPointInside then
                        resetPolyzones()
                        resetBlips()
                    end
                end)
                mCurrentPolyzone[#mCurrentPolyzone+1] = polyZone
            end

            if dstcheck < closest or closest == -1 then -- Init value of closet by first location
                closest = dstcheck
                closestCoords = locationCoords
            end
        end

        if not Config.ShowAllLocations then
            local blip = createBlip(closestCoords, blipOptions)
            mCurrentBlips[#mCurrentBlips+1] = blip
        end

        SetNewWaypoint(closestCoords.x, closestCoords.y)
        TriggerEvent('notification', 'Đã xác định GPS <b><font color="yellow">'..blipOptions.label..'</font></b> gần nhất', 1)
    end)
end

RegisterNetEvent("nearbylocation:ShowNearestLocation")
AddEventHandler("nearbylocation:ShowNearestLocation", function(locations, blipOptions)
    ShowNearestLocation(locations, blipOptions)
end)