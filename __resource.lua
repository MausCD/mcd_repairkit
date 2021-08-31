fx_version 'cerulean'
games { 'gta5' }
author 'MausCD'
description 'This script adds Repairkits and a Sponge'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
    "locales/*.lua",
    "config.lua",
    "client.lua"
}

server_scripts {
	'@es_extended/locale.lua',
    "locales/*.lua",
    "config.lua",
    "server.lua"
}