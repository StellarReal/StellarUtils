return function(parent: Instance, name: string, class: string, recursive: boolean?): Instance?
	local children = nil
	if recursive then
		children = parent:GetDescendants()
	else
		children = parent:GetChildren()
	end
	local newChildren = {}
	for _,v in children do
		if (class and v:IsA(class) or not class) and (v.Name == name or not name) then
			return v
		end
	end
	return nil
end