local QBCore = exports['qb-core']:GetCoreObject()

-- Debug purpose
if Config.Debug then
    AddEventHandler('onResourceStart', function(resource)
        if resource ~= GetCurrentResourceName() then return end
        TriggerServerEvent("qb-scrapyard:server:LoadCompleteJobs")
        -- addon feautre: Update house robbery job points of player
        UpdatePlayerData()
    end)
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    TriggerServerEvent("qb-scrapyard:server:LoadCompleteJobs")
    -- addon feautre: Update house robbery job points of player
    UpdatePlayerData()
end)

RegisterNetEvent('qb-scapyard:client:setCompleteJobs', function(completeJobs)
    Config.CompleteJobs = completeJobs
    Config.CompleteJobs[PlayerData.citizenid] = Config.CompleteJobs[PlayerData.citizenid] or {}
    ResetJob(true)
end)

RegisterNetEvent("qb-scapyard:client:bossMenu", function()
    local jobHeader = Lang:t('menu.getjob_header')
    local jobTxt = Lang:t('menu.getjob_txt')
    local menu = {
        {
            icon = "fa-solid fa-comment",
            header = Lang:t('menu.boss_header'),
            txt =  Lang:t('menu.boss_welcome'),
            isMenuHeader = true,
        },
        {
            header = jobHeader,
            txt = jobTxt,
            icon = "fa-solid fa-briefcase",
            params = {
                event = 'qb-scapyard:client:jobRequest',
            },
        },
        {
            header = Lang:t('menu.level_header'),
            txt = Lang:t('menu.level_txt'),
            icon = "fa-solid fa-circle-info",
            params = {
                event = 'qb-scapyard:client:levelInfo',
            },
        },
        {
            header = Lang:t('menu.exit'),
            icon = "fa-solid fa-arrow-left",
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("qb-scapyard:client:levelInfo", function()
    local menu = {
        {
            icon = "fa-solid fa-comment",
            header = Lang:t('menu.level_info_header', { value = GetJobTitle() }),
            txt = Lang:t('menu.level_info_txt', { value = GetJobPoints(), value2 = GetNextJobPoints() }),
            disabled = true,
        },
        {
            header = Lang:t('menu.goback'),
            icon = "fa-solid fa-arrow-left",
            params = {
                event = 'qb-scapyard:client:bossMenu',
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('qb-scapyard:client:jobRequest', function()
    if QBCore.Functions.SetTimer(9, 17) then return exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn không thể rã xe', 5000, 'warning') end
    if GetAssignedJob() then
        SendNotification(Lang:t("error.job_inprogress"), "error", 5000)
        return
    elseif #Config.CompleteJobs[PlayerData.citizenid] == Config.MaxAllowedJobs then
        SendNotification(Lang:t('error.limit_reached'), "error")
        return
    end
    AssignedVehicle()
    SendEmail()
    SendNotification(Lang:t("success.job_assigned"), "success", 5000)
end)

RegisterNetEvent('qb-scapyard:client:acceptJob', function(data)
    SpawnVehicle(data.vehModel)
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    SetCopCount(amount)
end)

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    local veh = QBCore.Functions.GetClosestVehicle()
    local vehPlate = QBCore.Functions.GetPlate(veh)

    if vehPlate ~= GetAssignedVehiclePlate() then return end
    SpawnVehicleOwner()
end)

RegisterNetEvent('qb-vehiclekeys:client:AddKeys', function(plate)
    if plate ~= GetAssignedVehiclePlate() then return end
    LockpickFinish(true)
end)

RegisterNetEvent("qb-scapyard:client:JobPointsUpdated", function()
    UpdatePlayerData()
end)