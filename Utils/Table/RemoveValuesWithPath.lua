local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Indexes)
	local v = Utils.IndexWithString(t, Path)
	
	table.sort(Indexes, function(a, b) 
		return a > b 
	end)

	for i, index in Indexes do
		table.remove(v, index)
	end
end