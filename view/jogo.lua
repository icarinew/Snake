local composer = require("composer")
local scene = composer.newScene()
local banco = require ('dao.banco')

function scene:create( event )
    local sceneGroup = self.view
	parou = false
	velocidade = 1000
    jogador = require ('model.jogador')
 	cobra = {cabeca = {1}, corpo = {}}
 	cobra = require("model.cobra")
	cenario = {cena = {}, botoes = {}}
	cenario = require("view.cenario")
    maca = require("model.maca")
    --------- Verifica pontuação e aumenta velocidade----------
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
	function virarDireita(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
		----verifica se deu gameOver-----
		testeLimite(parou)
		----pausa o movimento anterior e inicia um novo com a nova direção----
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarDireita, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		----verifica se a cabeça está na mesma posição que a maça e remove se sim----
	    maca:sumirMaca(cobra, jogador)
	end

	function virarEsquerda(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].x = cobra.cabeca[1].x - 15.8
		testeLimite(parou)
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarEsquerda, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end

	function virarCima(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].y = cobra.cabeca[1].y - 15.8
		testeLimite(parou)
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarCima, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end

	function virarBaixo(event)
		xAnterior = cobra.cabeca[1].x
		yAnterior = cobra.cabeca[1].y
		cobra.cabeca[1].y = cobra.cabeca[1].y + 15.8
		testeLimite(parou)
		timer.pause(movIn)
		movIn = timer.performWithDelay(velocidade, virarBaixo, 0)
		cobra:moverCobra(xAnterior, yAnterior)
		maca:sumirMaca(cobra, jogador)
	end
	----------------------------------------------------
	------------------Teste limite ----------------------
	function testeLimite(parou)
		if parou == true then
			
		else	
			if cobra.cabeca[1].x > cenario.cena[1][20].x + 7.5 or cobra.cabeca[1].x < cenario.cena[1][1].x - 7.5  then
				gameOver()
			elseif cobra.cabeca[1].y > cenario.cena[25][1].y + 7.5 or cobra.cabeca[1].y < cenario.cena[1][1].y - 7.5 then
				gameOver() 
			end		
		end	
	end	
	----------------------------------------------------
	---------------------Game over ---------------------
	function gameOver()
		parou = true
		print("Game over")
		x = display.actualContentWidth
		y = display.actualContentHeight
		banco:atualizarPontuacao(jogador:getPontuacao())
		jogador:resetJogador()
		cenario:resetCenario()
		composer.removeScene("view.jogo", false)
		composer.gotoScene("view.ranking")
	end	

	-------------------------------------------------------
	function mostrarPontuacao()
		pontTela = display.newText(jogador:getPontuacao(), 10, 445)
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
	for i = 1, #cobra.corpo do
		sceneGroup:insert(cobra.corpo[i])
	end
	for i = 1, #cenario.cena do
		for j = 1, #cenario.cena[i] do
		sceneGroup:insert(cenario.cena[i][j])
		end
	end
	for i = 1, #cenario.botoes do
		sceneGroup:insert(cenario.botoes[i])
	end	
	sceneGroup:insert(pontTela)
	sceneGroup:insert(maca[1])
	sceneGroup:insert(cobra.cabeca[1])
end					 
function scene:destroy( event )
	local sceneGroup = self.view
	display.remove(sceneGroup)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )


return scene