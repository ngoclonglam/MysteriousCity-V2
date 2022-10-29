fx_version 'adamant'
game 'gta5'
author 'CodeM Team'
description 'CodeM-pausemenu'
version '1.0.0'

shared_scripts {
    'config.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'GetCore.lua',
	'server/main.lua',
	'server/dailyawards.lua',
	'server/battlepass.lua',
	'server/giverewards.lua',
    'server/livecall.lua'
}

client_scripts {
    'GetCore.lua',
	'client/main.lua',
    'client/dailyawards.lua',
	'client/battlepass.lua',
    'client/livecall.lua',
}

export 'IsMenuOpen'

server_exports {
    'SetLevel',
    'RemoveLevel',
    'AddLevel',
    'SetXP',
    'RemoveXP',
    'AddXP',
}

ui_page 'html/index.html'

files {
    'html/style/*.css',
    'html/assets/img/*.png',
    'html/assets/item_images/*.png',
    'html/assets/sound/*.mp3',
    'html/assets/sound/*.ogg',
    'html/assets/item_images/*.jpg',
    'html/assets/car_images/*.png',
    'html/assets/car_images/*.jpg',
    'html/assets/themes/**/*.png',
    'html/index.html',
    'html/lib/*.js',
    'html/app/*.js',

}

escrow_ignore {
	'config.lua',
	'GetCore.lua',
	'server/battlepass.lua',
	'server/dailyawards.lua',
	'server/livecall.lua',
	'server/giverewards.lua',

	'client/battlepass.lua',
	'client/dailyawards.lua',
	'client/livecall.lua',

}

lua54 'yes'
dependency '/assetpacks'