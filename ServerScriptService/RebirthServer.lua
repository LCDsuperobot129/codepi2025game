local replicatedStorage = game:GetService("ReplicatedStorage")
local onRebirth = replicatedStorage:WaitForChild("RemoteEvents").OnRebirth

local rebirthGain = 0.3 -- decimal,change if wanted
local price = 100000
local gemPrice = 250

onRebirth.OnServerEvent:Connect(function(plr)
	-- do rebirth stuff
	
	local leaderstats = plr.leaderstats
	local coins =  leaderstats.Coins
	local gems = leaderstats.Gems
	
	local STATS = plr.STATS
	local rebirthValue = STATS.RebirthValue
	local level = STATS.Level
	local exp = STATS.Exp
	
	local speedAbility = plr["Speed Ability"]
	local jumpAbility = plr["Jump Ability"]
	
	coins.Value -= price
	gems.Value -= gemPrice
	
	rebirthValue.Value += rebirthGain
	
	local min = 1000
	local max = 10000
	local randomExpToGive = math.random(min, max)
	
	exp.Value += randomExpToGive
	
	speedAbility = 0
	jumpAbility = 0
	
	
	
	print("rebirth event server start")
end)
