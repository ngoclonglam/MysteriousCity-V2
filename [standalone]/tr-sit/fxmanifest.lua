fx_version 'cerulean'
game 'gta5'

shared_script {
	'config.lua',
}

server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

dependencies {
  'PolyZone',
  'qb-target'
}

lua54 'yes'
