ITEM.name = "Kamizelka żołnierza Infantryman-M1"
ITEM.description = [[Umundurowanie nieznanych zmilitaryzowanych sił, przystosowane do długotrwałego 
noszenia w warunkach bardzo mroźnej zimy. 
Sam strój składa się z kombinezonu w brązowym górskim kamuflażu, 
ciepłej bielizny termicznej oraz czarnych skórzanych butów wojskowych. 
Opancerzone elementy są pomalowane na metaliczny szary kolor, 
podobnie jak wyraźnie ciężka kamizelka kuloodporna żołnierza o wysokim poziomie ochrony. 
Do zestawu dołączone są przypinane ładownice, biały kamuflażowy płaszcz-namiot 
oraz wbudowany system podtrzymywania życia.]]

ITEM.genderReplacement = {
	[GENDER_MALE] = "models/cellar/custom/ac_male.mdl",
	[GENDER_FEMALE] = "models/cellar/custom/ac_female.mdl"
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 10,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 25,
	[HITGROUP_STOMACH] = 10,
	[4] = 6, -- hands
	[5] = 6, -- legs
}
ITEM.RadResist = 98
ITEM.primaryVisor = Vector(0.15, 0.8, 2)
ITEM.secondaryVisor = Vector(0.15, 0.8, 2)
ITEM.rarity = 3
ITEM.thermalIsolation = 3
ITEM.model = "models/cellar/items/city3/clothing/vest_02.mdl"