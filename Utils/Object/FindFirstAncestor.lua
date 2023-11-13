return function(instance: Instance, lambda_function: (Instance) -> boolean): Instance?
	local parent = instance.Parent
	while true do
		if lambda_function(parent) then
			return parent
		end
		parent = parent.Parent
		if not parent then
			return nil
		end
	end
end