local players = game:GetService("Players")
local player = players.LocalPlayer

wait(1)

local value = player:WaitForChild("STATS").Level

value.Changed:Connect(function()
	player.leaderstats.Level.Value += 1
	player.leaderstats.Coins.Value += 100
	player.leaderstats.Gems.Value += 1
end)
