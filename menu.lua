--! file: menu.lua

-- Gamestate for menu, accessed in main.lua
menu = {}

-- 50: magic number for padding
-- buttonY is same for both 
local windowHeight = love.graphics.getHeight()
local windowWidth = love.graphics.getWidth()
local buttonWidth  = 300
local buttonHeight = 100
local button1X = (windowWidth / 2) - (buttonWidth + 50)
local button2X = (windowWidth / 2) + 50
local buttonY = windowHeight / 2 - (buttonHeight / 2)


function menu:mousepressed(x, y, button)
		
	-- Figures out if hte user clicked on the button
	if button == 1 then

		-- Check left button bounds (X and Y)
		if (x > button1X and x < button1X + buttonWidth) and
			(y > buttonY and y < buttonY + buttonHeight) then

			-- Switch to gamestate
			Gamestate.switch(game)

		-- Check right button bounds
		elseif (x > button2X and x < button2X + buttonWidth) and
			(y > buttonY and y < buttonY + buttonHeight) then

			-- Quit game
			love.event.quit()

		end
	end	

end
	

function menu:draw()

	-- First button
	love.graphics.setColor(200, 0, 0, 100)
	love.graphics.rectangle("fill", button1X,
									buttonY, 
									buttonWidth, buttonHeight)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print("Start", button1X + (buttonWidth / 4), buttonY + 25)

	love.graphics.setColor(200, 0, 0, 100)
	love.graphics.rectangle("fill", button2X,
									buttonY, 
									buttonWidth, buttonHeight)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print("Quit", button2X + (buttonWidth / 4), buttonY + 25)


end