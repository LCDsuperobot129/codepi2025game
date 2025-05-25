local BS = game:GetService("BadgeService")

local badgeID = 2734994795194273

game.Players.PlayerAdded:Connect(function(player)
	if not BS:UserHasBadgeAsync(player.UserId, badgeID) then
		BS:AwardBadge(player.UserId, badgeID)
	end
end)
