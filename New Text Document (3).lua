local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

--// GUI Setup
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "FullTabShopGUI"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 500)
main.Position = UDim2.new(0.5, -200, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
main.Active = true
main.Draggable = true

local uicorner = Instance.new("UICorner", main)
uicorner.CornerRadius = UDim.new(0, 12)

--// Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "TAB SHOP"
title.TextColor3 = Color3.fromRGB(0, 170, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 26

--// Scrolling
local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -20, 1, -50)
scroll.Position = UDim2.new(0, 10, 0, 45)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 5)

--// Button function
local function createButton(text, callback)
	local btn = Instance.new("TextButton", scroll)
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 20
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 😎
	btn.MouseButton1Click:Connect(callback)
end

--// Redeem Codes
local codes = { "SubToFer999", "Enyu_is_Pro", "Sub2Daigrock", "Magicbus", "JCWK", "Bluxxy", "Starcodeheo", "Sub2CaptainMaui", "kittgaming" }
for _, code in ipairs(codes) do
	createButton("[REDEEM] "..code, function()
		ReplicatedStorage.Remotes.CommF_:InvokeServer("RedeemCode", code)
	end)
end

--// Teleports
createButton("[TP] To Cafe", function()
	player.Character:MoveTo(Vector3.new(-385, 73, 298))
end)

createButton("[TP] To Castle", function()
	player.Character:MoveTo(Vector3.new(-5581, 335, -2957))
end)

--// Fighting Styles
local styles = {
	{"BuyBlackLeg", "Black Leg"},
	{"BuyElectric", "Electric"},
	{"BuyWaterKungFu", "Water Kung Fu"},
	{"BuyDragonBreath", "Dragon Breath"},
	{"BuySuperhuman", "Superhuman"},
	{"BuyDeathStep", "Death Step"},
	{"BuyElectricClaw", "Electric Claw"},
	{"BuySharkmanKarate", "Sharkman Karate"},
	{"BuyDragonTalon", "Dragon Talon"},
	{"BuyGodhuman", "Godhuman"},
	{"BuyCombat", "Combat"}
}
for _, s in ipairs(styles) do
	createButton("[MELEE] "..s[2], function()
		ReplicatedStorage.Remotes.CommF_:InvokeServer(s[1])
	end)
end

--// Abilities
createButton("[ABILITY] Buy Geppo", function()
	ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
end)
createButton("[ABILITY] Buy Buso", function()
	ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
end)
createButton("[ABILITY] Buy Ken", function()
	ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", "Ken")
end)

--// Race + Reset
createButton("[RACE] Reroll Race", function()
	ReplicatedStorage.Remotes.CommF_:InvokeServer("Reroll", "Race")
end)

createButton("[STATS] Reset Stats", function()
	ReplicatedStorage.Remotes.CommF_:InvokeServer("ResetStatPoints")
end)