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

local rocketSound = audio.loadSound( "Sounds/rocketSounds.mp3" )
local rocketSoundChannel

rocketSoundChannel = audio.play(rocketSound)

local background = display.newImageRect("Images/background.png", 2048, 1536)
background.x = display.contentWidth/2
background.y = display.contentHeight/2

background.xScale = .5
background.yScale = .5

local stars = display.newImageRect("Images/stars.png", 2048, 1536)
stars.x = display.contentWidth/2
stars.y = display.contentHeight/2

stars.xScale = .5
stars.yScale = .5

local stars1 = display.newImageRect("Images/stars.png", 2048, 1536)
stars1.x = display.contentWidth/2
stars1.y = display.contentHeight/2

stars1.xScale = .5
stars1.yScale = .5
stars1.isVisible = false

local rocket = display.newImageRect("Images/Rocket.png", 2048, 1536)
rocket.x = display.contentWidth/.8
rocket.y = display.contentHeight/2
rocket.isVisible = true

rocket.xScale = .4
rocket.yScale = .4


local scrollSpeed = -5


-- Function: MoveFish
local function MoveShip()
	-- add the  scroll speed
	rocket.x = rocket.x + scrollSpeed
	
end

Runtime:addEventListener("enterFrame", MoveShip)



local rocket1 = display.newImageRect("Images/Rocket.png", 2048, 1536)
rocket1.x = display.contentWidth/2
rocket1.y = display.contentHeight/2
rocket1.xScale = .4
rocket1.yScale = .4

rocket1.isVisible = false

local function StopShip()
	if ( rocket.x <= display.contentWidth/2) then

		rocket.isVisible = false
		rocket1.isVisible = true
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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

composer.gotoScene( "splash_screen" )
return scene