local QuestModule = {}

local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local function requestEntrance(vec)
    RS.Remotes.CommF_:InvokeServer("requestEntrance", vec)
end

local function travelSubmerged()
    if typeof(topos) == "function" then
        topos(CFrame.new(-16269.7041, 25.2288494, 1373.65955, 0.997390985, 1.47309942e-09, -0.0721890926, -4.00651912e-09, 0.99999994, -2.51183763e-09, 0.0721890852, 5.75363091e-10, 0.997390926))
    end
    task.wait(2)
    RS.Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
end

local function needEntrance(cf, vec)
    if not getgenv().AutoFarm then return end
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if hrp and (cf.Position - hrp.Position).Magnitude > 10000 then
        requestEntrance(vec)
    end
end

local function needSubmerged(cf)
    if not getgenv().AutoFarm then return end
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if hrp and (cf.Position - hrp.Position).Magnitude > 10000 then
        travelSubmerged()
    end
end

function QuestModule:GetData(level, world1, world2, world3)
    local data = nil

    if world1 then
        if level >= 1 and level <= 9 then
            data = {
                Mon = "Bandit", LevelQuest = 1, NameQuest = "BanditQuest1", NameMon = "Bandit",
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544),
                CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125),
            }
        elseif level >= 10 and level <= 14 then
            data = {
                Mon = "Monkey", LevelQuest = 1, NameQuest = "JungleQuest", NameMon = "Monkey",
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209),
            }
        elseif level >= 15 and level <= 29 then
            data = {
                Mon = "Gorilla", LevelQuest = 2, NameQuest = "JungleQuest", NameMon = "Gorilla",
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875),
            }
        elseif level >= 30 and level <= 39 then
            data = {
                Mon = "Pirate", LevelQuest = 1, NameQuest = "BuggyQuest1", NameMon = "Pirate",
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125),
            }
        elseif level >= 40 and level <= 59 then
            data = {
                Mon = "Brute", LevelQuest = 2, NameQuest = "BuggyQuest1", NameMon = "Brute",
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875),
            }
        elseif level >= 60 and level <= 74 then
            data = {
                Mon = "Desert Bandit", LevelQuest = 1, NameQuest = "DesertQuest", NameMon = "Desert Bandit",
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693),
                CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375),
            }
        elseif level >= 75 and level <= 89 then
            data = {
                Mon = "Desert Officer", LevelQuest = 2, NameQuest = "DesertQuest", NameMon = "Desert Officer",
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693),
                CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875),
            }
        elseif level >= 90 and level <= 99 then
            data = {
                Mon = "Snow Bandit", LevelQuest = 1, NameQuest = "SnowQuest", NameMon = "Snow Bandit",
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685),
                CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125),
            }
        elseif level >= 100 and level <= 119 then
            data = {
                Mon = "Snowman", LevelQuest = 2, NameQuest = "SnowQuest", NameMon = "Snowman",
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685),
                CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625),
            }
        elseif level >= 120 and level <= 149 then
            data = {
                Mon = "Chief Petty Officer", LevelQuest = 1, NameQuest = "MarineQuest2", NameMon = "Chief Petty Officer",
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625),
            }
        elseif level >= 150 and level <= 174 then
            data = {
                Mon = "Sky Bandit", LevelQuest = 1, NameQuest = "SkyQuest", NameMon = "Sky Bandit",
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625),
            }
        elseif level >= 175 and level <= 189 then
            data = {
                Mon = "Dark Master", LevelQuest = 2, NameQuest = "SkyQuest", NameMon = "Dark Master",
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625),
            }
        elseif level >= 190 and level <= 209 then
            data = {
                Mon = "Prisoner", LevelQuest = 1, NameQuest = "PrisonerQuest", NameMon = "Prisoner",
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712),
                CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781),
            }
        elseif level >= 210 and level <= 249 then
            data = {
                Mon = "Dangerous Prisoner", LevelQuest = 2, NameQuest = "PrisonerQuest", NameMon = "Dangerous Prisoner",
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712),
                CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375),
            }
        elseif level >= 250 and level <= 274 then
            data = {
                Mon = "Toga Warrior", LevelQuest = 1, NameQuest = "ColosseumQuest", NameMon = "Toga Warrior",
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298),
                CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625),
            }
        elseif level >= 275 and level <= 299 then
            data = {
                Mon = "Gladiator", LevelQuest = 2, NameQuest = "ColosseumQuest", NameMon = "Gladiator",
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298),
                CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625),
            }
        elseif level >= 300 and level <= 324 then
            data = {
                Mon = "Military Soldier", LevelQuest = 1, NameQuest = "MagmaQuest", NameMon = "Military Soldier",
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469),
                CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875),
            }
        elseif level >= 325 and level <= 374 then
            data = {
                Mon = "Military Spy", LevelQuest = 2, NameQuest = "MagmaQuest", NameMon = "Military Spy",
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469),
                CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375),
            }
        elseif level >= 375 and level <= 399 then
            local cf = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            data = {
                Mon = "Fishman Warrior", LevelQuest = 1, NameQuest = "FishmanQuest", NameMon = "Fishman Warrior",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625),
                OnSet = function() needEntrance(cf, Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)) end,
            }
        elseif level >= 400 and level <= 449 then
            local cf = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            data = {
                Mon = "Fishman Commando", LevelQuest = 2, NameQuest = "FishmanQuest", NameMon = "Fishman Commando",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875),
                OnSet = function() needEntrance(cf, Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)) end,
            }
        elseif level >= 450 and level <= 474 then
            local cf = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
            data = {
                Mon = "God's Guard", LevelQuest = 1, NameQuest = "SkyExp1Quest", NameMon = "God's Guard",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375),
                OnSet = function() needEntrance(cf, Vector3.new(-4607.82275, 872.54248, -1667.55688)) end,
            }
        elseif level >= 475 and level <= 524 then
            local cf = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
            data = {
                Mon = "Shanda", LevelQuest = 2, NameQuest = "SkyExp1Quest", NameMon = "Shanda",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531),
                OnSet = function() needEntrance(cf, Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)) end,
            }
        elseif level >= 525 and level <= 549 then
            data = {
                Mon = "Royal Squad", LevelQuest = 1, NameQuest = "SkyExp2Quest", NameMon = "Royal Squad",
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875),
            }
        elseif level >= 550 and level <= 624 then
            data = {
                Mon = "Royal Soldier", LevelQuest = 2, NameQuest = "SkyExp2Quest", NameMon = "Royal Soldier",
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625),
            }
        elseif level >= 625 and level <= 649 then
            data = {
                Mon = "Galley Pirate", LevelQuest = 1, NameQuest = "FountainQuest", NameMon = "Galley Pirate",
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381),
                CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875),
            }
        elseif level >= 650 then
            data = {
                Mon = "Galley Captain", LevelQuest = 2, NameQuest = "FountainQuest", NameMon = "Galley Captain",
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381),
                CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375),
            }
        end

    elseif world2 then
        if level >= 700 and level <= 724 then
            data = {
                Mon = "Raider", LevelQuest = 1, NameQuest = "Area1Quest", NameMon = "Raider",
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985),
                CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125),
            }
        elseif level >= 725 and level <= 774 then
            data = {
                Mon = "Mercenary", LevelQuest = 2, NameQuest = "Area1Quest", NameMon = "Mercenary",
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985),
                CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625),
            }
        elseif level >= 775 and level <= 799 then
            data = {
                Mon = "Swan Pirate", LevelQuest = 1, NameQuest = "Area2Quest", NameMon = "Swan Pirate",
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906),
                CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625),
            }
        elseif level >= 800 and level <= 874 then
            data = {
                Mon = "Factory Staff", LevelQuest = 2, NameQuest = "Area2Quest", NameMon = "Factory Staff",
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369),
                CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875),
            }
        elseif level >= 875 and level <= 899 then
            data = {
                Mon = "Marine Lieutenant", LevelQuest = 1, NameQuest = "MarineQuest3", NameMon = "Marine Lieutenant",
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125),
            }
        elseif level >= 900 and level <= 949 then
            data = {
                Mon = "Marine Captain", LevelQuest = 2, NameQuest = "MarineQuest3", NameMon = "Marine Captain",
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268),
                CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625),
            }
        elseif level >= 950 and level <= 974 then
            data = {
                Mon = "Zombie", LevelQuest = 1, NameQuest = "ZombieQuest", NameMon = "Zombie",
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146),
                CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875),
            }
        elseif level >= 975 and level <= 999 then
            data = {
                Mon = "Vampire", LevelQuest = 2, NameQuest = "ZombieQuest", NameMon = "Vampire",
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146),
                CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625),
            }
        elseif level >= 1000 and level <= 1049 then
            data = {
                Mon = "Snow Trooper", LevelQuest = 1, NameQuest = "SnowMountainQuest", NameMon = "Snow Trooper",
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106),
                CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875),
            }
        elseif level >= 1050 and level <= 1099 then
            data = {
                Mon = "Winter Warrior", LevelQuest = 2, NameQuest = "SnowMountainQuest", NameMon = "Winter Warrior",
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106),
                CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625),
            }
        elseif level >= 1100 and level <= 1124 then
            data = {
                Mon = "Lab Subordinate", LevelQuest = 1, NameQuest = "IceSideQuest", NameMon = "Lab Subordinate",
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578),
                CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375),
            }
        elseif level >= 1125 and level <= 1174 then
            data = {
                Mon = "Horned Warrior", LevelQuest = 2, NameQuest = "IceSideQuest", NameMon = "Horned Warrior",
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578),
                CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375),
            }
        elseif level >= 1175 and level <= 1199 then
            data = {
                Mon = "Magma Ninja", LevelQuest = 1, NameQuest = "FireSideQuest", NameMon = "Magma Ninja",
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213),
                CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375),
            }
        elseif level >= 1200 and level <= 1249 then
            data = {
                Mon = "Lava Pirate", LevelQuest = 2, NameQuest = "FireSideQuest", NameMon = "Lava Pirate",
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213),
                CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875),
            }
        elseif level >= 1250 and level <= 1274 then
            local cf = CFrame.new(1037.80127, 125.092171, 32911.6016)
            data = {
                Mon = "Ship Deckhand", LevelQuest = 1, NameQuest = "ShipQuest1", NameMon = "Ship Deckhand",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375),
                OnSet = function() needEntrance(cf, Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) end,
            }
        elseif level >= 1275 and level <= 1299 then
            local cf = CFrame.new(1037.80127, 125.092171, 32911.6016)
            data = {
                Mon = "Ship Engineer", LevelQuest = 2, NameQuest = "ShipQuest1", NameMon = "Ship Engineer",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875),
                OnSet = function() needEntrance(cf, Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) end,
            }
        elseif level >= 1300 and level <= 1324 then
            local cf = CFrame.new(968.80957, 125.092171, 33244.125)
            data = {
                Mon = "Ship Steward", LevelQuest = 1, NameQuest = "ShipQuest2", NameMon = "Ship Steward",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625),
                OnSet = function() needEntrance(cf, Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) end,
            }
        elseif level >= 1325 and level <= 1349 then
            local cf = CFrame.new(968.80957, 125.092171, 33244.125)
            data = {
                Mon = "Ship Officer", LevelQuest = 2, NameQuest = "ShipQuest2", NameMon = "Ship Officer",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625),
                OnSet = function() needEntrance(cf, Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)) end,
            }
        elseif level >= 1350 and level <= 1374 then
            local cf = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
            data = {
                Mon = "Arctic Warrior", LevelQuest = 1, NameQuest = "FrostQuest", NameMon = "Arctic Warrior",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125),
                OnSet = function() needEntrance(cf, Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422)) end,
            }
        elseif level >= 1375 and level <= 1424 then
            data = {
                Mon = "Snow Lurker", LevelQuest = 2, NameQuest = "FrostQuest", NameMon = "Snow Lurker",
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909),
                CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375),
            }
        elseif level >= 1425 and level <= 1449 then
            data = {
                Mon = "Sea Soldier", LevelQuest = 1, NameQuest = "ForgottenQuest", NameMon = "Sea Soldier",
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376),
                CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125),
            }
        elseif level >= 1450 then
            data = {
                Mon = "Water Fighter", LevelQuest = 2, NameQuest = "ForgottenQuest", NameMon = "Water Fighter",
                CFrameQuest = CFrame.new(-3054, 240, -10146),
                CFrameMon = CFrame.new(-3291, 252, -10501),
            }
        end

    elseif world3 then
        if level >= 1500 and level <= 1524 then
            data = {
                Mon = "Pirate Millionaire", LevelQuest = 1, NameQuest = "PiratePortQuest", NameMon = "Pirate Millionaire",
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375),
            }
        elseif level >= 1525 and level <= 1574 then
            data = {
                Mon = "Pistol Billionaire", LevelQuest = 2, NameQuest = "PiratePortQuest", NameMon = "Pistol Billionaire",
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627),
                CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875),
            }
        elseif level >= 1575 and level <= 1599 then
            data = {
                Mon = "Dragon Crew Warrior", LevelQuest = 1, NameQuest = "DragonCrewQuest", NameMon = "Dragon Crew Warrior",
                CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375),
                CFrameMon = CFrame.new(6920.71435546875, 56.15597152709961, -942.5044555664062),
            }
        elseif level >= 1600 and level <= 1624 then
            data = {
                Mon = "Dragon Crew Archer", LevelQuest = 2, NameQuest = "DragonCrewQuest", NameMon = "Dragon Crew Archer",
                CFrameQuest = CFrame.new(6738.96142578125, 127.81645965576172, -713.511474609375),
                CFrameMon = CFrame.new(6817.91259765625, 484.804443359375, 513.4141235351562),
            }
        elseif level >= 1625 and level <= 1649 then
            data = {
                Mon = "Hydra Enforcer", LevelQuest = 1, NameQuest = "VenomCrewQuest", NameMon = "Hydra Enforcer",
                CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125),
                CFrameMon = CFrame.new(4584.69287109375, 1002.6435546875, 705.7958984375),
            }
        elseif level >= 1650 and level <= 1699 then
            data = {
                Mon = "Venomous Assailant", LevelQuest = 2, NameQuest = "VenomCrewQuest", NameMon = "Venomous Assailant",
                CFrameQuest = CFrame.new(5213.8740234375, 1004.5042724609375, 758.6944580078125),
                CFrameMon = CFrame.new(4638.78564453125, 1078.94091796875, 881.8002319335938),
            }
        elseif level >= 1700 and level <= 1724 then
            data = {
                Mon = "Marine Commodore", LevelQuest = 1, NameQuest = "MarineTreeIsland", NameMon = "Marine Commodore",
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747),
                CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125),
            }
        elseif level >= 1725 and level <= 1774 then
            data = {
                Mon = "Marine Rear Admiral", LevelQuest = 2, NameQuest = "MarineTreeIsland", NameMon = "Marine Rear Admiral",
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813),
                CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125),
            }
        elseif level >= 1775 and level <= 1799 then
            data = {
                Mon = "Fishman Raider", LevelQuest = 1, NameQuest = "DeepForestIsland3", NameMon = "Fishman Raider",
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213),
                CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625),
            }
        elseif level >= 1800 and level <= 1824 then
            data = {
                Mon = "Fishman Captain", LevelQuest = 2, NameQuest = "DeepForestIsland3", NameMon = "Fishman Captain",
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213),
                CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625),
            }
        elseif level >= 1825 and level <= 1849 then
            data = {
                Mon = "Forest Pirate", LevelQuest = 1, NameQuest = "DeepForestIsland", NameMon = "Forest Pirate",
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247),
                CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625),
            }
        elseif level >= 1850 and level <= 1899 then
            data = {
                Mon = "Mythological Pirate", LevelQuest = 2, NameQuest = "DeepForestIsland", NameMon = "Mythological Pirate",
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247),
                CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125),
            }
        elseif level >= 1900 and level <= 1924 then
            data = {
                Mon = "Jungle Pirate", LevelQuest = 1, NameQuest = "DeepForestIsland2", NameMon = "Jungle Pirate",
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002),
                CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625),
            }
        elseif level >= 1925 and level <= 1974 then
            data = {
                Mon = "Musketeer Pirate", LevelQuest = 2, NameQuest = "DeepForestIsland2", NameMon = "Musketeer Pirate",
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002),
                CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375),
            }
        elseif level >= 1975 and level <= 1999 then
            data = {
                Mon = "Reborn Skeleton", LevelQuest = 1, NameQuest = "HauntedQuest1", NameMon = "Reborn Skeleton",
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625),
            }
        elseif level >= 2000 and level <= 2024 then
            data = {
                Mon = "Living Zombie", LevelQuest = 2, NameQuest = "HauntedQuest1", NameMon = "Living Zombie",
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875),
            }
        elseif level >= 2025 and level <= 2049 then
            data = {
                Mon = "Demonic Soul", LevelQuest = 1, NameQuest = "HauntedQuest2", NameMon = "Demonic Soul",
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625),
            }
        elseif level >= 2050 and level <= 2074 then
            data = {
                Mon = "Posessed Mummy", LevelQuest = 2, NameQuest = "HauntedQuest2", NameMon = "Posessed Mummy",
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625),
            }
        elseif level >= 2075 and level <= 2099 then
            data = {
                Mon = "Peanut Scout", LevelQuest = 1, NameQuest = "NutsIslandQuest", NameMon = "Peanut Scout",
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875),
            }
        elseif level >= 2100 and level <= 2124 then
            data = {
                Mon = "Peanut President", LevelQuest = 2, NameQuest = "NutsIslandQuest", NameMon = "Peanut President",
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875),
            }
        elseif level >= 2125 and level <= 2149 then
            data = {
                Mon = "Ice Cream Chef", LevelQuest = 1, NameQuest = "IceCreamIslandQuest", NameMon = "Ice Cream Chef",
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125),
            }
        elseif level >= 2150 and level <= 2199 then
            data = {
                Mon = "Ice Cream Commander", LevelQuest = 2, NameQuest = "IceCreamIslandQuest", NameMon = "Ice Cream Commander",
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625),
            }
        elseif level >= 2200 and level <= 2224 then
            data = {
                Mon = "Cookie Crafter", LevelQuest = 1, NameQuest = "CakeQuest1", NameMon = "Cookie Crafter",
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931),
                CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375),
            }
        elseif level >= 2225 and level <= 2249 then
            data = {
                Mon = "Cake Guard", LevelQuest = 2, NameQuest = "CakeQuest1", NameMon = "Cake Guard",
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931),
                CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875),
            }
        elseif level >= 2250 and level <= 2274 then
            data = {
                Mon = "Baking Staff", LevelQuest = 1, NameQuest = "CakeQuest2", NameMon = "Baking Staff",
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446),
                CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375),
            }
        elseif level >= 2275 and level <= 2299 then
            data = {
                Mon = "Head Baker", LevelQuest = 2, NameQuest = "CakeQuest2", NameMon = "Head Baker",
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446),
                CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125),
            }
        elseif level >= 2300 and level <= 2324 then
            data = {
                Mon = "Cocoa Warrior", LevelQuest = 1, NameQuest = "ChocQuest1", NameMon = "Cocoa Warrior",
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375),
                CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125),
            }
        elseif level >= 2325 and level <= 2349 then
            data = {
                Mon = "Chocolate Bar Battler", LevelQuest = 2, NameQuest = "ChocQuest1", NameMon = "Chocolate Bar Battler",
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375),
                CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375),
            }
        elseif level >= 2350 and level <= 2374 then
            data = {
                Mon = "Sweet Thief", LevelQuest = 1, NameQuest = "ChocQuest2", NameMon = "Sweet Thief",
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875),
                CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625),
            }
        elseif level >= 2375 and level <= 2399 then
            data = {
                Mon = "Candy Rebel", LevelQuest = 2, NameQuest = "ChocQuest2", NameMon = "Candy Rebel",
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875),
                CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625),
            }
        elseif level >= 2400 and level <= 2424 then
            data = {
                Mon = "Candy Pirate", LevelQuest = 1, NameQuest = "CandyQuest1", NameMon = "Candy Pirate",
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375),
                CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875),
            }
        elseif level >= 2425 and level <= 2449 then
            data = {
                Mon = "Snow Demon", LevelQuest = 2, NameQuest = "CandyQuest1", NameMon = "Snow Demon",
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375),
                CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375),
            }
        elseif level >= 2450 and level <= 2474 then
            data = {
                Mon = "Isle Outlaw", LevelQuest = 1, NameQuest = "TikiQuest1", NameMon = "Isle Outlaw",
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812),
                CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656),
            }
        elseif level >= 2475 and level <= 2524 then
            data = {
                Mon = "Island Boy", LevelQuest = 2, NameQuest = "TikiQuest1", NameMon = "Island Boy",
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812),
                CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562),
            }
        elseif level >= 2525 and level <= 2550 then
            data = {
                Mon = "Isle Champion", LevelQuest = 2, NameQuest = "TikiQuest2", NameMon = "Isle Champion",
                CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625),
                CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375),
            }
        elseif level >= 2550 and level <= 2574 then
            data = {
                Mon = "Serpent Hunter", LevelQuest = 1, NameQuest = "TikiQuest3", NameMon = "Serpent Hunter",
                CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401),
                CFrameMon = CFrame.new(-16521.0625, 106.09285, 1488.78467, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044),
            }
        elseif level >= 2575 and level <= 2599 then
            data = {
                Mon = "Skull Slayer", LevelQuest = 2, NameQuest = "TikiQuest3", NameMon = "Skull Slayer",
                CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401),
                CFrameMon = CFrame.new(-16887.7305, 113.074638, 1629.97778, -0.559032857, 1.2313353e-08, -0.829145491, 1.05618814e-09, 1, 1.41385428e-08, 0.829145491, 7.02817626e-09, -0.559032857),
            }
        elseif level >= 2600 and level <= 2624 then
            local cf = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
            data = {
                Mon = "Reef Bandit", LevelQuest = 1, NameQuest = "SubmergedQuest1", NameMon = "Reef Bandits",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(11019.1318, -2146.06812, 9342.3916, -0.719955266, -1.74275385e-08, 0.69402045, 5.76556367e-08, 1, 8.49211546e-08, -0.69402045, 1.01153624e-07, -0.719955266),
                OnSet = function() needSubmerged(cf) end,
            }
        elseif level >= 2625 and level <= 2649 then
            local cf = CFrame.new(10778.875, -2087.72437, 9265.18359, 0.934615612, -9.33109447e-08, -0.355659455, 9.17655143e-08, 1, -2.12154276e-08, 0.355659455, -1.28090019e-08, 0.934615612)
            data = {
                Mon = "Coral Pirate", LevelQuest = 2, NameQuest = "SubmergedQuest1", NameMon = "Coral Pirates",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(10808.6006, -2030.36145, 9364.2334, -0.775185347, -0.0359364748, 0.6307109, 0.0615428537, 0.989336014, 0.132010356, -0.628728986, 0.141148239, -0.764707148),
                OnSet = function() needSubmerged(cf) end,
            }
        elseif level >= 2650 and level <= 2674 then
            local cf = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
            data = {
                Mon = "Sea Chanter", LevelQuest = 1, NameQuest = "SubmergedQuest2", NameMon = "Sea Chanters",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(10671.2715, -2057.59155, 10047.2588, -0.846484065, -3.11045447e-08, 0.532414079, -5.55383117e-08, 1, -2.98785316e-08, -0.532414079, -5.48610757e-08, -0.846484065),
                OnSet = function() needSubmerged(cf) end,
            }
        elseif level >= 2675 and level <= 2699 then
            local cf = CFrame.new(10880.6855, -2086.20044, 10032.624, -0.321384728, 9.87648434e-08, -0.946948707, 7.13271007e-08, 1, 8.00902953e-08, 0.946948707, -4.18033075e-08, -0.321384728)
            data = {
                Mon = "Ocean Prophet", LevelQuest = 2, NameQuest = "SubmergedQuest2", NameMon = "Ocean Prophets",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(11008.5195, -2007.72839, 10223.0791, -0.688615739, 2.33523378e-09, -0.725126445, 2.99292546e-09, 1, 3.78221315e-10, 0.725126445, -1.90980032e-09, -0.688615739),
                OnSet = function() needSubmerged(cf) end,
            }
        elseif level >= 2700 and level <= 2724 then
            local cf = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
            data = {
                Mon = "High Disciple", LevelQuest = 1, NameQuest = "SubmergedQuest3", NameMon = "High Disciple",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(9750.41602, -1966.93884, 9753.36035, -0.749824047, 5.57797613e-08, -0.661637306, 2.03500754e-08, 1, 6.1243199e-08, 0.661637306, 3.24572511e-08, -0.749824047),
                OnSet = function() needSubmerged(cf) end,
            }
        elseif level >= 2725 then
            local cf = CFrame.new(9640.08789, -1992.44507, 9613.65234, -0.957327187, 4.11991223e-08, 0.289006323, 1.5775445e-08, 1, -9.02985846e-08, -0.289006323, -8.18860855e-08, -0.957327187)
            data = {
                Mon = "Grand Devotee", LevelQuest = 2, NameQuest = "SubmergedQuest3", NameMon = "Grand Devotee",
                CFrameQuest = cf,
                CFrameMon = CFrame.new(9611.70508, -1993.47119, 9882.68848, -0.591375351, 4.14332426e-08, -0.806396425, 4.73774868e-08, 1, 1.66361875e-08, 0.806396425, -2.83668058e-08, -0.591375351),
                OnSet = function() needSubmerged(cf) end,
            }
        end
    end

    return data
end

function QuestModule:Apply(data)
    if not data then return end
    Mon         = data.Mon
    LevelQuest  = data.LevelQuest
    NameQuest   = data.NameQuest
    NameMon     = data.NameMon
    CFrameQuest = data.CFrameQuest
    CFrameMon   = data.CFrameMon
    if data.OnSet then pcall(data.OnSet) end
end

function QuestModule:CheckAndApply(world1, world2, world3)
    local level = plr.Data.Level.Value
    local data  = self:GetData(level, world1, world2, world3)
    self:Apply(data)
end

return QuestModule
