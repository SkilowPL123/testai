SKILL.name = "Atletyka"
SKILL.description = "Umiejętność decydująca o prędkości i ilości wytrzymałości zużywanej podczas biegu."
SKILL.category = 3

ix.action:Register("athleticsRun", "athletics", {
	name = "Działanie",
	noLogging = true,
	experience = function(action, character, skill, value)
		return value
	end
})

local function CalcAthleticsSpeed(athletics)
	return 1 + (athletics * 0.1) * 0.25
end

function SKILL:OnLevelUp(client, character)
	client:SetRunSpeed(ix.config.Get("runSpeed") * CalcAthleticsSpeed(character:GetSkillModified("athletics")))
end
