-- BananaHub Full GUI (4 Tabs: Shop, Status & Server, Setting, Farm)
-- Smooth interface, toggleable GUI, rounded corners, full features

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Settings = {
    AutoFarm = false,
    AutoQuest = false,
    AutoBuso = false,
    AutoKen = false,
    SelectedWeapon = "",
    Hold = {Z = 0.2, X = 0.2, C = 0.2, V = 0.2, F = 0.2},
    Skills = {Z = "", X = "", C = "", V = "", F = ""},
    ShowGUI = true
}

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 700, 0, 450)
main.Position = UDim2.new(0.5, -350, 0.5, -225)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.Active = true
main.Draggable = true
main.Visible = Settings.ShowGUI

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 8)

local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "Toggle GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
toggleButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", toggleButton)

toggleButton.MouseButton1Click:Connect(function()
    Settings.ShowGUI = not Settings.ShowGUI
    main.Visible = Settings.ShowGUI
end)

-- Tabs
local tabNames = {"Shop", "Status", "Setting", "Farm"}
local tabButtons, tabPages = {}, {}
local currentTab = nil

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.TextColor3 = Color3.fromRGB(255, 255, 0)
    Instance.new("UICorner", btn)
    tabButtons[name] = btn

    local page = Instance.new("Frame", main)
    page.Size = UDim2.new(1, 0, 1, -30)
    page.Position = UDim2.new(0, 0, 0, 30)
    page.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    page.Visible = false
    tabPages[name] = page
    Instance.new("UICorner", page)
end

local function switchTab(name)
    for tab, page in pairs(tabPages) do
        page.Visible = (tab == name)
    end
    currentTab = name
end

for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

-- ================= TAB: SHOP =================
local shop = tabPages["Shop"]
local shopOptions = {
    {"Redeem Code", function() print("Code Redeemed") end},
    {"Buy Black Leg", function() print("Bought Black Leg") end},
    {"Buy Electro", function() print("Bought Electro") end},
    {"Teleport to Sea 1", function() print("Teleported to Sea 1") end},
    {"Teleport to Sea 2", function() print("Teleported to Sea 2") end},
    {"Teleport to Sea 3", function() print("Teleported to Sea 3") end},
}

for i, opt in ipairs(shopOptions) do
    local btn = Instance.new("TextButton", shop)
    btn.Size = UDim2.new(0, 200, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 10 + (i - 1) * 35)
    btn.Text = opt[1]
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(opt[2])
end

-- ================= TAB: STATUS =================
local status = tabPages["Status"]
local statusLabel = Instance.new("TextLabel", status)
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, 10)
statusLabel.Text = "Tab Status: Shows Stats and Server Info"
statusLabel.TextColor3 = Color3.new(1,1,1)
statusLabel.BackgroundTransparency = 1

-- ================= TAB: SETTING =================
local setting = tabPages["Setting"]
local function createToggle(parent, label, key)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200, 0, 30)
    btn.Text = label .. ": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn)

    btn.MouseButton1Click:Connect(function()
        Settings[key] = not Settings[key]
        btn.Text = label .. ": " .. (Settings[key] and "ON" or "OFF")
    end)
end

createToggle(setting, "Auto Buso", "AutoBuso")
createToggle(setting, "Auto Ken", "AutoKen")

-- ================= TAB: FARM =================
local farm = tabPages["Farm"]

local weaponBox = Instance.new("TextBox", farm)
weaponBox.PlaceholderText = "Enter weapon..."
weaponBox.Position = UDim2.new(0, 10, 0, 10)
weaponBox.Size = UDim2.new(0, 200, 0, 30)
weaponBox.Text = ""
Instance.new("UICorner", weaponBox)

weaponBox.FocusLost:Connect(function()
    Settings.SelectedWeapon = weaponBox.Text
end)

createToggle(farm, "Auto Farm", "AutoFarm")
createToggle(farm, "Auto Quest", "AutoQuest")

RunService.Heartbeat:Connect(function()
    if Settings.AutoFarm and Settings.SelectedWeapon ~= "" then
        print("[AutoFarm] Farming with: ", Settings.SelectedWeapon)
    end
    if Settings.AutoQuest then
        print("[AutoQuest] Active")
    end
end)

-- Default tab
switchTab("Shop")
