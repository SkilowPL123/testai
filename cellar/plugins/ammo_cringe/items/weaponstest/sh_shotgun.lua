ITEM.name = "SPAS-12"
ITEM.description = "Standardowa strzelba używana przez siły Ochrony Cywilnej do walki na krótkim dystansie. Naboje użyte w tej strzelbie posiadają dużą ilość śrutu, który jest w stanie dosięgnąć wroga nawet na duże odległości, jednak będzie to kosztować małą siłą rażenia. W przeciwnym razie jest to idealna broń do zabicia tych, którzy zdecydują się przetestować Cię z bliskiej odległości."
ITEM.model = "models/weapons/w_shotgun.mdl"
ITEM.class = "arccw_spas12"
ITEM.weaponCategory = "primary"
ITEM.classes = {CLASS_EOW}
ITEM.width = 3
ITEM.height = 1
ITEM.iconCam = {
    pos = Vector(0, 200, 1),
    ang = Angle(0, 270, 0),
    fov = 10
}

ITEM.Attack = 9
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
		Limb = 34,
		Shock = {555, 25000},
		Blood = {250, 500},
		Bleed = 75
	}
}