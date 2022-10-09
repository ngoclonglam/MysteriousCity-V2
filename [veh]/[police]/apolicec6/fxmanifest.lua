fx_version 'bodacious'
games {'gta5'}

client_script {
	'car_names.lua'
}

files {
		'vehiclelayouts.meta',
	    'vehicles.meta',
		'carcols.meta',
	    'carvariations.meta',
	    'handling.meta',
		'dlctuner_game.dat151.rel',
		'dlctuner_sounds.dat54.rel',
		'dlctuner_amp.dat10.rel',
		'audio/sfx/**/*.awc',
}

data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'AUDIO_GAMEDATA' 'dlctuner_game.dat'
data_file 'AUDIO_SOUNDDATA' 'dlctuner_sounds.dat'
data_file 'AUDIO_SYNTHDATA' 'dlctuner_amp.dat'
data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_tuner'