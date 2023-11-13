local Utils = require(script:FindFirstAncestor("Utils"))

return function(Parent: Instance, CollisionGroup: string)
	for _, Part: BasePart in Utils.GetChildren(Parent, nil, "BasePart", true) do
		Part.CollisionGroup = CollisionGroup
	end
end