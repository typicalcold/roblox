
game.Players.LocalPlayer:Kick("This script is working but is currently detected, updated version can be found in the discord server!")

local selectedpath = loadstring(game:HttpGet('https://raw.githubusercontent.com/typicalcold/roblox/main/MRT%20Live%20ichikawa%20data'))()




local runService = game:GetService("RunService")



local globalenabled = false
local running = false

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "MRT farm IS DETECTED 100% - discord.gg/pm5Fj6tjv2",
   LoadingTitle = "Loading blatant MRT farm",
   LoadingSubtitle = "by ColdSnow",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "sirius", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
    Name = "Toggle Farm",
    Info = "Toggle Farm", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    if Value then
        if selectedpath =="" then
            Rayfield:Notify({
                Title = "No race selected",
                Content = "Please select a race to start!",
                Duration = 6.5,
                Image = 4483362458,
                Actions = { -- Notification Buttons
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                            print("The user tapped Okay!")
                        end
                    },
                },
            })
        else
            globalenabled = true
        end

    else
        globalenabled = false

    end
    end,
 })



local joinui = false
 while wait(1) do
    if globalenabled  and not running and selectedpath ~= "" then
        print(selectedpath)
        local tmppaths = selectedpath[2]
        local tmdrivelanes = "Turnpike Uphill"
        --local racetype = loadstring(readfile("coldsnow\\"..selectedpath))()[1]
        local locationpos = selectedpath[3]
        running = true
        print("ran")
        local args = {
            [1] = "RemoveVehicle"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("FrameworkEvent"):FireServer(unpack(args))
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        
        task.wait(7)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(locationpos[1],locationpos[2],locationpos[3]) + Vector3.new(0,2,0))
        joinui = true
        wait(4)
        while joinui do
                        local success, ErrorStatement = pcall(function()print(game:GetService("Players").LocalPlayer.PlayerGui.EventGui.Main.PlayerCount.Text) end)
            while not success do
                game.Players.LocalPlayer.Character:MoveTo(Vector3.new(locationpos[1],locationpos[2],locationpos[3]) + Vector3.new(0,2,0))
                print("Error: "..ErrorStatement)
                task.wait(5) 
                success, ErrorStatement = pcall(function()print(game:GetService("Players").LocalPlayer.PlayerGui.EventGui.Main.PlayerCount.Text) end)
            end
            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.EventGui.Main.PlayerCount.Text,"0/") then --add check
                print("can join")
                local args = {
                    [1] = tmdrivelanes,
                    [2] = "Sprint",
                    [3] = true,
                    [4] = {
                        ["Trigger"] = workspace:WaitForChild("Proximity Triggers"):WaitForChild(tmdrivelanes):WaitForChild("Focus"),
                        ["MaxRacers"] = 8
                    },
                    [5] = workspace:WaitForChild("Proximity Triggers"):WaitForChild(tmdrivelanes):WaitForChild("Focus")
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RaceEvents"):WaitForChild("Entry"):InvokeServer(unpack(args))
                
                local args = {
                    [1] = tmdrivelanes,
                    [2] = "Sprint",
                    [3] = workspace:WaitForChild("Proximity Triggers"):WaitForChild(tmdrivelanes):WaitForChild("Focus"),
                    [4] = {
                        ["Trigger"] = workspace:WaitForChild("Proximity Triggers"):WaitForChild(tmdrivelanes):WaitForChild("Focus"),
                        ["MaxRacers"] = 8
                    },
                    [5] = true
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RaceEvents"):WaitForChild("VoteToStart"):InvokeServer(unpack(args))
                joinui=false
                print("HELPP")
                
            else
                print("cannot join")
            end
            wait(1)
        end



        task.wait(30)
        print("attempting")
        repeat wait(1) until #workspace.VehiclesFolder[game.Players.LocalPlayer.Name]:GetChildren() == 1
        local mycarmodel = workspace.VehiclesFolder[game.Players.LocalPlayer.Name]:GetChildren()[1].Body["#Weight"]
        local part = game.Workspace.VehiclesFolder[game.Players.LocalPlayer.Name]:GetChildren()[1]:GetDescendants()
workspace.VehiclesFolder[game.Players.LocalPlayer.Name]:GetChildren()[1].PrimaryPart = workspace.VehiclesFolder[game.Players.LocalPlayer.Name]:GetChildren()[1].Body.Seat1
        for i,v in pairs(part) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end 
        end

        for i,v in pairs(tmppaths) do

            
                
        
        local connection
        mycarmodel.parent.parent.Body["#Weight"].Anchored = true

        connection = runService.RenderStepped:Connect(function()
            mycarmodel.parent.parent.Body["#Weight"].Anchored = false
            mycarmodel.parent.parent:SetPrimaryPartCFrame(CFrame.new(v[1],v[2]-13,v[3])*CFrame.Angles(80, 0, 0))
            mycarmodel.Velocity = Vector3.new(0,0,0)
            mycarmodel.RotVelocity = Vector3.new(0,0,0)
        end)

        --print("next", v[1],v[2]-5,v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10],v[11],v[12])
        task.wait(.06 + (math.random(1,13)/(100+math.random(100,900))))

       

        connection:Disconnect()

        print(i.."/"..#tmppaths.." Completed")
    
       
        end
        wait(3)
        running = false
    

    
    
    end

 end
