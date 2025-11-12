local OrionLib = loadstring(game:HttpGet("https://obj.wearedevs.net/201403/scripts/orion%20ui%20library.lua"))()

local Window = OrionLib:MakeWindow({
    Name = "Script Hub", 
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionConfig"
})

-- Вкладка Info
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

InfoTab:AddLabel("Script Hub v1.0")
InfoTab:AddLabel("Add your own scripts in Settings")

-- Вкладка Scripts
local ScriptsTab = Window:MakeTab({
    Name = "Scripts", 
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false  
})

-- ESP
ScriptsTab:AddButton({
    Name = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
    end
})

-- System Broken
ScriptsTab:AddButton({
    Name = "System Broken", 
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end
})

-- Reworked | Limb
ScriptsTab:AddButton({
    Name = "Reworked | Limb",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VeaTouch/Backwood-Repository/refs/heads/main/Limb%20Extender.lua"))()
    end
})

-- Infinite Yield
ScriptsTab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

-- Remote Spy
ScriptsTab:AddButton({
    Name = "Remote Spy", 
    Callback = function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    end
})

OrionLib:Init()
