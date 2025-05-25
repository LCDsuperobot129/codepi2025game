local CollectionService = game:GetService("CollectionService")
local tweenService = game:GetService("TweenService")

for _, part in CollectionService:GetTagged("QuestionCrystal") do
	local questionMark = part
	local effect = questionMark.Parent:WaitForChild("1")
	local glass = questionMark.Parent:WaitForChild("Glass")
	
	local properties = {
		["Position"] = questionMark.Position + Vector3.new(0, 2, 0)
	}
	
	local tweenInfo = TweenInfo.new(
		1.5,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut,
		-1,
		true,
		0
	)
	
	local tween = tweenService:Create(questionMark, tweenInfo, properties)
	local tween2 = tweenService:Create(effect, tweenInfo, properties)
	local tween3 = tweenService:Create(glass, tweenInfo, properties)
	
	tween:Play()
	tween2:Play()
	tween3:Play()
	
	effect:WaitForChild("Sound"):Play()
end
