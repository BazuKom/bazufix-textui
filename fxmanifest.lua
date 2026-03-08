fx_version 'cerulean'
game 'gta5'

author 'Bazufix'
description 'Standalone TextUI for FiveM'
version '1.0.0'

lua54 'yes'

client_scripts {
    'client.lua'
}

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/ui.js',
    'ui/ui.css'
}

escrow_ignore 'client.lua'