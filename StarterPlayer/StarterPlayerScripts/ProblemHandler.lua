local repStorage = game:GetService("ReplicatedStorage")
local UIEvents = repStorage:WaitForChild("UIEvents")
local proxEvent = UIEvents:WaitForChild("ProximityPromptInteractClient")

local players = game:GetService("Players")
local player = players.LocalPlayer
local defaultWalkSpeed = 16 -- change for default walk speed of players

local ContextActionService = game:GetService("ContextActionService")
local EnumActions = Enum.PlayerActions:GetEnumItems()

-- Disable movement and controls
local function freezeControls()
	ContextActionService:BindAction(
		"FreezePlayer", -- unique name
		function()
			return Enum.ContextActionResult.Sink
		end,
		false,
		unpack(EnumActions)
	)
end

-- Enable movement and controls again
local function unfreezeControls()
	ContextActionService:UnbindAction("FreezePlayer")
end

local debounce = false

proxEvent.OnClientEvent:Connect(function(question, correctAnswer, proxType, detectorGroup)
	player.Character.Humanoid.WalkSpeed = 0
	
	repStorage.UIEvents.ZeroWalkSpeed:FireServer(player)
	
	print("client event triggered")
	print("Question: " .. question)
	print("Correct Answer: " .. correctAnswer)
	print("Problem Prompt Type: " .. proxType)
	
	local enterButton = player.PlayerGui.ProblemUI.ProblemFrame.Enter
	local answerTextBox = player.PlayerGui.ProblemUI.AnswerFrame.Answer
	local correctAnswerValue = answerTextBox.CorrectAnswer
	
	player.PlayerGui.ProblemUI.Enabled = true
	player.PlayerGui.ProblemUI.ProblemFrame.Problem.Text = question
	
	enterButton.MouseButton1Click:Connect(function()
		if not debounce then
			debounce = true
			
			print("enterButton click")
			print(answerTextBox.Text)
			print(correctAnswerValue.Value)
			print(correctAnswer)

			if answerTextBox.Text == tostring(correctAnswer) and answerTextBox.Text == tostring(correctAnswerValue.Value) then
				print("CORRECT LETS GOOOOO")
				player.PlayerGui.ProblemUI.Enabled = false
				player.Character.Humanoid.WalkSpeed = defaultWalkSpeed + player:FindFirstChild("Speed Ability").Value

				if proxType == "Dimensional Detector" then
					detectorGroup.PowerBox.ProximityPrompt.Model.ProxGroup.ProxPart.ProximityPrompt.Script.Hacked:Play()
					detectorGroup.Detector.ForcefieldRange.Transparency = 1
					detectorGroup.Detector.ForcefieldRange.CanTouch = false

					wait(3)

					detectorGroup.PowerBox.ProximityPrompt.Model.ProxGroup.ProxPart.ProximityPrompt.Script.Restart:Play()
					detectorGroup.Detector.ForcefieldRange.Transparency = 0
					detectorGroup.Detector.ForcefieldRange.CanTouch = true
				elseif proxType == "Question Crystal" then
					--player.PlayerGui.ProblemUI.Enabled = false
					
					--player.Character.HumanoidRootPart.Anchored = false
					
					--unfreezeControls()
					
					player.PlayerGui.ProblemUI.ProblemFrame.Enter.QuestionCrystalCorrect:Play()
					
					task.wait(0.01)
					
					player.Character.Humanoid.WalkSpeed = defaultWalkSpeed + player:FindFirstChild("Speed Ability").Value
					
					task.wait(3)
					
					repStorage.UIEvents.ReEnableQuestionCrystal:FireServer(detectorGroup)
					
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
				end
			else
				print("WRONG, ELSE STATEMENT")
				script.Incorrect:Play()
				
				player.Character.Humanoid.Health -= 25
				
				if proxType == "Question Crystal" then
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
				end
			end
			
			wait(0.5) -- change for cooldown
			
			debounce = false
		end
	end)
	
	if proxType == "Question Crystal" then
		task.wait(30)

		repStorage.UIEvents.ReEnableQuestionCrystal:FireServer(detectorGroup)

		print("reset question crystal brute force")
	end
	
	-- re-enable question crystal here for closebutton bug
end)
