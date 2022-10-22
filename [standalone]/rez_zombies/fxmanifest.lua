fx_version "cerulean"
games {"gta5"}
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 "yes"

escrow_ignore {
	'config.lua',
}

shared_scripts {
    'config.lua',
}

client_scripts {
	'client.lua',
	'behaviour.lua'
}

server_scripts {
	'server.lua'
}
dependency '/assetpacks'