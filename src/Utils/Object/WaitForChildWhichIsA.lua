return function(Parent: Instance, class: string, name: string?, timeOut: number?, recursive: boolean?): Instance?
	local connection = nil
	local Return = false
	local time_stop = timeOut and os.clock() + timeOut
	if recursive then
		for _,descendant in Parent:GetDescendants() do
			if descendant:IsA(descendant) and (descendant.Name == name or not name) then
				Return = descendant
				break
			end
		end
		connection = Parent.DescendantAdded:Connect(function(descendant: Instance)
			if descendant:IsA(class) and (descendant.Name == name or not name) then
				Return = descendant
			end
		end)
	else
		for _,child in Parent:GetChildren() do
			if child:IsA(class) and (child.Name == name or not name) then
				Return = child
				break
			end
		end
		connection = Parent.ChildAdded:Connect(function(child: Instance)
			if child:IsA(class) and (child.Name == name or not name) then
				Return = child
			end
		end)
	end
	while not Return do 
		if timeOut then 
			if os.clock() >= time_stop then
				return
			end
		end 
		task.wait() 
	end
	if connection then
		connection:Disconnect()
	end
	return Return
end