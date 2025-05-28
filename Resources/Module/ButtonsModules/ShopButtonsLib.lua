local shop_buttons = {
}
local active_skills = require "Resources.Module.ButtonsModules.ActiveSkillsModule"

local function lock_skill(skill)
	local skill_to_lock =  skill

	if skill_to_lock == nil then print("no Skill to lock") return end

	--skill_to_unlock.isActive = false
	gui.set_alpha(gui.get_node(skill_to_lock.shop_icon), 0.5)
	gui.set_inherit_alpha(gui.get_node(skill_to_lock.price_text), false)
end

local function unlock_skill(skill)
	local skill_to_unlock =  skill

	if skill_to_unlock == nil then print("no Skill to unlock") return end

	--skill_to_unlock.isActive = true
	gui.set_alpha(gui.get_node(skill_to_unlock.shop_icon), 1)
	gui.set_inherit_alpha(gui.get_node(skill_to_unlock.price_text), true)
end

function shop_buttons.lock_skill(skill)
	lock_skill(skill)
end

function shop_buttons.unlock_skill(skill)
	unlock_skill(skill)
end

function shop_buttons.UpdateShopInfo()
	gui.set_text(gui.get_node("label_money"), "Money: ".. _G.Money)

	
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

function shop_buttons.SkillUpgrade(skill, has_a_passive, price_increase)
	local price = ((((skill.upgrade_level + 1) * skill.starting_price)) * price_increase)
	
	
	if _G.Money > price or _G.Money == price then
		_G.Money = _G.Money - price
		local new_level = skill.upgrade_level + 1
		
		
		if skill.isActive == false then unlock_skill(skill) return end
		
		--unlock active skill here 
		if new_level == 3 then active_skills.unlock_skill(skill) end
		
		if has_a_passive == true and skill.passive_skill ~= false then PassiveUpgrade(skill.passive_skill) end
		
		
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

return shop_buttons