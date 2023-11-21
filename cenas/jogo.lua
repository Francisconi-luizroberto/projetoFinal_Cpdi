--[[ Jogo criado como conclusão do curso da CPDI que ocorreu de agosto a novembro 2023 ]]
--[[ O jogo foi criado aproveitando o código do Quiz Flag, que aprendemos a fazer no curso ]]
--[[ O objetivo do Quiz flag era acertar o nome do país que aparecia a bandeira na parte superior da tela ]]
--[[ Três opções de respostas, a correta acrecentava tempo ao contador ]]
--[[ A resposta incorreta tirava tempo ]]
--[[ Basicamente no reaproveitamento do código, tirei as bandeiras e uma opção de resposta, limitando ao certo ou errado ]]
--[[ Nosso prazo foi de apenas 1 semana e meia por isso não me preocupei de renomear as variaveis ]]
--[[ Para a resposta certa e para a errada criei uma página para explicar o motivo de cada escolha ]]
--[[ No caso de erro, a explicação e o retorno a questão que foi respondida incorretamente ]]
--[[ Para a correta, página de explicação e próxima questão ]]
--[[ O jogo bem básico apenas com intenção de informar ]]
--[[ https://cpdi.org.br/ ]]

local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaJogo = self.view

  -- VARIAVEIS DE POSICIOMENTO
  local x = display.contentWidth
  local y = display.contentHeight

  -- DECLARACAO DOS GRUPOS (CAMADAS)
  local grupoFundo = display.newGroup()
  local grupoJoao = display.newGroup()
  local grupoChina = display.newGroup()
  local grupoChinaExplica = display.newGroup()
  local grupoChinaExplicaErro = display.newGroup()
  local grupoBrasil = display.newGroup()
  local grupoBrasilExplica = display.newGroup()
  local grupoBrasilExplicaErro = display.newGroup()
  local grupoVenezuela = display.newGroup()
  local grupoVenezuelaExplica = display.newGroup()
  local grupoVenezuelaExplicaErro = display.newGroup()
  local grupoMexico = display.newGroup()
  local grupoMexicoExplica = display.newGroup()
  local grupoMexicoExplicaErro = display.newGroup()
  local grupoPortugal = display.newGroup()
  local grupoPortugalExplica = display.newGroup()
  local grupoPortugalExplicaErro = display.newGroup()
  local grupoTela = display.newGroup()
  local grupoDerrota = display.newGroup()
  local grupoVitoria = display.newGroup()

  cenaJogo:insert( grupoFundo )
  cenaJogo:insert( grupoJoao )
  cenaJogo:insert( grupoChina )
  cenaJogo:insert( grupoChinaExplica )
  cenaJogo:insert( grupoChinaExplicaErro )
  cenaJogo:insert( grupoBrasil )
  cenaJogo:insert( grupoBrasilExplica )
  cenaJogo:insert( grupoBrasilExplicaErro )
  cenaJogo:insert( grupoVenezuela )
  cenaJogo:insert( grupoVenezuelaExplica )
  cenaJogo:insert( grupoVenezuelaExplicaErro )
  cenaJogo:insert( grupoMexico )
  cenaJogo:insert( grupoMexicoExplica )
  cenaJogo:insert( grupoMexicoExplicaErro )
  cenaJogo:insert( grupoPortugal )
  cenaJogo:insert( grupoPortugalExplica)
  cenaJogo:insert( grupoPortugalExplicaErro )
  cenaJogo:insert( grupoTela )
  cenaJogo:insert( grupoDerrota )
  cenaJogo:insert( grupoVitoria )

  -- DECLARACAO DAS PERGUNTAS
  local pergunta = {
    china = {
      bandeira = 'recursos/bandeiras/china.png',
      respostas = { 'Composteira', 'Lixo reciclável' }
    },
    brasil = {
      bandeira = 'recursos/bandeiras/brazil-.png',
      respostas = {'Energia Solar', 'Energia Eólica'},
    },
    venezuela = {
      bandeira = 'recursos/bandeiras/venezuela.png',
      respostas = {'NÃO!!', 'SIM!!'}
    },
    mexico = {
      bandeira = 'recursos/bandeiras/mexico.png',
      respostas = {'Escolha A).', 'Escolha B)'}
    },
    portugal = {
      bandeira = 'recursos/bandeiras/portugal.png',
      respostas = {'Derrubar árvores', 'Aumentar a mata'}
    }
  }

  -- DECLARACAO DOS AUDIOS

  --EFEITOS SONOROS
  local audioCerto = audio.loadSound( 'recursos/audios/certo.mp3' )
  local audioErro = audio.loadSound( 'recursos/audios/Erro.mp3' )
  

  -- VARIAVEL QUE LIMITA O TOQUE NAS RESPOSTAS
  local limitaToque = true

 

  -- DECLARACAO DO FUNDO
  local fundo = display.newImageRect(grupoFundo, 'recursos/imagens/background2.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5
  fundo:setFillColor(0,0.8,0.8)

   -- Declaração do Joao
   local joao = display.newImageRect(grupoJoao, 'recursos/imagens/joao4.png', x*0.4, x*0.5 )
   joao.x = x*0.44
   joao.y = y*0.88
   joao.alpha=0.7

  -- DECLARAÇÃO DO TEMPO
  local tempo = 15
  local tempoTexto = display.newText(grupoTela, tempo, x*0.11, y*0.07, fonte, 140  )

  -- DECLARACAO DERROTA
  local fundoDerrota = display.newRect(grupoDerrota ,x*0.5, y*0.5, x, y )
  fundoDerrota:setFillColor(0, 0, 0)
  fundoDerrota.alpha = 0.9

  local blocoDerrota = display.newRoundedRect(grupoDerrota, x*0.5, y*0.46, x*0.8, y*0.62, 120  )
  blocoDerrota.alpha = 0.3

  local textoDerrota = display.newText(grupoDerrota,'Um grave erro ambiental', x*0.5, y*0.70, x*0.7, y*0.98, fonte, 76 )

  local textoDerrota = display.newText(grupoDerrota,'pode significar grande retrocesso', x*0.5, y*0.76, x*0.7, y*0.80, fonte, 76 )

  local textoDerrota = display.newText(grupoDerrota,'Volte e faça novamente' , x*0.5, y*0.82, x*0.7, y*0.60, fonte, 76  )

  local botaoDerrota = display.newRoundedRect(grupoDerrota, x*0.5, y*0.70, x*0.6, y*0.08, 100 )

  local botaoDerrotaTexto = display.newText(grupoDerrota, 'REINICIAR', botaoDerrota.x, botaoDerrota.y, fonte, 100 )
  botaoDerrotaTexto:setFillColor(0,0,0)

  grupoDerrota.alpha = 0


  -- DECLARACAO VITORIA
  local fundoVitoria = display.newRect(grupoVitoria ,x*0.5, y*0.5, x, y )
  fundoVitoria:setFillColor(0, 70/255, 0)
  fundoVitoria.alpha = 0.9

  local textoVitoria = display.newText(grupoVitoria,'PARABÉNS!' ,x*0.5, y*0.7, fonteTitulo, 110 )
  local textoVitoria2 = display.newText(grupoVitoria,'MEIO AMBIENTE',x*0.5, y*0.3, fonte, 110 )
  local textoVitoria2 = display.newText(grupoVitoria,'Você entende!',x*0.5, y*0.4, fonte, 110 )

  local botaoVitoria = display.newRoundedRect(grupoVitoria, x*0.5, y*0.55, x*0.6, y*0.08, 100 )

  local botaoVitoriaTexto = display.newText(grupoVitoria, 'CREDITOS', botaoVitoria.x, botaoVitoria.y, fonte, 100 )
  botaoVitoriaTexto:setFillColor(0,0,0)

  grupoVitoria.alpha = 0


  -- DECLARACAO CHINA
  --[[ local bandeiraChina = display.newImageRect( grupoChina, pergunta.china.bandeira, x*0.5, x*0.5 )
  bandeiraChina.x = x*0.5
  bandeiraChina.y = y*0.23 ]]

  local blocoChina = display.newRoundedRect(grupoChina, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoChina.alpha = 0.3

  local textoChina = display.newText(grupoChina, 'Questão 1', x*0.5, y*0.1, fonte, 120 )
  textoChina:setFillColor( 0,0,0 )
  
  local textoChina2 = display.newText(grupoChina, 'Como de costume, assim que João levanta, vai preparar as frutas para o seu café da manhã, mas hoje após terminar a refeição se depara com uma dúvida:', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoChina2:setFillColor( 0,0,0 )

  local textoChina3 = display.newText(grupoChina, 'Onde descartar as cascas?', x*0.5, y*0.71, x*0.7, y*0.50, fonte, 67  )
  textoChina3:setFillColor( 0,0,0 )

  local r1China = display.newRoundedRect(grupoChina, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1China:setFillColor(0, 70/255, 0) 
  r1China.strokeWidth=15
  r1China:setStrokeColor(8,8,1)

  local r1ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[1], r1China.x, r1China.y, fonte, 100)

  local r2China = display.newRoundedRect(grupoChina, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2China:setFillColor(0, 70/255, 0) 
  r2China.strokeWidth=15
  r2China:setStrokeColor(8,8,1)

  local r2ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[2], r2China.x, r2China.y, fonte, 100)

 --[[  local r3China = display.newRoundedRect(grupoChina, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3China:setFillColor(0, 0.4, 0.8) 

  local r3ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[3], r3China.x, r3China.y, fonte, 100) ]]
  

--[[ teoria inserir grupo china explica da mesma forma que fosse grupo brasil como página explicativa ]]

-- DECLARACAO CHINA EXPLICA
--[[ local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
bandeiraBrasil.x = x*0.5
bandeiraBrasil.y = y*0.23 ]]

local blocoChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
blocoChinaExplica.alpha = 0.3

local textoChinaExplica = display.newText(grupoChinaExplica, 'Legal!!', x*0.5, y*0.1, fonte, 120 )
  textoChinaExplica:setFillColor( 0,0,0 )
  
  local textoChinaExplica2 = display.newText(grupoChinaExplica, 'O correto é descartar na composteira já que esta não permite a liberação direta de gases e ocorre um melhor aproveitamento de nutrientes.', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoChinaExplica2:setFillColor( 0,0,0 )

  local textoChinaExplica3 = display.newText(grupoChinaExplica, 'Restos de alimentos não são lixo reciclável pois matéria orgânica não pode ser reutilizada.', x*0.5, y*0.70, x*0.7, y*0.50, fonte, 67  )
  textoChinaExplica3:setFillColor( 0,0,0 )

local r1ChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
r1ChinaExplica:setFillColor(0, 70/255, 0) 
r1ChinaExplica.strokeWidth=15
r1ChinaExplica:setStrokeColor(8,8,1)

local r1ChinaExplicaTexto = display.newText(grupoChinaExplica, 'Prossiga!', r1ChinaExplica.x, r1ChinaExplica.y, fonte, 100)

--[[ local r2ChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
r2ChinaExplica:setFillColor(0, 0.4, 0.8)  ]]

--[[ local r2ChinaExplicaTexto = display.newText(grupoChinaExplica, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, fonte, 100)

local r3ChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
r3ChinaExplica:setFillColor(0, 0.4, 0.8) 

local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, fonte, 100) ]]

grupoChinaExplica.alpha = 0

-- DECLARACAO CHINA EXPLICA ERRO!!!!
--[[ local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
bandeiraBrasil.x = x*0.5
bandeiraBrasil.y = y*0.23 ]]

local blocoChinaExplicaErro = display.newRoundedRect(grupoChinaExplicaErro, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
blocoChinaExplicaErro.alpha = 0.3

local textoChinaExplicaErro = display.newText(grupoChinaExplicaErro, 'Não desanime :(', x*0.5, y*0.1, fonte, 100 )
  textoChinaExplicaErro:setFillColor( 0,0,0 )
  
  local textoChinaExplicaErro2 = display.newText(grupoChinaExplicaErro, 'O resto de alimento não é lixo para o reciclável pois matéria orgânica não pode ser reutilizada dessa maneira', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoChinaExplicaErro2:setFillColor( 0,0,0 )

  local textoChinaExplicaErro3 = display.newText(grupoChinaExplicaErro, 'O correto é descartar na composteira já que esta não permite a liberação direta de gases e ocorre um melhor aproveitamento de nutrientes.', x*0.5, y*0.63, x*0.7, y*0.50, fonte, 67  )
  textoChinaExplicaErro3:setFillColor( 0,0,0 )

local r1ChinaExplicaErro = display.newRoundedRect(grupoChinaExplicaErro, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
r1ChinaExplicaErro:setFillColor(0, 70/255, 0) 
r1ChinaExplicaErro.strokeWidth=15
r1ChinaExplicaErro:setStrokeColor(8,8,1)

local r1ChinaExplicaTextoErro = display.newText(grupoChinaExplicaErro, 'Prossiga!', r1ChinaExplicaErro.x, r1ChinaExplicaErro.y, fonte, 100)

--[[ local r2ChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
r2ChinaExplica:setFillColor(0, 0.4, 0.8)  ]]

--[[ local r2ChinaExplicaTexto = display.newText(grupoChinaExplica, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, fonte, 100)

local r3ChinaExplica = display.newRoundedRect(grupoChinaExplica, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
r3ChinaExplica:setFillColor(0, 0.4, 0.8) 

local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, fonte, 100) ]]

grupoChinaExplicaErro.alpha = 0


  -- DECLARACAO BRASIL
 --[[  local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
  bandeiraBrasil.x = x*0.5
  bandeiraBrasil.y = y*0.23 ]]

  local blocoBrasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoBrasil.alpha=0.3

  local textoBrasil = display.newText(grupoBrasil, 'Questão 2', x*0.5, y*0.1, fonte, 120 )
  textoBrasil:setFillColor( 0,0,0 )
  
  local textoBrasil2 = display.newText(grupoBrasil, 'João recebeu uma proposta de instalar fontes de energia sustentável em sua propriedade.', x*0.5, y*0.68, x*0.7, y*0.98, fonte, 67  )
  textoBrasil2:setFillColor( 0,0,0 )

  local textoBrasil3 = display.newText(grupoBrasil, 'Qual das opções seria a correta?', x*0.5, y*0.67, x*0.7, y*0.50, fonte, 67  )
  textoBrasil3:setFillColor( 0,0,0 )

  local r1Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1Brasil:setFillColor(0, 70/255, 0) 
  r1Brasil.strokeWidth=15
  r1Brasil:setStrokeColor(8,8,1)

  local r1BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[1], r1Brasil.x, r1Brasil.y, fonte, 100)

  local r2Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2Brasil:setFillColor(0, 70/255, 0) 
  r2Brasil.strokeWidth=15
  r2Brasil:setStrokeColor(8,8,1)

  local r2BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, fonte, 100)

  --[[ local r3Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Brasil:setFillColor(0, 0.4, 0.8) 

  local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, fonte, 100) ]]

  grupoBrasil.alpha = 0

   -- DECLARACAO BRASIL Explica
 --[[  local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
  bandeiraBrasil.x = x*0.5
  bandeiraBrasil.y = y*0.23 ]]

  local blocoBrasilExplica = display.newRoundedRect(grupoBrasilExplica, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoBrasilExplica.alpha=0.3

  local textoBrasilExplica = display.newText(grupoBrasilExplica, 'Pegadinha!!!', x*0.5, y*0.1, fonte, 120 )
  textoBrasilExplica:setFillColor( 0,0,0 )
  
  local textoBrasilExplica2 = display.newText(grupoBrasilExplica, 'Ambas opções são corretas!!!', x*0.5, y*0.71, x*0.7, y*0.98, fonte, 76  )
  textoBrasilExplica2:setFillColor( 0,0,0 )

  local textoBrasilExplica3 = display.newText(grupoBrasilExplica, 'Tanto a energia solar quanto a eólica não geram grandes impactos ambientais!', x*0.5, y*0.62, x*0.7, y*0.50, fonte, 67  )
  textoBrasilExplica3:setFillColor( 0,0,0 )

  local r1BrasilExplica = display.newRoundedRect(grupoBrasilExplica, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1BrasilExplica:setFillColor(0, 70/255, 0) 
  r1BrasilExplica.strokeWidth=15
  r1BrasilExplica:setStrokeColor(8,8,1)

  local r1BrasilExplicaTexto = display.newText(grupoBrasilExplica, 'Siga em frente!', r1BrasilExplica.x, r1BrasilExplica.y, fonte, 100)

  --[[ local r2BrasilErro = display.newRoundedRect(grupoBrasilErro, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2BrasilErro:setFillColor(0, 70/255, 0) 
  r2BrasilErro.strokeWidth=15
  r2BrasilErro:setStrokeColor(8,8,1)

  local r2BrasilErroTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, fonte, 100) ]]

  --[[ local r3Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Brasil:setFillColor(0, 0.4, 0.8) 

  local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, fonte, 100) ]]

  grupoBrasilExplica.alpha = 0

   -- DECLARACAO BRASIL EXPLICA ERRO
 --[[  local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
  bandeiraBrasil.x = x*0.5
  bandeiraBrasil.y = y*0.23 ]]

  local blocoBrasilExplicaErro = display.newRoundedRect(grupoBrasilExplicaErro, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoBrasil.alpha=0.3

  local textoBrasilExplicaErro = display.newText(grupoBrasilExplicaErro, '!', x*0.5, y*0.1, fonte, 120 )
  textoBrasilExplicaErro:setFillColor( 0,0,0 )
  
  local textoBrasilExplicaErro2 = display.newText(grupoBrasilExplicaErro, 'Ambas opções são corretas!!!', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 76  )
  textoBrasilExplica2:setFillColor( 0,0,0 )

  local textoBrasilExplicaErro3 = display.newText(grupoBrasilExplicaErro, 'Tanto a energia solar quanto a eólica não geram grandes impactos ambientais!', x*0.5, y*0.65, x*0.7, y*0.50, fonte, 76  )
  textoBrasilExplica3:setFillColor( 0,0,0 )

  local r1BrasilExplicaErro = display.newRoundedRect(grupoBrasilExplicaErro, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1BrasilExplicaErro:setFillColor(0, 70/255, 0) 
  r1BrasilExplicaErro.strokeWidth=15
  r1BrasilExplicaErro:setStrokeColor(8,8,1)

  local r1BrasilExplicaErroTexto = display.newText(grupoBrasilExplicaErro, 'Vamos lá!', r1BrasilExplicaErro.x, r1BrasilExplicaErro.y, fonte, 100)

  --[[ local r2BrasilErroExplica = display.newRoundedRect(grupoBrasilErroExplica, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2BrasilErroExplica:setFillColor(0, 70/255, 0) 
  r2BrasilErroExplica.strokeWidth=15
  r2BrasilErroExplica:setStrokeColor(8,8,1)

  local r2BrasilErroExplicaTexto = display.newText(grupoBrasilErroExplica, pergunta.BrasilErroExplica.respostas[2], r2BrasilErroExplica.x, r2BrasilErroExplica.y, fonte, 100) ]]

  --[[ local r3BrasilErroExplica = display.newRoundedRect(grupoBrasilErroExplica, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3BrasilErroExplica:setFillColor(0, 0.4, 0.8) 

  local r3BrasilErroExplicaTexto = display.newText(grupoBrasilErroExplica, pergunta.BrasilErroExplica.respostas[3], r3BrasilErroExplica.x, r3BrasilErroExplica.y, fonte, 100) ]]

  grupoBrasilExplicaErro.alpha = 0

  

  -- DECLARACAO VENEZUELA
 --[[  local bandeiraVenezuela = display.newImageRect( grupoVenezuela, pergunta.venezuela.bandeira, x*0.5, x*0.5 )
  bandeiraVenezuela.x = x*0.5
  bandeiraVenezuela.y = y*0.23]]

  local blocoVenezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.46, x*0.8, y*0.62, 120  )
  blocoVenezuela.alpha=0.3
 
  local textoVenezuela = display.newText(grupoVenezuela, 'Questão 3', x*0.5, y*0.1, fonte, 120 )
  textoVenezuela:setFillColor( 0,0,0 )
  
  local textoVenezuela2 = display.newText(grupoVenezuela, 'Após descobrir qual a melhor forma de descartar as cascas, oão foi até sua lavoura e percebeu que havia um ataque de insetos na sua plantação de morangos.', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoVenezuela2:setFillColor( 0,0,0 )

  local textoVenezuela3 = display.newText(grupoVenezuela, 'Ele deve utilizar agrotóxico?', x*0.5, y*0.72, x*0.7, y*0.50, fonte, 67  )
  textoVenezuela3:setFillColor( 0,0,0 )

  local r1Venezuela = display.newRoundedRect(grupoVenezuela,  x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1Venezuela:setFillColor(0, 70/255, 0) 
  r1Venezuela.strokeWidth=15
  r1Venezuela:setStrokeColor(8,8,1)

  local r1VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[1], r1Venezuela.x, r1Venezuela.y, fonte, 100 )
 
  
  local r2Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.71, x*0.71, y*0.09, 100  )
  r2Venezuela:setFillColor(0, 70/255, 0) 
  r2Venezuela.strokeWidth=15
  r2Venezuela:setStrokeColor(8,8,1)

  local r2VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[2], r2Venezuela.x, r2Venezuela.y, fonte, 100)

  --[[ local r3Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Venezuela:setFillColor(0, 0.4, 0.8) 

  local r3VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[3], r3Venezuela.x, r3Venezuela.y, fonte, 100) ]]

  grupoVenezuela.alpha = 0

  -- DECLARACAO VENEZUELA Explica
 --[[  local bandeiraVenezuela = display.newImageRect( grupoVenezuela, pergunta.venezuela.bandeira, x*0.5, x*0.5 )
  bandeiraVenezuela.x = x*0.5
  bandeiraVenezuela.y = y*0.23]]

  local blocoVenezuelaExplica = display.newRoundedRect(grupoVenezuelaExplica, x*0.5, y*0.46, x*0.8, y*0.62, 120  )
  blocoVenezuelaExplica.alpha=0.3

  local textoVenezuelaExplica = display.newText(grupoVenezuelaExplica, 'Ótimo!!', x*0.5, y*0.1, fonte, 120 )
  textoVenezuelaExplica:setFillColor( 0,0,0 )

  local textoVenezuelaExplica2 = display.newText(grupoVenezuelaExplica, 'Devemos evitar agrotóxicos! O foco da produção de alimentos é ser o mais orgânica possível e, sendo assim, é benéfica tanto para a produção quanto o meio ambiente!', x*0.5, y*0.69, x*0.7, y*0.98, fonte, 67  )
  textoVenezuelaExplica2:setFillColor( 0,0,0 )

  local textoVenezuelaExplica3 = display.newText(grupoVenezuelaExplica, '', x*0.5, y*0.65, x*0.7, y*0.50, fonte, 76  )
  textoVenezuelaExplica3:setFillColor( 0,0,0 )

  local r1VenezuelaExplica = display.newRoundedRect(grupoVenezuelaExplica,  x*0.5, y*0.71, x*0.71, y*0.09, 100)
  r1VenezuelaExplica:setFillColor(0, 70/255, 0) 
  r1VenezuelaExplica.strokeWidth=15
  r1VenezuelaExplica:setStrokeColor(8,8,1)

  local r1VenezuelaExplicaTexto = display.newText(grupoVenezuelaExplica, 'Vá em frente!', r1VenezuelaExplica.x, r1VenezuelaExplica.y, fonte, 100)
  
  
  --[[ local r2VenezuelaExplica = display.newRoundedRect(grupoVenezuelaExplica, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1Venezuela:setFillColor(0, 70/255, 0) 
  r1Venezuela.strokeWidth=15
  r1Venezuela:setStrokeColor(8,8,1)

  local r2VenezuelaExplicaTexto = display.newText(grupoVenezuelaExplica,  x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2Venezuela:setFillColor(0, 70/255, 0) 
  r2Venezuela.strokeWidth=15
  r2Venezuela:setStrokeColor(8,8,1) ]]

  --[[ local r3Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Venezuela:setFillColor(0, 0.4, 0.8) 

  local r3VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[3], r3Venezuela.x, r3Venezuela.y, fonte, 100) ]]

  grupoVenezuelaExplica.alpha = 0

  -- DECLARACAO VENEZUELA ExplicaErro
 --[[  local bandeiraVenezuela = display.newImageRect( grupoVenezuela, pergunta.venezuela.bandeira, x*0.5, x*0.5 )
  bandeiraVenezuela.x = x*0.5
  bandeiraVenezuela.y = y*0.23]]

  local blocoVenezuelaExplicaErro = display.newRoundedRect(grupoVenezuelaExplicaErro, x*0.5, y*0.46, x*0.8, y*0.62, 120  )
  blocoVenezuelaExplicaErro.alpha=0.3
  
  local textoVenezuelaExplicaErro = display.newText(grupoVenezuelaExplicaErro, 'Poxa!!', x*0.5, y*0.1, fonte, 120 )
  textoVenezuelaExplicaErro:setFillColor( 0,0,0 )
  
  local textoVenezuelaExplicaErro2 = display.newText(grupoVenezuelaExplicaErro, 'Produtos químicos tem em sua composição elementos tóxicos que causam degradação ao ecossistema.', x*0.5, y*0.67, x*0.7, y*0.98, fonte, 67  )
  textoVenezuelaExplicaErro2:setFillColor( 0,0,0 )

  local textoVenezuelaExplicaErro3 = display.newText(grupoVenezuelaExplicaErro, 'Se temos a opção de um produto que não agride o meio ambiente, devemos optar por este!', x*0.5, y*0.68, x*0.7, y*0.50, fonte, 67  )
  textoVenezuelaExplicaErro3:setFillColor( 0,0,0 )

  local r1VenezuelaExplicaErro = display.newRoundedRect(grupoVenezuelaExplicaErro, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1VenezuelaExplicaErro:setFillColor(0, 70/255, 0) 
  r1VenezuelaExplicaErro.strokeWidth=15
  r1VenezuelaExplicaErro:setStrokeColor(8,8,1)

  local r1VenezuelaExplicaErro = display.newText(grupoVenezuelaExplicaErro, 'Bora lá!', r1VenezuelaExplicaErro.x, r1VenezuelaExplicaErro.y, fonte, 100)
  
  
  --[[ local r2VenezuelaExplicaErro = display.newRoundedRect(grupoVenezuelaExplicaErro, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1Venezuela:setFillColor(0, 70/255, 0) 
  r1Venezuela.strokeWidth=15
  r1Venezuela:setStrokeColor(8,8,1)

  local r2VenezuelaExplicaErroTexto = display.newText(grupoVenezuelaExplicaErro,  x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2Venezuela:setFillColor(0, 70/255, 0) 
  r2Venezuela.strokeWidth=15
  r2Venezuela:setStrokeColor(8,8,1) ]]

  --[[ local r3Venezuela = display.newRoundedRect(grupoVenezuela, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Venezuela:setFillColor(0, 0.4, 0.8) 

  local r3VenezuelaTexto = display.newText(grupoVenezuela, pergunta.venezuela.respostas[3], r3Venezuela.x, r3Venezuela.y, fonte, 100) ]]

  grupoVenezuelaExplicaErro.alpha = 0


  -- DECLARACAO MEXICO
  --[[ local bandeiraMexico = display.newImageRect( grupoMexico, pergunta.mexico.bandeira, x*0.5, x*0.5 )
  bandeiraMexico.x = x*0.5
  bandeiraMexico.y = y*0.23 ]]

  local blocoMexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoMexico.alpha=0.3

  local textoMexico = display.newText(grupoMexico, 'Questão 4', x*0.5, y*0.1, fonte, 120 )
  textoMexico:setFillColor( 0,0,0 )
  
  local textoMexico2 = display.newText(grupoMexico, 'João não tem certeza como descartar o óleo de cozinha, ', x*0.5, y*0.68, x*0.7, y*0.98, fonte, 67  )
  textoMexico2:setFillColor( 0,0,0 )

  local textoMexico3 = display.newText(grupoMexico, 'Ele deve: a) Descartar no lixo comum, ou b) Destinar a um ponto de coleta específico de óleo ?', x*0.5, y*0.61, x*0.7, y*0.50, fonte, 67  )
  textoMexico3:setFillColor( 0,0,0 )

  local r1Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.61, x*0.71, y*0.09, 100 )
  r1Mexico:setFillColor(0, 70/255, 0) 
  r1Mexico.strokeWidth=15
  r1Mexico:setStrokeColor(8,8,1)

  local r1MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[1], r1Mexico.x, r1Mexico.y, fonte, 100)

  local r2Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r2Mexico:setFillColor(0, 70/255, 0) 
  r2Mexico.strokeWidth=15
  r2Mexico:setStrokeColor(8,8,1)

  local r2MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[2], r2Mexico.x, r2Mexico.y, fonte, 100)

  --[[ local r3Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Mexico:setFillColor(0, 0.4, 0.8) 

  local r3MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[3], r3Mexico.x, r3Mexico.y, fonte, 100) ]]

  grupoMexico.alpha = 0

  -- DECLARACAO MEXICO Explica
  --[[ local bandeiraMexico = display.newImageRect( grupoMexico, pergunta.mexico.bandeira, x*0.5, x*0.5 )
  bandeiraMexico.x = x*0.5
  bandeiraMexico.y = y*0.23 ]]

  local blocoMexicoExplica = display.newRoundedRect(grupoMexicoExplica, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoMexicoExplica.alpha=0.3

  local textoMexicoExplica = display.newText(grupoMexicoExplica, 'Beleza!!', x*0.5, y*0.1, fonte, 120 )
  textoMexicoExplica:setFillColor( 0,0,0 )
  
  local textoMexicoExplica2 = display.newText(grupoMexicoExplica, 'Destinar a um ponto de coleta específico de óleo garante que o mesmo tenha o tratamento adequado.', x*0.5, y*0.71, x*0.7, y*0.98, fonte, 67  )
  textoMexicoExplica2:setFillColor( 0,0,0 )

 --[[  local textoMexicoExplica3 = display.newText(grupoMexicoExplica, '', x*0.5, y*0.65, x*0.7, y*0.50, fonte, 76  )
  textoMexicoExplica3:setFillColor( 0,0,0 ) ]]

  local r1MexicoExplica = display.newRoundedRect(grupoMexicoExplica, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1MexicoExplica:setFillColor(0, 70/255, 0) 
  r1MexicoExplica.strokeWidth=15
  r1MexicoExplica:setStrokeColor(8,8,1)

  local r1MexicoExplicaTexto = display.newText(grupoMexicoExplica, 'Vá em frente!', r1MexicoExplica.x, r1MexicoExplica.y, fonte, 100)
  

  --[[ local r2MexicoExplica = display.newRoundedRect(grupoMexicoExplica, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Mexico:setFillColor(0, 0.4, 0.8) 

  local r2MexicoExplicaTexto = display.newText(grupoMexicoExplica, pergunta.mexico.respostas[2], r2Mexico.x, r2Mexico.y, fonte, 100) ]]

  --[[ local r3Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Mexico:setFillColor(0, 0.4, 0.8) 

  local r3MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[3], r3Mexico.x, r3Mexico.y, fonte, 100) ]]

  grupoMexicoExplica.alpha = 0

  -- DECLARACAO MEXICO ExplicaErro
  --[[ local bandeiraMexico = display.newImageRect( grupoMexico, pergunta.mexico.bandeira, x*0.5, x*0.5 )
  bandeiraMexico.x = x*0.5
  bandeiraMexico.y = y*0.23 ]]

  local blocoMexicoExplicaErro = display.newRoundedRect(grupoMexicoExplicaErro, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoMexicoExplicaErro.alpha=0.3

  local textoMexicoExplicaErro = display.newText(grupoMexicoExplicaErro, 'Não deu :/', x*0.5, y*0.1, fonte, 120 )
  textoMexicoExplicaErro:setFillColor( 0,0,0 )
  
  local textoMexicoExplicaErro2 = display.newText(grupoMexicoExplicaErro, 'Despejar no ralo implica no entupimento de canos, refluxo de esgoto e risco à fauna e flora aquática.', x*0.5, y*0.73, x*0.7, y*0.98, fonte, 67  )
  textoMexicoExplicaErro2:setFillColor( 0,0,0 )

--[[   local textoMexicoExplicaErro3 = display.newText(grupoMexicoExplicaErro, '', x*0.5, y*0.65, x*0.7, y*0.50, fonte, 76  )
  textoMexicoExplicaErro3:setFillColor( 0,0,0 ) ]]

  local r1MexicoExplicaErro = display.newRoundedRect(grupoMexicoExplicaErro,x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1MexicoExplicaErro:setFillColor(0, 70/255, 0) 
  r1MexicoExplicaErro.strokeWidth=15
  r1MexicoExplicaErro:setStrokeColor(8,8,1)

  local r1MexicoExplicaErroTexto = display.newText(grupoMexicoExplicaErro, 'Novamente!!', r1MexicoExplicaErro.x, r1MexicoExplicaErro.y, fonte, 100)

  --[[ local r2MexicoExplicaErro = display.newRoundedRect(grupoMexicoExplicaErro, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Mexico:setFillColor(0, 0.4, 0.8) 

  local r2MexicoExplicaErroTexto = display.newText(grupoMexicoExplicaErro, pergunta.mexico.respostas[2], r2MexicoExplicaErro.x, r2MexicoExplicaErro.y, fonte, 100)
 ]]
  --[[ local r3Mexico = display.newRoundedRect(grupoMexico, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Mexico:setFillColor(0, 0.4, 0.8) 

  local r3MexicoTexto = display.newText(grupoMexico, pergunta.mexico.respostas[3], r3Mexico.x, r3Mexico.y, fonte, 100) ]]

  grupoMexicoExplicaErro.alpha = 0

  -- DECLARACAO PORTUGAL
  --[[ local bandeiraPortugal = display.newImageRect( grupoPortugal, pergunta.portugal.bandeira, x*0.5, x*0.5 )
  bandeiraPortugal.x = x*0.5
  bandeiraPortugal.y = y*0.23 ]]

  local blocoPortugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoPortugal.alpha=0.3

  local textoPortugal = display.newText(grupoPortugal, 'Questão 5 ', x*0.5, y*0.1, fonte, 120 )
  textoPortugal:setFillColor( 0,0,0 )
  
  local textoPortugal2 = display.newText(grupoPortugal, 'João obtém água de uma nascente natural. Depois de uma estiagem, sua fonte de água quase secou. O que João poderia fazer para fortalecer a nascente?', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoPortugal2:setFillColor( 0,0,0 )

  local textoPortugal3 = display.newText(grupoPortugal, 'Derrubar as árvores ou aumentar a mata nativa ?', x*0.5, y*0.69, x*0.7, y*0.50, fonte, 67  )
  textoPortugal3:setFillColor( 0,0,0 )

  local r1Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.61, x*0.71, y*0.09, 100)
  r1Portugal:setFillColor(0, 70/255, 0) 
  r1Portugal.strokeWidth=15
  r1Portugal:setStrokeColor(8,8,1)

  local r1PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[1],  r1Portugal.x, r1Portugal.y, fonte,90 )
  

  local r2Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.71, x*0.71, y*0.09, 110 )
  r2Portugal:setFillColor(0, 70/255, 0) 
  r2Portugal.strokeWidth=15
  r2Portugal:setStrokeColor(8,8,1)

  local r2PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[2], r2Portugal.x, r2Portugal.y, fonte, 90)
  

  --[[ local r3Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Portugal:setFillColor(0, 0.4, 0.8) 

  local r3PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[3], r3Portugal.x, r3Portugal.y, fonte, 100) ]]

  grupoPortugal.alpha = 0

  -- DECLARACAO PORTUGAL Explica
  --[[ local bandeiraPortugal = display.newImageRect( grupoPortugal, pergunta.portugal.bandeira, x*0.5, x*0.5 )
  bandeiraPortugal.x = x*0.5
  bandeiraPortugal.y = y*0.23 ]]

  local blocoPortugalExplica = display.newRoundedRect(grupoPortugalExplica, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoPortugalExplica.alpha=0.3

  local textoPortugalExplica = display.newText(grupoPortugalExplica, 'Show!!', x*0.5, y*0.1, fonte, 120 )
  textoPortugalExplica:setFillColor( 0,0,0 )
  
  local textoPortugalExplica2 = display.newText(grupoPortugalExplica, ' Quando se aumenta a vegetação ao redor de uma nascente de água, aumenta a infiltração de água e mantém a fonte sempre cheia', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoPortugalExplica2:setFillColor( 0,0,0 )

  local textoPortugalExplica3 = display.newText(grupoPortugalExplica, 'Ao desmatar ao redor da nascente, diminui-se drasticamente a infiltração de água na terra. ', x*0.5, y*0.69, x*0.7, y*0.50, fonte, 67  )
  textoPortugalExplica3:setFillColor( 0,0,0 )

  local r1PortugalExplica = display.newRoundedRect(grupoPortugalExplica, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1PortugalExplica:setFillColor(0, 70/255, 0) 
  r1PortugalExplica.strokeWidth=15
  r1PortugalExplica:setStrokeColor(8,8,1)

  local r1PortugalExplicaTexto = display.newText(grupoPortugalExplica, 'Prossiga!', r1PortugalExplica.x, r1PortugalExplica.y, fonte, 100)
  

  --[[ local r2Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Portugal:setFillColor(0, 0.4, 0.8) 

  local r2PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[2], r2Portugal.x, r2Portugal.y, fonte, 100) ]]

  --[[ local r3Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Portugal:setFillColor(0, 0.4, 0.8) 

  local r3PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[3], r3Portugal.x, r3Portugal.y, fonte, 100) ]]

  grupoPortugalExplica.alpha = 0

  -- DECLARACAO PORTUGAL ExplicaErro
  --[[ local bandeiraPortugal = display.newImageRect( grupoPortugal, pergunta.portugal.bandeira, x*0.5, x*0.5 )
  bandeiraPortugal.x = x*0.5
  bandeiraPortugal.y = y*0.23 ]]

  local blocoPortugalExplicaErro = display.newRoundedRect(grupoPortugalExplicaErro, x*0.5, y*0.46, x*0.8, y*0.62, 120 )
  blocoPortugalExplicaErro.alpha=0.3

  local textoPortugalExplicaErro = display.newText(grupoPortugalExplicaErro, 'Não dessa vez', x*0.5, y*0.1, fonte, 120 )
  textoPortugalExplicaErro:setFillColor( 0,0,0 )
  
  local textoPortugalExplicaErro2 = display.newText(grupoPortugalExplicaErro, 'Ao desmatar ao redor da nascente, diminui-se drasticamente a infiltração de água na terra, o que prejudica ainda mais a fonte de água de João.', x*0.5, y*0.65, x*0.7, y*0.98, fonte, 67  )
  textoPortugalExplicaErro2:setFillColor( 0,0,0 )

  local textoPortugalExplicaErro3 = display.newText(grupoPortugalExplicaErro, 'Mais mata ao redor da nascente é garantia de manter a fonte sempre cheia.', x*0.5, y*0.71, x*0.7, y*0.50, fonte, 67  )
  textoPortugalExplicaErro3:setFillColor( 0,0,0 )

  local r1PortugalExplicaErro = display.newRoundedRect(grupoPortugalExplicaErro, x*0.5, y*0.71, x*0.71, y*0.09, 100 )
  r1PortugalExplicaErro:setFillColor(0, 70/255, 0) 
  r1PortugalExplicaErro.strokeWidth=15
  r1PortugalExplicaErro:setStrokeColor(8,8,1)
  

  local r1PortugalExplicaErroTexto = display.newText(grupoPortugalExplicaErro, 'Prossiga!', r1PortugalExplicaErro.x, r1PortugalExplicaErro.y, fonte, 100)
  

 --[[  local r2Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Portugal:setFillColor(0, 0.4, 0.8) 

  local r2PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[2], r2Portugal.x, r2Portugal.y, fonte, 100) ]]

  --[[ local r3Portugal = display.newRoundedRect(grupoPortugal, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Portugal:setFillColor(0, 0.4, 0.8) 

  local r3PortugalTexto = display.newText(grupoPortugal, pergunta.portugal.respostas[3], r3Portugal.x, r3Portugal.y, fonte, 100) ]]

  grupoPortugalExplicaErro.alpha = 0





  -- DECLARACAO DAS FUNCIONALIDADES
  ---- verificaChina 
  function verificaChina( event )
    if event.phase == 'began' and grupoChina.alpha == 1 and limitaToque == true then
      if event.target == r1China then --[[ r1 ]]
        r1China:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoChina, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoChinaExplica, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


      elseif event.target == r2China then
        r2China:setFillColor(0.7, 0, 0) --[[ r2 ]]
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoChina, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoChinaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


     --[[  elseif event.target == r3China then  
        r3China:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1China:addEventListener('touch', verificaChina)
  r2China:addEventListener('touch', verificaChina)
  --[[ r3China:addEventListener('touch', verificaChina) desativado+ ]]

   ---- verificaChina Explica
  function verificaChinaExplica( event )
    if event.phase == 'began' and grupoChinaExplica.alpha == 1 and limitaToque == true then
      if event.target == r1ChinaExplica then
        r1ChinaExplica:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoChinaExplica, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasil, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


     --[[  elseif event.target == r2China then
        r2China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3China then  
        r3China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )
 ]]
      end
    end
  end

  r1ChinaExplica:addEventListener('touch', verificaChinaExplica)
  --[[ r2ChinaExplica:addEventListener('touch', verificaChinaExplica) ]]
  --[[ r3China:addEventListener('touch', verificaChina) ]]

 ---- verificaChina Explica Erro
  function verificaChinaExplicaErro( event )
    if event.phase == 'began' and grupoChinaExplicaErro.alpha == 1 and limitaToque == true then
      if event.target == r1ChinaExplicaErro then
        r1ChinaExplicaErro:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoChinaExplicaErro, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoChina, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

--[[ 
      elseif event.target == r2China then
        r2China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3China then  
        r3China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1ChinaExplicaErro:addEventListener('touch', verificaChinaExplicaErro)
  --[[ r2ChinaExplica:addEventListener('touch', verificaChinaExplica) ]]
  --[[ r3China:addEventListener('touch', verificaChina) ]]

 -- verificaBrasil
  function verificaBrasil( event )
    if event.phase == 'began' and grupoBrasil.alpha == 1 and limitaToque == true then
      if event.target == r1Brasil then
        r1Brasil:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )

        timer.performWithDelay( 1000, function()
          transition.to( grupoBrasil, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasilExplica, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r2Brasil then
        r2Brasil:setFillColor(0, 0.7, 0) --[[ r2 ]]
        
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoBrasil, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasilExplica, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      --[[ elseif event.target == r3Brasil then
        r3Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1Brasil:addEventListener('touch', verificaBrasil)
  r2Brasil:addEventListener('touch', verificaBrasil)
  --[[ r3Brasil:addEventListener('touch', verificaBrasil) ]]

  -- verificaBrasil Explica
  function verificaBrasilExplica( event )
    if event.phase == 'began' and grupoBrasilExplica.alpha == 1 and limitaToque == true then
      if event.target == r1BrasilExplica then
        r1BrasilExplica:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )

        timer.performWithDelay( 1000, function()
          transition.to( grupoBrasilExplica, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuela, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

     --[[  elseif event.target == r2Brasil then
        r2Brasil:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoBrasil, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoChinaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 ) ]]

      --[[ elseif event.target == r3Brasil then
        r3Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1BrasilExplica:addEventListener('touch', verificaBrasilExplica)
 --[[  r2Brasil:addEventListener('touch', verificaBrasil) ]]
  --[[ r3Brasil:addEventListener('touch', verificaBrasil) ]]

  -- verificaBrasil Explica Erro
  function verificaBrasilExplicaErro( event )
    if event.phase == 'began' and grupoBrasilExplicaErro.alpha == 1 and limitaToque == true then
      if event.target == r1BrasilExplicaErro then
        r1BrasilExplicaErro:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        audio.play( audioCerto )

        timer.performWithDelay( 1000, function()
          transition.to( grupoBrasilExplicaErro, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasil, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

     --[[  elseif event.target == r2Brasil then
        r2Brasil:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoBrasil, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoChinaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 ) ]]

      --[[ elseif event.target == r3Brasil then
        r3Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1BrasilExplicaErro:addEventListener('touch', verificaBrasilExplicaErro)
 --[[  r2Brasil:addEventListener('touch', verificaBrasil) ]]
  --[[ r3Brasil:addEventListener('touch', verificaBrasil) ]]

--- verificaVenezuela
  function verificaVenezuela( event )
    if event.phase == 'began' and grupoVenezuela.alpha == 1 and limitaToque == true then
      if event.target == r1Venezuela then
        r1Venezuela:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoVenezuela, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuelaExplica, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      elseif event.target == r2Venezuela then
        r2Venezuela:setFillColor(0.7, 0, 0) --[[ r2 ]]
        diminuiTempo()
        audio.play( audioErro )
        
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoVenezuela, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuelaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      --[[ elseif event.target == r3Venezuela then
        r3Venezuela:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1Venezuela:addEventListener('touch', verificaVenezuela)
  r2Venezuela:addEventListener('touch', verificaVenezuela)
  --[[ r3Venezuela:addEventListener('touch', verificaVenezuela) ]]

  --- verificaVenezuela Explica
  function verificaVenezuelaExplica( event )
    if event.phase == 'began' and grupoVenezuelaExplica.alpha == 1 and limitaToque == true then
      if event.target == r1VenezuelaExplica then
        r1VenezuelaExplica:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoVenezuelaExplica, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoMexico, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

      --[[ elseif event.target == r2Venezuela then
        r2Venezuela:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoVenezuela, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuelaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )  ]]

      --[[ elseif event.target == r3Venezuela then
        r3Venezuela:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1VenezuelaExplica:addEventListener('touch', verificaVenezuelaExplica)
  --[[ r2Venezuela:addEventListener('touch', verificaVenezuela) ]]
  --[[ r3Venezuela:addEventListener('touch', verificaVenezuela) ]]

  --- verificaVenezuela ExplicaErro
  function verificaVenezuelaExplicaErro( event )
    if event.phase == 'began' and grupoVenezuelaExplicaErro.alpha == 1 and limitaToque == true then
      if event.target == r1VenezuelaExplicaErro then
        r1VenezuelaExplicaErro:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false

        timer.performWithDelay( 1000, function()
          transition.to( grupoVenezuelaExplicaErro, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuela, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )

     --[[  elseif event.target == r2Venezuela then
        r2Venezuela:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoVenezuela, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVenezuelaExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 ) ]]

      --[[ elseif event.target == r3Venezuela then
        r3Venezuela:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 ) ]]

      end
    end
  end

  r1VenezuelaExplicaErro:addEventListener('touch', verificaVenezuelaExplicaErro)
  --[[ r2Venezuela:addEventListener('touch', verificaVenezuela) ]]
  --[[ r3Venezuela:addEventListener('touch', verificaVenezuela) ]]


  function verificaMexico( event )
    if event.phase == 'began' and grupoMexico.alpha == 1 and limitaToque == true then
      if event.target == r1Mexico then
        r1Mexico:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 1000, function()
          transition.to( grupoMexico, {
            time = 500,
            alpha = 0,
                  onComplete = function()
                  transition.to( grupoMexicoExplicaErro, {
                    time = 500,
                    alpha = 1
                  } )
                  limitaToque = true
                end
              })
            end, 1 )


      elseif event.target == r2Mexico then
        r2Mexico:setFillColor(0, 0.7, 0) --[[ r2 ]]
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoMexico, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoMexicoExplica, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )
--[[ 
      elseif event.target == r3Mexico then
        r3Mexico:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false ]]

       

      end
    end
  end

  r1Mexico:addEventListener('touch', verificaMexico)
  r2Mexico:addEventListener('touch', verificaMexico)
  --[[ r3Mexico:addEventListener('touch', verificaMexico) ]]

 -- verificaMexicoExplica
  function verificaMexicoExplica( event )
    if event.phase == 'began' and grupoMexicoExplica.alpha == 1 and limitaToque == true then
      if event.target == r1MexicoExplica then
        r1MexicoExplica:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 1000, function()
          transition.to( grupoMexicoExplica, {
            time = 500,
            alpha = 0,
                  onComplete = function()
                  transition.to( grupoPortugal, {
                    time = 500,
                    alpha = 1
                  } )
                  limitaToque = true
                end
              })
            end, 1 )


      --[[ elseif event.target == r2Mexico then
        r2Mexico:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoMexico, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoMexicoExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 ) ]]
--[[ 
      elseif event.target == r3Mexico then
        r3Mexico:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false ]]

       

      end
    end
  end

  r1MexicoExplica:addEventListener('touch', verificaMexicoExplica)
  --[[ r2Mexico:addEventListener('touch', verificaMexico) ]]
  --[[ r3Mexico:addEventListener('touch', verificaMexico) ]]

  -- verificaMexicoExplicaErro
  function verificaMexicoExplicaErro( event )
    if event.phase == 'began' and grupoMexicoExplicaErro.alpha == 1 and limitaToque == true then
      if event.target == r1MexicoExplicaErro then
        r1MexicoExplicaErro:setFillColor(0, 0.7, 0)
        --[[ diminuiTempo() ]]
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 1000, function()
          transition.to( grupoMexicoExplicaErro, {
            time = 500,
            alpha = 0,
                  onComplete = function()
                  transition.to( grupoMexico, {
                    time = 500,
                    alpha = 1
                  } )
                  limitaToque = true
                end
              })
            end, 1 )


      --[[ elseif event.target == r2Mexico then
        r2Mexico:setFillColor(0.7, 0, 0) 
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          transition.to( grupoMexico, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoMexicoExplicaErro, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 ) ]]
--[[ 
      elseif event.target == r3Mexico then
        r3Mexico:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false ]]

       

      end
    end
  end

  r1MexicoExplicaErro:addEventListener('touch', verificaMexicoExplicaErro)
  --[[ r2Mexico:addEventListener('touch', verificaMexico) ]]
  --[[ r3Mexico:addEventListener('touch', verificaMexico) ]]

  

--verificaPortugal
function verificaPortugal( event )
  if event.phase == 'began' and grupoPortugal.alpha == 1 and limitaToque == true then
    if event.target == r1Portugal then --[[ r1 ]]
      r1Portugal:setFillColor(0.7, 0, 0)
     
      limitaToque = false
      audio.play( audioErro )
      diminuiTempo()
      timer.performWithDelay( 1000, function()
        transition.to( grupoPortugal, {
          time = 500,
          alpha = 0,
          onComplete = function()
            transition.to( grupoPortugalExplicaErro, {
              time = 500,
              alpha = 1
            } )
            limitaToque = true
          end
        })
      end, 1 )


    elseif event.target == r2Portugal then
      r2Portugal:setFillColor(0, 0.7, 0) --[[ r2 ]]
      adicionaTempo()
      audio.play( audioCerto )
      limitaToque = false
  
      timer.performWithDelay( 300, function()
        transition.to( grupoPortugal, {
          time = 500,
          alpha = 0,
          onComplete = function()
            transition.to( grupoPortugalExplica, {
              time = 500,
              alpha = 1
            } )
            limitaToque = true
          end
        })
      end, 1 )


   --[[  elseif event.target == r3Portugal then  
      r3Portugal:setFillColor(0.7, 0, 0) 
      diminuiTempo()
      audio.play( audioErro )
      limitaToque = false
      timer.performWithDelay( 300, function()
        limitaToque = true
      end , 1 ) ]]

    end
  end
end

r1Portugal:addEventListener('touch', verificaPortugal)
r2Portugal:addEventListener('touch', verificaPortugal)
--[[ r3China:addEventListener('touch', verificaChina) desativado+ ]]


  --verificaPortugalExplica
  function verificaPortugalExplica( event )
    if event.phase == 'began' and grupoPortugalExplica.alpha == 1 and limitaToque == true then
      if event.target == r1PortugalExplica then
        r1PortugalExplica:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 1000, function()
          transition.to( grupoPortugalExplica, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoVitoria, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


      --[[ elseif event.target == r2Portugal then
        r2Portugal:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
          timer.performWithDelay( 1000, function()
            transition.to( grupoPortugal, {
              time = 500,
              alpha = 0,
              onComplete = function()
                transition.to( grupoPortugalExplicaErro, {
                  time = 500,
                  alpha = 1
                } )
                limitaToque = true
              end
            })
          end, 1 ) ]]

      --[[ elseif event.target == r3Portugal then
        r3Portugal:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
 ]]
       

      end
    end
  end

  r1PortugalExplica:addEventListener('touch', verificaPortugalExplica)
 --[[  r2Portugal:addEventListener('touch', verificaPortugal) ]]
  --[[ r3Portugal:addEventListener('touch', verificaPortugal) ]]

  --verificaPortugalExplicaErro
  function verificaPortugalExplicaErro( event )
    if event.phase == 'began' and grupoPortugalExplicaErro.alpha == 1 and limitaToque == true then
      if event.target == r1PortugalExplicaErro then
        r1PortugalExplicaErro:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
        timer.performWithDelay( 1000, function()
          transition.to( grupoPortugalExplicaErro, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoPortugal, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


     --[[  elseif event.target == r2Portugal then
        r2Portugal:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
          timer.performWithDelay( 1000, function()
            transition.to( grupoPortugal, {
              time = 500,
              alpha = 0,
              onComplete = function()
                transition.to( grupoPortugalExplicaErro, {
                  time = 500,
                  alpha = 1
                } )
                limitaToque = true
              end
            })
          end, 1 ) ]]

      --[[ elseif event.target == r3Portugal then
        r3Portugal:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto )
        limitaToque = false
 ]]
       

      end
    end
  end

  r1PortugalExplicaErro:addEventListener('touch', verificaPortugalExplicaErro)
  --[[ r2Portugal:addEventListener('touch', verificaPortugal) ]]
  --[[ r3Portugal:addEventListener('touch', verificaPortugal) ]]


  function atualizaTempo()
    if tempo > 0 and grupoVitoria.alpha == 0 then
      tempo = tempo - 1
      tempoTexto.text = tempo
    end
  end
  timer.performWithDelay( 1000, atualizaTempo, 0 )
  
  function adicionaTempo()
    if tempo > 0 then
      tempo = tempo + 10
      tempoTexto.text = tempo
    end
  end

  function diminuiTempo()
    if tempo >= 5 then
      tempo = tempo - 5
      tempoTexto.text = tempo

    elseif tempo < 5 then
      tempo = 0
      tempoTexto.text = tempo
    end
  end

  function verificaTempo()
    if tempo == 0 then
      grupoDerrota.alpha = 1
      grupoBrasil.alpha = 0
      grupoChina.alpha = 0
    end
  end
  Runtime:addEventListener('enterFrame', verificaTempo )

  function reinicia()
    composer.removeScene( 'cenas.jogo' )
  end

  function derrota( event )
    if event.phase == 'began' and grupoDerrota.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.menu' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoDerrota:addEventListener('touch', derrota)


  function vitoria( event )
    if event.phase == 'began' and grupoVitoria.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.creditos' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoVitoria:addEventListener('touch', vitoria)



end
cena:addEventListener('create', cena)
return cena