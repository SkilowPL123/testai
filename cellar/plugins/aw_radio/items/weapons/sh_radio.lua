local PLUGIN = PLUGIN

ITEM.name = "Radio"
ITEM.description = "Zwykłe radio"
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.class = "aw_radio"
ITEM.weaponCategory = "radio"
ITEM.width = 2
ITEM.height = 1
ITEM.IsRadio = true

ITEM.iconCam = {
	pos = Vector(210.26748657227, 176.41787719727, 138.03916931152),
	ang = Angle(25.882352828979, -140, 0),
	fov = 5.2941176470588,
}

function ITEM:GetDescription()
    local id = self:GetData("kassetainside")
    return self.description..(id and "\nWłożona kaseta: "..ix.item.list[id]:GetName() or "")
end

ITEM.functions.EjectKasseta = {
	name = "Wyciągnij kasetę",
	OnRun = function(item)
        PLUGIN:EjectKasseta(item)
		return false
    end,
    OnCanRun = function(item)
        return !!item:GetData("kassetainside")
    end
}
ITEM.functions.InsertKasseta = {
	name = "Włóż kasetę",
	OnRun = function(item)
        PLUGIN:InsertKasseta(item)
		return false
    end,
    OnCanRun = function(item)
        return !item:GetData("kassetainside") and !table.IsEmpty(item.player:GetCharacter():GetInventory():GetItemsByBase("base_kasseta"))
    end
}

ITEM.functions.TurnOn = {
	name = "Włącz radio",
	OnRun = function(item)
        PLUGIN:TurnRadio(item,true)
		return false
    end,
    OnCanRun = function(item)
        local ent = item.entity 

        if !IsValid(ent) then return false end

        if CLIENT then
            return !PLUGIN.stored[ent]
        end

        return true
    end
}

ITEM.functions.TurnOff = {
	name = "Wyłącz radio",
	OnRun = function(item)
        PLUGIN:TurnRadio(item,false)
		return false
    end,
    OnCanRun = function(item)
        local ent = item.entity 

        if !IsValid(ent) then return false end

        if CLIENT then
            return !!PLUGIN.stored[ent]
        end

        return true
    end
}