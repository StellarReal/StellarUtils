local abbreviations = {"","K","M","B","T","qd","Qn","sx","Sp","O","N","de","Ud","DD","tdD","qdD","QnD","sxD","SpD","OcD","NvD","Vgn","UVg","DVg","TVG","qtV","QnV","SeV","SPG","OVG","NVG","TGN","UTG","DTG","tsTG","qtTG","QnTG","ssTG","SpTG","OcTG","NoTG","QdDR","uQDR","dQDR","tQDR","qdQDR","QnQDR","sxQDR","SpQDR","OQDDr","NQDDr","qQGNT","uQGNT","dQGNT","tQGNT","qdQGNT","QnQGNT","sxQGNT","SpQGNT","OQQGNT","NQQGNT","SXGNTL","USXGNTL","DSXGNTL","TSXGNTL","QTSXGNTL","QNSXGNTL","SXSXGNTL","SPSXGNTL","OSXGNTL"}

local function formatNumber(num)
	local formatted = tostring(num):reverse():gsub("%d%d%d", "%0,"):reverse()
	if formatted:sub(1, 1) == "," then
		formatted = formatted:sub(2)
	end
	return formatted
end

return function(num)
	num = math.floor(num)
	if num < 100000 then
		return formatNumber(num)
	end
	local exponent = math.floor(math.log(num, 1000))
	local value = num / (1000 ^ exponent)
	if exponent > 1 then
		value = math.floor(value * 10) / 10
	else
		value = math.floor(value)
	end
	return value .. abbreviations[exponent + 1]
end