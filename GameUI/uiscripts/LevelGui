local barGui = script.Parent:WaitForChild("LevelBarGui")
local barBG = barGui:WaitForChild("BarBackground")
local barContainer = barBG:WaitForChild("BarContainer")
local barClipping = barContainer:WaitForChild("Clipping"); barClipping.AnchorPoint = Vector2.new(0, 0.5); barClipping.Position = UDim2.new(0, 0, 0.5, 0)
local barBar = barClipping:WaitForChild("Bar"); barBar.AnchorPoint = Vector2.new(0, 0.5); barBar.Position = UDim2.new(0, 0, 0.5, 0)
local currentLevelText = barBG:WaitForChild("CurrentLevel")
local nextLevelText = barBG:WaitForChild("NextLevel")
local expText = barBG:WaitForChild("Exp")

local levelUpGui = script.Parent:WaitForChild("LevelUpGui"); levelUpGui.Enabled = false
local levelUpBG = levelUpGui:WaitForChild("Background")
local levelUpTitle = levelUpBG:WaitForChild("Title")
local levelUpText = levelUpBG:WaitForChild("Body")

local plr = game.Players.LocalPlayer
local plrStats = plr.STATS
local plrLVL = plrStats.Level
local plrEXP = plrStats.Exp

local replicatedModules = game.ReplicatedStorage:WaitForChild("ModuleScripts")
local CalculateStats = require(replicatedModules:WaitForChild("CalculateStats"))

local remoteEvents = game.ReplicatedStorage:WaitForChild("RemoteEvents")
local levelUpRE = remoteEvents:WaitForChild("OnLevelUp")

local tweenService = game:GetService("TweenService")

local prefix = "Lv. "


barClipping:GetPropertyChangedSignal("Size"):Connect(function()
	barBar.Size = UDim2.new(1/barClipping.Size.X.Scale, 0, 1, 0)
end)

function OnExpChanged()
	
	local previousExp = CalculateStats.FromLevel(plrLVL.Value)
	local nextExp = CalculateStats.FromLevel(plrLVL.Value + 1)
	
	local currentExpTotal = plrEXP.Value
	
	local currentExp = currentExpTotal - previousExp
	local neededExp = nextExp - previousExp
	
	local textToDisplay = currentExp .. "/" .. neededExp
	expText.Text = textToDisplay
	
	local scaleX = currentExp / neededExp
	local inverseScaleX = scaleX > 0 and 1/scaleX or 0
	
	local goalClipping = {Size = UDim2.new(scaleX, 0, 1, 0)}
	local goalBar = {Size = UDim2.new(inverseScaleX, 0, 1, 0)}
	
	local tweenDuration = math.clamp(math.abs(scaleX - barClipping.Size.X.Scale), 0, 0.7)
	local tweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	
	local tweenClipping = tweenService:Create(barClipping, tweenInfo, goalClipping)
	tweenClipping:Play()
end

function OnLevelChanged()

	local currentLevel = plrLVL.Value
	local nextLevel = currentLevel + 1

	local currentToDisplay = prefix .. currentLevel
	local nextToDisplay = prefix .. nextLevel

	currentLevelText.Text = currentToDisplay
	nextLevelText.Text = nextToDisplay
end

OnExpChanged()
OnLevelChanged()

plrEXP:GetPropertyChangedSignal("Value"):Connect(OnExpChanged)
plrLVL:GetPropertyChangedSignal("Value"):Connect(OnLevelChanged)


local lastLeveledUp = 0

function OnLevelUp()
	
	local now = tick()
	lastLeveledUp = now
	
	local previousLevel = plrLVL.Value - 1
	local currentLevel = previousLevel + 1
	
	local previousToDisplay = prefix .. previousLevel
	local currentToDisplay = prefix .. currentLevel
	
	local textToDisplay = "<font size = '10' color='rgb(135, 135, 135)'>" .. previousToDisplay .. "→</font> <font color='rgb(255,162,32)'>" .. currentToDisplay .."</font>"
	levelUpText.Text = textToDisplay
	
	ShowLevelUp()
	
	task.wait(5)
	
	if levelUpGui.Enabled == true and lastLeveledUp == now then
		
		HideLevelUp()
	end
end

function ShowLevelUp()
	
	local started = tick()
	
	levelUpBG.BackgroundTransparency = 1
	levelUpTitle.TextTransparency = 1
	levelUpText.TextTransparency = 1

	local levelUpTextPos = UDim2.new(0.5, 0, 0.5, 0)
	local levelUpTextSize = UDim2.new(0.62, 0, 0.118, 0)

	levelUpText.Position = levelUpTextPos + UDim2.new(0, 0, 0.1, 0)
	levelUpText.Size = levelUpTextSize - UDim2.new(0.2, 0, 0.2, 0)

	levelUpGui.Enabled = true
	
	levelUpGui.LevelUpSound:Play()

	local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local bgTween = tweenService:Create(levelUpBG, tweenInfo, {BackgroundTransparency = 0.1})
	bgTween:Play()

	local titleTween = tweenService:Create(levelUpTitle, tweenInfo, {TextTransparency = 0})
	titleTween:Play()

	task.wait(0.1)
	
	if levelUpGui.Enabled == true and started > lastLeveledUp then
		
		local textTween = tweenService:Create(levelUpText, tweenInfo, {TextTransparency = 0, Position = levelUpTextPos, Size = levelUpTextSize})
		textTween:Play()
	end
end

function HideLevelUp()
	
	local started = tick()
	
	local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local textTween = tweenService:Create(levelUpText, tweenInfo, {TextTransparency = 1})
	textTween:Play()
	
	task.wait(0.2)
	
	if levelUpGui.Enabled == true and started > lastLeveledUp then
		
		local bgTween = tweenService:Create(levelUpBG, tweenInfo, {BackgroundTransparency = 1})
		bgTween:Play()

		local titleTween = tweenService:Create(levelUpTitle, tweenInfo, {TextTransparency = 1})
		titleTween:Play()
		
		titleTween.Completed:Wait()
		
		levelUpGui.Enabled = false
	end
end

levelUpBG.MouseButton1Click:Connect(HideLevelUp)

levelUpRE.OnClientEvent:Connect(OnLevelUp)
