local Utils = require(script:FindFirstAncestor("Utils"))


return function(Model: Model, Scale: number)
	local CenterCF = Model:GetPivot()
	for _,v: BasePart in Utils.GetChildren(Model, nil, "BasePart", true) do
		local Distance = (CenterCF.Position - v.Position).Magnitude
		local Direction = (v.Position - CenterCF.Position).Unit
		if tostring(Direction.Magnitude) == "nan" then
			Direction = Vector3.zero
		end
		v.Size *= Scale
		v.CFrame = v.CFrame - v.Position + CenterCF.Position + Direction * (Distance * Scale)
	end
end
