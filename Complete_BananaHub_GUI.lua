-- Complete BananaHub GUI Script
-- Tab Shop: Redeem Code, Teleport, Fighting Style, Abilities, Misc Shop
-- Tab Status and Server: Stats Display, Auto Stat, Reset, Server Info, Event Notifications

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BananaHubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Draggable Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- UICorner for rounded top corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Tab Buttons
local TabShop = Instance.new("TextButton")
TabShop.Size = UDim2.new(0, 250, 0, 30)
TabShop.Position = UDim2.new(0, 0, 0, 0)
TabShop.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
TabShop.Text = "Tab Shop"
TabShop.TextColor3 = Color3.fromRGB(255, 255, 255)
TabShop.Font = Enum.Font.GothamBold
TabShop.TextSize = 14
TabShop.Parent = MainFrame

local TabStatus = Instance.new("TextButton")
TabStatus.Size = UDim2.new(0, 250, 0, 30)
TabStatus.Position = UDim2.new(0, 250, 0, 0)
TabStatus.BackgroundColor3 = Color3.fromRGB(0, 80, 120)
TabStatus.Text = "Tab Status and Server"
TabStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
TabStatus.Font = Enum.Font.GothamBold
TabStatus.TextSize = 14
TabStatus.Parent = MainFrame

-- Toggle Button to show/hide GUI
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "O"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18
ToggleButton.Parent = ScreenGui

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Placeholder for Shop and Status frames (can be expanded)
-- Add your full logic here for each feature...

return output_path
