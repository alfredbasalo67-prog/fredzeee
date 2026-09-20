-- ╔══════════════════════════════════════╗
-- ║     ✨ FREDZEEE — CUSTOM UI EDITION ✨ ║
-- ║  Minimize (-) + Big Logo Box + Larger ║
-- ╚══════════════════════════════════════╝

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

-- Cleanup old GUI
if CoreGui:FindFirstChild("fredzeee") then CoreGui.fredzeee:Destroy() end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "fredzeee"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ═══════════════════════════════════════
-- 🖼️ MINIMIZED LOGO BOX
-- ═══════════════════════════════════════
local MinimizeBox = Instance.new("Frame")
MinimizeBox.Name = "MinimizeBox"
MinimizeBox.Parent = ScreenGui
MinimizeBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MinimizeBox.BorderColor3 = Color3.fromRGB(255, 200, 40)
MinimizeBox.Position = UDim2.new(0.05, 0, 0.5, -100)
MinimizeBox.Size = UDim2.new(0, 200, 0, 180)
MinimizeBox.Visible = false
MinimizeBox.Active = true
MinimizeBox.Draggable = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 14)
MinCorner.Parent = MinimizeBox

-- 🎮 Ride A Pet IMAGE
local LogoBox = Instance.new("ImageLabel")
LogoBox.Parent = MinimizeBox
LogoBox.BackgroundTransparency = 1
LogoBox.Position = UDim2.new(0.5, -75, 0.05, 0)
LogoBox.Size = UDim2.new(0, 150, 0, 120)
LogoBox.Image = "rbxassetid://13920892146"

local LogoText = Instance.new("TextLabel")
LogoText.Parent = MinimizeBox
LogoText.BackgroundTransparency = 1
LogoText.Position = UDim2.new(0, 0, 0.78, 0)
LogoText.Size = UDim2.new(1, 0, 0, 30)
LogoText.Font = Enum.Font.GothamBold
LogoText.Text = "✨ FREDZEEE — Tap to Open ✨"
LogoText.TextColor3 = Color3.fromRGB(255, 220, 40)
LogoText.TextSize = 14

-- ═══════════════════════════════════════
-- 🖥️ MAIN GUI — LARGER SIZE
-- ═══════════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderColor3 = Color3.fromRGB(255, 200, 40)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -250)
MainFrame.Size = UDim2.new(0, 320, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 50)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "✨ FREDZEEE — Ride A Pet ✨"
Title.TextColor3 = Color3.fromRGB(255, 220, 40)
Title.TextSize = 19

-- ➖ MINIMIZE BUTTON (instead of X close)
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
MinBtn.Position = UDim2.new(1, -45, 0, 8)
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.TextSize = 22

-- Toggle Function
local IsMinimized = false
local function ToggleMinimize()
    IsMinimized = not IsMinimized
    MainFrame.Visible = not IsMinimized
    MinimizeBox.Visible = IsMinimized
end

MinBtn.MouseButton1Click:Connect(ToggleMinimize)
MinimizeBox.MouseButton1Click:Connect(ToggleMinimize)

-- Helper: Create Button
local function CreateButton(name, yPos, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = MainFrame
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.Size = UDim2.new(1, -40, 0, 42)
    btn.Font = Enum.Font.Gotham
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.TextSize = 15
    local uiC = Instance.new("UICorner")
    uiC.CornerRadius = UDim.new(0, 8)
    uiC.Parent = btn
    return btn
end

-- 🥚 Auto Blackhole Egg
local AutoBH = CreateButton("AutoBH", 65, "🥚 Auto Blackhole Egg: OFF")
local AutoBH_Enabled = false
AutoBH.MouseButton1Click:Connect(function()
    AutoBH_Enabled = not AutoBH_Enabled
    AutoBH.Text = AutoBH_Enabled and "🥚 Auto Blackhole Egg: ON ✅" or "🥚 Auto Blackhole Egg: OFF"
    AutoBH.BackgroundColor3 = AutoBH_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- ✨ Auto Cherub Egg
local AutoCherub = CreateButton("AutoCherub", 122, "✨ Auto Cherub Egg: OFF")
local AutoCherub_Enabled = false
AutoCherub.MouseButton1Click:Connect(function()
    AutoCherub_Enabled = not AutoCherub_Enabled
    AutoCherub.Text = AutoCherub_Enabled and "✨ Auto Cherub Egg: ON ✅" or "✨ Auto Cherub Egg: OFF"
    AutoCherub.BackgroundColor3 = AutoCherub_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- 📍 Teleport to Pen
local TPPen = CreateButton("TPPen", 179, "📍 Teleport to Pen")
TPPen.MouseButton1Click:Connect(function()
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        Char.HumanoidRootPart.CFrame = CFrame.new(10, 5, 120)
    end
end)

-- 🦘 Infinite Jump
local InfJump = CreateButton("InfJump", 236, "🦘 Infinite Jump: OFF")
local InfJump_Enabled = false
InfJump.MouseButton1Click:Connect(function()
    InfJump_Enabled = not InfJump_Enabled
    InfJump.Text = InfJump_Enabled and "🦘 Infinite Jump: ON ✅" or "🦘 Infinite Jump: OFF"
    InfJump.BackgroundColor3 = InfJump_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- 👻 NoClip
local NoClip = CreateButton("NoClip", 293, "👻 NoClip: OFF")
local NoClip_Enabled = false
NoClip.MouseButton1Click:Connect(function()
    NoClip_Enabled = not NoClip_Enabled
    NoClip.Text = NoClip_Enabled and "👻 NoClip: ON ✅" or "👻 NoClip: OFF"
    NoClip.BackgroundColor3 = NoClip_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- ⚡ Speed Control
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 20, 0, 355)
SpeedLabel.Size = UDim2.new(0, 280, 0, 28)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Text = "⚡ WalkSpeed:"
SpeedLabel.TextColor3 = Color3.new(1,1,1)
SpeedLabel.TextSize = 15

local SpeedBox = Instance.new("TextBox")
SpeedBox.Parent = MainFrame
SpeedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
SpeedBox.Position = UDim2.new(0, 20, 0, 385)
SpeedBox.Size = UDim2.new(0, 150, 0, 38)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.Text = "32"
SpeedBox.TextColor3 = Color3.new(1,1,1)
SpeedBox.TextSize = 15
local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 8)
BoxCorner.Parent = SpeedBox

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Parent = MainFrame
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 200)
SpeedBtn.Position = UDim2.new(0, 180, 0, 385)
SpeedBtn.Size = UDim2.new(0, 100, 0, 38)
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.Text = "Set"
SpeedBtn.TextColor3 = Color3.new(1,1,1)
SpeedBtn.TextSize = 15
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SpeedBtn
SpeedBtn.MouseButton1Click:Connect(function()
    local speed = tonumber(SpeedBox.Text)
    local Char = LocalPlayer.Character
    if speed and Char and Char:FindFirstChild("Humanoid") then
        Char.Humanoid.WalkSpeed = speed
    end
end)

-- ========== MAIN LOOP — ALL FIXED ==========
RunService.Heartbeat:Connect(function()
    local Char = LocalPlayer.Character
    if not Char then return end
    local Root = Char:FindFirstChild("HumanoidRootPart")
    local Humanoid = Char:FindFirstChild("Humanoid")
    if not Root then return end

    -- 🥚 Auto Collect Eggs
    if AutoBH_Enabled or AutoCherub_Enabled then
        for _, v in pairs(workspace:GetDescendants()) do
            local name = string.lower(v.Name)
            local TargetPart = nil
            if v:IsA("Model") then
                TargetPart = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
            elseif v:IsA("BasePart") then
                TargetPart = v
            end
            if not TargetPart then continue end

            -- Blackhole Egg
            if AutoBH_Enabled then
                if string.find(name, "black") and string.find(name, "hole")
                or string.find(name, "blackhole")
                or string.find(name, "black_hole")
                or string.find(name, "bh") and string.find(name, "egg") then
                    pcall(function() TargetPart.CFrame = Root.CFrame end)
                end
            end

            -- Cherub Egg
            if AutoCherub_Enabled then
                if string.find(name, "cherub")
                or string.find(name, "angel")
                or string.find(name, "cherubegg") then
                    pcall(function() TargetPart.CFrame = Root.CFrame end)
                end
            end
        end
    end

    -- NoClip
    if NoClip_Enabled then
        for _, v in pairs(Char:GetChildren()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- Infinite Jump
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if InfJump_Enabled and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("✅ FREDZEEE — LOADED! Minimize = − | Tap logo to open!")
