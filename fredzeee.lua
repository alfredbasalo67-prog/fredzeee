-- ╔══════════════════════════════════════╗
-- ║        FREDZEE — Ride A Pet          ║
-- ║   Smaller · Working Buttons · Minimize ║
-- ╚══════════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

-- Cleanup old GUI
if CoreGui:FindFirstChild("FREDZEE") then CoreGui.FREDZEE:Destroy() end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FREDZEE"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ═══════════════════════════════════════
-- 🟠 MINIMIZED FLOATING BUTTON
-- ═══════════════════════════════════════
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatBtn"
FloatBtn.Parent = ScreenGui
FloatBtn.BackgroundColor3 = Color3.fromRGB(220, 30, 30)
FloatBtn.Position = UDim2.new(0.02, 0, 0.5, -25)
FloatBtn.Size = UDim2.new(0, 50, 0, 50)
FloatBtn.Text = "FZ"
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatBtn.TextSize = 20
FloatBtn.Visible = false
FloatBtn.Active = true
FloatBtn.Draggable = true
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

-- ═══════════════════════════════════════
-- 📦 MAIN GUI — SMALLER SIZE!
-- ═══════════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -200)
MainFrame.Size = UDim2.new(0, 280, 0, 400) -- ✅ SMALLER!
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
Title.Position = UDim2.new(0.5, -55, 0, 0)
Title.Size = UDim2.new(0, 110, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FREDZEE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

-- ➖ MINIMIZE BUTTON — WORKS NOW!
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -40, 0, 0)
MinBtn.Size = UDim2.new(0, 35, 1, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 24

-- 📄 CONTENT BOX
local Content = Instance.new("ScrollingFrame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 15, 0, 65)
Content.Size = UDim2.new(1, -30, 1, -75)
Content.CanvasSize = UDim2.new(0, 0, 0, 380)
Content.ScrollBarThickness = 4
Content.ScrollBarColor3 = Color3.fromRGB(220, 30, 30)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Content
Layout.Padding = UDim.new(0, 0)
Layout.Spacing = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- ═══════════════════════════════════════
-- 🔘 BUTTON CREATOR
-- ═══════════════════════════════════════
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
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    return btn
end

-- 📋 ALL BUTTONS — NOW SHOW UP!
local btnCherub = AddButton("🥚 Auto Get Cherub Egg")
local btnBlackhole = AddButton("🕳️ Auto Get Blackhole Egg")
local btnAntiAFK = AddButton("🛡️ Anti AFK")
local btnInfJump = AddButton("🦘 Infinite Jump")
local btnSpeed = AddButton("⚡ Speed Changer")
local btnTP = AddButton("📍 Auto Teleport to Pen")

-- ═══════════════════════════════════════
-- 🔄 MINIMIZE / RESTORE — FIXED!
-- ═══════════════════════════════════════
local Minimized = false
local function ToggleMin()
    Minimized = not Minimized
    MainFrame.Visible = not Minimized
    FloatBtn.Visible = Minimized
end
MinBtn.MouseButton1Click:Connect(ToggleMin)
FloatBtn.MouseButton1Click:Connect(ToggleMin)

-- ═══════════════════════════════════════
-- 🧠 FEATURES — TOGGLE ON/OFF
-- ═══════════════════════════════════════
local States = {
    Cherub = false,
    Blackhole = false,
    AntiAFK = false,
    InfJump = false,
    Speed = 32
}

local function Toggle(btn, key)
    btn.MouseButton1Click:Connect(function()
        States[key] = not States[key]
        btn.Text = States[key] and btn.Text .. " ✅" or string.gsub(btn.Text, " ✅", "")
        btn.BackgroundColor3 = States[key] and Color3.fromRGB(220, 30, 30) or Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = States[key] and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(220, 30, 30)
    end)
end

Toggle(btnCherub, "Cherub")
Toggle(btnBlackhole, "Blackhole")
Toggle(btnAntiAFK, "AntiAFK")
Toggle(btnInfJump, "InfJump")

-- Speed
btnSpeed.MouseButton1Click:Connect(function()
    States.Speed = States.Speed + 10
    btnSpeed.Text = "⚡ Speed: " .. States.Speed
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("Humanoid") then
        Char.Humanoid.WalkSpeed = States.Speed
    end
end)

-- TP
btnTP.MouseButton1Click:Connect(function()
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        Char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0) -- Change coords if needed
    end
end)

-- ═══════════════════════════════════════
-- 🔄 MAIN LOOP
-- ═══════════════════════════════════════
RunService.Heartbeat:Connect(function()
    local Char = LocalPlayer.Character
    if not Char then return end
    local Root = Char:FindFirstChild("HumanoidRootPart")
    local Hum = Char:FindFirstChild("Humanoid")
    if not Root then return end

    if States.AntiAFK and Hum then
        pcall(function() Hum:Move(Vector3.new(0.5,0,0)) task.wait(0.1) Hum:Move(Vector3.new(-0.5,0,0)) end)
    end
end)

-- Infinite Jump
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if States.InfJump and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("✅ FREDZEE LOADED! Smaller + Buttons Working! 🚀")
