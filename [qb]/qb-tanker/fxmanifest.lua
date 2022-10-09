fx_version 'cerulean'

game 'gta5'

server_scripts {
	'config.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/fueling.ogg',
})
