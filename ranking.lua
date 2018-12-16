local composer = require("composer")
local scene = composer.newScene( )
local banco = require ('dao.banco')


function irMenu()
composer.gotoScene( "telainicial", "fade", 500 )
end	

function scene:create( event )
	local sceneGroup = self.view  
	fundo = display.newImageRect("img/ranking.png", display.actualContentWidth, display.actualContentHeight)
	fundo:toBack()
	fundo.x = display.actualContentWidth/2
	fundo.y = display.actualContentHeight/2.5
	recorde = display.newText("Recorde", 160, display.actualContentWidth * 0.3, native.systemFont, 50)
	recorde:setFillColor(0,0,0)
	pont = display.newText(banco:getPontuacao(), 160, display.actualContentHeight * 0.4, native.systemFont, 70)
	pont:setFillColor(0,0,0)
	pont:toFront()
	voltar = display.newImageRect("img/Voltar.png", 80, 80)
	voltar.x = 250
	voltar.y = 450
	voltar:addEventListener("touch", irMenu)
	sceneGroup:insert(fundo)
	sceneGroup:insert(recorde)
	sceneGroup:insert(pont)
	sceneGroup:insert(voltar)
end

function scene:destroy( event )
	local sceneGroup = self.view
	display.remove(sceneGroup)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

return scene