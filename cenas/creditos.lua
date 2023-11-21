local composer = require('composer')

local cena = composer.newScene()

--EFEITOS SONOROS
local audioCerto = audio.loadSound( 'recursos/audios/certo.mp3' )
local audioErro = audio.loadSound( 'recursos/audios/Erro.mp3' )




function cena:create( event )
  local cenaCreditos = self.view

  local x = display.contentWidth
  local y = display.contentHeight
  
  local fundo = display.newImageRect(cenaCreditos, 'recursos/imagens/background2.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5
  fundo:setFillColor(0,0.8,0.8)

  local textoCreditos = display.newText(cenaCreditos, 'CRÉDITOS', x*0.5, y*0.12, fonteTitulo, 100 )
  textoCreditos:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaCreditos,  x*0.5, y*0.43, x*0.8, y*0.70, 120 )
  bloco.alpha = 0.3

  local botaoInstagram = display.newRoundedRect(cenaCreditos, x*0.5, y*0.22, x*0.71, y*0.09, 100)
  botaoInstagram:setFillColor(0, 70/255, 0) 
  botaoInstagram.strokeWidth=15
  botaoInstagram:setStrokeColor(8,8,1)

  local textoInstagram = display.newText(cenaCreditos, 'Victor Schiessl', botaoInstagram.x, botaoInstagram.y, fonte, 80 )

  local botaoLinkedin = display.newRoundedRect(cenaCreditos, x*0.5, y*0.32, x*0.71, y*0.09, 100 )
  botaoLinkedin:setFillColor(0, 70/255, 0) 
  botaoLinkedin.strokeWidth=15
  botaoLinkedin:setStrokeColor(8,8,1)

  local textoLinkedin = display.newText(cenaCreditos, 'Ariane Debus', botaoLinkedin.x, botaoLinkedin.y, fonte, 80 )

  local botaoLuiz = display.newRoundedRect(cenaCreditos, x*0.5, y*0.42, x*0.71, y*0.09, 100 )
  botaoLuiz:setFillColor(0, 70/255, 0) 
  botaoLuiz.strokeWidth=15
  botaoLuiz:setStrokeColor(8,8,1)

  local textoLuiz = display.newText(cenaCreditos, 'Luiz R Francisconi', botaoLuiz.x, botaoLuiz.y, fonte, 80 )

  local botaoSite = display.newRoundedRect(cenaCreditos, x*0.5, y*0.52, x*0.71, y*0.09, 100 )
  botaoSite:setFillColor(0, 70/255, 0) 
  botaoSite.strokeWidth=15
  botaoSite:setStrokeColor(8,8,1)

  local textoSite = display.newText(cenaCreditos, 'João, O Agricultor', botaoSite.x, botaoSite.y, fonte, 80 )

  local botaoCpdi = display.newRoundedRect(cenaCreditos, x*0.5, y*0.62, x*0.71, y*0.09, 100 )
  botaoCpdi:setFillColor(0, 70/255, 0) 
  botaoCpdi.strokeWidth=15
  botaoCpdi:setStrokeColor(8,8,1)

  local textobotaoCpdi = display.newText(cenaCreditos, 'CPDI', botaoCpdi.x, botaoCpdi.y, fonte, 80 )
  


  local botaoVoltar = display.newRoundedRect(cenaCreditos, x*0.5, y*0.72, x*0.71, y*0.09, 100 )
  botaoVoltar:setFillColor(0, 70/255, 0) 
  botaoVoltar.strokeWidth=15
  botaoVoltar:setStrokeColor(8,8,1)

  local textoVoltar = display.newText(cenaCreditos, 'Voltar', botaoVoltar.x, botaoVoltar.y, fonte, 100 )

  -- Declaração do Joao
local joao = display.newImageRect(cenaCreditos, 'recursos/imagens/joao2.png', x*0.4, x*0.5 )
joao.x = x*0.44
joao.y = y*0.88
joao.alpha=0.7

  function verificaToque( event )
    if event.phase == 'began' then
       if event.target == botaoInstagram then
        audio.play( audioCerto )
        botaoInstagram:setFillColor(0, 0.7, 0)
         system.openURL( 'https://www.linkedin.com/in/victorschiessl/' )

       elseif event.target == botaoLinkedin then
        audio.play( audioCerto )
        botaoLinkedin:setFillColor(0, 0.7, 0)
         system.openURL( 'https://www.linkedin.com/in/ariane-debus/' )

        elseif event.target == botaoLuiz then
          audio.play( audioCerto )
          botaoLuiz:setFillColor(0, 0.7, 0)
          system.openURL( 'https://www.linkedin.com/in/lrfrancisconi/' )

        elseif event.target == botaoSite then
          audio.play( audioCerto )
          botaoSite:setFillColor(0, 0.7, 0)
          system.openURL( 'https://joao-o-agricultor.netlify.app/' )

        elseif event.target == botaoCpdi then
          audio.play( audioCerto )
          botaoCpdi:setFillColor(0, 0.7, 0)
          system.openURL( 'https://cpdi.org.br/' )

       elseif event.target == botaoVoltar then 
        audio.play( audioCerto )
        botaoVoltar:setFillColor(0, 0.7, 0)
         composer.gotoScene( 'cenas.menu', {time = 500, effect = 'fade'} )
       end 
    end  
 end

botaoInstagram:addEventListener('touch', verificaToque)
botaoLinkedin:addEventListener('touch', verificaToque)
botaoLuiz:addEventListener('touch',verificaToque)
botaoSite:addEventListener('touch',verificaToque)
botaoCpdi:addEventListener('touch',verificaToque)
botaoVoltar:addEventListener('touch', verificaToque)

end
cena:addEventListener('create', cena)
return cena