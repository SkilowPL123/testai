local langEn = {}
local langRu = {}

-- iUBChocolate
langEn["iUBChocolate"] = "Union Branded Chocolate"
langRu["iUBChocolate"] = "Unijna Czekolada"
langEn["iUBChocolateDesc"] = "A carefully packaged bar of chocolate approved by the Universal Union. The distinct Union logo is printed on the top."
langRu["iUBChocolateDesc"] = "Starannie zapakowana tabliczka czekolady zatwierdzona przez Unie. Emblemat Unii jest wyraźnie nadrukowany z przodu."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Chocolate"
ITEM.PrintName = "iUBChocolate"
ITEM.description = "iUBChocolateDesc"
ITEM.model = "models/bioshockinfinite/hext_candy_chocolate.mdl"
ITEM.cost = 9
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 2.5
ITEM.dHealth = 0

ITEM.rarity = 2
ITEM:Register()


-- iUBBread
langEn["iUBBread"] = "Union Branded Bread Loaf"
langRu["iUBBread"] = "Unijny Bochenek Chleba"
langEn["iUBBreadDesc"] = "A nice loaf of bread with a mark of the Universal Union. It has a dreadful aura about it."
langRu["iUBBreadDesc"] = "Dobry bochenek chleba ze znakiem Unii."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Bread"
ITEM.PrintName = "iUBBread"
ITEM.description = "iUBBreadDesc"
ITEM.model = "models/bioshockinfinite/dread_loaf.mdl"
ITEM.cost = 8
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 5
ITEM.dThirst = -2

ITEM.rarity = 1
ITEM:Register()


-- iUBFlakes
langEn["iUBFlakes"] = "Union Branded Bran Flakes"
langRu["iUBFlakes"] = "Unijne Płatki Zbożowe"
langEn["iUBFlakesDesc"] = "A carefully packaged brown box containing bran flakes approved by the Universal Union. The Union logo is present on the front."
langRu["iUBFlakesDesc"] = "Starannie zapakowane brązowe pudełko zawierające płatki śniadaniowe. Logo Unii jest nadrukowane na przedniej stronie."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Bran Flakes"
ITEM.PrintName = "iUBFlakes"
ITEM.description = "iUBBreadDesc"
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl"
ITEM.cost = 9
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 6
ITEM.dThirst = -3

ITEM.rarity = 1
ITEM:Register()


-- iUBTakeout
langEn["iUBTakeout"] = "Union Branded Chinese Takeout"
langRu["iUBTakeout"] = "Unijny makaron"
langEn["iUBTakeoutDesc"] = "A nearly-square cardboard container with some chow mein and orange chicken inside. The noodles are rather dry, and the chicken tastes like silicone..."
langRu["iUBTakeoutDesc"] = "Prawie kwadratowy, tekturowy pojemnik z chow mein i kurczakiem w sosie pomarańczowym w środku. Makaron jest raczej suchy, a kurczak smakuje jak silikon..."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Chinese Takeout"
ITEM.PrintName = "iUBTakeout"
ITEM.description = "iUBTakeoutDesc"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.cost = 10
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 10
ITEM.dThirst = -2

ITEM.junk = "empty_chinese_takeout"
ITEM.rarity = 1
ITEM:Register()


-- iUBMilkCarton
langEn["iUBMilkCarton"] = "Union Branded Milk Carton"
langRu["iUBMilkCarton"] = "Unijny karton mleka"
langEn["iUBMilkCartonDesc"] = "A carton filled with slightly chunky-tasting synthetic milk. Somewhat unappetizing, but a decent source of calcium..."
langRu["iUBMilkCartonDesc"] = "Kartonowe opakowanie wypełnione syntetycznym mlekiem. Trochę nieapetyczne, ale to dobry zastrzyk wapnia..."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Union Branded Milk Carton"
ITEM.PrintName = "iUBMilkCarton"
ITEM.description = "iUBMilkCartonDesc"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.cost = 21
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 1
ITEM.dThirst = 8

ITEM.junk = "empty_carton"
ITEM.rarity = 2
ITEM:Register()


-- iUBMilkJug
langEn["iUBMilkJug"] = "Union Branded Milk Jug"
langRu["iUBMilkJug"] = "Unijny dzban mleka"
langEn["iUBMilkJugDesc"] = "A jug filled with slightly chunky-tasting synthetic milk. Somewhat unappetizing, but a decent source of calcium..."
langRu["iUBMilkJugDesc"] = "Zamknięty, plastikowy dzbanek z uchwytem, wypełniony syntetycznym mlekiem. Trochę nieapetyczne, ale to dobry zastrzyk wapnia..."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Union Branded Milk Jug"
ITEM.PrintName = "iUBMilkJug"
ITEM.description = "iUBMilkJugDesc"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.cost = 17
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 10

ITEM.junk = "empty_jug"
ITEM.rarity = 2
ITEM:Register()


-- iUBSardines
langEn["iUBSardines"] = "Union Branded Sardines"
langRu["iUBSardines"] = "Unijne sardynki"
langEn["iUBSardinesDesc"] = "A can with fishlike contents supposed to represent sardines. The fish-flavoured replacement makes you ponder if it truly is fish."
langRu["iUBSardinesDesc"] = "Puszka z rybną zawartością, rzekomo sardynkami. Ich rybopodobny smak skłania do zastanowienia się, czy to naprawdę ryba."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Sardines"
ITEM.PrintName = "iUBSardines"
ITEM.description = "iUBSardinesDesc"
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl"
ITEM.cost = 18
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 4
ITEM.dHunger = 15
ITEM.dThirst = 0

ITEM.rarity = 2
ITEM:Register()


-- iUBCrisps
langEn["iUBCrisps"] = "Union Branded Crisps"
langRu["iUBCrisps"] = "Unijne chipsy"
langEn["iUBCrispsDesc"] = "A small, flimsy package with a printed logo of the Universal Union. The inscription reads 'Lightly Salted Union Crisps'"
langRu["iUBCrispsDesc"] = "Niewielka, nadmuchana paczka z nadrukowanym logo Unii. Napis głosi: „Lekko solone chipsy Unii"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Crisps"
ITEM.PrintName = "iUBCrisps"
ITEM.description = "iUBCrispsDesc"
ITEM.model = "models/bioshockinfinite/bag_of_hhips.mdl"
ITEM.cost = 11
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 3.75
ITEM.dThirst = 0

ITEM.rarity = 1
ITEM:Register()


-- iUBCheeseWheel
langEn["iUBCheeseWheel"] = "Union Branded Cheese Wheel"
langRu["iUBCheeseWheel"] = "Unijny ser"
langEn["iUBCheeseWheelDesc"] = "A delicious wheel of union-approved cheese. It has a strong artificial smell of cheese, whew!"
langRu["iUBCheeseWheelDesc"] = "Smaczne koło sera zatwierdzonego przez Unii. Ma intensywny, sztuczny zapach sera!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Cheese Wheel"
ITEM.PrintName = "iUBCheeseWheel"
ITEM.description = "iUBCheeseWheelDesc"
ITEM.model = "models/bioshockinfinite/pound_cheese.mdl"
ITEM.cost = 12
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 5

ITEM.rarity = 2
ITEM:Register()


-- iUBCornCob
langEn["iUBCornCob"] = "Union Branded Corn Cob"
langRu["iUBCornCob"] = "Unijna kukurydza"
langEn["iUBCornCobDesc"] = "A cob of corn with a stamped logo of the Universal Union. An artificial smell of corn surrounds it."
langRu["iUBCornCobDesc"] = "Kukurydza z pieczęcią Unii. Ma sztuczny zapach."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Corn Cob"
ITEM.PrintName = "iUBCornCob"
ITEM.description = "iUBCornCobDesc"
ITEM.model = "models/bioshockinfinite/porn_on_cob.mdl"
ITEM.cost = 7
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 6
ITEM.dThirst = 0

ITEM.rarity = 1
ITEM:Register()


-- iUBPeanuts
langEn["iUBPeanuts"] = "Union Branded Bag of Peanuts"
langRu["iUBPeanuts"] = "Unijna orzeszki ziemne"
langEn["iUBPeanutsDesc"] = "A bag of salted peanuts. The Universal Union logo has been printed on both sides of the package."
langRu["iUBPeanutsDesc"] = "Saszetka solonych orzeszków ziemnych. Znak Unii wydrukowany jest po obu stronach opakowania."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Bag of Peanuts"
ITEM.PrintName = "iUBPeanuts"
ITEM.description = "iUBPeanutsDesc"
ITEM.model = "models/bioshockinfinite/rag_of_peanuts.mdl"
ITEM.cost = 2
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = -0.2

ITEM.rarity = 1
ITEM:Register()


-- iUBPopcorn
langEn["iUBPopcorn"] = "Union Branded Popcorn"
langRu["iUBPopcorn"] = "Unijny popcorn"
langEn["iUBPopcornDesc"] = "An open box of popcorn fabricated under the regulations of the Universal Union. Something's about to go down."
langRu["iUBPopcornDesc"] = "Otwarta paczka popcornu, przygotowana zgodnie ze standardami Unii."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Popcorn"
ITEM.PrintName = "iUBPopcorn"
ITEM.description = "iUBPopcornDesc"
ITEM.model = "models/bioshockinfinite/topcorn_bag.mdl"
ITEM.cost = 3
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 1.25
ITEM.dThirst = 0

ITEM.rarity = 1
ITEM:Register()


-- iUBInstantPotatos
langEn["iUBInstantPotatos"] = "Union Branded Instant Potatos"
langRu["iUBInstantPotatos"] = "Unijne konserwy"
langEn["iUBInstantPotatosDesc"] = "A tin can with a stamped logo of the Universal Union, filled with brown baked potatos in tomato sauce."
langRu["iUBInstantPotatosDesc"] = "Puszka z oznaczeniem Unii, wypełniona brązowymi pieczonymi ziemniakami w sosie pomidorowym."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Union Branded Instant Potatos"
ITEM.PrintName = "iUBInstantPotatos"
ITEM.description = "iUBInstantPotatosDesc"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.cost = 10
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 8
ITEM.dThirst = 1

ITEM.junk = "empty_tin_can"
ITEM.rarity = 1
ITEM:Register()


-- iMinimalSupplements
langEn["iMinimalSupplements"] = "Minimal Supplements"
langRu["iMinimalSupplements"] = "Minimalna racja żywnościowa"
langEn["iMinimalSupplementsDesc"] = "A vacuum-packed package containing a thick porridge-like substance. It is brown, has a heavy taste of salt and a plastic spoon is packed alongside it. There is just enough to keep one alive in terms of calories."
langRu["iMinimalSupplementsDesc"] = "Pakowana próżniowo paczka zawierająca gęstą papkę. Ma brązowy kolor i silnie słony smak. Dołączono plastikową łyżkę. Wystarczy tego, by przeżyć."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Minimal Supplements"
ITEM.PrintName = "iMinimalSupplements"
ITEM.description = "iMinimalSupplementsDesc"
ITEM.model = "models/gibs/props_canteen/vm_sneckol.mdl"
ITEM.cost = 14
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 14
ITEM.dThirst = 0
ITEM:Register()


-- iCitizenSupplements
langEn["iCitizenSupplements"] = "Citizen Supplements"
langRu["iCitizenSupplements"] = "Racja żywnościowa dla obywatela"
langEn["iCitizenSupplementsDesc"] = "A normal-sized bag containing a thick porridge-like substance. It is brown, has a heavy taste of salt and a plastic spoon is packed alongside it. There is an alright amount inside."
langRu["iCitizenSupplementsDesc"] = "Niewielkie opakowanie zawierające gęstą papkę w brązowym kolorze o silnie słonym smaku. Dołączono plastikową łyżkę. Jest tu wystarczająco dużo tej papki."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Citizen Supplements"
ITEM.PrintName = "iCitizenSupplements"
ITEM.description = "iCitizenSupplementsDesc"
ITEM.model = "models/mres/consumables/tag_mre.mdl"
ITEM.cost = 20
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 20
ITEM.dThirst = 0
ITEM:Register()


-- iLoyalistSupplements
langEn["iLoyalistSupplements"] = "Loyalist Supplements"
langRu["iLoyalistSupplements"] = "Lojalistyczna racja żywnościowa"
langEn["iLoyalistSupplementsDesc"] = "A normal-sized bag containing a thin gruel, with chunks of what appear to be meat; though, upon closer inspection, it is clearly synthetic. It happens to also come with a little plastic spork. There are also three small cracker bread pieces and a bar of Union chocolate."
langRu["iLoyalistSupplementsDesc"] = "Niewielkie opakowanie zawierające rzadką kaszę z kawałkami mięsa, chociaż przy bliższej analizie jest wyraźnie syntetyczne. W zestawie znajduje się plastikowa łyżka. Są również trzy niewielkie kromki chleba i tabliczka Unijnej czekolady."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Loyalist Supplements"
ITEM.PrintName = "iLoyalistSupplements"
ITEM.description = "iLoyalistSupplementsDesc"
ITEM.model = "models/mres/consumables/pag_mre.mdl"
ITEM.cost = 31
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 25
ITEM.dThirst = 0
ITEM.rarity = 1
ITEM:Register()


-- iCPSupplements
langEn["iCPSupplements"] = "Civil Protection Supplements"
langRu["iCPSupplements"] = "Racja żywnościowa \"Ochrony Cywilnej\""
langEn["iCPSupplementsDesc"] = [[A large cardboard box that almost resembles that of a pre-war microwave dinner. 
There is a foil tin inside containing a choice of mutton, chicken or beef stew, with rice mixed into it and a full set of plastic cutlery. 
A small tub of assorted nuts is provided, as well as two chalky, white caffeine pills in a plastic packet. 
A sealed packet of crackers is separate, with a well sized tube of chocolate paste to spread onto them.]]
langRu["iCPSupplementsDesc"] = [[Duże kartonowe pudełko, niemal przypominające przedwojenny obiad do mikrofalówki. 
W środku znajduje się tacka foliowa z kawałkiem baraniny, kurczaka lub wołowiny, wymieszaną z ryżem, oraz pełnym zestawem plastikowych sztućców. 
Dołączono niewielką saszetkę z różnymi orzechami, a także dwie tabletki z kofeiną w plastikowym opakowaniu. 
Zapieczętowana paczka krakersów z porcją czekoladowej pasty w zestawie.]]
local ITEM = ix.item.New2("base_food")
ITEM.name = "Civil Protection Supplements"
ITEM.PrintName = "iCPSupplements"
ITEM.description = "iCPSupplementsDesc"
ITEM.model = "models/mres/consumables/zag_mre.mdl"
ITEM.cost = 37
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 30
ITEM.dThirst = 0
ITEM.rarity = 1
ITEM:Register()


-- iUBSushi
langEn["iUBSushi"] = "Sushi set"
langRu["iUBSushi"] = "Unijny zestaw sushi"
langEn["iUBSushiDesc"] = "Not fresh at first sight, but looks tasty."
langRu["iUBSushiDesc"] = "Na pierwszy rzut oka nie wygląda zbyt świeżo, ale jest dość apetyczny."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Sushi Set"
ITEM.PrintName = "iUBSushi"
ITEM.description = "iUBSushiDesc"
ITEM.model = "models/sushipack/fisheggsushi01.mdl"
ITEM.cost = 25
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 20
ITEM.dThirst = 0
ITEM.rarity = 1
ITEM:Register()


-- iUBSake
langEn["iUBSake"] = "Sake bottle"
langRu["iUBSake"] = "Sake"
langEn["iUBSakeDesc"] = "A usual bottle of sake, a bit dusty."
langRu["iUBSakeDesc"] = "Zwyczajna butelka sake, nieco zakurzona."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Sake"
ITEM.PrintName = "iUBSake"
ITEM.description = "iUBSakeDesc"
ITEM.model = "models/foodnhouseholditems/champagne3.mdl"
ITEM.cost = 30
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 20
ITEM.rarity = 3
ITEM:Register()


-- iUBKebab
langEn["iUBKebab"] = "Kebab"
langRu["iUBKebab"] = "Kebab"
langEn["iUBKebabDesc"] = "Not fresh at first sight, but looks tasty."
langRu["iUBKebabDesc"] = "Na pierwszy rzut oka nie wygląda zbyt świeżo, ale jest dość apetyczne."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Kebab"
ITEM.PrintName = "iUBKebab"
ITEM.description = "iUBKebabDesc"
ITEM.model = "models/foodnhouseholditems/chicken_wrap.mdl"
ITEM.cost = 11
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 2
ITEM.dHunger = 30
ITEM.dThirst = -2.5
ITEM:Register()


-- iUBLobster
langEn["iUBLobster"] = "Fried Lobster"
langRu["iUBLobster"] = "Unijny smażony homar"
langEn["iUBLobsterDesc"] = "Fried lobster's meat, smells tasty."
langRu["iUBLobsterDesc"] = "Smażone mięso homara, pachnie smakowicie."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Fried Lobster"
ITEM.PrintName = "iUBLobster"
ITEM.description = "iUBLobsterDesc"
ITEM.model = "models/foodnhouseholditems/lobster2.mdl"
ITEM.cost = 28
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 20
ITEM.dThirst = 4

ITEM.rarity = 1
ITEM:Register()


-- iUBFriedmeat
langEn["iUBFriedmeat"] = "Fried Meat"
langRu["iUBFriedmeat"] = "Unijne smażone mięso"
langEn["iUBFriedmeatDesc"] = "Spiced meat, looks fried."
langRu["iUBFriedmeatDesc"] = "Mięso pokryte przyprawami, wygląda na usmażone."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Fried Meat"
ITEM.PrintName = "iUBFriedmeat"
ITEM.description = "iUBFriedmeatDesc"
ITEM.model = "models/foodnhouseholditems/steak2.mdl"
ITEM.cost = 32
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 24
ITEM.dThirst = 3

ITEM.rarity = 1
ITEM:Register()


-- iUBCockCoco
langEn["iUBCockCoco"] = "Coconut Cocktail"
langRu["iUBCockCoco"] = "Koktajl z kokosa"
langEn["iUBCockCocoDesc"] = "There is a cocktail in the coconut itself, a tube with an umbrella also sticks out of it."
langRu["iUBCockCocoDesc"] = "We wnętrzu kokosa znajduje się koktajl, a z niego wystaje słomka z parasolką."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Coconut Cocktail"
ITEM.PrintName = "iUBCockCoco"
ITEM.description = "iUBCockCocoDesc"
ITEM.model = "models/foodnhouseholditems/coconut_drink.mdl"
ITEM.cost = 30
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 24

ITEM.rarity = 2
ITEM:Register()


-- iUBPapple
langEn["iUBPapple"] = "Pineapple Cocktail"
langRu["iUBPapple"] = "Koktajl z ananasa"
langEn["iUBPappleDesc"] = "There is a cocktail in the pineapple itself, a tube with an umbrella also sticks out of it."
langRu["iUBPappleDesc"] = "We wnętrzu ananasa znajduje się koktajl, a z niego wystaje słomka z parasolką."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Pineapple Cocktail"
ITEM.PrintName = "iUBPapple"
ITEM.description = "iUBPineapplecocktailDesc"
ITEM.model = "models/foodnhouseholditems/pineapple_drink.mdl"
ITEM.cost = 30
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 24

ITEM.rarity = 2
ITEM:Register()


-- iUBSpahnetti
langEn["iUBSpahnetti"] = "Spagnetti"
langRu["iUBSpahnetti"] = "Spaghetti"
langEn["iUBSpahnettiDesc"] = "Nice and tasty spagnetti, no one touched it!"
langRu["iUBSpahnettiDesc"] = "Wyśmienite spaghetti na talerzu, nikt ich jeszcze nie tknął!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Spagnetti"
ITEM.PrintName = "iUBSpahnetti"
ITEM.description = "iUBSpahnettiDesc"
ITEM.model = "models/bowlofspaghetti01/bowlofspaghetti01.mdl"
ITEM.cost = 20
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 10
ITEM.dThirst = 0
ITEM:Register()


-- iUBPasta
langEn["iUBPasta"] = "Pasta"
langRu["iUBPasta"] = "Makaron"
langEn["iUBPastaDesc"] = "Pasta with some ketchup on it and spices."
langRu["iUBPastaDesc"] = "Makaron z odrobiną ketchupu i przyprawami."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Pasta"
ITEM.PrintName = "iUBPasta"
ITEM.description = "iUBPastaDesc"
ITEM.model = "models/pennepasta01/pennepasta01.mdl"
ITEM.cost = 20
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 10
ITEM.dThirst = 0
ITEM:Register()


-- iUBChocotail
-- Uwaga: w oryginale langEn i langRu są odwrócone dla nazwy.
langEn["iUBChocotail"] = "Czekoladowy koktajl"
langRu["iUBChocotail"] = "Czekoladowy koktajl"
langEn["iUBChocotailDesc"] = "Koktajl zrobiony z czekoladowej formy, w środku znajduje się śmietanka i wiśnia."
langRu["iUBChocotailDesc"] = "Koktajl zrobiony z czekoladowej formy, w środku znajduje się śmietanka i wiśnia."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Chocolate cocktail"
ITEM.PrintName = "iUBChocotail"
ITEM.description = "iUBChocotailDesc"
ITEM.model = "models/chocolateshake01/chocolateshake01.mdl"
ITEM.cost = 25
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 2
ITEM.dThirst = 20

ITEM.rarity = 2
ITEM:Register()


-- iUBChampagne
langEn["iUBChampagne"] = "Champagne"
langRu["iUBChampagne"] = "Szampan"
langEn["iUBChampagneDesc"] = "Big bottle with yellow liquid inside of it."
langRu["iUBChampagneDesc"] = "Duża butelka z żółtawym płynem w środku."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Champagne"
ITEM.PrintName = "iUBChampagne"
ITEM.description = "iUBChampagneDesc"
ITEM.model = "models/foodnhouseholditems/champagne3.mdl"
ITEM.cost = 47
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 1
ITEM.dThirst = 10

ITEM.rarity = 4
ITEM:Register()


-- iUBEdrink
langEn["iUBEdrink"] = "Energy Drink"
langRu["iUBEdrink"] = "Napój energetyczny"
langEn["iUBEdrinkDesc"] = "Can with word Monster on it."
langRu["iUBEdrinkDesc"] = "Puszka z napisem Monster."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Energy Drink"
ITEM.PrintName = "iUBEdrink"
ITEM.description = "iUBEdrinkDesc"
ITEM.model = "models/foodnhouseholditems/sodacanb01.mdl"
ITEM.cost = 36
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = -1
ITEM.dThirst = 11

ITEM.rarity = 4
ITEM:Register()


-- iUBNutella
langEn["iUBNutella"] = "Chocolate pasta"
langRu["iUBNutella"] = "Pasta czekoladowa"
langEn["iUBNutellaDesc"] = "Glass jar with chocolate paste inside."
langRu["iUBNutellaDesc"] = "Szklany słoik z pastą czekoladową w środku."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Nutella"
ITEM.PrintName = "iUBNutella"
ITEM.description = "iUBNutellaDesc"
ITEM.model = "models/foodnhouseholditems/nutella.mdl"
ITEM.cost = 25
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 10 
ITEM.dThirst = -2

ITEM.rarity = 2
ITEM:Register()


-- iUBOldredwine
langEn["iUBOldredwine"] = "Old red wine"
langRu["iUBOldredwine"] = "Stare czerwone wino"
langEn["iUBOldredwineDesc"] = "Old red wine bottle with dim red liquid in it."
langRu["iUBOldredwineDesc"] = "Stara czerwona butelka wina z przygaszoną czerwoną cieczą w środku."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Old red wine"
ITEM.PrintName = "iUBOldredwine"
ITEM.description = "iUBOldredwineDesc"
ITEM.model = "models/foodnhouseholditems/winebottle4.mdl"
ITEM.cost = 60
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 3
ITEM.dThirst = 12

ITEM.rarity = 4
ITEM:Register()


ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)
