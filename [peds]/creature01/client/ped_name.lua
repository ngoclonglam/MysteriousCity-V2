Citizen.CreateThread(function()
    -- Exemple_nom
    AddTextEntry('#creature01#', 'creature01')
end)

RegisterCommand("creature01", function()
    local model = GetHashKey("creature01") -- Add your ped model here
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    if HasModelLoaded(model) then
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(GetPlayerPed(-1), 4, 0, 0, 0)
        SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
        SetPedComponentVariation(GetPlayerPed(-1), 0, 1, 0, 0)
        SetPedComponentVariation(GetPlayerPed(-1), 6, 0, 0, 0)
    end
end, false)