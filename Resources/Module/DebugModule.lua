local debug ={}

local isDebugVisible = false

function debug.manage_debug_info()
	gui.set_text(gui.get_node("label_enemy_counter"),"Counter:".. _G.Enemy_index)

	gui.set_text(gui.get_node("label_seed"),"Seed: ".. _G.current_seed)

	gui.set_text(gui.get_node("label_update_speed") , "Passive damage speed: ".. _G.Numbers_update_speed)
	if _G.current_enemy and _G.current_enemy.defense then
		gui.set_text(gui.get_node("label_enemy_resistance_counter"),"Defense set:".. _G.current_enemy.defense.id)
		
		local alpha = gui.get_alpha(gui.get_node("debug_info"))
		
		if alpha > 0 then
			isDebugVisible = true
		else
			isDebugVisible = false
		end
	end
end

function debug.toggle_debug_visibility(input_id, input_action)
	if  input_id == hash("key_f4") and input_action.pressed then
		if isDebugVisible == true then 
			gui.set_alpha(gui.get_node("debug_info"), 0 )
			isDebugVisible = false
		else
			gui.set_alpha(gui.get_node("debug_info"), 1 )
			isDebugVisible = true
		end
	end
end

function debug.change_speed(input_id, input_action)
	local change_ratio = 0.1
	
	if isDebugVisible == true then
		if  input_id == hash("key_f8") and input_action.pressed then
			_G.Numbers_update_speed = _G.Numbers_update_speed - change_ratio
		elseif input_id == hash("key_f9") and input_action.pressed then
			_G.Numbers_update_speed = _G.Numbers_update_speed + change_ratio
		end
	end

end

return debug