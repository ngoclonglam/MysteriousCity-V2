TriggerServerEvent("dp:CheckVersion")

rightPosition = { x = 1450, y = 100 }
leftPosition = { x = 0, y = 100 }
menuPosition = { x = 0, y = 200 }

if Config.MenuPosition then
    if Config.MenuPosition == "left" then
        menuPosition = leftPosition
    elseif Config.MenuPosition == "right" then
        menuPosition = rightPosition
    end
end

if Config.CustomMenuEnabled then
    local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
    local Object = CreateDui(Config.MenuImage, 512, 128)
    _G.Object = Object
    local TextureThing = GetDuiHandle(Object)
    local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
    Menuthing = "Custom_Menu_Head"
else
    Menuthing = "shopui_title_sm_hangar"
end

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(Config.MenuTitle or "", "", menuPosition["x"], menuPosition["y"], Menuthing, Menuthing)
_menuPool:Add(mainMenu)

function ShowNotification(text)
    if Config.NotificationsAsChatMessage then
        TriggerEvent("chat:addMessage", { color = { 255, 255, 255 }, args = { tostring(text) } })
    else
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

local EmoteTable = {}
local FavEmoteTable = {}
local KeyEmoteTable = {}
local DanceTable = {}
local AnimalTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local ShareTable = {}
local FavoriteEmote = ""

if Config.FavKeybindEnabled then
    RegisterCommand('emotefav', function(source, args, raw) FavKeybind() end)

    RegisterKeyMapping("emotefav", "Execute your favorite emote", "keyboard", Config.FavKeybind)

    local doingFavoriteEmote = false
    function FavKeybind()
        if doingFavoriteEmote then return end
        doingFavoriteEmote = true
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            if FavoriteEmote ~= "" and (not CanUseFavKeyBind or CanUseFavKeyBind()) then
                EmoteCommandStart(nil, { FavoriteEmote, 0 })
                Wait(3000)
            end
        end
        doingFavoriteEmote = false
    end
end

lang = Config.MenuLanguage

function AddEmoteMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['emotes'], "", "", Menuthing, Menuthing)
    local dancemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['danceemotes'], "", "", Menuthing, Menuthing)
    local animalmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['animalemotes'], "", "", Menuthing, Menuthing)
    local propmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['propemotes'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    table.insert(EmoteTable, Config.Languages[lang]['animalemotes'])

    if Config.SharedEmotesEnabled then
        sharemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['shareemotes'],
            Config.Languages[lang]['shareemotesinfo'], "", Menuthing, Menuthing)
        shareddancemenu = _menuPool:AddSubMenu(sharemenu, Config.Languages[lang]['sharedanceemotes'], "", "", Menuthing,
            Menuthing)
        table.insert(ShareTable, 'none')
        table.insert(EmoteTable, Config.Languages[lang]['shareemotes'])
    end

    if not Config.SqlKeybinding then
        unbind2item = NativeUI.CreateItem(Config.Languages[lang]['rfavorite'], Config.Languages[lang]['rfavorite'])
        unbinditem = NativeUI.CreateItem(Config.Languages[lang]['prop2info'], "")
        favmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['favoriteemotes'],
            Config.Languages[lang]['favoriteinfo'], "", Menuthing, Menuthing)
        favmenu:AddItem(unbinditem)
        favmenu:AddItem(unbind2item)
        table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
        table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
        table.insert(EmoteTable, Config.Languages[lang]['favoriteemotes'])
    else
        table.insert(EmoteTable, "keybinds")
        keyinfo = NativeUI.CreateItem(Config.Languages[lang]['keybinds'],
            Config.Languages[lang]['keybindsinfo'] .. " /emotebind [~y~num4-9~w~] [~g~emotename~w~]")
        submenu:AddItem(keyinfo)
    end

    for a, b in pairsByKeys(DP.Emotes) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        submenu:AddItem(emoteitem)
        table.insert(EmoteTable, a)
        if not Config.SqlKeybinding then
            favemoteitem = NativeUI.CreateItem(z,
                Config.Languages[lang]['set'] .. z .. Config.Languages[lang]['setboundemote'])
            favmenu:AddItem(favemoteitem)
            table.insert(FavEmoteTable, a)
        end
    end

    for a, b in pairsByKeys(DP.Dances) do
        x, y, z = table.unpack(b)
        danceitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        sharedanceitem = NativeUI.CreateItem(z, "")
        dancemenu:AddItem(danceitem)
        if Config.SharedEmotesEnabled then
            shareddancemenu:AddItem(sharedanceitem)
        end
        table.insert(DanceTable, a)
    end

    for a, b in pairsByKeys(DP.AnimalEmotes) do
        x, y, z = table.unpack(b)
        animalitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        animalmenu:AddItem(animalitem)
        table.insert(AnimalTable, a)
    end

    if Config.SharedEmotesEnabled then
        for a, b in pairsByKeys(DP.Shared) do
            x, y, z, otheremotename = table.unpack(b)
            if otheremotename == nil then
                shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~)")
            else
                shareitem = NativeUI.CreateItem(z,
                    "/nearby (~g~" ..
                    a .. "~w~) " .. Config.Languages[lang]['makenearby'] .. " (~y~" .. otheremotename .. "~w~)")
            end
            sharemenu:AddItem(shareitem)
            table.insert(ShareTable, a)
        end
    end

    for a, b in pairsByKeys(DP.PropEmotes) do
        x, y, z = table.unpack(b)
        propitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        propmenu:AddItem(propitem)
        table.insert(PropETable, a)
        if not Config.SqlKeybinding then
            propfavitem = NativeUI.CreateItem(z,
                Config.Languages[lang]['set'] .. z .. Config.Languages[lang]['setboundemote'])
            favmenu:AddItem(propfavitem)
            table.insert(FavEmoteTable, a)
        end
    end

    if not Config.SqlKeybinding then
        favmenu.OnItemSelect = function(sender, item, index)
            if FavEmoteTable[index] == Config.Languages[lang]['rfavorite'] then
                FavoriteEmote = ""
                ShowNotification(Config.Languages[lang]['rfavorite'], 2000)
                return
            end
            if Config.FavKeybindEnabled then
                FavoriteEmote = FavEmoteTable[index]
                ShowNotification("~o~" .. firstToUpper(FavoriteEmote) .. Config.Languages[lang]['newsetemote'])
            end
        end
    end

    dancemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(DanceTable[index], "dances")
    end

    animalmenu.OnItemSelect = function(sender, item, index)
        local hashSkinMale = GetHashKey("mp_m_freemode_01")
        local hashSkinFemale = GetHashKey("mp_f_freemode_01")

        if GetEntityModel(PlayerPedId()) == hashSkinMale then
            return
        elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
            return
        end
        EmoteMenuStart(AnimalTable[index], "animals")
    end

    if Config.SharedEmotesEnabled then
        sharemenu.OnItemSelect = function(sender, item, index)
            if ShareTable[index] ~= 'none' then
                target, distance = GetClosestPlayer()
                if (distance ~= -1 and distance < 3) then
                    _, _, rename = table.unpack(DP.Shared[ShareTable[index]])
                    TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), ShareTable[index])
                    SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
                else
                    SimpleNotify(Config.Languages[lang]['nobodyclose'])
                end
            end
        end

        shareddancemenu.OnItemSelect = function(sender, item, index)
            target, distance = GetClosestPlayer()
            if (distance ~= -1 and distance < 3) then
                _, _, rename = table.unpack(DP.Dances[DanceTable[index]])
                TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), DanceTable[index], 'Dances')
                SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
            else
                SimpleNotify(Config.Languages[lang]['nobodyclose'])
            end
        end
    end

    propmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(PropETable[index], "props")
    end

    submenu.OnItemSelect = function(sender, item, index)
        if EmoteTable[index] ~= Config.Languages[lang]['favoriteemotes'] then
            EmoteMenuStart(EmoteTable[index], "emotes")
        end
    end
end

function AddCancelEmote(menu)
    local newitem = NativeUI.CreateItem(Config.Languages[lang]['cancelemote'], Config.Languages[lang]['cancelemoteinfo'])
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, checked_)
        if item == newitem then
            EmoteCancel()
            DestroyAllProps()
        end
    end
end

function AddWalkMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['walkingstyles'], "", "", Menuthing, Menuthing)

    walkreset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(walkreset)
    table.insert(WalkTable, Config.Languages[lang]['resetdef'])

    -- This one is added here to be at the top of the list.
    WalkInjured = NativeUI.CreateItem("Injured", "/walk (injured)")
    submenu:AddItem(WalkInjured)
    table.insert(WalkTable, "move_m@injured")

    for a, b in pairsByKeys(DP.Walks) do
        x, label = table.unpack(b)
        walkitem = NativeUI.CreateItem(label or a, "/walk (" .. string.lower(a) .. ")")
        submenu:AddItem(walkitem)
        table.insert(WalkTable, x)
    end

    submenu.OnItemSelect = function(sender, item, index)
        if item ~= walkreset then
            WalkMenuStart(WalkTable[index])
        else
            ResetPedMovementClipset(PlayerPedId())
        end
    end
end

function AddFaceMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['moods'], "", "", Menuthing, Menuthing)

    facereset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(facereset)
    table.insert(FaceTable, "")

    for a, b in pairsByKeys(DP.Expressions) do
        x, y, z = table.unpack(b)
        faceitem = NativeUI.CreateItem(a, "")
        submenu:AddItem(faceitem)
        table.insert(FaceTable, a)
    end

    submenu.OnItemSelect = function(sender, item, index)
        if item ~= facereset then
            EmoteMenuStart(FaceTable[index], "expression")
        else
            ClearFacialIdleAnimOverride(PlayerPedId())
        end
    end
end

function AddInfoMenu(menu)
    if not UpdateAvailable then
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdate'], "Huge Thank You ❤️", "",
            Menuthing, Menuthing)
    else
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdateav'],
            Config.Languages[lang]['infoupdateavtext'], "", Menuthing, Menuthing)
    end
    infomenu:AddItem(NativeUI.CreateItem(Config.Languages[lang]['suggestions'],
        Config.Languages[lang]['suggestionsinfo'
        ]))
		infomenu:AddItem(NativeUI.CreateItem("Join the <font color=\"#3b8eea\">Discord</font>",
        "<font color=\"#3b8eea\">https://discord.gg/sw3NwDq6C8</font>"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~o~DullPear~s~", "~o~DullPear~s~ for the original dpemotes ❤️"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <b>Kibook</b>",
        "<b>Kibook</b> for the addition of Animal Emotes 🐩 submenu."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~y~AvaN0x~s~",
        "~y~AvaN0x~s~ for reformatting and assisting with code and additional features 🙏"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#3b8eea\">SMGMissy</font>",
        "<font color=\"#3b8eea\">SMGMissy</font> for the custom pride flags 🏳️‍🌈."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#a356fa\">Dollie</font>",
        "<font color=\"#a356fa\">DollieMods</font> for the custom emotes 💜."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#ff00c3\">Tigerle</font>",
        "<font color=\"#ff00c3\">Tigerle</font> for assisting with attached Shared Emotes ⚙️."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#7dbf7b\">MissSnowie</font>",
        "<font color=\"#7dbf7b\">MissSnowie</font> for the custom emotes 🐇."))
	infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#FF6100\">Smokey</font>",
        "<font color=\"#FF6100\">Smokey</font> for the custom emotes 🤙🏼."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~b~Ultrahacx~s~", "~b~Ultrahacx~s~ for the custom emotes ☺️."))
	infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#37DA00\">BzZzi</font>",
        "<font color=\"#37DA00\">BzZzi</font> for the custom food props 🍩."))
	infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#C40A7D\">Natty3d</font>",
        "<font color=\"#C40A7D\">Natty3d</font> for the custom lollipop props 🍭."))

    infomenu:AddItem(NativeUI.CreateItem("Thanks to the community", "Translations, bug reports and moral support 🌐"))
end

function OpenEmoteMenu()
    if _menuPool:IsAnyMenuOpen() then
        _menuPool:CloseAllMenus()
    else
        mainMenu:Visible(true)
        ProcessMenu()
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
AddCancelEmote(mainMenu)
if Config.WalkingStylesEnabled then
    AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
    AddFaceMenu(mainMenu)
end

_menuPool:RefreshIndex()

local isMenuProcessing = false
function ProcessMenu()
    if isMenuProcessing then return end
    isMenuProcessing = true
    while _menuPool:IsAnyMenuOpen() do
        _menuPool:ProcessMenus()
        Wait(0)
    end
    isMenuProcessing = false
end

RegisterNetEvent("dp:Update")
AddEventHandler("dp:Update", function(state)
    UpdateAvailable = state
    AddInfoMenu(mainMenu)
    _menuPool:RefreshIndex()
end)

RegisterNetEvent("dp:RecieveMenu") -- For opening the emote menu from another resource.
AddEventHandler("dp:RecieveMenu", function()
    OpenEmoteMenu()
end)
