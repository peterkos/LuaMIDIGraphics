--! file: menu.lua

-- Gamestate for menu, accessed in main.lua
pause = {}

-- 50: magic number for padding
-- buttonY is same for both 
local windowHeight = love.graphics.getHeight()
local windowWidth = love.graphics.getWidth()


function pause:mousepressed(x, y, button)
	return Gamestate.pop()
end


function pause:enter(from)
	self.from = from
end
	

function pause:draw()

	-- Draw previous state
	self.from:draw()

	-- First button
	love.graphics.setColor(0, 0, 0, 200)
	love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)

	
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf("PAUSE", 0, windowHeight/5, windowWidth, "center")

	newFont = love.graphics.newFont(20)
	love.graphics.setFont(newFont)
	love.graphics.printf("Click anywhere to unpause", 0, windowHeight/1.5, windowWidth, "center")

	newFont = love.graphics.newFont(50)
	love.graphics.setFont(newFont)


end