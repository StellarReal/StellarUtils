return function(v3: Vector3, min: Vector3, max: Vector3): Vector3
	return Vector3.new(math.clamp(v3.X, min.X, max.X),math.clamp(v3.Y, min.Y, max.Y),math.clamp(v3.Z, min.Z, max.Z))
end