Config = {}

Config.UseTarget = true                 -- Change it to true if you want to use a target system. All setings about the target system are under target.lua file.
Config.RequiredJob = "none"             -- Set to "none" if you dont want using jobs. If you are using target, you have to set "job" parameter inside every export in target.lua
Config.RequireOneFriendMinimum = false  -- Set to true if you want to force players to create teams
Config.EnableGamePoolDeleting = true    -- Set to false only when using old versions of FXServer. May cause bag removal errors

Config.JobVehicleModel = "trash"                -- Model of the company car
Config.VehicleBackBone = "seat_dside_r1"        -- Bone used only when Config.UseTarget = false. 3D text is displayed on the coordinates of this bone telling us to put the bag in the trunk
Config.VehicleBackBoneCenter = "brakelight_l"   -- Bone used only when Config.UseTarget = false. On the cords of this bone, a player walks up to throw the bag

Config.Blips = { -- Here you can configure Company blip.
    [1] = {
        Sprite = 318,
        Color = 52,
        Scale = 0.8,
        Pos = vector3(-321.56, -1545.74, 30.01),
        Label = 'Garbage Job'
    },
}

Config.Price = 400            -- Price per one bag inside trashmaster. 100 is maximum so full trash = 200$ / partyCount
Config.splitReward = true   -- If it is true, the payout is: (Config.Price * collectedBags) / PartyCount, if false then: (Config.Price * collectedBags)

Config.PropsHashes = {      -- Hashes of bags that we can pick up
    `bkr_prop_fakeid_binbag_01`,
	`hei_prop_heist_binbag`,
	`prop_cs_rub_binbag_01`,
	`prop_cs_street_binbag_01`,
	`prop_ld_rub_binbag_01`,
	`prop_rub_binbag_01`,
	`prop_rub_binbag_04`,
	`prop_rub_binbag_05`,
	`prop_rub_binbag_sd_01`,
	`prop_rub_binbag_sd_02`,
	`p_binbag_01_s`,
    `p_rub_binbag_test`,
    `prop_rub_binbag_06`,
	`prop_rub_binbag_08`,
    `prop_rub_binbag_01b`,
	`prop_rub_binbag_03`,
	`prop_rub_binbag_03b`,
}

Config.Rotations = {       -- Used with the AttachEntityToEntity() function, when you pick up a bag, it will hook onto the specified values:
    [`bkr_prop_fakeid_binbag_01`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.6, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`hei_prop_heist_binbag`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.05, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_cs_rub_binbag_01`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.04, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_cs_street_binbag_01`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_ld_rub_binbag_01`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_01`] = { boneIndex = 6286, xPos = 0.0, yPos = -0.18, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_04`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -1.0, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_05`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.64, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_sd_01`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_sd_02`] = { boneIndex = 6286, xPos = 0.0, yPos = -0.12, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`p_binbag_01_s`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
    [`p_rub_binbag_test`] = { boneIndex = 6286, xPos = 0.0, yPos = 0, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
    [`prop_rub_binbag_06`] = { boneIndex = 6286, xPos = 0, yPos = -0.10, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_08`] = { boneIndex = 6286, xPos = 0, yPos = -0.10, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
    [`prop_rub_binbag_01b`] = { boneIndex = 6286, xPos = 0, yPos = -0.10, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_03`] = { boneIndex = 6286, xPos = 0, yPos = -0.10, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
	[`prop_rub_binbag_03b`] = { boneIndex = 6286, xPos = 0, yPos = -0.10, zPos = -0.44, xRot = -90, yRot = 0, zRot = 0, p9 = true, useSoft = true, collision = false, isPed = true, vertexIndex = 1, fixedRot = false, counterValue = 1},
}

Config.MarkerSettings = {   -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
    Active = {
        r = 255,
        g = 153,
        b = 20,
        a = 200,
    },
    UnActive = {
        r = 255,
        g = 20,
        b = 20,
        a = 200,
    }
}

Config.Locations = {       -- Here u can change all of the base job locations. 
    DutyToggle = {
        Coords = {
            vector3(-321.64309692383,-1545.8939208984,31.019908905029),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0}
    },
    FinishJob = {
        Coords = {
            vector3(-329.48321533203,-1522.9837646484,27.534698486328),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~end ~s~working.',
        scale = {x = 3.0, y = 3.0, z = 3.0}
    },

}

Config.SpawnPoint = vector4(-316.98, -1537.58, 26.64, 338.0)  -- Company car spawn point
Config.EnableCloakroom = true                                 -- if false, then you can't see the Cloakroom button under Work Menu
Config.Clothes = {

    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.

    male = {
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 30},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 36},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 1, ["drawable"] = 56},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 1, ["drawable"] = 59},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 0, ["drawable"] = 56},},
    },

    female = {
        components = {{["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 3, ["texture"] = 0, ["drawable"] = 57},{["component_id"] = 4, ["texture"] = 0, ["drawable"] = 35},{["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 6, ["texture"] = 1, ["drawable"] = 59},{["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 8, ["texture"] = 1, ["drawable"] = 36},{["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},{["component_id"] = 11, ["texture"] = 1, ["drawable"] = 49},},
    }
}

Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["no_permission"] = "Only the party owner can do that!",
    ["keybind"] = 'Garbage Marker Interaction',
    ["too_far"] = "Your party has started work, but you are too far from headquarters. You can still join them.",
    ["kicked"] = "You kicked %s out of the party",
    ["alreadyWorking"] = "First, complete the previous order.",
    ["quit"] = "You have left the Team",
    ["pickGarbage"] = "Pick up the trash",
    ["putGarbage"] = "Put the garbage in",
    ["cantSpawnVeh"] = "The truck spawn site is occupied.",
    ["full"] = "The garbage truck is already full!",
    ["wrongCar"] = "This is not your garbage truck",
    ["CarNeeded"] = "You need your garbage truck to finish the job.",
    ["nobodyNearby"] = "There is no one around",

    -- Server
    ["isAlreadyHost"] = "This player leads his team.",
    ["isBusy"] = "This player already belongs to another team.",
    ["hasActiveInvite"] = "This Player already has an active invitation from someone.",
    ["HaveActiveInvite"] = "You already have an active invitation to join the team.",
    ["InviteDeclined"] = "Your invitation has been declined.",
    ["InviteAccepted"] = "Your invitation has been accepted!",
    ["error"] = "There was a Problem joining a team. Please try again later.",
    ["kickedOut"] = "You've been kicked out of the garbage team!",
    ["reward"] = "You have received a payout of $",
    ["RequireOneFriend"] = "This job requires at least one team member"

}