-- title: animating images
--
-- set background
local background = display.newImageRect("Images/ocean2.jpg", 2048, 1536)

-- set scroll speed
scrollSpeed = 3

scrollSpeed2 = 1.4
-- hide the status bar

display.setStatusBar(display.HiddenStatusBar)

-- set fish object
local fish = display.newImageRect("Images/Fish.png", 200, 200)
fish.x = 1
fish.y = display.contentHeight/4

-- direction fish is facing and size
fish.xScale = 2
fish.yScale = 2

-- Function: MoveFish
local function MoveShip(event)
	-- add the  scroll speed
	fish.x = fish.x + scrollSpeed
	fish.y = fish.y + scrollSpeed2
	fish:rotate(-0.2)
end
-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)


--------------------------------------------------------------------------------------------------------------

-- BOAT

scrollSpeed3 = -6
scrollSpeed6 = 2
local boat = display.newImageRect("Images/boat.png", 200, 200)
boat.x = 900
boat.y = display.contentHeight/1.5

-- size of boat
boat.xScale = 2
boat.yScale = 2

-- start boat invisible
boat.alpha = 0

-- MoveBoat
local function MoveBoat(event)
	-- add scroll speed to x value
	boat.x = boat.x + scrollSpeed3
	boat.y = boat.y + scrollSpeed6
	-- fade in
	boat.alpha = boat. alpha + 0.01
	-- grow in size
	boat.xScale = boat.xScale + 0.01
	boat.yScale = boat.yScale + 0.01


end

-- MoveBoat will be called over and over again
Runtime:addEventListener("enterFrame", MoveBoat)


----------------------------------------------------------------------------------------------------------

scrollSpeed4 = -10
scrollSpeed5 = 10

local skidoo = display.newImageRect("Images/skidoo.png", 200, 200)
skidoo.x = 900
skidoo.y = display.contentHeight/5

-- MoveSkidoo
local function MoveSkidoo(event)
	-- add scrollSpeed4 +scrollSpeed5
	skidoo.x = skidoo.x + scrollSpeed4
	skidoo.y = skidoo.y + scrollSpeed5

	-- grow so it looks like its getting closer
	skidoo.xScale = skidoo.xScale + 0.01
	skidoo.yScale = skidoo.yScale + 0.01

end

-- MoveSkidoo will be called over and over again
Runtime:addEventListener("enterFrame", MoveSkidoo)

---------------------------------------------------------------------------------------------------------------

local myTextX = display.contentWidth* 2/5
local myTextY = display.contentHeight/1.5

local myText = display.newText("By: Campbell Woodside", myTextX, myTextY, Arial, 50)
myText:setFillColor(1, 0.2, 0.2)