local serverModules = game.ServerStorage:WaitForChild("ModuleScripts")
local Data = require(serverModules:WaitForChild("Data"))
local PlayerStats = require(serverModules:WaitForChild("PlayerStats"))


game.Players.PlayerAdded:Connect(function(plr: Player)
	
	PlayerStats.New(plr)
	
	local plrData = Data.Load(plr) or {}
	local plrLvl = plrData.LEVEL or 0
	local plrExp = plrData.EXP or 0
	
	PlayerStats.SetStats(plr, plrLvl, plrExp)
end)


game.Players.PlayerRemoving:Connect(function(plr: Player)
	
	Data.Save(plr)
end)

game:BindToClose(function()
	
	for _, plr in pairs(game.Players:GetPlayers()) do
		
		Data.Save(plr)
	end
end)
