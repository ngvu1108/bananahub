--// GUI Setup 
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 420, 0, 500)
Main.Position = UDim2.new(0.5, -210, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- Viền xanh biển
local border = Instance.new("UICorner", Main)
border.CornerRadius = UDim.new(0, 😎
local borderStroke = Instance.new("UIStroke", Main)
borderStroke.Color = Color3.fromRGB(0, 170, 255)
borderStroke.Thickness = 2

-- Nút ẩn hiện GUI
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 100, 0, 30)
Toggle.Position = UDim2.new(0, 20, 0, 20)
Toggle.Text = "Toggle GUI"
Toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

-- Tab Buttons Frame
local TabButtons = Instance.new("Frame", Main)
TabButtons.Position = UDim2.new(0, 0, 0, 30)
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- Tabs Container
local Tabs = {}

local function createTabButton(name)
	local btn = Instance.new("TextButton", TabButtons)
	btn.Size = UDim2.new(0, 100, 1, 0)
	btn.Text = name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 13
	return btn
end

local function showTab(tabName)
	for name, frame in pairs(Tabs) do
		frame.Visible = name == tabName
	end
end

-- Tab Shop Content
local TabShop = Instance.new("ScrollingFrame", Main)
TabShop.Position = UDim2.new(0, 0, 0, 60)
TabShop.Size = UDim2.new(1, 0, 1, -60)
TabShop.Name = "TabShop"
TabShop.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabShop.CanvasSize = UDim2.new(0, 0, 10, 0)
TabShop.ScrollBarThickness = 6
TabShop.Visible = true
Tabs["Shop"] = TabShop

-- Button Generator
local function createButton(parent, text, callback)
	local btn = Instance.new("TextButton")
	btn.Parent = parent
	btn.Size = UDim2.new(1, -10, 0, 30)
	btn.Position = UDim2.new(0, 5, 0, (#parent:GetChildren()-1) * 35)
	btn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
	btn.Text = text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(0, 0, 0)
	btn.AutoButtonColor = true
	btn.MouseButton1Click:Connect(callback)
end

-- // Redeem Code
createButton(TabShop, "[REDEEM] Code: Sub2NoobMaster123", function()
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2NoobMaster123")
end)

-- // Teleports
createButton(TabShop, "First Sea", function()
	local npc = workspace:FindFirstChild("Sea1TeleportNPC")
	if npc then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.CFrame + Vector3.new(0, 5, 0)
	end
end)
createButton(TabShop, "Second Sea", function()
	local npc = workspace:FindFirstChild("Sea2TeleportNPC")
	if npc then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.CFrame + Vector3.new(0, 5, 0)
	end
end)
createButton(TabShop, "Third Sea", function()
	local npc = workspace:FindFirstChild("Sea3TeleportNPC")
	if npc then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = npc.CFrame + Vector3.new(0, 5, 0)
	end
end)

-- // Fighting Styles
local meleeStyles = {
	{"Black Leg", "BuyBlackLeg"},
	{"Electro", "BuyElectric"},
	{"Water Kung Fu", "BuyWaterKungFu"},
	{"Dragon Breath", "BuyDragonBreath"},
	{"Superhuman", "BuySuperhuman"},
	{"Death Step", "BuyDeathStep"},
	{"Electric Claw", "BuyElectricClaw"},
	{"Sharkman Karate", "BuySharkmanKarate"},
	{"Dragon Talon", "BuyDragonTalon"},
	{"Godhuman", "BuyGodhuman"},
}
for _, style in ipairs(meleeStyles) do
	createButton(TabShop, " Buy "..style[1], function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(style[2])
	end)
end

-- // Abilities
createButton(TabShop, "Geppo", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
end)
createButton(TabShop, "Buso Haki", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
end)
createButton(TabShop, "Ken Haki", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
end)
createButton(TabShop, "Soru", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
end)

-- // Race
createButton(TabShop, "Reroll Race", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RerollRace", "Pay")
end)
createButton(TabShop, "Buy Ghoul", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyGhoulRace")
end)
createButton(TabShop, "Buy Cyborg", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyRace", "Cyborg")
end)

-- // Reset
createButton(TabShop, "RESET Stats", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ResetStat", "All")
end)

-- Create Tab Buttons
local tabNames = {"Shop"} -- sau này thêm: Status, Player, v.v.
for i, name in ipairs(tabNames) do
	local btn = createTabButton(name)
	btn.Position = UDim2.new(0, (i-1)*100, 0, 0)
	btn.MouseButton1Click:Connect(function()
		showTab(name)
	end)
end
