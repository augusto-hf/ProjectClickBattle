local vfx = {
}
local perlin = require "Resources.ExternalModules.perlin"

local resisted_damage_color = vmath.vector4(0,0,1,1)
local vulnerable_damage_color = vmath.vector4(1,0,0,1)
local neutral_damage_color = vmath.vector4(0,0,0,1)

local random_variation_range = 85
local random_rotation_range = 15
local starting_scale = vmath.vector3(4, 4, 4)
local final_scale = vmath.vector3(1, 1, 1)

local shake_timer = 0
local shake_range = vmath.vector3(10,10,1)

local shake_range_final

local function get_noise()
	return vmath.vector3(perlin.noise(shake_timer + 0.1, 14.23, 0.58 ), perlin.noise(shake_timer + 0.1, 1.23, 18.58),0)
end

local function trigger_enemy_shake(magnitude)
	perlin.init()
	shake_range_final = shake_range * (magnitude)
	shake_timer = 20
end 

local function damage_number_animation(is_cursor, damage_type, position, damage, magnitude)
	if is_cursor then
		position = position
	else
		position.x = position.x + math.random(-random_variation_range, random_variation_range)
		position.y = position.y + math.random(-random_variation_range, random_variation_range)
	end
	local node = gui.new_text_node(position, tostring(damage))
	
	if _G.current_enemy.defense[damage_type] > 1 then
		gui.set_outline(node, vulnerable_damage_color)
	elseif _G.current_enemy.defense[damage_type] < 1 then
		gui.set_outline(node, resisted_damage_color)
	else
		gui.set_outline(node, neutral_damage_color)
	end
	
	gui.set_color(node, vmath.vector4(1,1,1,1))
	gui.set_font(node, "default") 
	local magnitude_scale = starting_scale * vmath.clamp(magnitude, 0.60, 1.33)
	gui.set_scale(node, magnitude_scale)
	gui.set_rotation(node, vmath.vector3(0, 0, math.random(-random_rotation_range, random_rotation_range)))
	gui.set_layer(node, "Hud")
	

	local duration = 1.0
	local start_time = socket.gettime()
	local start_position = gui.get_position(node)
	local end_position = vmath.vector3(start_position.x, start_position.y + 100, start_position.z)
	local end_alpha = 0.0

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_INOUTELASTIC, duration, 0, print("gave damage"))
	gui.animate(node, "scale", final_scale, gui.EASING_INBOUNCE, duration / 3 , 0)
end


function vfx.trigger_damage_number(type, damage)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	local enemy_pos = gui.get_position(_G.Enemy_node)
	damage_number_animation(false, type, enemy_pos, damage, damage_magnitude)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	local damage_magnitude = (damage * 100) / _G.current_enemy.max_hp
	trigger_enemy_shake(damage_magnitude)
	damage_number_animation(true, "neutral", vmath.vector3(action.x, action.y, 0), damage, damage_magnitude)
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