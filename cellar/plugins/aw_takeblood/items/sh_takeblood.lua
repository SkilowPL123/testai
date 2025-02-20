local PLUGIN = PLUGIN

ITEM.name = "Worek na krew"
ITEM.description = "Pusty worek na krew z nowym zestawem do pobierania krwi."
ITEM.model = "models/props_rpd/medical_blood.mdl"
ITEM.category = "categoryMedical"

ITEM.functions.TakeHimBlood = {
	name = "Pobierz kogoś krew",

	OnRun = function(item)
		PLUGIN:TakeBlood(item,true)
		return false
	end,

	OnCanRun = function(item)
		local ent = item.player:GetEyeTraceNoCursor().Entity
		return !item.entity and IsValid(ent) and ent:IsPlayer()
	end
}

ITEM.functions.TakeMyBlood = {
	name = "Pobierz swoją krew",

	OnRun = function(item)
		PLUGIN:TakeBlood(item)
		return false
	end,

	OnCanRun = function(item)
		return !item.entity
	end
}