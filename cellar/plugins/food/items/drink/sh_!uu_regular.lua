local langEn = {}
local langRu = {}

langEn["iUBDonuts"] = "Donuts in box"
langRu["iUBDounts"] = "Pączki w pudełku"
langEn["iUBDonutsDesc"] = "Striped box with a bunch of scented donuts inside. Stimulates the credibility of the manufacturer."
langRu["iUBDonutsDesc"] = "Pasiasta pudełko z mnóstwem pachnących pączków w środku. Wzbudza zaufanie do producenta."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Donuts"
ITEM.PrintName = "iUBDonuts"
ITEM.description = "iUBDonutsDesc"
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl"
ITEM.cost = 17
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 12.5
ITEM.dThirst = -2.5
ITEM:Register()



langEn["iUBPizza"] = "Pizza"
langRu["iUBPizza"] = "Pizza"
langEn["iUBPizzaDesc"] = "Still warm pizza in a white cardboard box. She smells of old times and dough. Black strips on the bottom of the pizza indicate that it was not cooked in the oven."
langRu["iUBPizzaDesc"] = "Wciąż ciepła pizza w białym kartonowym pudełku. Unosi się z niej zapach dawnych czasów i ciasta. Czarne smugi na spodzie pizzy wskazują, że nie została upieczona w piecu."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Pizza"
ITEM.PrintName = "iUBPizza"
ITEM.description = "iUBPizzaDesc"
ITEM.model = "models/props_canteen/pizza_box.mdl"
ITEM.cost = 24
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 9
ITEM.dThirst = -0.5

ITEM.rarity = 1
ITEM:Register()



langEn["iUBTaco"] = "Taco with pork"
langRu["iUBTaco"] = "Taco z wieprzowiną"
langEn["iUBTacoDesc"] = "Cool taco, inside of which there is a small piece of pork meat, as well as a huge number of all kinds of chemical spices that are very poorly tolerated by the body."
langRu["iUBTacoDesc"] = "Chłodne taco, w którym znajduje się niewielki kawałek mięsa wieprzowego, a także ogromna ilość wszelakich chemicznych przypraw, które organizm bardzo źle toleruje."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Taco"
ITEM.PrintName = "iUBTaco"
ITEM.description = "iUBTacoDesc"
ITEM.model = "models/props_canteen/taco.mdl"
ITEM.cost = 11
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 12
ITEM.dThirst = -1
ITEM:Register()



langEn["iUBCupoftea"] = "Cup of tea"
langRu["iUBCupoftea"] = "Kubek herbaty"
langEn["iUBCupofteaDesc"] = "Grayish tea, poured into a plastic mug. This mug is so badly made that you can notice the floating pieces of plastic on the surface of the tea."
langRu["iUBCupofteaDesc"] = "Szarawa herbata nalana do plastikowego kubka. Ten kubek jest tak źle wykonany, że można zauważyć pływające kawałki plastiku na powierzchni herbaty."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Cup of tea"
ITEM.PrintName = "iUBCupoftea"
ITEM.description = "iUBCupofteaDesc"
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 8

ITEM:Register()



langEn["iUBBakedbeans"] = "Baked beans"
langRu["iUBBakedbeans"] = "Zapiekana fasola"
langEn["iUBBakedbeansDesc"] = "Very suspicious light beans. I hope that I will not get irradiated if I eat them. Apparently, they were prepared in a nuclear reactor. However, they are very delicious!"
langRu["iUBBakedbeansDesc"] = "Bardzo podejrzane jasne fasolki. Mam nadzieję, że nie doznam napromieniowania, jeśli je zjem. Najwyraźniej przyrządzano je w reaktorze jądrowym. Mimo to są bardzo smaczne!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Baked beans"
ITEM.PrintName = "iUBBakedbeans"
ITEM.description = "iUBBakedbeansDesc"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 8
ITEM.dThirst = -2
ITEM:Register()


langEn["iUBJuniper"] = "Tincture of a juniper"
langRu["iUBJuniper"] = "Nalewka jałowcowa"
langEn["iUBJuniperDesc"] = "Idle tincture of juniper. When you open the bottle there is a smell of quality alcohol and greens. But, the taste leaves much to be desired. The main thing - that drunk!"
langRu["iUBJuniperDesc"] = "Jałowcowa nalewka bez konkretnego przeznaczenia. Po otwarciu butelki unosi się zapach porządnego spirytusu i ziół. Jednak smak pozostawia wiele do życzenia. Najważniejsze, że upaja!"
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Juniper"
ITEM.PrintName = "iUBJuniper"
ITEM.description = "iUBJuniperDesc"
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl"
ITEM.cost = 9
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 0
ITEM.dThirst = 10
ITEM.drunkTime = 72

ITEM.rarity = 1
ITEM:Register()



langEn["iUBBeer"] = "Bottled beer"
langRu["iUBBeer"] = "Butelkowane piwo"
langEn["iUBBeerDesc"] = "Fetid beer, rather sharp to the taste, but quite good intoxicating."
langRu["iUBBeerDesc"] = "Zgniłe piwo o dość ostrym smaku, ale nieźle upajające."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Beer"
ITEM.PrintName = "iUBBeer"
ITEM.description = "iUBBeerDesc"
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl"
ITEM.cost = 10
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 0
ITEM.dThirst = 7
ITEM.drunkTime = 128

ITEM.junk = "empty_glass_bottle"
ITEM:Register()



langEn["iUBCola"] = "Bottled cola"
langRu["iUBCola"] = "Butelkowana cola"
langEn["iUBColaDesc"] = "It's pretty funny to see such a pop in a dark place like this city. But, nevertheless, this cola is even better than what was before!"
langRu["iUBColaDesc"] = "Dość zabawnie jest widzieć taki napój gazowany w tak ponurym miejscu jak to miasto. Mimo to ta cola jest nawet lepsza niż to, co było wcześniej!"
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Cola"
ITEM.PrintName = "iUBCola"
ITEM.description = "iUBColaDesc"
ITEM.model = "models/bioshockinfinite/dickle_jar.mdl"
ITEM.cost = 9
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 0
ITEM.dThirst = 6

ITEM.junk = "empty_glass_bottle"
ITEM:Register()



langEn["iUBSaltedring"] = "Salted ringlets"
langRu["iUBSaltedring"] = "Słone kółeczka"
langEn["iUBSaltedringDesc"] = "Dry salted ringlets, they taste like they eat dry porridge. The reverse label indicates that solid particles can form in the rings. You can break your teeth."
langRu["iUBSaltedringDesc"] = "Suche, słone kółeczka, w smaku jakbyś jadł suchą kaszę. Na odwrocie etykiety znajduje się ostrzeżenie, że w kółeczkach mogą występować twarde drobiny. Można sobie połamać zęby."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Salted Ringlets"
ITEM.PrintName = "iUBSaltedring"
ITEM.description = "iUBSaltedringDesc"
ITEM.model = "models/foodnhouseholditems/applejacks.mdl"
ITEM.cost = 7
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 4.2
ITEM.dThirst = -1.7

ITEM:Register()



langEn["iUBBaconsubstitute"] = "Bacon substitute"
langRu["iUBBaconsubstitute"] = "Zamiennik boczku"
langEn["iUBBaconsubstituteDesc"] = "Has a yellowish tinge, which is why it causes mistrust. To taste - a stick of salt, but the taste of some meat is present."
langRu["iUBBaconsubstituteDesc"] = "Ma żółtawy odcień, przez co budzi nieufność. W smaku przypomina słony patyk, ale wyczuwa się też jakiś mięsny posmak."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Bacon substitute"
ITEM.PrintName = "iUBBaconsubstitute"
ITEM.description = "iUBBaconsubstituteDesc"
ITEM.model = "models/foodnhouseholditems/bacon.mdl"
ITEM.cost = 11
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 14
ITEM.dThirst = -4

ITEM:Register()



langEn["iUBCarrot"] = "Carrot"
langRu["iUBCarrot"] = "Marchewka"
langEn["iUBCarrotDesc"] = "Carrots are red, looks rather wrinkled. Navrjadli from it it is possible to receive any vitamins, nevertheless it is chewed enough easily, than its present analogue."
langRu["iUBCarrotDesc"] = "Czerwona marchewka, wygląda dość pomarszczona. Raczej trudno pozyskać z niej jakiekolwiek witaminy, ale mimo to żuje się ją dość łatwo w porównaniu z prawdziwym odpowiednikiem."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Carrot"
ITEM.PrintName = "iUBCarrot"
ITEM.description = "iUBCarrotDesc"
ITEM.model = "models/foodnhouseholditems/carrot.mdl"
ITEM.cost = 3
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 4
ITEM.dThirst = -1
ITEM:Register()



langEn["iUBWinewhite"] = "White wine"
langRu["iUBWinewhite"] = "Butelka białego wina"
langEn["iUBWinewhiteDesc"] = "A bottle of white wine in a neat wrapper with a majestic Alliance sign on the labels. Very good smells of roses and peaches. The taste is quite idle. The Alliance takes care of its subjects!"
langRu["iUBWinewhiteDesc"] = "Butelka białego wina w schludnym opakowaniu z majestatycznym symbolem Unii na etykietach. Pachnie różami i brzoskwiniami. Smakuje dość nijako. Unia dba o swoich poddanych!"
local ITEM = ix.item.New2("base_drink")
ITEM.name = "White wine"
ITEM.PrintName = "iUBWinewhite"
ITEM.description = "iUBWinewhiteDesc"
ITEM.model = "models/foodnhouseholditems/champagne.mdl"
ITEM.cost = 47
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 2
ITEM.dThirst = 10
ITEM.drunkTime = 256

ITEM.junk = "empty_glass_bottle"
ITEM.rarity = 4
ITEM:Register()



langEn["iUBWinered"] = "Red wine"
langRu["iUBWinered"] = "Butelka czerwonego wina"
langEn["iUBWineredDesc"] = "A bottle of very old wine, which was produced before the war. The opening of this bottle creates a real holiday, and the taste of this wine is like the tears of angels."
langRu["iUBWineredDesc"] = "Butelka bardzo starego wina, które produkowano jeszcze przed wojną. Otworzenie tej butelki to prawdziwe święto, a smak tego wina jest niczym łzy aniołów."
local ITEM = ix.item.New2("base_drink")
ITEM.name = "Red wine"
ITEM.PrintName = "iUBWinered"
ITEM.description = "iUBWineredDesc"
ITEM.model = "models/foodnhouseholditems/champagne2.mdl"
ITEM.cost = 47
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 2
ITEM.dThirst = 10
ITEM.drunkTime = 200
ITEM.junk = "empty_glass_bottle"
ITEM.rarity = 4
ITEM:Register()



langEn["iUBSweetringlets"] = "Sweet ringlets"
langRu["iUBSweetringlets"] = "Słodkie kółeczka"
langEn["iUBSweetringletsDesc"] = "A cardboard box containing a bunch of colorful sweet rings. They taste sweet, but they are sour. It is possible, but it is better to drink this matter with milk."
langRu["iUBSweetringletsDesc"] = "Kartonowe pudełko wypełnione mnóstwem kolorowych, słodkich kółeczek. W smaku są co prawda słodkie, ale przeraźliwie kwaśne. Da się je zjeść, ale lepiej popijać mlekiem."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Sweet ringlets"
ITEM.PrintName = "iUBSweetringlets"
ITEM.description = "iUBSweetringletsDesc"
ITEM.model = "models/foodnhouseholditems/cheerios.mdl"
ITEM.cost = 7
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 12
ITEM.dHunger = 4.2
ITEM.dThirst = -1.7
ITEM:Register()



langEn["iUBPastrycookies"] = "Pastry cookies"
langRu["iUBSweetringlets"] = "Ciasteczka w opakowaniu"
langEn["iUBPastrycookiesDesc"] = "Cookies in a beautiful wrapper with the symbols of the Alliance on the sides. It is quite fragile, you can notice already broken cookies inside. The taste is like sand, but you can get used to it."
langRu["iUBPastrycookiesDesc"] = "Ciasteczka w ładnym opakowaniu z symboliką Unii po bokach. Są dość kruche, można znaleźć już połamane kawałki w środku. W smaku przypominają piasek, ale da się przyzwyczaić."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Pastry cookies"
ITEM.PrintName = "iUBPastrycookies"
ITEM.description = "iUBPastrycookiesDesc"
ITEM.model = "models/foodnhouseholditems/digestive.mdl"
ITEM.cost = 5
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 3.75
ITEM.dThirst = -0.625
ITEM:Register()



langEn["iUBIcecream"] = "Ice cream"
langRu["iUBIcecream"] = "Lody"
langEn["iUBIcecreamDesc"] = "Chocolate ice cream, which for some reason does not want to melt in such a terrible heat as we have. The taste is really chocolate, but something is wrong with it. It's not cold!"
langRu["iUBIcecreamDesc"] = "Czekoladowe lody, które z jakiegoś powodu nie chcą się roztopić przy panującym upale. W smaku to faktycznie czekolada, ale coś tu jest nie tak. W ogóle nie są zimne!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Ice cream"
ITEM.PrintName = "iUBIcecream"
ITEM.description = "iUBIcecreamDesc"
ITEM.model = "models/foodnhouseholditems/icecream.mdl"
ITEM.cost = 19
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 4
ITEM.dThirst = 1

ITEM.rarity = 3
ITEM:Register()



langEn["iUBHotdog"] = "Hot-Dog"
langRu["iUBHotdog"] = "Hot-dog"
langEn["iUBHotdogDesc"] = "Literally sausage in the dough. True, the dough itself is more like sand, and the sausage is more like rubber."
langRu["iUBHotdogDesc"] = "Dosłownie parówka w cieście. Niestety samo ciasto bardziej przypomina piasek, a parówka bardziej gumę. Z keczupem przejdzie."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Hot-dog"
ITEM.PrintName = "iUBHotdog"
ITEM.description = "iUBHotdogDesc"
ITEM.model = "models/foodnhouseholditems/hotdog.mdl"
ITEM.cost = 8
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 4
ITEM.dHunger = 12.5
ITEM.dThirst = -2.5
ITEM:Register()



langEn["iUBRPepper"] = "Red Pepper"
langRu["iUBRPepper"] = "Czerwona papryka"
langEn["iUBRPepperDesc"] = "Pretty big red pepper. Its peel has an unhealthy red color, which means that it is likely to be covered with rather dangerous chemicals. But nobody cares."
langRu["iUBRPepperDesc"] = "Dość duża czerwona papryka. Jej skórka ma nienaturalnie czerwony kolor, co oznacza, że prawdopodobnie jest pokryta dość niebezpiecznymi chemikaliami. Ale kogo to obchodzi."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Red Pepper"
ITEM.PrintName = "iUBRPepper"
ITEM.description = "iUBRPepperDesc"
ITEM.model = "models/foodnhouseholditems/pepper1.mdl"
ITEM.cost = 1
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 1
ITEM.dHunger = 5
ITEM.dThirst = 0
ITEM:Register()



langEn["iUBPickles"] = "Bottle with pickles"
langRu["iUBPickles"] = "Słoik z piklami"
langEn["iUBPicklesDesc"] = "A small bottle with a bunch of different pickles inside. The water inside is rather viscous, and the pickles are very difficult to chew. But, nevertheless, they are very tasty!"
langRu["iUBPicklesDesc"] = "Niewielki słoik z różnymi kiszonkami w środku. Zalewa jest dość lepka, a kiszonki bardzo trudno się żuje. Mimo to są naprawdę smaczne!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Pickles"
ITEM.PrintName = "iUBPickles"
ITEM.description = "iUBPicklesDesc"
ITEM.model = "models/foodnhouseholditems/picklejar.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 8
ITEM.dHunger = 5
ITEM.dThirst = -2.5

ITEM.rarity = 1
ITEM:Register()


langRu["iUBBagel"] = "Rogalik"
langEn["iUBBagel"] = "Bagel"
langEn["iUBBagelDesc"] = "Bagel, consisting of a quality test and sprinkled with fragrant spices. Sweet before death!"
langRu["iUBBagelDesc"] = "Rogalik wykonany z porządnego ciasta i posypany aromatycznymi przyprawami. Słodki aż do przesady!"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Bagel"
ITEM.PrintName = "iUBBagel"
ITEM.description = "iUBBagelDesc"
ITEM.model = "models/foodnhouseholditems/pretzel.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 3
ITEM.dHunger = 10
ITEM.dThirst = 0
ITEM:Register()



langEn["iUBSandwich"] = "Sandwich"
langRu["iUBSandwich"] = "Kanapka"
langEn["iUBSandwichDesc"] = "Ready-to-eat sandwich. It consists of stale bread, dubious meat and dull greenery. What else is needed for happiness?"
langRu["iUBSandwichDesc"] = "Gotowa do spożycia kanapka. Składa się z czerstwego chleba, wątpliwego mięsa i zwiędniętej zieleniny. Czego chcieć więcej do szczęścia?"
local ITEM = ix.item.New2("base_food")
ITEM.name = "Sandwich"
ITEM.PrintName = "iUBSandwich"
ITEM.description = "iUBSandwichDesc"
ITEM.model = "models/foodnhouseholditems/sandwich.mdl"
ITEM.cost = 6
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 16
ITEM.dThirst = -2
ITEM:Register()



langEn["iUBBurger"] = "Burger"
langRu["iUBBurger"] = "Burger"
langEn["iUBBurgerDesc"] = "The burger glued from different parts reminds of old times. It is a pity that since then, the rest is only the bitterness of chemicals."
langRu["iUBBurgerDesc"] = "Sklejony z różnych elementów burger przypomina dawne czasy. Szkoda, że z tamtego okresu pozostała tylko gorycz chemikaliów."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Burger"
ITEM.PrintName = "iUBBurger"
ITEM.description = "iUBBurgerDesc"
ITEM.model = "models/foodnhouseholditems/mcdburger.mdl"
ITEM.cost = 22
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 20
ITEM.dThirst = -3

ITEM.rarity = 1
ITEM:Register()



langEn["iUBKetp"] = "Ketchup"
langRu["iUBKetp"] = "Keczup"
langEn["iUBKetpDesc"] = "Red viscous liquid in a transparent jar. The label says it's ketchup, but it tastes like more of a fused rusty metal."
langRu["iUBKetpDesc"] = "Czerwona, lepka ciecz w przezroczystym słoiku. Etykieta mówi, że to keczup, ale w smaku bardziej przypomina roztopiony, zardzewiały metal."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Ketchup"
ITEM.PrintName = "iUBKetp"
ITEM.description = "iUBKetpDesc"
ITEM.model = "models/foodnhouseholditems/ketchup.mdl"
ITEM.cost = 2
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 5
ITEM.dHunger = 8
ITEM.dThirst = -8

ITEM:Register()




langEn["iUBWalnut"] = "Walnut Pie"
langRu["iUBWalnut"] = "Orzechowy placek"
langEn["iUBWalnutDesc"] = "A fresh pie, from which gives off a fragrance from a long time, when we all peed in our pants. It was a year ago."
langRu["iUBWalnutDesc"] = "Świeży placek, od którego bije aromat dawnych czasów, kiedy wszyscy sikaliśmy w spodnie. To było rok temu."
local ITEM = ix.item.New2("base_food")
ITEM.name = "Walnut Pie"
ITEM.PrintName = "iUBWalnut"
ITEM.description = "iUBWalnutDesc"
ITEM.model = "models/foodnhouseholditems/pie.mdl"
ITEM.cost = 36
ITEM.width = 1
ITEM.height = 1
ITEM.dUses = 10
ITEM.dHunger = 12
ITEM.dThirst = 0

ITEM.rarity = 2
ITEM:Register()

ix.lang.AddTable("russian", langRu)
ix.lang.AddTable("english", langEn)
