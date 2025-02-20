local langEn = {}
local langRu = {}

langEn["iUBApple"] = "Union Branded Apple"
langRu["iUBApple"] = "Unijne Jabłko"
langEn["iUBAppleDesc"] = "A red apple with a printed logo of the Universal Union on the side. It retains a fresh, fruity aroma."
langRu["iUBAppleDesc"] = "Czerwone jabłko z nadrukowanym emblematem Unii. Utrzymuje pyszny, świeży aromat."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Apple"
ITEM.PrintName = "iUBApple"
ITEM.description = "iUBAppleDesc"
ITEM.model = "models/bioshockinfinite/hext_apple.mdl"
ITEM.cost = 2
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 1
ITEM.dThirst = 0
ITEM.rarity = 1
ITEM:Register()



langEn["iUBBanana"] = "Union Branded Banana"
langRu["iUBBanana"] = "Unijny Banan"
langEn["iUBBananaDesc"] = "A deliciously-looking banana with a distinct print of the Universal Union logo. It is not as soft as a banana should be."
langRu["iUBBananaDesc"] = "Smacznie wyglądający banan z nadrukowanym emblematem Unii. Nie tak miękkie jak powinno być."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Banana"
ITEM.PrintName = "iUBBanana"
ITEM.description = "iUBBananaDesc"
ITEM.model = "models/bioshockinfinite/hext_banana.mdl"
ITEM.cost = 3
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 3
ITEM.dThirst = 0
ITEM.rarity = 1
ITEM:Register()


langEn["iUBMelon"] = "Union Branded Melon"
langRu["iUBMelon"] = "Unijny Arbuz"
langEn["iUBMelonDesc"] = "A large, green synthetic fruit consisting of a silicone shell concealing red arrowroot gel. Biting into the gel would taste somewhat reminiscent of watermelon candy, but saccharin sweet, almost uncomfortably so."
langRu["iUBMelonDesc"] = "Duży, zielony syntetyczny owoc składający się z silikonowej skorupy skrywającej czerwony żel. Żel smakuje jak cukierki arbuzowe."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Melon"
ITEM.PrintName = "iUBMelon"
ITEM.description = "iUBMelonDesc"
ITEM.model = "models/props_junk/watermelon01.mdl"
ITEM.cost = 16
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 2
ITEM.dThirst = 6
ITEM.rarity = 1
ITEM:Register()


langEn["iUBOrange"] = "Union Branded Orange"
langRu["iUBOrange"] = "Unijna Pomarańcza"
langEn["iUBOrangeDesc"] = "A delicious-looking orange with a sticker bearing the Union insignia stuck to it. It doesn't smell as fresh as its original counterpart, however."
langRu["iUBOrangeDesc"] = "Smacznie wyglądająca pomarańcza z nadrukowanym emblematem Unii. Jednakże nie pachnie tak świeżo, jak jego oryginał."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Orange"
ITEM.PrintName = "iUBOrange"
ITEM.description = "iUBOrangeDesc"
ITEM.model = "models/bioshockinfinite/hext_orange.mdl"
ITEM.cost = 2
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 0
ITEM.dHealth = 0
ITEM.rarity = 1
ITEM:Register()


langEn["iUBPear"] = "Union Branded Pear"
langRu["iUBPear"] = "Unijna Gruszka"
langEn["iUBPearDesc"] = "An deliciously-looking pear with a printed Union logo. It doesn't smell as fresh as its original counterpart, however."
langRu["iUBPearDesc"] = "Smacznie wyglądająca gruszka z nadrukowanym emblematem Unii. Jednakże nie pachnie tak świeżo, jak jego oryginał."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Pear"
ITEM.PrintName = "iUBPear"
ITEM.description = "iUBPearDesc"
ITEM.model = "models/bioshockinfinite/hext_pear.mdl"
ITEM.cost = 2
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 0
ITEM.dHealth = 0
ITEM.rarity = 1
ITEM:Register()


langEn["iUBPineapple"] = "Union Branded Pineapple"
langRu["iUBPineapple"] = "Unijny Ananas"
langEn["iUBPineappleDesc"] = "An deliciously-looking pineapple with a printed Union logo. It doesn't smell as fresh as its original counterpart, however."
langRu["iUBPineappleDesc"] = "Smacznie wyglądający ananas z nadrukowanym emblematem Unii. Jednakże nie pachnie tak świeżo, jak jego oryginał."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Pineapple"
ITEM.PrintName = "iUBPineapple"
ITEM.description = "iUBPineappleDesc"
ITEM.model = "models/bioshockinfinite/hext_pineapple.mdl"
ITEM.cost = 8
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 4
ITEM.dThirst = 4
ITEM.dHealth = 0
ITEM.rarity = 1
ITEM:Register()


langEn["iUBPotato"] = "Union Branded Potato"
langRu["iUBPotato"] = "Unijny Ziemniak"
langEn["iUBPotatoDesc"] = "A raw, uncooked potato with a distinct logo of the Universal Union. Looks like they didn't get the colouring correct."
langRu["iUBPotatoDesc"] = "Surowy ziemniak z nadrukowanym emblematem Unii. Wygląda na to, że nie udało im się oddać właściwego koloru.."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Potato"
ITEM.PrintName = "iUBPotato"
ITEM.description = "iUBPotatoDesc"
ITEM.model = "models/bioshockinfinite/hext_potato.mdl"
ITEM.cost = 3
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 2
ITEM.dHunger = 10
ITEM.dThirst = -5
ITEM.rarity = 1
ITEM:Register()

ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)