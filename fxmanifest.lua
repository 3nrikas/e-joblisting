fx_version 'cerulean'
game 'gta5'

author 'Enrikas#3564'
description 'e-joblisting for esx_legacy'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/**'
}

server_scripts {
    'server/**'
}

files {
    'web/**'
}

ui_page 'web/index.html'

dependencies {
	'ox_lib', -- For notifications
    'es_extended'
}