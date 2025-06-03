local enemy = {
}

local enemy_info = require "Resources.Module.InfoModules.EnemyInfoModule"
local enemys = {}
local bosses = {}

function enemy.generate_seeded_infos()
	enemy_info.generate_bosses_resistences()
end

function enemy.generate_basic_enemy()
	local enemy_hp = enemy_info.basic_first_life * (math.max(1, table.maxn(enemys) * enemy_info.life_upgrade))
	local new_enemy = {
		hp = enemy_hp,
		max_hp = enemy_hp,
		is_alive = true,
		defense = enemy_info.get_basic_resistence(),
		drop = enemy_hp * enemy_info.enemy_drop_multiplyer
	}
	enemys[_G.Enemy_index + 1] = new_enemy
	return new_enemy
end

function enemy.generate_boss_enemy()
	local current_boss_index = table.maxn(bosses)
	local boss_hp = ( enemys[table.maxn(enemys)].max_hp * enemy_info.life_upgrade ) * enemy_info.boss_life_upgrade
	local new_boss = {
		hp = boss_hp,
		max_hp = boss_hp,
		is_alive = true,
		defense = enemy_info.get_boss_resistence(current_boss_index),
		drop = boss_hp * enemy_info.boss_drop_multiplyer
	}
	
	bosses[current_boss_index] = new_boss
	return bosses[current_boss_index]
end

function enemy.respawner()
	--print("Respawner called. Current Enemy Index:", _G.Enemy_index)
	--print("Current Enemy Alive:", _G.current_enemy.is_alive)
	local enemy_to_spawn
	if 	_G.Enemy_index == 0 then
		enemy_to_spawn = enemy.generate_basic_enemy()
		_G.Enemy_index = _G.Enemy_index + 1
	else

		_G.vfx.spawn_money(_G.current_enemy.drop)
		
		_G.current_enemy.is_alive = false

		local shoud_spawn_boss = false
		for _,index_of_boss in ipairs(enemy_info.boss_indexes) do
			if (_G.Enemy_index + 1) == index_of_boss then
				shoud_spawn_boss = true
			end
		end

		_G.Enemy_index = _G.Enemy_index + 1
		if shoud_spawn_boss then 
			enemy_to_spawn = enemy.generate_boss_enemy()
		else
			enemy_to_spawn = enemy.generate_basic_enemy()
		end
	end
	--print("New Enemy Index after respawn:", _G.Enemy_index)
	return enemy_to_spawn
end



function enemy.show_hp()
	local hp_value = gui.get_node("label_hp_value")
	_G.num_format.set_gui_formatted_number(hp_value, "", _G.current_enemy.hp)
end

return enemy