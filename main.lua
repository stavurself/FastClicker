-- [



-- $$$$$$$$\                   $$\      $$$$$$\  $$\ $$\           $$\       
-- $$  _____|                  $$ |    $$  __$$\ $$ |\__|          $$ |      
-- $$ |   $$$$$$\   $$$$$$$\ $$$$$$\   $$ /  \__|$$ |$$\  $$$$$$$\ $$ |  $$\ 
-- $$$$$\ \____$$\ $$  _____|\_$$  _|  $$ |      $$ |$$ |$$  _____|$$ | $$  |
-- $$  __|$$$$$$$ |\$$$$$$\    $$ |    $$ |      $$ |$$ |$$ /      $$$$$$  / 
-- $$ |  $$  __$$ | \____$$\   $$ |$$\ $$ |  $$\ $$ |$$ |$$ |      $$  _$$<  
-- $$ |  \$$$$$$$ |$$$$$$$  |  \$$$$  |\$$$$$$  |$$ |$$ |\$$$$$$$\ $$ | \$$\ 
-- \__|   \_______|\_______/    \____/  \______/ \__|\__| \_______|\__|  \__|
                                                                          
--                         This was made by stav                 
                            
-- ]

-- LOADING --
local selectedTheme = "Sentinel"
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FastClick (By stav)", selectedTheme)

-- TABS --
local AutoClicker = Window:NewTab("AutoClicker")
local Settings = Window:NewTab("Settings")

-- SECTIONS --
local Basic = AutoClicker:NewSection("Basic")
local UI = Settings:NewSection("UI")

-- VARIABLES --
local autoClicking = false
local clickSpeed = 0.1
local toggleKey = Enum.KeyCode.F
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- AUTOCLICK FUNCTION --
task.spawn(function()
    while true do
        if autoClicking then
            local mouseLocation = UserInputService:GetMouseLocation()
            VirtualInputManager:SendMouseButtonEvent(mouseLocation.X, mouseLocation.Y, 0, true, game, 0)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(mouseLocation.X, mouseLocation.Y, 0, false, game, 0)
            task.wait(clickSpeed)
        else
            task.wait(0.1)
        end
    end
end)

-- AUTOCLICKER SECTION --
Basic:NewToggle("Enable AutoClicker", "Enables the autoclicker", function(state)
    autoClicking = state
    print("AutoClicker: " .. (state and "On" or "Off"))
end)

Basic:NewTextBox("AutoClicker Speed (s)", "Sets the speed of autoclicker", function(txt)
    local speed = tonumber(txt)
    if speed and speed > 0 then
        clickSpeed = speed
        print("Click speed set to " .. speed .. " seconds")
    else
        warn("Invalid speed input")
    end
end)

-- SETTINGS SECTION --
UI:NewKeybind("Toggle UI", "Sets the keybind to toggle UI", Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)
