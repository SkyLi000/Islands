repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local Client = Players.LocalPlayer
local Character = Client.Character or Client.CharacterAdded:Wait()
local HumanoidRootPart = Character.HumanoidRootPart
local Islands = game:GetService("Workspace").Islands
local Island
local PrivateServer

local Remotes = {
    ["SwingSword"] = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_SWING_SWORD
}

if game.PlaceId ~= 4872321990 then
    Players:Kick("Invalid Game...")
    wait(5)
    game:Shutdown()
end

local function GetMyIsland()
    for i,v in pairs(Islands:GetChildren()) do
        for ie,ve in pairs(v.Owners:GetChildren()) do
            if ve.Name and ve.Value == Client.UserId then
                Island = v
            end
        end
    end
end

succ, err = pcall(GetMyIsland)
if err then
    Client:Kick("Failed to get current Island.\nPlease rejoin.")
    wait(5)
    game:Shutdown()
end


local function GetServerType()
	if game.PrivateServerId ~= "" then
		if game.PrivateServerOwnerId ~= 0 then
			PrivateServer = true
		else
			PrivateServer = false
		end
	else
		PrivateServer = false
	end
end

succ, err = pcall(GetServerType)
if err then
    Client:Kick("Failed to get server type.\nPlease rejoin.")
    wait(5)
    game:Shutdown()
end

function FightBoss(Boss)
    local Argument = {
        [1] = {
            ["crit"] = true;
            ["hitUnit"] = Boss
        }
    }

    Remotes.SwingSword:InvokeServer(unpack(Argument))  
end

function FarmBoss(Boss)
    if Boss == "KorBoss" then
        FightBoss(workspace.WildernessIsland.Entities.golem)
    elseif Boss == "DeerBoss" then
        FightBoss(workspace.WildernessIsland.Entities.deerBoss)
    elseif Boss == "SlimeKing" then
        FightBoss(workspace.WildnessIsland.Entities.slimeKing)
    elseif Boss == "WizardBoss"
        FightBoss(workspace.WildernessIsland.Entities.wizardBoss)
    elseif Boss == "DesertBoss"
        FightBoss(workspace.WildernessIsland.Entities.desertBoss)
    end
end


function CreatUI()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyLi000/GuiLibrary/main/Library.lua?token=GHSAT0AAAAAABT7B57YRTLOJJNHJPE5IT2SYUBSYGA"))()
end
