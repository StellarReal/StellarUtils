return function(t, identifiers: {[string]: any})
	for index, item in t do
		if type(item) ~= "table" then continue end 
		local success = true

		for i, v in identifiers do
			if type(v) == "function" then
				if not v(item, item[i]) then
					success = false
				end
			else
				if item[i] ~= v then
					success = false
				end
			end
		end

		if success then
			return index
		end
	end
end