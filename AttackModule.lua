local AttackModule = {}

local Players = game:GetService("Players")
local VIM = game:GetService("VirtualInputManager")
local plr = Players.LocalPlayer

local function weaponSc(weapon)
    for _, v in pairs(plr.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == weapon then
            local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:EquipTool(v) end
            break
        end
    end
end

local function sendKey(key)
    VIM:SendKeyEvent(true, key, false, game)
    VIM:SendKeyEvent(false, key, false, game)
end

function AttackModule.Useskills(weapon, skill)
    if weapon == "Melee" then
        weaponSc("Melee")
        if skill == "Z" then sendKey("Z")
        elseif skill == "X" then sendKey("X")
        elseif skill == "C" then sendKey("C") end
    elseif weapon == "Sword" then
        weaponSc("Sword")
        if skill == "Z" then sendKey("Z")
        elseif skill == "X" then sendKey("X") end
    elseif weapon == "Blox Fruit" then
        weaponSc("Blox Fruit")
        if skill == "Z" then sendKey("Z")
        elseif skill == "X" then sendKey("X")
        elseif skill == "C" then sendKey("C")
        elseif skill == "V" then sendKey("V") end
    elseif weapon == "Gun" then
        weaponSc("Gun")
        if skill == "Z" then sendKey("Z")
        elseif skill == "X" then sendKey("X") end
    end
    if weapon == "nil" and skill == "Y" then sendKey("Y") end
end

function AttackModule.BringEnemy(monsterNames)
    if not getgenv().BringMob then return end
    if not PosMon then return end
    pcall(function()
        if sethiddenproperty then
            pcall(sethiddenproperty, plr, "SimulationRadius", math.huge)
        end
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            local shouldBring = false
            if type(monsterNames) == "table" then
                shouldBring = table.find(monsterNames, v.Name)
            elseif type(monsterNames) == "string" then
                shouldBring = (v.Name == monsterNames)
            elseif Mon then
                shouldBring = (v.Name == Mon)
            end
            if shouldBring then
                local hrp = v:FindFirstChild("HumanoidRootPart")
                local hum = v:FindFirstChild("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local distance = (hrp.Position - PosMon).Magnitude
                    if distance <= (tonumber(getgenv().BringMode) or 250) then
                        hrp.CFrame = CFrame.new(PosMon)
                        hrp.CanCollide = false
                        hrp.Size = Vector3.new(60, 60, 60)
                        hrp.Transparency = 1
                        if v:FindFirstChild("Head") then
                            v.Head.CanCollide = false
                        end
                        if hum:FindFirstChild("Animator") then
                            hum.Animator:Destroy()
                        end
                        hum:ChangeState(14)
                    end
                end
            end
        end
    end)
end

local Attack = {}
Attack.__index = Attack

Attack.Alive = function(model)
    if not model then return end
    local Humanoid = model:FindFirstChild("Humanoid")
    return Humanoid and Humanoid.Health > 0
end

Attack.Kill = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        local char = plr.Character
        local equipped = char and char:FindFirstChildOfClass("Tool")
        if equipped then
            local tip = equipped.ToolTip
            if tip == "Blox Fruit" then
                topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(0, math.rad(90), 0))
            else
                topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0) * CFrame.Angles(0, math.rad(180), 0))
            end
        end
        if RandomCFrame then
            task.wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            task.wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            task.wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.5); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end

Attack.Mas = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        AttackModule.BringEnemy()
        if model.Humanoid.Health <= HealthM then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
            AttackModule.Useskills("Blox Fruit", "Z")
            AttackModule.Useskills("Blox Fruit", "X")
            AttackModule.Useskills("Blox Fruit", "C")
        else
            weaponSc("Melee")
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end

Attack.Masgun = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        AttackModule.BringEnemy()
        if model.Humanoid.Health <= HealthM then
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
            AttackModule.Useskills("Gun", "Z")
            AttackModule.Useskills("Gun", "X")
        else
            weaponSc("Melee")
            topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end

Attack.Sword = function(model, Succes)
    if model and Succes then
        if not model:GetAttribute("Locked") then
            model:SetAttribute("Locked", model.HumanoidRootPart.CFrame)
        end
        PosMon = model:GetAttribute("Locked").Position
        AttackModule.BringEnemy()
        weaponSc("Sword")
        topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        if RandomCFrame then
            task.wait(0.1); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1); topos(model.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0))
            task.wait(0.1); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
            task.wait(0.1); topos(model.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25))
            task.wait(0.1); topos(model.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0))
        end
    end
end

AttackModule.Attack = Attack

function AttackModule.SetupNamecallHook()
    local gg  = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if (getgenv().AutoFarmMasteryFruit) or (getgenv().AutoFarmMasteryGun) or
                       (getgenv().AutoDefendVolcano) or (getgenv().AutoAttackLeviathan) or
                       (getgenv().AimMethod and (ABmethod == "Select Player" or ABmethod == "Target nearest Player")) and MousePos then
                        args[2] = MousePos
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if getgenv().BringMob and PosMon and Mon then
                AttackModule.BringEnemy()
            end
        end)
    end
end)

return AttackModule
