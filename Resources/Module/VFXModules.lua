local vfx = {
}

local coin_management = require "Resources.Module.CoinManagementModule"
local temp_nodes = require "Resources.Module.Animation.TemporaryNodesAnimationsModule"

-- coins:
local current_generated_coins = {}
local spawned_coins = {}
local coin_lifetime = 1.0 
local duration_up = 0.15
local duration_fall = 1.5
local x_fall_range = 170
local delay_until_next_coin = 0.033
	
-- damage number :
local random_position_variation_range = 85
local starting_scale = vmath.vector3(4, 4, 4)

-- shake :
local shake_timer = 0
local shake_range = vmath.vector3(10,10,1)

local shake_range_final

local function get_noise()
	return vmath.vector3(_G.perlin.noise(shake_timer + 0.1, 14.23, 0.58 ), _G.perlin.noise(shake_timer + 0.1, 1.23, 18.58),0)
end

local function trigger_enemy_shake(magnitude)
	_G.perlin.init()
	shake_range_final = shake_range * vmath.clamp(magnitude, 0.60, 1.33)
	shake_timer = 20
end 



local function damage_number_animation(is_cursor, damage_type, position, damage, magnitude)
	if is_cursor then
		position = position
	else
		position.x = position.x + math.random(-random_position_variation_range, random_position_variation_range)
		position.y = position.y + math.random(-random_position_variation_range, random_position_variation_range)
	end

	local color = vmath.vector4(1,1,1,1)
	local duration = 1.0
	local magnitude_scale = starting_scale * vmath.clamp(magnitude, 0.60, 0.9)
	
	
	local damage_icon
	if _G.current_enemy.defense[damage_type] < 1 then
		damage_icon = "resited_damage_icon"
	else
		damage_icon = "vulnerable_damage_icon"
	end
	damage_icon = "resited_damage_icon"
	
	temp_nodes.number_animation_with_sprite(color, magnitude_scale, duration, position, tostring(damage), damage_icon, true)
	
end

local function collect_coin(i, coin)
	print("Money collected ".. current_generated_coins[i].value .."$ | pos: ".. i)
		gui.delete_node(current_generated_coins[i].node)
		table.remove(current_generated_coins, i)
-- Em algum momento isso vai ser diferente, pq mic flw q instanciar e deletar é paia
end

local function collect_all_money()
	local i = 1
	if table.maxn(current_generated_coins) == nil then
		while i < table.maxn(current_generated_coins[i]) do
			collect_coin(i, current_generated_coins[i])
			i = i + 1
		end
	end
end

function vfx.drop_money()
	local height_to_fly = _G.Enemy_node_position.y + 100
	local height_to_fall =  _G.Enemy_node_position.y - 100
	local i = 1
	

	while i < table.maxn(current_generated_coins) do
		print("spawning: ".. current_generated_coins[i].node_id)
		local current_node = gui.clone( gui.get_node(current_generated_coins[i].node_id) )
		current_generated_coins[i].node = current_node
		gui.set_position(current_node, _G.Enemy_node_position)
		gui.set_color(current_node, vmath.vector4(1,1,1,1))

		gui.animate(current_node, "position.y", height_to_fly, gui.EASING_LINEAR, duration_up, 0, function()
			gui.animate(current_node, "position.y", height_to_fall, gui.EASING_OUTBOUNCE, duration_fall)
		end)
		gui.animate(current_node, "position.x", _G.Enemy_node_position.x + math.random(-x_fall_range, x_fall_range), gui.EASING_LINEAR, duration_fall / 2)
		i = i + 1
	end
end

function vfx.spawn_money(money_amount)
	--print("spawnei buffunfa")
	collect_all_money()
while 0 < money_amount do
	local new_coin = coin_management.look_for_coin(money_amount)
	if new_coin ~= nil then
			table.insert(current_generated_coins, new_coin)
			local id = table.maxn(current_generated_coins)
			--print("coin number ".. id .. " of name ".. current_generated_coins[id].node_id .."value " .. current_generated_coins[id].value .. "$. was created")
			money_amount = money_amount - current_generated_coins[id].value
		end
	end
	vfx.drop_money()
end	


function vfx.trigger_damage_number(type, damage)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	local enemy_pos = gui.get_position(_G.Enemy_node)
	--print(type, damage)
	damage_number_animation(false, type, enemy_pos, damage, damage_magnitude)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	trigger_enemy_shake(damage_magnitude)
	damage_number_animation(true, type, vmath.vector3(action.x, action.y, 0), damage, damage_magnitude)
end

function vfx.setup()
	
end

function vfx.run_on_input_action(action)
		for key,coin in pairs(current_generated_coins) do
			if coin ~= nil then
				print("coin: ".. coin.node_id .." pos: ".. key)
				if gui.pick_node(coin.node, action.x, action.y) then
					collect_coin(key, coin.node)
				end
			end
		end
end

function vfx.run_on_update_effects()
	if shake_timer > 0 then
		local p = gui.get_position(_G.Enemy_node)
		local noise = get_noise()
		p.x = _G.Enemy_node_position.x + (noise.x * shake_range_final.x)
		p.y = _G.Enemy_node_position.y + (noise.y * shake_range_final.y)
		gui.set_position(_G.Enemy_node, p)
		shake_timer = shake_timer - 1
		if shake_timer == 0 then
			gui.set_position(_G.Enemy_node, _G.Enemy_node_position)	
		end
	end
end

return vfx