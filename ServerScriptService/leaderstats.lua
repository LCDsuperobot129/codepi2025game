-- // Assigning variables //
local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("Testing4DataStoreV2") -- This can be changed to whatever you want

local function saveData(player) -- The functions that saves data

	local tableToSave = {
		player.leaderstats.Coins.Value; -- First value from the table
		player.leaderstats.Gems.Value;
		player.STATS.Level.Value; -- Second value from the table
		player.STATS.RebirthValue.Value
	}

	local success, err = pcall(function()
		dataStore:SetAsync(player.UserId, tableToSave) -- Save the data with the player UserId, and the table we wanna save
	end)

	if success then -- If the data has been saved
		print("Data has been saved!")
	else -- Else if the save failed
		print("Data hasn't been saved!")
		warn(err)		
	end
end

game.Players.PlayerAdded:Connect(function(player) -- When a player joins the game
	

	-- // Assigning player stats //
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Money = Instance.new("NumberValue")
	Money.Name = "Coins"
	Money.Parent = leaderstats
	
	local gems = Instance.new("NumberValue")
	gems.Name = "Gems"
	gems.Parent = leaderstats

	local level = Instance.new("IntValue")
	level.Name = "Level"
	level.Parent = leaderstats
	
	local rebirth = Instance.new("NumberValue")
	rebirth.Name = "RebirthValue"
	rebirth.Parent = player:WaitForChild("STATS")

	local data -- We will define the data here so we can use it later, this data is the table we saved
	local success, err = pcall(function()

		data = dataStore:GetAsync(player.UserId) -- Get the data from the datastore

	end)

	if success and data then -- If there were no errors and player loaded the data

		Money.Value = data[1] -- Set the coins to the first value of the table (data)
		gems.Value = data[2] -- Set the gems to the second value of the table (data)
		level.Value = data[3]
		rebirth.Value = data[4]

	else -- The player didn't load in the data, and probably is a new player
		print("The player has no data!") -- The default will be set to 0
	end

end)

game.Players.PlayerRemoving:Connect(function(player) -- When a player leaves
	local success, err  = pcall(function()
		saveData(player) -- Save the data
	end)

	if success then
		print("Data has been saved")
	else
		print("Data has not been saved!")
	end
end)

game:BindToClose(function() -- When the server shuts down
	for _, player in pairs(game.Players:GetPlayers()) do -- Loop through all the players
		local success, err  = pcall(function()
			saveData(player) -- Save the data
		end)

		if success then
			print("Data has been saved")
		else
			print("Data has not been saved!")
		end
	end
end)
