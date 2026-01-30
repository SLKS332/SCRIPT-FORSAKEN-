--// SLK-GAMING HUB - UI Menu

local player = game.Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SLKGamingHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(320, 200)
main.Position = UDim2.fromScale(0.35, 0.3)
main.BackgroundColor3 = Color3.new(1,1,1)
main.BackgroundTransparency = 0.35
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0.08,0)
local stroke = Instance.new("UIStroke", main)
stroke.Transparency = 0.5

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -10, 0, 36)
title.Position = UDim2.fromOffset(10, 5)
title.BackgroundTransparency = 1
title.Text = "SLK-GAMING HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(20,20,20)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

-- SUB TITLE
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -10, 0, 18)
sub.Position = UDim2.fromOffset(10, 38)
sub.BackgroundTransparency = 1
sub.Text = "by SLK-GAMING"
sub.Font = Enum.Font.Gotham
sub.TextSize = 14
sub.TextColor3 = Color3.fromRGB(90,90,90)
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = main

-- Minimize (-)
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(30,30)
minimize.Position = UDim2.fromScale(1,0)
minimize.AnchorPoint = Vector2.new(1,0)
minimize.Text = "-"
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 22
minimize.BackgroundTransparency = 1
minimize.TextColor3 = Color3.fromRGB(50,50,50)
minimize.Parent = main

-- Close (X)
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30,30)
close.Position = UDim2.fromScale(0.9,0)
close.AnchorPoint = Vector2.new(1,0)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.BackgroundTransparency = 1
close.TextColor3 = Color3.fromRGB(200,60,60)
close.Parent = main

-- Toggle Button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.fromOffset(120,40)
toggle.Position = UDim2.fromScale(0.5,0.65)
toggle.AnchorPoint = Vector2.new(0.5,0.5)
toggle.Text = "OFF"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 18
toggle.BackgroundColor3 = Color3.fromRGB(240,240,240)
toggle.TextColor3 = Color3.fromRGB(40,40,40)
toggle.Parent = main
Instance.new("UICorner", toggle)

-- Mini Button (Circle)
local mini = Instance.new("TextButton")
mini.Size = UDim2.fromOffset(60,60)
mini.Position = UDim2.fromScale(0.1,0.5)
mini.Text = "SLK"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 22
mini.BackgroundColor3 = Color3.new(1,1,1)
mini.BackgroundTransparency = 0.35
mini.Active = true
mini.Draggable = true
mini.Visible = false
mini.Parent = gui

Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", mini).Transparency = 0.5

-- Logic
local running = true
local enabled = false

minimize.MouseButton1Click:Connect(function()
	main.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	main.Visible = true
	mini.Visible = false
end)

close.MouseButton1Click:Connect(function()
	running = false
	gui:Destroy()
end)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	toggle.Text = enabled and "ON" or "OFF"
end)

task.spawn(function()
	while running do
		if enabled then
			-- gắn chức năng của bạn ở đây
		end
		task.wait(0.5)
	end
end)
