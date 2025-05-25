local repStorage = game:GetService("ReplicatedStorage")
local UIEvents = repStorage:WaitForChild("UIEvents")
local closeProblemUI = UIEvents:WaitForChild("ReEnableQuestionCrystal")

closeProblemUI.OnServerEvent:Connect(function(player, detectorGroup)
	detectorGroup.QuestionMark.Transparency = 0
	detectorGroup.Glass.Transparency = 0.5

	detectorGroup.Glass.CanTouch = true

	detectorGroup:FindFirstChild("1").Sound:Play()

	detectorGroup:FindFirstChild("1").Part1.Charge.Transparency = NumberSequence.new(0.9) -- set to numbersequence format
	detectorGroup:FindFirstChild("1").Part1.Swirl.Transparency = NumberSequence.new(0.7)

	detectorGroup.Glass.t1.Transparency = 0.5
	detectorGroup.Glass.t2.Transparency = 0.5
	detectorGroup.Glass.t3.Transparency = 0.5
	detectorGroup.Glass.t4.Transparency = 0.5
	detectorGroup.Glass.t5.Transparency = 0.5
	detectorGroup.Glass.t6.Transparency = 0.5
end)
