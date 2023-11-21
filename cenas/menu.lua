local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaMenu = self.view


  local x = display.contentWidth
  local y = display.contentHeight

  --[[ local musica = audio.loadStream( 'recursos/audios/musica1.mp3' ) ]]

  audio.play( musica, {channel = 32, loops = -1} )
  audio.setVolume( 0.3, {channel = 32} )


  local fundo = display.newImageRect(cenaMenu, 'recursos/imagens/background2.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5
  fundo:setFillColor(0,0.8,0.8)

 -- Declaração do Joao
 local joao = display.newImageRect(cenaMenu, 'recursos/imagens/joao2.png', x*0.4, x*0.5 )
 joao.x = x*0.44
 joao.y = y*0.88
 joao.alpha=0.7

  local textoMenu = display.newText(cenaMenu, 'João, o Agricultor', x*0.5, y*0.1, fonte, 120 )
  textoMenu:setFillColor( 0,0,0 )

  local textoMenu2 = display.newText(cenaMenu, 'Após uma enchente, João perdeu sua lavoura e começou a se preocupar como o clima adverso pode ser resultado de suas próprias ações.', x*0.5, y*0.65, x*0.7, y*0.99, fonte, 67 )
  textoMenu2:setFillColor( 0,0,0 )

  local textoMenu3 = display.newText(cenaMenu, 'Ajude João a tomar as decisões corretas para colaborar com o meio ambiente.', x*0.5, y*0.67, x*0.7, y*0.53, fonte, 67 )
  textoMenu3:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaMenu, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  bloco.alpha = 0.3

  local botaoJogar = display.newRoundedRect(cenaMenu, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  botaoJogar:setFillColor(0, 70/255, 0) 
  botaoJogar.strokeWidth=15
  botaoJogar:setStrokeColor(8,8,1)

  local textoJogar = display.newText(cenaMenu, 'Siga em frente', botaoJogar.x, botaoJogar.y, fonte, 100 )
  

 --[[  local botaoTutorial = display.newRoundedRect(cenaMenu, x*0.5, y*0.6, x*0.5, y*0.09, 100 )
  botaoTutorial:setFillColor(0, 0.4, 0.8) 

  local textoTutorial = display.newText(cenaMenu, 'TUTORIAL', botaoTutorial.x, botaoTutorial.y, fonte, 100 ) ]]

  local botaoCreditos = display.newRoundedRect(cenaMenu, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  botaoCreditos:setFillColor(0, 70/255, 0) 
  botaoCreditos.strokeWidth=15
  botaoCreditos:setStrokeColor(8,8,1)

  local textoCreditos = display.newText(cenaMenu, 'CREDITOS', botaoCreditos.x, botaoCreditos.y, fonte, 100 )

  

  


   function verificaToque( event )
      if event.phase == 'began' then
         if event.target == botaoJogar then
            composer.gotoScene( 'cenas.jogo', {
               time = 300, effect = 'fade'
           --[[  } )

         elseif event.target == botaoTutorial then
            composer.gotoScene( 'cenas.tutorial', {
               time = 300, effect = 'fade' ]]
            } )

         elseif event.target == botaoCreditos then 
            composer.gotoScene( 'cenas.creditos', {
               time = 300, effect = 'fade'
            } )
         end 
      end  
   end

  botaoJogar:addEventListener('touch', verificaToque)
  --[[ botaoTutorial:addEventListener('touch', verificaToque) ]]
  botaoCreditos:addEventListener('touch', verificaToque)

  
end
cena:addEventListener('create', cena)
return cena