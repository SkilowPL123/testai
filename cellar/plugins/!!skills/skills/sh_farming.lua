SKILL.name = "Rolnictwo"
SKILL.description = "Umiejętność decydująca o mistrzostwie w pielęgnacji roślin."
SKILL.category = 4

function SKILL:GetRequiredXP(skills, level)
	return math.ceil(75 * (level ^ 1.525) + 100)
end

ix.action:Register("farmingWater", "farming", {
	name = "Podlewanie",
	experience = 28
})

ix.action:Register("farmingPlant", "farming", {
	name = "Sadzenie",
	experience = 35
})

ix.action:Register("farmingHarvest", "farming", {
	name = "Zbieranie",
	experience = 20
})