-- SLKS GAMING | By SLKS-GAMING
-- Forsaken | Mobile Safe (Delta)
-- NOTE: This is DEMO VERSION

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
Title.Text = "<b>SLKS GAMING</b>\n<font size='14'>DEMO VERSION</font>"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.new(1,1,1)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE
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

-- MINIMIZE
local Minimize = Instance.new("TextButton", Header)
Minimize.Size = UDim2.new(0,40,0,30)
Minimize.Position = UDim2.new(1,-90,0.2,0)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextScaled = true
Minimize.BackgroundColor3 = Color3.fromRGB(255,200,80)
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- CONTENT
-------------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1,0,1,-50)
Content.Position = UDim2.new(0,0,0,50)
Content.BackgroundTransparency = 1

-------------------------------------------------
-- MINIMIZE LOGIC (SAFE)
-------------------------------------------------
local minimized = false
local fullSize = Main.Size

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	Content.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,420,0,55) or fullSize
	Minimize.Text = minimized and "+" or "-"
end)

-------------------------------------------------
-- TAB SYSTEM
-------------------------------------------------
local TabBar = Instance.new("Frame", Content)
TabBar.Size = UDim2.new(0,120,1,-10)
TabBar.Position = UDim2.new(0,10,0,5)
TabBar.BackgroundTransparency = 1

local Pages = Instance.new("Frame", Content)
Pages.Size = UDim2.new(1,-150,1,-10)
Pages.Position = UDim2.new(0,140,0,5)
Pages.BackgroundTransparency = 1

local CurrentTab
local tabCount = 0

local function createTab(name)
	local btn = Instance.new("TextButton", TabBar)
	btn.Size = UDim2.new(1,0,0,40)
	btn.Position = UDim2.new(0,0,0,tabCount*45)
	btn.Text = name
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
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

	tabCount += 1
	if not CurrentTab then
		page.Visible = true
		CurrentTab = page
	end

	return page
end

-------------------------------------------------
-- MAIN TAB
-------------------------------------------------
local MainTab = createTab("Main")

-------------------------------------------------
-- ESP PLAYER
-------------------------------------------------
local espEnabled = false
local espCache = {}

local function isKiller(plr)
	local char = plr.Character
	if not char then return false end
	local role = char:GetAttribute("Role")
	return role and tostring(role):lower():find("killer")
end

local function clearESP()
	for _,v in pairs(espCache) do
		if v then v:Destroy() end
	end
	table.clear(espCache)
end

local function addESP(plr)
	if plr == player or not plr.Character or espCache[plr] then return end
	local h = Instance.new("Highlight")
	h.FillColor = isKiller(plr) and Color3.fromRGB(255,0,0) or Color3.fromRGB(0,255,0)
	h.OutlineColor = Color3.fromRGB(255,255,255)
	h.FillTransparency = 0.45
	h.Adornee = plr.Character
	h.Parent = game.CoreGui
	espCache[plr] = h
end

RunService.RenderStepped:Connect(function()
	if espEnabled then
		for _,plr in ipairs(Players:GetPlayers()) do
			addESP(plr)
		end
	end
end)

local ESPBtn = Instance.new("TextButton", MainTab)
ESPBtn.Size = UDim2.new(1,-10,0,35)
ESPBtn.Position = UDim2.new(0,5,0,5)
ESPBtn.Text = "ESP Player : OFF"
ESPBtn.Font = Enum.Font.GothamBold
ESPBtn.TextSize = 16
ESPBtn.TextColor3 = Color3.new(1,1,1)
ESPBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", ESPBtn).CornerRadius = UDim.new(0,12)

ESPBtn.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	ESPBtn.Text = espEnabled and "ESP Player : ON" or "ESP Player : OFF"
	ESPBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60,180,90) or Color3.fromRGB(200,60,60)
	if not espEnabled then clearESP() end
end)

-------------------------------------------------
-- TELEPORT SPEED (SLIDER 0–50)
-------------------------------------------------
local tpEnabled = false
local tpSpeed = 5

RunService.RenderStepped:Connect(function()
	if not tpEnabled then return end
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	if hum.MoveDirection.Magnitude > 0 then
		hrp.CFrame = hrp.CFrame + hum.MoveDirection * tpSpeed * 0.1
	end
end)

local TPBtn = Instance.new("TextButton", MainTab)
TPBtn.Size = UDim2.new(1,-10,0,35)
TPBtn.Position = UDim2.new(0,5,0,45)
TPBtn.Text = "Teleport Speed : OFF"
TPBtn.Font = Enum.Font.GothamBold
TPBtn.TextSize = 16
TPBtn.TextColor3 = Color3.new(1,1,1)
TPBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", TPBtn).CornerRadius = UDim.new(0,12)

TPBtn.MouseButton1Click:Connect(function()
	tpEnabled = not tpEnabled
	TPBtn.Text = tpEnabled and ("Teleport Speed : ON ("..tpSpeed..")") or "Teleport Speed : OFF"
	TPBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60,180,90) or Color3.fromRGB(200,60,60)
end)

-- SPEED SLIDER
local Slider = Instance.new("TextButton", MainTab)
Slider.Size = UDim2.new(1,-10,0,30)
Slider.Position = UDim2.new(0,5,0,85)
Slider.Text = "Speed : 5"
Slider.Font = Enum.Font.Gotham
Slider.TextSize = 14
Slider.BackgroundColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", Slider).CornerRadius = UDim.new(0,12)

Slider.MouseButton1Click:Connect(function()
	tpSpeed += 1
	if tpSpeed > 50 then tpSpeed = 0 end
	Slider.Text = "Speed : "..tpSpeed
	if tpEnabled then
		TPBtn.Text = "Teleport Speed : ON ("..tpSpeed..")"
	end
end)
