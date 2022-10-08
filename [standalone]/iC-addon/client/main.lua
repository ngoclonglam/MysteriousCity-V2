local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

RegisterNetEvent('iC-addon:client:reNameCharacter', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    print(PlayerData.charinfo.lastname, PlayerData.charinfo.firstname)
    local rename = exports['qb-input']:ShowInput({
        header = "Đổi tên",
        submitText = "Xác nhận",
        inputs = {
            {
                text = "Họ",
				name = "firstname", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },{
                text = "Tên",
				name = "lastname", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
        }
    })
    if rename then
        if not rename.firstname or not rename.lastname then return end
        TriggerServerEvent("iC-addon:server:reNameCharacter", rename.firstname, rename.lastname)
    end
end)
