-- ======================================
--          FREDZEX — SCRIPT
-- ======================================
-- Auto Get Blackhole Egg ✅
-- Auto Get Cherub Egg ✅
-- Auto Get Galaxy Egg ✅
-- Anti AFK ✅
-- Infinite Jump ✅
-- Speed Changer ✅

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

-- Remove old GUI
if CoreGui:FindFirstChild("FredzexUI") then CoreGui.FredzexUI:Destroy() end

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FredzexUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ======================================
-- 🟠 MINIMIZED FLOATING BUTTON
-- ======================================
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatBtn"
FloatBtn.Parent = ScreenGui
FloatBtn.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
FloatBtn.Position = UDim2.new(0.02, 0, 0.5, -25)
FloatBtn.Size = UDim2.new(0, 50, 0, 50)
FloatBtn.Text = "FX"
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatBtn.TextSize = 20
FloatBtn.Visible = false
FloatBtn.Active = true
FloatBtn.Draggable = true
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

-- ======================================
-- 📦 MAIN WINDOW
-- ======================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -135, 0.5, -200)
MainFrame.Size = UDim2.new(0, 270, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

-- 🔴 TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
TopBar.Size = UDim2.new(1, 0, 0, 55)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 20)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -60, 0, 0)
Title.Size = UDim2.new(0, 120, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FREDZEX"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

-- ➖ MINIMIZE BUTTON
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -40, 0, 0)
MinBtn.Size = UDim2.new(0, 35, 1, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 24

-- 📄 CONTENT AREA
local Content = Instance.new("Frame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 15, 0, 65)
Content.Size = UDim2.new(1, -30, 1, -75)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Content
Layout.Spacing = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- ======================================
-- 🔘 BUTTON CREATOR
-- ======================================
local function AddButton(text)
    local btn = Instance.new("TextButton")
    btn.Parent = Content
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(220, 30, 30)
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(220, 30, 30)
    btn.TextSize = 15
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    return btn
end

-- 📋 ALL 6 FEATURE BUTTONS — IN ORDER YOU ASKED!
local btnBlackhole = AddButton("🕳️ Auto Get Blackhole Egg")
local btnCherub = AddButton("🥚 Auto Get Cherub Egg")
local btnGalaxy = AddButton("🌌 Auto Get Galaxy Egg")
local btnAntiAFK = AddButton("🛡️ Anti AFK")
local btnInfJump = AddButton("🦘 Infinite Jump")
local btnSpeed = AddButton("⚡ Speed Changer")

-- ======================================
-- 🔄 MINIMIZE / RESTORE
-- ======================================
local Minimized = false
local function ToggleMin()
    Minimized = not Minimized
    MainFrame.Visible = not Minimized
    FloatBtn.Visible = Minimized
end
MinBtn.MouseButton1Click:Connect(ToggleMin)
FloatBtn.MouseButton1Click:Connect(ToggleMin)

-- ======================================
-- 🧠 FEATURE LOGIC
-- ======================================
local States = {
    Blackhole = false,
    Cherub = false,
    Galaxy = false,
    AntiAFK = false,
    InfJump = false,
    Speed = 32
}

local function ToggleFeature(btn, key)
    btn.MouseButton1Click:Connect(function()
        States[key] = not States[key]
        if States[key] then
            btn.Text = btn.Text .. " ✅"
            btn.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            btn.Text = string.gsub(btn.Text, " ✅", "")
            btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextColor3 = Color3.fromRGB(220, 30, 30)
        end
    end)
end

-- Toggle all buttons
ToggleFeature(btnBlackhole, "Blackhole")
ToggleFeature(btnCherub, "Cherub")
ToggleFeature(btnGalaxy, "Galaxy")
ToggleFeature(btnAntiAFK, "AntiAFK")
ToggleFeature(btnInfJump, "InfJump")

-- ⚡ Speed Changer
btnSpeed.MouseButton1Click:Connect(function()
    States.Speed = States.Speed + 10
    btnSpeed.Text = "⚡ Speed: " .. States.Speed
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("Humanoid") then
        Char.Humanoid.WalkSpeed = States.Speed
    end
end)

-- 🔄 MAIN LOOP
RunService.Heartbeat:Connect(function()
    local Char = LocalPlayer.Character
    if not Char then return end
    local Root = Char:FindFirstChild("HumanoidRootPart")
    local Hum = Char:FindFirstChild("Humanoid")
    if not Root then return end

    -- 🕳️ Auto Blackhole Egg
    if States.Blackhole then
        for _, v in pairs(workspace:GetDescendants()) do
            local Name = string.lower(v.Name)
            if string.find(Name, "blackhole") or string.find(Name, "black_hole") then
                local Target = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if Target then pcall(function() Target.CFrame = Root.CFrame end) end
            end
        end
    end

    -- 🥚 Auto Cherub Egg
    if States.Cherub then
        for _, v in pairs(workspace:GetDescendants()) do
            local Name = string.lower(v.Name)
            if string.find(Name, "cherub") or string.find(Name, "angel") then
                local Target = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if Target then pcall(function() Target.CFrame = Root.CFrame end) end
            end
        end
    end

    -- 🌌 Auto Galaxy Egg
    if States.Galaxy then
        for _, v in pairs(workspace:GetDescendants()) do
            local Name = string.lower(v.Name)
            if string.find(Name, "galaxy") or string.find(Name, "cosmic") or string.find(Name, "universe") then
                local Target = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if Target then pcall(function() Target.CFrame = Root.CFrame end) end
            end
        end
    end

    -- 🛡️ Anti AFK
    if States.AntiAFK and Hum then
        pcall(function()
            Hum:Move(Vector3.new(0.5, 0, 0))
            task.wait(0.1)
            Hum:Move(Vector3.new(-0.5, 0, 0))
        end)
    end
end)

-- 🦘 Infinite Jump
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if States.InfJump and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("✅ FREDZEX LOADED! All Features Working! 🚀")
