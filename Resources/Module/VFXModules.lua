local vfx = {
}

local enemy_position

function vfx.set_enemy_position(position)
	enemy_position = position
end

local function damage_number_animation(position, damage)
	local node = gui.new_text_node(position, tostring(damage))
	gui.set_color(node, vmath.vector4(1, 0, 0, 1))
	gui.set_font(node, "default") 
	gui.set_scale(node, vmath.vector3(1, 1, 1)) 
	gui.set_layer(node, "Hud")

	local duration = 1.0
	local start_time = socket.gettime()
	local start_position = gui.get_position(node)
	local end_position = vmath.vector3(start_position.x, start_position.y + 100, start_position.z)
	local end_alpha = 0.0

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_OUTINELASTIC, duration, 0, print("gave damage"))
end


function vfx.trigger_damage_number(damage)
	damage_number_animation(enemy_position, damage)
end

function vfx.trigger_damage_number_on_click(action, damage, type)
	damage_number_animation(vmath.vector3(action.x, action.y, 0), damage)
end

return vfx