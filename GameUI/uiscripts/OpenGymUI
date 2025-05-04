local OpenGui = game.ReplicatedStorage:WaitForChild("UIEvents"):FindFirstChild("OpenGymUI")
local debounce = false

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

OpenGui.OnClientEvent:Connect(function()
	if localPlayer.PlayerGui.GymUI.Enabled == false then
		script.Parent.Enabled = true

		script.Open:Play()

		print("gym gui not already open")
	else
		print("gym gui already open, not opening")
	end
end)
