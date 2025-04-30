-- Tạo GUI chính
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

-- Thanh trái Tab Shop
local LeftTab = Instance.new("Frame", Main)
LeftTab.Size = UDim2.new(0, 140, 1, 0)
LeftTab.Position = UDim2.new(0, 0, 0, 0)
LeftTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local shopLabel = Instance.new("TextLabel", LeftTab)
shopLabel.Size = UDim2.new(1, 0, 0, 30)
shopLabel.Position = UDim2.new(0, 0, 0, 20)
shopLabel.Text = "Tab Shop"
shopLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
shopLabel.TextSize = 18
shopLabel.BackgroundTransparency = 1

-- Nội dung Tab Shop
local Content = Instance.new("ScrollingFrame", Main)
Content.Position = UDim2.new(0, 140, 0, 0)
Content.Size = UDim2.new(1, -140, 1, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 2000)
Content.ScrollBarThickness = 4
Content.BackgroundTransparency = 1

local function createTitle(text, y)
	local title = Instance.new("TextLabel", Content)
	title.Position = UDim2.new(0, 10, 0, y)
	title.Size = UDim2.new(1, -20, 0, 25)
	title.Text = "* " .. text .. " *"
	title.TextColor3 = Color3.fromRGB(0, 170, 255)
	title.TextSize = 18
	title.BackgroundTransparency = 1
	title.TextXAlignment = Enum.TextXAlignment.Left
end

local function createButton(text, y, callback)
	local button = Instance.new("TextButton", Content)
	button.Position = UDim2.new(0, 10, 0, y)
	button.Size = UDim2.new(1, -20, 0, 30)
	button.Text = text
	button.TextSize = 16
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	local uiCorner = Instance.new("UICorner", button)
	uiCorner.CornerRadius = UDim.new(0, 4)
	button.MouseButton1Click:Connect(callback)
end

-- Tạo nội dung
local y = 20

createTitle("Redeem Code", y)
y += 30
createButton("Redeem Code", y, function()
	local codes = {"SECRET", "EXPBOOST", "GAMER", "UPDATE", "NEWCODE"} -- chỉ ví dụ
	for _, code in pairs(codes) do
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(code)
		end)
	end
end)
y += 50

createTitle("Teleport", y)
y += 30
createButton("First Sea", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
y += 30
createButton("Second Sea", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
y += 30
createButton("Third Sea", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)
y += 50

createTitle("Fighting Style", y)
y += 30
createButton("Buy Black Leg", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
end)
y += 30
createButton("Buy Electro", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
end)
y += 50

createTitle("Melee", y)
y += 30
createButton("Dragon Claw", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonClaw")
end)
y += 30
createButton("Superhuman", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
end)
y += 30
createButton("Godhuman", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
end)
y += 50

createTitle("Abilities", y)
y += 30
createButton("Soru", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
end)
y += 30
createButton("Geppo", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
end)
y += 30
createButton("Buso Haki", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
end)
y += 50

createTitle("Misc Shop", y)
y += 30
createButton("Skyjump", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySkyjump")
end)
y += 50

createTitle("Race", y)
y += 30
createButton("Buy Cyborg", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyCyborg")
end)
y += 30
createButton("Buy Ghoul", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGhoulRace")
end)
y += 30
createButton("Reroll Race", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RerollRace")
end)
y += 50

createTitle("Reset Stat", y)
y += 30
createButton("Reset Stat", y, function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ResetStat", "Points")
end)