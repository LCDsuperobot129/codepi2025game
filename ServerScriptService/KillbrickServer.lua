local CollectionService = game:GetService("CollectionService")

for _, part in CollectionService:GetTagged("Killbrick") do
	part.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			hit.Parent.Humanoid.Health = 0
		end
	end)
end
