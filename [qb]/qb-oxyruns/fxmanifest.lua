fx_version 'cerulean'
game 'gta5'
lua54 'yes'

dependencies {
	'PolyZone',
	'qb-target'
}

shared_script 'shared/sh_config.lua'

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/cl_main.lua'
}

server_script 'server/sv_main.lua'