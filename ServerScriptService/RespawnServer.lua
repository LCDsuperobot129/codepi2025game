local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:FindFirstChild("RespawnRE")

RemoteEvent.OnServerEvent:Connect(function(player)
	player:LoadCharacter()
end)
