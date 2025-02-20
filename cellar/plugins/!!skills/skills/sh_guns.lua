SKILL.name = "Broń"
SKILL.description = "Umiejętność decydująca o szansie trafienia podczas strzelania."
SKILL.category = 1

ix.action:Register("shootSuccess", "guns", {
	name = "Strzelanie",
	experience = {
		{level = 0, xp = 15},
		{level = 3, xp = 10},
		{level = 5, xp = 5}
	}
})

ix.action:Register("shootFarSuccess", "guns", {
	name = "Strzelanie na duże odległości",
	experience = {
		{level = 0, xp = 30},
		{level = 3, xp = 20},
		{level = 5, xp = 15}
	}
})

ix.action:Register("shootTraining", "guns", {
	name = "Strzelanie (trening)",
	noLogging = true,
	experience = {
		{level = 0, xp = 8},
		{level = 4, xp = 4},
		{level = 8, xp = 2}
	}
})

ix.action:Register("shootMiss", "guns", {
	name = "Strzelanie (chybione)",
	noLogging = true,
	experience = {
		{level = 0, xp = 3},
		{level = 5, xp = 1}
	}
})