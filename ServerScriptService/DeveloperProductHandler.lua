local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local replicatedStorage = game:GetService("ReplicatedStorage")
local tools = replicatedStorage:WaitForChild("Storage").ShopItems

MarketplaceService.ProcessReceipt = function(receiptInfo)
	local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local success, err = pcall(function()
		if receiptInfo.ProductId == 3235545260 then -- Replace with actual Product ID
			-- give 1x speedcoil
			print("give 1x speedcoil")
			
			local speedcoil = tools.SpeedCoil
			local speedcoilClone = speedcoil:Clone()
			speedcoilClone.Parent = player.Backpack

		elseif receiptInfo.ProductId == 3235684997 then -- Another Product ID
			-- give 1x gravitycoil
			
			print("give 1x gravitycoil")
			
			local gravitycoil = tools.GravityCoil
			local gravitycoilClone = gravitycoil:Clone()
			gravitycoilClone.Parent = player.Backpack
			
		end
	end)

	if success then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	else
		warn("Error processing purchase: " .. err)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
end
