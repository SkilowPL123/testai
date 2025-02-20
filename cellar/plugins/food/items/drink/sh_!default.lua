local langEn = {}
local langRu = {}

langEn["iCoffee"] = "Coffee mug"
langRu["iCoffee"] = "Kubek kawy"
langEn["iCoffeeDesc"] = "A mug filled with unfiltered coffee. Something strange is floating on the surface of the coffee itself. The taste is very bitter mush."
langRu["iCoffeeDesc"] = "Kubek wypełniony nieprzefiltrowaną kawą. Na powierzchni kawy unosi się coś dziwnego. Smak jest bardzo gorzki i papkowaty."
langEn["iUBSpoiledbeer"] = "Bottle of spoiled beer"
langRu["iUBSpoiledbeer"] = "Butelka zepsutego piwa"
langEn["iUBSpoiledbeerDesc"] = "A bottle filled with light beer. It is already very old, without gas, but it tastes pretty good. Even a little intoxicates."
langRu["iUBSpoilerbeerDesc"] = "Butelka wypełniona jasnym piwem. Jest już bardzo stare, bez gazu, ale smakuje całkiem dobrze. Nawet lekko odurza."
langEn["iUBSpoiledwhiskey"] = "Bottle of spoiled whiskey"
langRu["iUBSpoiledwhiskey"] = "Butelka zepsutej whisky"
langEn["iUBSpoiledwhiskeyDesc"] = "A bottle wrapped in a thick layer of paper to hide the contents. Filled with bitter whiskey, which is almost impossible to drink, except that only for the effect of 'deja vu'"
langRu["iUBSpoilerwhiskeyDesc"] = "Butelka owinięta grubą warstwą papieru, aby ukryć zawartość. Wypełniona gorzką whisky, której praktycznie nie da się pić, chyba że dla efektu 'deja vu'."
langEn["iUBPurifiedwater"] = "Bottle of purified water"
langRu["iUBPurifiedwater"] = "Butelka oczyszczonej wody"
langEn["iUBPurifiedwaterDesc"] = "A bottle filled with water from still clean sources. It is quite tasty and 'useful', but no one has cleaned up the water completely, therefore, it is likely that it can be contaminated."
langRu["iUBPurifiedwaterDesc"] = "Butelka wypełniona wodą z wciąż czystych źródeł. Jest całkiem smaczna i 'użyteczna', ale nikt nie oczyścił jej całkowicie, dlatego prawdopodobnie może być zanieczyszczona."
langEn["iUBPrewarcanfood"] = "Pre-war canned food"
langRu["iUBPrewarcanfood"] = "Konserwy przedwojenne"
langEn["iUBPrewarcanfoodDesc"] = "Pre-war canned food, the label has long been ripped off, but judging by the consistency, there is meat inside. Holes on the sides of canned food alarm that this canned food can be spoiled."
langRu["iUBPrewarcanfoodDesc"] = "Konserwy przedwojenne, których etykieta dawno temu została zerwana, ale sądząc po konsystencji, w środku jest mięso. Dziury po bokach konserw budzą obawy, że mogą być zepsute."
langEn["iMilkcarton"] = "Milk carton"
langRu["iMilkcarton"] = "Kartonik mleka"
langEn["iMilkcartonDesc"] = "White carton with milk. Inside it is really milk - it is true, it is not cleaned and it is very much in vain. The cow, most likely, is sick. Nevertheless, this is the only milk that has at least some useful properties."
langRu["iMilkcartonDesc"] = "Biały kartonik z mlekiem. W środku naprawdę jest mleko - nieoczyszczone i o bardzo intensywnym zapachu wymienia. Krowa, najprawdopodobniej, jest chora. Mimo to jest to jedyne mleko, które ma choć trochę użytecznych właściwości."
langEn["iUBOil"] = "Old bottle of olive oil"
langRu["iUBOil"] = "Stara butelka oliwy z oliwek"
langEn["iUBOilDesc"] = "Old, tasteless, smelly olive oil, which was widely used by housewives before the war. It's almost impossible to drink, but if you try, and from this shit you can get something really useful."
langRu["iUBOilDesc"] = "Stara, bezsmakowa, śmierdząca oliwa z oliwek, szeroko używana przez gospodynie przed wojną. Prawie nie da się jej pić, ale przy odrobinie wysiłku można z niej uzyskać coś naprawdę użytecznego."
langEn["iUBOldsoda"] = "Bottle with old soda"
langRu["iUBOldsoda"] = "Butelka ze starą gazowaną wodą"
langEn["iUBOldsodaDesc"] = "Brown bottle with old soda inside. It has long been exhausted, but the sweet taste covers this unpleasant flaw."
langRu["iUBOldsodaDesc"] = "Brązowa butelka z starą gazowaną wodą w środku. Od dawna się wygazowała, ale słodki smak maskuje ten nieprzyjemny defekt."
langEn["iUBOldfastfood"] = "Old fast food"
langRu["iUBOldfastfood"] = "Stare jedzenie instant"
langEn["iUBOldfastfoodDesc"] = "Package without labels, inside there is dry noodles and sachets with condiments. The noodles themselves were slightly moldy because of the dampness, but is this a problem?"
langRu["iUBOldfastfoodDesc"] = "Opakowanie bez etykiety, w środku znajduje się suchy makaron i saszetki z przyprawami. Sam makaron jest lekko spleśniały z powodu wilgoci, ale czy to problem?"
langEn["iUBHawthorn"] = "Bottle of hawthorn"
langRu["iUBHawthorn"] = "Butelka głogu"
langEn["iUBHawthornDesc"] = "A bottle of the long-forgotten fun of the Russian people."
langRu["iUBHawthornDesc"] = "Butelka dawno zapomnianej rozrywki rosyjskiego narodu."

ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)

local ITEM = ix.item.New2("base_drink")
ITEM.name = "coffee_mug"
ITEM.PrintName = "iCoffee"
ITEM.description = "iCoffeeDesc"
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl"
ITEM.cost = 7
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 10
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "spoiled_beer"
ITEM.PrintName = "iUBSpoiledbeer"
ITEM.description = "iUBSpoiledbeerDesc"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.cost = 4
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 6
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "spoiled_whiskey"
ITEM.PrintName = "iUBSpoiledwhiskey"
ITEM.description = "iUBSpoiledwhiskeyDesc"
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 9
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "purified_water"
ITEM.PrintName = "iUBPurifiedwater"
ITEM.description = "iUBPurifiedwaterDesc"
ITEM.model = "models/props_junk/GlassBottle01a.mdl"
ITEM.cost = 18
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 20
ITEM.rarity = 1
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()

local ITEM = ix.item.New2("base_food")
ITEM.name = "pre-war_canned_food"
ITEM.PrintName = "iUBPrewarcanfood"
ITEM.description = "iUBPrewarcanfoodDesc"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.cost = 25
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 14
ITEM.dThirst = 4
ITEM.rarity = 2
ITEM.junk =  "empty_tin_can"
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "milk_carton"
ITEM.PrintName = "iMilkcarton"
ITEM.description = "iMilkcartonDesc"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.cost = 18
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 0
ITEM.dThirst = 10
ITEM.rarity = 1
ITEM.junk =  "empty_carton"
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "olive_oil"
ITEM.PrintName = "iUBOil"
ITEM.description = "iUBOilDesc"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.cost = 4
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 6
ITEM.dHunger = 2.5
ITEM.dThirst = 1.7
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "old_soda"
ITEM.PrintName = "iUBOldsoda"
ITEM.description = "iUBOldsodaDesc"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.cost = 7
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 0
ITEM.dThirst = 5.25
ITEM.rarity = 1
ITEM.junk =  "empty_plastic_bottle"
ITEM:Register()

local ITEM = ix.item.New2("base_food")
ITEM.name = "old_fast_food"
ITEM.PrintName = "iUBOldfastfood"
ITEM.description = "iUBOldfastfoodDesc"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.cost = 11
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 11
ITEM.dThirst = -2
ITEM.rarity = 1
ITEM.junk =  "empty_chinese_takeout"
ITEM:Register()

local ITEM = ix.item.New2("base_drink")
ITEM.name = "hawthorn"
ITEM.PrintName = "iUBHawthorn"
ITEM.description = "iUBHawthornDesc"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.cost = 13
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 0
ITEM.dThirst = 7.5
ITEM.rarity = 2
ITEM.junk =  "empty_glass_bottle"
ITEM:Register()