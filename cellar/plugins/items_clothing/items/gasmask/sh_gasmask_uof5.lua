ITEM.name = "Maska Oficera Ochrony Cywilnej"
ITEM.description = [[Nieco ulepszony hełm-maska, obecnie używany przez Ochronę Cywilną. Obsługuje adaptacyjny interfejs pomocniczy i jest odporny na trafienia z broni lekkiego kalibru. Skradzione lub zabrane z ciała nieznanego funkcjonariusza. Ten egzemplarz jest pomalowany na ciemnoszary kolor.]]
ITEM.model = Model("models/union_of_freedom/helmet2.mdl")
ITEM.rarity = 2
ITEM.bodyGroups = {
    [0] = 6,
}
ITEM.Filters = {
    ["filter_epic"] = false,
    ["filter_good"] = true,
    ["filter_medium"] = true,
    ["filter_standard"] = true
}
ITEM.Stats = {
    [HITGROUP_GENERIC] = 0,
    [HITGROUP_HEAD] = 10,
    [HITGROUP_CHEST] = 0,
    [HITGROUP_STOMACH] = 0,
    [4] = 0,
    [5] = 0,
}
ITEM.WeaponSkillBuff = 3
ITEM.CPMask = false
ITEM.visorLevel = 2
ITEM.withOutfit = true