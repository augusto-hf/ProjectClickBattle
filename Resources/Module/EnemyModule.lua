local enemy = {
	hp = 100,
	defense = 0.00;
}

local enemy_info = require "Resources.Module.EnemyInfoModule"
local enemys = {}
local bosses = {}

local function calculate_next_hp(current_index, current_phase)
	local hp
	if enemys[current_index - 1] ~= nil then
		local last_hp = enemys[current_index  - 1].hp
		hp = last_hp + (last_hp * enemy_info.life_upgrade[current_phase]) 
	else
		if bosses[current_phase - 1] ~= nil then
			hp = enemy_info.phase.life_upgrade[current_phase - 1]
		else
			hp = enemy_info.basic_first_life
		end
	end
	
	return hp
end

function enemy.generate_basic_enemy(current_index, current_phase)
	enemy.hp = calculate_next_hp(current_index, current_phase)
	enemys[current_index] = enemy
end

function enemy.generate_boss_enemy(current_phase)
	enemy.hp = enemy_info.boss_first_life + (enemy_info.boss_life_upgrade * (current_phase - 1))
	bosses[current_phase] = enemy
end

function enemy.show_hp()
	local hp_value = gui.get_node("label_hp_value")
	gui.set_text(hp_value, enemy.hp)
end

return enemy