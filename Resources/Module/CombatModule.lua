local combat_functions = {
}

local damageDealt = 0

function combat_functions.dealDamage(enemy)
	if damageDealt < _G.Number_of_click then
		enemy.hp = enemy.hp - (_G.Number_of_click - damageDealt)
		damageDealt = _G.Number_of_click
	end
end


return combat_functions