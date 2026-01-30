-- SLKS-GAMING HUB with Smooth Loading
-- Mobile friendly UI

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_Gaming_Hub"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

------------------------------------------------
-- LOADING SCREEN (WHITE + BLUE, SMOOTH %)
------------------------------------------------
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
loadingFrame.BorderSizePixel = 0

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1, 0, 0, 60)
loadingText.Position = UDim2.new(0, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "SLK-GAMING\nLoading... 0%"
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.TextColor3 = Color3.fromRGB(0,120,255)

local barBg = Instance.new("Frame", loadingFrame)
barBg.Size = UDim2.new(0.7, 0, 0, 20)
barBg.Position = UDim2.new(0.15, 0, 0.55, 0)
barBg.BackgroundColor3 = Color3.fromRGB(230,230,230)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0,120,255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- MAIN MENU (ẨN LÚC ĐẦU)
------------------------------------------------
local main = Instance.new("Frame", gui)
main.Visible = false
main.Size = UDim2.new(0.7, 0, 0.5, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255,255,255)
main.BackgroundTransparency = 0.25
main.BorderSizePixel = 0
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local scale = Instance.new("UIScale", main)
scale.Scale = 1.1

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -80, 0, 50)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "SLKS-GAMING HUB"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(0,0,0)
title.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", main)
minBtn.Size = UDim2.new(0, 40, 0, 40)
minBtn.Position = UDim2.new(1, -90, 0, 5)
minBtn.Text = "-"
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.BackgroundColor3 = Color3.fromRGB(230,230,230)
minBtn.BorderSizePixel = 0
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(1,0)

local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(255,120,120)
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1,0)

local info = Instance.new("TextLabel", main)
info.Size = UDim2.new(1, -30, 1, -80)
info.Position = UDim2.new(0, 15, 0, 60)
info.BackgroundTransparency = 1
info.Text = "Welcome to SLKS-GAMING HUB\nMobile UI Loaded"
info.TextScaled = true
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.fromRGB(50,50,50)

local circle = Instance.new("TextButton", gui)
circle.Size = UDim2.new(0, 70, 0, 70)
circle.Position = UDim2.new(0.1, 0, 0.5, 0)
circle.Text = "SLKS"
circle.TextScaled = true
circle.Font = Enum.Font.GothamBold
circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
circle.BackgroundTransparency = 0.2
circle.Visible = false
circle.BorderSizePixel = 0
circle.Active = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)

------------------------------------------------
-- DRAG FUNCTION (MOBILE OK)
------------------------------------------------
local function makeDraggable(frame)
	local dragging, dragStart, startPos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)
	frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	frame.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.Touch
		or input.UserInputType == Enum.UserInputType.MouseMovement) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(main)
makeDraggable(circle)

------------------------------------------------
-- BUTTON LOGIC
------------------------------------------------
minBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	circle.Visible = true
end)

circle.MouseButton1Click:Connect(function()
	main.Visible = true
	circle.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

------------------------------------------------
-- SMOOTH LOADING (0 → 100 LIÊN TỤC)
------------------------------------------------
local progress = 0
local speed = 0.8 -- chỉnh nhanh/chậm ở đây

while progress < 100 do
	progress = math.clamp(progress + speed, 0, 100)
	barFill.Size = UDim2.new(progress/100, 0, 1, 0)
	loadingText.Text = "SLK-GAMING\nLoading... "..math.floor(progress).."%"
	wait(0.03)
end

loadingFrame:Destroy()
main.Visible = true
