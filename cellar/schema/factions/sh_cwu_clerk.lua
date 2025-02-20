FACTION.name = "Сотрудник ГСР"
FACTION.description = "Вы представляете собой организацию, обеспечивающая занятость населения."
FACTION.color = Color(255, 215, 0, 255)
FACTION.isDefault = false
FACTION.bHumanVoices = true
FACTION.bCanUseRations = true
FACTION.bAllowDatafile = true
FACTION.scoreboardClass = "scCWU"
FACTION.models = {
	[1] = {
		"models/willardnetworks/citizens/male/c3_male_01.mdl",
		"models/willardnetworks/citizens/male/c3_male_02.mdl",
		"models/willardnetworks/citizens/male/c3_male_03.mdl",
		"models/willardnetworks/citizens/male/c3_male_04.mdl",
		"models/willardnetworks/citizens/male/c3_male_05.mdl",
		"models/willardnetworks/citizens/male/c3_male_06.mdl",
		"models/willardnetworks/citizens/male/c3_male_07.mdl",
		"models/willardnetworks/citizens/male/c3_male_08.mdl",
		"models/willardnetworks/citizens/male/c3_male_09.mdl",
		"models/willardnetworks/citizens/male/c3_male_10.mdl",
	},
	[2] = {
		"models/willardnetworks/citizens/female/c3_female_01.mdl",
		"models/willardnetworks/citizens/female/c3_female_02.mdl",
		"models/willardnetworks/citizens/female/c3_female_03.mdl",
		"models/willardnetworks/citizens/female/c3_female_04.mdl",
		"models/willardnetworks/citizens/female/c3_female_05.mdl",
		"models/willardnetworks/citizens/female/c3_female_06.mdl",
	},
}

function FACTION:GetModels(client, gender)
	return self.models[gender]
end

function FACTION:GetRationType(character)
	return Schema:GetCitizenRationTypes(character)
end

function FACTION:OnCharacterCreated(client, character)
	character:CreateIDCard("card_cwu")
end

FACTION_CWU_1 = FACTION.index

Schema:SetFactionGroup(FACTION_CWU_1, FACTION_GROUP_CWU)