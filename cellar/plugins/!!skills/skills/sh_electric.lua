SKILL.name = "Elektronika"
SKILL.description = "Umiejętność pozwalająca na rozmontowywanie i tworzenie różnorodnych urządzeń elektronicznych."
SKILL.category = 4

function SKILL:GetRequiredXP(skills, level)
	return math.ceil(75 * (level ^ 1.55) + 100)
end

ix.action:Register("craft_electric", "electric", {
	name = "Rzemiosło",
	experience = function(action, character, skill, price)
		return price
	end
})