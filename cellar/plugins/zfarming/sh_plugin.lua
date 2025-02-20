local PLUGIN = PLUGIN

PLUGIN.name = "Farming"
PLUGIN.author = "maxxoft"
PLUGIN.description = "Adds the ability to grow plants."


ix.util.Include("sv_hooks.lua")

ix.config.Add("phaseTime", 1800, "Time a plant needs to get a next portion of growth points (minutes).", nil, {
	data = {min = 1, max = 2500},
	category = "categoryFarming"
})

ix.config.Add("phaseRate", 10, "How many growth points a plant gains on timer tick.", nil, {
	data = {min = 1, max = 100},
	category = "categoryFarming"
})

ix.config.Add("phaseMaxPoints", 50, "How many points a plant needs to get on the next phase.", nil, {
	data = {min = 10, max = 100},
	category = "categoryFarming"
})

ix.config.Add("phases", 4, "How many phases a plant needs to fully grow.", nil, {
	data = {min = 2, max = 8},
	category = "categoryFarming"
})

ix.lang.AddTable("english", {
	categoryFarming = "Farming",
	plantGrown = "The plant has grown.",
	plantNotGrown = "The plant has not grown.",
	plantDestroyed = "You have destroyed the plant.",
	plantDead = "The plant is dead.",
	plantWatered = "You have watered the plant.",
	wrongSurface = "Incorrect surface.",
	surfaceTooFar = "Surface is too far.",
	wateringNotNeeded = "Watering is not needed now.",
	wateringNoItem = "You don't have item to water the plant.",
	menuDestroy = "Destroy",
	menuHarvest = "Harvest",
	menuWater = "Water",
	plant = "Plant"
})

ix.lang.AddTable("russian", {
	categoryFarming = "Rolnictwo",
	plantGrown = "Roślina urosła.",
	plantNotGrown = "Roślina jeszcze nie urosła.",
	plantDestroyed = "Zniszczyłeś roślinę.",
	plantDead = "Roślina jest martwa.",
	plantWatered = "Podlałeś roślinę.",
	wrongSurface = "Nieprawidłowa powierzchnia.",
	surfaceTooFar = "Powierzchnia jest zbyt daleko.",
	wateringNotNeeded = "To roślina nie wymaga jeszcze podlewania.",
	wateringNoItem = "Brak przedmiotu do podlewania.",
	menuDestroy = "Zniszcz",
	menuHarvest = "Zbierz",
	menuWater = "Podlej",
	plant = "Zasadź"
})


PLUGIN.growModels = {
	"models/props/de_train/bush2.mdl",
	"models/props/de_inferno/bushgreensmall.mdl",
	"models/props_foliage/bush2.mdl"
}

PLUGIN.waterItems = {
	breens_water = 1,
	smooth_breens_water = 2,
	special_breens_water = 3,
	purified_water = 5
}

PLUGIN.itemReplacers = {
	["breens_water"] = "empty_can",
	["purified_water"] = "empty_glass_bottle",
	["smooth_breens_water"] = "empty_can",
	["special_breens_water"] = "empty_can"
}
