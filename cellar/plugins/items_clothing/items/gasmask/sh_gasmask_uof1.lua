ITEM.name = "Ciężki hełm szturmowy Cataphract-M1"
ITEM.description = [[Bardzo trudna do wytworzenia seria hełmów, katafrakty,
Jest to zaadaptowana wersja hełmu OTA Suppressor.
Część wizjera została radykalnie przekształcona, aby umożliwić
do użytku przez przeciętną osobę bez konieczności stosowania implantów wzrokowych.
Pochylony, wytrzymały pancerz tego hełmu wytrzymuje uderzenia nawet
broni dużego kalibru bez ryzyka wstrząsu mózgu. Lewa strona
Układ optyczny jest podłączony do adaptacyjnego interfejsu podobnego do interfejsu hełmu Oko-M2.
Jedyną możliwą niedogodnością jest ciężar i dyskomfort noszony przez niewyszkolonego wojownika.]]
ITEM.model = Model("models/union_of_freedom/helmet.mdl")
ITEM.rarity = 2
ITEM.bodyGroups = {
	[0] = 10
}
ITEM.Filters = {
	["filter_epic"] = true,
	["filter_good"] = true,
	["filter_medium"] = true,
	["filter_standard"] = true
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 17,
	[HITGROUP_CHEST] = 0,
	[HITGROUP_STOMACH] = 0,
	[4] = 0,
	[5] = 0,
}
ITEM.WeaponSkillBuff = 3
ITEM.CPMask = false
ITEM.visorLevel = 2
ITEM.bodyGroups = {
	[3] = 2,
}
ITEM.withOutfit = true