ITEM.name = "Hełm pancerny CP"
ITEM.description = "Najlepszy wynalazek w arsenale CCA, hełm taktyczny z inteligentnym interfejsem, który zapewnia dobrą ochronę przed kulami i ułatwia nawigację na polu walki."
ITEM.model = Model("models/items/mask_05.mdl")
ITEM.rarity = 3
ITEM.bodyGroups = {
	[1] = 1,
	[2] = 6
}
ITEM.Filters = {
	["filter_epic"] = true,
	["filter_good"] = true,
	["filter_medium"] = true,
	["filter_standard"] = false
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 18,
	[HITGROUP_CHEST] = 0,
	[HITGROUP_STOMACH] = 0,
	[4] = 0,
	[5] = 0,
}
ITEM.WeaponSkillBuff = 5
ITEM.CPMask = true
ITEM.visorLevel = 2
ITEM.withOutfit = true