fx_version 'cerulean'
game 'gta5'

description 'QB-Slaughterer'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/vi.lua',
    'config.lua',
}

client_scripts {
    'client/peds.lua',
    'client/events.lua',
    'client/chicken_c.lua',
  -- 'client/pig_c.lua',
}

server_scripts {
    'server/chicken_s.lua',
  -- 'server/pig_s.lua',
}

lua54 'yes'