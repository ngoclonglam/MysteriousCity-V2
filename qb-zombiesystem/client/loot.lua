local QBCore = exports['qb-core']:GetCoreObject()
local pumpkin = {}

-- Functions --
local function takeGun()
    local lucky = math.random(1, 100)
    local randomWeapon = Config.WeaponDrop[math.random(1, #Config.WeaponDrop)]
    local luckyWeapon = Config.WeaponLucky

    if lucky < Config.ProbabilityLucky then
        local randomAmmo = math.random(10, 50)
        Wait(2000)
        GiveWeaponToPed(PlayerPedId(), luckyWeapon, randomAmmo, true, true)
        exports['okokNotify']:Alert('Halloween', 'Bạn thật là may mắn, đã tìm được một cây súng phòng thân', 5000, 'neutral')
    elseif lucky > Config.ProbabilityWeapon then
        Wait(2000)
        GiveWeaponToPed(PlayerPedId(), randomWeapon, 0, true, true)
        exports['okokNotify']:Alert('Halloween', 'Bạn đã tìm thấy được vũ phí phòng thân', 5000, 'neutral')
    end
end

local function pickupPumpkin(data)
    local player = PlayerPedId()
    QBCore.Functions.Progressbar("pick_weed", "Tìm kiếm trong bí ngô..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableInventory = true,
	}, {
        animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer',
        flags = 16
    }, {}, {}, function() -- Done
        StopAnimTask(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
		DeleteObject(data.pumpkin)
        takeGun()
		TriggerServerEvent('qb-zombie:server:takePumpkin')
	end, function()
		StopAnimTask(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
	end) -- Cancel
end

local function spawnPumpkin(model, coords)
    local modelHash = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
    end
    local object = CreateObject(modelHash, coords.x, coords.y, coords.z - 1, false, false, false)
    while not DoesEntityExist(object) do
        Wait(10)
    end
    PlaceObjectOnGroundProperly(object)
    SetEntityAsMissionEntity(object, true, true)
    FreezeEntityPosition(object, true)

    exports['qb-target']:AddTargetEntity(object, {
        options = { {
             icon = "fa-solid fa-hammer",
             label = "Lụm Đồ",
             pumpkin = object,
             action = function()
                pickupPumpkin()
             end
        }
        },
        distance = 1.5
   })

   return object
end

local function loadPumpkin()
    for _, v in pairs(Config.ObjectSpawn) do
        pumpkin[#pumpkin+1] = spawnPumpkin(Config.ObjectLoot, v.coords)
    end
end

if Config.Time then
    CreateThread(function()
        while true do
            local hour = GetClockHours()
            if hour < Config.TimeStart and hour > Config.TimeEnd then
                Wait(1000)
            else
                TriggerServerEvent('qb-zombie:server:startWeather')
                loadPumpkin()
            end
            Wait(1)
        end
    end)
end

-- Events 
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, prop in pairs(pumpkin) do
            DeleteObject(prop)
        end
    end
end)