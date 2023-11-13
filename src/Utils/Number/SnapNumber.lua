return function(number: number, SnapTo: number, method: string?): number
	return math[method or "round"](number / SnapTo) * SnapTo
end
