local active_skills = {
}

function active_skills.lock_skill(skill)
	local skill_to_lock =  skill

	if skill_to_lock == nil then print("no Skill to lock") return end

	gui.set_alpha(gui.get_node(skill_to_lock.skill_icon), 0.5)
end

function active_skills.unlock_skill(skill)
	local skill_to_unlock =  skill

	if skill_to_unlock == nil then print("no Skill to unlock") return end

	gui.set_alpha(gui.get_node(skill_to_unlock.skill_icon), 1)
end

local function cooldown_ended(skill)
	skill.is_in_cooldown = false
end

function active_skills.UseSkill(skill)
	-- unfortnely the verifier of skill usability is yet hardcoded
	if not skill.is_in_cooldown and skill.isActive and skill.upgrade_level >= 3 then
		_G.cursor.add_click(skill.passive_skill)
		
		local damage = skill.active_damage * skill.upgrade_level
		local cooldown_icon_node = gui.get_node(skill.cooldown_icon)
		
		gui.set_fill_angle(cooldown_icon_node, 360)
		skill.is_in_cooldown = true
		
		if skill.active_is_dot then
			_G.damage.deal_over_time(skill.active_type, damage, skill.active_dot_time)
		else
			_G.damage.deal(skill.active_type, damage)
		end
		
		gui.animate(cooldown_icon_node, "fill_angle", vmath.vector4(360,0,1,0), gui.EASING_INOUTQUAD, skill.active_cooldown , 0, function() cooldown_ended(skill) end)
	end
end



return active_skills