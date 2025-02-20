FACTION.name = "Сопротивление"
FACTION.description = "Вы - рядовой боец сопротивления, сражайтесь за вашу свободу и постарайтесь выжить."
FACTION.color = Color(199, 53, 0, 255)
FACTION.isDefault = false
FACTION.bHumanVoices = true
FACTION.bCanUseRations = true
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

function FACTION:OnCharacterCreated(client, character)
	
end

FACTION_REBEL = FACTION.index

Schema:SetFactionGroup(FACTION_REBEL, FACTION_GROUP_REBEL)
