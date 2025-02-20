ITEM.name = "Szara czapka baseballowa"
ITEM.model = "models/willardnetworks/clothingitems/head_helmet_med.mdl"
ITEM.width = 1 -- ширина
ITEM.height = 1 -- высота
ITEM.description = "Dość gładki hełm z czerwonym krzyżem, który mógłby ochronić twoją czaszkę przed jedną lub dwiema kulami, jeśli były najmniejszego kalibru, przeleciał kilometr od ciebie, a po drodze do ciebie kule rozpadły się na małe kawałki. W innych przypadkach nikt inny, tylko Bóg ci nie pomoże."
ITEM.slot = EQUIP_HEAD -- слот ( EQUIP_MASK EQUIP_HEAD EQUIP_LEGS EQUIP_HANDS EQUIP_TORSO )
ITEM.bodyGroups = { -- какие бодигруппы на какие сетаются
	[0] = 4,
}
ITEM.CanBreakDown = false -- можно ли порвать на тряпки
ITEM.thermalIsolation = 1 -- (от 1 до 4)
ITEM.Stats = {
	[HITGROUP_GENERIC] = 0,
	[HITGROUP_HEAD] = 9,
	[HITGROUP_CHEST] = 0,
	[HITGROUP_STOMACH] = 0,
	[4] = 0,
	[5] = 0,
}