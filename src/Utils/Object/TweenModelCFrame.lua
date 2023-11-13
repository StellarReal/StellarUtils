local TweenService = game:GetService("TweenService")
local TweeningModels: {[Model]: {Tween: Tween, Goal: CFrame}} = {}

return function(model: Model, tweenInfo: TweenInfo, cframe: CFrame, interval: number?): Tween
	local PreviousTween = TweeningModels[model]
	if PreviousTween then
		if PreviousTween.Goal ~= cframe then
			TweeningModels[model].Tween:Cancel()
		end
	end

	local v = Instance.new("CFrameValue")
	v.Value = model:GetPivot()

	local tween: Tween = game:GetService("TweenService"):Create(v, tweenInfo, {Value = cframe})
	TweeningModels[model] = {Tween = tween, Goal = cframe}
	tween:Play()
	tween.Completed:Connect(function()
		TweeningModels[model] = nil
	end)

	task.spawn(function()
		while tween.PlaybackState == Enum.PlaybackState.Playing and model:IsDescendantOf(game) do
			model:PivotTo(v.Value)
			task.wait(interval)
		end

		if not model:IsDescendantOf(game) then
			tween:Cancel()
		elseif tween.PlaybackState ~= Enum.PlaybackState.Cancelled then
			model:PivotTo(cframe)
		end
	end)

	return tween
end
