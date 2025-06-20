local skills = {
}

local click_skills = require "Resources.Module.InfoModules.ClickSkillsInfoModule" 


skills.warrior_soap = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 10,
	price_bonus = 1.00,
	passive_damage = 0.2,
	passive_skill = click_skills.club,
	active_damage = 10,
	active_upgrade_bonus = 0.50,
	active_type = "physical",
	active_is_dot = true,
	active_dot_time = 10,
	is_in_cooldown = false,
	active_cooldown = 30,
	shop_button = "warrior_soap_upgrade_button",
	skill_button = "skill_button_warrior_soap",
	level_text = "level_warrior_soap",
	shop_icon = "warrior_soap_icon",
	price_text = "value_warrior_soap",
	skill_icon = "skill_button_warrior_soap",
	cooldown_icon = "skill_cooldown_warrior_soap",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "Um guerreiro fraco, iniciante que dá dano utilizando espada."
}


skills.circus_mage = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 100,
	price_bonus = 1.00,
	passive_damage = 2,
	passive_skill = click_skills.shiny_staff,
	active_damage = 10,
	active_upgrade_bonus = 0.75,
	active_type = "magic",
	active_is_dot = false,
	active_dot_time = 100,
	is_in_cooldown = false,
	active_cooldown = 60,
	shop_button = "circus_mage_upgrade_button",
	skill_button = "skill_button_circus_mage",
	level_text = "level_circus_mage",
	shop_icon = "shop_icon_circus_mage",
	price_text = "value_circus_mage",
	skill_icon = "skill_button_circus_mage",
	cooldown_icon = "skill_cooldown_circus_mage",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "Um mágico iniciante, utiliza cartolas e apetrechos de mágicos baratos."
}

skills.guardian_twig = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 260,
	price_bonus = 1.00,
	passive_damage = 8,
	passive_skill = click_skills.bolder,
	active_damage = 50,
	active_upgrade_bonus = 0.80,
	active_type = "elemental",
	active_is_dot = false,
	active_dot_time = 60,
	is_in_cooldown = false,
	active_cooldown = 60,
	shop_button = "guardian_twig_upgrade_button",
	skill_button = "skill_button_guardian_twig",
	level_text = "level_guardian_twig",
	shop_icon = "shop_icon_guardian_twig",
	price_text = "value_guardian_twig",
	skill_icon = "skill_button_guardian_twig",
	cooldown_icon = "skill_cooldown_guardian_twig",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A forest guardian like a surgeon, but very much like a beginner guard. He has elemental damage, a humanoid with strong forest characteristics."
}

skills.snapper = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 980,
	price_bonus = 1.00,
	passive_damage = 25,
	passive_skill = click_skills.bomb,
	active_damage = 1000,
	active_upgrade_bonus = 1.00,
	active_type = "explosive",
	active_is_dot = false,
	active_dot_time = 60,
	is_in_cooldown = false,
	active_cooldown = 60,
	shop_button = "snapper_upgrade_button",
	skill_button = "skill_button_snapper",
	level_text = "level_snapper",
	shop_icon = "shop_icon_snapper",
	price_text = "value_snapper",
	skill_icon = "skill_button_snapper",
	cooldown_icon = "skill_cooldown_snapper",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A person who plays with firecrackers, fireworks, and explosives. Weak and beginner-like appearance, similar to Junkrat from Overwatch."
}

skills.gravedigger = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 4050,
	price_bonus = 1.00,
	passive_damage = 43,
	passive_skill = click_skills.grave_dirt,
	active_damage = 3000,
	active_upgrade_bonus = 1.00,
	active_type = "spiritual",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "gravedigger_upgrade_button",
	skill_button = "skill_button_gravedigger",
	level_text = "level_gravedigger",
	shop_icon = "shop_icon_gravedigger",
	price_text = "value_gravedigger",
	skill_icon = "skill_button_gravedigger",
	cooldown_icon = "skill_cooldown_gravedigger",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A person who takes care of the cemetery, usually holding a shovel, but their damage comes from the spiritual (like a blue energy similar to the necromancer from Diablo 2)."
}

skills.samurai = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 19000,
	price_bonus = 1.00,
	passive_damage = 950,
	passive_skill = click_skills.club,
	active_damage = 10000,
	active_upgrade_bonus = 1.00,
	active_type = "physical",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "samurai_upgrade_button",
	skill_button = "skill_button_samurai",
	level_text = "level_samurai",
	shop_icon = "shop_icon_samurai",
	price_text = "value_samurai",
	skill_icon = "skill_button_samurai",
	cooldown_icon = "skill_cooldown_samurai",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "Samurai Warrior (man or woman, you decide Fernanda, can rock). Long hair and ponytail, deals damage through katanas or samurai swords."
}

skills.detonator = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 100000,
	price_bonus = 1.00,
	passive_damage = 3700,
	passive_skill = click_skills.bomb,
	active_damage = 13000,
	active_upgrade_bonus = 1.25,
	active_type = "explosive",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "detonator_upgrade_button",
	skill_button = "skill_button_detonator",
	level_text = "level_detonator",
	shop_icon = "shop_icon_detonator",
	price_text = "value_detonator",
	skill_icon = "skill_button_detonator",
	cooldown_icon = "skill_cooldown_detonator",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A person who blows things up, like Rambo, looks mean, strong, military. Carries explosives and destructive weapons."
}

skills.apprentice_mage = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 400000,
	price_bonus = 1.00,
	passive_damage = 10500,
	passive_skill = click_skills.shiny_staff,
	active_damage = 30000,
	active_upgrade_bonus = 1.45,
	active_type = "magic",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "apprentice_mage_upgrade_button",
	skill_button = "skill_button_apprentice_mage",
	level_text = "level_apprentice_mage",
	shop_icon = "shop_icon_apprentice_mage",
	price_text = "value_apprentice_mage",
	skill_icon = "skill_button_apprentice_mage",
	cooldown_icon = "skill_cooldown_apprentice_mage",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A wise mage, dressed in long robes, carrying books, long beard, and gray hair."
}

skills.young_necromancer = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 2250000,
	price_bonus = 1.00,
	passive_damage = 50000,
	passive_skill = click_skills.grave_dirt,
	active_damage = 200000,
	active_upgrade_bonus = 1.95,
	active_type = "spiritual",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "young_necromancer_upgrade_button",
	skill_button = "skill_button_young_necromancer",
	level_text = "level_young_necromancer",
	shop_icon = "shop_icon_young_necromancer",
	price_text = "value_young_necromancer",
	skill_icon = "skill_button_young_necromancer",
	cooldown_icon = "skill_cooldown_young_necromancer",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "A witch who deals with death, gothic, gray skin, eyes with a sense of emptiness. Witch attire and surrounded by blue energy."
}

skills.magma = {
	isActive = true,
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 15000000,
	price_bonus = 1.00,
	passive_damage = 195000,
	passive_skill = click_skills.bolder,
	active_damage = 1000000,
	active_upgrade_bonus = 2.50,
	active_type = "elemental",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	shop_button = "magma_upgrade_button",
	skill_button = "skill_button_magma",
	level_text = "level_magma",
	shop_icon = "shop_icon_magma",
	price_text = "value_magma",
	skill_icon = "skill_button_magma",
	cooldown_icon = "skill_cooldown_magma",
	icon_sprites = {
		[5] = "weapon_level2",
		[10] = "weapon_level3",
		[15] = "weapon_level4"
	},
	skill_description = "An elemental humanoid being, full of fire, flames, and lava."
}


skills.all_skills_passive_damage = {
	skills.warrior_soap,
	skills.circus_mage,
	skills.guardian_twig,
	skills.snapper,
	skills.gravedigger,
	skills.samurai,
	skills.detonator,
	skills.apprentice_mage,
	skills.young_necromancer,
	skills.magma
}

return skills