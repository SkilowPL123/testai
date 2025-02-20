ITEM.name = "Lekki karabin pulsacyjny CCA"
ITEM.description = "Karabin otrzymany przez funkcjonariuszy CP od Kombinatu. Bardzo ergonomiczna i niezawodna broń."
ITEM.model = "models/weapons/w_ordinalrifle.mdl"
ITEM.class = "arccw_rifle"
ITEM.weaponCategory = "primary"
ITEM.rarity = 3
ITEM.width = 3
ITEM.height = 2
ITEM.hasLock = true
ITEM.impulse = true
ITEM.iconCam = {
	pos = Vector(8.0824689865112, 132.81428527832, 2.4763200283051),
	ang = Angle(0, 270, 0),
	fov = 11.867155482201,
}
ITEM.Attack = 12
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
		Shock = {100, 1900},
		Blood = {30, 360},
		Bleed = 5
	}
}


