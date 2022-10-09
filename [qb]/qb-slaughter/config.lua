Config = {}
Config.OnDuty = false -- If on duty

Config.JobPed = {
    PedModel = "s_m_m_migrant_01",                             -- Ped model  https://wiki.rage.mp/index.php?title=Peds
    PedHash = 0xED0CE4C6,                                        -- Hash numbers for ped model
    TargetHeading = 240.99,                                         -- qb-target box zone
    Coords = vector4(2389.0, 5047.15, 45.41, 240.99),
    -- Move Location (Ped and blip)
    SetBlipSprite = 126,                                             -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 4,                                             -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.95,                                            -- Blip Size
    SetBlipColour = 46,                                              -- Blip Color
    BlipLabel = "Trại Gà",                                         -- Blip Label
}