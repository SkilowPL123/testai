local PLUGIN = PLUGIN

PLUGIN.name = "Bodygroup Persist"
PLUGIN.author = "TwojaNazwa"
PLUGIN.description = "Zapisuje i odtwarza bodygroupy wybrane w kreatorze postaci."

-- Rejestrujemy nową zmienną postaci (charvar) "groups".
ix.char.RegisterVar("groups", {
	default = {},
	bNoDisplay = true,  -- nie wyświetlaj w standardowym kreatorze Helix
	alias = "bgs",

	OnSet = function(character, index, value)
		character:SetData("groups", value)
	end,

	OnGet = function(character, index, default)
		return character:GetData("groups", {})
	end
})

-- 1. Gdy gracz wczyta postać
function PLUGIN:PlayerLoadedCharacter(client, character, oldCharacter)
	if not IsValid(client) then return end

	local groups = character:GetData("groups", {})
	for bodyIndex, value in pairs(groups) do
		client:SetBodygroup(bodyIndex, value)
	end
end

-- 2. Gdy gracz się odradza (np. po śmierci)
function PLUGIN:PostPlayerLoadout(client)
	local character = client:GetCharacter()
	if not character then return end

	local groups = character:GetData("groups", {})
	for bodyIndex, value in pairs(groups) do
		client:SetBodygroup(bodyIndex, value)
	end
end
