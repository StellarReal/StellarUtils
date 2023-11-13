local Utils = require(script:FindFirstAncestor("Utils"))

return function(v3: Vector3, SnapTo: number, SnapDict: {X: boolean?, Y: boolean?, Z: boolean?}?, method: string?): Vector3
	local SnappedV3: Vector3 = nil
	if SnapDict then
		SnappedV3 = Vector3.new(
			(SnapDict.X and v3.X) or Utils.SnapNumber(v3.X, SnapTo, method),
			(SnapDict.Y and v3.Y) or Utils.SnapNumber(v3.Y, SnapTo, method),
			(SnapDict.Z and v3.Z) or Utils.SnapNumber(v3.Z, SnapTo, method)
		)
	else
		SnappedV3 = Vector3.new(
			Utils.SnapNumber(v3.X, SnapTo, method),
			Utils.SnapNumber(v3.Y, SnapTo, method),
			Utils.SnapNumber(v3.Z, SnapTo, method)
		)
	end
	return SnappedV3
end