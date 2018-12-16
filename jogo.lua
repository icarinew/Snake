local composer = require("composer")
local scene = composer.newScene()
local jogador = require ('model.jogador')
local banco = require ('dao.banco')


function scene:create( event )
    local sceneGroup = self.view
	velocidade = 1000
 	cobra = {cabeca = {1}, corpo = {}}
 	cobra = require("model.cobra")
	cenario = {}
	cenario = require("model.cenario")
	maca = {}
    maca = require("model.maca")

	function verfVelocidade()
		if jogador.pontuacao <= 2 then
			velocidade = 1000
		elseif jogador.pontuacao >= 3 and jogador.pontuacao < 6 then
			velocidade = 500 
		else 	
			velocidade = 250
		end
	end	
	----------Movimentação da cabeça-----------
	function virarEsquerda(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
		testeLimite()
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarEsquerda, 0)
		cobra:moverCobra(xAnterior, yAnterior)
	    maca:sumirMaca(cobra, jogador)
	end

	function virarDireita(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].x = cobra.cabeca[1].x - 15.8
		testeLimite()
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarDireita, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end

	function virarCima(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].y = cobra.cabeca[1].y - 15.8
		testeLimite()
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarCima, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end

	function virarBaixo(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].y = cobra.cabeca[1].y + 15.8
		testeLimite()
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarBaixo, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end
	----------------------------------------------------
	function fim()
		composer.gotoScene("ranking")
		composer.removeScene("jogo")
		
	end	
	------------------Teste limite ----------------------
	function testeLimite()
		
		if cobra.cabeca[1].x > cena[1][20].x + 7.5 or cobra.cabeca[1].x < cena[1][1].x - 7.5  then
			gameOver()
			fim()
		elseif cobra.cabeca[1].y > cena[25][1].y + 7.5 or cobra.cabeca[1].y < cena[1][1].y - 7.5 then
			gameOver() 
			fim()

		end		
		for i = 1, #cobra.corpo do
			if math.floor(cobra.cabeca[1].x) == math.floor(cobra.corpo[i].x) and 
				math.floor(cobra.cabeca[1].y) == math.floor(cobra.corpo[i].y) then
					gameOver()
					fim()
			end
		end	

	end	
	----------------------------------------------------
	---------------------Game over ---------------------
	function gameOver()
		print("Game over")
		x = display.actualContentWidth
		y = display.actualContentHeight
		banco:atualizarPontuacao(jogador:getPontuacao())
		jogador:resetJogador()
		composer.removeScene("jogo")
		composer.gotoScene("ranking")
	end	

	-------------------------------------------------------
	function mostrarPontuacao()
		pontTela = display.newText(jogador:getPontuacao(), 100, -25)
	end
	-------------------------------------------------------
	function iniciarJogo()
		cenario:criarCenario()
		cobra:criarCobra()
		maca:aparecerMaca(cenario)
		movIn = timer.performWithDelay(velocidade, movimentacaoInicial, 0)
	end	
    -------------------------------------------------------
	function movimentacaoInicial()
		cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
	end

	-------------------------------------------------------
	iniciarJogo()
	mostrarPontuacao()
	--[[sceneGroup:insert(cobra.cabeca[1])
	sceneGroup:insert(maca[1])
	for i = 1, #cobra.corpo do
		sceneGroup:insert(cenario[i])
	end
	for i = 1, #cenario do
		for j = 1, #cenario[i] do
		sceneGroup:insert(cenario[i][j])
		end
	end--]]
end					 
function scene:destroy( event )
	local sceneGroup = self.view
	display.remove(sceneGroup)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )


return scene