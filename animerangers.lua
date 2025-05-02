--// Anime Rangers X - Main GUI Framework
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

--// ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AnimeRangersX_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

--// Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

--// UI Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

--// Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Anime Rangers X - Main"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = MainFrame

--// Container Layout
local LeftFrame = Instance.new("Frame")
LeftFrame.Size = UDim2.new(0.5, -5, 1, -50)
LeftFrame.Position = UDim2.new(0, 5, 0, 45)
LeftFrame.BackgroundTransparency = 1
LeftFrame.Parent = MainFrame

local RightFrame = Instance.new("Frame")
RightFrame.Size = UDim2.new(0.5, -5, 1, -50)
RightFrame.Position = UDim2.new(0.5, 0, 0, 45)
RightFrame.BackgroundTransparency = 1
RightFrame.Parent = MainFrame

--// Toggle Button Template
local function createToggle(parent, positionY, label, state)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Text = label .. " [" .. (state and "ON" or "OFF") .. "]"
    button.Parent = parent
    local currentState = state
    button.MouseButton1Click:Connect(function()
        currentState = not currentState
        button.Text = label .. " [" .. (currentState and "ON" or "OFF") .. "]"
    end)
    return button, function() return currentState end
end

--// Dropdown Template
local function createDropdown(parent, positionY, title, options)
    local index = 1
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, positionY)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 14
    button.Text = title .. ": " .. options[index]
    button.Parent = parent
    button.MouseButton1Click:Connect(function()
        index = index % #options + 1
        button.Text = title .. ": " .. options[index]
    end)
    return button, function() return options[index] end
end

-- UI Elements
createToggle(LeftFrame, 0, "Auto Join Map", false)

local StartTime = Instance.new("TextLabel")
StartTime.Size = UDim2.new(1, -10, 0, 30)
StartTime.Position = UDim2.new(0, 5, 0, 35)
StartTime.BackgroundTransparency = 1
StartTime.Text = "Start Time: 2"
StartTime.TextColor3 = Color3.fromRGB(200, 200, 255)
StartTime.Font = Enum.Font.Gotham
StartTime.TextSize = 14
StartTime.Parent = LeftFrame

createToggle(LeftFrame, 70, "Only Friends", false)

createDropdown(LeftFrame, 105, "Select Mode", {"Story", "Ranger", "Misc"})
createDropdown(LeftFrame, 140, "Select Map", {"Voocha Village", "Green Planet", "Demon Forest", "Leaf Village", "Z City"})
createDropdown(LeftFrame, 175, "Select Act", {"1","2","3","4","5","6","7","8","9","10"})
createDropdown(LeftFrame, 210, "Select Difficulty", {"Normal", "Hard", "Nightmare"})

createDropdown(LeftFrame, 245, "Select Rangers", {
    "OPM_Chapter1", "OPM_Chapter2", "OPM_Chapter3",
    "Namek_Chapter1", "Namek_Chapter2", "Namek_Chapter3",
    "DemonSlayer_Chapter1", "DemonSlayer_Chapter2", "DemonSlayer_Chapter3",
    "Naruto_Chapter1", "Naruto_Chapter2", "Naruto_Chapter3",
    "OnePiece_Chapter1", "OnePiece_Chapter2", "OnePiece_Chapter3"
})

createToggle(LeftFrame, 280, "Lobby for Ranger CD", false)
createToggle(LeftFrame, 315, "Lobby for Hourly Egg CD", false)
createToggle(LeftFrame, 350, "Lobby for New Chall CD", false)

createToggle(RightFrame, 0, "Auto Ranger", false)
createToggle(RightFrame, 35, "Auto Join Challenge", false)

createDropdown(RightFrame, 70, "Select World Challenge", {
    "Voocha Village", "Cursed Town", "Demon Forest",
    "Green Planet", "Z City", "Leaf Village", "Easter Egg"
})

createDropdown(RightFrame, 105, "Select Rewards", {
    "Stats Key", "Perfect Stats Key", "Trait Reroll",
    "Ranger Crystal", "Cursed Finger", "Dr. Mega Punk"
})

local TeleportButton = Instance.new("TextButton")
TeleportButton.Size = UDim2.new(1, -10, 0, 30)
TeleportButton.Position = UDim2.new(0, 5, 0, 140)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.Gotham
TeleportButton.TextSize = 14
TeleportButton.Text = "Teleport to Lobby"
TeleportButton.Parent = RightFrame
TeleportButton.MouseButton1Click:Connect(function()
    print("Teleporting to Lobby...")
end)

return MainFrame
