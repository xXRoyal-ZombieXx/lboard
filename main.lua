local m = {}
--// Variables \\--
local mlib = require(script.Parent.Parent.FunctionLibrary)
--// Functions \\--
m.Init = function(plr)
	for i,v in pairs(game.Players:GetChildren()) do
		print("Init "..v.Name)
		local data = mlib.GetData(v)
		local rank = v:GetRoleInGroup(13094513)
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = game.Players:GetUserThumbnailAsync(v.UserId, thumbType, thumbSize)
		local u = script.PlayerName:Clone()
		u.Name = v.Name
		u.Button.TextLabel.Text = v.Name
		print("Line 16 "..u.Button.TextLabel.Text)
		print("Line 17 "..v.Name)
		--// Headshot \\-
		u.Button.ImageLabel.Image = content
		u.PData.ImageLabel.Image = content
		u.PData.TextLabel.Text = v.Name
		--// Setting Data \\--
		local points = data.OtherData.StaffData.Points
		u.PData.Points.Text = points
		u.PData.Rank.Text = rank
		u.Parent = v.PlayerGui:WaitForChild("Leaderboard").ScrollingFrame
		wait(2)
	end
	return true
end

m.AddPlayer = function(plr,target)
	local data = mlib.GetData(plr)
	local rank = plr:GetRoleInGroup(13094513)
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game.Players:GetUserThumbnailAsync(plr.UserId, thumbType, thumbSize)
	--// Parenting \\--
	local u = script.PlayerName:Clone()
	print("Line 40 "..u.Button.TextLabel.Text)
	print("Line 41 "..plr.Name)
	u.Name = plr.Name
	u.Button.TextLabel.Text = plr.Name
	--// Headshot \\-
	u.Button.ImageLabel.Image = content
	u.PData.ImageLabel.Image = content
	u.PData.TextLabel.Text = plr.Name
	--// Setting Data \\--
	local points = data.OtherData.StaffData.Points
	u.PData.Points.Text = points
	u.PData.Rank.Text = rank
	u.Parent = target.PlayerGui:WaitForChild("Leaderboard").ScrollingFrame
end

m.RemovePlayer = function(plr)
	for i,v in pairs(game.Players:GetChildren()) do
		if not v.Name == plr.Name then
			v.PlayerGui.Leaderboard.ScrollingFrame[plr.Name]:Destroy()
		end
	end
end

m.ShowData = function()

end
return m
