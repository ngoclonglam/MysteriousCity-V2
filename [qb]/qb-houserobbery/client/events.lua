-- Debug purpose
if Config.Debug then
    AddEventHandler('onResourceStart', function(resource)
        UpdateJobPoints()
    end)
end

RegisterNetEvent('qb-houserobbery:client:JobMenu', function()
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
                event = 'qb-houserobbery:client:JobRequest',
            },
        },
        {
            header = Lang:t('menu.level_header'),
            txt = Lang:t('menu.level_txt'),
            icon = "fa-solid fa-circle-info",
            params = {
                event = 'qb-houserobbery:client:LevelInfo',
            },
        },
        {
            header = Lang:t('menu.exit'),
            icon = "fa-solid fa-arrow-left",
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("qb-houserobbery:client:LevelInfo", function()
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
                event = 'qb-houserobbery:client:JobMenu',
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('qb-houserobbery:client:JobRequest', function()
    QBCore.Functions.TriggerCallback('qb-houserobbery:server:AskJob', function(job)
        if job then
            JobAssigned(job)
            SendNotification(Lang:t("success.job_assigned", {maxTime = Config.MaximumTime, minTime = Config.MinimumTime}), "success", 5000)
        else
            SendNotification(Lang:t("error.cannot_get_job"), "error", 3500)
        end
    end)
end)

RegisterNetEvent('qb-houserobbery:client:AcceptJob', function(data)
    AcceptJob(data)
end)

RegisterNetEvent('qb-houserobbery:client:HouseAssigned', function(house)
    Config.Houses[house]["assigned"] = true
end)

RegisterNetEvent("qb-houserobbery:client:JobPointsUpdated", function()
    UpdateJobPoints()
end)