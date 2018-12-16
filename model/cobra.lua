local cobra = {cabeca = {}, corpo = {}}

function cobra:addTamanho()
	self.tamanho = self.tamanho + 1
end

function cobra:getTamanho()
	return self.tamanho
end

function cobra:crescer(event)
	retan = display.newRect(cobra.cabeca[1].x, cobra.cabeca[1].y, 15, 15)
	retan:setFillColor(0,0,0)
	table.insert(cobra.corpo, retan)
end	

function cobra:criarCobra() 
x = display.actualContentWidth
y = display.actualContentHeight
rect = display.newRect(10, 20, 15,15) 
cobra.cabeca[1] = rect
rect:setFillColor(0,0,0)
end

function  cobra:moverCobra(auxX, auxY)
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


function  cobra:movimentacaoInicial()
		cobra.cabeca[1].x = cobra.cabeca[1].x + 15.8
end


return cobra