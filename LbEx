local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Загружаем LimbExtender
getgenv().le = getgenv().le or loadstring(game:HttpGet('https://raw.githubusercontent.com/AAPVdev/scripts/refs/heads/main/LimbExtender.lua'))()
local LimbExtender = getgenv().le

local le = LimbExtender({
    LISTEN_FOR_INPUT = false,
    USE_HIGHLIGHT = false,
})

-- Загружаем Rayfield UI
getgenv().uilibray = getgenv().uilibray or loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Rayfield = getgenv().uilibray

-- Сообщения для загрузки
local Messages = {
    "happy halloween 🎃",
    "skeleton meme from 2021 💀",
    "spooky ass message 🕸🕷",
    "THE FLYING DUTCHMAN! ⚓",
    "👻 BOO! JOB APPLICATION 📄",
    "trick or treat smell my feet 🦶",
    "santa claus is lowkey a freak 😰",
    "spooky scary coolkids 😈",
    "itsa spooki month 🕺🕺",
    "kitkat razerblade edition 🍬",
    "update: fucking nothing 🎃😨",
    "follow axiogenesis on roblox 🦴👁",
}
local ChosenMessage = Messages[math.random(1, #Messages)]

-- Создаём окно
local Window = Rayfield:CreateWindow({
    Name = "Backwood Extender",
    Icon = 107904589783906, -- можешь заменить на свою ID иконку Roblox
    LoadingTitle = "Backwood Extender",
    LoadingSubtitle = ChosenMessage,
    Theme = "Default",
    DisableRayfieldPrompts = true,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ihexpltrs", -- 🔥 новая папка
        FileName = "Backwood Extender", -- 🔥 новый файл конфигурации
    },
})

-- Вкладки
local Settings = Window:CreateTab("Limbs", "scale-3d")
local Target = Window:CreateTab("Target", "crosshair")
local Themes = Window:CreateTab("Themes", "palette")

-- Безопасное создание UI элементов
local function safeCreate(tab, methodName, opts)
    local method = tab[methodName]
    if type(method) == "function" then
        return method(tab, opts)
    else
        warn("Method " .. tostring(methodName) .. " not found on tab")
    end
end

local function createOption(params)
    local methodName = "Create" .. params.method
    local opts = {
        Name = params.name,
        SectionParent = params.section,
        CurrentValue = params.value,
        Flag = params.flag,
        Options = params.options,
        CurrentOption = params.currentOption,
        MultipleOptions = params.multipleOptions,
        Range = params.range,
        Color = params.color,
        Increment = params.increment,
        Callback = function(Value)
            if params.multipleOptions == false and type(Value) == "table" then
                Value = Value[1]
            end
            le:Set(params.flag, Value)
        end,
    }
    return safeCreate(params.tab, methodName, opts)
end

-- Тоггл активации
local ModifyLimbs = Settings:CreateToggle({
    Name = "Modify Limbs",
    SectionParent = nil,
    CurrentValue = false,
    Flag = "ModifyLimbs",
    Callback = function(Value)
        le:Toggle(Value)
    end,
})
Settings:CreateDivider()

-- Слайдеры и тогглы
local toggleSettings = {
    { method = "Toggle", name = "Team Check", flag = "TEAM_CHECK", tab = Settings, value = le:Get("TEAM_CHECK") },
    { method = "Toggle", name = "ForceField Check", flag = "FORCEFIELD_CHECK", tab = Settings, value = le:Get("FORCEFIELD_CHECK") },
    { method = "Toggle", name = "Limb Collisions", flag = "LIMB_CAN_COLLIDE", tab = Settings, value = le:Get("LIMB_CAN_COLLIDE"), createDivider = true },
    { method = "Slider", name = "Limb Transparency", flag = "LIMB_TRANSPARENCY", tab = Settings, range = {0,1}, increment = 0.1, value = le:Get("LIMB_TRANSPARENCY") },
    { method = "Slider", name = "Limb Size", flag = "LIMB_SIZE", tab = Settings, range = {5,50}, increment = 0.5, value = le:Get("LIMB_SIZE"), createDivider = true },
}

for _, setting in pairs(toggleSettings) do
    createOption(setting)
    if setting.createDivider then
        setting.tab:CreateDivider()
    end
end

-- Клавиша активации
Settings:CreateKeybind({
    Name = "Toggle Keybind",
    CurrentKeybind = le:Get("TOGGLE"),
    HoldToInteract = false,
    SectionParent = nil,
    Flag = "ToggleKeybind",
    Callback = function()
        ModifyLimbs:Set(not le._running)
    end,
})

-- Список частей тела
local TargetLimb = Target:CreateDropdown({
    Name = "Target Limb",
    Options = {},
    CurrentOption = { le:Get("TARGET_LIMB") },
    MultipleOptions = false,
    Flag = "TARGET_LIMB",
    Callback = function(Options)
        le:Set("TARGET_LIMB", Options[1])
    end,
})

-- Темы
Themes:CreateDropdown({
    Name = "Current Theme",
    Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
    CurrentOption = {"Default"},
    MultipleOptions = false,
    Flag = "CurrentTheme",
    Callback = function(Options)
        Window.ModifyTheme(Options[1])
    end,
})

-- Обновление частей тела
local limbs = {}
local function addLimbIfNew(name)
    if not name then return end
    if not table.find(limbs, name) then
        table.insert(limbs, name)
        table.sort(limbs)
        TargetLimb:Refresh(limbs)
    end
end

local function characterAdded(Character)
    if not Character then return end
    local function onChildChanged(child)
        if not child or not child:IsA("BasePart") then return end
        addLimbIfNew(child.Name)
    end

    Character.ChildAdded:Connect(onChildChanged)
    for _, child in ipairs(Character:GetChildren()) do
        onChildChanged(child)
    end
end

LocalPlayer.CharacterAdded:Connect(characterAdded)
if LocalPlayer.Character then
    characterAdded(LocalPlayer.Character)
end

-- Загрузка конфига
Rayfield:LoadConfiguration()
