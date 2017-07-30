
local MIDI = require("MIDI")

score = {}

function new(filename)

	-- Load score from file
	local midiFile = io.open(filename .. ".mid", "r")
	score = MIDI.midi2score(midiFile:read("*a"))
	midiFile:close()

	-- Sort by note start time rather than note end
	-- (midi2score() sorts by note end)
	table.sort(score[2], function (e1, e2) return e1[2] < e2[2] end)

	score = removeNonNotes()
end


-- Print out info of notes
function printNotes() 
	
	io.write("[type, start, duration, chan, note, velocity]\n")

	for k, event in ipairs(bachScoreNotes[firstTrack]) do
		io.write(string.format("%d %5s, %5s, %5s, %4s, %5s, %6s\n", k, event[1], event[2], event[3], event[4], event[5], event[6]))
	end

end



-- Returns new score of only note events
local function removeNonNotes()

	removed = 0

	local i = 1
	for i=#score[firstTrack], 1, -1 do
		if (score[firstTrack][i][1] == "note") then 
			io.write(string.format("Kept %s %d\n", score[firstTrack][i][1], i))
			i = i + 1
		else
			io.write(string.format("Removing  %d %s\n", i, score[firstTrack][i][1]))
			table.remove(score[firstTrack], i)
			removed = removed + 1
		end
	end

	io.write(string.format("Removed %d", removed))
	return score
	

end
