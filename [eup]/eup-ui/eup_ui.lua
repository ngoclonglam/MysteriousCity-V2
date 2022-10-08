outfits = json.decode(LoadResourceFile(GetCurrentResourceName(), GetResourceMetadata(GetCurrentResourceName(), 'uniform_file')))

local function convertInput(input)
	local t1 = tonumber(string.split(input, ":")[1])-1
	local t2 = tonumber(string.split(input, ":")[2])-1
	return({t1, t2})
end

local function setOutfit(outfit)
	local ped = PlayerPedId()

	if (outfit.Gender == "Male" and GetEntityModel(ped) == GetHashKey("mp_m_freemode_01")) or (outfit.Gender == "Female" and GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
		SetPedComponentVariation(ped, 1, convertInput(outfit.Mask)[1], convertInput(outfit.Mask)[2], 0)
		SetPedComponentVariation(ped, 3, convertInput(outfit.UpperSkin)[1], convertInput(outfit.UpperSkin)[2], 0)
		SetPedComponentVariation(ped, 4, convertInput(outfit.Pants)[1], convertInput(outfit.Pants)[2], 0)
		SetPedComponentVariation(ped, 5, convertInput(outfit.Parachute)[1], convertInput(outfit.Parachute)[2], 0)
		SetPedComponentVariation(ped, 6, convertInput(outfit.Shoes)[1], convertInput(outfit.Shoes)[2], 0)
		SetPedComponentVariation(ped, 7, convertInput(outfit.Accessories)[1], convertInput(outfit.Accessories)[2], 0)
		SetPedComponentVariation(ped, 8, convertInput(outfit.UnderCoat)[1], convertInput(outfit.UnderCoat)[2], 0)
		SetPedComponentVariation(ped, 9, convertInput(outfit.Armor)[1], convertInput(outfit.Armor)[2], 0)
		SetPedComponentVariation(ped, 10, convertInput(outfit.Decal)[1], convertInput(outfit.Decal)[2], 0)
		SetPedComponentVariation(ped, 11, convertInput(outfit.Top)[1], convertInput(outfit.Top)[2], 0)

		if convertInput(outfit.Hat)[1] == -1 then
			ClearPedProp(ped, 0)
		else
			SetPedPropIndex(ped, 0, convertInput(outfit.Hat)[1], convertInput(outfit.Hat)[2], true)
		end

		if convertInput(outfit.Glasses)[1] == -1 then
			ClearPedProp(ped, 1)
		else
			SetPedPropIndex(ped, 1, convertInput(outfit.Glasses)[1], convertInput(outfit.Glasses)[2], true)
		end

		if convertInput(outfit.Watch)[1] == -1 then
			ClearPedProp(ped, 6)
		else
			SetPedPropIndex(ped, 6, convertInput(outfit.Watch)[1], convertInput(outfit.Watch)[2], true)
		end
	end
end

local categoryOutfitsM = {}
local categoryOutfitsF = {}

for x, outfit in ipairs(outfits) do
	found = false
	if outfit.Gender == "Male" then
		for i, j in ipairs(categoryOutfitsM) do
			if categoryOutfitsM[i][1] == outfit.Category2 then
				table.insert(categoryOutfitsM[i], outfit)
				found = true
			end
		end
		if found == false then
			table.insert(categoryOutfitsM, {outfit.Category2, outfit})
		end
	else
		for i, j in ipairs(categoryOutfitsF) do
			if categoryOutfitsF[i][1] == outfit.Category2 then
				table.insert(categoryOutfitsF[i], outfit)
				found = true
			end
		end
		if found == false then
			table.insert(categoryOutfitsF, {outfit.Category2, outfit})
		end
	end
end


local menuPool = NativeUI.CreatePool()

local mainMenuM = NativeUI.CreateMenu('EUP Menu', 'MAIN MENU')
mainMenuM:SetMenuWidthOffset(80)
for i, list in pairs(categoryOutfitsM) do
    local subMenu = menuPool:AddSubMenu(mainMenuM, list[1])
	subMenu:SetMenuWidthOffset(80)
    for id, outfit in ipairs(list) do
	if id ~= 1 then
		categoryOutfitsM[i][id].item = NativeUI.CreateItem(categoryOutfitsM[i][id].Name, 'Select this outfit.')
		subMenu:AddItem(categoryOutfitsM[i][id].item)
	end
    end
    subMenu.OnItemSelect = function(sender, item, index)
        for id, outfit in pairs(list) do
            if categoryOutfitsM[i][id].item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

local mainMenuF = NativeUI.CreateMenu('EUP Menu', 'MAIN MENU')
mainMenuF:SetMenuWidthOffset(80)
for i, list in pairs(categoryOutfitsF) do
    local subMenu = menuPool:AddSubMenu(mainMenuF, list[1])
	subMenu:SetMenuWidthOffset(80)
    for id, outfit in ipairs(list) do
	if id ~= 1 then
		categoryOutfitsF[i][id].item = NativeUI.CreateItem(categoryOutfitsF[i][id].Name, 'Select this outfit.')
		subMenu:AddItem(categoryOutfitsF[i][id].item)
	end
    end
    subMenu.OnItemSelect = function(sender, item, index)
        for id, outfit in pairs(list) do
            if categoryOutfitsF[i][id].item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

menuPool:Add(mainMenuM)
menuPool:Add(mainMenuF)
menuPool:RefreshIndex()

RegisterCommand('eup', function()
	local ped = PlayerPedId()
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		mainMenuM:Visible(not mainMenuM:Visible())
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		mainMenuF:Visible(not mainMenuF:Visible())
	else
		ShowInfo("You need to use an MP ped with EUP")
	end
end, false)

CreateThread(function()
    while true do
        Wait(0)
		menuPool:ProcessMenus()
		menuPool:ControlDisablingEnabled(false)
		menuPool:MouseControlsEnabled(false)
    end
end)

function ShowInfo(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end