local button = script.Parent

local player = script.Parent.Parent.Parent.Parent.Parent.Parent

local increase = 0.05 -- increase in stats per click

button.MouseButton1Click:Connect(function()
	local price = script.Parent:FindFirstChild("PriceValue")
	
	local coins = player.leaderstats.Coins
	
	if coins.Value >= price.Value then
		coins.Value -= price.Value
		
		script:FindFirstChild("Buy"):Play()
		
	
		
		print("enough money for purchase")
		
		print(price.Value)
		
		print(coins.Value - price.Value)
		
		player["Jump Ability"].Value += 0.05
	else
		
		
		script:FindFirstChild("ShortOfMoney"):Play()
		
		print("not enough money for purchase")
	end
end)
