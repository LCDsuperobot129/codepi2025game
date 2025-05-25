wait(0.0001)

local player = script.Parent.Parent

local level = player:FindFirstChild("STATS"):FindFirstChild("Level")

local rep = game:GetService("ReplicatedStorage")
local event = rep:FindFirstChild("RemoteEvents"):FindFirstChild("LevelUpEffect")

wait(1)

level.Changed:Connect(function()
	event:FireServer(player)
	print("fireserver")
end)
