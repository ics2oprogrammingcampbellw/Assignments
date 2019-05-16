-- Title: Fall of Gravity
-- Name: Campbell
-- Course: ICS2O/3C
-- This program...

-- Creating Scene Object
-- Naming Scene

local composer = require( "composer" )

local widget = require( "widget" )

sceneName = "instructions_screen"

local scene = composer.newScene( sceneName )
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local CreditsScreen
 local BackButton
 
 
-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO MAIN MENU SCREEN 
local function MainMenuTransition( )
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 1000})
end    
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    CreditsScreen = display.newImage("Images/CreditsScreen.png")

     -- ADD INSTRUCTIONS BUTTON WIDGET
    BackButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*2/8,
            y = display.contentHeight*7/8,

            -- Insert the images here
            defaultFile = "Images/BackButtonPressed.png",
            overFile = "Images/BackButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = MainMenuTransition
        } ) 

 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene