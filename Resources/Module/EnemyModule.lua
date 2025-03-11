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
			hp = enemy_info.phase.life_upgrade[current_phase - 1]
		else
			hp = enemy_info.basic_first_life
		end
	end
	
	return hp
end

function enemy.generate_basic_enemy()
	_G.Enemy_index = _G.Enemy_index + 1
	enemy.hp = calculate_next_hp(_G.Enemy_index, _G.Phase)
	enemys[_G.Enemy_index] = enemy
end

function enemy.generate_boss_enemy()
	_G.Phase = _G.Phase + 1
	enemy.hp = enemy_info.boss_first_life + (enemy_info.boss_life_upgrade * _G.Phase)
	bosses[_G.Phase] = enemy
end

function enemy.respawner()
	if enemy.hp <= 0 then
		enemy.is_alive = false
	end
	
	if not enemy.is_alive then
		if _G.Enemy_index <= 5 then
			enemy.generate_basic_enemy()
		else
			_G.Enemy_index = 0
			enemy.generate_boss_enemy()
		end
		enemy.is_alive = true
	end
end

function enemy.show_hp()
	local hp_value = gui.get_node("label_hp_value")
	gui.set_text(hp_value, math.floor(enemy.hp))
end

return enemy