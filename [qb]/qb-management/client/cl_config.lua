-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(461.45, -986.2, 30.73),
    },
    ['ambulance'] = {
        vector3(309.92, -601.94, 43.28),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(902.43, -171.51, 74.08),
    },
    ['cardealer'] = {
        vector3(-311.29, -922.75, 40.06),
    },
    ['mechanic'] = {
        vector3(-339.59, -157.4, 44.59),
    },
    ['tunner'] = {
       vector3(-357.92, -912.1, 32.79),
    },
    ['vu'] = {
        vector3(12.21, -673.46, 243.39),
    }
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(461.45, -986.2, 30.73), length = 0.35, width = 0.45, heading = 351.0, minZ = 30.58, maxZ = 30.68 } ,
    },
    ['ambulance'] = {
        { coords = vector3(307.11, -597.43, 43.28), length = 1.2, width = 0.6, heading = 344.06, minZ = 42.28, maxZ = 44.28 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-311.29, -922.75, 40.06), length = 2.4, width = 1.05, heading = 337.65, minZ = 39.06, maxZ = 41.06 },
    },
    ['mechanic'] = {
        { coords = vector3(-309.31, -119.65, 38.57), length = 1.15, width = 2.6, heading = 353.0, minZ = 37.57, maxZ = 39.57 },
    },
    ['tunner'] = {
        { coords = vector3(-357.92, -912.1, 32.79), length = 1.15, width = 2.6, heading = 353.0, minZ = 31.79, maxZ = 33.79 },
    },
    ['vu'] = {
        { coords = vector3(9.34, -671.47, 243.43), length = 1.15, width = 2.6, heading = 293.77, minZ = 242.43, maxZ = 244.43 },
    },
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
