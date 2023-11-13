local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Value)
	local v = Utils.IndexWithString(t, Path)
	return table.find(v, Value)
end