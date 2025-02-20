ITEM.name = "Nóż"
ITEM.description = "Nóż ten został wykonany dość niechlujnie, ale z pewnością spełni swoją funkcję. Jeśli uderzysz we właściwy punkt ciała, to ta niezdarność w stworzeniu może nawet dobrze służyć, bo fragmenty tego noża pozostaną w ranie wroga."
ITEM.model = "models/weapons/tfa_nmrih/w_me_kitknife.mdl"
ITEM.class = "arccw_knife"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0.81613248586655, 207.92877197266, 8.187873840332),
	ang = Angle(0, -90, 90),
	fov = 5,
}
ITEM.Info = {
	Type = 2,
	Skill = "meleeguns",
	Dmg = {
		Attack = 1,
		Limb = 10,
		Shock = {166, 1000},
		Blood = {37, 150},
		Bleed = 95
	}
}