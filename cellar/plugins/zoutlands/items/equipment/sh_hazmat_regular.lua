ITEM.name = "Kombinezon ochrony chemicznej pracownika"
ITEM.description = "Żółty kombinezon ochrony chemicznej wykonany z najbardziej nietypowych polimerów. W zestawie fantazyjna zaokrąglona maska ​​gazowa z możliwością podłączenia do zamkniętego układu oddechowego, a także bardzo oślizgłe buty, które dość mocno uciskają stopę, ale jednocześnie zapewniają doskonałą ochronę przed wszelkiego rodzaju chemikaliami."
ITEM.model = "models/props_c17/SuitCase001a.mdl"
ITEM.slot = EQUIP_TORSO
ITEM.isOutfit = true
ITEM.width = 2
ITEM.height = 2
ITEM.CanBreakDown = false
ITEM.genderReplacement = {
	[GENDER_MALE] = "models/cellar/characters/hazmat/hazard_male.mdl",
	[GENDER_FEMALE] = "models/cellar/characters/hazmat/hazard_female.mdl"
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 3,
	[HITGROUP_CHEST] = 2,
	[HITGROUP_STOMACH] = 2,
	[4] = 2, -- hands
	[5] = 2, -- legs
}
ITEM.RadResist = 99.75
ITEM.rarity = 2

if CLIENT then
	local stats = {
		[HITGROUP_GENERIC] = "Ochrona",
		[HITGROUP_HEAD] = "Ochrona głowy",
		[HITGROUP_CHEST] = "Ochroma klatki piersiowej",
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
