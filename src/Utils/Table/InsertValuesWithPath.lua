local Utils = require(script:FindFirstAncestor("Utils"))

return function(t, Path, Values)
	for _, Value in Values do
		Utils.InsertValueWithPath(t, Path, Value)
	end
end