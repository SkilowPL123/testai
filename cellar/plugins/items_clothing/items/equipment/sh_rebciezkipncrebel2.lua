ITEM.name = "Ciężki pancerz rebelianta"
ITEM.model = "models/willardnetworks/clothingitems/armor03_item.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "Ciężki pancerz zrobiony ze świeżo wyprodukowanej kamizelki CP oraz z dodatkami i malowaniami rebelii."
ITEM.slot = EQUIP_TORSO -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [1] = 26,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 2 -- (от 1 до 4)
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 17,
	[HITGROUP_STOMACH] = 15,
	[4] = 8,
	[5] = 8,
}