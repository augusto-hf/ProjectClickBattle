local num_format = {
}

function num_format.set_gui_formatted_number(text_node, text_before_number, number)
	local formatted_number
	local symbol_after_number = ""
	formatted_number = math.floor(number + 0.5)
	
	if formatted_number >= 1000000000000000000000000000000000 then
		symbol_after_number = "Deca"
		formatted_number = formatted_number * 0.000000000000000000000000000000001

	elseif formatted_number >= 1000000000000000000000000000000 then
		symbol_after_number = "Nono"
		formatted_number = formatted_number * 0.000000000000000000000000000001

	elseif formatted_number >= 1000000000000000000000000000 then
		symbol_after_number = "Octa"
		formatted_number = formatted_number * 0.000000000000000000000000001

	elseif formatted_number >= 1000000000000000000000000 then
		symbol_after_number = "Septa"
		formatted_number = formatted_number * 0.000000000000000000000001

	elseif formatted_number >= 1000000000000000000000 then
		symbol_after_number = "Hex"
		formatted_number = formatted_number * 0.000000000000000000001
		
	elseif formatted_number >= 1000000000000000000 then
		symbol_after_number = "Qui"
		formatted_number = formatted_number * 0.000000000000000001

	elseif formatted_number >= 1000000000000000 then
		symbol_after_number = "Qua"
		formatted_number = formatted_number * 0.000000000000001
		
	elseif formatted_number >= 1000000000000 then
		symbol_after_number = "Tri"
		formatted_number = formatted_number * 0.000000000001
		
	elseif formatted_number >= 1000000000 then
		symbol_after_number = "B"
		formatted_number = formatted_number * 0.000000001
		
	elseif formatted_number >= 1000000 then
		symbol_after_number = "M"
		formatted_number = formatted_number * 0.000001
		
	elseif formatted_number >= 1000 then
		symbol_after_number = "K"
		formatted_number = formatted_number * 0.001
	end

	gui.set_text(text_node, text_before_number .. formatted_number .. symbol_after_number)
end

return num_format