local counter_functions = {
}


function counter_functions.SmoothAddClicks()
	local click_incrementation = _G.Clicks_per_second * _G.Numbers_update_speed
	_G.Number_of_click = _G.Number_of_click + click_incrementation
	
end


return counter_functions