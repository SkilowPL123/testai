ITEM.name = "Walkie Talkie"
ITEM.category = "Komunikacja"
ITEM.description = "Zwykłe przenośne radio z regulacją częstotliwości."
ITEM.business = true
ITEM.price = 50
ITEM.stationaryCanAccess = true

function ITEM:GetFrequency()
	return self:GetData("frequency", "100.0")
end

function ITEM:GetFrequencyID()
	return string.format("freq_%d", string.gsub(self:GetData("frequency", "100.0"), "%p", ""))
end

ITEM.functions.Frequency = {
	name = "Ustaw częstotliwość",

	OnCanRun = function(item)
		return IsValid(item.player) and !IsValid(item.entity) and !item.player:IsRestricted()
	end,

	OnClick = function(item)
		Derma_StringRequest("Częstotliwość", "Wprowadź nową częstotliwość radiową", item:GetData("frequency", "100.0"), function(text)
			netstream.Start("ixRadioFrequency", item:GetID(), text)
		end)
	end,

	OnRun = function()
		return false
	end
}
