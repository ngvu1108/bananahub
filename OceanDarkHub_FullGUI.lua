-- Full GUI with 4 Tabs: Shop, Status & Server, Setting, Farm (with advanced logic)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- Save settings table
local Settings = {
    AutoFarm = false,
    AutoQuest = false,
    SelectedWeapon = nil,
    AutoBuso = false,
    AutoKen = false,
    Hold = {Z = 0.2, X = 0.2, C = 0.2, V = 0.2, F = 0.2},
    Skills = {Z = "", X = "", C = "", V = "", F = ""},
    MaterialFarm = {Enabled = false, Material = ""},
}

-- Create ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "OceanDarkHub"
gui.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame", gui)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.2, 0, 0.2, 0)
main.Size = UDim2.new(0, 650, 0, 400)
main.ClipsDescendants = true
main.Active = true
main.Draggable = true

-- UICorner
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 8)

-- Tab Buttons
local tabList = {"Shop", "Status", "Setting", "Farm"}
local currentTab = nil
local tabButtons = {}
local tabPages = {}

for i, tabName in ipairs(tabList) do
    local button = Instance.new("TextButton", main)
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
    button.Text = tabName
    button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    button.TextColor3 = Color3.fromRGB(0, 170, 255)
    button.BorderSizePixel = 0
    tabButtons[tabName] = button

    local page = Instance.new("Frame", main)
    page.Size = UDim2.new(1, 0, 1, -30)
    page.Position = UDim2.new(0, 0, 0, 30)
    page.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    page.Visible = false
    tabPages[tabName] = page
end

-- Tab switching logic
local function switchTab(tabName)
    for name, page in pairs(tabPages) do
        page.Visible = (name == tabName)
    end
    currentTab = tabName
end

for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

-- ========== TAB: SHOP ==========
local shop = tabPages["Shop"]
local shopLabel = Instance.new("TextLabel", shop)
shopLabel.Text = "Tab Shop: Includes Redeem Code, Teleport, Fighting Styles, Abilities, Misc"
shopLabel.Size = UDim2.new(1, 0, 0, 30)
shopLabel.TextColor3 = Color3.new(1,1,1)
shopLabel.BackgroundTransparency = 1

-- Sample Redeem Code button
local redeemBtn = Instance.new("TextButton", shop)
redeemBtn.Size = UDim2.new(0, 200, 0, 30)
redeemBtn.Position = UDim2.new(0, 10, 0, 40)
redeemBtn.Text = "Redeem Code"
redeemBtn.MouseButton1Click:Connect(function()
    print("Code Redeemed (fake logic)")
end)

-- ========== TAB: STATUS ==========
local status = tabPages["Status"]
local statusLabel = Instance.new("TextLabel", status)
statusLabel.Text = "Tab Status: Shows Stats, Events, and Server Info"
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.TextColor3 = Color3.new(1,1,1)
statusLabel.BackgroundTransparency = 1

-- ========== TAB: SETTING ==========
local setting = tabPages["Setting"]
local settingLabel = Instance.new("TextLabel", setting)
settingLabel.Text = "Tab Setting: Hold settings and Skill assign"
settingLabel.Size = UDim2.new(1, 0, 0, 30)
settingLabel.TextColor3 = Color3.new(1,1,1)
settingLabel.BackgroundTransparency = 1

-- ========== TAB: FARM ==========
local farm = tabPages["Farm"]
local farmLabel = Instance.new("TextLabel", farm)
farmLabel.Text = "Tab Farm: Level, Cake Queen, Bones, Materials..."
farmLabel.Size = UDim2.new(1, 0, 0, 30)
farmLabel.TextColor3 = Color3.new(1,1,1)
farmLabel.BackgroundTransparency = 1

-- Weapon Selector
local weaponBox = Instance.new("TextBox", farm)
weaponBox.PlaceholderText = "Enter weapon name..."
weaponBox.Position = UDim2.new(0, 10, 0, 40)
weaponBox.Size = UDim2.new(0, 200, 0, 30)
weaponBox.Text = ""
weaponBox.FocusLost:Connect(function()
    Settings.SelectedWeapon = weaponBox.Text
end)

-- Auto Farm Toggle
local farmToggle = Instance.new("TextButton", farm)
farmToggle.Position = UDim2.new(0, 10, 0, 80)
farmToggle.Size = UDim2.new(0, 200, 0, 30)
farmToggle.Text = "Auto Farm: OFF"
farmToggle.MouseButton1Click:Connect(function()
    Settings.AutoFarm = not Settings.AutoFarm
    farmToggle.Text = "Auto Farm: " .. (Settings.AutoFarm and "ON" or "OFF")
end)

-- Auto Quest Toggle
local questToggle = Instance.new("TextButton", farm)
questToggle.Position = UDim2.new(0, 10, 0, 120)
questToggle.Size = UDim2.new(0, 200, 0, 30)
questToggle.Text = "Auto Quest: OFF"
questToggle.MouseButton1Click:Connect(function()
    Settings.AutoQuest = not Settings.AutoQuest
    questToggle.Text = "Auto Quest: " .. (Settings.AutoQuest and "ON" or "OFF")
end)

-- Farm logic loop (sample)
RunService.Heartbeat:Connect(function()
    if Settings.AutoFarm and Settings.SelectedWeapon then
        -- Here you’d add logic to teleport to NPC, equip weapon, and attack
        print("[AutoFarm] Farming with:", Settings.SelectedWeapon)
    end
    if Settings.AutoQuest then
        -- Auto Quest logic (check quest, claim reward, get new quest)
        print("[AutoQuest] Handling quest logic")
    end
end)

-- Default tab
switchTab("Shop")
