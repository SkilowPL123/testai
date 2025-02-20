ITEM.name = "Jasnoszare spodnie"
ITEM.model = "models/willardnetworks/clothingitems/recolorable_pants.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "Zwykłe dżinsy z przymocowanymi do nich płytkami pancernymi. Część z nich jest ukryta wewnątrz materiału spodni, co oznacza, że ​​trzeba było poświęcić izolację termiczną. Ale przynajmniej odporność na kule jest minimalna, ale jest."
ITEM.slot = EQUIP_LEGS -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [2] = 1,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 2 -- (от 1 до 4)