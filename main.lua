if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Prison Life", "Sentinel")
    local PlayerStuff = Window:NewTab("Local Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    local PlayerStuffSection3 = PlayerStuff:NewSection("Health Mods")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    PlayerStuffSection3:NewSlider("Health", "Change your health.", 999, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
    
    
    local b = Window:NewTab("Weapons")
    local bs1 = b:NewSection("Weapon Giver")
    bs1:NewDropdown("Gun Menu", "Give yourself a gun.", {"M9", "Remington 870", "AK-47"}, function(v)
        local args = {
            [1] = workspace.Prison_ITEMS.giver[v].ITEMPICKUP
        }
        
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        
    end)
    bs1:NewDropdown("Tool Menu", "Give yourself a tool.", {"Key card", "Hammer", "Crude Knife"}, function(v)
        local args = {
            [1] = "[InfinityHUB] Successfully gave "..v,
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        local args = {
            [1] = workspace.Prison_ITEMS.single[v].ITEMPICKUP
        }
        
        workspace.Remote.ItemHandler:InvokeServer(unpack(args))
        
        
    end)

    local bs2 = b:NewSection("Weapon Mods")
    bs2:NewDropdown("Gun Mods", "Make a gun op.", {"M9", "Remington 870", "AK-47"}, function(v)
        local args = {
            [1] = "[InfinityHUB] Successfully modded "..v,
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)
    local ct = Window:NewTab("Teleports")
    local cts1 = ct:NewSection("Random Bullshit")
    cts1:NewTextBox("Teleport to player", "Teleport to a specific player.", function(v)
        local args = {
            [1] = "[InfinityHUB] Successfully teleported to "..v..".",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        plr = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        plr2 = v
        plr.CFrame = game.Players[plr2].Character.HumanoidRootPart.CFrame
    end)
    cts1:NewButton("Yard", "Teleport to the yard.", function()
        local pos = CFrame.new(768.972778, 97.9999237, 2477.98071, 0.99990958, 0, -0.0134494444, 0, 1, 0, 0.0134494444, 0, 0.99990958)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    cts1:NewButton("Cafeteria", "Teleport to the cafeteria.", function()
        local pos = CFrame.new(926.319885, 99.9899368, 2289.07959, -0.99965483, 0, -0.0262726657, 0, 1, 0, 0.0262726657, 0, -0.99965483)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    cts1:NewButton("Cell Blocks", "Teleport to the cell blocks.", function()
        local pos = CFrame.new(917.187317, 99.9899673, 2452.70337, 0.999508202, -2.47819667e-08, 0.0313576534, 2.37016806e-08, 1, 3.48221576e-08, -0.0313576534, -3.40618023e-08, 0.999508202)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    local z = Window:NewTab("Godmode")
    local zs1 = z:NewSection("Health Modifications")
    zs1:NewToggle("Godmode (UNDETECTED)", "Toggle godmode.", function(s)
        if s then
            getgenv().godmode = true
            while godmode == true do    
                game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 999
            wait()
            end
        else
            getgenv().godmode = false
            while godmode == true do    
                game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 999
            end
        end
        end)
    local t = Window:NewTab("OP Stuff")
    local ts1 = t:NewSection("bullshit")
    ts1:NewButton("Kill Aura", "Kill aura.", function()
        local args = {
            [1] = "[InfinityHUB] KillAURA enabled.",
            [2] = "All"
        }
        
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if v.UserId == game:GetService("Players").LocalPlayer.UserId then
                print('Prevented InfinityHUB from killing you.')
            else
                while true do
                local args = {
                    [1] = v
                }
                
                game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                wait()
            end
        end
    end
        end)
        





    local f = Window:NewTab("Miscellaneous")
    local fs1 = f:NewSection("Miscellaneous")
    fs1:NewKeybind("Toggle UI", "Toggle the UI.", Enum.KeyCode.V, function()
        Library:ToggleUI()
    end)
    fs1:NewButton("Reload Character", "Reload Character.", function()
        local args = {
            [1] = game.Players.LocalPlayer
        }
        
        workspace.Remote.loadchar:InvokeServer(unpack(args))
    end)

elseif game.PlaceId == 2619187362 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | SPFS", "Sentinel")
    local PlayerStuff = Window:NewTab("Local Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    
    local a = Window:NewTab("Autofarm")
    local as1 = a:NewSection("Training")
    as1:NewToggle("Autofarm all", "Farms all stats.", function(state)
        if state then
            getgenv().autofarm = true
            while autofarm == true do
                local args = {
                    [1] = "Strength"
                }
                
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                local args = {
                    [1] = "Endurance"
                }
                
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                local args = {
                    [1] = "Psychic"
                }
                
                game:GetService("ReplicatedStorage").Events.Train:FireServer(unpack(args))
                
                wait(1)
            end
        else
            getgenv().autofarm = false
            while autofarm == true do
            end
        end
    end)
    as1:NewToggle("Autoquest", "Automate the process of claiming quests.", function(state)
        if state then
            getgenv().autoquest = true
            while autoquest == true do
            local args = {
                [1] = "GamesReborn"
            }
            
            game:GetService("ReplicatedStorage").Events.Quest:FireServer(unpack(args))
            wait(1)
        end
        else
            getgenv().autoquest = false
            while autoquest == true do
            end
        end
    end)
    as1:NewToggle("Toggle Autodaily", "self explanatory", function(state)
        if state then
            getgenv().dailyq = true
        else
            getgenv().dailyq = false
        end
    end)
    as1:NewDropdown("Select Daily Quest", "self explanatory", {"DailyStrength", "DailyEndurance", "DailyPhysic"}, function(v)
        while dailyq == true do
        local args = {
            [1] = v
        }
        
        game:GetService("ReplicatedStorage").Events.Quest:FireServer(unpack(args))
        wait(0.1)
    end
    end)
    
    local b = Window:NewTab("Teleport")
    local bsm = b:NewSection("Main")
    bsm:NewButton("Spawn", "Teleport to spawn.", function()
        local pos = CFrame.new(-412.060486, 70.7444839, -107.519936, 1, 2.26500187e-08, -2.07776266e-05, -2.26512515e-08, 1, -5.9347478e-08, 2.07776266e-05, 5.93479506e-08, 1)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bsm:NewButton("Goal Trainer", "Teleport to goal trainer.", function()
        local pos = CFrame.new(394.82843, 82.8216553, -580.264282, -0.999392271, 0, -0.0348687991, 0, 1, 0, 0.0348687991, 0, -0.999392271)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    local bs1 = b:NewSection("Strength")
    bs1:NewButton("Rock (x2)", "Teleport to rock.", function()
        local pos = CFrame.new(-290.381592, 87.647644, -144.596085, -0.623659492, -2.1114685e-10, 0.781696141, -2.66689615e-10, 1, 5.73411457e-11, -0.781696141, -1.72708889e-10, -0.623659492)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Gym (x5)", "Teleport to gym.", function()
        local pos = CFrame.new(-782.738037, 72.8042908, -350.996826, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Car (x20)", "Teleport to car.", function()
        local pos = CFrame.new(-138.216583, 69.9692917, -426.468567, 2.08616257e-06, 0.00292986305, -0.999995708, -3.02679837e-09, 0.999995708, 0.00292986305, 1, -3.02679837e-09, 2.08616257e-06)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Forklift (x100)", "Teleport to forklift.", function()
        local pos = CFrame.new(-964.414673, 70.5843277, -171.276917, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Meteor (x750)", "Teleport to meteor.", function()
        local pos = CFrame.new(-666.684937, 101.479324, -1150.85669, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Crystals (x10k)", "Teleport to crystals.", function()
        local pos = CFrame.new(124.807785, 68.7882309, -511.888397, -0.866141438, 0, -0.499799222, 0, 1, 0, 0.499799222, 0, -0.866141438)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Blue Planet (x75Qa)", "Teleport to blue planet.", function()
        local pos = CFrame.new(-1672.21228, 5881.94238, -965.538879, -0.866141438, 0, -0.499799222, 0, 1, 0, 0.499799222, 0, -0.866141438)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    bs1:NewButton("Red Planet (x3Qi)", "Teleport to red planet.", function()
        local pos = CFrame.new(1788.0863, 6771.48926, -1067.94043, -0.866141438, 0, -0.499799222, 0, 1, 0, 0.499799222, 0, -0.866141438)
        local plyr = game.Players.LocalPlayer
        plyr.Character.HumanoidRootPart.CFrame = pos
    end)
    local c = Window:NewTab("Transform")
    local cs1 = c:NewSection("Transform")
    cs1:NewToggle("Transform toggle", "Toggle transformation.", function(state)
        if state then
            local args = {
                [1] = true
            }
            
            game:GetService("ReplicatedStorage").Events.Transform:FireServer(unpack(args))
            
        else
            local args = {
                [1] = false
            }
            
            game:GetService("ReplicatedStorage").Events.Transform:FireServer(unpack(args))
            
        end
    end)
    local d = Window:NewTab("Daily Gift")
    local ds1 = d:NewSection("Stuff")
    ds1:NewToggle("Autoclaim Daily", "Autoclaim daily.", function(state)
        if state then
            getgenv().autogft = true
            while autogift == true do
            local args = {
                [1] = "FreeGift"
            }
            
            game:GetService("ReplicatedStorage").Events.DailyDeal:FireServer(unpack(args))
            wait(5)
        end
        else
            getgenv().autogft = false
            while autogift == true do
            local args = {
                [1] = "FreeGift"
            }
            
            game:GetService("ReplicatedStorage").Events.DailyDeal:FireServer(unpack(args))
            wait(5)  
        end
        end
    end)
    local e = Window:NewTab("Chests")
    local es1 = e:NewSection("Open")
    es1:NewDropdown("Select Chest", "no info", {"BasicChest","VoidChest","ElementalChest","AlienChest","HalloweenChest","LightDarkChest","WinterChest","GalaxyChest","AncientGodChest","DarkPumpkinChest","HolidayChest","MythicalChest"}, function(v)
        local args = {
            [1] = v
        }
        
        game:GetService("ReplicatedStorage").Events.PurchaseItem:FireServer(unpack(args))
    end)
    es1:NewToggle("Toggle Autochest", "Toggle autochest.", function(state)
        if state then
            getgenv().autochest = true
        else
            getgenv().autochest = false
        end
    end)
    es1:NewDropdown("Autofarm Chest", "no info", {"BasicChest","VoidChest","ElementalChest","AlienChest","HalloweenChest","LightDarkChest","WinterChest","GalaxyChest","AncientGodChest","DarkPumpkinChest","HolidayChest","MythicalChest"}, function(v)
        while autochest == true do
        local args = {
            [1] = v
        }
        
        game:GetService("ReplicatedStorage").Events.PurchaseItem:FireServer(unpack(args))
        wait(5)
    end
    end)
elseif game.PlaceId == 8554378337 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Weapon Fighting", "Sentinel")
    local PlayerStuff = Window:NewTab("Local Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)

elseif game.PlaceId == 9681073174 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Gym Simulator", "Sentinel")
    local PlayerStuff = Window:NewTab("Local Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)

    local a = Window:NewTab("Autofarm")
    local as1 = a:NewSection("Autofarm")
    as1:NewToggle("Auto Tap", "ToggleInfo", function(state)
        if state then
            getgenv().autofarm = true
            while autofarm == true do
            local args = {
                [1] = "Tapping"
            }
            
            game:GetService("ReplicatedStorage").Remotes.Tapping:FireServer(unpack(args))
            wait()
        end
            
        else
            getgenv().autofarm = false
            while autofarm == true do
                local args = {
                    [1] = "Tapping"
                }
                
                game:GetService("ReplicatedStorage").Remotes.Tapping:FireServer(unpack(args))
                wait()     
            end           
        end
    end)
    as1:NewToggle("Auto Rank", "ToggleInfo", function(state)
        if state then
            getgenv().autorank = true
            while autorank == true do
                local args = {
                    [1] = "Ranks",
                    [2] = 2
                }
                
                game:GetService("ReplicatedStorage").Remotes.RefeshClient:FireServer(unpack(args))
                
            wait()
        end
            
        else
            getgenv().autorank = false
            while autorank == true do
                local args = {
                    [1] = "Ranks",
                    [2] = 2
                }
                
                game:GetService("ReplicatedStorage").Remotes.RefeshClient:FireServer(unpack(args))                
                wait()     
            end           
        end
    end)
    as1:NewToggle("Auto Rebirth", "ToggleInfo", function(state)
        if state then
            getgenv().autorebirth = true
            while autorebirth == true do
                local args = {
                    [1] = "Rebirths",
                    [2] = 1
                }
                
                game:GetService("ReplicatedStorage").Remotes.RefeshClient:FireServer(unpack(args))
                
                
            wait()
        end
            
        else
            getgenv().autorebirth = false
            while autorebirth == true do
                local args = {
                    [1] = "Rebirths",
                    [2] = 1
                }
                
                game:GetService("ReplicatedStorage").Remotes.RefeshClient:FireServer(unpack(args))
                               
                wait()     
            end           
        end
    end)
    as1:NewToggle("Auto Train", "ToggleInfo", function(state)
        if state then
            getgenv().autotrain = true
            while autotrain == true do
                local args = {
                    [1] = "Training",
                    [2] = workspace.__WORKSPACE.__Interact.Training
                }
                
                game:GetService("ReplicatedStorage").Remotes.Training:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34.8916779, -18.197382, -36.5971985, -0.142475709, -1.29524489e-08, 0.989798307, 7.00842007e-09, 1, 1.40947689e-08, -0.989798307, 8.94508467e-09, -0.142475709)
            wait()
        end
            
        else
            getgenv().autotrain = false
            while autotrain == true do
                local args = {
                    [1] = "Training",
                    [2] = workspace.__WORKSPACE.__Interact.Training
                }
                
                game:GetService("ReplicatedStorage").Remotes.Training:FireServer(unpack(args))
                          
                wait()     
            end           
        end
    end)
    local b = Window:NewTab("Buying")
    local bs1 = b:NewSection("Stuff")
    bs1:NewDropdown("Buy Trainer", "DropdownInf", {"Normal", "Robux"}, function(v)
        local args = {
            [1] = "Trainer",
            [2] = v
        }
        
        game:GetService("ReplicatedStorage").Remotes.RefeshClient:FireServer(unpack(args))
    end)
    local c = Window:NewTab("Teleports")
    local cs1 = c:NewSection("Worlds")
    cs1:NewButton("Little Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1579.16687, -25.371151, -894.300476, 0.539543808, -0, -0.841957569, 0, 1, -0, 0.841957569, 0, 0.539543808)
    end)
    cs1:NewButton("Enchanted Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1141.27563, -11.3708725, 1028.90576, 0.792211354, 0, 0.610246897, 0, 1, 0, -0.610246897, 0, 0.792211354)
    end)
    cs1:NewButton("Temple Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-778.913818, -9.11101055, 3011.13037, 0.323495626, 0, 0.946229696, 0, 1, 0, -0.946229696, 0, 0.323495626)
    end)
    cs1:NewButton("Mythical Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(714.253235, -12.5164509, 2529.4751, 0.0569093227, 0, 0.99837935, 0, 1, 0, -0.99837935, 0, 0.0569093227)
    end)
    cs1:NewButton("Beach Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2501.8999, -13.061512, -3112.41455, 0.841956973, 0, 0.539544642, 0, 1, 0, -0.539544642, 0, 0.841956973)
    end)
    cs1:NewButton("Flower Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-360.420563, -10.1510496, 5211.03564, -0.998381972, 0, 0.0568631925, 0, 1, 0, -0.0568631925, 0, -0.998381972)
    end)
    cs1:NewButton("Volcano Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1154.5697, -9.28933716, 676.369385, -0.998381972, 0, 0.0568631925, 0, 1, 0, -0.0568631925, 0, -0.998381972)
    end)
    cs1:NewButton("Cyber Island", "DropdownInf", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1126.96008, -9.33895111, 316.783173, -0.998381972, 0, 0.0568631925, 0, 1, 0, -0.0568631925, 0, -0.998381972)
    end)
    local d = Window:NewTab("Miscellaneous")
    local ds1 = d:NewSection("Toggle UI")
    ds1:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.V, function()
        Library:ToggleUI()
    end)
elseif game.PlaceId == 1224212277 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Madcity", "Sentinel")
    local PlayerStuff = Window:NewTab("Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    local PlayerStuffSection3 = PlayerStuff:NewSection("Health Mods")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    PlayerStuffSection3:NewSlider("Health", "Change your health.", 100, 1, function(s)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
    PlayerStuffSection3:NewButton("Heal", "Change your health.", function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end)

    local a = Window:NewTab("Godmode")
    local as1 = a:NewSection("Health Modifications")
    as1:NewToggle("Godmode", "Enable godmode.", function(state)
        if state then
            getgenv().godmode = true
            while godmode == true do 
                game.Players.LocalPlayer.Character.Humanoid.Health = 100
                wait()
            end
        else
            getgenv().godmode = false
            while godmode == false do 
                wait()
            end
        end
    end)
    local b = Window:NewTab("Teleport")
    local bs1 = b:NewSection("Most used")
    bs1:NewButton("Criminal Base", "Teleport to crim base.", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1978.46997, 25.5052719, 418.69519, 0.0054009608, -2.6776652e-08, 0.999985397, 2.43965221e-08, 1, 2.66452762e-08, -0.999985397, 2.42522571e-08, 0.0054009608)
    end)
    bs1:NewButton("Criminal Base Inside", "Teleport to crim base inside.", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2097.12207, 26.5052834, 425.591888, -0.0105340052, 2.99662801e-08, -0.999944508, -1.8880904e-08, 1, 3.01668486e-08, 0.999944508, 1.91976337e-08, -0.0105340052)
    end)
    bs1:NewButton("Hero Base", "Teleport to Hero Base.", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2097.12207, 26.5052834, 425.591888, -0.0105340052, 2.99662801e-08, -0.999944508, -1.8880904e-08, 1, 3.01668486e-08, 0.999944508, 1.91976337e-08, -0.0105340052)
    end)
elseif game.PlaceId == 9555732501 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Nen Fighting Simulator", "Sentinel")
    local PlayerStuff = Window:NewTab("Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    local PlayerStuffSection3 = PlayerStuff:NewSection("Health Mods")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    PlayerStuffSection3:NewSlider("Health", "Change your health.", 100, 1, function(s)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
    PlayerStuffSection3:NewButton("Heal (100)", "Change your health.", function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end)
    local a = Window:NewTab("Autofarm")
    local as1 = a:NewSection("Training")
    as1:NewToggle("Auto Train", "ToggleInfo", function(state)
        if state then
            getgenv().autofarm = true
            while autofarm == true do
                local args = {
                    [1] = "str"
                }
                
                game:GetService("ReplicatedStorage").Remotes.train:FireServer(unpack(args))
                local args = {
                    [1] = "dur"
                }
                
                game:GetService("ReplicatedStorage").Remotes.train:FireServer(unpack(args))
                
                local args = {
                    [1] = "agi"
                }
                
                game:GetService("ReplicatedStorage").Remotes.train:FireServer(unpack(args))
                wait()
            end    
        else
            getgenv().autofarm = false
            while autofarm == true do
                wait()
            end
        end
        end)
        as1:NewToggle("Durability (DONT USE BOTH AT SAME TIME)", "ToggleInfo", function(state)
            if state then
                getgenv().autofarm = true
                while autofarm == true do
                    local args = {
                        [1] = "dur"
                    }
                    
                    game:GetService("ReplicatedStorage").Remotes.train:FireServer(unpack(args))
                    wait()
                end    
            else
                getgenv().autofarm = false
                while autofarm == true do
                    wait()
                end
            end
            end)
    local misc = Window:NewTab("Miscellaneous")
    local miscs1 = misc:NewSection("Miscellaneous")
    miscs1:NewKeybind("Toggle UI", "KeybindInfo", Enum.KeyCode.V, function()
        Library:ToggleUI()
    end)
elseif game.PlaceId == 7076693699 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Soda Simulator X", "Sentinel")
    local PlayerStuff = Window:NewTab("Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    local PlayerStuffSection3 = PlayerStuff:NewSection("Health Mods")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    PlayerStuffSection3:NewSlider("Health", "Change your health.", 100, 1, function(s)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
    PlayerStuffSection3:NewButton("Heal (100)", "Change your health.", function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end)
    local a = Window:NewTab("Autofarm")
    local as1 = a:NewSection("Training")
    as1:NewToggle("Auto Train", "ToggleInfo", function(state)
        if state then
            getgenv().autofarm = true
            while autofarm == true do 
                game:GetService("ReplicatedStorage").Assets.Events.Shake:FireServer()
                wait()
            end
        else 
            getgenv().autofarm = false
            while autofarm == true do
                wait()
            end
        end
    end)
    as1:NewToggle("Auto Sell", "ToggleInfo", function(state)
        if state then
            getgenv().autosell = true
            while autosell == true do 
                game:GetService("ReplicatedStorage").Assets.Events.TPSell:FireServer()
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-43.205349, 78.5764542, -137.19873, -0.952855229, 3.91579142e-08, -0.303425282, 3.9475772e-08, 1, 5.08599074e-09, 0.303425282, -7.13173387e-09, -0.952855229)
                wait(3)
            end 
        else
            getgenv().autosell = false
                while autosell == true do 
                    wait()
                end
            end
        end)
elseif game.PlaceId == 8540346411 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("InfinityHUB | Rebirth Champions X", "Sentinel")
    local PlayerStuff = Window:NewTab("Player")
    local PlayerStuffSection = PlayerStuff:NewSection("Walkspeed")
    local PlayerStuffSection2 = PlayerStuff:NewSection("Jumppower")
    local PlayerStuffSection3 = PlayerStuff:NewSection("Health Mods")
    
    
    PlayerStuffSection:NewSlider("Walkspeed", "Change your walkspeed.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    PlayerStuffSection:NewTextBox("Walkspeed v2", "Change your walkspeed.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = text
    end)
    PlayerStuffSection2:NewSlider("Jumppower", "Change your jumppower.", 250, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    PlayerStuffSection2:NewTextBox("Jumppower v2", "Change your jumppower.", function(text)
    	game.Players.LocalPlayer.Character.Humanoid.JumpPower = text
    end)
    PlayerStuffSection3:NewSlider("Health", "Change your health.", 100, 1, function(s)
        game.Players.LocalPlayer.Character.Humanoid.Health = s
    end)
    PlayerStuffSection3:NewButton("Heal (100)", "Change your health.", function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end)
    local a = Window:NewTab("Auto Stuff")
    local as1 = a:NewSection("Auto")
    as1:NewToggle("Auto Tapping", "Auto tap.", function(state)
        if state then
            getgenv().autofarm = true
            while autofarm == true do 
                game:GetService("ReplicatedStorage").Events.Click3:FireServer()
                wait()
            end
        else
            getgenv().autofarm = false
            while autofarm == true do
                wait()
            end
        end
    end)
    as1:NewButton("Auto Coconut", "Auto coconut.", function()
                for i,v in pairs(game:GetService("Workspace").Scripts.CoconutsFolder.SpawnPoints:GetChildren()) do
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(0.1)
            end
    end)
    as1:NewToggle("Auto Rebirth Toggle", "Auto rebirth.", function(state)
        if state then
            getgenv().autorebirth = true
        else
            getgenv().autorebirth = false
        end
    end)
    as1:NewDropdown("Select Rebirth Type", "Auto Rebirth.", {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}, function(v)
        while autorebirth == true do
        local args = {
            [1] = v
        }
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
        wait(0.1)
    end
    end)
    local as2 = a:NewSection("Miscellaneous")
    as2:NewButton("Anti Lag", "Miscellaneous", function()
        local args = {
            [1] = "HideAuras",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").Events.Setting:FireServer(unpack(args))
        local args = {
            [1] = "HideBoosts",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").Events.Setting:FireServer(unpack(args))
        local args = {
            [1] = "PopUp",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage").Events.Setting:FireServer(unpack(args))
    end)


    local b = Window:NewTab("Chests")
    local bs1 = b:NewSection("Open Chests")
    bs1:NewButton("Open Summer Chest", "Open Chests", function()
        local args = {
            [1] = "Summer"
        }
        
        game:GetService("ReplicatedStorage").Events.Chest:FireServer(unpack(args))
    end)
    bs1:NewButton("Open Group Chest", "Open Chests", function()
        local args = {
            [1] = "Group"
        }
        
        game:GetService("ReplicatedStorage").Events.Chest:FireServer(unpack(args))
    end)

else
    -- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local X = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Message = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local website = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.Position = UDim2.new(0, 492, 0, 123)
Frame.Size = UDim2.new(0, 384, 0, 309)

UICorner.Parent = Frame

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Title.Position = UDim2.new(0.236979172, 0, 0.0550161898, 0)
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Font = Enum.Font.Highway
Title.Text = "InfinityHUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 40.000
Title.TextWrapped = true

UICorner_2.Parent = Title

X.Name = "X"
X.Parent = Frame
X.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
X.Position = UDim2.new(0.841145873, 0, 0.0258899666, 0)
X.Size = UDim2.new(0, 53, 0, 53)
X.Font = Enum.Font.Highway
X.Text = "X"
X.TextColor3 = Color3.fromRGB(170, 0, 0)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

UICorner_3.Parent = X

Message.Name = "Message"
Message.Parent = Frame
Message.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Message.BorderColor3 = Color3.fromRGB(24, 24, 24)
Message.Position = UDim2.new(0.114583336, 0, 0.305594921, 0)
Message.Size = UDim2.new(0, 296, 0, 170)
Message.Font = Enum.Font.Highway
Message.Text = "Seems like your current game is not yet supported by InfinityHUB. For the list of current games check our Github page!"
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextSize = 25.000
Message.TextWrapped = true

UICorner_4.Parent = Message

website.Name = "website"
website.Parent = Frame
website.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
website.BackgroundTransparency = 1.000
website.Position = UDim2.new(0.114583336, 0, 0.838187695, 0)
website.Size = UDim2.new(0, 296, 0, 50)
website.Font = Enum.Font.Highway
website.Text = "github.com/7fxcode/InfinityHUB-"
website.TextColor3 = Color3.fromRGB(255, 255, 255)
website.TextScaled = true
website.TextSize = 39.000
website.TextWrapped = true

UICorner_5.Parent = website

-- Scripts:

local function ODXXPT_fake_script() -- X.LocalScript 
	local script = Instance.new('LocalScript', X)

	local gui = script.Parent.Parent.Parent.Frame
	
	X.MouseButton1Click:Connect(function()
		gui.Visible = false
	end)
end
coroutine.wrap(ODXXPT_fake_script)()

end
