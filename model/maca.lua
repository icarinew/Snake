	local maca = {}


	------------------Mostrar maça----------------------
	function maca:aparecerMaca(cenario)
		x = math.random(2,24)
		y = math.random(2, 19)
		maca[1] = display.newRect(cenario.cena[x][y].x, cenario.cena[x][y].y, 15, 15)
		maca[1]:setFillColor(1,0,0)
	end
	------------------Desaparecer maça------------------
	function maca:sumirMaca(cobra, jogador)
		if math.floor(cobra.cabeca[1].x) == math.floor(maca[1].x) and math.floor(cobra.cabeca[1].y) == math.floor(maca[1].y) then
			display.remove(maca[1])
			x = math.random(2, 24)
			y = math.random(2, 19)
			maca[1] = display.newRect(cenario.cena[x][y].x, cenario.cena[x][y].y, 15, 15)
			maca[1]:setFillColor(1,0,0)
			display.remove(pontTela)
			jogador:somarPontuacao()
			verfVelocidade()
			mostrarPontuacao()
			cobra:crescer()
		end	 
	end	

return maca	