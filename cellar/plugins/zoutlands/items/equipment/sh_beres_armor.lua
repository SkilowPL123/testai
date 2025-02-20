ITEM.name = "Kombinezon ochronny na broń kombinatu"
ITEM.description = "Przedwojenny zestaw ochronny wykonany z dwuwarstwowego demonronu i kompleksu SIBZ przeznaczony do działań w agresywnym środowisku. Pomimo swojego wieku jest doskonale zachowany."
ITEM.category = "Unikalny"
ITEM.model = "models/props_c17/SuitCase001a.mdl"
ITEM.slot = EQUIP_TORSO
ITEM.isOutfit = true
ITEM.width = 2
ITEM.height = 2
ITEM.CanBreakDown = false
ITEM.genderReplacement = {
	[GENDER_MALE] = "models/vintagethief/beres.mdl",
	[GENDER_FEMALE] = "models/vintagethief/beres.mdl"
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 20,
	[HITGROUP_HEAD] = 15,
	[HITGROUP_CHEST] = 20,
	[HITGROUP_STOMACH] = 15,
	[4] = 15, -- hands
	[5] = 15, -- legs
}
ITEM.RadResist = 100
ITEM.rarity = 4
ITEM.IsArmored = true

if CLIENT then
	local stats = {
		[HITGROUP_GENERIC] = "Ochrona",
		[HITGROUP_HEAD] = "Ochrona głowy",
		[HITGROUP_CHEST] = "Ochrona klatki piersiowe",
		[HITGROUP_STOMACH] = "Ochrona brzucha",
		[4] = "Ochrona rąk", -- hands
		[5] = "Ochrona nóg", -- legs
	}

	local greenClr = Color(50, 200, 50)

	function ITEM:PopulateTooltip(tooltip)
		local uses = tooltip:AddRowAfter("rarity", "wear")
		uses:SetText(L("wearSlot", L("slot"..self.slot)))

		if self.RadResist then
			local s = tooltip:AddRow("radresist")
			s:SetTextColor(greenClr)
		    s:SetText(string.format("+%i%% odporność na promieniowanie", self.RadResist))
			s:SizeToContents()
		end

		if self.IsArmored then
			local s = tooltip:AddRow("dmgresist")
			s:SetTextColor(greenClr)
		    s:SetText(string.format("+%i%% odporność na obrażenia", 75))
			s:SizeToContents()
		end

		for i, v in ipairs(self.Stats) do
			if v == 0 then continue end

			local s = tooltip:AddRow("stat"..i)
			s:SetTextColor(greenClr)
		    s:SetText(string.format("+%i %s", v, stats[i]))
			s:SizeToContents()
		end
	end
end
