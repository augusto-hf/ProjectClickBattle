local vfx = {
}
local perlin = require "Resources.ExternalModules.perlin"
local coin = require "Resources.Module.CoinModule"

-- coins:

local coin_reference_nodes = {}
local coin_nodes = { }
local coin_minimum_value 
local max_coin_quantity = 20
local duration_up = 0.15
local duration_fall = 1.5
local x_fall_range = 170
local delay_until_next_coin = 0.033
local current_dropped_coin = 0

-- damage number :
local resisted_damage_color = vmath.vector4(0,0,1,1)
local vulnerable_damage_color = vmath.vector4(1,0,0,1)
local neutral_damage_color = vmath.vector4(0,0,0,1)

local random_position_variation_range = 85
local random_rotation_range = 15
local starting_scale = vmath.vector3(4, 4, 4)
local final_scale = vmath.vector3(1, 1, 1)


-- shake :
local shake_timer = 0
local shake_range = vmath.vector3(10,10,1)

local shake_range_final

local function get_noise()
	return vmath.vector3(perlin.noise(shake_timer + 0.1, 14.23, 0.58 ), perlin.noise(shake_timer + 0.1, 1.23, 18.58),0)
end

local function trigger_enemy_shake(magnitude)
	perlin.init()
	shake_range_final = shake_range * vmath.clamp(magnitude, 0.60, 1.33)
	shake_timer = 20
end 

local function sprite_animation_based_on_resistance(number_node, defense)
	local sprite_node = gui.get_node("damage_icon")
	gui.set_color(sprite_node, vmath.vector4(1,1,1,1))
	if defense < 1 then
		gui.play_flipbook(sprite_node, "resited_damage_icon")
	else
		gui.play_flipbook(sprite_node, "vulnerable_damage_icon")
	end
	gui.play_flipbook(sprite_node, "resited_damage_icon") -- pra testar se ta aparecendo
	
	gui.set_position(sprite_node, gui.get_position(number_node))
	gui.set_rotation(sprite_node, gui.get_rotation(number_node))
	gui.set_scale(sprite_node, gui.get_scale(number_node))
	
	gui.animate(sprite_node, "color.w", 0, gui.EASING_LINEAR, 1.0, 0)
	gui.animate(sprite_node, "scale", final_scale, gui.EASING_INBOUNCE, 1.0 / 3 , 0)
end

local function damage_number_animation(is_cursor, damage_type, position, damage, magnitude)
	if is_cursor then
		position = position
	else
		position.x = position.x + math.random(-random_position_variation_range, random_position_variation_range)
		position.y = position.y + math.random(-random_position_variation_range, random_position_variation_range)
	end
	local node = gui.new_text_node(position, tostring(damage))
	gui.set_color(node, vmath.vector4(1,1,1,1))
	gui.set_font(node, "Doom") 
	
	local magnitude_scale = starting_scale * vmath.clamp(magnitude, 0.60, 0.9)
	gui.set_scale(node, magnitude_scale)
	gui.set_rotation(node, vmath.vector3(0, 0, math.random(-random_rotation_range, random_rotation_range)))
	gui.set_layer(node, "Hud")
	

	local duration = 1.0
	local start_time = socket.gettime()
	local start_position = gui.get_position(node)
	local end_position = vmath.vector3(start_position.x, start_position.y + 100, start_position.z)
	local end_alpha = 0.0

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_INOUTELASTIC, duration, 0)
	gui.animate(node, "scale", final_scale, gui.EASING_INBOUNCE, duration / 3 , 0)
	
	--if _G.current_enemy.defense[damage_type] ~= 1 then
	sprite_animation_based_on_resistance(node, _G.current_enemy.defense[damage_type])
	--end
	
	
end

local coin_to_spawn = {}

local function generate_money(money_amount)
	local current_money = 0

	while money_amount > current_money do
		
	end
end

local function drop_money()
	local height_to_fly = _G.Enemy_node_position.y + 100
	local height_to_fall =  _G.Enemy_node_position.y - 100
	current_dropped_coin = current_dropped_coin + 1
	
	
	if coin_to_spawn[current_dropped_coin] ~= nil then
		local current_node = gui.get_node(coin_nodes[current_dropped_coin])
		gui.set_position(current_node, _G.Enemy_node_position)
		gui.set_color(current_node, vmath.vector4(1,1,1,1))

		gui.animate(current_node, "position.y", height_to_fly, gui.EASING_LINEAR, duration_up, 0, function()
			gui.animate(current_node, "position.y", height_to_fall, gui.EASING_OUTBOUNCE, duration_fall)
		end)
		gui.animate(current_node, "position.x", _G.Enemy_node_position.x + math.random(-x_fall_range, x_fall_range), gui.EASING_LINEAR, duration_fall / 2)
		timer.delay(delay_until_next_coin, false, function() vfx.drop_money()end)
		table.remove(coin_to_spawn,current_dropped_coin)
	else
		current_dropped_coin = 0
		coin_to_spawn = {}
	end
end

function vfx.spawn_money(money_amount)
	local all_coins = coin.generate_all_coins(money_amount)
		
	for key, values in pairs(all_coins) do
		local 
		table.insert(coin_to_spawn , gui.clone(coin_reference_nodes[key]) )
	end
	
	drop_money()
	
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
	for key,value in ipairs(coin_values) do
		local current_node_id = tostring("coin"..value)
		table.insert(coin_reference_nodes, key, current_node_id) 
	end
end

function vfx.run_on_input_action(action)
	for _,coin in ipairs(coin_nodes) do
		if gui.pick_node(coin, action.x, action.y) then
			print("Money collected", coin)
			gui.delete_node(coin)
			break
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