-- ═══════════════════════════════════════
-- 📦 SMALLER INSIDE RECTANGLE BOX
-- ═══════════════════════════════════════

local InnerBox = Instance.new("Frame")
InnerBox.Parent = MainFrame
InnerBox.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
InnerBox.BorderColor3 = Color3.fromRGB(255, 200, 40)
InnerBox.Position = UDim2.new(0.5, -250, 0.5, -120)
InnerBox.Size = UDim2.new(0, 500, 0, 240)
InnerBox.ClipsDescendants = true

local InnerCorner = Instance.new("UICorner")
InnerCorner.CornerRadius = UDim.new(0, 12)
InnerCorner.Parent = InnerBox

local InnerStroke = Instance.new("UIStroke")
InnerStroke.Color = Color3.fromRGB(255, 200, 40)
InnerStroke.Thickness = 2
InnerStroke.Parent = InnerBox

-- 📄 CONTENT INSIDE THE BOX
local ContentBox = Instance.new("Frame")
ContentBox.Parent = InnerBox
ContentBox.BackgroundTransparency = 1
ContentBox.Position = UDim2.new(0, 15, 0, 15)
ContentBox.Size = UDim2.new(1, -30, 1, -30)

local ContentList = Instance.new("UIListLayout")
ContentList.Parent = ContentBox
ContentList.Padding = UDim.new(0, 10)
ContentList.Spacing = UDim.new(0, 8)
ContentList.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContentList.VerticalAlignment = Enum.VerticalAlignment.Top

local ContentPadding = Instance.new("UIPadding")
ContentPadding.Parent = ContentBox
ContentPadding.PaddingTop = UDim.new(0, 10)
ContentPadding.PaddingBottom = UDim.new(0, 10)

-- 🎯 FEATURE BUTTONS
local function addFeatureButton(name, color)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentBox
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 15
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
