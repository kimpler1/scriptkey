-- Updated Key System GUI Script for Delta X Injector
-- This version checks the key by loading current key from GitHub raw file.
-- If the key is valid, the GUI closes and shows "Ваш скрипт активирован".

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Scale factor: 2/3 ≈ 0.6667
local scale = 2/3

-- GitHub raw URL for current_key.lua
local GITHUB_KEY_URL = "https://raw.githubusercontent.com/kimpler1/scriptkey/main/current_key.lua"  # Ваш raw URL

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400 * scale, 0, 300 * scale)
mainFrame.Position = UDim2.new(0.5, -200 * scale, 0.5, -150 * scale)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Add corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10 * scale)
corner.Parent = mainFrame

-- Title Label
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

-- Key Input Box
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

-- Verify Button
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

-- Status Label
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

-- Close Button
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

-- Function to handle verify
verifyButton.MouseButton1Click:Connect(function()
    local inputKey = keyInput.Text
    if inputKey == "" then
        statusLabel.Text = "Enter a key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    -- Load the current key from GitHub raw
    local success, currentKey = pcall(function()
        return loadstring(game:HttpGet(GITHUB_KEY_URL))()
    end)
    
    if success then
        if inputKey == currentKey then
            statusLabel.Text = "Ваш скрипт активирован"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            -- Here you can add code to load your main script after verification
            -- For example: loadstring(game:HttpGet("your_script_url"))()
            
            -- Hide the GUI after success
            wait(2)
            screenGui:Destroy()
        else
            statusLabel.Text = "Invalid key!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            keyInput.Text = ""
        end
    else
        statusLabel.Text = "Error loading key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- Close button function
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Enter key on Enter press
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verifyButton.MouseButton1Click:Fire()
    end
end)

-- Fade in animation
mainFrame.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
keyInput.BackgroundTransparency = 1
keyInput.TextTransparency = 1
verifyButton.BackgroundTransparency = 1
verifyButton.TextTransparency = 1
statusLabel.TextTransparency = 1
closeButton.BackgroundTransparency = 1
closeButton.TextTransparency = 1

local fadeIn = TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0})
local fadeInText = TweenService:Create(titleLabel, TweenInfo.new(0.5), {TextTransparency = 0})
local fadeInInput = TweenService:Create(keyInput, TweenInfo.new(0.5, Enum.EasingStyle.Back), {BackgroundTransparency = 0, TextTransparency = 0})
local fadeInButton = TweenService:Create(verifyButton, TweenInfo.new(0.5), {BackgroundTransparency = 0, TextTransparency = 0})
local fadeInStatus = TweenService:Create(statusLabel, TweenInfo.new(0.5), {TextTransparency = 0})
local fadeInClose = TweenService:Create(closeButton, TweenInfo.new(0.5), {BackgroundTransparency = 0, TextTransparency = 0})

fadeIn:Play()
fadeInText:Play()
fadeInInput:Play()
fadeInButton:Play()
fadeInStatus:Play()
fadeInClose:Play()

-- Focus on input
keyInput:CaptureFocus()
