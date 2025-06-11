local vfx = {
}

local taking_damage_handle

local coin_management = require "Resources.Module.VisualModules.CoinManagementModule"
local temp_nodes = require "Resources.Module.VisualModules.Animation.TemporaryNodesAnimationsModule"
local color = require "Resources.ExternalModules.convercolor"
local shop_buttons = require "Resources.Module.ButtonsModules.ShopButtonsLib"

local black_color = color.rgba(0, 0, 0, 1)

local pressed_button_color = color.hex("994d00", 1)
local unpressed_button_color = color.hex("cc80331", 1)

-- frame 
local frame_node
local frame_animation_time = 2
local frame_animation_max_size_multplier = 1.25
local frame_current_target_skill

-- coins:
local current_generated_coins = {}
local duration_up = 0.15
local duration_fall = 1.5
local x_fall_range = 170
local reference_scale = vmath.vector3(2,2,2)
local money_value_color = color.rgba(245, 206, 66, 1)
	
-- damage number :
local random_position_variation_range = 85
local starting_scale = vmath.vector3(4, 4, 4)
local damage_border_colors = {
	["neutral"] = color.rgba(0, 0, 0, 1),
	["physical"] = color.rgba(51, 51, 51, 1),
	["magic"] = color.rgba(167, 73, 214, 1),
	["elemental"] = color.rgba(73, 214, 160, 1),
	["explosive"] = color.rgba(255, 119, 15, 1),
	["espiritual"] = color.rgba(138, 170, 209, 1)
}

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

local function trigger_enemy_damage_sprite()
	local time_on_damage_sprite = 0.33
	
	if taking_damage_handle ~= nil then timer.cancel(taking_damage_handle) end

	gui.play_flipbook(_G.Enemy_node, hash("Green-Slime-HIT"))
		
	taking_damage_handle = timer.delay(time_on_damage_sprite, false, function()
		gui.play_flipbook(_G.Enemy_node, hash("Green-Slime"))
	end)
		
end

local function damage_number_animation(is_cursor, damage_type, position, damage, magnitude)
	if is_cursor then
		position = position
	else
		position.x = position.x + math.random(-random_position_variation_range, random_position_variation_range)
		position.y = position.y + math.random(-random_position_variation_range, random_position_variation_range)
	end

	local color = color.rgb(255,255,255)
	local border_color = damage_border_colors[damage_type]
	local duration = 1.0
	local magnitude_scale = starting_scale * vmath.clamp(magnitude, 0.60, 0.9)
	
	
	local damage_icon
	if _G.current_enemy.defense[damage_type] < 1 then
		damage_icon = "resited_damage_icon"
	else
		damage_icon = "vulnerable_damage_icon"
	end
	damage_icon = "resited_damage_icon"
	
	temp_nodes.number_animation_with_sprite(color, border_color, magnitude_scale, duration, position, tostring(damage), damage_icon, true)
	
end

local function collect_coin(i, coin)
	print("Money collected ".. coin.coin_value .."$ | N: ".. i)
	_G.Money = _G.Money + coin.coin_value
	local number_scale = gui.get_scale(coin.node)
	local number_pos = gui.get_position(coin.node)
	temp_nodes.number_animation(money_value_color, black_color, number_scale, 1, number_pos, coin.coin_value, false)
	
	gui.set_enabled(coin.node, false) 
	current_generated_coins[i].is_activated = false

-- Em algum momento isso vai ser diferente, pq mic flw q instanciar e deletar é paia
end

local function collect_all_money()
	local i = 1
	for key, value in ipairs(current_generated_coins) do
		if value.is_activated == true then
			collect_coin(key, value)
		elseif value.collected == false then
			_G.Money = _G.Money + value.coin_value
		end
	end
	current_generated_coins = {}
end

local function animate_coin_nodes(node_key_to_start)
	if current_generated_coins[node_key_to_start] ~= nil then
		local current_node = current_generated_coins[node_key_to_start].node
		
		local height_to_fly = _G.Enemy_node_position.y + 100
		local height_to_fall =  _G.Enemy_node_position.y - 100
		
		
		gui.set_enabled(current_node, true)
		current_generated_coins[node_key_to_start].is_activated = true
		gui.set_position(current_node, _G.Enemy_node_position)
		gui.set_color(current_node, color.rgb(255,255,255))
		local final_scale = reference_scale * current_generated_coins[node_key_to_start].node_scale
		gui.set_scale(current_node, final_scale)

		gui.animate(current_node, "position.y", height_to_fly, gui.EASING_LINEAR, duration_up, 0, function()
			gui.animate(current_node, "position.y", height_to_fall, gui.EASING_OUTBOUNCE, duration_fall)
			animate_coin_nodes(node_key_to_start + 1)
		end)
		gui.animate(current_node, "position.x", _G.Enemy_node_position.x + math.random(-x_fall_range, x_fall_range), gui.EASING_LINEAR, duration_fall / 2)
	else
		print("all ".. node_key_to_start-1 .. " coins spawned")
	end
end

function vfx.spawn_money(money_amount)
	--print("spawnei buffunfa")
	collect_all_money()
	local new_coins = coin_management.look_for_coin(money_amount)
	if new_coins ~= nil then
		current_generated_coins = new_coins
	else
		print("error when getting coins")
	end
	
	animate_coin_nodes(1)
end	


function vfx.trigger_damage_number(type, damage)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	local enemy_pos = gui.get_position(_G.Enemy_node)
	--print(type, damage)
	damage_number_animation(false, type, enemy_pos, damage, damage_magnitude)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	trigger_enemy_damage_sprite()
	trigger_enemy_shake(damage_magnitude)
	damage_number_animation(true, type, vmath.vector3(action.x, action.y, 0), damage, damage_magnitude)
end

function vfx.setup()

	--frame node setup
	frame_node = gui.get_node("buy_frame")
	
	local frame_target_scale = gui.get_scale(frame_node) * frame_animation_max_size_multplier
	gui.animate(frame_node, "scale", frame_target_scale, gui.EASING_INELASTIC, frame_animation_time, 0, nil, gui.PLAYBACK_LOOP_PINGPONG)
	gui.set_alpha(frame_node, 0)
	
end

function vfx.run_on_input_action(action)
		for key,coin in pairs(current_generated_coins) do
			if coin.is_activated == true then
				if gui.pick_node(coin.node, action.x, action.y) then
					collect_coin(key, coin)
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

function vfx.press_button(button_node, is_pressed)
	local bt_color
	
	if is_pressed then 
		bt_color = pressed_button_color
	end
	if not is_pressed then 
		bt_color = unpressed_button_color
	end
		
		
	gui.set_color(button_node, color)
end

function vfx.swapping_increasing_button(current_button)
	if gui.get_node(hash("shop_amount_to_buy_1")) then
		gui.set_color(gui.get_node(hash("shop_amount_to_buy_1")), unpressed_button_color)
	end

	if gui.get_node(hash("shop_amount_to_buy_10")) then
		gui.set_color(gui.get_node(hash("shop_amount_to_buy_10")), unpressed_button_color)
	end

	if gui.get_node(hash("shop_amount_to_buy_25")) then
		gui.set_color(gui.get_node(hash("shop_amount_to_buy_25")), unpressed_button_color)
	end

	if gui.get_node(hash("shop_amount_to_buy_100")) then
		gui.set_color(gui.get_node(hash("shop_amount_to_buy_100")), unpressed_button_color)
	end

	gui.set_color(current_button, pressed_button_color)
end

function vfx.show_buy_frame(skill)
	
	
	if skill.upgrade_level <= 0 then
		if shop_buttons.price_prediction(skill, 1.0, 1) > _G.Money and frame_current_target_skill == nil then
			print("hero feedback ".. skill.shop_button)
			local shop_skill_node = gui.get_node(skill.shop_button)
			
			frame_current_target_skill = skill
			gui.set_screen_position(frame_node, gui.get_screen_position(shop_skill_node))
			gui.set_alpha(frame_node, 1)
			
		end
	end
end

return vfx