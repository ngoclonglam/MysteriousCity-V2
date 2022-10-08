Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 40.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	-- Police
	{
		model = `csb_cop`, -- Model name as a hash.
		coords = vector4(442.68, -981.98, 30.69, 88.53), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		animDict = "anim@amb@nightclub@peds@",
		animName = "rcmme_amanda1_stand_loop_cop"
	},
	
	{
		model = `csb_cop`, -- Model name as a hash.
		coords = vector4(1852.14, 3687.88, 34.227, 212.99), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		animDict = "anim@amb@nightclub@peds@",
		animName = "rcmme_amanda1_stand_loop_cop"
	},

	-- {
	-- 	model = `s_m_y_swat_01`, -- Model name as a hash.
	-- 	coords = vector4(486.39, -995.34, 30.69, 176.93), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "anim@amb@nightclub@peds@",
	-- 	animName = "rcmme_amanda1_stand_loop_cop"
	-- },
	
	-- {
	-- 	model = `s_m_y_swat_01`, -- Model name as a hash.
	-- 	coords = vector4(1861.17, 3688.21, 34.27, 18.6), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "anim@amb@nightclub@peds@",
	-- 	animName = "rcmme_amanda1_stand_loop_cop"
	-- },

	-- {
	-- 	model = `s_m_y_blackops_03`, -- Model name as a hash.
	-- 	coords = vector4(482.42, -995.17, 30.69, 165.8), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "anim@amb@nightclub@peds@",
	-- 	animName = "rcmme_amanda1_stand_loop_cop"
	-- },
	
	-- {
	-- 	model = `s_m_y_blackops_03`, -- Model name as a hash.
	-- 	coords = vector4(1847.45, 3691.41, 34.27, 210.04), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "anim@amb@nightclub@peds@",
	-- 	animName = "rcmme_amanda1_stand_loop_cop"
	-- },
	
	-- Hái Cherry
	{
		model = `a_m_m_farmer_01`, -- Model name as a hash.
		coords = vector4(-2173.88, 4282.2, 49.12, 235.78), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		scenario = "WORLD_HUMAN_CLIPBOARD"
	},
	
	-- Bán cherry
	{
		model = `a_m_m_farmer_01`, -- Model name as a hash.
		coords = vector4(-58.21, 6522.49, 31.49, 323.53), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		scenario = "WORLD_HUMAN_CLIPBOARD"
	},

	-- Mua hạt giống Farming
	{
		model = `a_m_m_farmer_01`, -- Model name as a hash.
		coords = vector4(408.23, 6498.5, 27.76, 169.13), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		scenario = "WORLD_HUMAN_CLIPBOARD"
	},

	-- Ambulance
	{
		model = `s_m_m_doctor_01`, -- Model name as a hash.
		coords = vector4(303.65, -600.74, 43.28, 292.56), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male', -- The gender of the ped, used for the CreatePed native.
		animDict = "anim@amb@nightclub@peds@",
		animName = "rcmme_amanda1_stand_loop_cop"
	},
	
	-- Bar 
	{
		model = `u_f_y_dancerave_01`, -- Model name as a hash.
		coords = vector4(3.53, -677.26, 243.78, 12.71), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'female', -- The gender of the ped, used for the CreatePed native.
		animDict = "mp_safehouse",
		animName = "lap_dance_girl"
	},

	{
		model = `MaiS`, -- Model name as a hash.
		coords = vector4(-0.5, -679.61, 243.78, 20.97), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'female', -- The gender of the ped, used for the CreatePed native.
		animDict = "mini@strip_club@private_dance@part2",
		animName = "priv_dance_p2"
	},

	-- {
	-- 	model = `csb_groom`, -- Model name as a hash.
	-- 	coords = vector4(309.57, -593.88, 43.28, 22.42), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },
	
	-- {
	-- 	model = `s_m_m_scientist_01`, -- Model name as a hash.
	-- 	coords = vector4(303.84, -600.84, 43.28, 280.34), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- {
	-- 	model = `u_m_y_imporage`, -- Model name as a hash.
	-- 	coords = vector4(306.81, -601.94, 43.28, 338.08), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- {
	-- 	model = `s_m_m_scientist_01`, -- Model name as a hash.
	-- 	coords = vector4(1835.05, 3683.98, 34.27, 113.77), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- {
	-- 	model = `csb_groom`, -- Model name as a hash.
	-- 	coords = vector4(1829.5, 3681.69, 34.27, 275.37), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },
	
	-- -- Mechanic
	-- {
	-- 	model = `mp_m_waremech_01`, -- Model name as a hash.
	-- 	coords = vector4(-346.84, -127.91, 39.01, 265.23), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "anim@arena@celeb@podium@no_prop@",
	-- 	animName = "regal_c_1st"
	-- },

	-- {
	-- 	model = `mp_m_weapexp_01`, -- Model name as a hash.
	-- 	coords = vector4(-346.05, -111.38, 39.02, 56.37), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	animDict = "mini@repair",
	-- 	animName = "fixing_a_ped"
	-- },

	-- -- Recycle Job
	-- {
	-- 	model = `mp_m_weapexp_01`, -- Model name as a hash.
	-- 	coords = vector4(484.39, -3111.5, 6.33, 176.37), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },
	
	-- {
	-- 	model = `mp_m_weapexp_01`, -- Model name as a hash.
	-- 	coords = vector4(484.25, -3119.43, 6.07, 178.81), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- {
	-- 	model = `mp_m_weapexp_01`, -- Model name as a hash.
	-- 	coords = vector4(503.68, -3121.18, 6.07, 176.27), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- {
	-- 	model = `mp_m_weapexp_01`, -- Model name as a hash.
	-- 	coords = vector4(503.66, -3121.13, 9.79, 178.7), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },

	-- -- City Hall
	-- {
	-- 	model = `a_m_m_golfer_01`, -- Model name as a hash.
	-- 	coords = vector4(-550.05, -190.23, 38.22, 283.02), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'male', -- The gender of the ped, used for the CreatePed native.
	-- 	scenario = "WORLD_HUMAN_CLIPBOARD"
	-- },
	-- -- Barber Shops
	-- {
	-- 	model = `s_f_m_fembarber`, -- Model name as a hash.
	-- 	coords = vector4(-34.42, -151.15, 57.09, 180.0), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'female' -- The gender of the ped, used for the CreatePed native.
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(-279.89, 6227.61, 31.71, 50.0), -- Paleto Bay
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(1933.71, 3730.42, 32.85, 210.0), -- Sandy Shores
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(-817.19, -183.30, 37.57, 130.0), -- Mad Wayne Thunder Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(-1283.62, -1119.24, 7.00, 110.0), -- Magellan Ave
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(137.61, -1709.78, 29.30, 320.0), -- Carson Ave
	-- 	gender = 'female'
	-- },

	-- -- Clothing Stores
	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(1.20, 6508.53, 31.88, 330.0), -- Paleto Bay
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(1695.00, 4817.49, 42.06, 360.0), -- Grapeseed
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_mid`,
	-- 	coords = vector4(126.91, -224.29, 54.56, 90.0), -- Hawick Ave
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_shop_high`,
	-- 	coords = vector4(-709.06, -151.46, 37.42, 120.0), -- Portola Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_shop_high`,
	-- 	coords = vector4(-1448.41, -237.54, 49.81, 60.0), -- Cougar Ave
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_shop_high`,
	-- 	coords = vector4(-165.24, -303.62, 39.73, 260.0), -- Las Lagunas Blvd
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_mid`,
	-- 	coords = vector4(-1194.10, -767.09, 17.32, 220.0), -- North Rockford Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(425.88, -811.50, 29.49, 20.0), -- Sinner Street
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(-818.20, -1070.43, 11.33, 120.0), -- South Rockford Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(75.20, -1387.62, 29.38, 210.0), -- Innocence Blvd
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_mid`,
	-- 	coords = vector4(613.04, 2762.49, 42.09, 280.0), -- Grapeseed
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(1201.97, 2710.80, 38.22, 100.0), -- Harmony
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(-1097.96, 2714.62, 19.11, 140.0), -- Route 68
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(-3169.38, 1043.18, 20.86, 50.0), -- Great Ocean Highway
	-- 	gender = 'female'
	-- },
}
