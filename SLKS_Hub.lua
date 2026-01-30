-- SLK-GAMING HUB UI
-- Mobile friendly UI menu

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLK_Gaming_Hub"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Main Frame
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0.7, 0, 0.5, 0) -- TO HƠN CHO MOBILE
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BackgroundTransparency = 0.25
main.BorderSizePixel = 0
main.Active = true

-- Bo góc
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 18)

-- Auto scale
local scale = Instance.new("UIScale", main)
scale.Scale = 1.1

-- Title
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1, -80, 0, 50)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "SLK-GAMING HUB"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize button
local minBtn = Instance.new("TextButton")
minBtn.Parent = main
minBtn.Size = UDim2.new(0, 40, 0, 40)
minBtn.Position = UDim2.new(1, -90, 0, 5)
minBtn.Text = "-"
minBtn.TextScaled = true
minBtn.Font = Enum.Font.GothamBold
minBtn.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
minBtn.BorderSizePixel = 0
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(1, 0)

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = main
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 120, 120)
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

-- Example content
local info = Instance.new("TextLabel")
info.Parent = main
info.Size = UDim2.new(1, -30, 1, -80)
info.Position = UDim2.new(0, 15, 0, 60)
info.BackgroundTransparency = 1
info.Text = "Welcome to SLK-GAMING HUB\nMobile UI Test"
info.TextScaled = true
info.Font = Enum.Font.Gotham
info.TextColor3 = Color3.fromRGB(50, 50, 50)

-- Circle button (minimized)
local circle = Instance.new("TextButton")
circle.Parent = gui
circle.Size = UDim2.new(0, 70, 0, 70)
circle.Position = UDim2.new(0.1, 0, 0.5, 0)
circle.Text = "SLK"
circle.TextScaled = true
circle.Font = Enum.Font.GothamBold
circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
circle.BackgroundTransparency = 0.2
circle.Visible = false
circle.BorderSizePixel = 0
circle.Active = true
Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

-- Drag function (mobile + pc)
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
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(main)
makeDraggable(circle)

-- Button logic
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
