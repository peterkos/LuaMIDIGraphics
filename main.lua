
-- require("miditest")
local midiInput = require("MidiParser")
io.stdout:setvbuf('no') -- Allows console printing on macOS


function love.load()
	love.graphics.setNewFont(50)
	love.graphics.setBackgroundColor(255, 255, 255)
	love.graphics.setColor(0, 0, 0)

	-- Load a MIDI file
    midiInput.new("miditest")
    midiInput.printNotes()


end



function love.draw()

    -- Draw a debugging grid
    love.graphics.setColor(200, 0, 0, 100)
    -- drawGrid()

    love.graphics.setColor(0, 200, 0)
    love.graphics.print("Hello World", 400, 300)

    -- for k, event in midiData do
    -- 	if (event[1] == 'note') then
    		
    -- 		-- love.graphics.line()

    -- 	end
    -- end

end


-- Draw a grid for debugging pourposes. Purpoises. Porcupines!
function drawGrid()

 	-- Global values
 	inc = 33
	-- love.graphics.setNewFont(font)
	windowHeight = love.graphics.getHeight()
	

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