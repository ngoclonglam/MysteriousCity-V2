CreateThread(function()
    RequestModel( GetHashKey( Config.JobPed.PedModel ) )
    while ( not HasModelLoaded( GetHashKey( Config.JobPed.PedModel ) ) ) do
        Wait(1)
    end
    local jobPed = CreatePed(1, Config.JobPed.PedHash, Config.JobPed.Coords, false, true)
    SetEntityInvincible(jobPed, true)
    SetBlockingOfNonTemporaryEvents(jobPed, true)
    FreezeEntityPosition(jobPed, true)
    SetModelAsNoLongerNeeded(jobPed)

    exports['qb-target']:AddBoxZone("chickenjob", Config.JobPed.Coords, 1, 1, {
        name = "chickenjob",
        heading = Config.JobPed.TargetHeading,
        debugPoly = false,
        minZ = Config.JobPed.Coords.z - 2,
        maxZ = Config.JobPed.Coords.z + 2,
    }, {
        options = {
            {
            type = "client",
            event = "qb-slaughter:client:chickenBossMenu",
            icon = "Fas Fa-hands",
            label = Lang:t('target.job_boss'),
            },
        },
        distance = 1.0
    })
end)