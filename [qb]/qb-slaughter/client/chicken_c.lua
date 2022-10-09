QBCore = exports['qb-core']:GetCoreObject()
-------------------------
--Written by Tościk#9715-
-------------------------
------------------CONFIG----------------------
local startX = 2388.725  --Nơi của gà
local startY = 5044.985
local startZ = 46.304
---------------------------------------------
local przetworniaX = -96.007   --Điểm để xử lý 1
local przetworniaY = 6206.92
local przetworniaZ = 31.02
---
local przetworniaX2 = -100.64   --Điểm để xử lý 2
local przetworniaY2 = 6202.30
local przetworniaZ2 = 31.02
---
local pakowanieX = -106.44    --Đóng gói điểm 1.
local pakowanieY = 6204.29
local pakowanieZ = 31.02
---
local pakowanieX2 = -104.20   --Đóng gói điểm 2.
local pakowanieY2 = 6206.45
local pakowanieZ2 = 31.02
---
local sellX = -591.69    --Điểm bán hàng
local sellY = -892.55
local sellZ = 25.94


---------------------------------------------
--------tego lepiej nie ruszaj ponizej-------
---------------------------------------------
local kurczak1
local kurczak2
local kurczak3
local Zlapany1 = 0
local Zlapany2 = 0
local Zlapany3 = 0
local Ilosczlapanych = 0
local akcja = false
local prop
local zapakowaneDoauta = false
local karton
local mieso
local pakuje = 0
--------------
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Local functions

local function createChickens()
	DoScreenFadeOut(500)
	Wait(500)
	SetEntityCoordsNoOffset(PlayerPedId(), 2385.963, 5047.333, 46.400, 0, 0, 1)
	RequestModel(GetHashKey('a_c_hen'))
	while not HasModelLoaded(GetHashKey('a_c_hen')) do
		Wait(1)
	end
	kurczak1 = CreatePed(26, "a_c_hen", 2370.262, 5052.913, 46.437, 276.351, true, false)
	kurczak2 = CreatePed(26, "a_c_hen", 2372.040, 5059.604, 46.444, 223.595, true, false)
	kurczak3 = CreatePed(26, "a_c_hen", 2379.192, 5062.992, 46.444, 195.477, true, false)
	TaskReactAndFleePed(kurczak1, PlayerPedId())
	TaskReactAndFleePed(kurczak2, PlayerPedId())
	TaskReactAndFleePed(kurczak3, PlayerPedId())
	Wait(500)
	DoScreenFadeIn(500)
	akcja = true
end

local ragdoll = false

local function checkRemains()
	LoadDict('move_jump')
	local health = GetEntityHealth(PlayerPedId())
	TaskPlayAnim(PlayerPedId(), 'move_jump', 'dive_start_run', 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
	Wait(600)
	SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
	Wait(1000)
	ragdoll = true
	local szansaZlapania = math.random(1,100)
	if szansaZlapania <= 60 then
		TriggerEvent('notification', 'Bạn đã bắt được một em gà!', 1)
		if not QBCore.Functions.SetTimer() then exports['okokNotify']:Alert('Cảnh Báo', 'Đã ngoài khung giờ làm việc, bạn có thể bị cảnh sát hỏi thăm', 5000, 'warning') end
		if Zlapany1 == 1 then
			DeleteEntity(kurczak1)
			Zlapany1 = 0
			Ilosczlapanych = Ilosczlapanych +1
		elseif Zlapany2 == 1 then
			DeleteEntity(kurczak2)
			Zlapany2 = 0
			Ilosczlapanych = Ilosczlapanych +1
		elseif Zlapany3 == 1 then
			DeleteEntity(kurczak3)
			Zlapany3 = 0
			Ilosczlapanych = Ilosczlapanych +1
		end
	else
		TriggerEvent('notification', 'Mợ nó, nó chạy mất tiêu!', 2)
	end
	SetEntityHealth(PlayerPedId(), health)

end

local respawningChicken = function()
    repeat
		Wait(0)
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, startX, startY, startZ)

		if dist <= 20.0 then
			DrawMarker(27, startX, startY, startZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
			Wait(1500)
		end
		
		if dist <= 2.5 then
			DrawText3D2(startX, startY, startZ, "~g~[E]~w~ Để bắt gà")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				createChickens()
			end			
		end
    until not Config.OnDuty
end

local catchingChicken = function()
    repeat
    Wait(5)
		if akcja == true then
			local kurczak1Coords = GetEntityCoords(kurczak1)
			local kurczak2Coords = GetEntityCoords(kurczak2)
			local kurczak3Coords = GetEntityCoords(kurczak3)
			local plyCoords = GetEntityCoords(PlayerPedId(), false)
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, kurczak1Coords.x, kurczak1Coords.y, kurczak1Coords.z)
			local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, kurczak2Coords.x, kurczak2Coords.y, kurczak2Coords.z)
			local dist3 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, kurczak3Coords.x, kurczak3Coords.y, kurczak3Coords.z)
			
			if Ilosczlapanych == 3 then
				Zlapany1 = 0
				Zlapany2 = 0
				Zlapany3 = 0
				Ilosczlapanych = 0
				akcja = false
				--ESX.ShowNotification("~g~Udaj się z kurczakami do pojazdu.")
				TriggerEvent('notification', 'Đưa gà đến một chiếc xe!', 1)
				TepnijWyjscie()
			end
		
			if dist <= 1.0 then
				DrawText3D2(kurczak1Coords.x, kurczak1Coords.y, kurczak1Coords.z+0.5, "~o~[E]~b~ Để bắt gà")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany1 = 1
					checkRemains()
				end	
			elseif dist2 <= 1.0 then
				DrawText3D2(kurczak2Coords.x, kurczak2Coords.y, kurczak2Coords.z+0.5, "~o~[E]~b~ Để bắt gà")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany2 = 1
					checkRemains()
				end	
			elseif dist3 <= 1.0 then
				DrawText3D2(kurczak3Coords.x, kurczak3Coords.y, kurczak3Coords.z+0.5, "~o~[E]~b~ Để bắt gà")
				if IsControlJustPressed(0, Keys['E']) then 
					Zlapany3 = 1
					checkRemains()
				end	
			end
		else
			Wait(500)
		end	
    until not Config.OnDuty
end

CreateThread(function ()
    local mJobBlip = AddBlipForCoord(startX, startY, startZ)
    SetBlipSprite (mJobBlip, 126)
    SetBlipDisplay(mJobBlip, 4)
    SetBlipScale  (mJobBlip, 0.95)
    SetBlipColour (mJobBlip, 46)
    SetBlipAsShortRange(mJobBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Trại Gà')
    EndTextCommandSetBlipName(mJobBlip)

	local aJobBlip = AddBlipForCoord(-103.98, 6202.77, 31.03)
    SetBlipSprite (aJobBlip, 126)
    SetBlipDisplay(aJobBlip, 4)
    SetBlipScale  (aJobBlip, 0.95)
    SetBlipColour (aJobBlip, 46)
    SetBlipAsShortRange(aJobBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Mổ Gà')
    EndTextCommandSetBlipName(aJobBlip)
end)

local mJobBlip, mSlaughterBlip, mSellBlip = nil, nil, nil
local toogleBlips = function()
    if not Config.OnDuty then
        if mJobBlip then RemoveBlip(mJobBlip) end
        if mSlaughterBlip then RemoveBlip(mSlaughterBlip) end
        if mSellBlip then RemoveBlip(mSellBlip) end
        return
    end

--[[ 	mJobBlip = AddBlipForCoord(startX, startY, startZ)
		SetBlipSprite (mJobBlip, 126)
		SetBlipDisplay(mJobBlip, 4)
		SetBlipScale  (mJobBlip, 0.95)
		SetBlipColour (mJobBlip, 46)
		SetBlipAsShortRange(mJobBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Trại Gà')
		EndTextCommandSetBlipName(mJobBlip) ]]

	mSlaughterBlip = AddBlipForCoord(przetworniaX, przetworniaY, przetworniaZ)
		SetBlipSprite (mSlaughterBlip, 273)
		SetBlipDisplay(mSlaughterBlip, 4)
		SetBlipScale  (mSlaughterBlip, 0.95)
		SetBlipColour (mSlaughterBlip, 46)
		SetBlipAsShortRange(mSlaughterBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Mổ Gà')
		EndTextCommandSetBlipName(mSlaughterBlip)

	mSellBlip = AddBlipForCoord(sellX, sellY, sellZ)
		SetBlipSprite (mSellBlip, 478)
		SetBlipDisplay(mSellBlip, 4)
		SetBlipScale  (mSellBlip, 0.95)
		SetBlipColour (mSellBlip, 46)
		SetBlipAsShortRange(mSellBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Bán Gà')
		EndTextCommandSetBlipName(mSellBlip)
end

-- Global functions

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end

CreateThread(function()
    while true do
	Wait(0)
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, przetworniaX, przetworniaY, przetworniaZ)
		local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, przetworniaX2, przetworniaY2, przetworniaZ2)
		local distP = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pakowanieX, pakowanieY, pakowanieZ)
		local distP2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pakowanieX2, pakowanieY2, pakowanieZ2)

		if dist <= 25.0 then
			DrawMarker(27, przetworniaX, przetworniaY, przetworniaZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
			DrawMarker(27, przetworniaX2, przetworniaY2, przetworniaZ2-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
			DrawMarker(27, pakowanieX, pakowanieY, pakowanieZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
			DrawMarker(27, pakowanieX2, pakowanieY2, pakowanieZ2-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
			Wait(1500)
		end
		
		if dist <= 2.5 then
			DrawText3D2(przetworniaX, przetworniaY, przetworniaZ, "~g~[E]~w~ Để mổ gà")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				PorcjujKurczaka(1)
			end			
		end
		
		if dist2 <= 2.5 then
			DrawText3D2(przetworniaX2, przetworniaY2, przetworniaZ2, "~g~[E]~w~ Để mổ gà")
		end

		if dist2 <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				PorcjujKurczaka(2)
			end			
		end
		--
		if distP <= 2.5 and pakuje == 0 then
			DrawText3D2(pakowanieX, pakowanieY, pakowanieZ, "~g~[E]~w~ Để đóng gói gà")
		elseif distP <= 2.5 and pakuje == 1 then
			DrawText3D2(pakowanieX, pakowanieY, pakowanieZ, "~g~[S]~w~ Để dừng đóng gói")
			DrawText3D2(pakowanieX, pakowanieY, pakowanieZ+0.1, "~g~[E]~w~ Để tiếp tục đóng gói")
		end

		if distP <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then 
				PakujKurczaka()
			elseif IsControlJustPressed(0, Keys['S']) then
				PrzestanPakowac()
			end			
		end
		
		if distP2 <= 2.5 and pakuje == 0 then
			DrawText3D2(pakowanieX2, pakowanieY2, pakowanieZ2, "~g~[E]~w~ Để đóng gói gà")
		elseif distP2 <= 2.5 and pakuje == 1 then
			DrawText3D2(pakowanieX2, pakowanieY2, pakowanieZ2, "~g~[S]~w~ Để dừng đóng gói")
			DrawText3D2(pakowanieX2, pakowanieY2, pakowanieZ2+0.1, "~g~[E]~w~ Để tiếp tục đóng gói")
		end

		if distP2 <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				PakujKurczaka()
			elseif IsControlJustPressed(0, Keys['S']) then
				PrzestanPakowac()
			end		
		end	
	end
end)

function PrzestanPakowac()
	FreezeEntityPosition(PlayerPedId(), false)
	zapakowaneDoauta = true
	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
	pakuje = 0
	while zapakowaneDoauta do
		Wait(250)
		
    	local coords = GetEntityCoords(PlayerPedId())
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

		LoadDict('anim@heists@box_carry@')

		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3 ) and zapakowaneDoauta == true then
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		end
		
		if DoesEntityExist(vehicle) then
			zapakowaneDoauta = false
			--ESX.ShowNotification("~y~Wkładasz kurczaki do samochodu.")
			TriggerEvent('notification', 'Bạn đã lưu trữ gà trong xe.', 1)
			LoadDict('anim@heists@narcotics@trash')
			TaskPlayAnim(PlayerPedId(), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			Wait(900)
			ClearPedTasks(PlayerPedId())
			DeleteEntity(prop)
		end
	end
end

function PakujKurczaka()
	if QBCore.Functions.HasItem('slaughtered_chicken') then
		SetEntityHeading(PlayerPedId(), 40.0)
		local PedCoords = GetEntityCoords(PlayerPedId())
		mieso = CreateObject(GetHashKey('prop_cs_steak'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(mieso, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		karton = CreateObject(GetHashKey('prop_cs_clothes_box'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(karton, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
		pakuje = 1
		LoadDict("anim@heists@ornate_bank@grab_cash_heels")
		TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
		FreezeEntityPosition(PlayerPedId(), true)
		exports['taskbar']:taskBar(3250, 'Đóng gói thịt gà')
		TriggerServerEvent("tostKurczaki:przerob", 2)

		TriggerServerEvent('QBCore:Server:RemoveItem', 'slaughtered_chicken', 1)
		TriggerServerEvent('QBCore:Server:AddItem', 'packaged_chicken', 1)
		--ESX.ShowNotification("~y~Pakuj kurczaki dalej lub udaj się do pojazdu.")
		TriggerEvent('notification', 'Tiếp tục đóng gói gà hoặc đi đến xe và lưu trữ nó.', 1)
		ClearPedTasks(PlayerPedId())
		DeleteEntity(karton)
		DeleteEntity(mieso)
	else
	--ESX.ShowNotification("~y~Nie masz nic do zapakowania.")
		TriggerEvent('notification', 'Bạn không có gì để đóng gói!', 2)
	end
end

function PorcjujKurczaka(stanowisko)
	if QBCore.Functions.HasItem('alive_chicken') then
		local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
		LoadDict(dict)
		FreezeEntityPosition(PlayerPedId(),true)
		TaskPlayAnim(PlayerPedId(), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		local PedCoords = GetEntityCoords(PlayerPedId())
		nozyk = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(nozyk, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)

		if stanowisko == 1 then
			SetEntityHeading(PlayerPedId(), 313.85)
			kurczak1 = CreateObject(GetHashKey('prop_int_cf_chick_01'),-94.75, 6207.1, 30.03, true, true, true)
			SetEntityRotation(kurczak1,90.0, 0.0, 45.0, 1,true)
			exports['taskbar']:taskBar(10000, 'Cắt lỗ gà trống.')
		elseif stanowisko == 2 then
			SetEntityHeading(PlayerPedId(), 222.0)
			kurczak = CreateObject(GetHashKey('prop_int_cf_chick_01'),-100.39, 6201.56, 29.99, true, true, true)
			SetEntityRotation(kurczak,90.0, 0.0, -45.0, 1,true)
			exports['taskbar']:taskBar(10000, 'Cắt lỗ gà trống.')
		end

		--ESX.ShowNotification("~g~Poćwiartowałeś kurczaka.")
		TriggerEvent('notification', 'Bạn giết mổ một con gà!', 1)
		FreezeEntityPosition(PlayerPedId(),false)
		DeleteEntity(kurczak)
		DeleteEntity(kurczak1)
		DeleteEntity(nozyk)
		ClearPedTasks(PlayerPedId())
		TriggerServerEvent("tostKurczaki:przerob", 1)
	else
		--ESX.ShowNotification("~y~Nie masz kurczaków.")
		TriggerEvent('notification', 'Bạn không có gà!', 2)
	end
end

function TepnijWyjscie()
	DoScreenFadeOut(500)
	Wait(500)
	SetEntityCoordsNoOffset(PlayerPedId(), startX+2, startY+2, startZ, 0, 0, 1)
	if DoesEntityExist(kurczak1) or DoesEntityExist(kurczak2) or DoesEntityExist(kurczak3) then
		DeleteEntity(kurczak1)
		DeleteEntity(kurczak2)
		DeleteEntity(kurczak3)
	end
	Wait(500)
	DoScreenFadeIn(500)

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
							
	local dajdoAuta = true

	while dajdoAuta do
		Wait(250)
		
		local coords    = GetEntityCoords(PlayerPedId())
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		LoadDict('anim@heists@box_carry@')
		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3 ) and dajdoAuta == true then
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		end
	
		if DoesEntityExist(vehicle) then
			dajdoAuta = false
			--ESX.ShowNotification("~y~Wkładasz kurczaki do samochodu.")
			TriggerEvent('notification', 'Bạn đặt gà vào xe!', 2)
			LoadDict('anim@heists@narcotics@trash')
			TaskPlayAnim(PlayerPedId(), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
			Wait(900)
			ClearPedTasks(PlayerPedId())
			DeleteEntity(prop)
			TriggerServerEvent("tost:wkladajKurczki")
		end
	end
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Wait(10)
    end
end



CreateThread(function()
    while true do
	Wait(0)
		if ragdoll then
			SetEntityHealth(PlayerPedId(), 200)
			ragdoll = false
		end
	end
end)

CreateThread(function()
    while true do
    Wait(5)
	local plyCoords = GetEntityCoords(PlayerPedId(), false)
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX, sellY, sellZ)
	
	if dist <= 20.0 then
	DrawMarker(27, sellX, sellY, sellZ-0.96, 0, 0, 0, 0, 0, 0, 2.20, 2.20, 2.20, 255, 255, 255, 200, 0, 0, 0, 0)
	else
	Wait(1000)
	end
	
	if dist <= 2.0 then
		DrawText3D2(sellX, sellY, sellZ+0.1, "[E] Bán gà đóng gói")
		if IsControlJustPressed(0, Keys['E']) then 
			SellKurczaki()
		end	
	end
	
end
end)

function SellKurczaki()
	--getInventoryItem(item)
	if QBCore.Functions.HasItem('packaged_chicken') then

		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
		prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
		SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
		LoadDict('amb@medic@standing@tendtodead@idle_a')
		TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
		exports['taskbar']:taskBar(10000, 'Bán gà')
		-- LoadDict('amb@medic@standing@tendtodead@exit')
		-- TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
		ClearPedTasks(PlayerPedId())
		DeleteEntity(prop)
		TriggerServerEvent("tostKurczaki:przerob", 3)
		--TriggerServerEvent('QBCore:Server:RemoveItem', 'packaged_chicken', 1)
	else
		--ESX.ShowNotification("~r~Nie masz nic na sprzedaż")
		TriggerEvent('notification', 'Bạn không có gì để bán!', 2)
	end
end

function ToggleJobs()
    if Config.OnDuty then
        CreateThread(respawningChicken)
        CreateThread(catchingChicken)
    end
    CreateThread(toogleBlips)
end
