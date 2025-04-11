local coin_info = {
}

local coinXXX = { --Template
	value = 0,
	node_id = "coinXXX",
	probability = 10,
	node = nil,
}

local coin1000 = {
	value = 1000,
	node_id = "coin1000",
	probability = 20,
	node = nil,
}

local coin750 = {
	value = 750,
	node_id = "coin750",
	probability = 25,
	node = nil,
}

local coin500 = {
	value = 500,
	node_id = "coin500",
	probability = 30,
	node = nil,
}

local coin200 = {
	value = 200,
	node_id = "coin200",
	probability = 35,
	node = nil,
}

local coin150 = {
	value = 150,
	node_id = "coin150",
	probability = 40,
	node = nil,
}

local coin100 = {
	value = 100,
	node_id = "coin100",
	probability = 45,
	node = nil,
}

local coin55 = {
	value = 55,
	node_id = "coin55",
	probability = 50,
	node = nil,
}

local coin25 = {
	value = 25,
	node_id = "coin25",
	probability = 55,
	node = nil,
}

local coin15 = {
	value = 15,
	node_id = "coin15",
	probability = 60,
	node = nil,
}

local coin5 = {
value = 5,
node_id = "coin5",
probability = 90,
node = nil,
}

local coin1 = {
value = 1,
node_id = "coin1",
probability = 100,
node = nil,
}

coin_info.all_coins = {
	["1000"] = coin1000, ["750"] = coin750, ["500"] = coin500, ["200"] = coin200,["150"] = coin150, 
	["100"] = coin100, ["55"] = coin55, ["25"] = coin25, ["15"] = coin15, ["5"] = coin5, ["1"] = coin1 }


return coin_info