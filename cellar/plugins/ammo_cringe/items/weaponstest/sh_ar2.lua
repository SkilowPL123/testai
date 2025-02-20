ITEM.name = "Karabin pulsacyjny Overwatch Mk. I"
ITEM.description = "Ta broń najwyraźniej została wykonana z nieziemskich materiałów. Wytrzymały korpus, niezwykły nabój, którego nie da się złożyć rzemieślniczymi metodami i ogromna siła niszczycielska sprawiają, że ta broń jest naprawdę wspaniałym narzędziem do zabijania."
ITEM.model = "models/weapons/w_irifle.mdl"
ITEM.class = "arccw_ar2"
ITEM.weaponCategory = "primary"
ITEM.rarity = 2
ITEM.width = 4
ITEM.height = 2
ITEM.hasLock = true
ITEM.impulse = true
ITEM.iconCam = {
	pos = Vector(-9, 200, 2),
	ang = Angle(0, 270, 0),
	fov = 8.8235294117647,
}
ITEM.Attack = 18
ITEM.DistanceSkillMod = {
	[1] = 5,
	[2] = 3,
	[3] = 3,
	[4] = -2
}
ITEM.Info = {
	Type = nil,
	Skill = "impulse",
	Distance = {
		[1] = 5,
		[2] = 3,
		[3] = 3,
		[4] = -2
	},
	Dmg = {
		Attack = nil,
		AP = ITEM.Attack,
		Limb = 60,
		Shock = {90, 1500},
		Blood = {35, 350},
		Bleed = 2
	}
}


