local PlayerStats = {}

local replicatedModules = game.ReplicatedStorage:WaitForChild("ModuleScripts")
local CalculateStats = require(replicatedModules:WaitForChild("CalculateStats"))

local remoteEvents = game.ReplicatedStorage:WaitForChild("RemoteEvents")
local levelUpRE = remoteEvents:WaitForChild("OnLevelUp")


function PlayerStats.New(plr: Player)
	
	local statsFolder = Instance.new("Folder")
	statsFolder.Name = "STATS"
	statsFolder.Parent = plr
	
	local levelValue = Instance.new("IntValue")
	levelValue.Name = "Level"
	levelValue.Parent = statsFolder
	
	local expValue = Instance.new("IntValue")
	expValue.Name = "Exp"
	expValue.Parent = statsFolder
end

function PlayerStats.AddExp(plr: Player, expToAdd: number)
	
	local plrStats = plr.STATS
	local plrLVL = plrStats.Level
	local plrEXP = plrStats.Exp
	
	local currentLevel = plrLVL.Value
	
	local newExp = plrEXP.Value + expToAdd
	
	PlayerStats.SetStats(plr, nil, newExp)
	
	local newLevel = plrLVL.Value
	
	if newLevel > currentLevel then
		
		levelUpRE:FireClient(plr)
	end
end

function PlayerStats.SetStats(plr: Player, newLevel: number, newExperience: number)
	
	local plrStats = plr.STATS
	local plrLVL = plrStats.Level
	local plrEXP = plrStats.Exp
	
	if not newLevel and not newExperience then
		return
	end
	
	if not newLevel then
		newLevel = CalculateStats.FromExp(newExperience)
	end
	if not newExperience then
		newExperience = CalculateStats.FromLevel(newLevel)
	end
	
	plrLVL.Value = newLevel
	plrEXP.Value = newExperience
end


return PlayerStats
