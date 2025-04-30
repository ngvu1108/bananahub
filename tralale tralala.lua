local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "BananaHubGUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local Tabs = Instance.new("Frame", MainFrame)
Tabs.Size = UDim2.new(0, 120, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tabs.BorderSizePixel = 0

-- Tab Buttons
local function createTabButton(name, posY)
    local btn = Instance.new("TextButton", Tabs)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BorderSizePixel = 0
    return btn
end

local ShopButton = createTabButton("Shop", 10)
local StatusButton = createTabButton("Status", 60)

-- Tab Content Frames
local function createContentFrame()
    local frame = Instance.new("Frame", MainFrame)
    frame.Position = UDim2.new(0, 125, 0, 10)
    frame.Size = UDim2.new(1, -135, 1, -20)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    return frame
end

local ShopTab = createContentFrame()
local StatusTab = createContentFrame()

-- Show tab
local function showTab(tab)
    ShopTab.Visible = false
    StatusTab.Visible = false
    tab.Visible = true
end

-- ShopTab Content
local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Text = text
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createButton(ShopTab, "Redeem Code: TEST", function()
    ReplicatedStorage.Remotes.Redeem:InvokeServer("TEST")
end)

createButton(ShopTab, "Teleport to Sea 1", function()
    LocalPlayer.Character:MoveTo(Vector3.new(1039, 0, 1235))
end)

createButton(ShopTab, "Buy Black Leg", function()
    ReplicatedStorage.Remotes.BuyBlackLeg:InvokeServer()
end)

createButton(ShopTab, "Buy Dual Flintlock", function()
    ReplicatedStorage.Remotes.BuyItem:InvokeServer("Dual Flintlock")
end)

createButton(ShopTab, "Reset Stats", function()
    ReplicatedStorage.Remotes.ResetStats:InvokeServer()
end)

-- StatusTab Content
createButton(StatusTab, "Show Player Name", function()
    print("Name: " .. LocalPlayer.Name)
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

-- Tab Button Behavior
ShopButton.MouseButton1Click:Connect(function()
    showTab(ShopTab)
end)
StatusButton.MouseButton1Click:Connect(function()
    showTab(StatusTab)
end)

-- Default
showTab(ShopTab)
