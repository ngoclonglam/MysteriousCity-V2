local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

local loadedBenches = false
local craftingBenches = {}
local craftingFakeBenches = {}
local uiSetup = false
local currentBenchId = nil
local currentDefaultRecipes = {}

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function getThresholdRecipes(craftingRep, attachmentRep)
    local playerDefaultRecipes = {}
    for k, v in pairs(Config.defaultRecipes) do
        if v.isAttachment then
            if attachmentRep >= v.threshold then
                playerDefaultRecipes[#playerDefaultRecipes + 1] = v
            end
        else
            if craftingRep >= v.threshold then
                playerDefaultRecipes[#playerDefaultRecipes + 1] = v
            end
        end
    end
    return playerDefaultRecipes
end

local function getNewUnlocks(newRecipes, oldRecipes)
    local temp = {}
    local unlocks = {}
    for k, v in pairs(newRecipes) do
        temp[v.item] = true
    end

    for k, v in pairs(oldRecipes) do
        temp[v.item] = nil
    end

    for k,v in pairs(newRecipes) do
        if temp[v.item] then
            unlocks[#unlocks + 1] = v
        end
    end

    return unlocks
end

local function setupUI()
    SendNUIMessage({
        action = "setupUI",
    })
end

local function openCraftingMenu()
    TriggerScreenblurFadeIn(500)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "show"
    })
end

local function hideCraftingMenu()
    currentBenchId = nil
    TriggerScreenblurFadeOut(500)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "hide"
    })
end

local function spawnObj(model, coords, heading)
    local modelHash = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
    end

    object = CreateObject(modelHash, coords.x, coords.y, coords.z - 1, false, false, false)
    while not DoesEntityExist(object) do
        Wait(10)
    end

    PlaceObjectOnGroundProperly(object)
    SetEntityAsMissionEntity(object, true, true)
    FreezeEntityPosition(object, true)
    SetEntityHeading(object, heading)


    exports['qb-target']:AddTargetEntity(object, {
        options = { {
             icon = "fa-solid fa-hammer",
             label = "Chế Tạo",
             action = function()
                TriggerServerEvent("glow_crafting_sv:getWorkBenchData")
             end
        }
        },
        distance = 1.5
   })

   return object
end

local function spawnObjFake(model, coords, heading)
    local modelHash = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
    end

    object2 = CreateObject(modelHash, coords.x, coords.y, coords.z - 1, false, false, false)
    while not DoesEntityExist(object) do
        Wait(10)
    end

    PlaceObjectOnGroundProperly(object)
    SetEntityAsMissionEntity(object, true, true)
    FreezeEntityPosition(object, true)
    SetEntityHeading(object, heading - 180)


    exports['qb-target']:AddTargetEntity(object2, {
        options = { {
             icon = "fa-solid fa-hammer",
             label = "Chế Tạo",
             action = function()
                exports['okokNotify']:Alert('Chế Tạo', 'Bàn này là bàn giả đó, thật là ngu ngốc 😋', 5000, 'error')
             end
        }
        },
        distance = 1.5
   })

   return object2
end


local function loadFakeBenches()
    if not loadedBenches then
        for _, v in pairs(Config.fakeBenches) do
            craftingFakeBenches[#craftingFakeBenches + 1] = spawnObjFake(Config.prop, v.coords, v.heading)
        end
    end
end

local function loadBenches()
    if not loadedBenches then
        for _, v in pairs(Config.craftingBenches) do
            craftingBenches[#craftingBenches + 1] = spawnObj(Config.prop, v.coords, v.heading)
        end
    end
end

RegisterNUICallback("discardBlueprint", function(data, cb)
    if currentBenchId then
        QBCore.Functions.TriggerCallback('glow_crafting_sv:discardBlueprint', function (result)
            cb(result)
        end, currentBenchId, data.currentBlueprint)
    else
        cb(false)
    end
end)

RegisterNUICallback("attemptCraft", function(data, cb)
    if currentBenchId then
        TriggerServerEvent("glow_crafting_sv:attemptCraft", currentBenchId, data.currentRecipe, data.amt, data.isBlueprintRecipe)
    end
end)

RegisterNUICallback("close", function(data, cb)
    local player = PlayerPedId()
    hideCraftingMenu()
    StopAnimTask(player, "mini@repair", "fixing_a_player", 1.0)
end)

RegisterNetEvent("glow_crafting_cl:openCraftingBench", function(craftingBenchData, benchId)
    currentBenchId = benchId
    local player = PlayerPedId()
    local craftingRep = PlayerData.metadata.craftingrep
    local attachmentRep = PlayerData.metadata.attachmentcraftingrep

    loadAnimDict("mini@repair")
    TaskPlayAnim(player, "mini@repair", "fixing_a_player", 1.0, 1.0, -1, 1, 0, 0, 0, 0)

    if not uiSetup then
        setupUI()
        uiSetup = true
    end

    if craftingBenchData then
        local blueprintRecipes = {}
        for k, v in pairs(craftingBenchData.blueprints) do
            if Config.blueprintRecipes[v] then
                blueprintRecipes[#blueprintRecipes + 1] = Config.blueprintRecipes[v]
            end
        end

        local defaultRecipes = getThresholdRecipes(craftingRep, attachmentRep)
        currentDefaultRecipes = defaultRecipes

        SendNUIMessage({
            action = "displayBlueprints",
            blueprint = blueprintRecipes,
            default = defaultRecipes
        })
    else
        local defaultRecipes = getThresholdRecipes(craftingRep, attachmentRep)
        currentDefaultRecipes = defaultRecipes

        SendNUIMessage({
            action = "displayBlueprints",
            blueprint = {},
            default = defaultRecipes
        })
    end
        
    openCraftingMenu()
end)

RegisterNetEvent("glow_crafting_cl:increasedRep", function(craftingRep, attachmentRep)
    local recipes = getThresholdRecipes(craftingRep, attachmentRep)
    if #recipes > #currentDefaultRecipes then
        local newUnlocks = getNewUnlocks(recipes, currentDefaultRecipes)
        SendNUIMessage({
            action = "displayNewRecipes",
            recipes = newUnlocks
        })
        
        currentDefaultRecipes = recipes
        QBCore.Functions.Notify('New recipe unlocked', 'success')
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    loadBenches()
    loadFakeBenches()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(2000)
    PlayerData = QBCore.Functions.GetPlayerData()
    loadBenches()
    loadFakeBenches()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    currentDefaultRecipes = {}
    currentBenchId = nil
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DeleteObject(object)
        DeleteObject(object2)
        
    end
end)