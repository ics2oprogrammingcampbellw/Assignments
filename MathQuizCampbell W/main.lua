
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
local incorrectObject
local randomOperator

-- LOCAL FUNCTIONS
local totalSeconds = 10
local secondsLeft = 10
local clockText 
local countDownTimer
local score = 0
local scoreObject
local lives = 4
local heart1
local heart2
local heart3
local heart4
local gameOver


-----------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
    -- generate  2 random numbers between a max. and a min. number
    randomOperator = 2 --math.random(1,4)
    randomNumber1 = math.random(0, 10)
    randomNumber2 = math.random(0, 10)
    -- create question in text object
    if (randomOperator == 1) then
    	-- calculate the correct answer
    	correctAnswer = randomNumber1 + randomNumber2
        -- calculate the correct answer
    	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
        scoreObject.text = score
         -- otherwise if the random operator is 2, do subtraction

    elseif (randomOperator == 2) then
    	-- calculate the correct answer

        if (randomNumber1 < randomNumber2) then
            tempNumber1 = randomNumber1 
            randomNumber1 = randomNumber2
            randomNumber2 = tempNumber1
        end


    	correctAnswer = randomNumber1 - randomNumber2
    	-- create question in text object
    	questionObject.text = randomNumber1 .. "-" .. randomNumber2 .. "=" 
        scoreObject.text = score

     elseif (randomOperator == 3) then

        randomNumber3 = math.random(1,4)


     	-- calculate the correct answer
     	correctAnswer = randomNumber2*randomNumber3 / randomNumber2
    	-- create question in text object
    	questionObject.text = randomNumber2*randomNumber3 .. "/" .. randomNumber2 .. "=" 
        scoreObject.text = score

    elseif (randomOperator == 4) then
    	 -- calculate the correct answer
    	 correctAnswer = randomNumber1 * randomNumber2
    	-- create question in text object
    	questionObject.text = randomNumber1 .. "*" .. randomNumber2 .. "=" 
        scoreObject.text = score

       
    end
end




local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end


local function HideIncorrect()
    incorrectObject.isVisible = false
end

local function ResetTimer()
    secondsLeft = 10
end

local function LoseLife()
    ResetTimer()
    lives = lives - 1

    if (lives == 3) then
        heart4.isVisible = false

    elseif (lives == 2) then
        heart3.isVisible = false

    elseif (lives == 1) then
        heart2.isVisible = false

    elseif (lives == 0) then

        heart1.isVisible = false
        gameOver.isVisible = true
        numericField.isVisible = false
        scoreObject.isVisible = false
        scoreText.isVisible = false
    end
end



local function NumericFieldListener( event )

    -- User begins editing "numericField"

    if ( event.phase == "began" ) then

       event.target.text = ""

    elseif event.phase == "submitted" then

        --when the answer is submitted (enter key is pressed) set user input to user input to user's answer
        userAnswer = tonumber(event.target.text)

        -- if the users answer and the correct answer are the same:
        if (userAnswer == correctAnswer) then
            	correctObject.isVisible = true
                timer.performWithDelay(2000, HideCorrect)
                event.target.text = ""
                score = score + 1
                ResetTimer()



        elseif (userAnswer ~= correctAnswer) then
                incorrectObject.isVisible = true
                timer.performWithDelay(2000, HideIncorrect)    
                event.target.text = ""
                LoseLife()

                
        end
    end
end


-------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------------------------




local function UpdateTime()

	secondsLeft = secondsLeft - 1
	clockText.text = secondsLeft .. ""


	if (secondsLeft == 0 ) then
        LoseLife()		
	end
end

local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function ResetTimer()
	secondsLeft = 10
end


-----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------------------------------

clockText = display.newText( score, display.contentWidth/3, display.contentHeight/6, nil, 50)
-- displays a question and set the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(155/255, 42/255, 198/255)


-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
heart1.isVisible = true

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
heart2.isVisible = true

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7
heart3.isVisible = true

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7
heart4.isVisible = true

gameOver = display.newImageRect("Images/gameOver.png", 100, 100)
gameOver.x = display.contentWidth / 2
gameOver.y = display.contentHeight / 2
gameOver.isVisible = false
gameOver:scale(11, 11)

incorrectObject = display.newText("incorrect!", display.contentWidth/2, 400, nil, 200)

incorrectObject.isVisible = false

scoreObject =  display.newText("", display.contentWidth/2, display.contentHeight*3/10, nil, 50)
scoreObject:setTextColor(100/255, 142/255, 148/255)
scoreText = display.newText("Score =", display.contentWidth*3.9/10, display.contentHeight*3/10, nil, 50 )

------------------------------------------------------------------------------------------------------------------------------ 
-- FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------------------

numericField:addEventListener( "userInput", NumericFieldListener)
-- call the function to ask the question

AskQuestion()
StartTimer()

