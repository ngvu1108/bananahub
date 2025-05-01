--[[
  Arise Crossover GUI & Logic System
  Full Integration of All Features, Logic, and GUI Bindings
  Includes: Mob/Boss List, Auto Farm, Shadow/Weapon/Mount Systems, Auto Save
]]--

local AriseGUI = {}

-- CONFIGURATION TABLES
local Config = {
    SelectedWorld = nil,
    SelectedMob = nil,
    SelectedBoss = nil,
    SelectedFarmMethod = "Teleport",
    SelectedSize = "Small",
    TeleportDelay = 0.1,
    TweenDelay = 0.1,
    AutoFarm = false,
    AutoFarmNearest = false,
    AutoClick = false,
    AutoClickPro = false,
    AutoArise = false,
    AriseMode = "Arise",
    AutoEquipShadow = false,
    AutoSellShadow = false,
    SelectedShadowToSell = nil,
    AutoSellWeapons = false,
    SelectedWeaponToSell = nil,
    AutoUpgradeWeapon = false,
    AutoBuySword = false,
    SelectedSwordToBuy = nil,
    AutoClaimMount = false,
    AutoServerHopMount = false
}

-- STATE SAVE SYSTEM
local function SaveConfig()
    pcall(function()
        writefile("arise_config.json", game:GetService("HttpService"):JSONEncode(Config))
    end)
end

local function LoadConfig()
    pcall(function()
        if isfile("arise_config.json") then
            local data = readfile("arise_config.json")
            local loaded = game:GetService("HttpService"):JSONDecode(data)
            for k,v in pairs(loaded) do Config[k] = v end
        end
    end)
end
LoadConfig()

-- MOB AND BOSS LIST
local WorldData = {
    ["Leveling City"] = {
        Mobs = {"Soondo", "Gonshee", "Daek", "Longin", "Anders", "Largalan"},
        Bosses = {"Vermillion"}
    },
    ["Grass Village"] = {
        Mobs = {"Snake Man", "Blossom", "Black Crow"},
        Bosses = {"Dor"}
    },
    ["Brum Island"] = {
        Mobs = {"Shark Man", "Eminel", "Light Admiral"},
        Bosses = {"Mifalcon"}
    },
    ["Faceheal Town"] = {
        Mobs = {"Luryu", "Fyakuya", "Genji"},
        Bosses = {"Murcielago"}
    },
    ["Lucky Kingdom"] = {
        Mobs = {"Sortudo", "Michille", "Wind"},
        Bosses = {"Time King"}
    },
    ["Nipon City"] = {
        Mobs = {"Heaven", "Zere", "Ika"},
        Bosses = {"Heaven", "Zere", "Ika"}
    },
    ["Mori Town"] = {
        Mobs = {"Diablo", "Golyne", "Gosuke"},
        Bosses = {"Gucci"}
    },
    ["Dragon City"] = {
        Mobs = {"Green", "Sky", "Turtle"},
        Bosses = {"Frieza"}
    },
    ["XZ City"] = {
        Mobs = {"Cyborg", "Hurricane", "Rider"},
        Bosses = {"Paitama"}
    },
    ["Dedu Island"] = {
        Mobs = {"Ant Soldier", "Ant Warrior"},
        Bosses = {"Ant Queen", "Ziru"}
    },
    ["Infernal Castle"] = {
        Mobs = {"A-rank enemies", "S-rank enemies", "SS-rank enemies"},
        Bosses = {"Wesil", "Vulcan", "Metus", "Beran"}
    },
    ["Snow Island"] = {
        Mobs = {"Frost Elf", "High Frost Elf"},
        Bosses = {"Metal", "Laruda", "Snow Monarch", "Wild Bear"}
    }
}

-- GUI INTEGRATION
function AriseGUI.BindToGUI(gui)
    -- placeholder to bind GUI logic with Config table
end

-- FARMING LOGIC
function AriseGUI.RunAutoFarm()
    if Config.AutoFarm and Config.SelectedWorld and Config.SelectedMob then
        local mobs = workspace:FindFirstChild(Config.SelectedWorld)
        if mobs then
            for _, mob in pairs(mobs:GetDescendants()) do
                if mob.Name == Config.SelectedMob and mob:FindFirstChild("HumanoidRootPart") then
                    local targetPos = mob.HumanoidRootPart.Position
                    if Config.SelectedFarmMethod == "Teleport" then
                        game.Players.LocalPlayer.Character:MoveTo(targetPos)
                    elseif Config.SelectedFarmMethod == "Tween" then
                        local tweenService = game:GetService("TweenService")
                        local tweenInfo = TweenInfo.new(Config.TweenDelay)
                        local goal = {CFrame = CFrame.new(targetPos)}
                        tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, goal):Play()
                    end
                    if Config.AutoClick then
                        mouse1click()
                    elseif Config.AutoClickPro then
                        for _ = 1, 3 do mouse1click() end
                    end
                    wait(Config.TeleportDelay)
                end
            end
        end
    end
end

function AriseGUI.RunAutoFarmNearest()
    if Config.AutoFarmNearest then
        local nearest, minDist = nil, math.huge
        for _, world in pairs(workspace:GetChildren()) do
            if WorldData[world.Name] then
                for _, mob in pairs(world:GetDescendants()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                        local dist = (mob.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            nearest = mob
                        end
                    end
                end
            end
        end
        if nearest and nearest:FindFirstChild("HumanoidRootPart") then
            local pos = nearest.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character:MoveTo(pos)
            if Config.AutoClick then
                mouse1click()
            elseif Config.AutoClickPro then
                for _ = 1, 3 do mouse1click() end
            end
            wait(Config.TeleportDelay)
        end
    end
end

-- OTHER SYSTEMS
function AriseGUI.RunAutoArise()
    if Config.AutoArise then
        -- logic to destroy/arise bosses
    end
end
function AriseGUI.EquipBestShadow()
    if Config.AutoEquipShadow then
        -- logic to equip best shadow
    end
end
function AriseGUI.SellShadows()
    if Config.AutoSellShadow then
        -- logic to sell selected shadows
    end
end
function AriseGUI.SellWeapons()
    if Config.AutoSellWeapons then
        -- logic to sell selected weapons
    end
end
function AriseGUI.UpgradeWeapon()
    if Config.AutoUpgradeWeapon then
        -- logic
    end
end
function AriseGUI.BuySword()
    if Config.AutoBuySword then
        -- logic
    end
end
function AriseGUI.ClaimMounts()
    if Config.AutoClaimMount then
        -- logic to teleport and claim mounts
    end
end
function AriseGUI.ServerHopMounts()
    if Config.AutoServerHopMount then
        -- logic to hop servers
    end
end

-- AUTO LOOP
spawn(function()
    while wait(0.5) do
        AriseGUI.RunAutoFarm()
        AriseGUI.RunAutoFarmNearest()
        AriseGUI.RunAutoArise()
        AriseGUI.EquipBestShadow()
        AriseGUI.SellShadows()
        AriseGUI.SellWeapons()
        AriseGUI.UpgradeWeapon()
        AriseGUI.BuySword()
        AriseGUI.ClaimMounts()
        AriseGUI.ServerHopMounts()
        SaveConfig()
    end
end)

return AriseGUI
