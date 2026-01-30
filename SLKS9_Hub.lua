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

-------------------------------------------------
-- HEADER
-------------------------------------------------
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

-- Buttons
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
-- TAB SYSTEM
-------------------------------------------------
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(0,130,1,-50)
TabBar.Position = UDim2.new(0,0,0,50)
TabBar.BackgroundColor3 = Color3.fromRGB(245,245,245)
TabBar.ZIndex = 11
Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0,14)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-140,1,-60)
Content.Position = UDim2.new(0,135,0,55)
Content.BackgroundTransparency = 1
Content.ZIndex = 11

local Tabs = {}

local function createTab(name)
	local Btn = Instance.new("TextButton", TabBar)
	Btn.Size = UDim2.new(1,-10,0,40)
	Btn.Position = UDim2.new(0,5,0,#Tabs*45 + 5)
	Btn.Text = name
	Btn.Font = Enum.Font.GothamBold
	Btn.TextScaled = true
	Btn.BackgroundColor3 = Color3.fromRGB(230,230,230)
	Btn.TextColor3 = Color3.fromRGB(40,40,40)
	Btn.ZIndex = 12
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,12)

	local Page = Instance.new("Frame", Content)
	Page.Size = UDim2.new(1,0,1,0)
	Page.BackgroundTransparency = 1
	Page.Visible = false
	Page.ZIndex = 12

	Btn.MouseButton1Click:Connect(function()
		for _,v in pairs(Tabs) do
			v.Page.Visible = false
			v.Button.BackgroundColor3 = Color3.fromRGB(230,230,230)
		end
		Page.Visible = true
		Btn.BackgroundColor3 = Color3.fromRGB(0,140,255)
	end)

	table.insert(Tabs,{Button = Btn, Page = Page})
	return Page
end

-------------------------------------------------
-- TAB 1 : SCRIPT INFO
-------------------------------------------------
local InfoTab = createTab("Script Info")
Tabs[1].Page.Visible = true
Tabs[1].Button.BackgroundColor3 = Color3.fromRGB(0,140,255)

local InfoText = Instance.new("TextLabel", InfoTab)
InfoText.Size = UDim2.new(1,-10,1,-10)
InfoText.Position = UDim2.new(0,5,0,5)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.Font = Enum.Font.Gotham
InfoText.TextScaled = true
InfoText.TextColor3 = Color3.fromRGB(30,30,30)

InfoText.Text = [[
SLKS GAMING HUB

Script Name: SLKS Hub
Version: Mobile Edition
Executor: Delta / Mobile
Game: Forsaken (Roblox)

Features:
• Mobile safe UI
• Drag & move menu
• Minimize to floating button
• Tab system
• Clean & lightweight

By SLKS-GAMING
]]

-------------------------------------------------
-- DRAG MENU
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
	if dragging then
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
Circle.Image = "rbxassetid://7072725342"
Circle.Visible = false
Circle.ZIndex = 20
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

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
