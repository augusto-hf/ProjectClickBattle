local passive_skills_functions = {
}

function init(self)

end

function passive_skills_functions.tick_damage (skill)
	_G.Number_of_click = _G.Number_of_click + (skill.passive_damage * skill.upgrade_level)
end




return passive_skills_functions