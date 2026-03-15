local ESPModule = {}

local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local plr = Players.LocalPlayer

local Number = math.random(1, 1000000)

local function round(n)
    return math.floor(tonumber(n) + 0.5)
end

local function isnil(thing)
    return (thing == nil)
end

local function getHeadPos()
    local char = plr.Character
    if char and char:FindFirstChild("Head") then
        return char.Head.Position
    end
    return Vector3.new(0, 0, 0)
end

local function makeBillboard(parent, name, offset)
    local bill = Instance.new("BillboardGui", parent)
    bill.Name = name
    bill.ExtentsOffset = Vector3.new(0, offset or 1, 0)
    bill.Size = UDim2.new(1, 200, 1, 30)
    bill.Adornee = parent
    bill.AlwaysOnTop = true
    local label = Instance.new("TextLabel", bill)
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 14
    label.TextWrapped = true
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0.5
    return bill, label
end

function ESPModule.UpdateBerriesESP()
    local BerryBushes = CollectionService:GetTagged("BerryBush")
    for _, Bush in pairs(BerryBushes) do
        pcall(function()
            for AttributeName, Berry in pairs(Bush:GetAttributes()) do
                if Berry then
                    if not Bush.Parent:FindFirstChild("BerryESP") then
                        local bill, label = makeBillboard(Bush.Parent, "BerryESP", 2)
                        label.TextColor3 = Color3.fromRGB(255, 255, 0)
                        label.Text = Berry
                    end
                    if Bush.Parent:FindFirstChild("BerryESP") then
                        local pos = getHeadPos()
                        local mag = (Bush.Parent:GetPivot().Position - pos).Magnitude
                        Bush.Parent.BerryESP.TextLabel.Text = Berry .. "\n" .. math.floor(mag) .. "m"
                    end
                else
                    if Bush.Parent:FindFirstChild("NameEsp") then
                        Bush.Parent:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end)
    end
end

function ESPModule.UpdateIslandESP()
    for _, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild("NameEsp") then
                        local bill, label = makeBillboard(v, "NameEsp", 1)
                        label.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        local dist = round((getHeadPos() - v.Position).Magnitude / 3)
                        v["NameEsp"].TextLabel.Text = v.Name .. "   \n" .. dist .. " Distance"
                    end
                end
            else
                if v:FindFirstChild("NameEsp") then
                    v:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

function ESPModule.UpdateDevilChams()
    for _, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v.Name, "Fruit") then
                    local tag = "NameEsp" .. Number
                    if not v.Handle:FindFirstChild(tag) then
                        local bill, label = makeBillboard(v.Handle, tag, 1)
                        label.TextColor3 = Color3.fromRGB(255, 255, 255)
                        label.Text = v.Name .. " \n" .. round((getHeadPos() - v.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        v.Handle[tag].TextLabel.Text = v.Name .. "   \n" .. round((getHeadPos() - v.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            else
                local tag = "NameEsp" .. Number
                if v.Handle and v.Handle:FindFirstChild(tag) then
                    v.Handle:FindFirstChild(tag):Destroy()
                end
            end
        end)
    end
end

function ESPModule.UpdatePlayerChams()
    for _, v in pairs(Players:GetPlayers()) do
        pcall(function()
            if not isnil(v.Character) then
                local tag = "NameEsp" .. Number
                if ESPPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild(tag) then
                        local bill, label = makeBillboard(v.Character.Head, tag, 1)
                        label.Text = v.Name .. " \n" .. round((getHeadPos() - v.Character.Head.Position).Magnitude / 3) .. " Distance"
                        if v.Team == plr.Team then
                            label.TextColor3 = Color3.fromRGB(0, 255, 0)
                        else
                            label.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    else
                        local hp = round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth)
                        local dist = round((getHeadPos() - v.Character.Head.Position).Magnitude / 3)
                        v.Character.Head[tag].TextLabel.Text = v.Name .. " | " .. dist .. " Distance\nHealth : " .. hp .. "%"
                    end
                else
                    if v.Character.Head:FindFirstChild(tag) then
                        v.Character.Head:FindFirstChild(tag):Destroy()
                    end
                end
            end
        end)
    end
end

return ESPModule
