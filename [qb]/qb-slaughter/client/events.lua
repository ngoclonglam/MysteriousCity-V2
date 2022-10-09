RegisterNetEvent("qb-slaughter:client:chickenBossMenu", function()
    local playerData = QBCore.Functions.GetPlayerData()
    local dutyLbl = Lang:t('menu.onduty_lbl')
    local dutyTxt = Lang:t('menu.onduty_txt')
    if Config.OnDuty then
        dutyLbl = Lang:t('menu.offduty_lbl')
        dutyTxt = Lang:t('menu.offduty_txt')
    end
    local menu = {
        {
            icon = "fa-solid fa-comment",
            header = Lang:t('menu.boss_welcome', { value = playerData["charinfo"]["firstname"] }),
            isMenuHeader = true,
        },
        {
            header = dutyLbl,
            txt = dutyTxt,
            icon = "fa-solid fa-briefcase",
            params = {
                event = 'QBCore:Client:On2ndJobUpdate',
                args = 'chicken',
            },
        },
        {
            header = Lang:t('menu.exit'),
            icon = "fa-solid fa-arrow-left",
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('QBCore:Client:On2ndJobUpdate', function(JobInfo)
    if JobInfo == "chicken" then
        Config.OnDuty = not Config.OnDuty
    else
        Config.OnDuty = false
    end
    ToggleJobs()
end)