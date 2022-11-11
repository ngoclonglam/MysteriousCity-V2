Config = {}
Config.Interior = vector3(-8.88, 512.91, 174.63) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1038.01, -2737.97, 20.17) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-8.55, 508.84, 174.63, 19.81) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(3.3, 523.88, 170.62, 70.87) -- Hides your actual ped Ma-cro guapo while you are in selection
Config.CamCoords = vector4(-8.88, 512.91, 174.63, 185.5) -- Camera coordinates for character preview screen 
Config.EnableDeleteButton = false -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries

Config.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
    { license = "license:ca26d420cad3ed24edf4bbc4132a17f9a2a12a2a", numberOfChars = 5 }, -- LamLong
    { license = "license:39e93a781d2a54ca74e0a16adeac1f52fa96d2b5", numberOfChars = 5 }, -- ChickenB0
    { license = "license:3d0bf8360043f842ab427d02fb9caaa3701dc529", numberOfChars = 5 }, -- Louis
}