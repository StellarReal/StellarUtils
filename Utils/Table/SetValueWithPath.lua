local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Value, Index)
	local v, i, p = Utils.IndexWithString(t, Path)
	if not Index then
		p[i] = Value
	else
		v[Index] = Value
	end
end