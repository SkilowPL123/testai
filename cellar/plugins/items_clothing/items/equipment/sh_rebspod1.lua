ITEM.name = "Zielone spodnie z płytami pancernymi"
ITEM.model = "models/willardnetworks/clothingitems/legs_rebel1.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "Zwykłe dżinsy z przymocowanymi do nich płytkami pancernymi. Część z nich jest ukryta wewnątrz materiału spodni, co oznacza, że ​​trzeba było poświęcić izolację termiczną. Ale przynajmniej odporność na kule jest minimalna, ale jest."
ITEM.slot = EQUIP_LEGS -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [2] = 2,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 1 -- (от 1 до 4)
ITEM.Stats = {
    [HITGROUP_GENERIC] = 0,
    [HITGROUP_HEAD] = 0,
    [HITGROUP_CHEST] = 0,
    [HITGROUP_STOMACH] = 0,
    [4] = 0,
    [5] = 5,
}