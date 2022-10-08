local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}
local QBCore = exports['qb-core']:GetCoreObject()
local dangping   = {status = false, nguoinhan = 'Chưa Có', id = nil, job = nil}

RegisterNetEvent("qt-ping:menu")
AddEventHandler("qt-ping:menu", function()
    OpenNguoiDan()
end)

CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, Keys["F6"]) then
            OpenNguoiDan()
        end
    end
end)

function OpenNguoiDan()
    SendNUIMessage({
		status   = dangping,
        datajob  = Config.Ping,
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('closemenu', function(_, _)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('ping', function(data, _)
    dangping   = {status = true, nguoinhan = 'Chưa Có', id = nil, job = nil}
    TriggerServerEvent("request_menu:sendData", data.jobname, data.value)
end)

RegisterNUICallback('huydichvu', function(_, _)
    TriggerServerEvent("request_menu:huydichvu", dangping.id, dangping.job)
    dangping   = {status = false, nguoinhan = 'Chưa Có', id = nil, job = nil}
end)

RegisterNetEvent("request_menu:daconguoinhan")
AddEventHandler("request_menu:daconguoinhan", function(job, name, id)
	dangping   = {status = true, nguoinhan = name, id = id, job = job}
	QBCore.Functions.Notify(name..' đã nhận bạn', 'success', 10000)
end)

RegisterNetEvent("request_menu:huynhan")
AddEventHandler("request_menu:huynhan", function(_, name)
	dangping   = {status = false, nguoinhan = 'chưa có', id = nil, job = nil}
    QBCore.Functions.Notify(name..' đã hủy bạn', 'error', 10000)
end)
