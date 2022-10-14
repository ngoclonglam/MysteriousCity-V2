local fishStarted = false
local storeOwner = nil
local fishingReady = false
local balikyemi = false
local fishingRodHandler
local currentSpot
 olta = false
 yem = false
local currentRod = false
local currentBait = false



function HandleStore()
   local storeData = Config.FishingRestaurant

   WaitForModel(storeData["ped"]["model"])

   local pedHandle = CreatePed(5, storeData["ped"]["model"], storeData["ped"]["position"], storeData["ped"]["heading"],
   false)

   SetEntityAsMissionEntity(pedHandle, true, true)
   SetBlockingOfNonTemporaryEvents(pedHandle, true)

   storeOwner = pedHandle

   SetModelAsNoLongerNeeded(storeData["ped"]["model"])
   FreezeEntityPosition(storeOwner, true)
   TaskSetBlockingOfNonTemporaryEvents(storeOwner, true)
   SetEntityInvincible(storeOwner, true)

   local storeBlip = AddBlipForCoord(storeData["ped"]["position"])
   SetBlipSprite(storeBlip, storeData["blip"]["sprite"])
   SetBlipScale(storeBlip, 1.0)
   SetBlipColour(storeBlip, storeData["blip"]["color"])
   SetBlipAsShortRange(storeBlip, true)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentString(storeData["name"])
   EndTextCommandSetBlipName(storeBlip)
end

Citizen.CreateThread(function()
HandleStore()
spotBlip()
while true do
   Citizen.Wait(1500)
   local dist = #(GetEntityCoords(PlayerPedId()) - Config.FishingRestaurant.ped.position)
   if dist < 50.0 then
      if not DoesEntityExist(storeOwner) then
         local storeData = FishingRestaurant
         WaitForModel(storeData["ped"]["model"])
         local pedHandle = CreatePed(5, storeData["ped"]["model"], storeData["ped"]["position"],
         storeData["ped"]["heading"], false)
         SetEntityAsMissionEntity(pedHandle, true, true)
         SetBlockingOfNonTemporaryEvents(pedHandle, true)
         storeOwner = pedHandle
         FreezeEntityPosition(storeOwner, true)
         TaskSetBlockingOfNonTemporaryEvents(storeOwner, true)
         SetEntityInvincible(storeOwner, true)
         SetModelAsNoLongerNeeded(storeData["ped"]["model"])
      end
   end
end
end)




function PlayAnimation(ped, dict, anim, settings)
   if dict then
      Citizen.CreateThread(function()
      RequestAnimDict(dict)

      while not HasAnimDictLoaded(dict) do
         Citizen.Wait(100)
      end

      if settings == nil then
         TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
      else
         local speed = 1.0
         local speedMultiplier = -1.0
         local duration = 1.0
         local flag = 0
         local playbackRate = 0

         if settings["speed"] then
            speed = settings["speed"]
         end

         if settings["speedMultiplier"] then
            speedMultiplier = settings["speedMultiplier"]
         end

         if settings["duration"] then
            duration = settings["duration"]
         end

         if settings["flag"] then
            flag = settings["flag"]
         end

         if settings["playbackRate"] then
            playbackRate = settings["playbackRate"]
         end

         TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
      end

      RemoveAnimDict(dict)
      end)
   else
      TaskStartScenarioInPlace(ped, anim, 0, true)
   end
end

function GenerateFishingRod(ped)
   local pedPos = GetEntityCoords(ped)

   local fishingRodHash = `prop_fishing_rod_01`

   WaitForModel(fishingRodHash)

   local rodHandle = CreateObject(fishingRodHash, pedPos, true)

   AttachEntityToEntity(rodHandle, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)

   AttachEntityToEntity(rodHandle, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false
   , true, 1, true)

   return rodHandle
end

RegisterNUICallback('StartFishing', function()
fishingReady = true
SendNUIMessage({
   type = 'CLOSE_MENU'
})
currentSpot = NearSpot()
Config.Notification(Config.Notifications["rodtostart"]["message"], Config.Notifications["rodtostart"]["type"])


end)
Citizen.CreateThread(function()
while true do
   Citizen.Wait(0)
   if fishStarted or startfish then
      if IsControlJustPressed(0, Config.CancelKey) then
         StopAFKFishing()
         StopFishing()
         olta = false
         yem = false
      end
   end
end
end)

function StopFishing()

   fishStarted = false
   RemoveLoadingPrompt()
   ClearPedTasks(PlayerPedId())

   DeleteEntity(fishingRodHandler)
   SendNUIMessage({
      type = 'FISHING_STOPPED'
   })
   fishingReady = false
   currentRod = false
   currentSpot = false
   currentBait = false
end

function WaitForModel(model)
   if not IsModelValid(model) then
      return
   end

   if not HasModelLoaded(model) then
      RequestModel(model)
   end

   while not HasModelLoaded(model) do
      Citizen.Wait(0)
   end
end









RegisterNetEvent('codem-fishing:UseRod')
AddEventHandler('codem-fishing:UseRod', function(rodType)

if fishingReady then
   if not olta then
      olta = true
      TriggerEvent('codem-fishing:StartFishing', rodType)
      fishingRodHandler = GenerateFishingRod(PlayerPedId())

      local rodData = GetRodData(currentRod)
      if rodData then
         exports["fishing-minigame"]:SetDifficulty(rodData.minigameDiff)
      end
   else
      Config.Notification(Config.Notifications["rods"]["message"], Config.Notifications["rods"]["type"])
   end
end
end)

RegisterNetEvent('codem-fishing:UseBait')
AddEventHandler('codem-fishing:UseBait', function(baitType)
local baitData = GetBaitData(baitType)
if currentSpot and baitData then
   if not yem then
      yem = true
      local found = false
      for _, v in pairs(currentSpot.fishQualityScaleTable) do
         for j, d in pairs(baitData.fishQualityScale) do
            if v == d and not found then
               currentBait = baitType
               Config.Notification(Config.Notifications["usedbait"]["message"], Config.Notifications["usedbait"]["type"])
               found = true
               TriggerServerEvent('codem-fishing:RemoveItem', baitType, 1)
            end
         end
      end
      if not found then
         Config.Notification(Config.Notifications["thisspot"]["message"], Config.Notifications["thisspot"]["type"])

      end
   else
      Config.Notification(Config.Notifications["BAITSOFF"]["message"], Config.Notifications["BAITSOFF"]["type"])
   end
end
end)






RegisterNetEvent('codem-fishing:StartFishing')
AddEventHandler('codem-fishing:StartFishing', function(rodType)
currentRod = rodType

SendNUIMessage({
   type = 'FISHING_STARTED',
   text = 'Checking fishing spot...',
   time = 3000,
   updateProgressbar = true,
})

local waterValidated, castLocation = CanStartFishing()
if waterValidated then
   if not fishStarted then
      -- TriggerServerEvent('QBCore:Server:RemoveItem', 'fishingrod', 1)
      fishStarted = true

      StartFishing(castLocation, fishingRodHandler)
   end
else

   Config.Notification(Config.Notifications["notwater"]["message"], Config.Notifications["notwater"]["type"])
   -- QBCore.Functions.Notify("You are not near water", "error", 3000)

end
end)

AddEventHandler('onResourceStop', function(resourceName)
if (GetCurrentResourceName() ~= resourceName) then
   return
end
if fishStarted then
   DeleteEntity(fishingRodHandler)
   ClearPedTasks(PlayerPedId())
end
DeleteEntity(storeOwner)
end)



function DrawScriptMarker(markerData)
   DrawMarker(markerData["type"] or 1, markerData["pos"] or vector3(0.0, 0.0, 0.0), 0.0, 0.0, 0.0,
   (markerData["type"] == 6 and -90.0 or markerData["rotate"] and -180.0) or 0.0, 0.0, 0.0,
   markerData["size"] or vector3(1.0, 1.0, 1.0), markerData["color"] or vector3(150, 150, 150), 100, false, true, 2,
   false, false, false, false)
end


function StartFishing(castLocation, fishingRod)
   if fishStarted then
      SendNUIMessage({
         type = 'FISHING_STARTED',
         text = 'Waiting to bait the rod...',
         time = 5000,
         updateProgressbar = false,
      })
      while not currentBait do
         Citizen.Wait(1000)
         if not fishStarted or not fishingReady then
            StopAFKFishing()
            StopFishing()
            return
         end
      end

      SendNUIMessage({
         type = 'FISHING_STARTED',
         text = Config.Notifications["waitinginput"]["message"],
         time = 0,
         updateProgressbar = false,
      })
      while not IsControlJustPressed(0, 47) do
         Citizen.Wait(0)
      end

      PlayAnimation(PlayerPedId(), "mini@tennis", "forehand_ts_md_far", {
         ["flag"] = 48
      })

      while IsEntityPlayingAnim(PlayerPedId(), "mini@tennis", "forehand_ts_md_far", 3) do
         Citizen.Wait(0)
      end

      PlayAnimation(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", {
         ["flag"] = 11
      })
      while not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 3) do
         Citizen.Wait(0)
      end

      if interupted and fishStarted then
         ClearPedTasks(PlayerPedId())

         StartFishing(castLocation, fishingRod)
         return
      end

      PlayAnimation(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", {
         ["flag"] = 11
      })
      while not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 3) do
         Citizen.Wait(0)
      end

      local startedBaiting = GetGameTimer()
      local randomTime = math.random(5000, 15000)

      SendNUIMessage({
         type = 'FISHING_STARTED',
         text = Config.Notifications["waitingfish"]["message"],
         time = randomTime,
         updateProgressbar = true,
      })
      local interupted = false
      while GetGameTimer() - startedBaiting < randomTime do
         Citizen.Wait(0)
         DrawScriptMarker({
            ["type"] = 1,
            ["size"] = vector3(2.0, 2.0, 2.0),
            ["color"] = vector3(0, 255, 150),
            ["pos"] = castLocation - vector3(0.0, 0.0, 0.985),
         })

         if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_stand_fishing@idle_a", "idle_c", 3) then
            interupted = true
            break
         end
      end

      if interupted and fishStarted then
         ClearPedTasks(PlayerPedId())
         StartFishing(castLocation, fishingRod)
         return
      end

      local success = exports["fishing-minigame"]:startMinigame()
      if fishStarted then
         if success then
            local ped = PlayerPedId()
            local pedPos = GetEntityCoords(ped)
            local forwardVector = GetEntityForwardVector(ped)
            local forwardPos = vector3(pedPos["x"] + forwardVector["x"] * 7, pedPos["y"] + forwardVector["y"] * 7,
            pedPos["z"] + 1.25)
            local fishHash = `a_c_fish`
            WaitForModel(fishHash)
            local fishHandle = CreatePed(1, fishHash, forwardPos, 0.0, false)
            SetEntityVelocity(fishHandle, forwardVector * -25)
            SetEntityHealth(fishHandle, 0)
            local currentBaitData = GetBaitData(currentBait)
            if currentBaitData then
               local spotData = NearSpot()
               local quality = {}
               if spotData then
                  for _, v in pairs(spotData.fishQualityScaleTable) do
                     local baitData = GetBaitDataByQuality(v)
                     for _, k in pairs(baitData) do
                        if currentBaitData.baitLevel >= k.baitLevel then
                           table.insert(quality, v)
                        end
                     end
                  end
               end
               local possibleFishData = GetFishByQuality(quality)
               local fish = possibleFishData[math.random(1, #possibleFishData)]
               TriggerServerEvent('codem-fishing:AddItem', fish.itemname, math.random(1, 2))
               TriggerServerEvent('codem-fishing:AddXP', fish.xp)
               --Config.Notification("You caught " .. fish.name)
               Config.Notification(Config.Notifications["youcaught"]["message"], Config.Notifications["youcaught"]["type"])
               Citizen.Wait(2000)
               DeleteEntity(fishHandle)
               yem = false
            end
         else
            Config.Notification(Config.Notifications["escaped"]["message"], Config.Notifications["escaped"]["type"])
            yem = false
         end
         Citizen.Wait(2000)
         DeleteEntity(fishHandle)
      else
         --QBCore.Functions.Notify("Fish escaped", "error")
      end
      currentBait = false
      StartFishing(castLocation, fishingRod)


   end
end

function CanStartFishing()
   local startedCheck = GetGameTimer()

   local ped = PlayerPedId()
   local pedPos = GetEntityCoords(ped)

   local forwardVector = GetEntityForwardVector(ped)
   local forwardPos = vector3(pedPos["x"] + forwardVector["x"] * 10, pedPos["y"] + forwardVector["y"] * 10, pedPos["z"])

   local fishHash = `a_c_fish`

   WaitForModel(fishHash)

   local waterHeight = GetWaterHeight(forwardPos["x"], forwardPos["y"], forwardPos["z"])

   local fishHandle = CreatePed(1, fishHash, forwardPos, 0.0, false)

   SetEntityAlpha(fishHandle, 0, true) -- makes the fish invisible.

   SetEntityAlpha(fishHandle, 0, true)
   while GetGameTimer() - startedCheck < 3000 do
      Citizen.Wait(0)
   end

   RemoveLoadingPrompt()

   local fishInWater = IsEntityInWater(fishHandle)

   DeleteEntity(fishHandle)
   SetModelAsNoLongerNeeded(fishHash)
   return fishInWater, fishInWater and vector3(forwardPos["x"], forwardPos["y"], waterHeight) or false
end
