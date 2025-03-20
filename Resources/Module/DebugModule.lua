local debug ={

}

function debug.show_debug_info()
	gui.set_text(gui.get_node("label_phase"),"Phase:".. _G.Phase)
	gui.set_text(gui.get_node("label_enemy_counter"),"Enemy counter:".. _G.Enemy_index)

	gui.set_text(gui.get_node("label_seed"),"Seed: ".. _G.current_seed)
	if _G.current_enemy and _G.current_enemy.defense then
		gui.set_text(gui.get_node("label_enemy_resistance_counter"),"Enemy defense set:".. _G.current_enemy.defense.id)
	end
end

return debug