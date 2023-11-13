--!nocheck
local TweenService = game:GetService("TweenService")

return function(UI: {GuiObject | UIBase} | GuiObject, TweenInfo: TweenInfo, Transparency: number): {[GuiObject]: {[string]: number}}
	local Changed = {}
	if type(UI) ~= "table" then
		local Master = UI 
		UI = UI:GetDescendants()
		table.insert(UI, Master)
	end
	for _,v in UI do
		if v and v.IsA and v:IsA("GuiObject") then
			Changed[v] = {}
			Changed[v].BackgroundTransparency = v.BackgroundTransparency
			if TweenInfo.Time > 0 then
				TweenService:Create(v, TweenInfo, {BackgroundTransparency = Transparency}):Play()
			else
				v.BackgroundTransparency = Transparency
			end
			if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
				Changed[v].TextTransparency = v.TextTransparency
				Changed[v].TextStrokeTransparency = v.TextStrokeTransparency
				if TweenInfo.Time > 0 then
					TweenService:Create(v, TweenInfo, {TextTransparency = Transparency, TextStrokeTransparency = Transparency}):Play()
				else
					v.TextTransparency = Transparency
					v.TextStrokeTransparency = Transparency
				end
			elseif v:IsA("ImageLabel") or v:IsA("ImageButton") or v:IsA("ViewportFrame") then
				Changed[v].ImageTransparency = v.ImageTransparency
				if TweenInfo.Time > 0 then
					TweenService:Create(v, TweenInfo, {ImageTransparency = Transparency}):Play()
				else
					v.ImageTransparency = Transparency
				end
			end
		elseif v:IsA("UIStroke") then
			Changed[v] = {}
			Changed[v].Transparency = v.Transparency
			if TweenInfo.Time > 0 then
				TweenService:Create(v, TweenInfo, {Transparency = Transparency}):Play()
			else
				v.Transparency = Transparency
			end
		end
	end

	return Changed
end