QBCore = exports['qb-core']:GetCoreObject()

Notifier = exports['pNotify']
Alert = exports['ps-dispatch']

local mAssignedJob = {}
local mJobPoints = 0
local mNextJobPoints = Config.SkillLevels[#Config.SkillLevels].pts

-- Local Functions

local function createZone()
    mAssignedJob.polyzone = CircleZone:Create(vector3(mAssignedJob.houseInfo.coords.x, mAssignedJob.houseInfo.coords.y, mAssignedJob.houseInfo.coords.z), 50, {
        name="houserobbery",
        useZ=true,
        debugPoly=false,
    })
    mAssignedJob.polyzone:onPlayerInOut(function(isPointInside)
        if not isPointInside then
            if Config.Houses[mAssignedJob.houseId]["opened"] then
                mAssignedJob.polyzone:destroy()
                mAssignedJob.state = Config.JobState.Ready
                TriggerServerEvent('qb-houserobbery:server:JobStateChanged', Config.JobState.Ready)
            end
        end
    end)
end

-- Global Functions

function SendNotification(msg, type, timeout)
    if Config.EnableAddOnNotifer and Notifier then
        Notifier:SendNotification({text = msg, type=type, timeout = timeout})
    else
        QBCore.Functions.Notify(msg, type, timeout)
    end
end

function SendAlert(msg)
    if Config.EnableAddOnAlert and Alert then
        Alert:HouseRobbery()
    else
        TriggerServerEvent('police:server:policeAlert', msg)
    end
end

function JobAssigned(job)
    mAssignedJob = job
    CreateThread(function ()
        local emailSent = false
        repeat
            local hours = GetClockHours()
            if hours <= Config.MinimumTime or hours >= Config.MaximumTime then
                if CurrentCops >= Config.MinimumHouseRobberyPolice then
                    TriggerServerEvent('qb-phone:server:sendNewMail', {
                        sender = Lang:t('email.sender'),
                        subject = Lang:t('email.subject'),
                        message = Lang:t("email.message", { maxTime = Config.MaximumTime, minTime = Config.MinimumTime, item = QBCore.Shared.Items["cryptostick"]["label"] }),
                        button = {
                            enabled = true,
                            buttonEvent = "qb-houserobbery:client:AcceptJob",
                            buttonData = { houseId = mAssignedJob.houseId, }
                        }
                    })
                    emailSent = true
                end
            end
            Wait(1000)
        until emailSent
        CreateThread(function ()
            local title = Lang:t('phone.title')
            local text = Lang:t('phone.text')
            local icon = "fas fa-briefcase"
            local color = "green"
            local timeout = 5000
            local maxRetries = 12
            while maxRetries > 0 and not mAssignedJob.blip do
                TriggerEvent('qb-phone:client:CustomNotification', title, text, icon, color, timeout)
                maxRetries = maxRetries - 1
                Wait(5 * 60 * 1000) -- Resent notification every 5 minutes
            end
        end)
    end)
end

function AcceptJob(data)
    if data and mAssignedJob.houseId == data.houseId then
        createZone()
        CreateLocation()
    else
        SendNotification(Lang:t('error.job_expired'), "error", 3500)
    end
end

function CreateLocation()
    mAssignedJob.blip = AddBlipForCoord(mAssignedJob.houseInfo["coords"].x, mAssignedJob.houseInfo["coords"].y, mAssignedJob.houseInfo["coords"].z)
    SetBlipColour(mAssignedJob.blip, 3)
    SetBlipRoute(mAssignedJob.blip, true)
    SetBlipRouteColour(mAssignedJob.blip, 3)
end

function RemoveLocation()
    if mAssignedJob.blip then
        RemoveBlip(mAssignedJob.blip)
        mAssignedJob.blip = nil
    end
end

function GetJobState()
    return mAssignedJob.state or Config.JobState.Ready
end

function IsHouseAssigned(id)
    if mAssignedJob and mAssignedJob.houseId == id then
        return true
    elseif Config.Houses[id]["assigned"] then
        SendNotification(Lang:t('error.not_assigned_house'), "error", 5000)
    else
        SendNotification(Lang:t('error.not_assigned_house'), "error", 5000)
    end
    return false
end

function GetJobTitle()
    local title = "Tấm chiếu mới"
    for _, lvl in ipairs(Config.SkillLevels) do
        if mJobPoints >= lvl.pts then
            title = lvl.title
        elseif mNextJobPoints > lvl.pts then
            mNextJobPoints = lvl.pts
        end
    end
    return title
end

function GetJobPoints()
    return mJobPoints
end

function GetNextJobPoints()
    return mNextJobPoints
end

function UpdateJobPoints()
    local playerData = QBCore.Functions.GetPlayerData()
    mJobPoints = playerData.metadata[Config.SkillMetadata] or 0
end