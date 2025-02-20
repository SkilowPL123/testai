SKILL.name = "Broń biała"
SKILL.description = "Umiejętność określająca szansę na udany atak i parowanie ciosów bronią białą."
SKILL.category = 1

ix.action:Register("meleeSuccess", "meleeguns", {
	name = "Walka wręcz",
	experience = {
		{level = 0, xp = 16},
		{level = 2, xp = 9},
		{level = 5, xp = 3}
	}
})

ix.action:Register("meleeParry", "meleeguns", {
	name = "Walka wręcz (parowanie)",
	noLogging = true,
	experience = {
		{level = 0, xp = 8},
		{level = 5, xp = 4}
	}
})

ix.action:Register("meleeMiss", "meleeguns", {
	name = "Walka wręcz (chybiony)",
	noLogging = true,
	experience = {
		{level = 0, xp = 4},
		{level = 5, xp = 2}
	}
})