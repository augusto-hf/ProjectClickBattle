local active_skills = {
}

local function cooldown_ended(skill)
	skill.is_in_cooldown = false
end

function active_skills.UseSkill(skill)
	if not skill.is_in_cooldown then
		_G.cursor.add_click(skill.passive_skill)
		
		local damage = skill.active_damage * skill.upgrade_level
		local cooldown_icon_node = gui.get_node(skill.cooldown_icon)
		
		gui.set_fill_angle(cooldown_icon_node, 360)
		skill.is_in_cooldown = true
		
		if skill.active_is_dot then
			_G.damage.deal(skill.active_type, damage)
		else
			_G.damage.deal(skill.active_type, damage)
		end
		
		gui.animate(cooldown_icon_node, "fill_angle", vmath.vector4(360,0,1,0), gui.EASING_INOUTQUAD, skill.active_cooldown , 0, function() cooldown_ended(skill) end)
	end
end

return active_skills