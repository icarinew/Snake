local composer = require( "composer" )
local scene = composer.newScene()

local function irJogo()
	composer.gotoScene( "jogo", "fade", 500 )
end

local function irRanking()
	composer.gotoScene( "ranking", "fade", 500 )
end	

function scene:create(event)
	local sceneGroup = self.view

	local titulo = display.newImageRect("img/Nome.png", display.actualContentWidth, display.actualContentHeight )
	titulo.anchorX = 0
	titulo.anchorY = 0
	titulo.x = 0 + display.screenOriginX 
	titulo.y = 0 + display.screenOriginY
	
	local play = display.newImageRect("img/BotaoPlay.png", 220, 220 )
	play.x = 170
	play.y = 250
	play:addEventListener("touch", irJogo)

	local ranking = display.newImageRect("img/BotaoRanking.png", 155, 155)
	ranking.x = 170
	ranking.y = 400
	ranking:addEventListener("touch", irRanking)

	sceneGroup:insert(titulo)
	sceneGroup:insert(play)
	sceneGroup:insert(ranking)	

end

scene:addEventListener( "create", scene )

return scene