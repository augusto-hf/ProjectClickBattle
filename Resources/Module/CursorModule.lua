local cursor = {
	upgrade_level = 1,
	click_damage = 1,
	
	level_text = "level_click",
	cursor_node = "cursor",
	cursor_icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	}
}
--desgraça
local WIDTH = tonumber(sys.get_config("display.width")) 
local HEIGHT = tonumber(sys.get_config("display.height")) 

function cursor.move_cursor_sprite(action)
	local screen = vmath.vector3(action.x, action.y, 0)
	local cursor_node = gui.get_node(cursor.cursor_node)
	gui.set_position(cursor_node, screen)

	if screen.x < 0 or screen.y < 0 or screen.x > WIDTH or screen.y > HEIGHT then
		defos.set_cursor_visible(true)
	else
		defos.set_cursor_visible(false)

	end
end

function cursor.update_sprite(cursor_level)
	local cursor_node = gui.get_node(cursor.cursor_node)
	if cursor.cursor_icon_sprites[cursor_level] ~= nil then
		gui.play_flipbook(cursor_node, cursor.cursor_icon_sprites[cursor_level])
	end
end

return cursor