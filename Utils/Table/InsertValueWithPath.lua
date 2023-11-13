local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Value)
	local v = Utils.IndexWithString(t, Path)
	table.insert(v, Value)
end