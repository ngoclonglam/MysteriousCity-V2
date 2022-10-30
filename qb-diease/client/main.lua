local QBCore = exports['qb-core']:GetCoreObject()

local mTosse = false
local mStomaco = false
local mPelle = false
local possTosse = 70
local possStomaco = 5
local possPelle = 6

RegisterNetEvent("subtitle:missiontext")
AddEventHandler("subtitle:missiontext", function(text, time)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(text)
  DrawSubtitleTimed(time, 1)
end)

CreateThread(function()

  while true do
	  Wait(0)

    if mTosse or mStomaco or mPelle then
      drawTxt(0.3, 1.4, 0.45, '🤢', 185, 185, 185, 255)
    end

  end
end)

CreateThread(function()

  while true do
	  Wait(Config.milliSecondiTosse)

    local numRandomTosse = math.random(1, 100)
    local scritturaTosse = "tosse"

    if numRandomTosse <= possTosse and not mTosse and not mStomaco and not mPelle then
      mTosse = true
      TriggerServerEvent('esx_disease:malato', scritturaTosse)
      TriggerEvent('subtitle:missiontext', _U('have_cought'), 10000)
    end
  end
end)

CreateThread(function()

  while true do
    Wait(Config.milliSecondiStomaco)

    local numRandomStomaco = math.random(1, 100)
    local scritturaStomaco = "stomaco"

    if numRandomStomaco <= possStomaco and not mTosse and not mStomaco and not mPelle then
      mStomaco = true
      TriggerServerEvent('esx_disease:malatostomaco', scritturaStomaco)
      TriggerEvent('subtitle:missiontext', _U('stomach_disease'), 10000)
    end
  end
end)

CreateThread(function()

  while true do
    Wait(Config.milliSecondiPelle)

    local numRandomPelle = math.random(1, 100)
    local playerPed = PlayerPedId()

    if numRandomPelle <= possPelle and not mTosse and not mStomaco and not mPelle then
        mPelle = true
        TriggerServerEvent('esx_disease:malatopelle')
        TriggerEvent('subtitle:missiontext', _U('skin_disease'), 10000)
        SetPedHeadOverlay(playerPed, 5,	26, (3 / 10) + 0.0)
        SetPedHeadOverlayColor(playerPed, 5, 2,	0)
        SetPedHeadOverlay(playerPed, 7,	9,	(10 / 10) + 0.0)
    end
  end
end)

CreateThread(function()

  while true do

    local secondsBetweenAnimTosse = math.random(Config.MinMillSecTosse, Config.MaxMillSecTosse)

	  Wait(secondsBetweenAnimTosse)

    if mTosse then

	    RequestAnimDict("timetable@gardener@smoking_joint")
      while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
      Wait(100)
      end

      TaskPlayAnim(PlayerPedId(), "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
      Wait(3000)
      ClearPedSecondaryTask(PlayerPedId())
    end
  end
end)

CreateThread(function()

  while true do

    local secondsBetweenAnimStomaco = math.random(Config.MinMillSecStomaco, Config.MaxMillSecStomaco)
    local playerPed = PlayerPedId()
    local maxHealth = GetEntityMaxHealth(playerPed)
    local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth , math.floor(health - maxHealth/19))

	  Wait(secondsBetweenAnimStomaco)

    if mStomaco then

	    RequestAnimDict("oddjobs@taxi@tie")
      while not HasAnimDictLoaded("oddjobs@taxi@tie") do
      Wait(100)
      end

      TaskPlayAnim(PlayerPedId(), "oddjobs@taxi@tie", "vomit_outside", 8.0, 8.0, -1, 50, 0, false, false, false)
      Wait(7000)

      ClearPedSecondaryTask(PlayerPedId())
      SetEntityHealth(playerPed, newHealth)
    end
  end
end)

CreateThread(function()

  while true do

    local playerPed = PlayerPedId()

	  Wait(Config.milliSecondiPelleMalata)

    if mPelle then
      SetPedHeadOverlay(playerPed, 5,	26, (3 / 10) + 0.0)
      SetPedHeadOverlayColor(playerPed, 5, 2,	0)
      SetPedHeadOverlay(playerPed, 7,	10,	(10 / 10) + 0.0)
    end
  end
end)

RegisterNetEvent('esx_disease:guarigionetosse')
AddEventHandler('esx_disease:guarigionetosse', function()

  mTosse = false

  Wait(3000)

  TriggerServerEvent('esx_disease:guarito')
  TriggerEvent('subtitle:missiontext', _U('no_disease'), 10000)

end)

RegisterNetEvent('esx_disease:guarigionestomaco')
AddEventHandler('esx_disease:guarigionestomaco', function()

  mStomaco = false
  local playerPed  = PlayerPedId()
  local maxHealth = GetEntityMaxHealth(playerPed)

  RequestAnimDict("mp_suicide")
  while not HasAnimDictLoaded("mp_suicide") do
  Wait(100)
  end

  TaskPlayAnim(PlayerPedId(), "mp_suicide", "pill_fp", 8.0, 8.0, -1, 50, 0, false, false, false)
  Wait(3000)
  ClearPedSecondaryTask(PlayerPedId())
  TriggerServerEvent('esx_disease:guarito')
  TriggerEvent('subtitle:missiontext', _U('no_disease'), 10000)

end)

RegisterNetEvent('esx_disease:guarigionepelle')
AddEventHandler('esx_disease:guarigionepelle', function()

  mPelle = false
  local playerPed  = PlayerPedId()

  RequestAnimDict("mp_suicide")
  while not HasAnimDictLoaded("mp_suicide") do
  Wait(100)
  end

  TaskPlayAnim(PlayerPedId(), "mp_suicide", "pill_fp", 8.0, 8.0, -1, 50, 0, false, false, false)
  Wait(3000)
  ClearPedSecondaryTask(PlayerPedId())
  TriggerServerEvent('esx_disease:guarito')
  TriggerEvent('subtitle:missiontext', _U('no_disease'), 10000)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
    TriggerEvent('skinchanger:loadSkin', skin)
  end)

end)

AddEventHandler('playerSpawned', function()
	ESX.TriggerServerCallback('esx_disease:quadroclinico', function(malato)
    if malato == 'tosse' then
      mTosse = true
      TriggerServerEvent('esx_disease:malato')
      TriggerEvent('subtitle:missiontext', _U('have_cought'), 10000)
    elseif malato == 'stomaco' then
      mStomaco = true
      TriggerServerEvent('esx_disease:malatostomaco')
      TriggerEvent('subtitle:missiontext', _U('stomach_disease'), 10000)
    elseif malato == 'rosacea' then
      mPelle = true
      TriggerServerEvent('esx_disease:malatopelle')
      TriggerEvent('subtitle:missiontext', _U('skin_disease'), 10000)
		end
  end)
end)

function drawTxt(x, y, scale, text, red, green, blue, alpha)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextScale(0.64, 0.64)
  SetTextColour(red, green, blue, alpha)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.940, 0.935)
end
