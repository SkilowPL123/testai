ITEM.name = "Kamizelka szturmowa Kataphraty-M1"
ITEM.description = [[Niezwykle ciężki zestaw bojowego pancerza, oferujący ekstremalną ochronę balistyczną. 
Wytrzymałe, obce komponenty sprawiają, że ta modyfikacja pancerza Podatników jest wyjątkowo niezawodna 
i praktycznie niezniszczalna. Dla wygody noszenia, plecy zostały wzmocnione ruchomymi metalowymi bolcami, 
które wspierają kręgosłup właściciela. Dzięki miękkiemu wypełnieniu wewnętrznej warstwy, pociski, które trafią 
w pancerz, prawie się nie fragmentują, co zmniejsza ryzyko powstawania rozległych ran szarpanych. 
Noszenie tego pancerza wymaga ogromnej siły, ale przewaga, jaką zapewnia ta modyfikacja, 
może odmienić przebieg długotrwałej bitwy.]]

ITEM.genderReplacement = {
	[GENDER_MALE] = "models/cellar/custom/ac_male.mdl",
	[GENDER_FEMALE] = "models/cellar/custom/ac_female.mdl"
}
ITEM.Stats = {
	[HITGROUP_GENERIC] = 10,
	[HITGROUP_HEAD] = 0,
	[HITGROUP_CHEST] = 20,
	[HITGROUP_STOMACH] = 15,
	[4] = 10, -- hands
	[5] = 10, -- legs
}
ITEM.RadResist = 98
ITEM.primaryVisor = Vector(0.15, 0.8, 2)
ITEM.secondaryVisor = Vector(0.15, 0.8, 2)
ITEM.rarity = 3
ITEM.thermalIsolation = 3
ITEM.model = "models/cellar/items/city3/clothing/vest_03.mdl"