
local MIDI = require("MIDI")

score = {}
scoreNotes = {}
local track = 2
local removeNonNotes

function score.new(filename)

	-- Load score from file
	local midiFile = io.open(filename .. ".mid", "r")
	scoreNotes = MIDI.midi2score(midiFile:read("*a"))
	midiFile:close()

	-- Sort by note start time rather than note end
	-- (midi2score() sorts by note end)
	table.sort(scoreNotes[2], function (e1, e2) return e1[2] < e2[2] end)

	scoreNotes = removeNonNotes()
end


-- Print out info of notes
-- Precondition: removeNonNotes() called before this
function score.printNotes() 
	
	io.write("[type, start, duration, chan, note, velocity]\n")

	for k, event in ipairs(scoreNotes[2]) do
		io.write(string.format("%d %5s, %5s, %5s, %4s, %5s, %6s\n", k, event[1], event[2], event[3], event[4], event[5], event[6]))
	end

end


-- Returns new score of only note events
removeNonNotes = function()

	removed = 0

	local i = 1
	for i=#scoreNotes[track], 1, -1 do
		if (scoreNotes[track][i][1] == "note") then 
			io.write(string.format("Kept %s %d\n", scoreNotes[track][i][1], i))
			i = i + 1
		else
			io.write(string.format("Removing  %d %s\n", i, scoreNotes[track][i][1]))
			table.remove(scoreNotes[track], i)
			removed = removed + 1
		end
	end

	io.write(string.format("\nRemoved %d events\n-----\n\n", removed))
	return scoreNotes
	

end

return score