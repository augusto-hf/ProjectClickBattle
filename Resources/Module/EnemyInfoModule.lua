local enemy_info = {
}
local resistences = require("Resources.Module.ResistencesSetsModule")

enemy_info.basic_first_life = 100
enemy_info.boss_first_life = 200
enemy_info.boss_life_upgrade = 100


enemy_info.life_upgrade = {
	[0] = 0.02,
	[1] = 0.05,
	[2] = 0.08,
	[3] = 0.11,
	[4] = 0.14,
}

local range = {
min = 0, max = 0
}
local boss_set_range = {
	[1] = range{min = 0, max = 0},
	[2] = range{min = 1, max = 3},
	[3] = range{min = 2, max = 5},
	[4] = range{min = 3, max = 7},
	[5] = range{min = 5, max = 8},
	[6] = range{min = 6, max = 9},
	[7] = range{min = 8, max = 10},
	[8] = range{min = 9, max = 11},
}

local bosses_resistences = {}

function enemy_info.generate_bosses_resistences()
	for key, value in pairs(boss_set_range) do
		local x = math.random(boss_set_range[key].range["min"], boss_set_range[key].range["max"])
		table.insert(bosses_resistences, key, resistences.sets[x] )
	end
end 

function enemy_info.get_boss_resistence(phase)
	if boss_set_range[phase] ~= nil then
		return boss_set_range[phase]
	else
		return boss_set_range[0] 
	end
end

function enemy_info.get_basic_resistence()
	return boss_set_range[0]
end

return enemy_info