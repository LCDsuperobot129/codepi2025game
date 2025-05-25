local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animateScript = character:WaitForChild("Animate")

-- walk animation ID
local newWalkAnimId = "rbxassetid://98490601180033"

local walkAnim = Instance.new("Animation")
walkAnim.AnimationId = newWalkAnimId

animateScript.walk.WalkAnim.AnimationId = newWalkAnimId
