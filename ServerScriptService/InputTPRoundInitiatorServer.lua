local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")

for _, part in CollectionService:GetTagged("InputTP") do
	part.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChild("Humanoid") then
			print("hum detected TP")
			local player = game.Players:GetPlayerFromCharacter(hit.Parent)
			local char = hit.Parent
			local hum = char.Humanoid
			local output = part.Parent.Output
			
			if player:WaitForChild("MaxObbyLevel").Value >= part:WaitForChild("Value").Value then
				hit.Parent.HumanoidRootPart.Position = output.Position + Vector3.new(0, 3, 0)
			else
				player.PlayerGui:WaitForChild("Sounds"):WaitForChild("NoPass"):Play()
			end

			--[[ local speed = hum.WalkSpeed  -- studs per sec, currently set to player humanoid's walkspeed

			RunService.RenderStepped:Connect(function(deltaTime)
				local character = player.Character
				if character and character:FindFirstChild("HumanoidRootPart") then
					local rootPart = character.HumanoidRootPart
					rootPart.CFrame = rootPart.CFrame * CFrame.new(-speed * deltaTime, 0, 0)
				end
				hum.Died:Connect(function()
					print("player died")
					
				end)
			end)
			--]]
		end
	end)
end
