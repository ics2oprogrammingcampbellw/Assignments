-- Title: Fall of Gravity
-- Name: Campbell
-- Course: ICS2O/3C
-- This program...



-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-- Create Scene Object
local scene = composer.newScene( sceneName )

local rocketSound 
local rocketSoundChannel

rocketSoundChannel = audio.play(rocketSound)

local background

local stars

local stars1

local rocket 

local rocket1

local scrollSpeed = -5


-- Function: MoveFish
local function MoveShip()
	-- add the  scroll speed
	rocket.x = rocket.x + scrollSpeed
	
end

Runtime:addEventListener("enterFrame", MoveShip)



local function StopShip()
	if ( rocket.x <= display.contentWidth/2) then

		rocket.isVisible = false
		rocket1.isVisible = true
		composer.gotoScene( "main_menu" )
	end
end

Runtime:addEventListener("enterFrame", StopShip)

local function MoveStars()
	stars:rotate(-50)
end

Runtime:addEventListener("enterFrame", MoveStars)

local function StopStars()
	if (rocket1.isVisible == true) then
		stars.isVisible = false
		stars1.isVisible = true
	end
end
Runtime:addEventListener("enterFrame", StopStars)


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

	rocketSound = audio.loadSound( "Sounds/rocketSounds.mp3" )

	rocketSoundChannel = audio.play(rocketSound)

	background = display.newImageRect("Images/background.png", 2048, 1536)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	background.xScale = .5
	background.yScale = .5

	stars = display.newImageRect("Images/stars.png", 2048, 1536)
	stars.x = display.contentWidth/2
	stars.y = display.contentHeight/2

	stars.xScale = .5
	stars.yScale = .5

	stars1 = display.newImageRect("Images/stars.png", 2048, 1536)
	stars1.x = display.contentWidth/2
	stars1.y = display.contentHeight/2

	stars1.xScale = .5
	stars1.yScale = .5
	stars1.isVisible = false

	rocket = display.newImageRect("Images/Rocket.png", 2048, 1536)
	rocket.x = display.contentWidth/.8
	rocket.y = display.contentHeight/2
	rocket.isVisible = true

	rocket.xScale = .4
	rocket.yScale = .4
	
	rocket1 = display.newImageRect("Images/Rocket.png", 2048, 1536)
	rocket1.x = display.contentWidth/2
	rocket1.y = display.contentHeight/2
	rocket1.xScale = .4
	rocket1.yScale = .4
	
	rocket1.isVisible = false
	



	sceneGroup:insert( background )
	sceneGroup:insert( stars )
	sceneGroup:insert( stars1 )
	sceneGroup:insert( rocket )
	sceneGroup:insert( rocket1 )

end -- function scene:create( event )   



-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        rocket1.isVisible = false
        stars1.isVisible = false
        background.isVisible = false
        rocket.isVisible = false
        stars.isVisible = false
    end

end -- function scene:hide( event )

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
    rocket1:removeSelf()
    stars1:removeSelf()
    background:removeSelf()
    rocket:removeSelf()
    stars:removeSelf()

end -- function scene:destroy( event )





scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene