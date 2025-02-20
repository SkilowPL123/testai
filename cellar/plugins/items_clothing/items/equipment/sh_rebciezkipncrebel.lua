ITEM.name = "Ulepszony pancerz Rebelianta"
ITEM.model = "models/willardnetworks/clothingitems/armor01_item.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "Ulepszony pancerz rebelianta wyposażony o dodatkowe elementy pancerza, w takim pancerzu już można walczyć! Na ramieniu jest symbol rebelii"
ITEM.slot = EQUIP_TORSO -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [1] = 25,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 2 -- (от 1 до 4)
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 14,
	[HITGROUP_STOMACH] = 6,
	[4] = 6,
	[5] = 6,
}