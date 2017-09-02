--! file: menu.lua

-- Gamestate for menu, accessed in main.lua
pause = {}

-- 50: magic number for padding
-- buttonY is same for both 
local windowHeight = love.graphics.getHeight()
local windowWidth = love.graphics.getWidth()


function pause:keypressed(key)
	if key == "escape" then
		return Gamestate.pop()
	end
end


-- Don't know about this. Might remove.
function pause:enter(from)
	self.from = from
end
	
-- Check if go to menu button was pressed
function pause:mousepressed(x, y, button)
	-- Figures out if the user clicked on the button
	if button == 1 then
		-- Check menu button bounds (X and Y)
		if (x > (windowWidth / 2) - 150 and x < (windowWidth / 2) - 150 + 300) and
			(y > (windowHeight / 2) - (100 / 2) and y < (windowHeight / 2) - (100 / 2) + 50) then

			-- Switch to menu
			Gamestate.switch(menu)
		end
	end	

end


function pause:draw()

	-- Draw previous state
	self.from:draw()

	-- Transparent overlay
	love.graphics.setColor(0, 0, 0, 200)
	love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
	
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf("PAUSE", 0, windowHeight / 5, windowWidth, "center")

	-- Menu button
	love.graphics.setColor(200, 0, 0, 100)
	love.graphics.rectangle("fill", (windowWidth / 2) - 150, (windowHeight / 2) - (100 / 2), 300, 50)

	-- Menu button text
	newFont = love.graphics.newFont(20)
	love.graphics.setFont(newFont)
	love.graphics.setColor(255, 255, 255)
	love.graphics.printf("Main Menu", 0, windowHeight - 335, windowWidth, "center")

	-- Reset font size for title
	newFont = love.graphics.newFont(50)
	love.graphics.setFont(newFont)

end