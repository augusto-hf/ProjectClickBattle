local seed = {
}

_G.current_seed = os.time()

function seed.generate_seed()
	local time =  os.time()
	math.randomseed(time)
	_G.current_seed = time
end

function seed.set_custom_seed(seed)
	
end

return seed