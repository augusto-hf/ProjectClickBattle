local vfx = {
}
local perlin = require "Resources.ExternalModules.perlin"

local resisted_damage_color = vmath.vector4(0,0,1,1)
local vulnerable_damage_color = vmath.vector4(1,0,0,1)
local neutral_damage_color = vmath.vector4(0,0,0,1)

local random_variation_range = 85

local shake_timer = 0
local shake_range = vmath.vector3(10,10,1)

local enemy_starter_position
local shake_range_final

local function get_noise()
	return vmath.vector3(perlin.noise(shake_timer + 0.1, 14.23, 0.58 ), perlin.noise(shake_timer + 0.1, 1.23, 18.58),0)
end

local function trigger_enemy_shake(damage)
	enemy_starter_position = gui.get_position(_G.Enemy_node)
	shake_range_final = shake_range * (damage * 0.75)
	shake_timer = 20
end 

local function damage_number_animation(is_cursor, enemy_resistance, position, damage)
	if is_cursor then
		position = position
	else
		position.x = position.x + math.random(-random_variation_range, random_variation_range)
		position.y = position.y + math.random(-random_variation_range, random_variation_range)
	end
	local node = gui.new_text_node(position, tostring(damage))
	
	if enemy_resistance > 1 then
		gui.set_outline(node, vulnerable_damage_color)
	elseif enemy_resistance < 1 then
		gui.set_outline(node, resisted_damage_color)
	else
		gui.set_outline(node, neutral_damage_color)
	end
	
	gui.set_color(node, vmath.vector4(1,1,1,1))
	gui.set_font(node, "default") 
	gui.set_scale(node, vmath.vector3(1, 1, 1)) 
	gui.set_layer(node, "Hud")
	

	local duration = 1.0
	local start_time = socket.gettime()
	local start_position = gui.get_position(node)
	local end_position = vmath.vector3(start_position.x, start_position.y + 100, start_position.z)
	local end_alpha = 0.0

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_INOUTELASTIC, duration, 0, print("gave damage"))
end


function vfx.trigger_damage_number(enemy_resistance, damage)
	local enemy_pos = gui.get_position(_G.Enemy_node)
	perlin.init()
	shake_timer = 10
	trigger_enemy_shake(damage)
	
	damage_number_animation(false, enemy_resistance, enemy_pos, damage)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	damage_number_animation(true, 1.00, vmath.vector3(action.x, action.y, 0), damage)
end

function vfx.run_on_update_effects()
	if shake_timer > 0 then -- Shake enemy
		local p = gui.get_position(_G.Enemy_node)
		local noise = get_noise()
		p.x = enemy_starter_position.x + (noise.x * shake_range_final.x)
		p.y = enemy_starter_position.y + (noise.y * shake_range_final.y) 
		gui.set_position(_G.Enemy_node, p)
		shake_timer = shake_timer - 1
		if shake_timer == 0 then
			gui.set_position(_G.Enemy_node, enemy_starter_position)
		end	
	end
	
end

return vfx