
local midiInput = require("MidiParser")
require("menu")
io.stdout:setvbuf('no') -- Allows console printing on macOS

-- Set gamestate
Gamestate = require("gamestate")
game = {}

function love.load()
	love.graphics.setNewFont(50)
	love.graphics.setBackgroundColor(255, 255, 255)
	love.graphics.setColor(0, 0, 0)

	-- Load a MIDI file
	midiInput.new("midimidi")
	midiInput.printNotes()

	-- Set Gamestate and load menu
	Gamestate.registerEvents()
    Gamestate.switch(menu)

end


-- Property to prevent redrawing of notes
local currentDrawn = 1
local drawn = {}
drawDelay = 0
local timeElapsed = 0
local ddt = 0


function love.update(dt)
	
	-- Quit on loss of focus, for faster coding	
	if love.window.hasFocus() == false then
		love.event.quit(0)
	end
    
    -- Timer only runs while MIDI is being drawn
    if currentDrawn <= #midiInput.scoreNotes then
        timeElapsed = timeElapsed + dt
    end


    -- Add a delay for the duration of each note
    if currentDrawn < #midiInput.scoreNotes + 1 then
    	drawDelay = midiInput.scoreNotes[currentDrawn][3] / 800
    end

	if timeElapsed > drawDelay and currentDrawn < #midiInput.scoreNotes + 1 then
	    ddt = dt
	    timeElapsed = 0
		drawn[currentDrawn] = midiInput.scoreNotes[currentDrawn]
		currentDrawn = currentDrawn + 1
	end

end



	


----------
-- GAME --
----------
function game:draw()

	-- Draw a debugging grid
	love.graphics.setColor(200, 0, 0, 100)
	-- drawGrid()
	
	--  Prints FPS ("uncivilized way") <- Courtesy of Franklin
	love.graphics.print(math.floor(1/ddt), 10, 10)


	-- Draw a middle 
	love.graphics.line(0, love.graphics.getHeight() / 2, love.graphics.getWidth(), love.graphics.getHeight()/2)

	-- Draws notes without delay, permanantly
	for k, note in ipairs(drawn) do
		local noteWidth = (note[3] / 10)
		local noteHeight = 20
		local noteX = 100 + (note[2] / 10)
		--                          v- Center Line                  v- Calculates distance from center
		local noteY = (love.graphics.getHeight()/2 + (59.5 - note[5]) * noteHeight)

		love.graphics.rectangle("fill", noteX, noteY, noteWidth, noteHeight)
	end

end


-- Draw a grid for debugging pourposes. Purpoises. Porcupines!
-- @TODO: Fix grid to line up with note offset
-- @TODO: Move constants to separte file
function drawGrid()

	local inc = 33
	local windowHeight = love.graphics.getHeight()
	local windowWidth = love.graphics.getWidth()

	-- Initialize parameters
	x1 = 0
	x2 = 0
	y1 = 0
	y2 = 0

	-- Draw vertical lines
	for i = 0, windowWidth / 10, 1 do
		love.graphics.line(x1, 0, x2, windowHeight)
		x1 = x1 + inc
		x2 = x2 + inc
	end

	-- Draw horizontal lines
	for i = 0, windowHeight / 10, 1 do
		love.graphics.line(0, y1, windowWidth, y2)
		y1 = y1 + inc
		y2 = y2 + inc
	end

	-- Print coordinates
end
