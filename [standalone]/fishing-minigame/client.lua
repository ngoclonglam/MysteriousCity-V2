





local isMinigameActive = false
local success = false
OpenMinigame = function()
    isMinigameActive = true
    success = false

    SendNUIMessage({
        type = 'OPEN',
    })
end

RegisterCommand('+fishing', function()
    if isMinigameActive then
        SendNUIMessage({
            type = 'keydown',
        })
    end
end, false)

RegisterCommand('-fishing', function()
    if isMinigameActive then
        SendNUIMessage({
            type="keyup"
        })

    end
end, false)
RegisterKeyMapping('+fishing', 'Fishing', 'keyboard', 'up')
RegisterNUICallback('minigamecompleted', function(data, cb)
    success = data.success
    isMinigameActive = false

    SendNUIMessage({
      type="hide"
  })
end)

exports('startMinigame', function()
  OpenMinigame()
  while isMinigameActive do
    Citizen.Wait(0)
  end
  return success
end)

exports('SetDifficulty', function(diff)

    SendNUIMessage({
        type="SetDifficulty",
        val = diff
    })
end)

exports('isMinigameActive', function()
  return isMinigameActive
end)