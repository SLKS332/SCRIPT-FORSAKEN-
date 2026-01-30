-- SLKS-GAMING HUB
-- Loading -> Fade out -> Main Menu
-- Mobile Friendly (Delta)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_Gaming_Hub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- LOADING SCREEN
------------------------------------------------
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
loadingFrame.BorderSizePixel = 0

-- Card
local card = Instance.new("Frame", loadingFrame)
card.Size = UDim2.new(0,320,0,190)
card.Position = UDim2.new(0.5,0,0.5,0)
card.AnchorPoint = Vector2.new(0.5,0.5)
card.BackgroundColor3 = Color3.fromRGB(255,255,255)
card.BorderSizePixel = 0
Instance.new("UICorner", card).CornerRadius = UDim.new(0,20)

-- Card stroke
local cardStroke = Instance.new("UIStroke", card)
cardStroke.Color = Color3.fromRGB(0,120,255)
cardStroke.Thickness = 1
cardStroke.Transparency = 0.6

-- Title
local title = Instance.new("TextLabel", card)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "SLK-GAMING"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(0,120,255)

-- Loading bar
local barBg = Instance.new("Frame", card)
barBg.Size = UDim2.new(0.8,0,0,14)
barBg.Position = UDim2.new(0.1,0,0.55,0)
barBg.BackgroundColor3 = Color3.fromRGB(230,230,230)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,120,255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1,0)

-- Percent text (KHÔNG DÍNH THANH)
local percentText = Instance.new("TextLabel", card)
percentText.Size = UDim2.new(1,0,0,30)
percentText.Position = UDim2.new(0,0,0.7,0)
percentText.BackgroundTransparency = 1
percentText.Text = "Loading... 0%"
percentText.Font = Enum.Font.Gotham
percentText.TextScaled = true
percentText.TextColor3 = Color3.fromRGB(100,100,100)

-- Glow ring
local ring = Instance.new("Frame", loadingFrame)
ring.Size = UDim2.new(0,260,0,260)
ring.Position = UDim2.new(0.5,0,0.5,0)
ring.AnchorPoint = Vector2.new(0.5,0.5)
ring.BackgroundTransparency = 1
Instance.new("UICorner", ring).CornerRadius = UDim.new(1,0)

local ringStroke = Instance.new("UIStroke", ring)
ringStroke.Color = Color3.fromRGB(0,120,255)
ringStroke.Thickness = 3
ringStroke.Transparency = 0.5

task.spawn(function()
	while ring.Parent do
		ring.Rotation += 0.3
		task.wait()
	end
end)

-- Floating dots
for i = 1, 6 do
	local dot = Instance.new("Frame", loadingFrame)
	dot.Size = UDim2.new(0,6,0,6)
	dot.Position = UDim2.new(math.random(),0,math.random(),0)
	dot.BackgroundColor3 = Color3.fromRGB(0,120,255)
	dot.BackgroundTransparency = 0.6
	dot.BorderSizePixel = 0
	Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

	task.spawn(function()
		while dot.Parent do
			dot.Position = dot.Position + UDim2.new(0,0,-0.001,0)
			task.wait(0.03)
		end
	end)
end

------------------------------------------------
-- MAIN MENU (ẨN BAN ĐẦU)
------------------------------------------------
local main = Instance.new("Frame", gui)
main.Visible = false
main.Size = UDim2.new(0.7,0,0.5,0)
main.Position = UDim2.new(0.5,0,0.5,0)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(255,255,255)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local title2 = Instance.new("TextLabel", main)
title2.Size = UDim2.new(1,-20,0,50)
title2.Position = UDim2.new(0,10,0,0)
title2.BackgroundTransparency = 1
title2.Text = "SLKS-GAMING HUB"
title2.Font = Enum.Font.GothamBold
title2.TextScaled = true
title2.TextColor3 = Color3.fromRGB(0,0,0)

------------------------------------------------
-- LOADING PROCESS
------------------------------------------------
local progress = 0
while progress < 100 do
	progress += 1
	barFill.Size = UDim2.new(progress/100,0,1,0)
	percentText.Text = "Loading... "..progress.."%"
	task.wait(0.02)
end

------------------------------------------------
-- FADE OUT LOADING
------------------------------------------------
for i = 0, 1, 0.05 do
	loadingFrame.BackgroundTransparency = i
	card.BackgroundTransparency = i
	ringStroke.Transparency = i

	for _, v in pairs(loadingFrame:GetDescendants()) do
		if v:IsA("TextLabel") then
			v.TextTransparency = i
		elseif v:IsA("Frame") then
			v.BackgroundTransparency = math.clamp(i,0,1)
		end
	end
	task.wait(0.03)
end

loadingFrame:Destroy()

------------------------------------------------
-- FADE IN MENU
------------------------------------------------
main.Visible = true
main.BackgroundTransparency = 1

for i = 1, 0, -0.05 do
	main.BackgroundTransparency = i
	for _, v in pairs(main:GetDescendants()) do
		if v:IsA("TextLabel") then
			v.TextTransparency = i
		elseif v:IsA("Frame") then
			v.BackgroundTransparency = i
		end
	end
	task.wait(0.03)
end
