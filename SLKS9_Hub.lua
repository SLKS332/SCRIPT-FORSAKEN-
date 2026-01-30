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

-- MINIMIZE ✅
local Minimize = Instance.new("TextButton", Header)
Minimize.Size = UDim2.new(0,40,0,30)
Minimize.Position = UDim2.new(1,-90,0.2,0)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextScaled = true
Minimize.BackgroundColor3 = Color3.fromRGB(255,200,80)
Instance.new("UICorner", Minimize).CornerRadius = UDim.new(1,0)

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

-- MINIMIZE LOGIC ✅
local minimized = false
local oldSize = Main.Size

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		oldSize = Main.Size
		Main.Size = UDim2.new(0,420,0,55)
		for _,v in ipairs(Main:GetChildren()) do
			if v ~= Header then
				v.Visible = false
			end
		end
		Minimize.Text = "+"
	else
		Main.Size = oldSize
		for _,v in ipairs(Main:GetChildren()) do
			v.Visible = true
		end
		Minimize.Text = "-"
	end
end)

-------------------------------------------------
-- TAB CREATE
-------------------------------------------------
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
-- TAB MAIN
-------------------------------------------------
local MainTab = createTab("Main")

-------------------------------------------------
-- ESP PLAYER (RED / GREEN)
-------------------------------------------------
local espEnabled = false
local espCache = {}

local function isKiller(plr)
	local char = plr.Character
	if not char then return false end

	local role = char:GetAttribute("Role")
	if role and tostring(role):lower():find("killer") then
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
