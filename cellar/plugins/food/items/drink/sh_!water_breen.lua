local langEn = {}
local langRu = {}

langEn["iBreenWater"] = "Breen's Water"
langRu["iBreenWater"] = "Woda Breena"
langEn["iBreenWaterDesc"] = "A blue aluminium union branded can, it swishes when you shake it."
langRu["iBreenWaterDesc"] = "Niebieska aluminiowa puszka z logo Unii; jeśli nią potrząśniesz, usłyszysz syk gazu."

langEn["iSmoothBreenWater"] = "Smooth Breen's Water"
langRu["iSmoothBreenWater"] = "Aromatyczna woda Breena"
langEn["iSmoothBreenWaterDesc"] = "A red aluminium union branded can, it swishes when you shake it."
langRu["iSmoothBreenWaterDesc"] = "Czerwona aluminiowa puszka z logo Unii; jeśli nią potrząśniesz, usłyszysz syk gazu."

langEn["iSpecialBreenWater"] = "Special Breen's Water"
langRu["iSpecialBreenWater"] = "Specjalna woda Breena"
langEn["iSpecialBreenWaterDesc"] = "A yellow aluminium union branded can, it swishes when you shake it."
langRu["iSpecialBreenWaterDesc"] = "Żółta aluminiowa puszka z logo Unii; jeśli nią potrząśniesz, usłyszysz syk gazu."

-- watercollector water lang
langEn["iWCan"] = "Can with water"
langRu["iWCan"] = "Puszka z wodą"
langEn["iWCanDesc"] = "An old can with rain water inside of it."
langRu["iWCanDesc"] = "Stara puszka wypełniona wodą."

langEn["iWPB"] = "Plastic bottle of water"
langRu["iWPB"] = "Plastikowa butelka z wodą"
langEn["iWPBDesc"] = "An old plastic bottle with rain water inside of it."
langRu["iWPBDesc"] = "Stara plastikowa butelka wypełniona wodą."

langEn["iWPJ"] = "Plastic jar of water"
langRu["iWPJ"] = "Plastikowy pojemnik z wodą"
langEn["iWPJDesc"] = "An old plastic jar with rain water inside of it."
langRu["iWPJDesc"] = "Stary plastikowy pojemnik wypełniony wodą."

langEn["iWTC"] = "Tin can of water"
langRu["iWTC"] = "Konserwowa puszka z wodą"
langEn["iWTCDesc"] = "An old tin can with rain water inside of it."
langRu["iWTCDesc"] = "Stara puszka konserwowa wypełniona wodą."

--watercollector items
local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Can with Water"
	ITEM.PrintName = "iWCan"
	ITEM.description = "iWCanDesc"
	ITEM.model = "models/props_junk/popcan01a.mdl"
	ITEM.cost = 4
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 10
	ITEM.dHealth = 0
	ITEM.junk = "empty_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Plastic Bottle of Water"
	ITEM.PrintName = "iWPB"
	ITEM.description = "iWPBDesc"
	ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
	ITEM.cost = 5
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 12
	ITEM.dHealth = 0
	ITEM.junk = "empty_plastic_bottle"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Plastic Jar of Water"
	ITEM.PrintName = "iWPJ"
	ITEM.description = "iWPJDesc"
	ITEM.model = "models/props_lab/jar01b.mdl"
	ITEM.cost = 5
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 12
	ITEM.dHealth = 0
	ITEM.junk = "empty_plastic_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Tin Can of Water"
	ITEM.PrintName = "iWTC"
	ITEM.description = "iWTCDesc"
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
	ITEM.cost = 4
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 10
	ITEM.dHealth = 0
	ITEM.junk = "empty_tin_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()
--watercollector items end

local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Breen's Water"
	ITEM.PrintName = "iBreenWater"
	ITEM.description = "iBreenWaterDesc"
	ITEM.model = "models/props_junk/popcan01a.mdl"
	ITEM.cost = 4
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 10
	ITEM.dHealth = 0
	ITEM.junk = "empty_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Smooth Breen's Water"
	ITEM.PrintName = "iSmoothBreenWater"
	ITEM.description = "iSmoothBreenWaterDesc"
	ITEM.model = "models/props_junk/popcan01a.mdl"
	ITEM.skin = 1
	ITEM.cost = 10
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 20
	ITEM.dHealth = 0
	ITEM.rarity = 1
	ITEM.junk = "empty_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()


local ITEM = ix.item.New2("base_drink")
	ITEM.name = "Special Breen's Water"
	ITEM.PrintName = "iSpecialBreenWater"
	ITEM.description = "iSpecialBreenWaterDesc"
	ITEM.model = "models/props_junk/popcan01a.mdl"
	ITEM.skin = 2
	ITEM.cost = 25
	ITEM.width = 1
	ITEM.height = 1
	ITEM.dUses = 5
	ITEM.dHunger = 0
	ITEM.dThirst = 30
	ITEM.dHealth = 0
	ITEM.rarity = 2
	ITEM.junk = "empty_can"

	function ITEM:OnConsume(player)
		player:SetCharacterData("stamina", 100)
	end
ITEM:Register()

ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)
