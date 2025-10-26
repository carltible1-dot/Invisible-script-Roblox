-- Roblox Invisible Script
-- This script makes the player's character invisible by setting the Transparency of all parts to 1
-- and disabling the character's face and accessories visibility.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function makeInvisible(char)
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
            part.CanCollide = false
        elseif part:IsA("Decal") then
            part.Transparency = 1
        elseif part:IsA("Accessory") then
            if part:FindFirstChild("Handle") then
                part.Handle.Transparency = 1
            end
        end
    end
    -- Hide face
    local head = char:FindFirstChild("Head")
    if head then
        local face = head:FindFirstChildWhichIsA("Decal")
        if face then
            face.Transparency = 1
        end
    end
end

makeInvisible(character)

-- Reapply invisibility if character respawns
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    makeInvisible(char)
end)
