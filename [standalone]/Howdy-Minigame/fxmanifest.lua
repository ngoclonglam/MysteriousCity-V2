fx_version 'bodacious'
lua54 "yes"
game 'gta5'

ui_page 'build/index.html'

client_script('client.lua')

files {
	'build/index.html',
	'build/main.js',
	'build/style.css',
    'build/sounds/*',
}

escrow_ignore {
	"client.lua"
}
dependency '/assetpacks'