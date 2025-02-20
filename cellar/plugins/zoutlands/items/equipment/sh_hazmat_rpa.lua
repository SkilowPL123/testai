ITEM.name = "Mundur ochronny FPA"
ITEM.description = "Kombinezon wykonany jest z twardej gumy w kolorze ciemnozielonym, tułów i klatka piersiowa aż do stóp są chronione ołowianym fartuchem. Od butów, beretów. Mundur przeznaczony jest do ekstremalnych warunków, do których funkcji zalicza się efekt dielektryczny i odporność ogniowa. W takim kombinezonie efekt promieniowania jest kilkakrotnie mniejszy niż w zwykłym cywilu. Zestaw zawiera GP-9 z przednią częścią MAG-3L."
ITEM.model = "models/props_c17/SuitCase001a.mdl"
ITEM.slot = EQUIP_TORSO
ITEM.isOutfit = true
ITEM.width = 2
ITEM.height = 2
ITEM.CanBreakDown = false
ITEM.genderReplacement = {
	[GENDER_MALE] = "models/vintagethief/hazmat_worker.mdl",
	[GENDER_FEMALE] = "models/vintagethief/hazmat_worker.mdl"
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 2,
	[HITGROUP_CHEST] = 5,
	[HITGROUP_STOMACH] = 5,
	[4] = 3, -- hands
	[5] = 3, -- legs
}
ITEM.RadResist = 99.75
ITEM.rarity = 2

if CLIENT then
	local stats = {
		[HITGROUP_GENERIC] = "Ochrona",
		[HITGROUP_HEAD] = "Ochrona głowy",
		[HITGROUP_CHEST] = "Ochrona klatki piersiowej",
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

		for i, v in ipairs(self.Stats) do
			if v == 0 then continue end

			local s = tooltip:AddRow("stat"..i)
			s:SetTextColor(greenClr)
		    s:SetText(string.format("+%i %s", v, stats[i]))
			s:SizeToContents()
		end
	end
end
