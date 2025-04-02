local passive_skills_functions = {
}

function passive_skills_functions.update_tick_damage ()
	local damage_per_second = 0
	local passive_damage = _G.skills.all_skills_passive_damage
	for i = 1, #passive_damage do
		if passive_damage[i].upgrade_level == 1 then
			local this_skill_damage = passive_damage[i].passive_damage
			damage_per_second = damage_per_second + this_skill_damage
			
		else
			local damage_upgrade = passive_damage[i].upgrade_level
			local this_skill_damage = passive_damage[i].passive_damage * damage_upgrade
			
			damage_per_second = damage_per_second + this_skill_damage
		end
	end
	
	if _G.Clicks_per_second ~= damage_per_second then
		_G.Clicks_per_second = damage_per_second
	end

	gui.set_text(gui.get_node("label_dps"),"Dps:".. math.floor(_G.Clicks_per_second))
end

return passive_skills_functions