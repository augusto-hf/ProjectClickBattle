local counter_functions = {
}

function counter_functions.SmoothAddClicks(current_value ,update_dt)
	local new_value = 0	

	if current_value ~= _G.Number_of_click then
		new_value = current_value + (_G.Number_of_click - current_value)
		return vmath.lerp(update_dt, current_value, new_value)
	end
end


return counter_functions