local coin = {
}
-- preciso ir com tudo, so dessa vez
local coin_values = {1000, 750, 500, 200, 150, 100, 55, 25, 15, 5, 1}
local coin_starting_probability = 10
local coin_probability_increase = 5

local function generate_coin(coin_value)
	-- sim. eu criei uma função simples dessa simplesmente pra n me perder... 
	--(mas tbm pq a geração de moeda dps pode virar algo mais complexo)
	return coin_value
end

local function look_for_coin(money_value_to_look_for_coin)
	-- peço perdão a quem estiver lendo oq eu fiz aqui... eu não encontrei outra forma...
	local generated_coin = 0
	local current_probability = 0
	local i = 0
	while i < table.maxn(coin_values) do
		current_probability = math.random(0,100)
		if money_value_to_look_for_coin > coin_values[i] and current_probability < coin_starting_probability + (coin_probability_increase * math.max(1, i)) then
			generated_coin = generate_coin(coin_values[i])
		end
		i = i + 1
	end
	return generated_coin
end

function coin.generate_all_coins(money_value)
	local current_generated_coins = {}

	local coin_index = 0
	
	while 0 < money_value do
		local new_coin_value = look_for_coin(money_value)
		table.insert(current_generated_coins, coin_index, new_coin_value)
		
		print("coin number ".. table.maxn(current_generated_coins) .. " of value " .. new_coin_value .. "$. was created")
		
		money_value = money_value - new_coin_value
		coin_index = coin_index + 1
	end
	return current_generated_coins
end	

return coin