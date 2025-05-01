-- ⛏️ Auto Stuff UI & Logic
local autoFarmTab = createTab("Auto Stuff")

-- TP Delay Slider
local tpDelay = createSlider(autoFarmTab, "TP Delay", 0, 5, 1.6, function(v)
    settings["TP Delay"] = v
end)

-- Tween Delay Slider
local tweenDelay = createSlider(autoFarmTab, "Tween Delay", 0, 5, 1.0, function(v)
    settings["Tween Delay"] = v
end)

-- Auto Farm Nearest Mob Toggle
createToggle(autoFarmTab, "Auto Farm Nearest Mob", false, function(v)
    settings["Auto Farm Nearest Mob"] = v
end)

-- Select World Dropdown
local selectedWorld = ""
createDropdown(autoFarmTab, "Select World", {"One Punch Man", "Solo Leveling", "Bleach"}, function(v)
    selectedWorld = v
end)

-- Select Mobs Dropdown
local allMobs = {
    "Soondo", "Gonshee", "Daek", "Longin", "Anders", "Largalan", "Vermillion",
    "Snake Man", "Blossom", "Black Crow", "Dor",
    "Shark Man", "Eminel", "Light Admiral", "Mifalcon",
    "Luryu", "Fyakuya", "Genji", "Murcielago",
    "Sortudo", "Michille", "Wind", "Time King",
    "Heaven", "Zere", "Ika",
    "Diablo", "Golyne", "Gosuke", "Gucci",
    "Green", "Sky", "Turtle", "Frieza",
    "Cyborg", "Hurricane", "Rider", "Paitama",
    "Ant Soldier", "Ant Warrior", "Ant Queen", "Ziru",
    "A-Rank Enemy", "S-Rank Enemy", "SS-Rank Enemy", "Wesil", "Vulcan", "Metus", "Beran",
    "Frost Elf", "High Frost Elf", "Metal", "Laruda", "Snow Monarch", "Wild Bear"
}

local mobsDropdown = createDropdown(autoFarmTab, "Select Mobs", allMobs, function(v)
    settings["Selected Mob"] = v
end)

-- Select Farm Method Dropdown
createDropdown(autoFarmTab, "Select Farm Method", {"TP", "Tween"}, function(v)
    settings["Farm Method"] = v
end)

-- Auto Farm Selected Mob Toggle
createToggle(autoFarmTab, "Auto Farm Selected Mob", false, function(v)
    settings["Auto Farm Selected Mob"] = v
end)

-- Auto Click Toggle
createToggle(autoFarmTab, "Auto Click", false, function(v)
    settings["Auto Click"] = v
end)

-- Select Mobs to Arise Dropdown
local allAriseMobs = {
    "Wesil", "Paitama", "Frieza", "Gosuke", "Vulcan", "Metus", "Beran",
    "Ziru", "Laruda", "Wild Bear", "Ant Queen", "Time King"
}

createDropdown(autoFarmTab, "Select Mobs to Arise", allAriseMobs, function(v)
    settings["Mobs To Arise"] = v
end)

-- Auto Arise Mobs Toggle
createToggle(autoFarmTab, "Auto Arise Mobs", false, function(v)
    settings["Auto Arise Mobs"] = v
end)

-- Select Action Dropdown
createDropdown(autoFarmTab, "Select Action", {"Destroy"}, function(v)
    settings["Action"] = v
end)

-- Auto Action Toggle
createToggle(autoFarmTab, "Auto Action", false, function(v)
    settings["Auto Action"] = v
end)

-- Auto Equip Best Shadows Toggle
createToggle(autoFarmTab, "Auto Equip Best Shadows", false, function(v)
    settings["Auto Equip Best Shadows"] = v
end)

-- Enter Test (RANK) Button
createButton(autoFarmTab, "Enter Test (RANK)", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("EnterTest")
    if remote then
        remote:FireServer()
    else
        warn("Remote 'EnterTest' not found")
    end
end)

-- 🏱 Give Stuff Tab
local giveStuffTab = createTab("Give Stuff")
createButton(giveStuffTab, "Give Auto Attack Gamepass", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("GiveGamepass")
    if remote then
        remote:FireServer("AutoAttack")
    end
end)
createButton(giveStuffTab, "Give Auto Clicker Gamepass", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("GiveGamepass")
    if remote then
        remote:FireServer("AutoClick")
    end
end)

-- 🔁 Auto Things Tab
local autoThingsTab = createTab("Auto Things")
createDropdown(autoThingsTab, "[Shadow] Rarities Sell", {"Common", "Rare", "Epic", "Legendary"}, function(v)
    settings["Shadow Rarity Sell"] = v
end)
createToggle(autoThingsTab, "Auto Sell Shadows", false, function(v)
    settings["Auto Sell Shadows"] = v
end)
createDropdown(autoThingsTab, "[Weapon] Weapon Sell", {"Common", "Rare", "Epic", "Legendary"}, function(v)
    settings["Weapon Sell"] = v
end)
createButton(autoThingsTab, "Reset Sell Dropdown", function()
    settings["Shadow Rarity Sell"] = nil
    settings["Weapon Sell"] = nil
end)
createToggle(autoThingsTab, "Auto Sell Weapons", false, function(v)
    settings["Auto Sell Weapons"] = v
end)

-- ⚔️ Weapon Actions Tab
local weaponTab = createTab("Weapon Actions")
createButton(weaponTab, "[Weapon] Upgrade Sword", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("UpgradeWeapon")
    if remote then
        remote:FireServer("Sword")
    end
end)
createButton(weaponTab, "[Weapon] Buy Sword", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("BuyWeapon")
    if remote then
        remote:FireServer("Sword")
    end
end)

-- 🏇 Mounts Tab
local mountsTab = createTab("Mounts")
createToggle(mountsTab, "Auto Claim Mounts", false, function(v)
    settings["Auto Claim Mounts"] = v
end)
createToggle(mountsTab, "Auto ServerHop Mounts", false, function(v)
    settings["Auto ServerHop Mounts"] = v
end)
createDropdown(mountsTab, "TP Mounts Locations", {"Location 1", "Location 2"}, function(v)
    settings["TP Mounts"] = v
end)
createButton(mountsTab, "TP Z in Game", function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character:PivotTo(CFrame.new(0, 20, 0))
    end
end)

-- 🔄 Logic Sections Remain Unchanged --
-- Existing logic for Auto Farm, Arise, Nearest Mob, Equip Best, etc. continues below

-- 🔄 Auto Farm Selected Mob Logic
spawn(function()
    while task.wait(0.1) do
        if settings["Auto Farm Selected Mob"] then
            local selectedMobName = settings["Selected Mob"]
            for _, mob in ipairs(workspace.Mobs:GetChildren()) do
                if mob.Name == selectedMobName and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char:PivotTo(CFrame.new(mob.HumanoidRootPart.Position + Vector3.new(0, 3, 0)))
                        if settings["Auto Click"] then
                            mouse1click()
                        end
                    end
                    break
                end
            end
        end
    end
end)

-- 🔄 Auto Arise Mobs Logic
spawn(function()
    while task.wait(0.2) do
        if settings["Auto Arise Mobs"] then
            for _, mob in ipairs(workspace.Mobs:GetChildren()) do
                if mob.Name == settings["Mobs To Arise"] and mob:FindFirstChild("ClickDetector") then
                    fireclickdetector(mob.ClickDetector)
                end
            end
        end
    end
end)

-- 🔄 Auto Farm Nearest Mob Logic
spawn(function()
    while task.wait(0.1) do
        if settings["Auto Farm Nearest Mob"] then
            local nearestMob, shortestDistance = nil, math.huge
            local playerPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            if playerPos then
                for _, mob in ipairs(workspace.Mobs:GetChildren()) do
                    if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        local distance = (mob.HumanoidRootPart.Position - playerPos).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestMob = mob
                        end
                    end
                end
            end
            if nearestMob and nearestMob:FindFirstChild("HumanoidRootPart") and nearestMob:FindFirstChild("Humanoid") and nearestMob.Humanoid.Health > 0 then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char:PivotTo(CFrame.new(nearestMob.HumanoidRootPart.Position + Vector3.new(0, 3, 0)))
                    if settings["Auto Click"] then
                        mouse1click()
                    end
                end
            end
        end
    end
end)

-- 🔄 Auto Equip Best Shadows Logic
spawn(function()
    while task.wait(1) do
        if settings["Auto Equip Best Shadows"] then
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("EquipBest")
            if remote then
                remote:FireServer()
            end
        end
    end
end)
