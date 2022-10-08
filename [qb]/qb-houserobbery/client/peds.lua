CreateThread(function ()
    if exports['ms-peds'] then
        for _, ped in pairs(Config.Boss) do
            exports['ms-peds']:RegisterPed(ped)

            exports['qb-target']:AddBoxZone("houserobberyboss", ped["coords"], 1, 1, {
                name = "houserobberyboss",
                heading = ped["coords"].heading,
                debugPoly = false,
                minZ = ped["coords"].z - 2,
                maxZ = ped["coords"].z + 2,
            }, {
                options = {
                    {
                    type = "client",
                    event = "qb-houserobbery:client:JobMenu",
                    icon = "Fas Fa-hands",
                    label = Lang:t('target.job_boss'),
                    },
                },
                distance = 1.0
            })
        end
    end
end)