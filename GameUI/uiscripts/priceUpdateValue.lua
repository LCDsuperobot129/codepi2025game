local leaderstats = game.Players.LocalPlayer:WaitForChild("leaderstats")
local value = script.Parent.Parent:FindFirstChild("PriceValue")

script.Parent.Text ="$"..tostring(value.value)

value.Changed:Connect(function()
	script.Parent.Text = "$"..tostring(value.value)
end)
