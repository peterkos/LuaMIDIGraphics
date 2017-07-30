

local MIDI = require 'MIDI'

-- Reference from doc
local my_score = {
    96,  -- ticks per beat
    {    -- first track

    	{'patch_change', 0, 1, 8},

    --  {'note' , start_time            , duration , channel , note , velocity} -- in a score
    	{'note' , 5                     , 96       , 1       , 25   , 98},
    	{'note' , 101                   , 96       , 1       , 29   , 98} ,
    }, -- end of first track
}


-- Load custom score
local altscore = {}

local midif = io.open('miditest.mid', 'r')
bachScore = MIDI.midi2score(midif:read("*a"))
midif:close()

-- Assume one track (for now)
	
-- Sort by note start time rather than note end
-- (midi2score() sorts by note end)
firstTrack = 2

table.sort(bachScore[firstTrack], function (e1,e2) return e1[2]<e2[2] end)

-- Prune non-notes

removed = 0

local i = 1
for i=#bachScore[firstTrack], 1, -1 do
	if (bachScore[firstTrack][i][1] == "note") then 
		io.write(string.format("Kept %s %d\n", bachScore[firstTrack][i][1], i))
		i = i + 1
	else
	    io.write(string.format("Removing  %d %s\n", i, bachScore[firstTrack][i][1]))
	    table.remove(bachScore[firstTrack], i)
	    removed = removed + 1
	end
end

bachScoreNotes = bachScore
io.write(string.format("Removed %d", removed))




-- FUNCTIONS

-- Returns note table for parsing
function getMIDIData() 
	return bachScoreNotes[firstTrack]
end

-- Print out info of notes
function printNotes() 
	
	io.write("[type, start, duration, chan, note, velocity]\n")

	for k, event in ipairs(bachScoreNotes[firstTrack]) do
		io.write(string.format("%d %5s, %5s, %5s, %4s, %5s, %6s\n", k, event[1], event[2], event[3], event[4], event[5], event[6]))
	end

end
