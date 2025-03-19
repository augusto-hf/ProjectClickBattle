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

local boss_set_range = {
	[0] = resistences.sets[0],
	[1] = resistences.sets[math.random(1,3)],
	[2] = resistences.sets[math.random(2,5)],
	[3] = resistences.sets[math.random(3,7)],
	[4] = resistences.sets[math.random(5,8)],
	[5] = resistences.sets[math.random(6,9)],
	[6] = resistences.sets[math.random(8,10)],
	[7] = resistences.sets[math.random(9,11)],
}

function enemy_info.get_boss_resistence(phase)
	if boss_set_range[phase] ~= nil then
		return boss_set_range[phase]
	else
		return boss_set_range[0]
	end
end

return enemy_info