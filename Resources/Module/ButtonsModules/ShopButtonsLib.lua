local shop_buttons = {
}

function shop_buttons.UpdateShopInfo()
	gui.set_text(gui.get_node("label_money"), "Money: ".. _G.Money)

	
end

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

local function PassiveUpgrade(click_skill)
		local new_level = click_skill.upgrade_level + 1
		click_skill.upgrade_level = new_level
end

function shop_buttons.SkillUpgrade(skill, has_a_passive, price_increase)
	local price = ((((skill.upgrade_level + 1) * skill.starting_price)) * price_increase)
	if _G.Money > price or _G.Money == price then
		_G.Money = _G.Money - price
		
		if  has_a_passive == true and skill.passive_skill ~= false then
			PassiveUpgrade(skill.passive_skill)
		end
		
		local new_level = skill.upgrade_level + 1
		skill.upgrade_level = new_level
		gui.set_text(gui.get_node(skill.level_text), new_level)

		local new_price = ((((skill.upgrade_level + 1) * skill.starting_price)) * price_increase)
		gui.set_text(gui.get_node(skill.price_text), new_price)

		if skill.icon_sprites[new_level] ~= nil then
			gui.play_flipbook(gui.get_node(skill.shop_icon), skill.icon_sprites[new_level])
			gui.play_flipbook(gui.get_node(skill.skill_icon), skill.icon_sprites[new_level])
		end
	else
		print("Not enough money to upgrade ".. tostring(skill))
	end
end

function shop_buttons.lock_skill(skill)

end

function shop_buttons.unlock_skill(skill)
	
end

return shop_buttons