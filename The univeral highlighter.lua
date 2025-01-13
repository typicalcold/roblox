--[[
my Discord server: https://discord.gg/6fv3FUbdRV
]]

local RunService = game:GetService("RunService")
local version = 1
cleardrawcache()


local lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua')))()
local Window = lib:CreateWindow({
	Name = "The universal highlighter - chillycoldsnow",
	LoadingTitle = "By chillycoldsnow",
	LoadingSubtitle = "By coldsnow",
	ConfigurationSaving = {
	   Enabled = true,
	   FolderName = nil, -- Create a custom folder for your hub/game
	   FileName = "ArrayField"
	},
	Discord = {
	   Enabled = false,
	   Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
	   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
	   Title = "Untitled",
	   Subtitle = "Key System",
	   Note = "No method of obtaining the key is provided",
	   FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
	   SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
	   GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
	   Actions = {
			 [1] = {
				 Text = 'Click here to copy the key link <--',
				 OnPress = function()
					 print('Pressed')
				 end,
				 }
			 },
	   Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
 })
 local charplace = ""
local setting = {Enabled=false,DepthMode="AlwaysOnTop",FillTransparency=0.7,FillColor=Color3.fromRGB(255, 255, 255),OutlineColor=Color3.fromRGB(255, 255, 255),OutlineTransparency="0.6",preview = false}

local function reset()
for i,v in pairs(game.Players:GetChildren()) do
if v.Character then
	local name="Esp"..math.random(1,10000000)
    for i,v10 in pairs(v.Character:GetChildren()) do
        if v10:IsA("Highlight") then
            v10:Destroy()
			if not v.Character:FindFirstChild(name) then
			break
			end
        end
    end
	charplace = v.Character.Parent
    if v.Character:FindFirstChild("HumanoidRootPart") and setting.Enabled then
        local ESP = Instance.new("Highlight", v.Character)
        ESP.Name = name
        ESP.Adornee = v.Character
        ESP.Enabled = setting.Enabled
        ESP.DepthMode = Enum.HighlightDepthMode[setting.DepthMode]
        ESP.FillTransparency = setting.FillTransparency
        ESP.FillColor = setting.FillColor

        ESP.OutlineColor = setting.OutlineColor
        ESP.OutlineTransparency = setting.OutlineTransparency
    end
end
end
end

reset()


local Functions = Window:CreateTab("Functions","4483345998")
local Misc = Functions:CreateSection("Misc")
Functions:CreateButton({
	SectionParent = Misc,
	Name = "reboot",
	Interact = 'Click',
	Callback = function()
      		print("button pressed")
              reset()
  	end,   
})
Functions:CreateToggle({
	SectionParent = Misc,
	Name = "Enable",
	Default = false,
	Callback = function(Value)
		print(Value)
        if Value == true then
            setting.Enabled = true
            reset()

        else
            setting.Enabled = false
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Character then
                    for i,v2 in pairs(v.Character:GetChildren()) do
                        if v2:IsA("Highlight") then
                            v2:Destroy()
                        end
                    end
                end
                
            end

        end
	end    
})
local posY = 0








local Color = Functions:CreateSection("Color")
Functions:CreateButton({
	SectionParent = Color,
	Name = "reboot",
	Interact = 'Click',
	Callback = function()
      		print("button pressed")
              reset()
  	end    
})

Functions:CreateColorPicker({
	SectionParent = Color,
	Name = "Fill color",
	Color = Color3.fromRGB(255, 255, 255),
	Callback = function(Value)

        setting.FillColor = Color3.fromRGB(Value.R*255,Value.G*255,Value.B*255)
        reset()
	end	
})
Functions:CreateColorPicker({
	SectionParent = Color,
	Name = "Outline color",
	Color = Color3.fromRGB(255, 255, 255),
	Callback = function(Value)

        setting.OutlineColor = Color3.fromRGB(Value.R*255,Value.G*255,Value.B*255)
        reset()
	end	
})

Functions:CreateSlider({
	
	SectionParent = Color,
	Name = "Outline transparency",
	Range = {0, 100},
	CurrentValue = 50,
	Increment = 1,
	ValueName = "transparency",
	Callback = function(Value)
		print(Value)
        setting.OutlineTransparency = Value/100
        reset()
	end    
})
Functions:CreateSlider({
	SectionParent = Color,
	Name = "Fill transparency",
	Range = {0, 100},
	CurrentValue = 70,
	Increment = 1,
	ValueName = "transparency",
	Callback = function(Value)
		--print(Value)
        setting.FillTransparency = Value/100
        reset()
	end    
})


print(charplace.Name)
game.Players.ChildAdded:Connect(function(descendant)

 local v=game.Players[descendant.Name]
 print(v)
 repeat task.wait(0.1) until charplace:FindFirstChild(v)
    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and setting.Enabled then
        local ESP = Instance.new("Highlight", v.Character)
        ESP.Name = "Esp"..math.random(1,10000000)
        ESP.Adornee = v.Character
        ESP.Enabled = setting.Enabled
        ESP.DepthMode = Enum.HighlightDepthMode[setting.DepthMode]
        ESP.FillTransparency = setting.FillTransparency
        ESP.FillColor = setting.FillColor

        ESP.OutlineColor = setting.OutlineColor
        ESP.OutlineTransparency = setting.OutlineTransparency
		
        end
		

end)


-- TODO: ADD THE PREVIEW FOR THE ESP ON THE SCREEN



while task.wait(1) do-- scans for any missing characters
    
	local found = false
	for i,v in pairs(game.Players:GetChildren()) do
		found =false
		if charplace:FindFirstChild(v.Name) then
	for i,v2 in pairs(v.Character:GetChildren()) do
		if v2:IsA("Highlight") then
			found=true
			break
		end
	end 
	end
	if found==false then
		found=false
		reset()
	end
	end
end
