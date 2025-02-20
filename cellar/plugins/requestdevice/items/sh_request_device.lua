local PLUGIN = PLUGIN

ITEM.name = "Urządzenie wzywające"
ITEM.model = Model("models/gibs/shield_scanner_gib1.mdl")
ITEM.description = "Małe urządzenie z żółtym przyciskiem, wbudowanym mikrofonem z głośnikiem i uchwytem na ucho.\n\nInstrukcja: Zarejestruj urządzenie dołączając je do karty CID, po czym możesz wysłać wniosek do Ochrony Cywilnej. Imię i nazwisko oraz numer CID zostaną automatycznie przesłane wraz z wiadomością."
ITEM.category = "Komunikacja"
ITEM.rarity = 1
ITEM.isEquipment = true
ITEM.slot = EQUIP_EARS

function ITEM:GetDescription()
	local item = ix.item.instances[self:GetData("id")]

	return item and string.format(self.description.."\n\nPołączone z %s, CID #%s, RegID #%s.", item:GetData("name"), item:GetData("cid"), item:GetData("number")) or self.description
end

local cacheText = ""

ITEM.functions.Request = {
	name = "Poproś o pomoc",
	icon = "icon16/help.png",
	OnClick = function(item)
		Derma_StringRequest("Poproś o pomoc", "Wpisz swoją prośbę. Dane powiązane z urządzeniem zostaną przesłane automatycznie.", cacheText, function(text)
				if text and string.utf8len(text) > 0 then
					netstream.Start("ixRequest", text)
				end

				cacheText = ""
			end, 
		function(text)
			cacheText = text
		end, "WEZWIJ", "ANULUJ")
	end,
	OnRun = function(item)
		item.player.ixRequestDevice = item

		return false
	end,
	OnCanRun = function(item)
		if IsValid(item.entity) or !item:GetData("id", false) then
			return false
		end

		return true
	end
}

ITEM.combine = {}
ITEM.combine.Transfer = {
	name = "Połącz kartę CID",
	icon = "icon16/lock_edit.png",
	OnRun = function(from, to) 
		from:SetData("id", to:GetID())

		return false
	end,
	OnCanRun = function(from, to) 
		if isnumber(to.cardType) then
			return true
		end

		return false
	end
}