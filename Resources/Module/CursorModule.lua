local cursor = {
	upgrade_level = 1,
	damage_multiplier_per_level = 3.2,
	click_damage = 1,

	starting_price = 100,
	price_bonus = 2.5,
	
	extra_damage_value = {
		["neutral"] = 0,
		["physical"] = 0,
		["magic"] = 0,
		["elemental"] = 0,
		["explosive"] = 0,
		["espiritual"] = 0
	},
	level_text = "level_cursor",
	price_text = "value_cursor",
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
	local screen = vmath.vector3(action.x + 22, action.y - 22, 0)
	local cursor_node = gui.get_node(cursor.node)
	gui.set_position(cursor_node, screen)

	if screen.x < 0 or screen.y < 0 or screen.x > WIDTH or screen.y > HEIGHT then
		defos.set_cursor_visible(true)
	else
		defos.set_cursor_visible(false)

	end
end

function cursor.remove_click(click_skill, damage_when_was_added)
	if cursor.extra_damage_value[click_skill.damage_type] ~= nil then
		local damage_to_remove = cursor.extra_damage_value[click_skill.damage_type] - damage_when_was_added
		cursor.extra_damage_value[click_skill.damage_type] = damage_to_remove
	end
end

function cursor.add_click(click_skill)
	if cursor.extra_damage_value[click_skill.damage_type] ~= nil then
		local damage_to_add = cursor.extra_damage_value[click_skill.damage_type] + (click_skill.damage_value * click_skill.upgrade_level)
		cursor.extra_damage_value[click_skill.damage_type] = damage_to_add
		timer.delay(click_skill.duration, false, function() cursor.remove_click(click_skill, damage_to_add) end)
	end
end

function cursor.reset_click()
	for key, _ in pairs(cursor.extra_damage_value) do
		cursor.extra_damage_value[key] = 0
	end
end

function cursor.get_neutral_damage()
	local final_click_dmg
	if cursor.upgrade_level <= 1 then
		final_click_dmg = _G.cursor.click_damage
	else
		local damage_multiplyer = _G.cursor.damage_multiplier_per_level * (_G.cursor.upgrade_level - 1)
		final_click_dmg = _G.cursor.click_damage * damage_multiplyer
	end

	return final_click_dmg
end

return cursor