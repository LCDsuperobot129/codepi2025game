local repStorage = game:GetService("ReplicatedStorage")
local UIEvents = repStorage:WaitForChild("UIEvents")
local closeProblemUI = UIEvents:WaitForChild("ZeroWalkSpeed")

local defaultWalkSpeed = 16 -- set to default walkspeed for players

closeProblemUI.OnServerEvent:Connect(function(player)
	player.Character.Humanoid.WalkSpeed = 0
end)
