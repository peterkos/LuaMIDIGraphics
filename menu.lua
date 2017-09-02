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

			-- Switch to main game
			Gamestate.switch(game)

		-- Check right button bounds
		elseif (x > button2X and x < button2X + buttonWidth) and
			(y > buttonY and y < buttonY + buttonHeight) then

			-- Quit the app
			love.event.quit()

		end
	end	

end
	

function menu:draw()

	-- Set button text font size
	newFont = love.graphics.newFont(30)
	love.graphics.setFont(newFont)


	-- Draw background
	love.graphics.setColor(141, 107, 148)
	-- love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)


	-- Draw logo picture
	love.graphics.draw(logo, 0, 0)

	-- First button	
	-- love.graphics.setColor(200, 0, 0, 100)
	love.graphics.setColor(232, 219, 197)
	love.graphics.rectangle("fill", button1X,
									buttonY, 
									buttonWidth, buttonHeight)

	-- love.graphics.setColor(255, 255, 255, 255)
	love.graphics.setColor(141, 107, 148)
	love.graphics.printf("Start", button1X, buttonY + 10, buttonWidth, "center")

	love.graphics.setColor(200, 0, 0, 100)
	love.graphics.rectangle("fill", button2X,
									buttonY, 
									buttonWidth, buttonHeight)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf("Quit", button2X, buttonY + 10, buttonWidth, "center")


end