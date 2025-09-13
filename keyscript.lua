-- Updated Key System GUI Script for Delta X Injector
-- This version loads the main script from keyscript.lua and checks key from keys.lua.

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Scale factor: 2/3 ≈ 0.6667
local scale = 2/3

-- GitHub raw URLs
local KEYSCRIPT_URL = "https://raw.githubusercontent.com/kimpler1/scriptkey/main/keyscript.lua"  # URL основного скрипта
local KEYS_URL = "https://raw.githubusercontent.com/kimpler1/scriptkey/main/keys.lua"  # URL файла с ключом

-- Load main script
local success, mainScript = pcall(function()
    return game:HttpGet(KEYSCRIPT_URL)
end)

if not success then
    warn("Failed to load keyscript.lua: " .. tostring(mainScript))
    return
end

-- Execute main script to create GUI
loadstring(mainScript)()

-- Access GUI elements (assuming they are created globally)
local keyInput = game.Players.LocalPlayer.PlayerGui.KeySystemGUI.MainFrame.KeyInput
local verifyButton = game.Players.LocalPlayer.PlayerGui.KeySystemGUI.MainFrame.VerifyButton
local statusLabel = game.Players.LocalPlayer.PlayerGui.KeySystemGUI.MainFrame.StatusLabel
local closeButton = game.Players.LocalPlayer.PlayerGui.KeySystemGUI.MainFrame.CloseButton
local screenGui = game.Players.LocalPlayer.PlayerGui.KeySystemGUI

-- Function to handle verify (override the original if exists)
verifyButton.MouseButton1Click:Connect(function()
    local inputKey = keyInput.Text
    if inputKey == "" then
        statusLabel.Text = "Enter a key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    -- Load the current key from keys.lua
    local success, currentKey = pcall(function()
        return loadstring(game:HttpGet(KEYS_URL))()
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

-- Close button function (override if exists)
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Enter key on Enter press (override if exists)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verifyButton.MouseButton1Click:Fire()
    end
end)
