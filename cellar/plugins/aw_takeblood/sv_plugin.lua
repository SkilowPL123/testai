local PLUGIN = PLUGIN

PLUGIN.TakeBloodTime = 10

function PLUGIN:TakeBlood(item, him)
	local client = item.player
	local target = client:GetEyeTraceNoCursor().Entity
	local trgisplayer = IsValid(target) and target:IsPlayer()
	local char = trgisplayer and target:GetCharacter() or client:GetCharacter()

	if !him or (him and trgisplayer) then
		local blood = char:GetBlood()

		local ostime = os.time()

		if ostime < char:GetData("TimeWhenBloodWasTaken", ostime) then
			client:Notify("Ten gracz oddał już krew!")
			return
		end

		if blood < 3500 then
			return client:Notify("Za mało krwi!")
		end

		local uniqueID = "TakingBlood" .. client:UniqueID()

		client:SetAction("Pobierz krew", self.TakeBloodTime, function()
			item:Remove()
			client:GetCharacter():GetInventory():Add("bloodbag")

			local winddrawing = him and target or client
			winddrawing = winddrawing:GetCharacter()
			winddrawing:SetBlood(winddrawing:GetBlood() - 2500)
			char:SetData("TimeWhenBloodWasTaken", ostime + 60 * 1440 * 7)
			client:Notify("Pomyślnie pobrałeś krew.")
		end)

		local additionalcheck

		if him then
			additionalcheck = function()
				return !IsValid(target) or (IsValid(target) and target:GetVelocity():Length() != 0)
			end

			target:SetAction("Pobierają twoją krew", self.TakeBloodTime, function()
				target:Notify("Twoja krew została pomyślnie pobrana.")
			end)
		end

		timer.Create(uniqueID, 0.1, self.TakeBloodTime / 0.1, function()
			if !IsValid(client) or (IsValid(client) and client:GetVelocity():Length() != 0) or
				!client:GetCharacter():GetInventory():GetItems()[item:GetID()] or (additionalcheck and additionalcheck()) then
				timer.Remove(uniqueID)

				client:SetAction()

				if him then
					target:SetAction()
				end
			end
		end)
		return
	end
	client:Notify("Cel jest nieprawidłowy!")
end