    
-- Title: Numeric Textfield
-- Name: Campbell Woodside
-- Course: ICS20/3C
-- This program displays a math question and asks the user to answer in a numeric textfield.
-- terminal.
-----------------------------------------------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)
-----------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------------------------------------------
-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctanswer
-----------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------
local function AskQuestion()
    -- generate  2 random numbers between a max. and a min. number
    randomNumber1 = math.random(0, 10)
    randomNumber2 = math.random(0, 10)
    correctAnswer = randomNumber1 + randomNumber2
    -- create question in text object
    questionObject.text = randomNumber1 .. " + " .. " = "
end
local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end
local function NumericFieldListener( event )
    -- User begins editing "numericField"
    if ( event.phase == "began" ) then
       --clear text field
       event.target.text = ""
    elseif event.phase == "submitted" then
        --when the answer is submitted (enter key is pressed) set user input to user input to user's answer
        userAnswer = tonumber(event.target.text)
        -- if the users answer and the correct answer are the same:
        if (userAnswer == correctAnswer) then
            correctObject.isVisible = true
            timer.performWithDelay(2000, HideCorrect)
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------------------

-- displays a question and set the colour
questionObject = display.newText( "9+9", display.contentHeight/2, 1, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)
-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false
-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"
-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)
------------------------------------------------------------------------------------------------------------------------------ 
-- FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------------------
-- call the function to ask the question
AskQuestion()
 
-- LOCAL FUNCTIONS













































local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local lives = 4
local heart1
local heart2
local heart3
local heart4

--*** ADD LOCAL VARIABLE FOR: INCORRECT OBJECT, POINTS OBJECTS, POINTS

-------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------------------------


local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

		--*** IF THERE AND NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
		if (lives == 4) then
			heart4.isVisible = false
		if (lives == 3) then
			heart3.isVisible = false
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
				heart1.isVisible = false
		end

		--*** CALL THE FUNCTION TO ASK A NEW QUESTION

	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

-----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------------------------------


-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
