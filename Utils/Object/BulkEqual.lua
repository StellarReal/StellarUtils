return function(Value1: any, Operator: "and" | "or", ...: any): boolean
	for _,Value2 in {...} do
		if Operator == "and" and Value1 ~= Value2 then
			return false
		elseif Operator == "or" and Value1 == Value2 then
			return true
		end
	end
	if Operator == "and" then
		return true
	else
		return false
	end
end