PLUGIN.name = "Spawn Notifications"
PLUGIN.author = "Riggs"
PLUGIN.description = "A notification which tells the player their status on loading the character."

-- Feel free to change any of these messages.
local wakeupmessages = {
	"Obudziłeś się po długim śnie i próbujesz odzyskać swoje siły.",
	"Wstajesz i próbujesz wdychać powietrze tego świata pełną piersią.",
	"Powstajesz i starasz się otworzyć oczy po długim śnie.",
	"Czujesz, jakbyś miał sen o koszmarze, i zaraz po tym budzisz się.",
	"Ktoś ci się śnił, ale usłyszawszy dziwny głos – od razu się obudziłeś.",
	"Usłyszałeś ledwo słyszalne kroki i szepty gdzieś w oddali, po czym budzisz się z przerażenia.",
	"Słyszysz dźwięk syreny i dziwny stukot, po czym budzisz się.",
	"Obudziłeś się z burczeniem w brzuchu i zmęczeniem od wszystkiego, co cię otacza.",
	"Obudziłeś się po usłyszeniu przerażającego, lecz bolesnie znajomego dźwięku.",
}


function PLUGIN:PlayerSpawn(ply)
	local char = ply:GetCharacter()
	if not (ply:IsValid() or ply:Alive()) then return end
	if (not char) then return end
	if char:IsDispatch() then return end
	ply:ConCommand("play music/stingers/hl1_stinger_song16.mp3")
	ply:ScreenFade(SCREENFADE.IN, color_black, 3, 2)
	ply:ChatPrint(table.Random(wakeupmessages))
end
