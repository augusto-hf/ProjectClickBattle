local click_skills = {
}

click_skills.template = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	upgrade_price = 1.00,
	starting_price = 100,
	price_bonus = 1.00,
	damage_value = 3,
	damage_type = "neutral",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15,
	cooldown_icon_node = "skill_cooldown_",
	skill_node = "click_skill_button_",
	shop_node = "_upgrade_button"
}

click_skills.heavy_gloves = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 100,
	price_bonus = 1.50,
	damage_value = 3,
	damage_type = "neutral",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15,
	cooldown_icon_node = "skill_cooldown_heavy_gloves",
	skill_node = "click_skill_button_heavy_glove",
	shop_node = "heavy_glove_upgrade_button"
}

click_skills.bolder = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 250,
	price_bonus = 1.50,
	damage_value = 15,
	damage_type = "elemental",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15
}

click_skills.shiny_staff = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 1000,
	price_bonus = 1.50,
	damage_value = 80,
	damage_type = "magic",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15
}

click_skills.bomb = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 8000,
	price_bonus = 1.50,
	damage_value = 250,
	damage_type = "explosive",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15
}

click_skills.grave_dirt = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 85000,
	price_bonus = 1.50,
	damage_value = 1000,
	damage_type = "spiritual",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15
}

click_skills.club = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 400000,
	price_bonus = 1.50,
	damage_value = 50000,
	damage_type = "physical",
	is_in_cooldown = false,
	cooldown = 30,
	duration = 15
}

return click_skills