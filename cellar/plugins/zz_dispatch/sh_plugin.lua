local PLUGIN = PLUGIN
PLUGIN.name = "Dispatch System"
PLUGIN.author = "Schwarz Kruppzo"
PLUGIN.description = ""

dispatch = dispatch or {
	name_format = "CCA:%s%s-%i",
	--unassigned_tag = "UNIT",
	available_tags = {
		"c17.UNIT",
		"c17.DEFENDER",
		"c17.HERO",
		"c17.JURY",
		"c17.KING",
		"c17.LINE",
		"c17.PATROL",
		"c17.QUICK",
		"c17.ROLLER",
		"c17.STICK",
		"c17.TAP",
		"c17.UNION",
		"c17.VICTOR",
		"c17.XRAY",
		"c17.YELLOW",
		"c17.VICE"
	},
	squads = {}
}

dispatch.mpf_ranks = {
	[1] = {
		name = "Regular",
		class = function()
			return CLASS_MPF
		end
	},
	[2] = {
		name = "Rank Leader",
		class = function()
			return CLASS_RL
		end
	},
}

dispatch.stability_codes = {
	[1] = {
		name = "ZIELONY",
		text = "STABILNOŚĆ SPOŁECZNA JEST NORMALNA",
		color = Color(128, 255, 128),
		isHidden = true
	},
	[2] = {
		name = "ŻÓŁTY",
		text = "STABILNOŚĆ SPOŁECZNA JEST PONIŻEJ NORMY",
		color = Color(255, 200, 32)
	},
	[3] = {
		name = "CZERWONY",
		text = "STABILNOŚĆ SPOŁECZNA JEST ZAGROŻONA",
		color = Color(255, 32, 64)
	},
	[4] = {
		name = "CZARNY",
		text = "STABILNOŚĆ SPOŁECZNA UTRACIŁA SIĘ, PRÓBA ODWOŁANA",
		color = Color(225, 225, 225)
	},
}

dispatch.snd_waypoints = {
	gun = {
		Sound("npc/overwatch/radiovoice/allunitsdeliverterminalverdict.wav"),
		Sound("npc/overwatch/radiovoice/posession69.wav"),
		Sound("npc/overwatch/radiovoice/suspectisnow187.wav"),
		Sound("npc/overwatch/radiovoice/weapon94.wav")
	},
	death = {
		Sound("npc/overwatch/radiovoice/assault243.wav"),
		Sound("npc/overwatch/radiovoice/destrutionofcpt.wav"),
		Sound("npc/overwatch/radiovoice/engagingteamisnoncohesive.wav"),
		Sound("npc/overwatch/radiovoice/lostbiosignalforunit.wav")
	},
	attack = {
		Sound("npc/overwatch/radiovoice/lockdownlocationsacrificecode.wav"),
		Sound("npc/overwatch/radiovoice/immediateamputation.wav"),
		Sound("npc/overwatch/radiovoice/failuretotreatoutbreak.wav"),
		Sound("npc/overwatch/radiovoice/allunitsbeginwhitnesssterilization.wav"),
		Sound("npc/overwatch/radiovoice/allunitsapplyforwardpressure.wav")
	},
	factory = {
		Sound("npc/overwatch/radiovoice/workforceintake.wav")
	},
	hazard = {
		Sound("npc/overwatch/radiovoice/infection.wav"),
		Sound("npc/overwatch/radiovoice/infestedzone.wav")
	},
	protect = {
		Sound("npc/overwatch/radiovoice/fmil_region 073.wav"),
		Sound("npc/overwatch/radiovoice/deservicedarea.wav")
	},
	regroup = {
		Sound("npc/overwatch/radiovoice/allunitsreturntocode12.wav"),
		Sound("npc/overwatch/radiovoice/accomplicesoperating.wav")
	},
	poi = {
		Sound("npc/overwatch/radiovoice/investigateandreport.wav"),
		Sound("npc/overwatch/radiovoice/officerclosingonsuspect.wav"),
		Sound("npc/overwatch/radiovoice/recalibratesocioscan.wav"),
		Sound("npc/overwatch/radiovoice/reportplease.wav"),
		Sound("npc/overwatch/radiovoice/beginscanning10-0.wav")
	},
	warn = {
		Sound("npc/overwatch/radiovoice/publicnoncompliance507.wav"),
		Sound("npc/overwatch/radiovoice/preparetoinnoculate.wav"),
		Sound("npc/overwatch/radiovoice/politistablizationmarginal.wav"),
		Sound("npc/overwatch/radiovoice/level5anticivilactivity.wav"),
		Sound("npc/overwatch/radiovoice/anticitizen.wav")
	},
}

function dispatch.Rank(id)
	return dispatch.mpf_ranks[id] or dispatch.mpf_ranks[1]
end

function dispatch.GetRank(character)
	return ix.class.list[character:GetClass()].rank or 0
end

if SERVER then
	ix.log.AddType("squadCreate", function(char, tagname)
		return string.format("%s stwórz PT '%s'", char:GetOriginalName(), tagname)
	end)

	ix.log.AddType("squadDestroy", function(char, tagname)
		return string.format("%s rozwiąż PT '%s'", char:GetOriginalName(), tagname)
	end)

	ix.log.AddType("squadLeader", function(char, tagname, target)
		return string.format("%s mianuj dowódce PT '%s' %s", char:GetName(), tagname, target:GetName())
	end)

	ix.log.AddType("squadMove", function(char, name, tagname)
		return string.format("%s przeniósł %s do PT „%s”", char:GetName(), name, tagname)
	end)

	ix.log.AddType("squadReward", function(char, target, points, reason)
		return string.format("%s przyznanych %s %s punktów sterylizacji (%s)", char:GetName(), target:GetName(), points, reason)
	end)

	ix.log.AddType("squadRewardAll", function(char, tagname, points, reason)
		return string.format("%s przyznanych PT „%s” %s punktów sterylizacji (%s)", char:GetName(), tagname, points, reason)
	end)

	ix.log.AddType("squadObserve", function(char, target)
		return string.format("%s ogląda %s", char:GetName(), target:GetName())
	end)
end

ix.util.Include("meta/sh_squads.lua")

function dispatch.GetMemberLimit()
	return 5
end

function dispatch.GetSquads()
	return dispatch.squads
end

function dispatch.GetReceivers()
	local recvs = {}

	for _, client in ipairs(player.GetAll()) do
		if client:IsCombine() then
			table.insert(recvs, client)
		end
	end

	return recvs
end

function dispatch.GetStability()
	return GetGlobalInt("stabilitycode", 1)
end

function dispatch.StabilityCode()
	return dispatch.stability_codes[dispatch.GetStability()] or dispatch.stability_codes[1]
end

function dispatch.GetFreeSquadTag()
	for tag = 1, #dispatch.available_tags do
		if dispatch.squads[tag] == nil then
			return tag
		end
	end

	return false
end

function dispatch.CreateSquad(leader, tagID, static, noLog)
	if !static and getmetatable(leader) != ix.meta.character then
		if !leader or !leader:GetCharacter() then
			return false
		end

		leader = leader:GetCharacter()
	end

	tagID = tagID or dispatch.GetFreeSquadTag()

	if !tagID then
		return false
	end

	local SQUAD = setmetatable({}, ix.meta.squad)
	SQUAD:Setup(tagID, leader, static)

	dispatch.squads[tagID] = SQUAD

	if !static and SERVER then
		SQUAD:Sync()
	end

	return SQUAD
end

dispatch.unassigned_squad = dispatch.unassigned_squad or dispatch.CreateSquad(nil, 1, true)

ix.util.Include("sh_interactions.lua")
ix.util.Include("cl_waypoints.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_spectate.lua")
ix.util.Include("sv_interactions.lua")
ix.util.Include("sv_waypoints.lua")
ix.util.Include("sv_hooks.lua")
ix.util.Include("sv_crc_saving.lua")

properties.Add("camera_setname", {
	MenuLabel = "Set Camera Name",
	Order = 400,
	MenuIcon = "icon16/lock_edit.png",

	Filter = function(self, entity, client)
		if !dispatch.GetCameraData(entity:GetClass()) then return false end
		if !gamemode.Call("CanProperty", client, "camera_setname", entity) then return false end

		return true
	end,

	Action = function(self, entity)
		Derma_StringRequest("Wprowadź nową nazwę kamery", "", "", function(text)
			self:MsgStart()
				net.WriteEntity(entity)
				net.WriteString(text)
			self:MsgEnd()
		end)
	end,

	Receive = function(self, length, client)
		local entity = net.ReadEntity()

		if !IsValid(entity) then return end
		if !self:Filter(entity, client) then return end

		local name = net.ReadString()
		/*
		if entity:GetClass() != "ix_combinelock" then
			entity.SaveCRC = nil
			dispatch.SetupCRC(entity)
		end
		*/

		entity:SetNetVar("cam", name)
		
		if entity:GetClass() == "npc_combine_camera" then
			PLUGIN:SaveData()
		end
	end
})

ix.lang.AddTable("russian", {
	stabilityChanged = "Pomyślnie zmieniłeś kod statusu!",
	waypointCooldown = "Musisz chwilę poczekać, zanim dodasz nową oznaczenie!",
	addedWaypoint = "Pomyślnie dodałeś oznaczenie!",
	combineNoAccess = "Nie masz dostępu do tych poleceń!",
	stabilityCmd = "Zmiana kodu statusu (1 - 4: od zielonego do czarnego)",
	squadCreated = "Pomyślnie utworzyłeś grupę patrolową!",
	dispatchReward = "%s nagrodził Cię %s punktami sterylizacji (%s)!",
	dispatchRewardAll = "%s nagrodził Twoją grupę patrolową %s punktami sterylizacji (%s)!",
	dispatchMinus = "%s ukarał Cię %s punktami sterylizacji (%s)!",
	dispatchMinusAll = "%s ukarał Twoją grupę patrolową %s punktami sterylizacji (%s)!"
})


ix.command.Add("StabilityCode", {
	description = "@stabilityCmd",
	arguments = {
		ix.type.number
	},
	OnRun = function(self, client, index)
		if !client:IsCombine() or client:GetCharacter():ReturnDatafilePermission() < 4 then
			return false
		end

		local id = math.Clamp(index, 1, #dispatch.stability_codes)

		SetGlobalInt("stabilitycode", id)

		return "@stabilityChanged"
	end
})

ix.command.Add("SquadCreate", {
	description = "",
	OnRun = function(self, client, index)
		if !client:IsCombine() or client:Team() == FACTION_DISPATCH then
			return "@combineNoAccess"
		end

		local result, _ = dispatch.CreateSquad(client)

		if result then
			ix.log.Add(client:GetCharacter(), "squadCreate", result:GetTagName())

			return "@squadCreated"
		end
	end
})

ix.command.Add("SquadJoin", {
	description = "",
	arguments = {
		ix.type.number
	},
	OnRun = function(self, client, index)
		if !client:IsCombine() or client:Team() == FACTION_DISPATCH then
			return "@combineNoAccess"
		end

		local squad = dispatch.GetSquads()[index]

		if squad then
			squad:AddMember(client:GetCharacter())
		end
	end
})

ix.command.Add("SquadLeave", {
	description = "",
	OnRun = function(self, client)
		if !client:IsCombine() or client:Team() == FACTION_DISPATCH then
			return "@combineNoAccess"
		end

		local character = client:GetCharacter()
		local squad = character:GetSquad()

		if squad and !squad:IsStatic() then
			squad:RemoveMember(character)
		end
	end
})

ix.command.Add("Waypoint", {
	description = "@cmdWaypointAdd",
	arguments = {ix.type.string, bit.bor(ix.type.string, ix.type.optional)},
	OnRun = function(self, client, type, text)
		if !client:IsCombine() then
			return "@combineNoAccess"
		end

		if (client.lastWaypointCooldown or 0) > CurTime() then
			return "@waypointCooldown"
		end

		text = text or ""

		local trace = client:GetEyeTraceNoCursor()
		local position = trace.HitPos

		if math.abs(trace.HitNormal.z) > .98 then
			position:Add(Vector(0, 0, 30))
		end

		dispatch.AddWaypoint(position, text, type)

		client.lastWaypointCooldown = CurTime() + 5

		return "@addedWaypoint"
	end
})

sound.Add({
	name = "NPC_CombineCamera.Ping",
	channel = CHAN_VOICE,
	volume = 0.5,
	level = 25,
	pitch = 100,
	sound = "npc/turret_floor/ping.wav"
})

hook.Add("prone.CanEnter", "dispatch", function(client)
	if client:Team() == FACTION_DISPATCH then
		return false
	end
end)