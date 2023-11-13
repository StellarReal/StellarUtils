local TweenService = game:GetService("TweenService")

return function(UI_Dictionary: {[GuiObject]: {[string]: number}}, TweenInfo: TweenInfo)
for UI, Properties in pairs(UI_Dictionary) do
	if UI:IsA("GuiObject") then
		if TweenInfo.Time > 0 then
			TweenService:Create(UI, TweenInfo, {BackgroundTransparency = Properties.BackgroundTransparency}):Play()
		else
			UI.BackgroundTransparency = Properties.BackgroundTransparency
		end
		if UI:IsA("TextLabel") or UI:IsA("TextButton") or UI:IsA("TextBox") then
			if TweenInfo.Time > 0 then
				TweenService:Create(UI, TweenInfo, {TextTransparency = Properties.TextTransparency, TextStrokeTransparency = Properties.TextStrokeTransparency}):Play()
			else
				UI.TextTransparency = Properties.TextTransparency
				UI.TextStrokeTransparency = Properties.TextStrokeTransparency
			end
		elseif UI:IsA("ImageLabel") or UI:IsA("ImageButton") or UI:IsA("ViewportFrame") then
			if TweenInfo.Time > 0 then
				TweenService:Create(UI, TweenInfo, {ImageTransparency = Properties.ImageTransparency}):Play()
			else
				UI.ImageTransparency = Properties.ImageTransparency
			end
		end
	elseif UI:IsA("UIStroke") then
		if TweenInfo.Time > 0 then
				TweenService:Create(UI, TweenInfo, {Transparency = Properties.Transparency}):Play()
		else
			UI.Transparency = Properties.Transparency
		end
	end
end
end