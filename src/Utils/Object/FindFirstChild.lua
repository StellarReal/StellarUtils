return function(parent: Instance, lambda_function: (Instance) -> boolean, recursive: boolean?): Instance?
	local children
	if recursive then
		children = parent:GetDescendants()
	else
		children = parent:GetChildren()
	end
	for _,v in children do
		if lambda_function(v) then
			return v
		end
	end
	return nil
end