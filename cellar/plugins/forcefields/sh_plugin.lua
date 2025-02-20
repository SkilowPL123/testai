local PLUGIN = PLUGIN;

PLUGIN.name = "Forcefields";
PLUGIN.description = "Adds forcefields from Clockwork that don't crash the server.";
PLUGIN.author = "Adolphus";

PLUGIN.blocked = {
};
PLUGIN.modes = {};
PLUGIN.modes[1] = {
	function(client, forcefield)
		if IsValid(client) then
			return !client:GetCharacter():HasIDAccess(forcefield:GetAccess())
		end;
	end,
	"Zaloguj się przez dostęp"
};
PLUGIN.modes[2] = {
	function(player) 
		return true; 
	end, "aktywowany"
};
PLUGIN.modes[3] = {
	function(player) 
		return false; 
	end, "dezaktywowany";
}

ix.util.Include("cl_init.lua");
ix.util.Include("sh_hooks.lua");
ix.util.Include("sv_hooks.lua");