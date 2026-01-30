-- SLKS GAMING | By SLKS-GAMING
-- Forsaken | Mobile Safe (Delta)

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
-- DRAG
-------------------------------------------------
local dragging, dragStart, startPos = false

Header.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPos = Main.Position
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging then
		local delta = i.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
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
	btn.TextColor3 = Color3.new(0,0,0)
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
-- TAB 1 : INFO
-------------------------------------------------
local InfoTab = createTab("Script Info")

local InfoText = Instance.new("TextLabel", InfoTab)
InfoText.Size = UDim2.new(1,-10,1,-10)
InfoText.Position = UDim2.new(0,5,0,5)
InfoText.BackgroundTransparency = 1
InfoText.TextWrapped = true
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.Font = Enum.Font.GothamBold
InfoText.TextSize = 16
InfoText.TextColor3 = Color3.new(0,0,0)
InfoText.Text = [[
SLKS GAMING HUB

Game: Forsaken
Platform: Mobile (Delta)

• ESP Role Color
• Teleport Speed (Anti Block)

By SLKS-GAMING
]]

-------------------------------------------------
-- TAB 2 : MAIN
-------------------------------------------------
local MainTab = createTab("Main")

-------------------------------------------------
-- ESP ROLE COLOR
-------------------------------------------------
local espEnabled = false
local espCache = {}

local function isKiller(plr)
	if plr.Team and plr.Team.Name:lower():find("killer") then
		return true
	end
	if plr:GetAttribute("Role") == "Killer" then
		return true
	end
	return false
end

local function clearESP()
	for _,v in pairs(espCache) do
		if v then v:Destroy() end
	end
	table.clear(espCache)
end

local function addESP(plr)
	if plr == player then return end
	if not plr.Character then return end
	if espCache[plr] then return end

	local h = Instance.new("Highlight")

	if isKiller(plr) then
		h.FillColor = Color3.fromRGB(255,0,0) -- Killer 🔴
	else
		h.FillColor = Color3.fromRGB(0,255,0) -- Survivor 🟢
	end

	h.OutlineColor = Color3.fromRGB(255,255,255)
	h.FillTransparency = 0.45
	h.OutlineTransparency = 0
	h.Adornee = plr.Character
	h.Parent = game.CoreGui

	espCache[plr] = h
end

RunService.RenderStepped:Connect(function()
	if not espEnabled then return end
	for _,plr in ipairs(Players:GetPlayers()) do
		addESP(plr)
	end
end)

local ESPBtn = Instance.new("TextButton", MainTab)
ESPBtn.Size = UDim2.new(1,-10,0,35)
ESPBtn.Position = UDim2.new(0,5,0,5)
ESPBtn.Text = "ESP : OFF"
ESPBtn.Font = Enum.Font.GothamBold
ESPBtn.TextSize = 16
ESPBtn.TextColor3 = Color3.new(1,1,1)
ESPBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", ESPBtn).CornerRadius = UDim.new(0,12)

ESPBtn.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	ESPBtn.Text = espEnabled and "ESP : ON" or "ESP : OFF"
	ESPBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(60,180,90) or Color3.fromRGB(200,60,60)
	if not espEnabled then clearESP() end
end)

-------------------------------------------------
-- TELEPORT SPEED (FORSAKEN SAFE)
-------------------------------------------------
local tpEnabled = false
local tpSpeed = 2.5

RunService.RenderStepped:Connect(function()
	if not tpEnabled then return end

	local char = player.Character
	if not char then return end

	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	if hum.MoveDirection.Magnitude > 0 then
		hrp.CFrame = hrp.CFrame + hum.MoveDirection * tpSpeed
	end
end)

local TPBtn = Instance.new("TextButton", MainTab)
TPBtn.Size = UDim2.new(1,-10,0,35)
TPBtn.Position = UDim2.new(0,5,0,50)
TPBtn.Text = "Teleport Speed : OFF"
TPBtn.Font = Enum.Font.GothamBold
TPBtn.TextSize = 16
TPBtn.TextColor3 = Color3.new(1,1,1)
TPBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", TPBtn).CornerRadius = UDim.new(0,12)

TPBtn.MouseButton1Click:Connect(function()
	tpEnabled = not tpEnabled
	TPBtn.Text = tpEnabled and "Teleport Speed : ON" or "Teleport Speed : OFF"
	TPBtn.BackgroundColor3 = tpEnabled and Color3.fromRGB(60,180,90) or Color3.fromRGB(200,60,60)
end)
