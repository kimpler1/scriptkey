-- Key System GUI Script for Delta X Injector
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local scale = 2/3

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400 * scale, 0, 300 * scale)
mainFrame.Position = UDim2.new(0.5, -200 * scale, 0.5, -150 * scale)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10 * scale)
corner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 50 * scale)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Key System"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

local keyInput = Instance.new("TextBox")
keyInput.Name = "KeyInput"
keyInput.Size = UDim2.new(0.8, 0, 0, 40 * scale)
keyInput.Position = UDim2.new(0.1, 0, 0, 70 * scale)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "Enter your key here..."
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextScaled = true
keyInput.Font = Enum.Font.Gotham
keyInput.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 5 * scale)
inputCorner.Parent = keyInput

local verifyButton = Instance.new("TextButton")
verifyButton.Name = "VerifyButton"
verifyButton.Size = UDim2.new(0.8, 0, 0, 40 * scale)
verifyButton.Position = UDim2.new(0.1, 0, 0, 130 * scale)
verifyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
verifyButton.BorderSizePixel = 0
verifyButton.Text = "Verify Key"
verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyButton.TextScaled = true
verifyButton.Font = Enum.Font.GothamBold
verifyButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 5 * scale)
buttonCorner.Parent = verifyButton

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0.8, 0, 0, 30 * scale)
statusLabel.Position = UDim2.new(0.1, 0, 0, 180 * scale)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Enter key and verify."
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30 * scale, 0, 30 * scale)
closeButton.Position = UDim2.new(1, -35 * scale, 0, 5 * scale)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 15 * scale)
closeCorner.Parent = closeButton
