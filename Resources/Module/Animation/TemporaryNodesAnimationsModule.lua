local temp_nodes = {
}

local random_rotation_range = 15
local final_scale = vmath.vector3(1, 1, 1)

local function sprite_animation_following_number(number_node, sprite)
	local sprite_node = gui.get_node("damage_icon")

	gui.set_position(sprite_node, gui.get_position(number_node))
	gui.set_rotation(sprite_node, gui.get_rotation(number_node))
	gui.set_scale(sprite_node, gui.get_scale(number_node))

	gui.animate(sprite_node, "color.w", 0, gui.EASING_LINEAR, 1.0, 0)
	gui.animate(sprite_node, "scale", final_scale, gui.EASING_INBOUNCE, 1.0 / 3 , 0)
end

function temp_nodes.number_animation_with_sprite(color, border_color, size, duration, position, text, sprite, isRotationRandom)
	--print("position: ".. position)
	local node = gui.new_text_node(position, text)
	gui.set_color(node, color)
	gui.set_font(node, "Doom")
	gui.set(node, "outline", border_color)
	
	local end_alpha = 0.0
	local end_position = vmath.vector3(position.x, position.y + 100, position.z)

	gui.set_scale(node, size)
	if isRotationRandom then
		gui.set_rotation(node, vmath.vector3(0, 0, math.random(-random_rotation_range, random_rotation_range)))
	end
	gui.set_layer(node, "Hud")

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_INOUTELASTIC, duration, 0)
	gui.animate(node, "scale", final_scale, gui.EASING_INBOUNCE, duration / 3 , 0)

	sprite_animation_following_number(node, sprite)

end

function temp_nodes.number_animation(color, border_color, size, duration, position, text, isRotationRandom)
	local node = gui.new_text_node(position, text)
	gui.set_color(node, color)
	gui.set_font(node, "Doom")
	gui.set(node, "outline", border_color)

	local end_alpha = 0.0
	local end_position = vmath.vector3(position.x, position.y + 100, position.z)

	gui.set_scale(node, size)
	if isRotationRandom then
		gui.set_rotation(node, vmath.vector3(0, 0, math.random(-random_rotation_range, random_rotation_range)))
	end
	gui.set_layer(node, "Hud")

	gui.animate(node, "color.w", end_alpha, gui.EASING_LINEAR, duration, 0, function() gui.delete_node(node) end)
	gui.animate(node, "position", end_position, gui.EASING_INOUTELASTIC, duration, 0)
	gui.animate(node, "scale", final_scale, gui.EASING_INBOUNCE, duration / 3 , 0)

end

return temp_nodes