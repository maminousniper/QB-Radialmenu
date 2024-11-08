fx_version 'cerulean'
game 'gta5'

version '1.0.0'
author 'Vector | Morvix'
ui_page 'web/build/index.html'
--[[ ui_page 'http://localhost:5173' ]]
files { 'web/build/index.html', 'web/build/**/*' }

server_script 'server/*.lua'
client_script 'client/*.lua'
shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua'
}

lua54 'yes'
