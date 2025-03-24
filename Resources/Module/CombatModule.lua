local combat_functions = {
}

local damageDealt = {
	["neutral"] = 0,
	["physical"] = 0,
	["magic"] = 0,
	["elemental"] = 0,
	["explosive"] = 0,
	["espiritual"] = 0
}

local damageDealtInAnotherEnemies = {
	["neutral"] = 0,
	["physical"] = 0,
	["magic"] = 0,
	["elemental"] = 0,
	["explosive"] = 0,
	["espiritual"] = 0
}

local function resetDamageDealt()
	_G.Number_of_click = 0

	for key, value in pairs(damageDealt) do
		damageDealtInAnotherEnemies[key] = damageDealtInAnotherEnemies[key] + damageDealt[key]
		damageDealt[key] = 0
	end

end

function combat_functions.dealDamage()
	if _G.current_enemy.is_alive then
		local current_damage = _G.damage.get_all()
		--print("ready to deal damage")
		
		for key, value in pairs(current_damage) do
			if damageDealt[key] < current_damage[key] then
				local damage_to_deal = current_damage[key] - damageDealt[key]
				--print("dealing ".. damage_to_deal)
				damageDealt[key] = damageDealt[key] + damage_to_deal
				local damageDealtAfterDefense = (damage_to_deal * _G.current_enemy.defense[key])
				
				_G.current_enemy.hp = _G.current_enemy.hp - damageDealtAfterDefense

				if key ~= "neutral" then
					_G.vfx.trigger_damage_number(damageDealtAfterDefense)
				end
			end
		end
	else
		resetDamageDealt()
		_G.damage.reset()
	end
end


return combat_functions