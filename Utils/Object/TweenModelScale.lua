local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local Utils = require(script:FindFirstAncestor("Utils"))

return function(Model: Model, TweenInfo: TweenInfo, Scale: number): Tween
	local nv = Instance.new("NumberValue")
	nv.Value = 1
	local tween: Tween = TweenService:Create(nv, TweenInfo, {Value = Scale})
	tween:Play()
	local CenterCF = Model:GetPivot()
	for _,v: BasePart in Utils.GetChildren(Model, nil, "BasePart", true) do
		task.spawn(function()
			local OriginalSize = v.Size
			local Distance = (CenterCF.Position - v.Position).Magnitude
			local Direction = (v.Position - CenterCF.Position).Unit
			while tween.PlaybackState == Enum.PlaybackState.Playing and v:IsDescendantOf(game) do
				v.Size = OriginalSize * nv.Value
				v.CFrame = v.CFrame - v.Position + CenterCF.Position + Direction * (Distance * nv.Value)
				if RunService:IsClient() then
					RunService.RenderStepped:Wait()
				else
					task.wait()
				end
			end
			if v and v:IsDescendantOf(game) then
				if tween.PlaybackState ~= Enum.PlaybackState.Cancelled then
					v.Size = OriginalSize * Scale
					v.CFrame = v.CFrame - v.Position + CenterCF.Position + Direction * (Distance * Scale)
				end
			end
		end)
	end
	return tween
end
