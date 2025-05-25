local character = script.Parent

local humanoid = character:WaitForChild("Humanoid")

local players = game:GetService("Players")

local player = players:GetPlayerFromCharacter(character)

local leaderstats = player:WaitForChild("leaderstats")

local speed = player:FindFirstChild("Speed Ability")
local jump = player:FindFirstChild("Jump Ability")

local defaultWalkSpeed = 16 -- default walkspeed of game
local defaultJumpHeight = 7.2 -- defaukt jumppower of game


humanoid.WalkSpeed = defaultWalkSpeed + speed.Value
humanoid.JumpHeight = defaultJumpHeight + jump.Value

speed.Changed:Connect(function()
	humanoid.WalkSpeed = defaultWalkSpeed + speed.Value
end)

jump.Changed:Connect(function()
	humanoid.JumpHeight = defaultJumpHeight + jump.Value
end)
