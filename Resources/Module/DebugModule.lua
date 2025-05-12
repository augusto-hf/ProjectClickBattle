local debug ={}

local isDebugVisible = false

function debug.manage_debug_info()
	gui.set_text(gui.get_node("label_enemy_counter"),"Counter:".. _G.Enemy_index)

	gui.set_text(gui.get_node("label_seed"),"Seed: ".. _G.current_seed)
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

return debug