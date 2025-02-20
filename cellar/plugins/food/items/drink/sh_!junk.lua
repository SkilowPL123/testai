local langEn = {}
local langRu = {}
langEn["iEmptyCan"] = "Empty Can"
langRu["iEmptyCan"] = "Pusta puszka"
langEn["iEmptyCanDesc"] = "An empty can, its label is long gone to say what its contents once held."
langRu["iEmptyCanDesc"] = "Pusta aluminiowa puszka."


local ITEM = ix.item.New2()
ITEM.name = "Empty Can";
ITEM.PrintName = "iEmptyCan"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyCanDesc"
ITEM.cost = 1

function ITEM:GetSkin()
	return self:GetData("S", 0)
end

function ITEM:GetModel()
	return self:GetData("M", self.model)
end

ITEM:Register()


langEn["iEmptyTinCan"] = "Empty Plastic Can";
langRu["iEmptyTinCan"] = "Pusty plastikowy słoik";
langEn["iEmptyTinCanDesc"] = "An empty plastic can. It is impossible to determine what was stored in it before.";
langRu["iEmptyTinCanDesc"] = "Pusty plastikowy słoik. Wygląda na bardzo zużyty i nie sposób stwierdzić, co było w nim wcześniej przechowywane.";
local ITEM = ix.item.New2()
ITEM.name = "Empty Plastic Can";
ITEM.PrintName = "iEmptyTinCan"
ITEM.model = "models/props_lab/jar01b.mdl";
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyTinCanDesc"
ITEM.cost = 1
ITEM:Register()

langEn["iEmptyPBottle"] = "Empty Plastic Bottle";
langRu["iEmptyPBottle"] = "Pusta plastikowa butelka";
langEn["iEmptyPBottleDesc"] = "An empty plastic bottle, it's fairly big.";
langRu["iEmptyPBottleDesc"] = "Pusta plastikowa butelka o dużym rozmiarze.";
local ITEM = ix.item.New2();
ITEM.PrintName = "iEmptyPBottle"
ITEM.name = "Empty Plastic Bottle"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyPBottleDesc"
ITEM.cost = 1
ITEM:Register()

langEn["iEmptyGBottle"] = "Empty Glass Bottle";
langRu["iEmptyGBottle"] = "Pusta szklana butelka";
langEn["iEmptyGBottleDesc"] = "An empty glass bottle.";
langRu["iEmptyGBottleDesc"] = "Pusta szklana butelka, prawdopodobnie po jakimś alkoholu.";
local ITEM = ix.item.New2();
ITEM.PrintName = "iEmptyGBottle"
ITEM.name = "Empty Glass Bottle";
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl";
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyGBottleDesc";
ITEM.cost = 1

function ITEM:GetModel()
	return self:GetData("M", self.model)
end

function ITEM:OnDrop(player, position) end
ITEM:Register()

langEn["iEmptyTcan"] = "Empty Tin Can";
langRu["iEmptyTcan"] = "Pusta puszka";
langEn["iEmptyTcanDesc"] = "An empty old can, the label is worn off.";
langRu["iEmptyTcanDesc"] = "Stara, pusta puszka, z wymazanymi wszystkimi napisami.";
local ITEM = ix.item.New2();
ITEM.PrintName = "iEmptyTcan"
ITEM.name = "Empty Tin Can";
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyTcanDesc";
ITEM.cost = 1

function ITEM:GetModel()
	return self:GetData("M", self.model)
end

ITEM:Register()

langEn["iEmptyMCarton"] = "Empty Carton";
langRu["iEmptyMCarton"] = "Puste opakowania tekturowe";
langEn["iEmptyMCartonDesc"] = "An empty carton."
langRu["iEmptyMCartonDesc"] = "Pusty karton po mleku.";
local ITEM = ix.item.New2()
ITEM.PrintName = "iEmptyMCarton"
ITEM.name = "Empty Carton"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyMCartonDesc"
ITEM.cost = 1

function ITEM:GetModel()
	return self:GetData("M", self.model)
end
ITEM:Register()

langEn["iEmptyJug"] = "Empty Jug";
langRu["iEmptyJug"] = "Pusty plastikowy dzbanek";
langEn["iEmptyJugDesc"] = "An empty jug."
langRu["iEmptyJugDesc"] = "Pusty plastikowy pojemnik na mleko.";
local ITEM = ix.item.New2()
ITEM.PrintName = "iEmptyJug"
ITEM.name = "Empty Jug"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl";
ITEM.width = 1
ITEM.height = 1
ITEM.business = false;
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyJugDesc"
ITEM.cost = 1
function ITEM:GetModel()
	return self:GetData("M", self.model)
end
ITEM:Register()

langEn["iEmptyChinese"] = "Empty Chinese Takeout"
langRu["iEmptyChinese"] = "Puste pudełko tekturowe"
langEn["iEmptyChineseDesc"] = "An empty cardboard container."
langRu["iEmptyChineseDesc"] = "Puste tekturowe pudełko po chińskim makaronie."
local ITEM = ix.item.New2()
ITEM.name = "Empty Chinese Takeout"
ITEM.PrintName = "iEmptyChinese"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "categoryJunk"
ITEM.description = "iEmptyChineseDesc"
ITEM.cost = 1
ITEM:Register()

ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)