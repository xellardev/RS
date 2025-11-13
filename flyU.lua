-- Xeno Flight | апдейт с даблкликом F1/F2

local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local plr = game.Players.LocalPlayer

local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

plr.CharacterAdded:Connect(function(c)
    char = c
    hrp = char:WaitForChild("HumanoidRootPart")
end)

local flying = false
local speed = 1
local speedChangeTimer = 0

-- Для двойного нажатия
local lastPress = {F1 = 0, F2 = 0}
local doublePressDelay = 0.3 -- время для двойного клика

-- GUI (только текст снизу)
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.ResetOnSpawn = false

local speedText = Instance.new("TextLabel", gui)
speedText.Size = UDim2.new(0, 300, 0, 50)
speedText.Position = UDim2.new(0.5, -150, 1, 50) -- снизу, за экраном
speedText.BackgroundTransparency = 1
speedText.TextColor3 = Color3.fromRGB(255, 255, 255)
speedText.TextStrokeTransparency = 0
speedText.TextScaled = true
speedText.Font = Enum.Font.GothamBold
speedText.Visible = false
speedText.Text = "Скорость: " .. speed

local function showSpeedLabel()
    speedText.Visible = true
    speedText.Position = UDim2.new(0.5, -150, 1, 50)
    speedText:TweenPosition(UDim2.new(0.5, -150, 1, -60), "Out", "Sine", 0.3, true)
    speedChangeTimer = tick() + 3
end

local function hideSpeedLabel()
    speedText:TweenPosition(UDim2.new(0.5, -150, 1, 50), "In", "Sine", 0.3, true)
    task.delay(0.3, function()
        speedText.Visible = false
    end)
end

local function updateSpeedLabel()
    speedText.Text = "Скорость: " .. math.floor(speed * 100) / 100
    showSpeedLabel()
end

local function toggleFly()
    flying = not flying
    hrp.Anchored = flying
end

local function changeSpeed(delta)
    speed = math.clamp(speed + delta, 0.1, 50)
    updateSpeedLabel()
end

-- Управление
uis.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Q then
        toggleFly()
    elseif input.KeyCode == Enum.KeyCode.F1 then
        if tick() - lastPress.F1 <= doublePressDelay then
            changeSpeed(1.0) -- двойное нажатие
        else
            changeSpeed(0.1) -- обычное
        end
        lastPress.F1 = tick()
    elseif input.KeyCode == Enum.KeyCode.F2 then
        if tick() - lastPress.F2 <= doublePressDelay then
            changeSpeed(-1.0)
        else
            changeSpeed(-0.1)
        end
        lastPress.F2 = tick()
    end
end)

-- Основной цикл
rs.RenderStepped:Connect(function()
    -- Скрытие текста
    if tick() > speedChangeTimer and speedText.Visible then
        hideSpeedLabel()
    end

    -- Полёт
    if flying then
        hrp.Anchored = true
        local camCF = workspace.CurrentCamera.CFrame
        local moveDir = Vector3.new()

        if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0) end

        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * speed
        end

        local camLookHor = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
        local lookPos = hrp.Position + camLookHor
        hrp.CFrame = CFrame.new(hrp.Position, lookPos) + Vector3.new(0, moveDir.Y, 0)

        hrp.CFrame = hrp.CFrame + moveDir
    else
        hrp.Anchored = false
    end
end)
