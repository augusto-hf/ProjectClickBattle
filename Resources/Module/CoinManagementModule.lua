local coin_management = {
}

local coin_info = require "Resources.Module.CoinInfoModule"

local minimum_coin_value_percentage = 0.25

function coin_management.look_for_coin(money_value_to_look_for_coin)
	-- peço perdão a quem estiver lendo oq eu fiz aqui... eu não encontrei outra forma...
	local generated_coin = {}

	local i = 1
	local how_many_coins = math.random(1, table.maxn(coin_info.all_coins))
	local max_coin_value = money_value_to_look_for_coin / how_many_coins
	local current_looked_value = money_value_to_look_for_coin
	
	-- it basically atribute a random monetary value to each coin
	while i < (how_many_coins + 1) do
		local current_coin_id = coin_info.all_coins[i]
		local current_value
		
		if i == how_many_coins then
			current_value = current_looked_value
		else
			current_value = math.random(current_looked_value * minimum_coin_value_percentage, max_coin_value)
		end
		
		current_looked_value = current_looked_value - current_value
		local current_scale = math.min(((current_value / money_value_to_look_for_coin) * 4), 2)
		
		generated_coin[i] = {
			node = gui.get_node(current_coin_id), 
			node_scale = current_scale, 
			coin_value = current_value, 
			is_activated = false,
			collected = false}
			
		i = i + 1
	end
	return generated_coin
end



return coin_management