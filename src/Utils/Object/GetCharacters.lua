local Players = game:GetService("Players")

return function(Blacklist: {Model}?): {Model}
	local t = {}
	
	for _, v in Players:GetPlayers() do
		if not (table.find(Blacklist or {}, v.Character) or table.find(Blacklist or {}, v)) then
			table.insert(t, v.Character)
		end
	end
	
	return t
end