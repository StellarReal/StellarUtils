local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Index)
	local v = Utils.IndexWithString(t, Path)
	return table.remove(v, Index)
end