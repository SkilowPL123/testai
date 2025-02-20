ITEM.name = "Rewolwer .357"
ITEM.description = "Rewolwer \"Colt Python\" kalibru .357. Jest starannie zadbany i wypolerowany, dlatego na jego krawędziach widać zarówno własne odbicie, jak i odbicie swoich wrogów. Strzela głośno i szybko zabija, jednak mała pojemność bębna sprawia, że ​​jest to broń bardziej na pokaz niż broń przydatna."
ITEM.model = "models/weapons/tfa_mmod/w_357.mdl"
ITEM.class = "arccw_357"
ITEM.weaponCategory = "secondary"
ITEM.rarity = 2
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(3.7, 180, -1.5),
	ang = Angle(0, 270, 0),
	fov = 6.4705882352941,
}
ITEM.Attack = 14
ITEM.DistanceSkillMod = {
	[1] = 5,
	[2] = 0,
	[3] = -2,
	[4] = -5
}
ITEM.Info = {
	Type = nil,
	Skill = "guns",
	Distance = {
		[1] = 5,
		[2] = 0,
		[3] = -2,
		[4] = -5
	},
	Dmg = {
		Attack = nil,
		AP = ITEM.Attack,
		Limb = 120,
		Shock = {100, 3000},
		Blood = {75, 750},
		Bleed = 95
	}
}


