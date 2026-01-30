-- SLKS10_Hub.lua
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
	if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
		local delta = i.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
	end
end)

UIS.InputEnded:Connect(function() dragging = false end)

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

• WalkSpeed ON / OFF
• ESP Player + Distance
• Clean UI

By SLKS-GAMING
]]

-------------------------------------------------
-- TAB 2 : MAIN
-------------------------------------------------
local MainTab = createTab("Main")

local wsValue = 16
local wsEnabled = false

local WSLabel = Instance.new("TextLabel", MainTab)
WSLabel.Size = UDim2.new(1,-10,0,25)
WSLabel.Position = UDim2.new(0,5,0,5)
WSLabel.BackgroundTransparency = 1
WSLabel.Text = "WalkSpeed: 16"
WSLabel.Font = Enum.Font.GothamBold
WSLabel.TextSize = 16
WSLabel.TextColor3 = Color3.new(0,0,0)
WSLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Slider
local SliderBG = Instance.new("Frame", MainTab)
SliderBG.Size = UDim2.new(1,-10,0,16)
SliderBG.Position = UDim2.new(0,5,0,40)
SliderBG.BackgroundColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", SliderBG).CornerRadius = UDim.new(1,0)

local SliderFill = Instance.new("Frame", SliderBG)
SliderFill.Size = UDim2.new(0.16,0,1,0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0,140,255)
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1,0)

local draggingSlider = false

local function updateSpeed(x)
	local rel = math.clamp((x-SliderBG.AbsolutePosition.X)/SliderBG.AbsoluteSize.X,0,1)
	wsValue = math.floor(rel*100)
	SliderFill.Size = UDim2.new(rel,0,1,0)
	WSLabel.Text = "WalkSpeed: "..wsValue
	if wsEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = wsValue
	end
end

SliderBG.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingSlider = true
		updateSpeed(i.Position.X)
	end
end)

UIS.InputChanged:Connect(function(i)
	if draggingSlider then updateSpeed(i.Position.X) end
end)

UIS.InputEnded:Connect(function() draggingSlider = false end)

-- WalkSpeed Toggle
local WSToggle = Instance.new("TextButton", MainTab)
WSToggle.Size = UDim2.new(1,-10,0,35)
WSToggle.Position = UDim2.new(0,5,0,70)
WSToggle.Text = "WalkSpeed : OFF"
WSToggle.Font = Enum.Font.GothamBold
WSToggle.TextSize = 16
WSToggle.TextColor3 = Color3.new(1,1,1)
WSToggle.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", WSToggle).CornerRadius = UDim.new(0,12)

WSToggle.MouseButton1Click:Connect(function()
	wsEnabled = not wsEnabled
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = wsEnabled and wsValue or 16
	end
	WSToggle.Text = wsEnabled and "WalkSpeed : ON" or "WalkSpeed : OFF"
	WSToggle.BackgroundColor3 = wsEnabled and Color3.fromRGB(60,180,90) or Color3.fromRGB(200,60,60)
end)

-------------------------------------------------
-- ESP PLAYER + DISTANCE
-------------------------------------------------
local espEnabled = false
local espFolder = Instance.new("Folder", gui)
espFolder.Name = "ESP_FOLDER"

local function clearESP()
	espFolder:ClearAllChildren()
end

RunService.RenderStepped:Connect(function()
	clearESP()
	if not espEnabled then return end
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end

	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = plr.Character.HumanoidRootPart
			local dist = math.floor((hrp.Position-myHRP.Position).Magnitude)

			local bb = Instance.new("BillboardGui", espFolder)
			bb.Adornee = hrp
			bb.Size = UDim2.new(0,200,0,40)
			bb.AlwaysOnTop = true

			local txt = Instance.new("TextLabel", bb)
			txt.Size = UDim2.new(1,0,1,0)
			txt.BackgroundTransparency = 1
			txt.Text = plr.Name.." ["..dist.."m]"
			txt.TextColor3 = Color3.fromRGB(255,0,0)
			txt.TextStrokeTransparency = 0
			txt.Font = Enum.Font.GothamBold
			txt.TextScaled = true
		end
	end
end)

local ESPBtn = Instance.new("TextButton", MainTab)
ESPBtn.Size = UDim2.new(1,-10,0,35)
ESPBtn.Position = UDim2.new(0,5,0,115)
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
