-- remove de forma global a barra de status do projeto
display.setStatusBar( display.HiddenStatusBar )

--[[ fonte = 'recursos/fonte/majallab.ttf']]

fonte = 'arial'
fonteTitulo = 'arial black'

local composer = require('composer')

-- informa em qual cena o jogo irá iniciar
composer.gotoScene( 'cenas.menu' )