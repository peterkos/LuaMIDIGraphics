
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

	-- Check to see if note is over. If so, end!
	

end


-- Property to prevent redrawing of notes
local notesWereDrawn = false
local currentNote = 1

function love.draw()

	-- Draw a debugging grid
	love.graphics.setColor(200, 0, 0, 100)
	-- drawGrid()

	love.graphics.setColor(0, 200, 0)
	love.graphics.print("Hello World", 400, 300)

	if currentNote < 5 then
		local notes = midiInput.scoreNotes[currentNote]
		love.graphics.rectangle("fill", 100 + (notes[2] / 10), 200, (notes[3] / 10), 20)
		love.timer.sleep(0.5)
		currentNote = currentNote + 1
	end



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
