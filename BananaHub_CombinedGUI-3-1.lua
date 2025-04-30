
-- Khởi tạo GUI
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BananaHubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local Tabs = Instance.new("Frame", MainFrame)
Tabs.Size = UDim2.new(0, 120, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tabs.BorderSizePixel = 0

-- Nút chuyển tab
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

-- Tạo nội dung Tab Shop
local ShopTab = Instance.new("Frame", MainFrame)
ShopTab.Position = UDim2.new(0, 125, 0, 10)
ShopTab.Size = UDim2.new(1, -135, 1, -20)
ShopTab.BackgroundTransparency = 1
ShopTab.Visible = true

-- Chia hai cột: Left và Right
local LeftColumn = Instance.new("Frame", ShopTab)
LeftColumn.Size = UDim2.new(0.5, -5, 1, 0)
LeftColumn.Position = UDim2.new(0, 0, 0, 0)
LeftColumn.BackgroundTransparency = 1

local RightColumn = Instance.new("Frame", ShopTab)
RightColumn.Size = UDim2.new(0.5, -5, 1, 0)
RightColumn.Position = UDim2.new(0.5, 5, 0, 0)
RightColumn.BackgroundTransparency = 1

-- Hàm tạo tiêu đề nhóm
local function createSectionLabel(parent, text)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(1, 0, 0, 25)
    label.BackgroundTransparency = 1
    label.Text = "🔹 " .. text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 18
    return label
end

-- Hàm tạo nút chức năng
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

-- Nội dung cột Left
do
    createSectionLabel(LeftColumn, "Redeem Code")
    createButton(LeftColumn, "Nhập mã: TEST", function()
        pcall(function()
            ReplicatedStorage.Remotes.Redeem:InvokeServer("TEST")
        end)
    end)

    createSectionLabel(LeftColumn, "Teleport")
    createButton(LeftColumn, "Đến Sea 1", function()
        pcall(function()
            LocalPlayer.Character:MoveTo(Vector3.new(1039, 0, 1235))
        end)
    end)
    createButton(LeftColumn, "Đến Sea 2", function()
        pcall(function()
            LocalPlayer.Character:MoveTo(Vector3.new(2000, 0, 1500))
        end)
    end)
    createButton(LeftColumn, "Đến Sea 3", function()
        pcall(function()
            LocalPlayer.Character:MoveTo(Vector3.new(3000, 0, 2000))
        end)
    end)

    createSectionLabel(LeftColumn, "Fighting Styles")
    createButton(LeftColumn, "Mua Black Leg", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyBlackLeg:InvokeServer()
        end)
    end)
    createButton(LeftColumn, "Mua Fishman Karate", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyFishmanKarate:InvokeServer()
        end)
    end)
    createButton(LeftColumn, "Mua Electro", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyElectro:InvokeServer()
        end)
    end)
    createButton(LeftColumn, "Mua Dragon Breath", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyDragonBreath:InvokeServer()
        end)
    end)
    createButton(LeftColumn, "Mua SuperHuman", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuySuperHuman:InvokeServer()
        end)
    end)
end

-- Nội dung cột Right
do
    createSectionLabel(RightColumn, "Fighting Styles (Tiếp)")
    createButton(RightColumn, "Mua Death Step", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyDeathStep:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Sharkman Karate", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuySharkmanKarate:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Electric Claw", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyElectricClaw:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Dragon Talon", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyDragonTalon:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua God Human", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyGodHuman:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Sanguine Art", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuySanguineArt:InvokeServer()
        end)
    end)

    createSectionLabel(RightColumn, "Abilities")
    createButton(RightColumn, "Mua Sky Jump ($10K)", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuySkyJump:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Buso Haki ($25K)", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyBusoHaki:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Observation Haki ($750K)", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyObservationHaki:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Soru ($100K)", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuySoru:InvokeServer()
        end)
    end)

    createSectionLabel(RightColumn, "Misc")
    createButton(RightColumn, "Mua Dual Flintlock", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyItem:InvokeServer("Dual Flintlock")
        end)
    end)
    createButton(RightColumn, "Reroll Race", function()
        pcall(function()
            ReplicatedStorage.Remotes.RerollRace:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Reset Stats", function()
        pcall(function()
            ReplicatedStorage.Remotes.ResetStats:InvokeServer()
        end)
    end)
    createButton(RightColumn, "Mua Race: Cyborg", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyRace:InvokeServer("Cyborg")
        end)
    end)
    createButton(RightColumn, "Mua Race: Ghoul", function()
        pcall(function()
            ReplicatedStorage.Remotes.BuyRace:InvokeServer("Ghoul")
        end)
    end)
end

-- Hiển thị Tab Shop mặc định
ShopTab.Visible = true


-- Tab: Status and Server
local StatusTab = createContentFrame()

-- Display Player Stats
local function displayStats()
    local stats = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}
    for _, stat in ipairs(stats) do
        createButton(StatusTab, stat .. ": " .. tostring(LocalPlayer.leaderstats[stat].Value), function() end)
    end
end
displayStats()

-- Auto Add Stats (Basic UI)
createButton(StatusTab, "Auto Add Melee", function()
    ReplicatedStorage.Remotes.AddStat:InvokeServer("Melee", 1)
end)

createButton(StatusTab, "Auto Reset Stats", function()
    ReplicatedStorage.Remotes.ResetStats:InvokeServer()
end)

-- Server Info
createButton(StatusTab, "Server Info", function()
    print("JobId: " .. game.JobId)
    print("Ping: " .. tostring(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms")
    print("Players: " .. tostring(#Players:GetPlayers()))
end)

-- Server Hop
createButton(StatusTab, "Hop Server", function()
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    for _, v in pairs(servers) do
        if v.playing < v.maxPlayers then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer)
            break
        end
    end
end)

-- Rejoin
createButton(StatusTab, "Rejoin Server", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

-- Copy Server ID
createButton(StatusTab, "Copy Server ID", function()
    setclipboard(game.JobId)
end)

-- Auto Join Friends
createButton(StatusTab, "Auto Join Friends", function()
    local friends = Players:GetFriendsAsync()
    for _, friend in ipairs(friends:GetCurrentPage()) do
        if friend.IsOnline then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, friend.PlaceId, LocalPlayer)
            break
        end
    end
end)

-- Event Notifier
createButton(StatusTab, "Check Special Events", function()
    if ReplicatedStorage:FindFirstChild("EliteHunter") then
        print("🟢 Elite Hunter xuất hiện")
    end
    if ReplicatedStorage:FindFirstChild("Leviathan") then
        print("🟢 Leviathan đang hoạt động")
    end
    if ReplicatedStorage:FindFirstChild("Mirage") then
        print("🟢 Mirage đã xuất hiện")
    end
    if ReplicatedStorage:FindFirstChild("Kitsune") then
        print("🟢 Kitsune đã xuất hiện")
    end
end)

-- Full Moon Tracker
createButton(StatusTab, "Full Moon Tracker", function()
    local moonPhase = ReplicatedStorage:FindFirstChild("MoonPhase")
    if moonPhase then
        local phase = moonPhase.Value
        print("🌕 Full Moon: " .. phase .. "/8")
        if tonumber(phase) == 8 then
            print("🟢 Đang là Full Moon!")
        elseif tonumber(phase) >= 6 then
            print("Sắp đến Full Moon")
        end
    end
end)

-- Cake Queen Tracker
createButton(StatusTab, "Cake Queen Tracker", function()
    local remaining = ReplicatedStorage:FindFirstChild("CakeBossKills")
    if remaining then
        print("Số quái còn lại để triệu hồi Cake Queen: " .. tostring(remaining.Value))
    end
end)

StatusButton.MouseButton1Click:Connect(function()
    showTab(StatusTab)
end)
