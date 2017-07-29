

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
	
-- Sort by note start rather than note end
-- (midi2score() sorts by note end)
firstTrack = 2
table.sort(bachScore[firstTrack], function (e1,e2) return e1[2]<e2[2] end)
	
	io.write("{'note' , start, duration, channel , note , velocity}\n")

	-- For every note, do something.
	for k, event in ipairs(bachScore[firstTrack]) do
		if (event[1] == "note") then 
			io.write(string.format("%5s %9s, %5s, %6s, %8s, %8s\n", event[1], event[2], event[3], event[4], event[5], event[6], event[7]))
		end
		
	end
-- end





