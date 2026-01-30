--// SLKS3 HUB - SAFE MOBILE VERSION

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- XÓA GUI CŨ
pcall(function()
	gui:FindFirstChild("SLKS3_GUI"):Destroy()
end)

-- GUI GỐC
local ScreenGui = Instance.new("ScreenGui", gui)
ScreenGui.Name = "SLKS3_GUI"
ScreenGui.ResetOnSpawn = false

--========================
-- LOADING
--========================
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Size = UDim2.new(1,0,1,0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20,20,25)

local LoadTitle = Instance.new("TextLabel", LoadingFrame)
LoadTitle.Text = "SLK-GAMING"
LoadTitle.Size = UDim2.new(0,300,0,50)
LoadTitle.Position = UDim2.new(0.5,-150,0.35,0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.TextColor3 = Color3.new(1,1,1)

local Percent = Instance.new("TextLabel", LoadingFrame)
Percent.Text = "Loading 0%"
Percent.Size = UDim2.new(0,200,0,35)
Percent.Position = UDim2.new(0.5,-100,0.45,0)
Percent.BackgroundTransparency = 1
Percent.TextScaled = true
Percent.Font = Enum.Font.Gotham
Percent.TextColor3 = Color3.fromRGB(200,200,200)

local BarBG = Instance.new("Frame", LoadingFrame)
BarBG.Size = UDim2.new(0,320,0,14)
BarBG.Position = UDim2.new(0.5,-160,0.52,0)
BarBG.BackgroundColor3 = Color3.fromRGB(45,45,45)
BarBG.BorderSizePixel = 0
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

local Bar = Instance.new("Frame", BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

-- CHẠY LOADING
for i = 1,100 do
	Percent.Text = "Loading "..i.."%"
	Bar.Size = UDim2.new(i/100,0,1,0)
	task.wait(0.025)
end

-- FADE LOADING
for _,v in pairs(LoadingFrame:GetDescendants()) do
	if v:IsA("TextLabel") then
		TweenService:Create(v,TweenInfo.new(0.4),{TextTransparency=1}):Play()
	elseif v:IsA("Frame") then
		TweenService:Create(v,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
	end
end
TweenService:Create(LoadingFrame,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()

task.wait(0.45)
LoadingFrame:Destroy()

--========================
-- MENU CHÍNH
--========================
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,380,0,240)
Main.Position = UDim2.new(0.5,-190,0.5,-120)
Main.BackgroundColor3 = Color3.fromRGB(30,30,35)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

-- HEADER
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,40)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,14)

local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1,0,0.5,0)
HeaderFix.Position = UDim2.new(0,0,0.5,0)
HeaderFix.BackgroundColor3 = Header.BackgroundColor3
HeaderFix.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Text = "SLKS3 HUB"
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Left
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)

-- NÚT –
local Min = Instance.new("TextButton", Header)
Min.Text = "-"
Min.Size = UDim2.new(0,32,0,26)
Min.Position = UDim2.new(1,-74,0,7)
Min.BackgroundColor3 = Color3.fromRGB(255,200,0)
Min.TextScaled = true
Min.Font = Enum.Font.GothamBold
Min.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner", Min)

-- NÚT X
local Close = Instance.new("TextButton", Header)
Close.Text = "X"
Close.Size = UDim2.new(0,32,0,26)
Close.Position = UDim2.new(1,-38,0,7)
Close.BackgroundColor3 = Color3.fromRGB(255,80,80)
Close.TextScaled = true
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Close)

-- CONTENT
local Content = Instance.new("TextLabel", Main)
Content.Text = "✔ Hub hoạt động ổn định\n✔ Dành cho Mobile Delta\n✔ Chưa gắn chức năng game"
Content.Size = UDim2.new(1,-20,1,-55)
Content.Position = UDim2.new(0,10,0,45)
Content.BackgroundTransparency = 1
Content.TextWrapped = true
Content.TextYAlignment = Top
Content.TextScaled = true
Content.Font = Enum.Font.Gotham
Content.TextColor3 = Color3.fromRGB(220,220,220)

-- DRAG (MOBILE)
local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)
Header.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.Touch then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- THU NHỎ
local mini = false
Min.MouseButton1Click:Connect(function()
	mini = not mini
	Content.Visible = not mini
	Main.Size = mini and UDim2.new(0,380,0,40) or UDim2.new(0,380,0,240)
end)

-- ĐÓNG HUB
Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
