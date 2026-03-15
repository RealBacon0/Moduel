local MaterialModule = {}

local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local W1 = {
    ["Angel Wings"] = {
        MMon = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"},
        MPos = CFrame.new(-4698, 845, -1912),
    },
    ["Leather + Scrap Metal"] = {
        MMon = {"Brute", "Pirate"},
        MPos = CFrame.new(-1145, 15, 4350),
    },
    ["Magma Ore"] = {
        MMon = {"Military Soldier", "Military Spy", "Magma Admiral"},
        MPos = CFrame.new(-5815, 84, 8820),
    },
    ["Fish Tail"] = {
        MMon = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"},
        MPos = CFrame.new(61123, 19, 1569),
    },
}

local W2 = {
    ["Leather + Scrap Metal"] = {
        MMon = {"Marine Captain"},
        MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375),
    },
    ["Magma Ore"] = {
        MMon = {"Magma Ninja", "Lava Pirate"},
        MPos = CFrame.new(-5428, 78, -5959),
    },
    ["Ectoplasm"] = {
        MMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"},
        MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625),
    },
    ["Mystic Droplet"] = {
        MMon = {"Water Fighter"},
        MPos = CFrame.new(-3385, 239, -10542),
    },
    ["Radioactive Material"] = {
        MMon = {"Factory Staff"},
        MPos = CFrame.new(295, 73, -56),
    },
    ["Vampire Fang"] = {
        MMon = {"Vampire"},
        MPos = CFrame.new(-6033, 7, -1317),
    },
}

local W3 = {
    ["Scrap Metal"] = {
        MMon = {"Jungle Pirate", "Forest Pirate"},
        MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375),
    },
    ["Fish Tail"] = {
        MMon = {"Fishman Raider", "Fishman Captain"},
        MPos = CFrame.new(-10993, 332, -8940),
    },
    ["Conjured Cocoa"] = {
        MMon = {"Chocolate Bar Battler", "Cocoa Warrior"},
        MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625),
    },
    ["Dragon Scale"] = {
        MMon = {"Dragon Crew Archer", "Dragon Crew Warrior"},
        MPos = CFrame.new(6594, 383, 139),
    },
    ["Gunpowder"] = {
        MMon = {"Pistol Billionaire"},
        MPos = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625),
    },
    ["Mini Tusk"] = {
        MMon = {"Mythological Pirate"},
        MPos = CFrame.new(-13545, 470, -6917),
    },
    ["Demonic Wisp"] = {
        MMon = {"Demonic Soul"},
        MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125),
    },
}

function MaterialModule:GetData(material, world1, world2, world3)
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end

    local table
    if world1 then
        table = W1
    elseif world2 then
        table = W2
    elseif world3 then
        table = W3
    else
        return nil
    end

    local entry = table[material]
    if not entry then return nil end

    return {
        MMon = entry.MMon,
        MPos = entry.MPos,
        SP   = "Default",
    }
end

function MaterialModule:Apply(data)
    if not data then return end
    MMon = data.MMon
    MPos = data.MPos
    SP   = data.SP
end

function MaterialModule:Run(material, world1, world2, world3)
    local data = self:GetData(material, world1, world2, world3)
    self:Apply(data)
end

return MaterialModule
