local speedMultiplier = 1.25
local defaultWalkSpeed = 16

script.Parent.Equipped:Connect(function()
	script.Parent.Handle.CoilSound:Play()
	local humanoid = script.Parent.Parent:FindFirstChild("Humanoid");
	
	defaultWalkSpeed = humanoid.WalkSpeed
	
	task.wait(0.0001)
	
	humanoid.WalkSpeed *= speedMultiplier
end)

script.Parent.Unequipped:Connect(function()
	
	local char = script.Parent.Parent.Parent.Character
	local humanoid = char:FindFirstChild("Humanoid")	
	humanoid.WalkSpeed = defaultWalkSpeed
end)
