
startfish = false
function againfish()
   local found = false
   SendNUIMessage({
      type = 'CLOSE_MENU'
   })
   currentSpot = NearSpot()
   Config.Notification(Config.Notifications["inventory"]["message"], Config.Notifications["inventory"]["type"])
   local item  = Callback("codem-fishing:GetItems")
   for k , v in pairs(item) do
      for j , l in pairs(Config.Fish) do
         if v.name == l.itemname and l.use == true  then
            startfish = true
            TriggerEvent('codem-fishing:useAfkRod',v.name)
            return
         end
      end
   end
   if not found then
      Config.Notification(Config.Notifications["fishingrod"]["message"], Config.Notifications["fishingrod"]["type"])
   end
end

RegisterNUICallback('StartAFKFishing', function()
    local found = false
    SendNUIMessage({
       type = 'CLOSE_MENU'
    })
    currentSpot = NearSpot()
    Config.Notification(Config.Notifications["inventory"]["message"], Config.Notifications["inventory"]["type"])
    local item  = Callback("codem-fishing:GetItems")
    for k , v in pairs(item) do
       for j , l in pairs(Config.Fish) do
          if v.name == l.itemname and l.use == true  then
             startfish = true
             TriggerEvent('codem-fishing:useAfkRod',v.name)
             return
          end
       end
    end
    if not found then
       Config.Notification(Config.Notifications["fishingrod"]["message"], Config.Notifications["fishingrod"]["type"])
    end
end)

RegisterNetEvent('codem-fishing:useAfkRod')
AddEventHandler('codem-fishing:useAfkRod', function(rodType)
if startfish then
   if fishingRodHandler ~= 0 then 
      TriggerEvent('codem-fishing:UseAFKBait')
   else 
      fishingRodHandler = GenerateFishingRod(PlayerPedId())
      TriggerEvent('codem-fishing:UseAFKBait')
   end

   
   
end
end)

RegisterNetEvent('codem-fishing:UseAFKBait')
AddEventHandler('codem-fishing:UseAFKBait', function()
if currentSpot and startfish then
   local baits = false
   local usebaits
   local found = false
   local item  = Callback("codem-fishing:GetItems")
   for _, f in pairs(item) do
      for _, z in pairs(Config.Fish) do
         if f.name == z.itemname and z.baitsuse == true then
            baits = true
            usebaits = f.name
         end
      end
   end
   if baits then
      local baitData = GetBaitData(usebaits)
      for _, v in pairs(currentSpot.fishQualityScaleTable) do
         for _, d in pairs(baitData.fishQualityScale) do
            if v == d and not found then
               currentBait = usebaits
               Config.Notification(Config.Notifications["usedbait"]["message"], Config.Notifications["usedbait"]["type"])
               found = true
               TriggerServerEvent('codem-fishing:RemoveItem', usebaits, 1)
               TriggerEvent('codem-fishing:AFKStartFishing')
            end
         end
      end
      if not found then
         Config.Notification(Config.Notifications["thisspot"]["message"], Config.Notifications["thisspot"]["type"])
      end
   else
      StopAFKFishing()
      Config.Notification(Config.Notifications["bait"]["message"], Config.Notifications["bait"]["type"])
   end
end
end)




function StopAFKFishing()

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
   fishingRodHandler = 0
end


RegisterNetEvent('codem-fishing:AFKStartFishing')
AddEventHandler('codem-fishing:AFKStartFishing', function()
SendNUIMessage({
   type = 'FISHING_STARTED',
   text =  Config.Notifications["checkspot"]["message"],
   time = 3000,
   updateProgressbar = true,
})
local waterValidated, castLocation = CanStartFishing()
if waterValidated then
   if startfish  then
     if currentSpot then 
      StartAFKFishing(castLocation, fishingRodHandler,currentSpot.afkCatchInMinute * 60000)
     end
   end
else
   Config.Notification(Config.Notifications["notwater"]["message"], Config.Notifications["notwater"]["type"])
end
end)

function StartAFKFishing(castLocation, fishingRod,afkmin)
   if startfish then
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
      SendNUIMessage({
         type = 'FISHING_STARTED',
         text = Config.Notifications["waitingfish"]["message"],
         time = afkmin,
         updateProgressbar = true,
      })
      local startedBaiting = GetGameTimer()
      local interupted = false
      while GetGameTimer() - startedBaiting < afkmin do
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
      
      if interupted and startfish then
         ClearPedTasks(PlayerPedId())

         StartFishing(castLocation, fishingRod,afkmin)
         return
      end

      if startfish then
         local ped = PlayerPedId()
         local pedPos = GetEntityCoords(ped)
         local forwardVector = GetEntityForwardVector(ped)
         local forwardPos = vector3(pedPos["x"] + forwardVector["x"] * 7, pedPos["y"] + forwardVector["y"] * 7, pedPos["z"]+1.25)
         local fishHash = `a_c_fish`
         WaitForModel(fishHash)
         local fishHandle = CreatePed(1, fishHash, forwardPos, 0.0, false)
         local forwardVector = GetEntityForwardVector(ped)
         SetEntityVelocity(fishHandle, forwardVector*-25)
         SetEntityHealth(fishHandle, 0)
         local amount
         if usedBait then
            amount = math.random(1, 5)
         else
            amount = math.random(1, 2)
         end
         local currentBaitData = GetBaitData(currentBait)
         if currentBaitData then
            local spotData = NearSpot()
            local quality = {}
            for _,v in pairs(spotData.fishQualityScaleTable) do
               local baitData = GetBaitDataByQuality(v)
               for j,k in pairs(baitData) do
                  local baitDataLevel = GetBaitDataByLevel(k.baitLevel)
                  if currentBaitData.baitLevel >= k.baitLevel then
                     table.insert(quality, v)
                  end
               end
            end
            local possibleFishData = GetFishByQuality(quality)
            local fish = possibleFishData[math.random(1, #possibleFishData)]
            TriggerServerEvent('codem-fishing:AddItem', fish.itemname, math.random(1, 2))
            TriggerServerEvent('codem-fishing:AddXP', fish.xp)
            Config.Notification(Config.Notifications["youcaught"]["message"], Config.Notifications["bait"]["type"])
            Citizen.Wait(2000)
            DeleteEntity(fishHandle)
            againfish()

         end
      end
   end
end