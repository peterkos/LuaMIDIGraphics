

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


-- Loading custom score
local altscore = {}

local midif = io.open('miditest.mid', 'r')
bachScore = MIDI.midi2score(midif:read("*a"))
midif:close()

for itrack = 2, #bachScore do

	-- Sort by note start rather than note end
	table.sort(bachScore[itrack], function (e1,e2) return e1[2]<e2[2] end)

	for k, event in ipairs(bachScore[itrack]) do
		io.write(string.format("%-15s %s, %s\n", event[1], event[2], event[3]))
	end
end





