-- SLKS11_Hub.lua
-- SLKS GAMING | Forsaken Hub
-- NO LOADING | MOBILE SAFE

local Players = game:GetService("Players")
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
-- MAIN FRAME
-------------------------------------------------
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0,460,0,320)
Main.Position = UDim2.new(0.5,-230,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(245,245,245)
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-------------------------------------------------
-- HEADER
-------------------------------------------------
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,45)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.Active = true
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,16)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "SLKS GAMING | Forsaken Hub"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextXAlignment = Left

-------------------------------------------------
-- TABS
-------------------------------------------------
local Tabs = Instance.new("Frame", Main)
Tabs.Size = UDim2.new(0,120,1,-45)
Tabs.Position = UDim2.new(0,0,0,45)
Tabs.BackgroundColor3 = Color3.fromRGB(235,235,235)

local function tabButton(text,y)
	local b = Instance.new("TextButton", Tabs)
	b.Size = UDim2.new(1,0,0,45)
	b.Position = UDim2.new(0,0,0,y)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextScaled = true
	b.BackgroundColor3 = Color3.fromRGB(220,220,220)
	b.TextColor3 = Color3.fromRGB(0,0,0)
	return b
end

local InfoBtn = tabButton("Information",0)
local MainBtn = tabButton("Main",45)

-------------------------------------------------
-- CONTENT
-------------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,-120,1,-45)
Content.Position = UDim2.new(0,120,0,45)
Content.BackgroundTransparency = 1

local InfoTab = Instance.new("Frame", Content)
InfoTab.Size = UDim2.new(1,0,1,0)
InfoTab.BackgroundTransparency = 1

local MainTab = Instance.new("Frame", Content)
MainTab.Size = UDim2.new(1,0,1,0)
MainTab.BackgroundTransparency = 1
MainTab.Visible = false

-------------------------------------------------
-- INFO TAB
-------------------------------------------------
local InfoText = Instance.new("TextLabel", InfoTab)
InfoText.Size = UDim2.new(1,-20,1,-20)
InfoText.Position = UDim2.new(0,10,0,10)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.TextYAlignment = Top
InfoText.Font = Enum.Font.Gotham
InfoText.TextScaled = true
InfoText.TextColor3 = Color3.fromRGB(0,0,0)
InfoText.Text = [[
SCRIPT: SLKS FORSAKEN HUB
VERSION: 11

FEATURES:
• WalkSpeed Control
• ESP Highlight
• Mobile Friendly
• No Loading

CREATED BY:
SLKS-GAMING
]]

-------------------------------------------------
-- MAIN TAB : WALKSPEED
-------------------------------------------------
local WSLabel = Instance.new("TextLabel", MainTab)
WSLabel.Size = UDim2.new(1,-40,0,35)
WSLabel.Position = UDim2.new(0,20,0,15)
WSLabel.BackgroundTransparency = 1
WSLabel.Text = "WalkSpeed: 16"
WSLabel.Font = Enum.Font.GothamBold
WSLabel.TextScaled = true
WSLabel.TextColor3 = Color3.fromRGB(0,0,0)

local SliderBG = Instance.new("Frame", MainTab)
SliderBG.Size = UDim2.new(1,-40,0,12)
SliderBG.Position = UDim2.new(0,20,0,55)
SliderBG.BackgroundColor3 = Color3.fromRGB(200,200,200)
Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1,0)

local Slider = Instance.new("Frame", SliderBG)
Slider.Size = UDim2.new(0.16,0,1,0)
Slider.BackgroundColor3 = Color3.fromRGB(0,140,255)
Instance.new("UICorner", Slider).CornerRadius = UDim.new(1,0)

local dragging = false
local walkSpeed = 16

SliderBG.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

UIS.InputChanged:Connect(function(i)
	if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
		local x = math.clamp((i.Position.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X,0,1)
		Slider.Size = UDim2.new(x,0,1,0)
		walkSpeed = math.floor(x * 100)
		WSLabel.Text = "WalkSpeed: "..walkSpeed
	end
end)

local Apply = Instance.new("TextButton", MainTab)
Apply.Size = UDim2.new(0.45,0,0,40)
Apply.Position = UDim2.new(0.05,0,0,80)
Apply.Text = "APPLY"
Apply.Font = Enum.Font.GothamBold
Apply.TextScaled = true
Apply.BackgroundColor3 = Color3.fromRGB(0,200,120)
Apply.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", Apply).CornerRadius = UDim.new(0,10)

local Reset = Instance.new("TextButton", MainTab)
Reset.Size = UDim2.new(0.45,0,0,40)
Reset.Position = UDim2.new(0.5,0,0,80)
Reset.Text = "RESET"
Reset.Font = Enum.Font.GothamBold
Reset.TextScaled = true
Reset.BackgroundColor3 = Color3.fromRGB(255,90,90)
Reset.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", Reset).CornerRadius = UDim.new(0,10)

Apply.MouseButton1Click:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = walkSpeed
	end
end)

Reset.MouseButton1Click:Connect(function()
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = 16
	end
end)

-------------------------------------------------
-- ESP
-------------------------------------------------
local espEnabled = false
local espObjects = {}

local function clearESP()
	for _,v in pairs(espObjects) do
		if v then v:Destroy() end
	end
	espObjects = {}
end

local function addESP(plr)
	if plr == player then return end
	if not plr.Character then return end
	if espObjects[plr] then return end

	local h = Instance.new("Highlight")
	h.FillColor = Color3.fromRGB(255,0,0)
	h.OutlineColor = Color3.fromRGB(255,255,255)
	h.FillTransparency = 0.5
	h.Adornee = plr.Character
	h.Parent = gui

	espObjects[plr] = h
end

local function refreshESP()
	clearESP()
	if not espEnabled then return end
	for _,plr in pairs(Players:GetPlayers()) do
		addESP(plr)
	end
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(1)
		if espEnabled then
			addESP(plr)
		end
	end)
end)

local ESPBtn = Instance.new("TextButton", MainTab)
ESPBtn.Size = UDim2.new(0.9,0,0,40)
ESPBtn.Position = UDim2.new(0.05,0,0,135)
ESPBtn.Text = "ESP : OFF"
ESPBtn.Font = Enum.Font.GothamBold
ESPBtn.TextScaled = true
ESPBtn.BackgroundColor3 = Color3.fromRGB(180,180,180)
ESPBtn.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", ESPBtn).CornerRadius = UDim.new(0,10)

ESPBtn.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	if espEnabled then
		ESPBtn.Text = "ESP : ON"
		ESPBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
		refreshESP()
	else
		ESPBtn.Text = "ESP : OFF"
		ESPBtn.BackgroundColor3 = Color3.fromRGB(180,180,180)
		clearESP()
	end
end)

-------------------------------------------------
-- TAB SWITCH
-------------------------------------------------
InfoBtn.MouseButton1Click:Connect(function()
	InfoTab.Visible = true
	MainTab.Visible = false
end)

MainBtn.MouseButton1Click:Connect(function()
	InfoTab.Visible = false
	MainTab.Visible = true
end)
