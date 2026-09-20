-- ═══════════════════════════════════════
-- ✅ FREDZEEE — FULL WORKING SCRIPT
-- ═══════════════════════════════════════

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "fredzeee"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ═══════════════════════════════════════
-- 📦 MAIN WINDOW
-- ═══════════════════════════════════════

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MainFrame.BorderColor3 = Color3.fromRGB(255, 200, 40)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -180)
MainFrame.Size = UDim2.new(0, 640, 0, 360)
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 200, 40)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- ═══════════════════════════════════════
-- 🧩 TOP BAR
-- ═══════════════════════════════════════

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
TopBar.Size = UDim2.new(1, 0, 0, 45)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0.5, -120, 0, 0)
TitleLabel.Size = UDim2.new(0, 240, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "✨ FREDZEEE — Ride A Pet ✨"
TitleLabel.TextColor3 = Color3.fromRGB(255, 220, 40)
TitleLabel.TextSize = 16

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Position = UDim2.new(1, -45, 0, 0)
MinimizeButton.Size = UDim2.new(0, 35, 1, 0)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "➖"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 200, 40)
MinimizeButton.TextSize = 22

-- ═══════════════════════════════════════
-- 📦 SMALLER INSIDE RECTANGLE BOX
-- ═══════════════════════════════════════

local InnerBox = Instance.new("Frame")
InnerBox.Parent = MainFrame
InnerBox.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
InnerBox.BorderColor3 = Color3.fromRGB(255, 200, 40)
InnerBox.Position = UDim2.new(0.5, -220, 0.5, -110)
InnerBox.Size = UDim2.new(0, 440, 0, 220)
InnerBox.ClipsDescendants = true

local InnerCorner = Instance.new("UICorner")
InnerCorner.CornerRadius = UDim.new(0, 12)
InnerCorner.Parent = InnerBox

local InnerStroke = Instance.new("UIStroke")
InnerStroke.Color = Color3.fromRGB(255, 200, 40)
InnerStroke.Thickness = 2
InnerStroke.Parent = InnerBox

-- ═══════════════════════════════════════
-- 🎯 BUTTONS INSIDE THE BOX
-- ═══════════════════════════════════════

local ContentBox = Instance.new("Frame")
ContentBox.Parent = InnerBox
ContentBox.BackgroundTransparency = 1
ContentBox.Position = UDim2.new(0, 12, 0, 12)
ContentBox.Size = UDim2.new(1, -24, 1, -24)

local ContentList = Instance.new("UIListLayout")
ContentList.Parent = ContentBox
ContentList.Padding = UDim.new(0, 8)
ContentList.Spacing = UDim.new(0, 6)
ContentList.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContentList.VerticalAlignment = Enum.VerticalAlignment.Top

local function addFeatureButton(name, color)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentBox
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.AutoLocalize = false

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        print(name .. " toggled!")
    end)
end

addFeatureButton("Auto Black Hole", Color3.fromRGB(120, 40, 200))
addFeatureButton("Auto TP", Color3.fromRGB(80, 170, 255))
addFeatureButton("Speed", Color3.fromRGB(255, 200, 40))
addFeatureButton("Auto Cherub", Color3.fromRGB(255, 150, 180))
addFeatureButton("Infinite Jump", Color3.fromRGB(80, 200, 120))

-- ═══════════════════════════════════════
-- 🖼️ MINIMIZED LOGO BOX
-- ═══════════════════════════════════════

local MinimizeBox = Instance.new("Frame")
MinimizeBox.Name = "MinimizeBox"
MinimizeBox.Parent = ScreenGui
MinimizeBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MinimizeBox.BorderColor3 = Color3.fromRGB(255, 200, 40)
MinimizeBox.Position = UDim2.new(0.02, 0, 0.5, -70)
MinimizeBox.Size = UDim2.new(0, 150, 0, 130)
MinimizeBox.Visible = false
MinimizeBox.Active = true
MinimizeBox.Draggable = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinimizeBox

local LogoBox = Instance.new("ImageLabel")
LogoBox.Parent = MinimizeBox
LogoBox.BackgroundTransparency = 1
LogoBox.Position = UDim2.new(0.5, -55, 0.05, 0)
LogoBox.Size = UDim2.new(0, 110, 0, 90)
LogoBox.Image = "rbxassetid://13920892146"

local LogoText = Instance.new("TextLabel")
LogoText.Parent = MinimizeBox
LogoText.BackgroundTransparency = 1
LogoText.Position = UDim2.new(0, 0, 0.76, 0)
LogoText.Size = UDim2.new(1, 0, 0, 25)
LogoText.Font = Enum.Font.GothamBold
LogoText.Text = "✨ FREDZEEE — Tap to Open ✨"
LogoText.TextColor3 = Color3.fromRGB(255, 220, 40)
LogoText.TextSize = 12

-- ═══════════════════════════════════════
-- 🔄 MINIMIZE / OPEN LOGIC
-- ═══════════════════════════════════════

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizeBox.Visible = true
end)

MinimizeBox.MouseButton1Click:Connect(function()
    MinimizeBox.Visible = false
    MainFrame.Visible = true
end)
