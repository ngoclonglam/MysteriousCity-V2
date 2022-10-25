-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

local QBCore = exports['qb-core']:GetCoreObject()



CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            -- This is the Application ID (Replace this with you own)
            SetDiscordAppId(999720849928093797)

            -- Here you will have to put the image name for the "large" icon.
            SetDiscordRichPresenceAsset('logo_large')

            -- (11-11-2018) New Natives:

            -- Here you can add hover text for the "large" icon.
            SetDiscordRichPresenceAssetText('Thành Phố Bí Ẩn')

            -- Here you will have to put the image name for the "small" icon.
            SetDiscordRichPresenceAssetSmall('logo_small')

            -- Here you can add hover text for the "small" icon.
            SetDiscordRichPresenceAssetSmallText('Mysterious City')

            local PlayerData = QBCore.Functions.GetPlayerData()
            while not PlayerData do
                PlayerData = QBCore.Functions.GetPlayerData()
                Wait(500)
            end
            local name =  PlayerData.charinfo.lastname .. ' ' .. PlayerData.charinfo.firstname

            SetRichPresence(name .. " - ID [" .. GetPlayerServerId(PlayerId()) .. "] - Mysterious City")

            -- (26-02-2021) New Native:

            --[[
                Here you can add buttons that will display in your Discord Status,
                First paramater is the button index (0 or 1), second is the title and
                last is the url (this has to start with "fivem://connect/" or "https://")
            ]]--
            SetDiscordRichPresenceAction(0, "Vào Discord!", "https://discord.gg/SCHEwKQxQ8")
            SetDiscordRichPresenceAction(1, "Vào Thành Phố!", "https://cfx.re/join/aqxrez")

            -- It updates every minute just in case.
            Wait(60000)
        else
            Wait(1000)
        end
    end
end)
