local Data = {}

local dss = game:GetService("DataStoreService")
local ds = dss:GetDataStore("Testing4LevelDataStore")


function Data.Load(plr: Player)
	
	local plrKey = plr.UserId
	
	local plrData = ds:GetAsync(plrKey)
	
	return plrData
end

function Data.Save(plr: Player)
	
	local plrStats = plr.STATS
	local plrLVL = plrStats.Level
	local plrEXP = plrStats.Exp
	
	local plrKey = plr.UserId
	
	local plrData = {
		LEVEL = plrLVL.Value;
		EXP = plrEXP.Value;
	}
	
	ds:SetAsync(plrKey, plrData)
end


return Data
