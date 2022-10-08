local ClassicMan = LumberDepo.coords
local sellClassic = LumberSeller.coords
local ClassicPed = LumberJob.LumberModel
local ClassicHash = LumberJob.LumberHash

CreateThread(function()
    RequestModel( GetHashKey( ClassicPed ) )
    while ( not HasModelLoaded( GetHashKey( ClassicPed ) ) ) do
        Wait(1)
    end
    lumberjack1 = CreatePed(1, ClassicHash, ClassicMan, false, true)
    SetEntityInvincible(lumberjack1, true)
    SetBlockingOfNonTemporaryEvents(lumberjack1, true)
    FreezeEntityPosition(lumberjack1, true)

    lumberjack3 = CreatePed(1, ClassicHash, sellClassic, false, true)
    SetEntityInvincible(lumberjack3, true)
    SetBlockingOfNonTemporaryEvents(lumberjack3, true)
    FreezeEntityPosition(lumberjack3, true)
end)