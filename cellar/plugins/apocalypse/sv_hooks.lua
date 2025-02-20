local PLUGIN = PLUGIN

function PLUGIN:CharacterLoaded(character)
    if character:GetData("zombie", false) then
        local zstage = character:GetData("zstage", 1) -- Domyślnie 1 jeśli nie ma wartości
        local timerID = "ixInfection_" .. character:GetID()

        if zstage != 3 then
            timer.Create(timerID, 600, 3 - zstage, function()
                if not character or not character:GetPlayer() then
                    timer.Remove(timerID)
                    return
                end
                
                self:AdvanceDisease(character)
            end)
        end
    end
end

function PLUGIN:CanPlayerEquipItem(client, item, slot)
	if not IsValid(client) then return end
	local char = client:GetCharacter()
	return not (char:GetData("zombie", false) and (char:GetData("zstage") == 3))
end

function PLUGIN:CanPlayerInteractItem(client, action)
	if not IsValid(client) then return end
	local char = client:GetCharacter()
	return not (char:GetData("zombie", false) and (char:GetData("zstage") == 3))
end

hook.Add("prone.CanEnter", "Infection", function(client)
	if not IsValid(client) then return end
	local char = client:GetCharacter()
	return not (char:GetData("zombie", false) and (char:GetData("zstage") == 3))
end)
