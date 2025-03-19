local seed = {
}

local current_seed = math.random(100, 10000)

function seed.generate_seed()
	math.randomseed(current_seed)
end

function seed.set_custom_seed(seed)
	
end

return seed