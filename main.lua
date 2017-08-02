
-- require("miditest")
local inspect = require("inspect")
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

function love.update(dt)
	
	-- Quit on loss of focus, for faster coding	
	if love.window.hasFocus() == false then
		love.event.quit(0)
	end

end


-- Property to prevent redrawing of notes
local currentDrawn = 1
local timer = 0
local drawn = {}

function love.draw()

	-- Draw a debugging grid
	love.graphics.setColor(200, 0, 0, 100)
	-- drawGrid()

	love.graphics.setColor(0, 200, 0)
	love.graphics.print("Hello World", 400, 300)


	timer = timer + 1

	if timer % 15 == 0 and currentDrawn < #midiInput.scoreNotes + 1 then
		drawNotes(currentDrawn)
		currentDrawn = currentDrawn + 1
	end

	-- Draws notes without delay, permanantly
	for k, note in ipairs(drawn) do
		love.graphics.rectangle("fill", 100 + (note[2] / 10), 200 + (k * 20), (note[3] / 10), 20)
	end

end

function drawNotes(i)
	local note = midiInput.scoreNotes[i]
	print("[INFO] i is equal to " .. i)
	love.graphics.rectangle("fill", 100 + (note[2] / 10), 200 + (i * 20), (note[3] / 10), 20)

	-- Adds to list of already-drawn notes
	drawn[i] = note
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
