ITEM.name = "Latarka"
ITEM.model = Model("models/lagmite/lagmite.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Zwykła latarka z włącznikiem."
ITEM.category = "categoryTools"

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
end)
