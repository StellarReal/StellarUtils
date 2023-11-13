local Utils = require(script:FindFirstAncestor("Utils"))

return function(parent: Instance, name_or_function, class_or_recursive, recursive: boolean?): number
	local n = 0
	
	if type(name_or_function) == "function" then
		for _,v in Utils.GetChildren(parent, name_or_function, class_or_recursive) do
			n += 1
			v:Destroy()
		end
	else
		for _,v in Utils.GetChildren(parent, name_or_function, class_or_recursive, recursive) do
			if v.Name == name_or_function or not name_or_function then
				n += 1
				v:Destroy()
			end
		end
	end
	
	return n
end
