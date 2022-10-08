fx_version 'bodacious'
games {'gta5'}

author 'Lorax'
description 'LRWT'
version '1.0.3'

description 'REQUEST'
ui_page "html/index.html"
files {
	"html/index.html",
	"html/*.js",
	"html/index.css",
}
client_scripts {
	'config.lua',
	'client/main.lua',
    'client/**/*.lua'
}
server_scripts {
	'config.lua',
	'server/main.lua',
    'server/**/*.lua'
}



--
--