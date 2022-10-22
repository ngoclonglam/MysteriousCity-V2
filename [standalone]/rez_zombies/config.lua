Config = {
   EnableBlackout = true,
   DisableVehiclePopulation = true,
   DisableHumanPupulation = true,
   EnableZombieSounds = true, --REQUIRES XSOUND
   ZombieSoundLink = 'https://www.youtube.com/watch?v=_UOFBNr2ijY&t=16s&ab_channel=D0ct0rrR1cht0f3n-YT', --MUST BE NON COPYRIGHT
   ShootingDetection = 180,
   RunningDetection = 35,
   OtherDetection = 10.0,

   MutantDamage = 20,
   ZombieDamage = 10,

   TimeInbetweenHordes = 60000 * 30, -- IN MS

   AnimationDic = 'melee@unarmed@streamed_core_fps',
   Animation = 'ground_attack_0_psycho',

   MaxZombiesNight = 80, --CAREFUL, IF YOU SET THIS TOO HIGH IT WILL CAUSE CRASHES!
   MaxZombiesDay = 30, --CAREFUL, IF YOU SET THIS TOO HIGH IT WILL CAUSE CRASHES!
   EnableMutants = true
}

Config.ZombieSpawnZones = {
	{x = -326.84, y = -884.69, z = 31.07, radius = 300},
	{x = 142.56, y = -715.37, z = 33.13, radius = 300},
	{x = 277.81, y = -1210.21, z = 29.3, radius = 300},
    {x = 2488.44, y = 3766.55, z = 41.88, radius = 300},
}

Config.MutantModels = {
	'creature01',
}

Config.PedModels = {
	"s_m_y_prismuscl_01",
	"a_m_y_stwhi_02",
	"a_m_y_stwhi_01",
	"a_m_y_stlat_01",
	"a_m_y_methhead_01",
	"a_m_y_genstreet_02",
	"a_m_y_genstreet_01",
	"a_m_m_skidrow_01",
	"a_m_m_polynesian_01",
	"a_m_m_mexcntry_01",
	"a_m_m_fatlatin_01",
	"a_m_m_salton_02",
	"csb_ramp_hic",
}

Config.HordeLocations = {
    {x = 2920.85, y = 4342.01, z = 50.32},
}

Config.ZombieZoneSpawnAmount = {
	AIRP = 12,
	ALAMO = 5,
	ALTA = 12,
	ARMYB = 15,
	BANNING = 15,
	BEACH = 20,
	BHAMCA = 10,
	BURTON = 25,
	CALAFB = 10,
	CHAMH = 15,
	CHIL = 12,
	CHU = 6,
	CYPRE = 6,
	DAVIS = 15,
	DELBE = 10,
	DELPE = 12,
	DELSOL = 40,
	DESRT = 4,
	DOWNT = 70,
	DTVINE = 20,
	EAST_V = 20,
	EBURO = 30,
	GALFISH = 3,
	GOLF = 1,
	GRAPES = 10,
	GREATC = 3,
	HARMO = 7,
	HAWICK = 13,
	HORS = 8,
	HUMLAB = 15,
	JAIL = 15,
	KOREAT = 40,
	LAGO = 2,
	LDAM = 3,
	LEGSQU = 60,
	LMESA = 8,
	LOSPUER = 12,
	MIRR = 30,
	MORN = 14,
	MOVIE = 15,
	MURRI = 10,
	NCHU = 4,
	NOOSE = 15,
	OCEANA = 0,
	PALCOV = 5,
	PALETO = 10,
	PALHIGH = 3,
	PALMPOW = 14,
	PBLUFF = 8,
	PBOX = 15,
	PROCOB = 5,
	RANCHO = 10,
	RGLEN = 3,
	RICHM = 15,
	ROCKF = 15,
	RTRAK = 3,
	SANAND = 15,
	SANDY = 15,
	SKID = 15,
	SLAB = 7,
	STAD = 15,
	STRAW = 7,
	TATAMO = 3,
	TERMINA = 8,
	TEXTI = 15,
	TONGVAH = 4,
	TONGVAV = 6,
	VCANA = 12,
	VESP = 14,
	VINE = 15,
	WINDF = 15,
	WVINE = 26,
	ZANCUDO = 19,
	ZP_ORT = 17,
	ZQ_UAR = 15,
}



