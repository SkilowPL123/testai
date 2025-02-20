SKILL.name = "Walka wręcz"
SKILL.description = "Umiejętność decydująca o szansie na udany atak i parowanie w walce wręcz."
SKILL.category = 1

ix.action:Register("unarmedSuccess", "unarmed", {
	name = "Walka wręcz",
	experience = {
		{level = 0, xp = 16},
		{level = 2, xp = 9},
		{level = 5, xp = 2}
	}
})

ix.action:Register("unarmedParry", "unarmed", {
	name = "Walka wręcz (parowanie)",
	noLogging = true,
	experience = {
		{level = 0, xp = 6},
		{level = 5, xp = 2}
	}
})

ix.action:Register("unarmedFail", "unarmed", {
	name = "Walka wręcz (chyba)",
	noLogging = true,
	experience = {
		{level = 0, xp = 2},
		{level = 5, xp = 1}
	}
})
