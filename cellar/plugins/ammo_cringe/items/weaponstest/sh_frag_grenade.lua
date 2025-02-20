ITEM.name = "MK3A2"
ITEM.description = "Granat odłamkowy, wyposażony w sygnał ostrzegawczy, jest szeroko stosowany przez siły Kombinatu i stanowi modyfikację swojego ziemskiego poprzednika, MK3A1."
ITEM.model = "models/items/grenadeammo.mdl"
ITEM.class = "weapon_frag"
ITEM.weaponCategory = "grenade"
ITEM.isGrenade = true
ITEM.rarity = 2
ITEM.width = 1
ITEM.height = 1

if CLIENT then
	local function AddIconRow(tooltip)
		local row = tooltip:Add("ixTooltipRowIcon")
		row:SetZPos(#tooltip:GetChildren() * 10)

		return row
	end

	local icons = {
		[1] = Material("cellar/ui/weaponry/ap.png"),
		[2] = Material("cellar/ui/weaponry/attack.png"),
		[3] = Material("cellar/ui/weaponry/limbdmg.png"),
		[4] = Material("cellar/ui/weaponry/shockdmg.png"),
		[5] = Material("cellar/ui/weaponry/blooddmg.png"),
		[6] = Material("cellar/ui/weaponry/bleed.png"),
	}

	local grayClr = Color(122, 122, 122)

	function ITEM:PopulateTooltip(tooltip)
		if self:GetData("equip") then
			local name = tooltip:GetRow("name")
			name:SetBackgroundColor(derma.GetColor("Success", tooltip))
		end

		local skill = tooltip:AddRow("skill")
		skill:SetText("Typ: wybuchowy")
		skill:SetBackgroundColor(grayClr)
		skill:SizeToContents()

		local stats = tooltip:AddRow("attack")
		stats:SetText("Charakterystyka:")
		stats:SizeToContents()

		local AP = AddIconRow(tooltip)
		AP:SetIcon(icons[2])
		AP:SetText("100 ATAK")
		AP:SizeToContents()

		local AP = AddIconRow(tooltip)
		AP:SetIcon(icons[1])
		AP:SetText("100 PENETRACJA")
		AP:SizeToContents()

		local DMG = AddIconRow(tooltip)
		DMG:SetIcon(icons[3])
		DMG:SetText("22 USZKODZENIA")
		DMG:SizeToContents()

		local DMG = AddIconRow(tooltip)
		DMG:SetIcon(icons[4])
		DMG:SetText("937 — 3750 SZOK")
		DMG:SizeToContents()

		local DMG = AddIconRow(tooltip)
		DMG:SetIcon(icons[5])
		DMG:SetText("375 — 1500 KREW")
		DMG:SizeToContents()

		local Bleed = AddIconRow(tooltip)
		Bleed:SetIcon(icons[6])
		Bleed:SetText("95% SZANSA")
		Bleed:SizeToContents()
	end
end