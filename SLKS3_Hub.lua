--// SLKS2 GAMING HUB
--// Mobile Friendly | Delta Executor

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Xóa GUI cũ nếu có
pcall(function()
    PlayerGui:FindFirstChild("SLKS2_GUI"):Destroy()
end)

--========================
-- GUI GỐC
--========================
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "SLKS2_GUI"
ScreenGui.ResetOnSpawn = false

--========================
-- LOADING SCREEN
--========================
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Size = UDim2.new(1,0,1,0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15,15,20)

local Glow = Instance.new("UIGradient", LoadingFrame)
Glow.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,120,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,200))
}

local Title = Instance.new("TextLabel", LoadingFrame)
Title.Text = "SLKS-GAMING"
Title.Size = UDim2.new(0,400,0,60)
Title.Position = UDim2.new(0.5,-200,0.35,0)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255,255,255)

local Percent = Instance.new("TextLabel", LoadingFrame)
Percent.Text = "Loading 0%"
Percent.Size = UDim2.new(0,200,0,40)
Percent.Position = UDim2.new(0.5,-100,0.43,0)
Percent.BackgroundTransparency = 1
Percent.TextScaled = true
Percent.Font = Enum.Font.Gotham
Percent.TextColor3 = Color3.fromRGB(200,200,200)

local BarBG = Instance.new("Frame", LoadingFrame)
BarBG.Size = UDim2.new(0,420,0,16)
BarBG.Position = UDim2.new(0.5,-210,0.5,0)
BarBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
BarBG.BorderSizePixel = 0
Instance.new("UICorner", BarBG).CornerRadius = UDim.new(1,0)

local Bar = Instance.new("Frame", BarBG)
Bar.Size = UDim2.new(0,0,1,0)
Bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
Bar.BorderSizePixel = 0
Instance.new("UICorner", Bar).CornerRadius = UDim.new(1,0)

-- LOADING CHẠY %
for i = 1,100 do
    Percent.Text = "Loading "..i.."%"
    TweenService:Create(
        Bar,
        TweenInfo.new(0.03, Enum.EasingStyle.Linear),
        {Size = UDim2.new(i/100,0,1,0)}
    ):Play()
    task.wait(0.03)
end

-- FADE OUT LOADING
TweenService:Create(
    LoadingFrame,
    TweenInfo.new(0.8),
    {BackgroundTransparency = 1}
):Play()

for _,v in pairs(LoadingFrame:GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("Frame") then
        TweenService:Create(v, TweenInfo.new(0.8), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    end
end

task.wait(0.9)
LoadingFrame:Destroy()

--========================
-- MENU CHÍNH
--========================
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0,420,0,260)
Main.Position = UDim2.new(0.5,-210,0.5,-130)
Main.BackgroundColor3 = Color3.fromRGB(25,25,30)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- HEADER
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1,0,0,45)
Header.BackgroundColor3 = Color3.fromRGB(0,140,255)
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,16)

local HeaderFix = Instance.new("Frame", Header)
HeaderFix.Size = UDim2.new(1,0,0.5,0)
HeaderFix.Position = UDim2.new(0,0,0.5,0)
HeaderFix.BackgroundColor3 = Header.BackgroundColor3
HeaderFix.BorderSizePixel = 0

local Title2 = Instance.new("TextLabel", Header)
Title2.Text = "SLKS-GAMING HUB"
Title2.Size = UDim2.new(1,-120,1,0)
Title2.Position = UDim2.new(0,15,0,0)
Title2.BackgroundTransparency = 1
Title2.TextXAlignment = Left
Title2.TextScaled = true
Title2.Font = Enum.Font.GothamBold
Title2.TextColor3 = Color3.fromRGB(255,255,255)

-- NÚT THU NHỎ
local Min = Instance.new("TextButton", Header)
Min.Text = "_"
Min.Size = UDim2.new(0,40,0,30)
Min.Position = UDim2.new(1,-90,0,7)
Min.BackgroundColor3 = Color3.fromRGB(255,200,0)
Min.TextScaled = true
Min.Font = Enum.Font.GothamBold
Min.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", Min)

-- NÚT ĐÓNG
local Close = Instance.new("TextButton", Header)
Close.Text = "X"
Close.Size = UDim2.new(0,40,0,30)
Close.Position = UDim2.new(1,-45,0,7)
Close.BackgroundColor3 = Color3.fromRGB(255,80,80)
Close.TextScaled = true
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", Close)

-- NỘI DUNG
local Content = Instance.new("TextLabel", Main)
Content.Text = "✔ Hub đã load thành công\n✔ Mobile Delta ổn định\n✔ Script an toàn\n\n(Chưa thêm chức năng game)"
Content.Size = UDim2.new(1,-30,1,-60)
Content.Position = UDim2.new(0,15,0,55)
Content.BackgroundTransparency = 1
Content.TextWrapped = true
Content.TextYAlignment = Top
Content.Font = Enum.Font.Gotham
Content.TextScaled = true
Content.TextColor3 = Color3.fromRGB(220,220,220)

-- THU NHỎ
local minimized = false
Min.MouseButton1Click:Connect(function()
    minimized = not minimized
    Content.Visible = not minimized
    TweenService:Create(
        Main,
        TweenInfo.new(0.3),
        {Size = minimized and UDim2.new(0,420,0,50) or UDim2.new(0,420,0,260)}
    ):Play()
end)

-- ĐÓNG HUB
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
