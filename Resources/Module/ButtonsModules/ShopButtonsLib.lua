local shop_buttons = {
}
local active_skills = require "Resources.Module.ButtonsModules.ActiveSkillsModule"

local original_level_increase_amount = 1
local level_increase_amount = 1

local function lock_skill(skill)
	local skill_to_lock =  skill

	if skill_to_lock == nil then print("no Skill to lock") return end

	skill_to_lock.isActive = false
	gui.set_alpha(gui.get_node(skill_to_lock.shop_icon), 0.5)
	gui.set_inherit_alpha(gui.get_node(skill_to_lock.price_text), false)
end

local function unlock_skill(skill)
	local skill_to_unlock =  skill

	if skill_to_unlock == nil then print("no Skill to unlock") return end

	skill_to_unlock.isActive = true
	gui.set_alpha(gui.get_node(skill_to_unlock.shop_icon), 1)
	gui.set_inherit_alpha(gui.get_node(skill_to_unlock.price_text), true)
end

function shop_buttons.lock_skill(skill)
	lock_skill(skill)
end

function shop_buttons.unlock_skill(skill)
	unlock_skill(skill)
end

function shop_buttons.level_increase_reset()
	level_increase_amount = original_level_increase_amount
end

function shop_buttons.level_increase_new_value(value)
	level_increase_amount = value
end

function shop_buttons.UpdateShopInfo()
	_G.num_format.set_gui_formatted_number(gui.get_node("label_money"),  "Money: ", _G.Money)

	
end

local function PassiveUpgrade(click_skill)
	local new_level = click_skill.upgrade_level + 1
	click_skill.upgrade_level = new_level
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

function shop_buttons.price_prediction(skill, price_increase, level_increase)
	local current_price = 0
	local current_skill_level = skill.upgrade_level
	local final_skill_level = current_skill_level + level_increase
	
	while current_skill_level < final_skill_level do
		local evaluated_price = 0
		
		if current_skill_level > 0 then 
			evaluated_price = ((((current_skill_level + 1) * skill.starting_price)) * price_increase)
		else
			evaluated_price = skill.starting_price
		end

		current_skill_level = current_skill_level + 1
		current_price = current_price + evaluated_price
	end

	
	return current_price
end

function shop_buttons.SkillUpgrade(skill, has_a_passive, price_increase, is_cursor)
	local level_increase = level_increase_amount
	
	if level_increase < 1 or level_increase == nil then print("invalid level increase") return end
	
	local price = shop_buttons.price_prediction(skill, price_increase, level_increase)
	
	if _G.Money > price or _G.Money == price then
		_G.Money = _G.Money - price

		local final_skill_level = skill.upgrade_level + level_increase
		
		while skill.upgrade_level < final_skill_level do
			local new_level = skill.upgrade_level + 1
		
			if not is_cursor then
				--unlock itself
				if skill.isActive == false then unlock_skill(skill) end
		
				--unlock active skill here 
				if new_level == 3 then active_skills.unlock_skill(skill) end
			
				--upgrade passive
				if has_a_passive == true and skill.passive_skill ~= false then PassiveUpgrade(skill.passive_skill) end
			end 
		
		
		
			skill.upgrade_level = new_level
			gui.set_text(gui.get_node(skill.level_text), new_level)

			local new_price = ((((skill.upgrade_level + 1) * skill.starting_price)) * price_increase)
			_G.num_format.set_gui_formatted_number(gui.get_node(skill.price_text), "", new_price)

			if skill.icon_sprites[new_level] ~= nil then
				gui.play_flipbook(gui.get_node(skill.shop_icon), skill.icon_sprites[new_level])
				gui.play_flipbook(gui.get_node(skill.skill_icon), skill.icon_sprites[new_level])
			end

		end
	else
		print("Not enough money to upgrade ".. tostring(skill))
	end
end

function shop_buttons.reset_increase_amount()
	level_increase_amount = original_level_increase_amount
end

function shop_buttons.change_increase_amount(new_amount)
	level_increase_amount = new_amount
end


return shop_buttons