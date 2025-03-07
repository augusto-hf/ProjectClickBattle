local cursor = {
	upgrade_level = 1,
	click_damage = 1,
	
	level_text = "level_cursor",
	node = "cursor",
	shop_icon = "shop_icon_cursor",
	icon_sprites = {
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
	local cursor_node = gui.get_node(cursor.node)
	gui.set_position(cursor_node, screen)

	if screen.x < 0 or screen.y < 0 or screen.x > WIDTH or screen.y > HEIGHT then
		defos.set_cursor_visible(true)
	else
		defos.set_cursor_visible(false)

	end
end

return cursor