
-- BananaHub Tab Shop (Full Features)
local BananaHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/KiotenTeam/uilib/main/kiolib.txt"))()
local Window = BananaHub:CreateWindow("BananaHub", "Tab Shop", Color3.fromRGB(0,0,0), true, true)

local Tab = Window:CreateTab("Shop", Color3.fromRGB(255, 255, 255))

-- Redeem Code
Tab:CreateTextbox("Redeem Code", function(code)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
end, "Enter Code")

-- Teleport to Seas (Fixed)
local function TeleportToSea(sea)
    local seas = {
        ["Sea 1"] = Vector3.new(1039, 0, 1235),
        ["Sea 2"] = Vector3.new(5785, 0, 202),
        ["Sea 3"] = Vector3.new(-1234, 0, 9504),
    }
    local coord = seas[sea]
    if coord then
        game.Players.LocalPlayer.Character:MoveTo(coord)
    end
end
Tab:CreateDropdown("Teleport Sea", {"Sea 1", "Sea 2", "Sea 3"}, function(selected)
    TeleportToSea(selected)
end)

-- Fighting Styles Shop
local styles = {
    ["Black Leg"] = "BuyBlackLeg",
    ["Fishman Karate"] = "BuyFishmanKarate",
    ["Electro"] = "BuyElectro",
    ["Dragon Breath"] = "BuyDragonBreath",
    ["SuperHuman"] = "BuySuperHuman",
    ["Death Step"] = "BuyDeathStep",
    ["Sharkman Karate"] = "BuySharkmanKarate",
    ["Electric Claw"] = "BuyElectricClaw",
    ["Dragon Talon"] = "BuyDragonTalon",
    ["God Human"] = "BuyGodHuman",
    ["Sanguine Art"] = "BuySanguineArt"
}
Tab:CreateDropdown("Buy Fighting Style", styles, function(style)
    game:GetService("ReplicatedStorage").Remotes[styles[style]]:InvokeServer()
end)

-- Abilities Shop
local abilities = {
    ["Sky Jump"] = "Geppo",
    ["Buso Haki"] = "Buso",
    ["Observation Haki"] = "Ken",
    ["Soru"] = "Soru"
}
Tab:CreateDropdown("Buy Abilities", abilities, function(ab)
    game:GetService("ReplicatedStorage").Remotes["BuyHaki"]:InvokeServer(abilities[ab])
end)

-- Misc Shop
Tab:CreateButton("Buy Dual Flintlock", function()
    game:GetService("ReplicatedStorage").Remotes.BuyItem:InvokeServer("Dual Flintlock")
end)
Tab:CreateButton("Reroll Race", function()
    game:GetService("ReplicatedStorage").Remotes.Reroll:InvokeServer()
end)
Tab:CreateButton("Reset Stats", function()
    game:GetService("ReplicatedStorage").Remotes.ResetStats:InvokeServer()
end)
Tab:CreateButton("Buy Race: Cyborg", function()
    game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Cyborg")
end)
Tab:CreateButton("Buy Race: Ghoul", function()
    game:GetService("ReplicatedStorage").Remotes.BuyRace:InvokeServer("Ghoul")
end)
