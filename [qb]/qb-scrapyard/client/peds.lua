if Config.UseTarget then
    CreateThread(function ()
        if exports['ms-peds'] then
            for k, ped in pairs(Config.Peds) do
                exports['ms-peds']:RegisterPed(ped)

                exports['qb-target']:AddBoxZone("scrapyard"..k, ped["coords"], 1, 1, {
                    name = "houserobberyboss"..k,
                    heading = ped["coords"].heading,
                    debugPoly = false,
                    minZ = ped["coords"].z - 2,
                    maxZ = ped["coords"].z + 2,
                }, {
                    options = {
                        {
                        type = "client",
                        event = "qb-scapyard:client:bossMenu",
                        icon = "Fas Fa-hands",
                        label = Lang:t('target.job_boss'),
                        },
                    },
                    distance = 1.0
                })
            end
        end
    end)
end