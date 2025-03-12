local enemy = {
	hp = 100,
	defense = 0.00,
	is_alive = true
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
			hp = bosses[current_phase - 1].hp + enemy_info.boss_life_upgrade
		else
			hp = enemy_info.boss_first_life
		end
	end
	
	return hp
end

function enemy.generate_basic_enemy()
	local new_enemy = {
		hp = calculate_next_hp(_G.Enemy_index, _G.Phase),
		defense = 0.00,
		is_alive = true
	}
	enemys[_G.Enemy_index] = new_enemy
	_G.Enemy_index = _G.Enemy_index + 1
	return new_enemy
end

function enemy.generate_boss_enemy()
	local new_boss = {
		hp = enemy_info.boss_first_life + (enemy_info.boss_life_upgrade * _G.Phase),
		defense = 0.00,
		is_alive = true
	}
	_G.Enemy_index = 0
	_G.Phase = _G.Phase + 1
	bosses[_G.Phase] = new_boss
	return new_boss
end

function enemy.respawner()
	enemy.is_alive = false
	local enemy_to_spawn
	if not enemy.is_alive then
		if _G.Enemy_index <= 5 then
			enemy_to_spawn = enemy.generate_basic_enemy()
		else
			enemy_to_spawn = enemy.generate_boss_enemy()
		end
	end
	return enemy_to_spawn
end

function enemy.show_hp()
	local hp_value = gui.get_node("label_hp_value")
	gui.set_text(hp_value, math.floor(_G.current_enemy.hp))
end

return enemy