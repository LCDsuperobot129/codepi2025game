local leaderstats = game.Players.LocalPlayer:WaitForChild("leaderstats")
local value = game:GetService("Players").LocalPlayer:WaitForChild("Jump Ability")

script.Parent.Text = tostring(value.value)
--script.Parent.Parent:FindFirstChild("PriceValue").Value = value.Value * (2 ^ value.Value)

value.Changed:Connect(function()
	script.Parent.Text = tostring(value.value)
	--script.Parent.Parent:FindFirstChild("PriceValue").Value = value.Value * (2 ^ value.Value)
end)
