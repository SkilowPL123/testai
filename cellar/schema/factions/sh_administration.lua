FACTION.name = "Сотрудник ГА"
FACTION.description = "Человеческое представительство Альянса на нашей планете."
FACTION.color = Color(255, 200, 100, 255)
FACTION.bHumanVoices = true
FACTION.bCanUseRations = true
FACTION.bAllowDatafile = true
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

FACTION.isDefault = false
FACTION.isGloballyRecognized = true
FACTION.scoreboardClass = "scCityAdm"

function FACTION:GetModels(client, gender)
	return self.models[gender]
end

function FACTION:GetRationType(character)
	return Schema:GetCitizenRationTypes(character)
end

function FACTION:OnCharacterCreated(client, character)
	character:CreateIDCard("card_ca")
end

FACTION.npcRelations = {
    ["npc_turret_floor"] = D_NU,
    ["npc_combine_camera"] = D_NU,
    ["npc_turret_ceiling"] = D_NU,
    ["npc_rollermine"] = D_NU,
    ["npc_helicopter"] = D_NU,
    ["npc_combinegunship"] = D_NU,
    ["npc_strider"] = D_NU,
    ["npc_metropolice"] = D_LI,
    ["npc_hunter"] = D_NU,
	["npc_combine_s"] = D_NU,
	["CombinePrison"] = D_NU,
	["CombineElite"] = D_NU,
    ["npc_manhack"] = D_LI
}

FACTION_ADMIN = FACTION.index
