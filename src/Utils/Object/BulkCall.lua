return function<F>(t: {{[F]: (any) -> (any)} | Instance}, functionToCall: F, PassSelf: boolean?, ...)
	for _,v in t do
		if PassSelf then
			v[functionToCall](v, ...)
		else
			v[functionToCall](...)
		end
	end
end