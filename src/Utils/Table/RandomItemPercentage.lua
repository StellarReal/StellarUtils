return function(PercentageDict: {[any]: number}): (any?, number?)
	assert(type(PercentageDict) == "table", "Given table is invalid.")
	local Total = 0
	
	local PercentageArray = {}

	for i, v in pairs(PercentageDict) do
		table.insert(PercentageArray, {Object = i, Percentage = v})
	end
	
	table.sort(PercentageArray, function(a, b)
		return a.Percentage > b.Percentage
	end)

	for _, v in PercentageArray do
		Total += v.Percentage
	end
	
	assert(Total > 0, `Total number of chances comes to a total of 0. Maybe you forgot to set them?`)

	local RandomNumber = math.random(Total * 1000) / 1000
	local Value = 0

	for _, v in PercentageArray do
		Value += v.Percentage
		if RandomNumber <= Value then
			return v.Object, RandomNumber
		end
	end
	
	return
end