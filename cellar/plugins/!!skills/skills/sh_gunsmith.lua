SKILL.name = "Rusznikarz"
SKILL.description = "Umiejętność umożliwiająca tworzenie różnorodnych broni białych i palnych oraz amunicji."
SKILL.category = 4

function SKILL:GetRequiredXP(skills, level)
	return math.ceil(200 * (level ^ 1.875) + 200)
end

ix.action:Register("craft_gunsmith", "gunsmith", {
	name = "Rzemiosło",
	experience = function(action, character, skill, price)
		return price
	end
})