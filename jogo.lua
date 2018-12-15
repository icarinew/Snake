local composer = require("composer")
local scene = composer.newScene()


function scene:create( event )

    print("entrou no creat")

    local sceneGroup = self.view

posicaoX = 10
posicaoY = 20
	for i = 1, 25 do
		cena[i] = {}
	end	
	for i = 1, 25 do
		for j = 1, 20 do
			cena[i][j] = display.newRect(posicaoX, posicaoY, 15, 15)
			posicaoX = posicaoX + 15.8
		end	
		posicaoX = 10
		posicaoY = posicaoY + 15.8
	

	x = display.actualContentWidth
	y = display.actualContentHeight
	
    cima = display.newRect(x * 0.5, 425, 50, 25)
    cima:addEventListener("tap", virarCima)
    direita = display.newRect(x * 0.3, 450, 50, 25)
  	direita:addEventListener("tap", virarDireita)
    baixo = display.newRect(x * 0.5, 480, 50, 25)
  	baixo:addEventListener("tap", virarBaixo)
    esquerda = display.newRect(x * 0.7, 450, 50, 25)
    esquerda:addEventListener("tap", virarEsquerda)
	x = display.actualContentWidth
y = display.actualContentHeight

rect = display.newRect(10, 20, 15,15) 
cobra.cabeca[1] = rect
rect:setFillColor(0,0,0)
end

-------------------------------------------
------------Criar Cenário -----------------
-------------------------------------------
--------------Criar cobra -----------------

------------------Mostrar maça----------------------
function aparecerMaca()
	x = math.random(2,24)
	y = math.random(2, 19)
	maca = display.newRect(cena[x][y].x, cena[x][y].y, 15, 15)
	maca:setFillColor(1,0,0)
end
end
--local bd = require("bd")
cena = {}
cobra = {cabeca = {}, corpo = {}}
pontuacao = 0
velocidade = 1000

function verfVelocidade()
	if pontuacao <= 2 then
		velocidade = 1000
	elseif pontuacao >= 3 and pontuacao < 6 then
		velocidade = 500 
	else 	
		velocidade = 250
	end
end	
--------------Criar botões-----------------
-------------------------------------------
----------Movimentação da cabeça-----------
function virarEsquerda(event)
	xAnterior = cobra.cabeca[1].x
	yAnterior = cobra.cabeca[1].y
	--if event.phase == "began" then
	cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
	testeLimite()
	timer.pause(movIn)
	movIn = timer.performWithDelay(velocidade, virarEsquerda, 0)
	moverCobra(xAnterior, yAnterior)
    sumirMaca()
	--end
end


function virarDireita(event)
	xAnterior = cobra.cabeca[1].x
	yAnterior = cobra.cabeca[1].y
	--if event.phase == "began" then
	cobra.cabeca[1].x = cobra.cabeca[1].x - 15.8
	testeLimite()
	timer.pause(movIn)
	movIn = timer.performWithDelay(velocidade, virarDireita, 0)
	moverCobra(xAnterior, yAnterior)
	sumirMaca()
	--end
end

function virarCima(event)
	xAnterior = cobra.cabeca[1].x
	yAnterior = cobra.cabeca[1].y
	--if event.phase == "began" then
	cobra.cabeca[1].y = cobra.cabeca[1].y - 15.8
	testeLimite()
	timer.pause(movIn)
	movIn = timer.performWithDelay(velocidade, virarCima, 0)
	moverCobra(xAnterior, yAnterior)
	sumirMaca()
	--end
end

function virarBaixo(event)
	xAnterior = cobra.cabeca[1].x
	yAnterior = cobra.cabeca[1].y
	cobra.cabeca[1].y = cobra.cabeca[1].y + 15.8
	testeLimite()
	timer.pause(movIn)
	movIn = timer.performWithDelay(velocidade, virarBaixo, 0)
	moverCobra(xAnterior, yAnterior)
	sumirMaca()
end
----------------------------------------------------
----------------------------------------------------
------------------Desaparecer maça------------------
function sumirMaca()
	if math.floor(cobra.cabeca[1].x) == math.floor(maca.x) 
		and math.floor(cobra.cabeca[1].y) == math.floor(maca.y) then
		display.remove(maca)
		x = math.random(2,24)
		y = math.random(2, 19)
		maca = display.newRect(cena[x][y].x, cena[x][y].y, 15, 15)
		maca:setFillColor(1,0,0)
		display.remove(pontTela)
		somarPontuacao()
		verfVelocidade()
		mostrarPontuacao(pontuacao)
		crescer()
		--aparecerMaca() 
	end	 
end	
----------------------------------------------------
---------------------Crescer cobra------------------
function crescer(event)
	retan = display.newRect(cobra.cabeca[1].x, cobra.cabeca[1].y, 15, 15)
	retan:setFillColor(0,0,0)
	table.insert(cobra.corpo, retan)
end	
----------------------------------------------------
--------------- Linhas limite-----------------------
--[[function linhasLimite()
	linhaCima = display.newLine(0,20,display.actualContentWidth, 20)
	--fisica.addBody(linhaCima, static)
	linhaEsquerda= display.newLine(0,20,0, 316)
	--fisica.addBody(linhaEsquerda, static)
	linhaBaixo = display.newLine(0, 316, display.actualContentWidth, 316)
	--fisica.addBody(linhaBaixo, static)
	linhaDireita = direita.newLine(display.actualContentWidth, 20, display.actualContentWidth, 316)
	--fisica.addBody(linhaDireita, static)
end	--]]
----------------------------------------------------
------------------Teste limite ----------------------
function testeLimite()
	if cobra.cabeca[1].x > cena[1][20].x + 7.5 or cobra.cabeca[1].x < cena[1][1].x - 7.5  then
		gameOver()
	elseif cobra.cabeca[1].y > cena[25][1].y + 7.5 or cobra.cabeca[1].y < cena[1][1].y - 7.5 then
		gameOver() 
	end		
	for i = 1, #cobra.corpo do
		if math.floor(cobra.cabeca[1].x) == math.floor(cobra.corpo[i].x) and 
			math.floor(cobra.cabeca[1].y) == math.floor(cobra.corpo[i].y) then
		gameOver()
		end
	end	

end	
----------------------------------------------------
---------------------Game over ---------------------
function gameOver()
	print("Game over")
	x = display.actualContentWidth
	y = display.actualContentHeight
	text = display.newText("GAME OVER", x/2, y/2, native.systemFontBold,35)
	text:setFillColor(1,0,0)
	--bd:Insere(pontuacao)
	text:toFront()
	--composer.gotoScene("telaInicial")
end	
----------------------------------------------------
----------------Movimentar corpo--------------------
function  moverCobra(auxX, auxY)
	print("primeiro X"..auxX)
	print("primeiro y"..auxY)
	for i = 1, #cobra.corpo do
		auxX2 = cobra.corpo[i].x
		auxY2 = cobra.corpo[i].y
		cobra.corpo[i].x = auxX
		cobra.corpo[i].y = auxY
		auxX = auxX2
		auxY = auxY2
		print("seg X"..cobra.corpo[i].x)
		print("segun Y"..cobra.corpo[i].y)

	end	
end

---------------
-------------------------------------------------------
--------------------Movimentação inicial---------------
function movimentacaoInicial()
	timer.performWithDelay(100, virarDireita, 0)
end
-------------------------------------------------------
-----------------Movimentação automatica --------------
function movimentacaoAutomatica(direcao)
	if direcao == "direita" then
		timer.performWithDelay(1000, virarDireita, 0)
	elseif direcao == "esquerda" then
		timer.performWithDelay(1000, virarEsquerda, 0)
	elseif	direcao == "cima" then
		timer.performWithDelay(1000, virarCima, 0)
	elseif 	direcao == "baixo" then
		timer.performWithDelay(1000, virarBaixo, 0)
	end	
end	
-------------------------------------------------------
function mostrarPontuacao(pontuacao)
pontTela = display.newText(pontuacao, 100, -25)
end
function somarPontuacao()
pontuacao = pontuacao + 1
end	

-------------------------------------------------------
function iniciarJogo()
	criarCenario()
	criarCobra()
	aparecerMaca()
	movIn = timer.performWithDelay(velocidade, movimentacaoInicial, 0)
end	

function movimentacaoInicial()
	cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
end
     

 function scene:destroy( event )
     local sceneGroup = self.view
        local phase = event.phase



       

            self.cobra.cabeca:removeSelf()
            self.cobra.cabeca = nil

            self.cobra.corpo:removeSelf()
            self.cobra.corpo = nil
        
            self.cena:removeSelf()

        

            

        

   
 end





scene:addEventListener( "create", scene )
--scene:addEventListener( "show", scene )
--scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene

--[[iniciarJogo()
mostrarPontuacao(pontuacao)--]]
