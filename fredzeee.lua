-- ╔══════════════════════════════════════╗
-- ║        FREDZEE — Ride A Pet          ║
-- ║   Red & White Theme · Clean Design   ║
-- ╚══════════════════════════════════════╝

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

-- Cleanup old GUI
if CoreGui:FindFirstChild("FREDZEE") then CoreGui.FREDZEE:Destroy() end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FREDZEE"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ═══════════════════════════════════════
-- 🟡 MINIMIZED FLOATING BUTTON
-- ═══════════════════════════════════════
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ScreenGui
MinimizeButton.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
MinimizeButton.Position = UDim2.new(0.02, 0, 0.5, -30)
MinimizeButton.Size = UDim2.new(0, 60, 0, 60)
MinimizeButton.Text = "FZ"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 24
MinimizeButton.Visible = false
MinimizeButton.Active = true
MinimizeButton.Draggable = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinimizeButton

-- ═══════════════════════════════════════
-- 📦 MAIN GUI — RED & WHITE, NO OUTER BORDER
-- ═══════════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -260)
MainFrame.Size = UDim2.new(0, 320, 0, 520)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 24)
MainCorner.Parent = MainFrame

-- 🔴 TOP BAR — FREDZEE
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
TopBar.Size = UDim2.new(1, 0, 0, 70)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 24)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -70, 0, 0)
Title.Size = UDim2.new(0, 140, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FREDZEE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 32

-- ➖ MINIMIZE BUTTON (Top Right)
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -50, 0, 10)
MinBtn.Size = UDim2.new(0, 40, 0, 50)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 28

-- 📄 CONTENT AREA
local ContentBox = Instance.new("Frame")
ContentBox.Parent = MainFrame
ContentBox.BackgroundTransparency = 1
ContentBox.Position = UDim2.new(0, 20, 0, 90)
ContentBox.Size = UDim2.new(1, -40, 1, -110)

local ButtonLayout = Instance.new("UIListLayout")
ButtonLayout.Parent = ContentBox
ButtonLayout.Padding = UDim.new(0, 0)
ButtonLayout.Spacing = UDim.new(0, 12)
ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ButtonLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- ═══════════════════════════════════════
-- 🎯 FEATURE VARIABLES
-- ═══════════════════════════════════════
local AutoCherub_Enabled = false
local AutoBlackhole_Enabled = false
local AntiAFK_Enabled = false
local InfJump_Enabled = false
local NoClip_Enabled = false
local WalkSpeed = 32

-- ═══════════════════════════════════════
-- 🔘 BUTTON CREATOR
-- ═══════════════════════════════════════
local function CreateButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentBox
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 3
    btn.BorderColor3 = Color3.fromRGB(220, 30, 30)
    btn.Size = UDim2.new(1, 0, 0, 55)
    btn.Font = Enum.Font.GothamBold
    btn.Text = name .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(220, 30, 30)
    btn.TextSize = 18

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 16)
    btnCorner.Parent = btn

    return btn
end

-- 📋 CREATE ALL 6 BUTTONS
local AutoCherubBtn = CreateButton("Auto Get Cherub Egg")
local AutoBlackholeBtn = CreateButton("Auto Get Blackhole Egg")
local AntiAFKBtn = CreateButton("Anti AFK")
local InfJumpBtn = CreateButton("Infinite Jump")
local SpeedBtn = CreateButton("Speed Changer")
local TPPenBtn = CreateButton("Auto Teleport to Pen")

-- ═══════════════════════════════════════
-- 🔄 TOGGLE FUNCTION
-- ═══════════════════════════════════════
local function ToggleButton(btn, varName)
    btn.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]
        local isOn = _G[varName]
        btn.Text = string.gsub(btn.Text, ": .+", isOn and ": ON ✅" or ": OFF")
        btn.BackgroundColor3 = isOn and Color3.fromRGB(220, 30, 30) or Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = isOn and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(220, 30, 30)
    end)
end

-- Initialize states
_G.AutoCherub_Enabled = false
_G.AutoBlackhole_Enabled = false
_G.AntiAFK_Enabled = false
_G.InfJump_Enabled = false

ToggleButton(AutoCherubBtn, "AutoCherub_Enabled")
ToggleButton(AutoBlackholeBtn, "AutoBlackhole_Enabled")
ToggleButton(AntiAFKBtn, "AntiAFK_Enabled")
ToggleButton(InfJumpBtn, "InfJump_Enabled")

-- ⚡ SPEED CHANGER
local SpeedInput = Instance.new("TextBox")
SpeedInput.Parent = ContentBox
SpeedInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.BorderSizePixel = 3
SpeedInput.BorderColor3 = Color3.fromRGB(220, 30, 30)
SpeedInput.Size = UDim2.new(1, 0, 0, 55)
SpeedInput.Font = Enum.Font.GothamBold
SpeedInput.Text = "Speed: 32"
SpeedInput.TextColor3 = Color3.fromRGB(220, 30, 30)
SpeedInput.TextSize = 18

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 16)
SpeedCorner.Parent = SpeedInput

SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local num = tonumber(string.match(SpeedInput.Text, "%d+"))
        if num then
            WalkSpeed = num
            SpeedInput.Text = "Speed: " .. num
            local Char = LocalPlayer.Character
            if Char and Char:FindFirstChild("Humanoid") then
                Char.Humanoid.WalkSpeed = num
            end
        end
    end
end)

-- 📍 TELEPORT TO PEN
TPPenBtn.MouseButton1Click:Connect(function()
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        Char.HumanoidRootPart.CFrame = CFrame.new(10, 5, 120)
    end
end)

-- ═══════════════════════════════════════
-- 🔄 MINIMIZE / RESTORE
-- ═══════════════════════════════════════
local IsMinimized = false
local function ToggleMinimize()
    IsMinimized = not IsMinimized
    MainFrame.Visible = not IsMinimized
    MinimizeButton.Visible = IsMinimized
end

MinBtn.MouseButton1Click:Connect(ToggleMinimize)
MinimizeButton.MouseButton1Click:Connect(ToggleMinimize)

-- ═══════════════════════════════════════
-- 🧠 MAIN LOOP — ALL FEATURES
-- ═══════════════════════════════════════
RunService.Heartbeat:Connect(function()
    local Char = LocalPlayer.Character
    if not Char then return end
    local Root = Char:FindFirstChild("HumanoidRootPart")
    local Humanoid = Char:FindFirstChild("Humanoid")
    if not Root then return end

    -- 🥚 Auto Cherub Egg
    if _G.AutoCherub_Enabled then
        for _, v in pairs(workspace:GetDescendants()) do
            local name = string.lower(v.Name)
            if string.find(name, "cherub") or string.find(name, "angel") then
                local Target = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if Target then pcall(function() Target.CFrame = Root.CFrame end) end
            end
        end
    end

    -- 🥚 Auto Blackhole Egg
    if _G.AutoBlackhole_Enabled then
        for _, v in pairs(workspace:GetDescendants()) do
            local name = string.lower(v.Name)
            if string.find(name, "black") and string.find(name, "hole") or string.find(name, "blackhole") then
                local Target = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if Target then pcall(function() Target.CFrame = Root.CFrame end) end
            end
        end
    end

    -- 🛡️ Anti AFK
    if _G.AntiAFK_Enabled then
        task.spawn(function()
            pcall(function()
                Humanoid:Move(Vector3.new(1,0,0))
                task.wait(0.05)
                Humanoid:Move(Vector3.new(-1,0,0))
            end)
        end)
    end
end)

-- 🦘 Infinite Jump
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if _G.InfJump_Enabled and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("✅ FREDZEE LOADED! Red & White Design! 🚀")
