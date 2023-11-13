--!nocheck
--[[
	// 	Utils.BulkPropertyChange(array instances, dictionary properties, string? name, string? class)
		-- Use this function to change the properties of multiple instances with the optional class and name argument.
		
		* Arguments:
		1. Array of instances to change properties of.
		2. Dictionary of properties to change. (Similar to TweenService)
		3. Required name of child. (optional)
		4. Required class of child. (optional)
		
		* Returns:
		1. Dictionary of changed instances. The index being the Instance, the value being the dictionary of changed properties.
		
		* Example:
		local DictionaryOfChangedInstances = Utils.BulkPropertyChange(workspace.Model:GetDescendants(), {Transparency = 1, Color = Color3.new(1,0,1)}, nil, "BasePart")
	
	
	
	//	Utils.BulkPropertyChange(dictionary ChangedInstances)
		-- Use this function to change the properties of multiple instances, except using the returned dictionary of this function itself. Basically reverts the changes.
		
		* Arguments:
		1. Dictionary of changed instances. (returned from this function itself)
		
		* Returns:
		1. Dictionary of changed instances. The index being the Instance, the value being the dictionary of changed properties.
		
		* Example:
		local ChangedInstances = Utils.BulkPropertyChange(DictionaryOfChangedInstances)
		
]]

return function(instances: {Instance} | {[Instance]: {[string]: any}}, properties: {[string]: any}?, name: string?, class: string?): {[Instance]: {[string]: any}}
	assert(type(instances) == "table", "Given table is invalid.")
	if #instances > 0 then
		local previousProperties: {[Instance]: {[string]: any}} = {}
		for _,instance in instances do
			for property, value in properties do
				if ((class and instance:IsA(class)) or not class) and (instance.Name == name or not name) then
					if instance[property] ~= value then
						previousProperties[instance] = {[property] = instance[property]}
						instance[property] = value
					end
				end
			end
		end
		return previousProperties
	else
		local previousProperties: {[Instance]: {[string]: any}} = {}
		for inst, properties in instances do
			for property, value in properties do
				inst[property] = value
			end
		end
		return previousProperties
	end
end