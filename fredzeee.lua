-- ╔══════════════════════════════════════╗
-- ║    ✨ FREDZEEE — FULLY FIXED ✨       ║
-- ║ Ride A Pet — Auto Eggs + Jump FIXED    ║
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

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "fredzeee"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderColor3 = Color3.fromRGB(255, 200, 40)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -210)
MainFrame.Size = UDim2.new(0, 280, 0, 440)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 45)

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Size = UDim2.new(1, -55, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "✨ FREDZEEE ✨"
Title.TextColor3 = Color3.fromRGB(255, 220, 40)
Title.TextSize = 18

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = TitleBar
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
ToggleBtn.Position = UDim2.new(1, -38, 0, 7)
ToggleBtn.Size = UDim2.new(0, 32, 0, 32)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "X"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.TextSize = 15

local GUI_Open = true
ToggleBtn.MouseButton1Click:Connect(function()
    GUI_Open = not GUI_Open
    MainFrame.Visible = GUI_Open
    ToggleBtn.Text = GUI_Open and "X" or "≡"
    ToggleBtn.BackgroundColor3 = GUI_Open 
        and Color3.fromRGB(200, 60, 60) 
        or Color3.fromRGB(60, 180, 80)
end)

-- Helper: Create Button
local function CreateButton(name, yPos, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = MainFrame
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    btn.Position = UDim2.new(0, 15, 0, yPos)
    btn.Size = UDim2.new(1, -30, 0, 38)
    btn.Font = Enum.Font.Gotham
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.TextSize = 14
    local uiC = Instance.new("UICorner")
    uiC.CornerRadius = UDim.new(0, 6)
    uiC.Parent = btn
    return btn
end

-- 🥚 Auto Blackhole Egg — FIXED
local AutoBH = CreateButton("AutoBH", 55, "🥚 Auto Blackhole Egg: OFF")
local AutoBH_Enabled = false
AutoBH.MouseButton1Click:Connect(function()
    AutoBH_Enabled = not AutoBH_Enabled
    AutoBH.Text = AutoBH_Enabled and "🥚 Auto Blackhole Egg: ON ✅" or "🥚 Auto Blackhole Egg: OFF"
    AutoBH.BackgroundColor3 = AutoBH_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- ✨ Auto Cherub Egg — FIXED
local AutoCherub = CreateButton("AutoCherub", 103, "✨ Auto Cherub Egg: OFF")
local AutoCherub_Enabled = false
AutoCherub.MouseButton1Click:Connect(function()
    AutoCherub_Enabled = not AutoCherub_Enabled
    AutoCherub.Text = AutoCherub_Enabled and "✨ Auto Cherub Egg: ON ✅" or "✨ Auto Cherub Egg: OFF"
    AutoCherub.BackgroundColor3 = AutoCherub_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- 📍 Teleport to Pen
local TPPen = CreateButton("TPPen", 151, "📍 Teleport to Pen")
TPPen.MouseButton1Click:Connect(function()
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        Char.HumanoidRootPart.CFrame = CFrame.new(10, 5, 120)
    end
end)

-- 🦘 Infinite Jump — FULLY FIXED
local InfJump = CreateButton("InfJump", 199, "🦘 Infinite Jump: OFF")
local InfJump_Enabled = false
InfJump.MouseButton1Click:Connect(function()
    InfJump_Enabled = not InfJump_Enabled
    InfJump.Text = InfJump_Enabled and "🦘 Infinite Jump: ON ✅" or "🦘 Infinite Jump: OFF"
    InfJump.BackgroundColor3 = InfJump_Enabled and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(40, 40, 55)
end)

-- 👻 NoClip
local NoClip = CreateButton("NoClip", 247, "👻 NoClip: OFF")
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
SpeedLabel.Position = UDim2.new(0, 15, 0, 300)
SpeedLabel.Size = UDim2.new(0, 200, 0, 25)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Text = "⚡ WalkSpeed:"
SpeedLabel.TextColor3 = Color3.new(1,1,1)
SpeedLabel.TextSize = 14

local SpeedBox = Instance.new("TextBox")
SpeedBox.Parent = MainFrame
SpeedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
SpeedBox.Position = UDim2.new(0, 15, 0, 330)
SpeedBox.Size = UDim2.new(0, 130, 0, 32)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.Text = "32"
SpeedBox.TextColor3 = Color3.new(1,1,1)
SpeedBox.TextSize = 14

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Parent = MainFrame
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 200)
SpeedBtn.Position = UDim2.new(0, 160, 0, 330)
SpeedBtn.Size = UDim2.new(0, 75, 0, 32)
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.Text = "Set"
SpeedBtn.TextColor3 = Color3.new(1,1,1)
SpeedBtn.TextSize = 14
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

    -- 🥚 Auto Collect Eggs — FIXED: uses GetDescendants()
    if AutoBH_Enabled or AutoCherub_Enabled then
        for _, v in pairs(workspace:GetDescendants()) do
            local name = string.lower(v.Name)
            local TargetPart = nil

            -- Get main part if it's a Model
            if v:IsA("Model") then
                TargetPart = v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
            elseif v:IsA("BasePart") then
                TargetPart = v
            end

            if not TargetPart then continue end

            -- BLACKHOLE EGG — ALL name variations
            if AutoBH_Enabled then
                if string.find(name, "black") and string.find(name, "hole")
                or string.find(name, "blackhole")
                or string.find(name, "black_hole")
                or string.find(name, "bh") and string.find(name, "egg")
                or string.find(name, "darkhole") then
                    pcall(function() TargetPart.CFrame = Root.CFrame end)
                end
            end

            -- CHERUB EGG — ALL name variations
            if AutoCherub_Enabled then
                if string.find(name, "cherub")
                or string.find(name, "angel")
                or string.find(name, "cherubegg")
                or string.find(name, "winged") then
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

    -- INFINITE JUMP — FIXED METHOD
    if InfJump_Enabled and Humanoid then
        if Humanoid.FloorMaterial ~= Enum.Material.Air then
            -- Player is on ground — ready to jump
            InfJump.CanJump = true
        end
    end
end)

-- Infinite Jump — KEY DETECTION
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if InfJump_Enabled and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("✅ FREDZEEE — ALL FIXED!")
