local cenario = {cena = {}, botoes = {{},{},{},{}}}


function cenario:resetCenario()
    cenario.cena = {}
    cenario.botoes = {}
end 
------------Criar Cenário ---------------
function cenario:criarCenario()
posicaoX = 10
posicaoY = -20
    for i = 1, 25 do
        cenario.cena[i] = {}
    end 
    for i = 1, 25 do
        for j = 1, 20 do
            cenario.cena[i][j] = display.newRect(posicaoX, posicaoY, 15, 15)
            posicaoX = posicaoX + 15.8
        end 
        posicaoX = 10
        posicaoY = posicaoY + 15.8
    end
	x = display.actualContentWidth
	y = display.actualContentHeight
	-------Criando os botões-------
    cenario.botoes[1] = display.newImageRect("img/cima.png", 50, 50)
    cenario.botoes[1].x = x * 0.5
    cenario.botoes[1].y = 395
    cenario.botoes[1]:addEventListener("tap", virarCima)
    cenario.botoes[2] = display.newImageRect("img/esquerda.png", 50, 50)
    cenario.botoes[2].x = x * 0.3
    cenario.botoes[2].y = 445
  	cenario.botoes[2]:addEventListener("tap", virarEsquerda)
    cenario.botoes[3] = display.newImageRect("img/baixo.png", 50, 50)
    cenario.botoes[3].x = x * 0.5
    cenario.botoes[3].y = 495
  	cenario.botoes[3]:addEventListener("tap", virarBaixo)
    cenario.botoes[4] = display.newImageRect("img/direita.png", 50, 50)
    cenario.botoes[4].x = x * 0.7
    cenario.botoes[4].y = 445
    cenario.botoes[4]:addEventListener("tap", virarDireita)
end

return cenario