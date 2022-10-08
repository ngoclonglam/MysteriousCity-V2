fx_version 'cerulean'
game 'gta5'

author 'TRClassic#0001'
description 'Mining script for QBCore'
version '1.0.1'

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'config.lua'}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/pickaxe.ogg',
	'client/html/sounds/breakrock.ogg'
})

this_is_a_map 'yes'