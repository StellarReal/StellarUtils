--!nocheck
--[[

	//	Utils.BulkTween(array instances, TweenInfo tweeninfo, function Properties, string? name, string? class)
		-- Same function as the one above, but using a function to get the properties for each individual instance.
		
		* Arguments:
		1. Array of instances.
		2. TweenInfo for the tweens.
		3. Function to be ran for each instance in argument 1, which should return a dictionary of properties.
		4. Required name of instance. (optional)
		5. Required class of instance. (optional)
		
		* Returns:
		1. Array of tweens.
		
		* Example:
		local Tweens = Utils.BulkTween(workspace.Sword:GetDescendants(), TweenInfo.new(1.25, Enum.EasingStyle.Cubic, function(object)
			return {Transparency = Object.Transparency / 2, Size = Object.Size * 2}
		end, Enum.EasingDirection.In), nil, "BasePart"
		
		
		
	// 	Utils.BulkTween(dictionary instances, TweenInfo tweeninfo, array? exclusions)
		-- Use this function to tween multiple instances with an optional argument, except using the returned dictionary of Utils.BulkPropertyChange().
		
		* Arguments:
		1. Dictionary of instances. The index being the instance, the value being a dictionary of properties to change. This dictionary is returned by Utils.BulkPropertyChange().
		2. TweenInfo for the tweens.
		3. Array of instances to exclude from tweening. (optional)
		
		* Returns:
		1. Array of tweens.
		
		* Example:
		local ChangedInstances = Utils.BulkPropertyChange(
			game.Players.Roblox.Character:GetDescendants(), 
			{
				Transparency = .5, 
				Anchored = true, 
				CFrame = CFrame.new(0,20,0)
			}, 
			"BasePart"
		)
		
		local Tweens = Utils.BulkTween(
			ChangedInstances, 
			TweenInfo.new(5, Enum.EasingStyle.Bounce), 
			{game.Players.Roblox.Character.Head}
		)

]]

local TweenService = game:GetService("TweenService")

return function(instances: {Instance} | {[Instance]: {[string]: any}}, tweeninfo: TweenInfo, properties_or_exclusion_or_lambda: {[string]: any} | {string}? | (Instance) -> ({string: any}), name: string?, class: string?): {Tween}
	if #instances > 0 then
		local tweens = {}
		for _,v in instances do
			if (class and v:IsA(class) or not class) and (v.Name == name or not name) then
				local tween = TweenService:Create(v, tweeninfo, if type(properties_or_exclusion_or_lambda) == "table" then properties_or_exclusion_or_lambda elseif type(properties_or_exclusion_or_lambda) == "function" then properties_or_exclusion_or_lambda(v) else {})
				tween:Play()
				tweens[#tweens + 1] = tween
			end
		end
		return tweens
	else
		assert(type(properties_or_exclusion_or_lambda) == "table" or properties_or_exclusion_or_lambda == nil, "Exclusion is not a table.")
		local tweens = {}
		for inst, properties in instances do
			if properties_or_exclusion_or_lambda then
				for i,v in pairs(properties) do
					if table.find(properties_or_exclusion_or_lambda, i) then
						properties[i] = nil
					end
				end
			end
			local tween = TweenService:Create(inst, tweeninfo, properties)
			tween:Play()
			tweens[#tweens + 1] = tween
		end
		return tweens
	end
end