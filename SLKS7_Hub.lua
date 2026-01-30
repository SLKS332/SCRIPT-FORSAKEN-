-- SLKS6_Hub.lua
-- SLKS GAMING | By SLKS-GAMING

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-------------------------------------------------
-- GUI
-------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- LOADING (FIX TRẮNG)
-------------------------------------------------
local Loading = Instance.new("Frame", gui)
Loading.Size = UDim2.new(1,0,1,0)
Loading.BackgroundColor3 = Color3.fromRGB(255,255,255)
Loading.ZIndex = 100

local LTitle = Instance.new("TextLabel", Loading)
LTitle.Size = UDim2.new(1,0,0.15,0)
LTitle.Position = UDim2.new(0,0,0.28,0)
LTitle.BackgroundTransparency = 1
LTitle.Text = "SLKS GAMING"
LTitle.Font = Enum.Font.GothamBold
LTitle.TextScaled = true
LTitle.TextColor3 = Color3.fromRGB(0,140,255)
LTitle.ZIndex = 101

local Percent = Instance.new("TextLabel", Loading)
Percent.Size = UDim2.new(1,0,0.1,0)
Percent.Position = UDim2.new(0,0,0.47,0)
Percent.BackgroundTransparency = 1
Percent.Text = "Loading 0%"
Percent.Font = Enum.Font.Gotham
Percent.TextScaled = true
Percent.TextColor3 = Color3.fromRGB(0,140,255)
Percent.ZIndex = 101

local BarBG = Instance.new("Frame", Loading)
BarBG.Size = UDim2.new(0.6,0,0.035,0)
BarBG.Position = UDim2.new(0.2,0,0.55,0)
BarBG.BackgroundColor3 = Color3.fromRGB(220,220,220)
BarBG.BorderSizePixel = 0
BarBG.ZIndex = 101
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

local Bar = Instance.new("Frame", BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,140,255)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

for i = 1,100 do
	Bar.Size = UDim2.new(i/100,0,1,0)
	Percent.Text = "Loading "..i.."%"
	task.wait(0.02)
end

TweenService:Create(Loading,TweenInfo.new(0.4),{
	BackgroundTransparency = 1
}):Play()

task.wait(0.45)
Loading:Destroy()

-------------------------------------------------
-- MAIN MENU
-------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.05
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
-- DRAG MENU (FIX CHUẨN)
-------------------------------------------------
local dragging = false
local dragStart, startPos, dragInput

Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
		dragInput = input
	end
end)

Header.InputEnded:Connect(function(input)
	if input == dragInput then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

-------------------------------------------------
-- MINIMIZE TO CIRCLE (ĐẸP + KÉO ĐƯỢC)
-------------------------------------------------
local Circle = Instance.new("ImageButton", gui)
Circle.Size = UDim2.new(0,60,0,60)
Circle.Position = UDim2.new(0.05,0,0.5,0)
Circle.BackgroundColor3 = Color3.fromRGB(0,140,255)
Circle.Image = "rbxassetid://7072725342"
Circle.Visible = false
Circle.Z
