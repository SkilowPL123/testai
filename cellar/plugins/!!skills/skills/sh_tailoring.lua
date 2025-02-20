SKILL.name = "Krawiectwo"
SKILL.description = "Umiejętność umożliwiająca tworzenie różnych typów odzieży."
SKILL.category = 4

function SKILL:GetRequiredXP(skills, level)
	return math.ceil(75 * (level ^ 1.525) + 100)
end

ix.action:Register("craft_tailoring", "tailoring", {
	name = "Rzemiosło",
	experience = function(action, character, skill, price)
		return price
	end
})