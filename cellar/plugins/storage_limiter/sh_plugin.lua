
PLUGIN.name = "Storage Limiter"
PLUGIN.author = "LegAz"
PLUGIN.description = "Limits max number of storages in the inventory."

ix.config.Add("inventoryMaxStorages", 1, "Scale to define limit of storages in the inventory.", nil, {
	data = {min = 1, max = 4},
	category = "characters"
})

ix.config.Add("inventoryMaxSmallStorages", 2, "Scale to define limit of small storages in the inventory.", nil, {
	data = {min = 1, max = 6},
	category = "characters"
})

ix.lang.AddTable("english", {
	noDifferentStorages = "Inventory storages must be of the same size!",
	invMaxStorages = "The number of storages in your inventory cannot exceed %s!",
	invMaxSmallStorges = "The number of storages in your inventory cannot exceed %s!"
})
ix.lang.AddTable("russian", {
	noDifferentStorages = "Pojemniki w ekwipunku muszą mieć ten sam rozmiar!",
	invMaxStorages = "Liczba pojemników w ekwipunku nie może przekraczać %s!",
	invMaxSmallStorages = "Liczba małych pojemników w ekwipunku nie może przekraczać %s!"
})

ix.util.Include("sv_plugin.lua")
ix.util.Include("cl_plugin.lua")
