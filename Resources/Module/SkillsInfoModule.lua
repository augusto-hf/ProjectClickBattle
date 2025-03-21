local skills = {
}

skills.weapon = { -- use as template
upgrade_level = 0,
upgrade_bonus = 0.30,
starting_price = 0,
price_bonus = 1.00,
passive_damage = 1,
active_damage = 2,
active_value = "physical",
active_cooldown = 2,
active_is_dot = false,
active_dot_time = 0,
is_in_cooldown = false,
level_text = "level_weapon",
shop_icon = "shop_icon_weapon",
skill_icon = "skill_button_weapon",
cooldown_icon = "skill_cooldown_weapon",
icon_sprites = {
	[5] = "weapon_level2",
	[10] = "weapon_level3",
	[15] = "weapon_level4"
}
}


skills.warrior_soap = {
upgrade_level = 0,
upgrade_bonus = 1.00,
starting_price = 5,
price_bonus = 1.00,
passive_damage = 1,
active_damage = 10,
active_upgrade_bonus = 0.50,
active_value = "physical",
active_is_dot = true,
active_dot_time = 10,
is_in_cooldown = false,
active_cooldown = 30,
level_text = "level_warrior_soap",
shop_icon = "shop_icon_warrior_soap",
skill_icon = "skill_button_warrior_soap",
cooldown_icon = "skill_cooldown_warrior_soap",
icon_sprites = {
	[5] = "warrior_soap_level2",
	[10] = "warrior_soap_level3",
	[15] = "warrior_soap_level4"
},
skill_description = "Um guerreiro fraco, iniciante que dá dano utilizando espada."
}


skills.circus_mage = {
upgrade_level = 0,
upgrade_bonus = 1.00,
starting_price = 5,
price_bonus = 1.00,
passive_damage = 5,
active_damage = 10,
active_upgrade_bonus = 0.75,
active_value = "magic",
active_is_dot = false,
active_dot_time = 100,
is_in_cooldown = false,
active_cooldown = 60,
level_text = "level_circus_mage",
shop_icon = "shop_icon_circus_mage",
skill_icon = "skill_button_circus_mage",
cooldown_icon = "skill_cooldown_circus_mage",
icon_sprites = {
	[5] = "circus_mage_level2",
	[10] = "circus_mage_level3",
	[15] = "circus_mage_level4"
},
skill_description = "Um mágico iniciante, utiliza cartolas e apetrechos de mágicos baratos."
}

skills.guardian_twig = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 20,
	price_bonus = 1.00,
	passive_damage = 20,
	active_damage = 50,
	active_upgrade_bonus = 0.80,
	active_value = "elemental",
	active_is_dot = false,
	active_dot_time = 60,
	is_in_cooldown = false,
	active_cooldown = 60,
	level_text = "level_guardian_twig",
	shop_icon = "shop_icon_guardian_twig",
	skill_icon = "skill_button_guardian_twig",
	cooldown_icon = "skill_cooldown_guardian_twig",
	icon_sprites = {
		[5] = "guardian_twig_level2",
		[10] = "guardian_twig_level3",
		[15] = "guardian_twig_level4"
	},
	skill_description = "A forest guardian like a surgeon, but very much like a beginner guard. He has elemental damage, a humanoid with strong forest characteristics."
}

skills.snapper = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 80,
	price_bonus = 1.00,
	passive_damage = 80,
	active_damage = 1000,
	active_upgrade_bonus = 1.00,
	active_value = "explosive",
	active_is_dot = false,
	active_dot_time = 60,
	is_in_cooldown = false,
	active_cooldown = 60,
	level_text = "level_snapper",
	shop_icon = "shop_icon_snapper",
	skill_icon = "skill_button_snapper",
	cooldown_icon = "skill_cooldown_snapper",
	icon_sprites = {
		[5] = "snapper_level2",
		[10] = "snapper_level3",
		[15] = "snapper_level4"
	},
	skill_description = "A person who plays with firecrackers, fireworks, and explosives. Weak and beginner-like appearance, similar to Junkrat from Overwatch."
}

skills.gravedigger = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 250,
	price_bonus = 1.00,
	passive_damage = 250,
	active_damage = 3000,
	active_upgrade_bonus = 1.00,
	active_value = "spiritual",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_gravedigger",
	shop_icon = "shop_icon_gravedigger",
	skill_icon = "skill_button_gravedigger",
	cooldown_icon = "skill_cooldown_gravedigger",
	icon_sprites = {
		[5] = "gravedigger_level2",
		[10] = "gravedigger_level3",
		[15] = "gravedigger_level4"
	},
	skill_description = "A person who takes care of the cemetery, usually holding a shovel, but their damage comes from the spiritual (like a blue energy similar to the necromancer from Diablo 2)."
}

skills.samurai = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 950,
	price_bonus = 1.00,
	passive_damage = 950,
	active_damage = 10000,
	active_upgrade_bonus = 1.00,
	active_value = "physical",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_samurai",
	shop_icon = "shop_icon_samurai",
	skill_icon = "skill_button_samurai",
	cooldown_icon = "skill_cooldown_samurai",
	icon_sprites = {
		[5] = "samurai_level2",
		[10] = "samurai_level3",
		[15] = "samurai_level4"
	},
	skill_description = "Samurai Warrior (man or woman, you decide Fernanda, can rock). Long hair and ponytail, deals damage through katanas or samurai swords."
}

skills.detonator = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 3700,
	price_bonus = 1.00,
	passive_damage = 3700,
	active_damage = 13000,
	active_upgrade_bonus = 1.25,
	active_value = "explosive",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_detonator",
	shop_icon = "shop_icon_detonator",
	skill_icon = "skill_button_detonator",
	cooldown_icon = "skill_cooldown_detonator",
	icon_sprites = {
		[5] = "detonator_level2",
		[10] = "detonator_level3",
		[15] = "detonator_level4"
	},
	skill_description = "A person who blows things up, like Rambo, looks mean, strong, military. Carries explosives and destructive weapons."
}

skills.apprentice_mage = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 10500,
	price_bonus = 1.00,
	passive_damage = 10500,
	active_damage = 30000,
	active_upgrade_bonus = 1.45,
	active_value = "magic",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_apprentice_mage",
	shop_icon = "shop_icon_apprentice_mage",
	skill_icon = "skill_button_apprentice_mage",
	cooldown_icon = "skill_cooldown_apprentice_mage",
	icon_sprites = {
		[5] = "apprentice_mage_level2",
		[10] = "apprentice_mage_level3",
		[15] = "apprentice_mage_level4"
	},
	skill_description = "A wise mage, dressed in long robes, carrying books, long beard, and gray hair."
}

skills.young_necromancer = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 50000,
	price_bonus = 1.00,
	passive_damage = 50000,
	active_damage = 200000,
	active_upgrade_bonus = 1.95,
	active_value = "spiritual",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_young_necromancer",
	shop_icon = "shop_icon_young_necromancer",
	skill_icon = "skill_button_young_necromancer",
	cooldown_icon = "skill_cooldown_young_necromancer",
	icon_sprites = {
		[5] = "young_necromancer_level2",
		[10] = "young_necromancer_level3",
		[15] = "young_necromancer_level4"
	},
	skill_description = "A witch who deals with death, gothic, gray skin, eyes with a sense of emptiness. Witch attire and surrounded by blue energy."
}

skills.magma = {
	upgrade_level = 0,
	upgrade_bonus = 1.00,
	starting_price = 195000,
	price_bonus = 1.00,
	passive_damage = 195000,
	active_damage = 1000000,
	active_upgrade_bonus = 2.50,
	active_value = "elemental",
	active_is_dot = false,
	active_dot_time = 120,
	is_in_cooldown = false,
	active_cooldown = 120,
	level_text = "level_magma",
	shop_icon = "shop_icon_magma",
	skill_icon = "skill_button_magma",
	cooldown_icon = "skill_cooldown_magma",
	icon_sprites = {
		[5] = "magma_level2",
		[10] = "magma_level3",
		[15] = "magma_level4"
	},
	skill_description = "An elemental humanoid being, full of fire, flames, and lava."
}


skills.all_skills_passive_damage = {
	skills.weapon,
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