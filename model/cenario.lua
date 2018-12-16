local cenario = {}
cena = {}

function cenario:criarBotoes() 
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
end	

-------------------------------------------
------------Criar Cenário ---------------
function cenario:criarCenario()
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
	end
cenario:criarBotoes()
end


return cenario