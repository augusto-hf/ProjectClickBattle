local vfx = {
}

require "Resources.ExternalModules.perlin"

local resisted_damage_color = vmath.vector4(0,0,1,1)
local vulnerable_damage_color = vmath.vector4(1,0,0,1)
local neutral_damage_color = vmath.vector4(0,0,0,1)

local random_variation_range = 85

local function enemy_shake(enemy_node, damage)
	if self.shake_timer > 0 then
		local p = go.get_world_position()
		local noise = get_noise(self)
		p.x = self.position.x + (noise.x * self.shake_range.x)
		p.y = self.position.y + (noise.y * self.shake_range.y) 
		go.set_position(p)
		self.shake_timer = self.shake_timer - 1
		if self.shake_timer == 0 then
			go.set_position(self.position)
		end	
	end
	
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
	local enemy_node = gui.get_node("Enemy")
	local enemy_pos = gui.get_position(enemy_node)
	enemy_shake(enemy_node, damage)
	damage_number_animation(false, enemy_resistance, enemy_pos, damage)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	damage_number_animation(true, 1.00, vmath.vector3(action.x, action.y, 0), damage)
end

return vfx