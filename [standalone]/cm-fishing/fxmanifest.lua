fx_version 'cerulean'
game 'gta5'
author 'Codem DEVELOPERS'
description 'Codem-Fishing'
ui_page {
	'html/index.html',
}

files {
	'html/style.css',
	'html/css/responsive.css',
	'html/*.js',
	'html/lib/*.js',
	'html/*.html',
	'html/images/*.png',
	'html/images/fishimage/common/*.png',
	'html/images/fishimage/uncommon/*.png',
	'html/images/fishimage/legendary/*.png',
	'html/images/fishimage/rare/*.png',
	'html/images/fishimage/epic/*.png',
	'html/images/fishimage/baits/*.png',
	'html/images/fishimage/rods/*.png',
	'html/fonts/*.otf',
	'html/*.ogg',

}

shared_script{
	'config.lua',
	'GetFrameworkObject.lua',
}



escrow_ignore {
	'config.lua',
	'GetFrameworkObject.lua',
	'PlayerLoaded.lua',
	'afkmode.lua',
	'minigame.lua',
	'readme.lua'
}

client_scripts {
	'@PolyZone/client.lua',
	'GetFrameworkObject.lua',
	'client/*.lua',
}
server_scripts {
	'server/main.lua',
	'server/PlayerLoaded.lua',
	'GetFrameworkObject.lua',
	-- '@async/async.lua', -- MYSQL ASYNC
	'@mysql-async/lib/MySQL.lua',  -- MYSQL ASYNC
}
dependencies {
	'fishing-minigame',
}

lua54 'yes'

dependency '/assetpacks'