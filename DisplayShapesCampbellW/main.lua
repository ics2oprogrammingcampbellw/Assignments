-- Title: DisplayShapes
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays shapes on the iPad of different colours and borders. 
-- Underneath the shape is the name 


-- Triangle
local triangleX = display.contentWidth* 2/14
local triangleY = display.contentHeight/1.3

local triVertices = {0,-100, 150,100, -150,100}
local triangle = display.newPolygon (triangleX, triangleY, triVertices)
triangle:setFillColor(1, 3, 0.2)
---------------------------------------------------------------------------------

--Hexagon
local hexagonX = display.contentWidth* 2/5
local hexagonY = display.contentHeight/2

local hexVertices = { 150,-100, 200,0, 150,100, -150,100, -200,0, -150,-100}
local hexagon = display.newPolygon (hexagonX, hexagonY, hexVertices)
hexagon:setFillColor(1, 0.2, 0.2)
--------------------------------------------------------------------------------------------------------------

-- Trapezoid
local trapezoidX = display.contentWidth* 2/3
local trapezoidY = display.contentHeight/5

local trapVertices = {200,-150, 250,0, -250,0, -200,-150}
local trapezoid  = display.newPolygon (trapezoidX, trapezoidY, trapVertices)
--------------------------------------------------------------------------------------------------------------

-- Text for Hexagon
local myTextX = display.contentWidth* 2/5
local myTextY = display.contentHeight/1.5

local myText = display.newText("Hexagon", myTextX, myTextY, Arial, 50)
myText:setFillColor(1, 0.2, 0.2)

--------------------------------------------------------------------------------------------------------------

-- Text for triangle
local hexTextX = display.contentWidth* 2/14
local hexTextY = display.contentHeight/1.05

local  hexText = display.newText("Triangle", hexTextX, hexTextY, Arial, 50)
hexText:setFillColor(1, 3, 0.2)

---------------------------------------------------------------------------------------------------------------

-- Text for Trapezoid
local trapTextX = display.contentWidth* 2/3
local trapTextY = display.contentHeight/2.8

local trapText = display.newText("Trapezoid", trapTextX, trapTextY, Arial, 50)













