ITEM.name = "Lateksowe rękawiczki"
ITEM.model = "models/willardnetworks/clothingitems/gloves_medical.mdl"
ITEM.width = 1 -- ширина
ITEM.height = 1 -- высота
ITEM.description = "Lateksowe rękawiczki przeznaczone do użytku medycznego."
ITEM.slot = EQUIP_HANDS -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [4] = 3,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 1 -- (от 1 до 4)