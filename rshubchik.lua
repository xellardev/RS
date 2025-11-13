local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/Discord%20Lib%20Source.lua")()

local win = DiscordLib:Window("rshub")

-- === ВКЛАДКА SCRIPTS ===
local scripts = win:Server("Scripts", "http://www.roblox.com/asset/?id=6031075938")

-- Combat
local combat = scripts:Channel("Combat")
combat:Button("espU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/main/esp.lua")()
end)

-- Movement
local movement = scripts:Channel("Movement")
movement:Button("cfsU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/cfrSpU.lua")()
end)
movement:Button("flyU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/flyU.lua")()
end)

-- Animations
local animations = scripts:Channel("Animations")
animations:Button("gazeU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/GazeU.lua")()
end)

-- Utility
local utility = scripts:Channel("Utility")
utility:Button("Infinity Yield", function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')()
end)
utility:Button("LbExU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/LbEx.lua")()
end)
utility:Button("spinU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/spinU.lua")()
end)
utility:Button("sbU", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/sbU.lua")()
end)
utility:Slider("Растяг экрана", 10, 100, 65, function(value)
    local stretchValue = value / 100
    getgenv().Resolution = {
        [".gg/scripters"] = stretchValue
    }
    local Camera = workspace.CurrentCamera
    if getgenv().gg_scripters == nil then
        game:GetService("RunService").RenderStepped:Connect(function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end)
    end
    getgenv().gg_scripters = "Aori0001"
end)

-- === ВКЛАДКА HUBS ===
local hubs = win:Server("Hubs", "http://www.roblox.com/asset/?id=6031302933")

local universal = hubs:Channel("Script hub")
universal:Button("XVC Hub (150+ Games)", function()
    loadstring(game:HttpGet"https://rawscripts.net/raw/Universal-Script-XVC-Hub-150-Games-keyless-47283")()
end)

local specific = hubs:Channel("Popular Games")
specific:Button("Evade - WhakazhiHubX | whakizashi-key", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/WhakazhiHubX.lua")()
end)
specific:Button("VD - Violence District", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/violence-district/script.lua")()
end)

local mm2 = hubs:Channel("Murder Mystery 2")
mm2:Button("XHub", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/XHub.lua")()
end)
mm2:Button("Vertex", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/Vertex.lua")()
end)
mm2:Button("ODH", function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/rsXez/RS/refs/heads/main/ODH.lua")()
end)

-- === ВКЛАДКА INFO ===
local info = win:Server("Info", "http://www.roblox.com/asset/?id=6031280882")
local about = info:Channel("About")
about:Label("RS Hub v1.0")
about:Label("Total Scripts: 14")
about:Label("Author: xd bro")
about:Button("Copy Job ID", function()
    setclipboard(game.JobId)
    DiscordLib:Notification("Скопировано!", "Job ID: "..game.JobId, "OK")
end)
