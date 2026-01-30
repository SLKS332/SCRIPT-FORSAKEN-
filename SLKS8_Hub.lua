-- SLKS7_Hub.lua
-- SLKS GAMING | By SLKS-GAMING
-- NO LOADING | MOBILE SAFE

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- MAIN MENU
-------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.1
Main.Active = true
Main.ZIndex = 10
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- HEADER
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.Active = true
Header.ZIndex = 11
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,15,0,0)
Title.BackgroundTransparency = 1
Title.RichText = true
Title.Text = "<b>SLKS GAMING</b>\n<font size='14'>By SLKS-GAMING</font>"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12

-- BUTTONS
local Min = Instance.new("TextButton", Header)
Min.Size = UDim2.new(0,40,0,30)
Min.Position = UDim2.new(1,-90,0.2,0)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextScaled = true
Min.BackgroundColor3 = Color3.fromRGB(255,255,255)
Min.ZIndex = 13
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

local Close = Instance.new("TextButton", Header)
Close.Size = UDim2.new(0,40,0,30)
Close.Position = UDim2.new(1,-45,0.2,0)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(255,90,90)
Close.ZIndex = 13
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- DRAG MENU (MOBILE FIX)
-------------------------------------------------
local dragging = false
local dragStart, startPos

Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseMovement) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

-------------------------------------------------
-- MINIMIZE TO CIRCLE
-------------------------------------------------
local Circle = Instance.new("ImageButton", gui)
Circle.Size = UDim2.new(0,60,0,60)
Circle.Position = UDim2.new(0.05,0,0.5,0)
Circle.BackgroundColor3 = Color3.fromRGB(0,140,255)
Circle.Image = "rbxassetid://7072725342" -- icon
Circle.Visible = false
Circle.ZIndex = 20
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

-- drag circle
local cDrag = false
local cStart, cPos

Circle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then
		cDrag = true
		cStart = input.Position
		cPos = Circle.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if cDrag and (input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseMovement) then
		local delta = input.Position - cStart
		Circle.Position = UDim2.new(
			cPos.X.Scale, cPos.X.Offset + delta.X,
			cPos.Y.Scale, cPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function()
	cDrag = false
end)

Min.MouseButton1Click:Connect(function()
	Main.Visible = false
	Circle.Visible = true
end)

Circle.MouseButton1Click:Connect(function()
	Main.Visible = true
	Circle.Visible = false
end)

-------------------------------------------------
-- CLOSE
-------------------------------------------------
Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
