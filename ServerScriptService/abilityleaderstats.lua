-- // Assigning variables //
local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("Testing6AbilityDataStore") -- This can be changed to whatever you want

local function saveData(player) -- The functions that saves data

	local tableToSave = {
		player["Speed Ability"].Value;
		player["Jump Ability"].Value;
		player.MaxObbyLevel.Value
	}

	local success, err = pcall(function()
		dataStore:SetAsync(player.UserId, tableToSave) -- Save the data with the player UserId, and the table we wanna save
	end)

	if success then -- If the data has been saved
		print("abilityData has been saved!")
	else -- Else if the save failed
		print("abilityData hasn't been saved!")
		warn(err)		
	end
end

game.Players.PlayerAdded:Connect(function(player) -- When a player joins the game
	

	-- // Assigning player stats //
	local speed = Instance.new("NumberValue")
	speed.Name = "Speed Ability"
	speed.Parent = player

	local jump = Instance.new("NumberValue")
	jump.Name = "Jump Ability"
	jump.Parent = player
	
	local MaxObbyLevel = Instance.new("NumberValue")
	MaxObbyLevel.Name = "MaxObbyLevel"
	MaxObbyLevel.Parent = player

	local data -- We will define the data here so we can use it later, this data is the table we saved
	local success, err = pcall(function()

		data = dataStore:GetAsync(player.UserId) -- Get the data from the datastore

	end)

	if success and data then -- If there were no errors and player loaded the data

		speed.Value = data[1]
		jump.Value = data[2]
		MaxObbyLevel.Value = data[3]

	else -- The player didn't load in the data, and probably is a new player
		print("The player has no ability data!") -- The default will be set to 0
	end

end)

game.Players.PlayerRemoving:Connect(function(player) -- When a player leaves
	local success, err  = pcall(function()
		saveData(player) -- Save the data
	end)

	if success then
		print("Ability data has been saved")
	else
		print("Ability data has not been saved!")
	end
end)

game:BindToClose(function() -- When the server shuts down
	for _, player in pairs(game.Players:GetPlayers()) do -- Loop through all the players
		local success, err  = pcall(function()
			saveData(player) -- Save the data
		end)

		if success then
			print("Ability data has been saved les gooooooo")
		else
			print("Ability data has not been saved les not go :C!")
		end
	end
end)
