local composer = require( "composer" )
local scene = composer.newScene()


local w = display.contentWidth
local h = display.contentHeight


function scene:create( event )

	local sceneGroup = self.view

local icone = display.newImageRect("snakeLogo.png",250,70)

icone.x =  w/2
icone.y = 70 

sceneGroup:insert(icone)
self.icone = icone


local buttonPlay = display.newImageRect("playButton.png" ,220,50)


buttonPlay.x =  w/2
buttonPlay.y = h/2

sceneGroup:insert(buttonPlay)
self.buttonPlay = buttonPlay

local buttonRanking = display.newImageRect("rankingButton.png" ,220,50)


buttonRanking.x =  w/2
buttonRanking.y = 300

sceneGroup:insert(buttonRanking
)
self.buttonRanking = buttonRanking


local buttonExit = display.newImageRect("exitButton.png" ,220,50)

buttonExit.x =  w/2
buttonExit.y = 360

sceneGroup:insert(buttonExit)
self.buttonExit = buttonExit

self.buttonPlay:addEventListener("tap", play)
self.buttonRanking:addEventListener("tap", ranking)
self.buttonExit:addEventListener("tap", sair)
	
end

function scene:destroy( event )

	local sceneGroup = self.view
    local phase = event.phase
 
     self.icone:removeSelf()
      self.buttonPlay:removeSelf()
       self.buttonRanking:removeSelf()
        self.buttonExit:removeSelf()
    
end


function play()
	composer.gotoScene( "jogo" )
end

function ranking()
	composer.gotoScene( "ranking" )
end

function sair()
       os.exit()
    end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

return scene