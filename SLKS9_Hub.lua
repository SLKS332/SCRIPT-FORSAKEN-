-- SLKS9_Hub.lua
-- SLKS GAMING | By SLKS-GAMING
-- Mobile Safe | Delta OK

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-------------------------------------------------
-- GUI
-------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "SLKS_GUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-------------------------------------------------
-- MAIN FRAME
-------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
Main.BackgroundTransparency = 0.05
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-------------------------------------------------
-- HEADER
-------------------------------------------------
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.Active = true
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,15,0,0)
Title.BackgroundTransparency = 1
Title.RichText = true
Title.Text = "<b>SLKS GAMING</b>\n<font size='14'>By SLKS-GAMING</font>"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.new(1,1,1)
Title.TextXAlignment = Enum.TextXAlignment.Left

local Close = Instance.new("TextButton", Header)
Close.Size = UDim2.new(0,40,0,30)
Close.Position = UDim2.new(1,-45,0.2,0)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextScaled = true
Close.BackgroundColor3 = Color3.fromRGB(255,90,90)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

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
-- TAB SYSTEM
-------------------------------------------------
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(0,120,1,-60)
TabBar.Position = UDim2.new(0,10,0,55)
TabBar.BackgroundTransparency = 1

local Pages = Instance.new("Frame", Main)
Pages.Size = UDim2.new(1,-150,1,-60)
Pages.Position = UDim2.new(0,140,0,55)
Pages.BackgroundTransparency = 1

local Tabs = {}
local CurrentTab

local function createTab(name)
	local btn = Instance.new("TextButton", TabBar)
	btn.Size = UDim2.new(1,0,0,40)
	btn.Position = UDim2.new(0,0,0,#Tabs*45)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(0,0,0)
	btn.BackgroundColor3 = Color3.fromRGB(235,235,235)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,12)

	local page = Instance.new("Frame", Pages)
	page.Size = UDim2.new(1,0,1,0)
	page.Visible = false
	page.BackgroundTransparency = 1

	btn.MouseButton1Click:Connect(function()
		if CurrentTab then CurrentTab.Visible = false end
		page.Visible = true
		CurrentTab = page
	end)

	table.insert(Tabs, btn)
	if not CurrentTab then
		page.Visible = true
		CurrentTab = page
	end

	return page
end

-------------------------------------------------
-- TAB 1 : SCRIPT INFO
-------------------------------------------------
local InfoTab = createTab("Script Info")

local InfoText = Instance.new("TextLabel", InfoTab)
InfoText.Size = UDim2.new(1,-10,1,-10)
InfoText.Position = UDim2.new(0,5,0,5)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Font = Enum.Font.GothamBold
InfoText.TextSize = 16
InfoText.TextColor3 = Color3.fromRGB(0,0,0)
InfoText.Text = [[
SLKS GAMING HUB

Game: Forsaken
Platform: Mobile (Delta)

Features:
• WalkSpeed
• ESP ON / OFF
• Clean UI

By SLKS-GAMING
]]

-------------------------------------------------
-- TAB 2 : MAIN
-------------------------------------------------
local MainTab = createTab("Main")

-- WalkSpeed Label
local WSLabel = Instance.new("TextLabel", MainTab)
WSLabel.Size = UDim2.new(1,-10,0,30)
WSLabel.Position = UDim2.new(0,5,0,5)
WSLabel.BackgroundTransparency = 1
WSLabel.Text = "WalkSpeed: 16"
WSLabel.Font = Enum.Font.GothamBold
WSLabel.TextSize = 16
WSLabel.TextColor3 = Color3.fromRGB(0,0,0)
WSLabel.TextXAlignment = Enum.TextXAlignment.Left

-- WalkSpeed Slider
local SliderBG = Instance.new("Frame", MainTab)
SliderBG.Size = UDim2.new(1,-10,0,16)
SliderBG.Position = UDim2.new(0,5,0,45)
SliderBG.BackgroundColor3 = Color3.fromRGB(220,220,220)
SliderBG.BorderSizePixel = 0
Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1,0)

local SliderFill = Instance.new("Frame", SliderBG)
SliderFill.Size = UDim2.new(16/100,0,1,0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0,140,255)
SliderFill.BorderSizePixel = 0
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1,0)

local draggingSlider = false

local function setSpeedFromX(x)
	local rel = math.clamp(
		(x - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X,
		0,1
	)
	local speed = math.floor(rel * 100)
	SliderFill.Size = UDim2.new(rel,0,1,0)
	WSLabel.Text = "WalkSpeed: "..speed

	local char = player.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = speed
	end
end

SliderBG.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingSlider = true
		setSpeedFromX(input.Position.X)
	end
end)

UIS.InputChanged:Connect(function(input)
	if draggingSlider and (input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseMovement) then
		setSpeedFromX(input.Position.X)
	end
end)

UIS.InputEnded:Connect(function()
	draggingSlider = false
end)

-------------------------------------------------
-- ESP TOGGLE
-------------------------------------------------
local espEnabled = false
local espObjects = {}

local function clearESP()
	for _,v in pairs(espObjects) do
		if v then v:Destroy() end
	end
	table.clear(espObjects)
end

local function createESP(plr)
	if plr == player then return end
	if not plr.Character then return end
	local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local box = Instance.new("BoxHandleAdornment")
	box.Size = Vector3.new(4,6,2)
	box.Adornee = hrp
	box.Color3 = Color3.fromRGB(255,0,0)
	box.AlwaysOnTop = true
	box.ZIndex = 10
	box.Transparency = 0.4
	box.Parent = gui

	table.insert(espObjects, box)
end

RunService.RenderStepped:Connect(function()
	if not espEnabled then return end
	clearESP()
	for _,plr in pairs(Players:GetPlayers()) do
		createESP(plr)
	end
end)

local ESPButton = Instance.new("TextButton", MainTab)
ESPButton.Size = UDim2.new(1,-10,0,35)
ESPButton.Position = UDim2.new(0,5,0,80)
ESPButton.Text = "ESP : OFF"
ESPButton.Font = Enum.Font.GothamBold
ESPButton.TextSize = 16
ESPButton.TextColor3 = Color3.fromRGB(255,255,255)
ESPButton.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", ESPButton).CornerRadius = UDim.new(0,12)

ESPButton.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	if espEnabled then
		ESPButton.Text = "ESP : ON"
		ESPButton.BackgroundColor3 = Color3.fromRGB(60,180,90)
	else
		ESPButton.Text = "ESP : OFF"
		ESPButton.BackgroundColor3 = Color3.fromRGB(200,60,60)
		clearESP()
	end
end)
