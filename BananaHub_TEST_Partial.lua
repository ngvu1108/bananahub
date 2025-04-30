-- BananaHub (Partial Version) - TEST ONLY
-- Giao diện chính
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local BananaHub = Library.CreateLib("BananaHub - TEST", "Ocean")

-- === TAB: Farm ===
local FarmTab = BananaHub:NewTab("Farm")
local FarmSection = FarmTab:NewSection("Auto Farming")

FarmSection:NewToggle("Auto Farm Level", "Tự động farm theo level", function(state)
    _G.AutoFarm = state
    while _G.AutoFarm do wait()
        -- Gọi hàm farm level tại đây
    end
end)

FarmSection:NewToggle("Auto Quest", "Tự động nhận và hoàn thành nhiệm vụ", function(state)
    _G.AutoQuest = state
    while _G.AutoQuest do wait()
        -- Gọi hàm nhận quest và farm
    end
end)

FarmSection:NewToggle("Farm Boss", "Tự động đánh Boss", function(state)
    _G.FarmBoss = state
    while _G.FarmBoss do wait()
        -- Hàm farm boss
    end
end)

FarmSection:NewToggle("Farm Elite Pirate", "Đánh Elite Pirate tự động", function(state)
    _G.FarmElite = state
    while _G.FarmElite do wait()
        -- Tìm và đánh elite pirate
    end
end)

FarmSection:NewToggle("Auto Pirate", "Đánh người chơi hệ Hải Tặc", function(state)
    _G.AutoPirate = state
    while _G.AutoPirate do wait()
        -- Xử lý farm pirate
    end
end)

-- === TAB: Fruit and Raid ===
local FRTab = BananaHub:NewTab("Fruit & Raid")
local FruitSection = FRTab:NewSection("Fruits")

FruitSection:NewDropdown("Chọn Trái Ác Quỷ", "Chọn loại trái", {"Bomb", "Flame", "Ice", "Light"}, function(fruit)
    _G.SelectedFruit = fruit
end)

FruitSection:NewButton("Mua Trái Đã Chọn", "Mua trái từ shop", function()
    -- Hàm mua trái từ NPC dựa vào _G.SelectedFruit
end)

FruitSection:NewToggle("Auto Collect Fruit", "Tự động nhặt trái rơi", function(state)
    _G.AutoCollectFruit = state
end)

FruitSection:NewToggle("Auto Store Fruit", "Tự động cất trái vào kho", function(state)
    _G.AutoStoreFruit = state
end)

-- === TAB: Get and Upgrade Items ===
local ItemTab = BananaHub:NewTab("Get & Upgrade Items")
local ItemSection = ItemTab:NewSection("Vũ Khí & Trang Bị")

ItemSection:NewButton("Auto Rengoku", "Tự lấy kiếm Rengoku", function()
    -- Hàm tự lấy Rengoku
end)

ItemSection:NewButton("Auto Farm Saber", "Tự lấy Saber", function()
    -- Hàm tự động farm Saber
end)

-- === TAB: Sea Event ===
local SeaTab = BananaHub:NewTab("Sea Event")
local SeaSection = SeaTab:NewSection("Tính năng chính")

SeaSection:NewToggle("Auto Sea Event", "Tự kích hoạt và đánh sự kiện biển", function(state)
    _G.AutoSeaEvent = state
end)

SeaSection:NewToggle("Auto Attack Leviathan", "Đánh Leviathan", function(state)
    _G.AutoLeviathan = state
end)

SeaSection:NewDropdown("Chọn Vũ Khí", "Chọn để dùng khi đánh Sea Event", {"Melee", "Sword", "Gun"}, function(weapon)
    _G.SeaWeapon = weapon
end)

-- === Anti-Ban Sơ Bộ ===
game:GetService("RunService").Stepped:Connect(function()
    if _G.AutoFarm or _G.AutoQuest then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end)
    end
end)
