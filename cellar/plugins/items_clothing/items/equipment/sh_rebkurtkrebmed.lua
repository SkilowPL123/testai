ITEM.name = "Biała kurtka rebelianta z kamizelką kuloodporną i czerwonym krzyżem"
ITEM.model = "models/willardnetworks/clothingitems/torso_rebelmedic.mdl"
ITEM.width = 2 -- ширина
ITEM.height = 2 -- высота
ITEM.description = "kamizelka kuloodporna sił Ochrony Cywilnej, odebrana jednemu z zabitych Funkcjonariuszy."
ITEM.slot = EQUIP_TORSO -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
    [1] = 9,
}
ITEM.CanBreakDown = true -- можно ли порвать на тряпки
ITEM.thermalIsolation = 2 -- (от 1 до 4)
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 10,
	[HITGROUP_STOMACH] = 4,
	[4] = 0,
	[5] = 0,
}