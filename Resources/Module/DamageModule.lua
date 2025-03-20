local damage = {
}

local damage_value = {
	["neutral"] = 0,
	["physical"] = 0,
	["magic"] = 0,
	["elemental"] = 0,
	["explosive"] = 0,
	["espiritual"] = 0
}

function damage.add(damage_type, value)
	if damage_value[damage_type] ~= nil then
		if damage_value[damage_type] < value then
			damage_value[damage_type] = damage_value[damage_type] + (value - damage_value[damage_type])
			--print(damage_value[damage_type])
		end
	else
		print("invalid type of damage")
	end
end

function damage.reset()
	for key, _ in pairs(damage_value) do
		damage_value[key] = 0
	end
	
end

function damage.get_type(type)
	for key, value in pairs(damage_value) do
		print(key, value)
	end

	if damage_value[type] ~= nil then
		return damage_value[type]
	else
		print("damage type not found")
		return 0
	end
end

function damage.get_all()
	return damage_value
end

return damage