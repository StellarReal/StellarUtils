return function(parent, name_or_function, class_or_recursive, recursive)
	local newChildren = {}
	local children = nil

	if type(name_or_function) == "string" or not name_or_function then
		if recursive then
			children = parent:GetDescendants()
		else
			children = parent:GetChildren()
		end
		for _,v in children do
			if (class_or_recursive and v:IsA(class_or_recursive) or not class_or_recursive) and (v.Name == name_or_function or not name_or_function) then
				table.insert(newChildren, v)
			end
		end
	elseif type(name_or_function) == "function" then
		if class_or_recursive then
			children = parent:GetDescendants()
		else
			children = parent:GetChildren()
		end
		for _,v in children do
			if name_or_function(v) then
				table.insert(newChildren, v)
			end
		end
	else
		if recursive then
			newChildren = parent:GetDescendants()
		else
			newChildren = parent:GetChildren()
		end
	end
	
	return newChildren
end
