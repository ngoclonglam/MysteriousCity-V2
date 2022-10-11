fx_version 'cerulean'
game 'gta5'
author 'Aiakos#8317'
description 'Codem-Venicehud-v2'
ui_page {
	'html/index.html',
}
files {
	'html/*.css',
	'html/script/*.js',
	'html/*.html',
	'html/fonts/*.otf',
	'html/images/*.png',
	'html/images/*.svg',
	'html/weapons/*.png',
	'html/itemimages/*.png',
	'html/*.ogg',

}

shared_script{
	'config.lua',
}

dependencies { 
	'/server:5104',
	'/onesync',
}

escrow_ignore {
	'client/stress.lua',
	'client/nitro.lua',
	'client/cruise.lua',
	'client/seatbelt.lua',
	'client/status.lua',
	'client/UpdateMoney.lua',
	'server/PlayerLoaded.lua',
	'server/stress.lua',
	'server/nitro.lua',
	'config.lua',
	'GetFrameworkObject.lua',	
}

client_scripts {
	'GetFrameworkObject.lua',
	'client/*.lua',
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',  -- MYSQL ASYNC
	'server/*.lua',
	'GetFrameworkObject.lua',
}

lua54 'yes'
dependency '/assetpacks'