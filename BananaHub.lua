-- BananaHub.lua | Full GUI with Shop + Status Tab | Draggable Enabled

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "BananaHubGUI"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local Tabs = Instance.new("Frame", MainFrame)
Tabs.Size = UDim2.new(0, 140, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tabs.BorderSizePixel = 0
Tabs.Name = "Tabs"

local function createTabButton(name, posY)
    local btn = Instance.new("TextButton", Tabs)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    return btn
end

local ShopButton = createTabButton("Shop", 10)
local StatusButton = createTabButton("Status & Server", 60)

-- Content Frames
local function createContentFrame()
    local frame = Instance.new("Frame", MainFrame)
    frame.Position = UDim2.new(0, 150, 0, 10)
    frame.Size = UDim2.new(1, -160, 1, -20)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    return frame
end

local ShopTab = createContentFrame()
local StatusTab = createContentFrame()

local function showTab(tab)
    ShopTab.Visible = false
    StatusTab.Visible = false
    tab.Visible = true
end

-- Button Factory
local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- SHOP TAB --------------------------
createButton(ShopTab, "Redeem Code: TEST", function()
    ReplicatedStorage.Remotes.Redeem:InvokeServer("TEST")
end)

createButton(ShopTab, "Teleport to Sea 1", function()
    LocalPlayer.Character:MoveTo(Vector3.new(1039, 0, 1235))
end)

createButton(ShopTab, "Teleport to Sea 2", function()
    LocalPlayer.Character:MoveTo(Vector3.new(5134, 4, 1500))
end)

createButton(ShopTab, "Teleport to Sea 3", function()
    LocalPlayer.Character:MoveTo(Vector3.new(-12000, 10, 8700))
end)

-- Fighting Style Shop
local fightingStyles = {
    "Black Leg", "Fishman Karate", "Electro", "Dragon Breath",
    "SuperHuman", "Death Step", "Sharkman Karate", "Electric Claw",
    "Dragon Talon", "God Human", "Sanguine Art"
}
for _, style in pairs(fightingStyles) do
    createButton(ShopTab, "Buy " .. style, function()
        ReplicatedStorage.Remotes.BuyStyle:InvokeServer(style)
    end)
end

-- Abilities Shop
local abilities = {
    {name = "Sky Jump", price = "10,000 Beli"},
    {name = "Buso Haki", price = "25,000 Beli"},
    {name = "Observation Haki", price = "750,000 Beli"},
    {name = "Soru", price = "100,000 Beli"},
}
for _, ab in pairs(abilities) do
    createButton(ShopTab, "Buy " .. ab.name .. " [" .. ab.price .. "]", function()
        ReplicatedStorage.Remotes.BuyAbility:InvokeServer(ab.name)
    end)
end

-- Misc Shop
createButton(ShopTab, "Buy Dual Flintlock", function()
    ReplicatedStorage.Remotes.BuyItem:InvokeServer("Dual Flintlock")
end)

createButton(ShopTab, "Reroll Race", function()
    ReplicatedStorage.Remotes.RerollRace:InvokeServer()
end)

createButton(ShopTab, "Reset Stats", function()
    ReplicatedStorage.Remotes.ResetStats:InvokeServer()
end)

createButton(ShopTab, "Buy Race: Cyborg", function()
    ReplicatedStorage.Remotes.BuyRace:InvokeServer("Cyborg")
end)

createButton(ShopTab, "Buy Race: Ghoul", function()
    ReplicatedStorage.Remotes.BuyRace:InvokeServer("Ghoul")
end)

-- STATUS TAB ----------------------------
createButton(StatusTab, "Show Stats", function()
    local stats = LocalPlayer:FindFirstChild("leaderstats")
    if stats then
        for _, v in pairs(stats:GetChildren()) do
            print(v.Name .. ": " .. tostring(v.Value))
        end
    end
end)

createButton(StatusTab, "Rejoin Server", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

createButton(StatusTab, "Server Hop", function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in pairs(servers) do
        if v.playing < v.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer)
            break
        end
    end
end)

createButton(StatusTab, "Copy Server ID", function()
    setclipboard(game.JobId)
end)

-- Tab switching
ShopButton.MouseButton1Click:Connect(function()
    showTab(ShopTab)
end)
StatusButton.MouseButton1Click:Connect(function()
    showTab(StatusTab)
end)

-- Show default tab
showTab(ShopTab)
