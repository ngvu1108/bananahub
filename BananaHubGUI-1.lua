
-- GUI Main Container Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Dragify = Instance.new("TextButton")

ScreenGui.Name = "BananaHubGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)

UICorner.Parent = MainFrame

Dragify.Name = "Dragify"
Dragify.Parent = MainFrame
Dragify.BackgroundTransparency = 1.0
Dragify.Size = UDim2.new(1, 0, 1, 0)
Dragify.Text = ""
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
Dragify.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Dragify.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Tab Buttons
local TabShop = Instance.new("TextButton")
local TabStatus = Instance.new("TextButton")
TabShop.Parent = MainFrame
TabShop.Size = UDim2.new(0, 150, 0, 40)
TabShop.Position = UDim2.new(0, 0, 0, 0)
TabShop.Text = "Tab Shop"
TabShop.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabShop.TextColor3 = Color3.fromRGB(255, 255, 255)

TabStatus.Parent = MainFrame
TabStatus.Size = UDim2.new(0, 150, 0, 40)
TabStatus.Position = UDim2.new(0, 150, 0, 0)
TabStatus.Text = "Tab Status and Server"
TabStatus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TabStatus.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Sections for Shop and Status (Hidden until tab clicked)
local ShopFrame = Instance.new("Frame")
ShopFrame.Parent = MainFrame
ShopFrame.Size = UDim2.new(1, 0, 1, -40)
ShopFrame.Position = UDim2.new(0, 0, 0, 40)
ShopFrame.Visible = true
ShopFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = MainFrame
StatusFrame.Size = UDim2.new(1, 0, 1, -40)
StatusFrame.Position = UDim2.new(0, 0, 0, 40)
StatusFrame.Visible = false
StatusFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

TabShop.MouseButton1Click:Connect(function()
    ShopFrame.Visible = true
    StatusFrame.Visible = false
end)
TabStatus.MouseButton1Click:Connect(function()
    ShopFrame.Visible = false
    StatusFrame.Visible = true
end)

-- Add content for ShopFrame and StatusFrame as needed...
-- Placeholder text
local ShopLabel = Instance.new("TextLabel")
ShopLabel.Parent = ShopFrame
ShopLabel.Size = UDim2.new(1, 0, 0, 30)
ShopLabel.Text = "Shop Functions Here (Redeem, Teleport, Fighting Style, etc.)"
ShopLabel.TextColor3 = Color3.new(1, 1, 1)
ShopLabel.BackgroundTransparency = 1

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusFrame
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Text = "Status/Server Info, Event Alerts, etc."
StatusLabel.TextColor3 = Color3.new(1, 1, 1)
StatusLabel.BackgroundTransparency = 1
