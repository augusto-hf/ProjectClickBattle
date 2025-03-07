local skills = {
}

local weapon_icon_sprites = {
	[5] = "weapon_level2",
	[10] = "weapon_level3",
	[15] = "weapon_level4"
}

skills.weapon = { -- use as template
	upgrade_level = 0,
	passive_damage = 1,
	active_damage = 2,
	active_cooldown = 2,
	is_in_cooldown = false,
	level_text = "level_weapon",
	shop_icon = "shop_icon_weapon",
	skill_icon = "skill_button_weapon",
	cooldown_icon = "skill_cooldown_weapon",
	icon_sprites = weapon_icon_sprites
}

return skills