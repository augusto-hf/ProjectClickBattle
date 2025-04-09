local coin = {
}
-- preciso ir com tudo, so dessa vez
local coin_values = {1000, 750, 500, 200, 150, 100, 55, 25, 15, 5, 1}
local coin_starting_probability = 10
local coin_probability_increase = 5

local function generate_coin(coin_value)
	
end

local function look_for_coin(money_value_to_look_for_coin)
	-- peço perdão a quem estiver lendo oq eu fiz aqui... eu não encontrei outra forma...
	local generated_coin = 0
	local current_probability = math.random(0,100)
	local i = 0
	while i < table.maxn(coin_values) do
		if money_value_to_look_for_coin > 1000 and current_probability > 60 then
			generate_coin(coin_value)
		end
	end
end

function coin.generate_all_coins(money_value)
	local current_generated_coins = {}
	local current_generated_money = 0
	local coin_index = 0
	
	while current_generated_money < money_value do
		local new_coin_value = look_for_coin(money_value)
		table.insert(current_generated_coins, coin_index, new_coin_value)

		money_value = money_value - new_coin_value
		coin_index = coin_index + 1
	end
end	

return coin