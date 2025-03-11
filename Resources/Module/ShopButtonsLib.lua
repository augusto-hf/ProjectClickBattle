local shop_buttons = {
}

function shop_buttons.CursorUpgrade(cursor)
	local new_level = cursor.upgrade_level + 1
	cursor.upgrade_level = new_level
	cursor.click_damage = new_level
	gui.set_text(gui.get_node(cursor.level_text), new_level)

	if cursor.icon_sprites[new_level] ~= nil then
		gui.play_flipbook(gui.get_node(cursor.shop_icon), cursor.icon_sprites[new_level])
		gui.play_flipbook(gui.get_node(cursor.node), cursor.icon_sprites[new_level])
	end
end

function shop_buttons.SkillUpgrade(skill)
	local new_level = skill.upgrade_level + 1
	skill.upgrade_level = new_level
	gui.set_text(gui.get_node(skill.level_text), new_level)

	if skill.icon_sprites[new_level] ~= nil then
		gui.play_flipbook(gui.get_node(skill.shop_icon), skill.icon_sprites[new_level])
		gui.play_flipbook(gui.get_node(skill.skill_icon), skill.icon_sprites[new_level])
	end
end

return shop_buttons