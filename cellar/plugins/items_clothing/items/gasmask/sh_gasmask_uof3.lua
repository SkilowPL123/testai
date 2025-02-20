ITEM.name = "Standaryzowany hełm „Oko”, wersja pierwsza. (Oko-M1)"
ITEM.description = [[Ta wersja hełmu stanowi znaczący postęp w stosunku do poprzednich wersji hełmów Overwatch. Dostosowany interfejs pomocniczy wyświetla dane dotyczące stanu zdrowia właściciela, ilości amunicji, pokazuje aktualne informacje o bieżących zadaniach i wiele więcej. Podstawową zaletą jest możliwość podłączenia dodatkowej modyfikacji wizjera wspomagającej oddawanie strzałów za pomocą wbudowanego dalmierza, który oblicza trajektorię strzału przy pomocy jednego ze specjalnych czujników. Posiada znakomite parametry balistyczne, ale jest bardzo duży.]]
ITEM.model = Model("models/union_of_freedom/helmet.mdl")
ITEM.rarity = 2
ITEM.bodyGroups = {
    [0] = 7,
}
ITEM.Filters = {
    ["filter_epic"] = true,
    ["filter_good"] = true,
    ["filter_medium"] = true,
    ["filter_standard"] = true
}
ITEM.Stats = {
    [HITGROUP_GENERIC] = 0,
    [HITGROUP_HEAD] = 15,
    [HITGROUP_CHEST] = 0,
    [HITGROUP_STOMACH] = 0,
    [4] = 0,
    [5] = 0,
}
ITEM.WeaponSkillBuff = 3
ITEM.CPMask = false
ITEM.visorLevel = 2
ITEM.withOutfit = true