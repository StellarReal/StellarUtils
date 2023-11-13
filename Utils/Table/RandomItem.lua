return function(Array: {any}, ReturnIndex: boolean?): (any, number?)
	assert(type(Array) == "table" and #Array > 0, "Given table is invalid.")
	local rn = math.random(#Array)
	if not ReturnIndex then
		return Array[rn]
	else
		return Array[rn], rn
	end
end
