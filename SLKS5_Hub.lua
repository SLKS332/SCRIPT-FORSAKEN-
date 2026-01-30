-- SLKSFIXMAX_Hub.lua
-- SLKS GAMING | By SLKS-GAMING

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ================= LOADING =================
local Loading = Instance.new("Frame", gui)
Loading.Size = UDim2.new(1,0,1,0)
Loading.BackgroundColor3 = Color3.fromRGB(255,255,255)

local LTitle = Instance.new("TextLabel", Loading)
LTitle.Size = UDim2.new(1,0,0.15,0)
LTitle.Position = UDim2.new(0,0,0.28,0)
LTitle.BackgroundTransparency = 1
LTitle.Text = "SLK-GAMING"
LTitle.Font = Enum.Font.GothamBold
LTitle.TextScaled = true
LTitle.TextColor3 = Color3.fromRGB(0,140,255)

local BarBG = Instance.new("Frame", Loading)
BarBG.Size = UDim2.new(0.6,0,0.035,0)
BarBG.Position = UDim2.new(0.2,0,0.45,0)
BarBG.BackgroundColor3 = Color3.fromRGB(220,220,220)
BarBG.BorderSizePixel = 0
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

local Bar = Instance.new("Frame", BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,140,255)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

local Percent = Instance.new("TextLabel", Loading)
Percent.Size = UDim2.new(1,0,0.1,0)
Percent.Position = UDim2.new(0,0,0.5,0)
Percent.BackgroundTransparency = 1
Percent.Text = "Loading 0%"
Percent.Font = Enum.Font.Gotham
Percent.TextScaled = true
Percent.TextColor3 = Color3.fromRGB(0,140,255)

for i = 1,100 do
	Bar:TweenSize(UDim2.new(i/100,0,1,0),"Out","Quad",0.03,true)
	Percent.Text = "Loading "..i.."%"
	task.wait(0.03)
end

TweenService:Create(Loading,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
task.wait(0.55)
Loading:Destroy()

-- ================= MENU =================
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.1
Main.Active = true
Main.Selectable = true
Main.ZIndex = 2
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- HEADER
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.Active = true
Header.ZIndex = 3
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
Title.ZIndex = 4

-- BUTTONS
local Min = Instance.new("TextButton", Header)
Min.Size = UDim2.new(0,40,0,30)
Min.Position = UDim2.new(1,-90,0.2,0)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextScaled = true
Min.BackgroundColor3 = Color3.fromRGB(255,255,255)
Min.ZIndex = 5
Instance.new("UICorner", Min).CornerRadius = UDim.new(1,0)

local Close = Instance.new("TextButton", Header)
Close.Size = UDim2.new(0,40,0,30)
Close.Position = UDim2.new(1,-45,0.2,0)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(255,90,90)
Close.ZIndex = 5
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- ================= DRAG FIX (FINAL - MOBILE SAFE) =================
local dragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	Main.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

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
		updateDrag(input)
	end
end)

-- ================= MINIMIZE =================
local minimized = false
local normalSize = Main.Size

Min.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		TweenService:Create(Main,TweenInfo.new(0.25),{
			Size = UDim2.new(0,70,0,70)
		}):Play()
	else
		TweenService:Create(Main,TweenInfo.new(0.25),{
			Size = normalSize
		}):Play()
	end
end)

-- ================= CLOSE =================
Close.MouseButton1Click:Connect(function()
	if gui then
		gui:Destroy()
	end
end)
