fx_version 'cerulean'
game 'gta5'

description 'QB-VehicleFailure'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua'
}

client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'