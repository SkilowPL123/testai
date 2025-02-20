ITEM.name = "Czarna kurtka"
ITEM.model = "models/willardnetworks/clothingitems/torso_rebelmedic.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "Biała koszula z namalowanym czerwonym krzyżem i wszytymi w środku płytkami, za bardzo nie ochroni ale zawsze coś."
ITEM.slot = EQUIP_TORSO -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [1] = 12,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 2 -- (от 1 до 4)
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 7,
	[HITGROUP_STOMACH] = 3,
	[4] = 0,
	[5] = 0,
}