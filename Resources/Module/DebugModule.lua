local debug ={

}

function debug.show_debug_info()
	gui.set_text(gui.get_node("label_enemy_counter"),"Counter:".. _G.Enemy_index)

	gui.set_text(gui.get_node("label_seed"),"Seed: ".. _G.current_seed)
	if _G.current_enemy and _G.current_enemy.defense then
		gui.set_text(gui.get_node("label_enemy_resistance_counter"),"Defense set:".. _G.current_enemy.defense.id)
	end
end

return debug