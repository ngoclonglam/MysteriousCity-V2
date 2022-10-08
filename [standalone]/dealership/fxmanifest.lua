fx_version 'bodacious'
game 'gta5'

ui_page('nui/og.html')

client_script{
    "lang/*.lua",

    'utils.lua',
    'client.lua',
    'config.lua'
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "lang/*.lua",

    'config.lua',
	'server.lua',
	'server_utils.lua',
}

files {
    'nui/lang/*',
    'nui/images/*',
    'nui/images/cars/*',

    'nui/og.html',
    'nui/og.css',
    'nui/og.js'
}