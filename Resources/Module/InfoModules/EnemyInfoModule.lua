local enemy_info = {
}
local resistences = require("Resources.Module.InfoModules.ResistencesSetsModule")

enemy_info.basic_first_life = 10
enemy_info.boss_first_life = 200
enemy_info.boss_life_upgrade = 100

enemy_info.life_upgrade = 1.2
enemy_info.boss_life_upgrade = 2.0

enemy_info.enemy_drop_multiplyer = 0.1
enemy_info.boss_drop_multiplyer = 0.3


enemy_info.boss_indexes = { 5, 10, 20, 35, 50 }

enemy_info.boss_max_index = enemy_info.boss_indexes[table.maxn(enemy_info.boss_indexes)]

local boss_set_range = {
	[0] = {min = 0, max = 0},
	[1] = {min = 1, max = 3},
	[2] = {min = 2, max = 5},
	[3] = {min = 3, max = 7},
	[4] = {min = 5, max = 8},
	[5] = {min = 6, max = 9},
	[6] = {min = 8, max = 10},
	[7] = {min = 9, max = 11},
}

local bosses_resistences = {}


function enemy_info.generate_bosses_resistences()
	for key, value in pairs(boss_set_range) do
		local x = math.random(value.min, value.max)
		-- print("Random value generated for boss " .. key .. ": " .. x) -- Debug print

		if resistences.sets[x] then
			bosses_resistences[key] = resistences.sets[x]
			print("Boss " .. key .. " resistance set ID: " .. bosses_resistences[key].id) 
		else
			print("Error: Invalid resistance index for boss " .. key .. ": " .. x) 
		end
	end
end

function enemy_info.get_boss_resistence(phase)
	if boss_set_range[phase] ~= nil then
		return bosses_resistences[phase]
	else
		return bosses_resistences[0] 
	end
end

function enemy_info.get_basic_resistence()
	return resistences.sets[0]
end

return enemy_info