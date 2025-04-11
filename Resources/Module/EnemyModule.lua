local enemy = {
}

local enemy_info = require "Resources.Module.EnemyInfoModule"
local enemys = {}
local bosses = {}

local function calculate_next_hp(current_index, current_phase, is_boss)
	local hp
	if not is_boss then
		if enemys[current_index - 1] ~= nil then
			local last_hp = enemys[current_index  - 1].max_hp
			hp = (last_hp * enemy_info.life_upgrade) 
		else
			hp = enemy_info.basic_first_life
		end
	else
		if bosses[current_phase - 1] ~= nil then
			hp = bosses[current_phase - 1].max_hp + enemy_info.boss_life_upgrade
		else
			hp = enemy_info.boss_first_life
		end
	end
	
	return hp
end

function enemy.generate_seeded_infos()
	enemy_info.generate_bosses_resistences()
end

function enemy.generate_basic_enemy()
	local new_enemy = {
		hp = calculate_next_hp(_G.Enemy_index + 1, _G.Phase),
		max_hp = calculate_next_hp(_G.Enemy_index + 1, _G.Phase),
		is_alive = true,
		defense = enemy_info.get_basic_resistence(),
		drop = enemy_info.money_drop * (1 + _G.Phase + (_G.Enemy_index * 1))
	}
	enemys[_G.Enemy_index + 1] = new_enemy
	return new_enemy
end

function enemy.generate_boss_enemy()
	local new_boss = {
		hp = enemy_info.boss_first_life + (enemy_info.boss_life_upgrade * _G.Phase),
		max_hp = enemy_info.boss_first_life + (enemy_info.boss_life_upgrade * _G.Phase),
		is_alive = true,
		defense = enemy_info.get_boss_resistence(_G.Phase),
		drop = enemy_info.money_drop * (1 + _G.Phase + (_G.Enemy_index * 1))
	}
	_G.Enemy_index = 0
	_G.Phase = _G.Phase + 1
	bosses[_G.Phase] = new_boss
	return bosses[_G.Phase]
end

function enemy.respawner()
	--print("Respawner called. Current Enemy Index:", _G.Enemy_index)
	--print("Current Enemy Alive:", _G.current_enemy.is_alive)
	local enemy_to_spawn
	if 	_G.Enemy_index == 0 and _G.Phase == 0 then
		enemy_to_spawn = enemy.generate_basic_enemy()
		_G.Enemy_index = _G.Enemy_index + 1
	else
		--_G.Money = _G.Money + _G.current_enemy.drop
		_G.vfx.spawn_money(1000)
		
		_G.current_enemy.is_alive = false
		if _G.Enemy_index < 4 then
			--print("Spawning basic enemy. New Enemy Index:", _G.Enemy_index + 1)
			enemy_to_spawn = enemy.generate_basic_enemy()
			_G.Enemy_index = _G.Enemy_index + 1
		elseif _G.Enemy_index == 4 then
			--print("Spawning boss. Resetting Enemy Index to 0.")
			enemy_to_spawn = enemy.generate_boss_enemy()
			_G.Enemy_index = 0
		end
	end
	--print("New Enemy Index after respawn:", _G.Enemy_index)
	return enemy_to_spawn
end



function enemy.show_hp()
	local hp_value = gui.get_node("label_hp_value")
	gui.set_text(hp_value, math.floor(_G.current_enemy.hp))
end

return enemy