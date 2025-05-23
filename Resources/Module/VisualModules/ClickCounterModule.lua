local counter_functions = {
}

local internal_counter = 0

function counter_functions.SmoothAddClicksFromPassiveDamage(increment_rate)
	if internal_counter < _G.Number_of_click then return end
	
	
	local click_incrementation = internal_counter * increment_rate
	
	_G.Number_of_click = _G.Number_of_click + click_incrementation
	
end

function counter_functions.AddDamageToCounter(damage)
	internal_counter = internal_counter + damage
end

return counter_functions