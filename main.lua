
require("miditest")
io.stdout:setvbuf('no') -- Allows console printing on macOS


function love.load()
	love.graphics.setNewFont(50)
    love.graphics.setBackgroundColor(255, 255, 255)
    love.graphics.setColor(0, 0, 0)


    -- Run MIDI
    -- doTheThing()
end



function love.draw()

    love.graphics.setColor(0, 200, 0)
    love.graphics.print("Hello World", 400, 300)

    -- Prep for grid
    love.graphics.setColor(200, 0, 0, 100)

    -- drawGrid()
   

end


-- Draw a grid for debugging pourposes. Purpoises. Porcupines!
function drawGrid()
 
 	-- Global values
	inc = 33
	-- love.graphics.setNewFont(font)
 	windowHeight = love.graphics.getHeight()
    windowWidth = love.graphics.getWidth()
	

    -- Initialize parameters
    x1 = 0
    x2 = 0
    y1 = 0
    y2 = 0

    -- Draw vertical
    for i = 0, windowWidth / 10, 1 do
    	love.graphics.line(x1, 0, x2, windowHeight)
    	x1 = x1 + inc
    	x2 = x2 + inc
    end

    -- Draw horizontal
	for i = 0, windowHeight / 10, 1 do
    	love.graphics.line(0, y1, windowWidth, y2)
    	y1 = y1 + inc
    	y2 = y2 + inc
    end

    -- Print coordinates
end
