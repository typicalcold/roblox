game.Players.LocalPlayer:Kick("Script is outdated and will not work")


_G.enabled = true -- Enable autofarm or not

_G.autoclicker = true 
_G.GetAxe = true    
_G.noclipCam = true 

 _G.HideUsertag = true --Hide user above your head (Replicated to server and client)
 _G.LegitMoney = true -- set how much wood untill you sell it all
 _G.HideHats = true --turns your hats into grey blocks and less chance of getting found hacking, maybe?

 _G.Sellamount = 20 -- instead of consistant money flow, set how much wood in your inventory until you sell



    
game.StarterGui:SetCore("SendNotification", {
Title = "AutoFarm made by ColdSnow PATCHED"; 
Text = "PMEBGE tree autofarm fast. PATCHED FOR NOW"; 

Duration = 69; 
})
if _G.HideHats == true then
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if (v:IsA("Accessory")) or (v:IsA("Hat")) then
        v:WaitForChild("Handle"):GetChildren()[1]:Destroy()
        v.Parent = workspace
        end
        end

end
 if _G.HideUsertag == true  then 
    local Char = game.Players.LocalPlayer.Character

Char.Head.Mesh.Parent = game.CoreGui
Char.Head:ClearAllChildren()
game.CoreGui.Mesh.Parent = Char.Head
Char.Head.Parent = game.Lighting
game.Lighting.Head.Parent = Char
 end
 
if _G.noclipCam == true then
    for useless, garbage in next,getgc() do
   if getfenv(garbage).script == game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper and typeof(garbage) == "function" then
       for number, value in next, getconstants(garbage) do
           if tonumber(value) == 0.25 then
               setconstant(garbage,number,0)
           elseif tonumber(value) == 0 then
               setconstant(garbage,number,0.25)
           end
       end
   end
end
end
 
if _G.autoclicker == true then
    --// Credits \\--
--[[ Ezpi#0474 - Creator of this script ]]--
 
--// Services \\--
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
 
--// Variables \\--
local Player = Players.LocalPlayer
local Enabled = false
local Mouse = Player:GetMouse()
local X, Y = 0, 0
local LastC = Color3.new(1, 0, 0)
local LastU = tick()
 
--// Exploit Fix \\--
if not pcall(function() return syn.protect_gui end) then
    syn = {}
    syn.protect_gui = function(A_1)
        A_1.Parent = CoreGui
    end
end
 
--// UI Library \\--
local Library = loadstring(game:HttpGetAsync('https://pastebin.com/raw/edJT9EGX'))()
local Window = Library:CreateWindow("AutoClicker by Ezpi")
Enabled_1 = Window:AddColor({
    text = 'Status:',
    flag = "Ezpi_1",
    color = Color3.new(1, 0, 0),
    callback = function(A_1)
        -- "Enabled" Color
        local NewColor = Color3.new(0, 1, 0)
        if Enabled == false then
            NewColor = Color3.new(1, 0, 0)
        end
        if NewColor ~= Last or A_1 ~= NewColor then
            Last = NewColor
            Enabled_1:SetColor(NewColor)
        end
    end
})
Window:AddBind({
    text = 'Toggle',
    callback = function()
        -- Toggle
        Enabled = not Enabled
        -- "Enabled" Color
        local NewColor = Color3.new(0, 1, 0)
        if Enabled == false then
            NewColor = Color3.new(1, 0, 0)
        end
        if NewColor ~= Last then
            Last = NewColor
            Enabled_1:SetColor(NewColor)
        end
        -- Click Position
        if Enabled then
            -- Update Mouse Pos
            X, Y = Mouse.X, Mouse.Y + 0
            -- Update Box
            Box_1:SetValue()
        else
            X, Y = 0, 0
            Box_1:SetValue()
        end
        -- AutoClick
        while Enabled do
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
            wait(.01)
        end
    end
})
Window:AddSlider({
    text = 'Interval',
    min = 0,
    max = 0.001,
    value = 0,
    float = 0.001
})
Box_1 = Window:AddBox({
    text = "AutoClick Position:",
    value = "X: " .. X .. ", Y: " .. Y,
    callback = function()
        if tick()-LastU > 0.1 then
            LastU = tick()
            Box_1:SetValue("X: " .. X .. ", Y: " .. Y)
        end
    end
})
Library:Init()
end
 
if _G.GetAxe == true then
local A_1 = "ax"
local A_2 = true
local Event = game:GetService("ReplicatedStorage").Remotes.Shop
Event:FireServer(A_1, A_2)
end
 
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-367.284546, 8.62833786, -147.377441, 0.999052823, -4.5490593e-05, 0.0435142592, -2.72170792e-06, 0.999999404, 0.00110791519, -0.0435142815, -0.00110698421, 0.999052227)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
 
local VirtualInputManager = game:GetService('VirtualInputManager')
local List = {
   "Tree1",
   "Tree2",
   "Tree3",
   "Tree4"
}
 
local A_1 = "wood"
local A_2 = false
local Event = game:GetService("ReplicatedStorage").Remotes.Shop
 
counta = 0
local A_1 = "wood"
local A_2 = false
local Event = game:GetService("ReplicatedStorage").Remotes.Shop

game.StarterGui:SetCore("SendNotification", {
    Title = "Join  my discord: pm5Fj6tjv2"; 
    Text = "join for updates or something"; 
    
    Duration = 69e69; --unfunny
    })

if _G.enabled == true then


     VirtualInputManager:SendKeyEvent(true, "M", false, game)
    wait()
    VirtualInputManager:SendKeyEvent(false, "M", false, game)
 
while _G.enabled do
for _,v in pairs(game:GetService("Workspace").Map.Trees:GetChildren()) do

    if _G.LegitMoney and game.Players.LocalPlayer.MiscStats.Wood.Value > _G.Sellamount then 
        local op12 = game.Players.LocalPlayer.MiscStats.Wood.Value
        
        print("Selling: "..game.Players.LocalPlayer.MiscStats.Wood.Value.." wood ")



       for i = 1, game.Players.LocalPlayer.MiscStats.Wood.Value + 2 do   
   Event:FireServer(A_1, A_2)
       end
    print("Sold")
   end


    if not v then game.Workspace[game.LocalPlayer.Name].HumanoidRootPart.CFrame = -577.008728, 8.49967861, -413.84726, 0.319226354, -0.000574219797, -0.947678328, -1.22671068e-07, 0.999999821, -0.000605964451, 0.947678506, 0.000193557731, 0.319226295
  print("No trees!!!!!!!")
wait(5)
  end
   if table.find(List, v.Name) then
       



   





       if _G.enabled == true then
        local Part1 = v:GetChildren()
        if Part1[1] and Part1[2] and Part1[3] and Part1[4] and Part1[5] then
Part1[1].CanCollide = false
Part1[2].CanCollide = false
Part1[3].CanCollide = false
Part1[4].CanCollide = false
Part1[5].CanCollide = false
if v.Base then 
v.Base.CanCollide = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame + Vector3.new(0,6,0)

end
end

wait(0.1)
           game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
           if v and game.Players.LocalPlayer.Character.HumanoidRootPart then
       --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame + Vector3.new(0,6,0)
end
wait(.01)




if table.find(List, v.Name) then
    wait()
    else
        print("no trees!")
        wait(1)
   end
end
end
end
wait()
end
 
 
 
 
 
end
 
