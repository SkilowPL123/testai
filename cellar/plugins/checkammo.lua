local PLUGIN = PLUGIN

PLUGIN.name = "Ammunition check"
PLUGIN.author = "maxxoft"
PLUGIN.description = "Allows to check how much ammo do you have without GUI."

PLUGIN.entries = {
	[1] = "*Nawet więcej niż połowa*.",
	[2] = "*Została mniej niż połowa*.",
	[3] = "*Prawie nic nie zostało*.",
	[4] = "*Pusty*.",
	[5] = "*Pełny magazynek*."
}


function PLUGIN:CheckAmmo(client)
	if client:IsCombine() then return end
	local weapon = client:GetActiveWeapon()
	if not isfunction(weapon.GetMaxClip1) then return end
	local max = weapon:GetMaxClip1()
	local clip = weapon:Clip1()
	local msg
	if max < 2 then return end

	if clip == 0 then
		msg = self.entries[4]
	elseif clip >= max then
		msg = self.entries[5]
	elseif clip > max / 2 then
		msg = self.entries[1]
	elseif clip < max / 2 and clip > max / 4 then
		msg = self.entries[2]
	else
		msg = self.entries[3]
	end

	weapon:SendWeaponAnim(ACT_VM_RELOAD)
	weapon:SetNextPrimaryFire(CurTime() + 2)
	if CLIENT then
		timer.Simple(2, function()
			ix.chat.Send(client, "itc", msg)
		end)
	end
end

function PLUGIN:PlayerButtonDown(ply, button)
	if button == KEY_T and ply:GetCharacter() and IsFirstTimePredicted() then
		self:CheckAmmo(ply)
	end
end