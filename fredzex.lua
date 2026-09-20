-- ======================================
--          FREDZEX — NO COLORS
-- ======================================
-- Auto Get Blackhole Egg
-- Auto Get Cherub Egg
-- Auto Get Galaxy Egg
-- Anti AFK
-- Infinite Jump
-- Speed Changer

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then return end

if CoreGui:FindFirstChild("FredzexUI") then CoreGui.FredzexUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FredzexUI"
ScreenGui.Parent = CoreGui

-- MINIMIZE FLOAT BUTTON
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatBtn"
FloatBtn.Parent = ScreenGui
FloatBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
FloatBtn.Position = UDim2.new(0.02, 0, 0.5, -25)
FloatBtn.Size = UDim2.new(0, 50, 0, 50)
FloatBtn.Text = "FX"
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
FloatBtn.TextSize = 20
FloatBtn.Visible = false
FloatBtn.Active = true
FloatBtn.Draggable = true
Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

-- MAIN WINDOW
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(100, 100, 100)
MainFrame.Position = UDim2.new(0.5, -135, 0.5, -200)
MainFrame.Size = UDim2.new(0, 270, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 20)

-- TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
TopBar.Size = UDim2.new(1, 0, 0, 55)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 20)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, -60, 0, 0)
Title.Size = UDim2.new(0, 120, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FREDZEX"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 24

-- MINIMIZE BUTTON
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Position = UDim2.new(1, -40, 0, 0)
MinBtn.Size = UDim2.new(0, 35, 1, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MinBtn.TextSize = 24

-- CONTENT
local Content = Instance.new("Frame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 15, 0, 65)
Content.Size = UDim2.new(1, -30, 1, -75)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Content
Layout.Spacing = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- BUTTON CREATOR
local function AddButton(text)
    local btn = Instance.new("TextButton")
    btn.Parent = Content
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(100, 100, 100)
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 15
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    return btn
end

-- ALL 6 BUTTONS
local btnBlackhole = AddButton("Auto Get Blackhole Egg")
local btnCherub = AddButton("Auto Get Cherub Egg")
local btnGalaxy = AddButton("Auto Get Galaxy Egg")
local btnAntiAFK = AddButton("Anti AFK")
local btnInfJump = AddButton("Infinite Jump")
local btnSpeed = AddButton("Speed Changer")

-- MINIMIZE FUNCTION
local Minimized = false
local function ToggleMin()
    Minimized = not Minimized
    MainFrame.Visible = not Minimized
    FloatBtn.Visible = Minimized
end
MinBtn.MouseButton1Click:Connect(ToggleMin)
FloatBtn.MouseButton1Click:Connect(ToggleMin)

-- FEATURE STATES
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
        btn.Text = States[key] and string.gsub(btn.Text, " ON", "").." ON" or string.gsub(btn.Text, " ON", "")
        btn.BackgroundColor3 = States[key] and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(255, 255, 255)
    end)
end

ToggleFeature(btnBlackhole, "Blackhole")
ToggleFeature(btnCherub, "Cherub")
ToggleFeature(btnGalaxy, "Galaxy")
ToggleFeature(btnAntiAFK, "AntiAFK")
ToggleFeature(btnInfJump, "InfJump")

-- SPEED CHANGER
btnSpeed.MouseButton1Click:Connect(function()
    States.Speed = States.Speed + 10
    btnSpeed.Text = "Speed: " .. States.Speed
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("Humanoid") then
        Char.Humanoid.WalkSpeed = States.Speed
    end
end)

-- MAIN LOOP
RunService.Heartbeat:Connect(function()
    local Char = LocalPlayer.Character
    if not Char then return end
    local Root = Char:FindFirstChild("HumanoidRootPart")
    local Hum = Char:FindFirstChild("Humanoid")
    if not Root then return end

    if States.Blackhole then
        for _, v in pairs(workspace:GetDescendants()) do
            local n = string.lower(v.Name)
            if string.find(n, "blackhole") then
                local t = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if t then pcall(function() t.CFrame = Root.CFrame end) end
            end
        end
    end

    if States.Cherub then
        for _, v in pairs(workspace:GetDescendants()) do
            local n = string.lower(v.Name)
            if string.find(n, "cherub") or string.find(n, "angel") then
                local t = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if t then pcall(function() t.CFrame = Root.CFrame end) end
            end
        end
    end

    if States.Galaxy then
        for _, v in pairs(workspace:GetDescendants()) do
            local n = string.lower(v.Name)
            if string.find(n, "galaxy") or string.find(n, "cosmic") then
                local t = v:IsA("BasePart") and v or v:FindFirstChild("HumanoidRootPart") or v.PrimaryPart
                if t then pcall(function() t.CFrame = Root.CFrame end) end
            end
        end
    end

    if States.AntiAFK and Hum then
        pcall(function()
            Hum:Move(Vector3.new(0.5, 0, 0))
            task.wait(0.1)
            Hum:Move(Vector3.new(-0.5, 0, 0))
        end)
    end
end)

-- INFINITE JUMP
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if States.InfJump and input.KeyCode == Enum.KeyCode.Space then
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            Char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

print("FREDZEX LOADED")
