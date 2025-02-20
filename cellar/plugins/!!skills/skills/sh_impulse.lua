SKILL.name = "Broń pulsacyjna"
SKILL.description = "Umiejętność określająca szansę trafienia przy strzelaniu z broni pulsacyjnej."
SKILL.category = 1

ix.action:Register("shootSuccess2", "impulse", {
	name = "Strzelanie",
	experience = {
		{level = 0, xp = 15},
		{level = 3, xp = 10},
		{level = 5, xp = 5}
	}
})

ix.action:Register("shootFarSuccess2", "impulse", {
	name = "Strzelanie na duże odległości",
	experience = {
		{level = 0, xp = 30},
		{level = 3, xp = 20},
		{level = 5, xp = 15}
	}
})

ix.action:Register("shootTraining2", "impulse", {
	name = "Strzelanie (trening)",
	noLogging = true,
	experience = {
		{level = 0, xp = 8},
		{level = 4, xp = 4},
		{level = 8, xp = 2}
	}
})

ix.action:Register("shootMiss2", "impulse", {
	name = "Strzelanie (chybione)",
	noLogging = true,
	experience = {
		{level = 0, xp = 3},
		{level = 5, xp = 1}
	}
})