
-- BananaHub - Tab Shop (No Key, GUI trắng đen)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BananaHub - Shop", "Midnight")

local Tab = Window:NewTab("Shop")
local Section = Tab:NewSection("Main Shop")

Section:NewButton("Redeem All Codes", "Tự động nhập code", function()
    local codes = {"SECRET_ADMIN", "kittgaming", "Sub2Fer999", "Enyu_is_Pro", "Magicbus"}
    for _, code in pairs(codes) do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
        end)
    end
end)

Section:NewButton("Teleport Sea 1", "Dịch chuyển đến Biển 1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1032, 100, 1433)
end)
Section:NewButton("Teleport Sea 2", "Dịch chuyển đến Biển 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5133, 5, 1231)
end)
Section:NewButton("Teleport Sea 3", "Dịch chuyển đến Biển 3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12421, 331, -7521)
end)

local Fighting = Tab:NewSection("Fighting Style")
Fighting:NewButton("Buy Black Leg", "Mua Black Leg", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
end)
-- Thêm các Fighting Style khác tương tự...

local Abilities = Tab:NewSection("Abilities")
Abilities:NewButton("Mua Sky Jump", "$10,000 Beli", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySkyJump")
end)

local Misc = Tab:NewSection("Misc Shop")
Misc:NewButton("Reset Stats", "Reset chỉ số", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ResetStat", "All")
end)
