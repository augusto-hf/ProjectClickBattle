local debug ={

}

function debug.show_debug_info()
	gui.set_text(gui.get_node("label_phase"),"Phase:".. _G.Phase)
	gui.set_text(gui.get_node("label_enemy_counter"),"Enemy counter:".. _G.Enemy_index)
end

return debug