return function(Objects: {any}, Property: string, Value: any): boolean
	for _,v in Objects do
		if v[Property] ~= Value then
			return false
		end
	end
	return true
end