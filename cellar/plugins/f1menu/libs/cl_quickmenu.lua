local ix = ix

ix.quickmenu = {}
ix.quickmenu.stored = {}


function ix.quickmenu:AddCallback(name, icon, callback, shouldShow)
	self.stored[#ix.quickmenu.stored+1] = {
		shouldShow = shouldShow,
		callback = callback,
		name = name,
		icon = icon
	};
end;

ix.quickmenu:AddCallback("Edytuj opis", "icon16/note_edit.png", function()
	ix.command.Send("CharDesc")
end)

ix.quickmenu:AddCallback("Wyrzuć żetony", "icon16/money_delete.png", function()
	local description = string.format("Ile chcesz wyrzucić? Masz %s.", LocalPlayer():GetCharacter():GetMoney())

	Derma_StringRequest("Wyrzuć żetony", description, 20, function(text)
		ix.command.Send("DropTokens", text)
	end, nil, "Wyrzuć", "Anuluj")
end)

ix.quickmenu:AddCallback("Zemdlej", "icon16/user.png", function()
	Derma_StringRequest("Zemdlej", "Wprowadź czas (od 5 do 60 sekund).", 5, function(text)
		ix.command.Send("CharFallOver", math.Clamp(tonumber(text) or 60, 60, 120))
	end, nil, "Zemdlej", "Anuluj")
end)

ix.quickmenu:AddCallback("Zmień swój styl chodzenia", "icon16/user.png", function()
	local menu = DermaMenu()
	local moods = ix.plugin.list["emotemoods"].MoodTextTable
	for i = 1, 4 do
		menu:AddOption(L(moods[i - 1]), function()
			ix.command.Send("CharSetMood", i - 1)
		end)
	end
	menu:Open()
end)
