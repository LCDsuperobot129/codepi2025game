local repStorage = game:GetService("ReplicatedStorage")
local UIEvents = repStorage:WaitForChild("UIEvents")
local closeProblemUI = UIEvents:WaitForChild("CloseProblemUI")

local defaultWalkSpeed = 16 -- set to default walkspeed for players

closeProblemUI.OnServerEvent:Connect(function(player)
	player.Character.Humanoid.WalkSpeed = defaultWalkSpeed + player:FindFirstChild("Speed Ability").Value
	player.Character.Humanoid.Health -= 75
	
	player.PlayerGui.ProblemUI.AnswerFrame.Answer.CorrectAnswer.Value = "NOTOCCUPIED"
end)
