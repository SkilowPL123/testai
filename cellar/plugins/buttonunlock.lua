local PLUGIN = PLUGIN

PLUGIN.name = "Buttons Unlock Plugin"
PLUGIN.author = "Vintage Thief"
PLUGIN.description = "Allows admins to unlock buttons using chat command /buttonunlock."

do
	ix.command.Add("ButtonLock", {
		description = "Zablokuj Przycisk",
		privilege = "Manage Buttons",
		adminOnly = true,
		OnRun = function(self, client)
			local entity = client:GetEyeTrace().Entity

			if IsValid(entity) and entity:IsButton() then

				entity:Fire("lock")

				return "Pomyślnie zablokowałeś ten przycisk."
			else
				return "@dNotValid"
			end
		end
	})

	ix.command.Add("ButtonUnlock", {
		description = "Odblokuj przycisk",
		privilege = "Manage Buttons",
		adminOnly = true,
		OnRun = function(self, client)
			local entity = client:GetEyeTrace().Entity

			if IsValid(entity) and entity:IsButton() then

				entity:Fire("unlock")

				return "Pomyślnie odblokowałeś ten przycisk."
			else
				return "@dNotValid"
			end
		end
	})
end