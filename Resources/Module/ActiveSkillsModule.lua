local active_skills = {
}

local function cooldown_ended(skill)
	skill.is_in_cooldown = false
end

function active_skills.UseSkill(skill)
	if not skill.is_in_cooldown then
		local damage = skill.active_damage * skill.upgrade_level
		local cooldown_icon_node = gui.get_node(skill.cooldown_icon)
		
		gui.set_fill_angle(cooldown_icon_node, 360)
		skill.is_in_cooldown = true

		_G.vfx.trigger_damage_number(skill.active_type, damage)
		_G.damage.deal(skill.active_type, damage)
		gui.animate(cooldown_icon_node, "fill_angle", vmath.vector4(360,0,1,0), gui.EASING_INOUTQUAD, skill.active_cooldown , 0, function() cooldown_ended(skill) end)
	end
end

function active_skills.UseClickSkill(click_skill)
	if not click_skill.is_in_cooldown then

		local cooldown_icon_node = gui.get_node(click_skill.cooldown_icon_node)

		gui.set_fill_angle(cooldown_icon_node, 360)
		click_skill.is_in_cooldown = true

		_G.damage.add_click(click_skill)
		gui.animate(cooldown_icon_node, "fill_angle", vmath.vector4(360,0,1,0), gui.EASING_INOUTQUAD, click_skill.cooldown , 0, function() cooldown_ended(click_skill) end)
	end
end

return active_skills