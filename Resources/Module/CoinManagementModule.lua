local coin_management = {
}

local coin_info = require "Resources.Module.CoinInfoModule"

local max_coin_quantity = 20

-- preciso ir com tudo, so dessa vez
local coin_values = {1000, 750, 500, 200, 150, 100, 55, 25, 15, 5, 1}

local function generate_coin(coin_value)
	--print("Trying to get coin of value ".. coin_value)
	if coin_info.all_coins[tostring(coin_value)] ~= nil then
		--print("Coin picked: ".. coin_info.all_coins[tostring(coin_value)].value)
		return coin_info.all_coins[tostring(coin_value)]
	else
		print("There's no coin of that value")
		return 0
	end
end

function coin_management.look_for_coin(money_value_to_look_for_coin)
	-- peço perdão a quem estiver lendo oq eu fiz aqui... eu não encontrei outra forma...
	local generated_coin
	local coin_limit_value_relative_to_money = 0.5
	money_value_to_look_for_coin = math.max(1, money_value_to_look_for_coin * coin_limit_value_relative_to_money) 
	local i = 1
	while i < (table.maxn(coin_values) + 1) and generated_coin == nil do
		local current_probability = math.random(1,100)
		local current_coin =  generate_coin(coin_values[i])
		if money_value_to_look_for_coin >= coin_values[i] and current_probability < current_coin.probability then
			--print("Calling for coin of value: ".. coin_values[i])
			generated_coin = current_coin
		end
		i = i + 1
	end
	return generated_coin
end



return coin_management