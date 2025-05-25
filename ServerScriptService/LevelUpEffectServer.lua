local effectModel = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):FindFirstChild("LevelUpEffect")

local event = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):FindFirstChild("LevelUpEffect")

local players = game:GetService("Players")

event.OnServerEvent:Connect(function(player)
	local effectModelClone = effectModel:Clone()
	
	local char = player.Character
	print(char.Name)
	effectModelClone.Parent = workspace
	
	effectModelClone.CFrame = char.HumanoidRootPart.CFrame
	effectModelClone.Position = char.HumanoidRootPart.Position
	
	effectModelClone.Position += Vector3.new(0, -3, 0)
	
	effectModelClone.Main.Parent = char.HumanoidRootPart
	effectModelClone.MiscEffects.Parent = char.HumanoidRootPart
	effectModelClone.Wind.Parent = char.HumanoidRootPart
	
	char.HumanoidRootPart.Main.Position += Vector3.new(0, -3, 0)
	char.HumanoidRootPart.MiscEffects.Position += Vector3.new(0, -3, 0)
	char.HumanoidRootPart.Wind.Position += Vector3.new(0, -3, 0)
	
	--[[
	local weld = Instance.new("WeldConstraint")
	weld.Parent = effectModelClone
	weld.Part0 = effectModelClone
	weld.Part1 = char.HumanoidRootPart
	
	]]--
	
	print("onserverevent")
	
	wait(1.5)
	
	char.HumanoidRootPart.Main.Sweep1.Rate = 0
	char.HumanoidRootPart.Main.Sweep2.Rate = 0
	char.HumanoidRootPart.Main.Sweep3.Rate = 0
	
	char.HumanoidRootPart.MiscEffects.Lines.Rate = 0
	char.HumanoidRootPart.MiscEffects.One.Rate = 0
	char.HumanoidRootPart.MiscEffects.Two.Rate = 0
	char.HumanoidRootPart.MiscEffects.Three.Rate = 0
	
	char.HumanoidRootPart.Wind.WindEffect.Rate = 0
	
	print("1.5")
	
	wait(3)
	
	effectModelClone:Destroy()
	char.HumanoidRootPart.Main:Destroy()
	char.HumanoidRootPart.MiscEffects:Destroy()
	char.HumanoidRootPart.Wind:Destroy()
	
	print("3")
end)
