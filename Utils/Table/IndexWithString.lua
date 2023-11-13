return function(t, IndexString: string)
	local v, LastIndex, Parent = t, nil, nil
	for _, index in IndexString:split(".") do
		if index == "" then continue end
		Parent = v
		v = v[index]
		LastIndex = index
	end
	return v, LastIndex, Parent
end