fx_version 'cerulean'
game 'gta5'

shared_scripts {
	'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/main.lua',
}

client_script 'client/main.lua'

lua54 'yes'