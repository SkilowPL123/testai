--[[ 
  Ustawiamy margines (padding) w zależności od rozmiaru ekranu.
  ScreenScale(32) zapewnia skalowanie w zależności od rozdzielczości.
--]]
local padding = ScreenScale(32)

--[[ 
  Tutaj definiujemy panel do menu tworzenia postaci.
  BaseClass("ixCharMenuPanel") wskazuje, że dziedziczymy zachowania z innego panelu Helixa.
--]]
DEFINE_BASECLASS("ixCharMenuPanel")
local PANEL = {}

--[[
  Funkcja Init() wywoływana jest przy tworzeniu nowego panelu.
  Inicjalizujemy tu wszystkie sub-panele i elementy interfejsu
  (przyciski, model panel, przyciski 'Dalej', 'Powrót', itp.).
--]]
function PANEL:Init()
	-- Pobieramy rodzica (wyższy panel/menu) i obliczamy pewne wymiary ekranu.
	local parent = self:GetParent()
	local halfWidth = parent:GetWide() * 0.5 - (padding * 2)
	local halfHeight = parent:GetTall() * 0.5 - (padding * 2)
	local modelFOV = (ScrW() > ScrH() * 1.8) and 100 or 78

	-- Resetujemy stan Payload (dane wypełniane przez gracza podczas tworzenia postaci).
	self:ResetPayload(true)

	-- Zmienna do przycisków frakcji i paneli, które będą wymagały odświeżenia/ponownego wygenerowania.
	self.factionButtons = {}
	self.repopulatePanels = {}

	-----------------------------------------------------------------------
	-- [1] PANEL WYBORU FRAKCJI (SUBPANEL "faction")
	-----------------------------------------------------------------------
	self.factionPanel = self:AddSubpanel("faction", true)
	self.factionPanel:SetTitle("chooseFaction")
	self.factionPanel.OnSetActive = function()
		-- Jeżeli jest tylko jedna frakcja, pomijamy wybór i przechodzimy od razu do "description".
		if (#self.factionButtons == 1) then
			self:SetActiveSubpanel("description", 0)
		end
	end

	-- Kontener modelu (po prawej stronie w subpanelu faction)
	local modelList = self.factionPanel:Add("Panel")
	modelList:Dock(RIGHT)
	modelList:SetSize(halfWidth + padding * 2, halfHeight)

	-- Przycisk "DALEJ" po wybraniu frakcji
	local proceed = modelList:Add("ixMenuButton")
	proceed:SetText("")
	proceed:SetTextColor(cellar_blue)
	proceed:SetFont('cellar.buttonsize')
	proceed:SetContentAlignment(6)
	proceed:Dock(BOTTOM)
	proceed:SizeToContents()
	proceed.DoClick = function()
		self.progress:IncrementProgress()
		self:Populate()
		self:SetActiveSubpanel("description")
	end
	proceed.Paint = function(me, w, h)
		-- Tutaj malujemy tło, gradienty i napis "DALEJ" na przycisku.
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRectRotated(w * .5 - 1, h * .5, w, h, 180)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRectRotated(w * .5 - 1, 0, w, 1, 180)
		surface.DrawTexturedRectRotated(w * .5 - 1, h, w, 1, 180)

		draw.RoundedBox(0, w - 4, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("DALEJ", "cellar.main.btn", w - 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		draw.SimpleText("DALEJ", "cellar.main.btn.blur", w - 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	-- Panel modelu postaci wyświetlający wybraną frakcję.
	self.factionModel = modelList:Add("ixModelPanel")
	self.factionModel:Dock(FILL)
	self.factionModel:SetModel("models/error.mdl")
	self.factionModel:SetFOV(modelFOV)
	self.factionModel.PaintModel = self.factionModel.Paint

	-- Panel, w którym pojawią się przyciski frakcji po lewej stronie
	self.factionButtonsPanel = self.factionPanel:Add("ixCharMenuButtonList")
	self.factionButtonsPanel:SetWide(halfWidth)
	self.factionButtonsPanel:Dock(FILL)

	-- Przycisk "POWRÓT" w panelu frakcji
	local factionBack = self.factionPanel:Add("ixMenuButton")
	factionBack:SetText("")
	factionBack:SetFont('cellar.buttonsize')
	factionBack:SizeToContents()
	factionBack:Dock(BOTTOM)
	factionBack.DoClick = function()
		self.progress:DecrementProgress()
		self:SetActiveSubpanel("faction", 0)
		self:SlideDown()
		parent.mainPanel:Undim()
	end
	factionBack.Paint = function(me, w, h)
		-- Malowanie przycisku "POWRÓT"
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRect(0, 0, w, h)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRect(0, 0, w, 1)
		surface.DrawTexturedRect(0, h - 1, w, 1)

		draw.RoundedBox(0, 0, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("POWRÓT", "cellar.main.btn", 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("POWRÓT", "cellar.main.btn.blur", 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	-----------------------------------------------------------------------
	-- [2] PANEL OPISU POSTACI (SUBPANEL "description")
	-----------------------------------------------------------------------
	self.description = self:AddSubpanel("description")
	self.description:SetTitle("chooseDescription")

	-- Lewy fragment panelu: model i przycisk "POWRÓT"
	local descriptionModelList = self.description:Add("Panel")
	descriptionModelList:Dock(LEFT)
	descriptionModelList:SetSize(halfWidth, halfHeight)

	local descriptionBack = descriptionModelList:Add("ixMenuButton")
	descriptionBack:SetText("")
	descriptionBack:SetFont('cellar.buttonsize')
	descriptionBack:SetContentAlignment(4)
	descriptionBack:SizeToContents()
	descriptionBack:Dock(BOTTOM)
	descriptionBack.DoClick = function()
		self.progress:DecrementProgress()
		if (#self.factionButtons == 1) then
			factionBack:DoClick()
		else
			self:SetActiveSubpanel("faction")
		end
	end
	descriptionBack.Paint = function(me, w, h)
		-- Malowanie przycisku "POWRÓT" w sekcji opisu
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRect(0, 0, w, h)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRect(0, 0, w, 1)
		surface.DrawTexturedRect(0, h - 1, w, 1)

		draw.RoundedBox(0, 0, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("POWRÓT", "cellar.main.btn", 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("POWRÓT", "cellar.main.btn.blur", 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	-- Panel modelu w sekcji opisu
	self.descriptionModel = descriptionModelList:Add("ixModelPanel")
	self.descriptionModel:Dock(FILL)
	self.descriptionModel:SetModel(self.factionModel:GetModel())
	self.descriptionModel:SetFOV(modelFOV - 13)
	self.descriptionModel.PaintModel = self.descriptionModel.Paint

	-- Prawy fragment z panelem przewijalnym (do wprowadzania danych)
	self.descriptionPanel = self.description:Add("Panel")
	self.descriptionPanel:SetWide(halfWidth + padding * 2)
	self.descriptionPanel:Dock(RIGHT)

	self.descriptionScroll = self.descriptionPanel:Add("DScrollPanel")
	self.descriptionScroll:Dock(FILL)

	-- Przycisk "DALEJ" w sekcji opisu
	local descriptionProceed = self.descriptionPanel:Add("ixMenuButton")
	descriptionProceed:SetText("")
	descriptionProceed:SetFont('cellar.buttonsize')
	descriptionProceed:SetContentAlignment(6)
	descriptionProceed:SizeToContents()
	descriptionProceed:Dock(BOTTOM)
	descriptionProceed.DoClick = function()
		if (self:VerifyProgression("description")) then
			self.progress:IncrementProgress()
			self:SetActiveSubpanel("skills")
		end
	end
	descriptionProceed.Paint = function(me, w, h)
		-- Malowanie przycisku "DALEJ" w sekcji opisu
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRectRotated(w * .5 - 1, h * .5, w, h, 180)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRectRotated(w * .5 - 1, 0, w, 1, 180)
		surface.DrawTexturedRectRotated(w * .5 - 1, h, w, 1, 180)

		draw.RoundedBox(0, w - 4, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("DALEJ", "cellar.main.btn", w - 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		draw.SimpleText("DALEJ", "cellar.main.btn.blur", w - 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	-----------------------------------------------------------------------
	-- [3] PANEL UMIEJĘTNOŚCI / ATRIBUTES (SUBPANEL "skills")
	-----------------------------------------------------------------------
	self.attributes = self:AddSubpanel("skills")
	self.attributes:SetTitle("chooseSkills")

	-- Lewa część (model + przycisk powrotu)
	local attributesModelList = self.attributes:Add("Panel")
	attributesModelList:Dock(LEFT)
	attributesModelList:SetSize(halfWidth, halfHeight)

	local attributesBack = attributesModelList:Add("ixMenuButton")
	attributesBack:SetText("")
	attributesBack:SetFont('cellar.buttonsize')
	attributesBack:SetContentAlignment(4)
	attributesBack:SizeToContents()
	attributesBack:Dock(BOTTOM)
	attributesBack.DoClick = function()
		self.progress:DecrementProgress()
		self:SetActiveSubpanel("description")
	end
	attributesBack.Paint = function(me, w, h)
		-- Malowanie przycisku "POWRÓT" w sekcji umiejętności
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRect(0, 0, w, h)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRect(0, 0, w, 1)
		surface.DrawTexturedRect(0, h - 1, w, 1)

		draw.RoundedBox(0, 0, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("POWRÓT", "cellar.main.btn", 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText("POWRÓT", "cellar.main.btn.blur", 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	-- Panel modelu w sekcji umiejętności
	self.attributesModel = attributesModelList:Add("ixModelPanel")
	self.attributesModel:Dock(FILL)
	self.attributesModel:SetModel(self.factionModel:GetModel())
	self.attributesModel:SetFOV(modelFOV - 13)
	self.attributesModel.PaintModel = self.attributesModel.Paint

	-- Prawa część (przycisk finalnego utworzenia postaci)
	self.attributesPanel = self.attributes:Add("Panel")
	self.attributesPanel:SetWide(halfWidth + padding * 2)
	self.attributesPanel:Dock(RIGHT)

	local create = self.attributesPanel:Add("ixMenuButton")
	create:SetText("")
	create:SetFont('cellar.buttonsize')
	create:SetContentAlignment(6)
	create:SizeToContents()
	create:Dock(BOTTOM)
	create.DoClick = function()
		if (self:VerifyProgression("skills")) then
			self:SendPayload()
		end
	end
	create.Paint = function(me, w, h)
		-- Malowanie przycisku "STWÓRZ" (finalizacja tworzenia postaci)
		local gradient = surface.GetTextureID("vgui/gradient-d")
		local gradientUp = surface.GetTextureID("vgui/gradient-u")
		local gradientLeft = surface.GetTextureID("vgui/gradient-l")
		local gradientRadial = Material("helix/gui/radial-gradient.png")

		surface.SetFont('cellar.main.btn')
		local hov = me:IsHovered()
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 25) or ColorAlpha(cellar_darker_blue, 43))
		surface.SetTexture(gradientLeft)
		surface.DrawTexturedRectRotated(w * .5 - 1, h * .5, w, h, 180)
		surface.SetDrawColor(hov and ColorAlpha(cellar_red, 255) or ColorAlpha(cellar_blue, 255))
		surface.DrawTexturedRectRotated(w * .5 - 1, 0, w, 1, 180)
		surface.DrawTexturedRectRotated(w * .5 - 1, h, w, 1, 180)

		draw.RoundedBox(0, w - 4, 0, 4, h, hov and cellar_red or cellar_blue)
		draw.SimpleText("STWÓRZ", "cellar.main.btn", w - 12, h/2, hov and cellar_red or cellar_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		draw.SimpleText("STWÓRZ", "cellar.main.btn.blur", w - 12, h/2, hov and cellar_red or cellar_blur_blue, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	-----------------------------------------------------------------------
	-- [4] PASEK POSTĘPU (ixSegmentedProgress) - pokazuje w jakim etapie jest gracz
	-----------------------------------------------------------------------
	self.progress = self:Add("ixSegmentedProgress")
	self.progress:SetBarColor(ix.config.Get("color"))
	self.progress:SetSize(parent:GetWide(), 0)
	self.progress:SizeToContents()
	self.progress:SetPos(0, 0)

	-----------------------------------------------------------------------
	-- [5] USTAWIENIA HOOKÓW (PAYLOAD HOOKS) - gdy zmienia się model/płeć itp.
	-----------------------------------------------------------------------
	self:AddPayloadHook("model", function(value)
		local faction = ix.faction.indices[self.payload.faction]

		if (faction) then
			local model = faction:GetModels(LocalPlayer(), self.payload.gender)[value]

			-- Sprawdzamy, czy model to tabela (może zawierać bodygroupy) czy string.
			if (istable(model)) then
				self.factionModel:SetModel(model[1], model[2] or 0, model[3])
				self.descriptionModel:SetModel(model[1], model[2] or 0, model[3])
				self.attributesModel:SetModel(model[1], model[2] or 0, model[3])
			else
				self.factionModel:SetModel(model)
				self.descriptionModel:SetModel(model)
				self.attributesModel:SetModel(model)
			end
		end
	end)

	self:AddPayloadHook("gender", function(value)
		if self.descriptionScroll.modelList and self.descriptionScroll.modelList.UpdateModels then
			self.descriptionScroll.modelList:UpdateModels(self.payload)
		end
	end)

	--[[
	  Odbieranie komunikatów z serwera (udane i nieudane tworzenie postaci).
	  Przetwarzamy tutaj odpowiedź i zamykamy/wyświetlamy odpowiednie informacje.
	--]]
	net.Receive("ixCharacterAuthed", function()
		timer.Remove("ixCharacterCreateTimeout")
		self.awaitingResponse = false

		local id = net.ReadUInt(32)
		local indices = net.ReadUInt(6)
		local charList = {}

		for _ = 1, indices do
			charList[#charList + 1] = net.ReadUInt(32)
		end

		ix.characters = charList
		self:SlideDown()

		if (!IsValid(self) or !IsValid(parent)) then
			return
		end

		if (LocalPlayer():GetCharacter()) then
			parent.mainPanel:Undim()
			parent:ShowNotice(2, L("charCreated"))
		elseif (id) then
			self.bMenuShouldClose = true
			net.Start("ixCharacterChoose")
				net.WriteUInt(id, 32)
			net.SendToServer()
		else
			self:SlideDown()
		end
	end)

	net.Receive("ixCharacterAuthFailed", function()
		timer.Remove("ixCharacterCreateTimeout")
		self.awaitingResponse = false

		local fault = net.ReadString()
		local args = net.ReadTable()

		self:SlideDown()
		parent.mainPanel:Undim()
		parent:ShowNotice(3, L(fault, unpack(args)))
	end)
end

--[[
  Funkcja odpowiada za faktyczne wysłanie danych postaci (payload) na serwer,
  gdy gracz kliknie finalny przycisk 'STWÓRZ'.
--]]
function PANEL:SendPayload()
	if (self.awaitingResponse or !self:VerifyProgression()) then
		return
	end

	self.awaitingResponse = true

	-- Timer zabezpieczający w razie braku odpowiedzi z serwera.
	timer.Create("ixCharacterCreateTimeout", 10, 1, function()
		if (IsValid(self) and self.awaitingResponse) then
			local parent = self:GetParent()

			self.awaitingResponse = false
			self:SlideDown()

			parent.mainPanel:Undim()
			parent:ShowNotice(3, L("unknownError"))
		end
	end)

	self.payload:Prepare()

	net.Start("ixCharacterCreate")
	net.WriteUInt(table.Count(self.payload), 8)

	for k, v in pairs(self.payload) do
		net.WriteString(k)
		net.WriteType(v)
	end

	net.SendToServer()
end

--[[
  Wywołuje się, gdy panel "wysuwa się" w górę (czyli wchodzi do widoku).
  Resetujemy dane i ustawiamy subpanel na "faction" (pierwszy krok).
--]]
function PANEL:OnSlideUp()
	self:ResetPayload()
	self:Populate()
	self.progress:SetProgress(1)

	-- Jeżeli jest tylko jedna frakcja, panel faction automatycznie przejdzie dalej.
	self:SetActiveSubpanel("faction", 0)
end

--[[
  Wywołuje się, gdy panel "chowa się" w dół (czyli wychodzi z widoku).
  Możemy tu dodać operacje sprzątające po zamknięciu.
--]]
function PANEL:OnSlideDown()
end

--[[
  ResetPayload - czyścimy dane gracza (payload) i ewentualnie hooki.
  bWithHooks = true oznacza usunięcie wszystkich istniejących hooków payload.
--]]
function PANEL:ResetPayload(bWithHooks)
	if (bWithHooks) then
		self.hooks = {}
	end

	self.payload = {}

	-- Helix używa self.payload, tutaj tworzymy metody pomocnicze w tabeli.
	function self.payload.Set(payload, key, value)
		self:SetPayload(key, value)
	end

	function self.payload.AddHook(payload, key, callback)
		self:AddPayloadHook(key, callback)
	end

	function self.payload.Prepare(payload)
		self.payload.Set = nil
		self.payload.AddHook = nil
		self.payload.Prepare = nil
	end
end

--[[
  Ustawienie konkretnego klucza (np. "faction", "model", "gender") w payload
  i wywołanie powiązanych hooków (RunPayloadHook).
--]]
function PANEL:SetPayload(key, value)
	self.payload[key] = value
	self:RunPayloadHook(key, value)
end

--[[
  Dodawanie funkcji hook do konkretnego klucza w payload.
  Np. po ustawieniu "model" można ustawić funkcję, która zaktualizuje PanelModel.
--]]
function PANEL:AddPayloadHook(key, callback)
	if (!self.hooks[key]) then
		self.hooks[key] = {}
	end

	self.hooks[key][#self.hooks[key] + 1] = callback
end

--[[
  Uruchomienie (wykonanie) hooków dla konkretnego klucza w payload.
--]]
function PANEL:RunPayloadHook(key, value)
	local hooks = self.hooks[key] or {}

	for _, v in ipairs(hooks) do
		v(value)
	end
end

--[[
  Zwraca panel, w którym mają zostać wyświetlone konkretne elementy (np. "description" → self.descriptionScroll).
  Metoda pomocnicza używana przy generowaniu pól do wprowadzania danych.
--]]
function PANEL:GetContainerPanel(name)
	if (name == "description") then
		return self.descriptionScroll
	elseif (name == "skills") then
		return self.attributesPanel
	end

	return self.descriptionPanel
end

--[[
  AttachCleanup - pozwala dodać panel do listy, aby później został 
  usunięty/odświeżony przy repopulate (Populate()).
--]]
function PANEL:AttachCleanup(panel)
	self.repopulatePanels[#self.repopulatePanels + 1] = panel
end

--[[
  Populate - funkcja odpowiedzialna za wypełnianie subpaneli 
  dynamicznymi elementami (przyciski, pola tekstowe) na podstawie 
  definicji zmiennych postaci (ix.char.vars).
--]]
function PANEL:Populate()
	-- Tworzymy przyciski frakcji tylko raz (lub gdy konieczne).
	if (!self.bInitialPopulate) then
		local lastSelected

		-- Usuwamy stare przyciski frakcji, gdy istnieją.
		for _, v in pairs(self.factionButtons) do
			if (v:GetSelected()) then
				lastSelected = v.faction
			end

			if (IsValid(v)) then
				v:Remove()
			end
		end

		self.factionButtons = {}

		-- Tworzymy przyciski frakcji (z Helixa: ix.faction.teams).
		for _, v in SortedPairs(ix.faction.teams) do
			if (ix.faction.HasWhitelist(v.index)) then
				local button = self.factionButtonsPanel:Add("ixMenuSelectionButton")
				button:SetText("")
				button:SetFont('cellar.buttonsize')
				button:SizeToContents()
				button:SetButtonList(self.factionButtons)
				button.faction = v.index
				button.OnSelected = function(panel)
					local faction = ix.faction.indices[panel.faction]
					local gender = table.Random(faction.genders or {GENDER_MALE, GENDER_FEMALE})
					local models = faction:GetModels(LocalPlayer(), gender)

					self.payload:Set("faction", panel.faction)
					self.payload:Set("gender", gender)
					self.payload:Set("model", math.random(1, #models))
				end
				button.Paint = function(me, w, h)
					-- Malowanie przycisku frakcji
					local gradient = surface.GetTextureID("vgui/gradient-d")
					local gradientUp = surface.GetTextureID("vgui/gradient-u")
					local gradientLeft = surface.GetTextureID("vgui/gradient-l")
					local gradientRadial = Material("helix/gui/radial-gradient.png")

					surface.SetFont('cellar.main.btn')
					local hovered = me:IsHovered()
					local selected = me:GetSelected()
					local hov = selected or hovered
					surface.SetDrawColor(hov and ColorAlpha(v.color, 25) or ColorAlpha(cellar_darker_blue, 43))
					surface.SetTexture(gradientLeft)
					surface.DrawTexturedRect(0, 0, w, h)
					surface.SetDrawColor(hov and ColorAlpha(v.color, 255) or ColorAlpha(cellar_blue, 255))
					surface.DrawTexturedRect(0, 0, w, 1)
					surface.DrawTexturedRect(0, h - 1, w, 1)

					draw.RoundedBox(0, 0, 0, 4, h, hov and v.color or cellar_blue)
					draw.SimpleText(L(v.name):utf8upper(), "cellar.main.btn", 12, h/2, hov and Color(210, 210, 210) or ColorAlpha(color_white, 230), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
					draw.SimpleText(L(v.name):utf8upper(), "cellar.main.btn.blur", 12, h/2, hov and v.color or ColorAlpha(color_white, 230), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				end

				if ((lastSelected and lastSelected == v.index) or (!lastSelected and v.isDefault)) then
					button:SetSelected(true)
				end
			end
		end
	end

	-- Usuwamy panele, które zostały dodane w poprzednich populacjach.
	for i = 1, #self.repopulatePanels do
		self.repopulatePanels[i]:Remove()
	end
	self.repopulatePanels = {}

	-- Jeżeli payload jest pusty, próbujemy ponownie ustawić (domyślną) frakcję.
	if (!self.payload.faction) then
		for _, v in pairs(self.factionButtons) do
			if (v:GetSelected()) then
				v:SetSelected(true)
				break
			end
		end
	end

	self.factionButtonsPanel:SizeToContents()

	-- Zmienna z-Pos do ustalania kolejności Dock(TOP).
	local zPos = 1

	-- Dodajemy pola do wprowadzania danych na podstawie ix.char.vars (np. imię, opis, itp.).
	for k, v in SortedPairsByMemberValue(ix.char.vars, "index") do
		if (!v.bNoDisplay and k != "__SortedIndex") then

			local container = self:GetContainerPanel(v.category or "description")

			if (v.ShouldDisplay and v:ShouldDisplay(container, self.payload) == false) then
				continue
			end

			local panel

			-- Jeżeli zmienna ma własną metodę OnDisplay, wywołujemy ją.
			if (v.OnDisplay) then
				panel = v:OnDisplay(container, self.payload)
			-- Jeżeli jest to zwykły string, tworzymy TextEntry.
			elseif (isstring(v.default)) then
				panel = container:Add("ixTextEntry")
				panel:Dock(TOP)
				panel:SetFont("ixMenuButtonHugeFont")
				panel:SetUpdateOnType(true)
				panel.OnValueChange = function(this, text)
					self.payload:Set(k, text)
				end
			end

			-- Jeżeli panel faktycznie istnieje, dodajemy etykietę (label) i panel do cleanup.
			if (IsValid(panel)) then
				local label = container:Add("DLabel")
				label:SetFont("ixMenuButtonLabelFont")
				label:SetText(L(k):utf8upper())
				label:SizeToContents()
				label:DockMargin(0, 16, 0, 2)
				label:Dock(TOP)

				-- Ustawiamy kolejność, by label był nad panelem
				label:SetZPos(zPos - 1)
				panel:SetZPos(zPos)

				self:AttachCleanup(label)
				self:AttachCleanup(panel)

				if (v.OnPostSetup) then
					v:OnPostSetup(panel, self.payload)
				end

				zPos = zPos + 2
			end
		end
	end

	-- Inicjalne wypełnianie paska postępu (tylko raz).
	if (!self.bInitialPopulate) then
		-- Dodajemy segmenty paska postępu (zależnie od ilości kroków).
		if (#self.factionButtons > 1) then
			self.progress:AddSegment("@faction")
		end

		self.progress:AddSegment("@description")

		-- Jeżeli w sekcji "skills" coś się pojawiło, dodajemy segment "skills".
		if (#self.attributesPanel:GetChildren() > 1) then
			self.progress:AddSegment("@skills")
		end

		-- Jeżeli jest tylko jeden segment, to nie ma sensu pokazywać paska postępu.
		if (#self.progress:GetSegments() == 1) then
			self.progress:SetVisible(false)
		end
	end

	self.bInitialPopulate = true
end

--[[
  Funkcja sprawdzająca poprawność danych w poszczególnych krokach.
  Wywoływana m.in. przy klikaniu "DALEJ" lub "STWÓRZ".
--]]
function PANEL:VerifyProgression(name)
	for k, v in SortedPairsByMemberValue(ix.char.vars, "index") do
		-- Sprawdzamy tylko zmienne z danej kategorii (name), jeśli jest podane.
		if (name ~= nil and (v.category or "description") != name) then
			continue
		end

		local value = self.payload[k]

		-- Jeżeli nie ukrywamy zmiennej lub zmienna ma OnValidate, to sprawdzamy.
		if (!v.bNoDisplay or v.OnValidate) then
			if (v.OnValidate) then
				local result = {v:OnValidate(value, self.payload, LocalPlayer())}

				if (result[1] == false) then
					self:GetParent():ShowNotice(3, L(unpack(result, 2)))
					return false
				end
			end

			self.payload[k] = value
		end
	end

	return true
end

--[[
  Funkcja Paint odpowiada za malowanie tła panelu (efekt blur, tło, tekstury, itp.).
  Wywoływana automatycznie w pętli rysowania Garry's Mod.
--]]
function PANEL:Paint(width, height)
	derma.SkinFunc("PaintCharacterCreateBackground", self, width, height)
	BaseClass.Paint(self, width, height)

	local w, h = width, height
	local background = Material('cellar/main/tab/otherbackground.png')
	local television = Material('cellar/main/tvtexture.png')
	local staticborder = Material('cellar/main/tab/otherborders.png')
	local vignette = ix.util.GetMaterial("helix/gui/vignette.png")
    local helpframe = Material('cellar/main/tab/helpframe1604x754.png')
	local skillsline = Material('cellar/main/tab/skillsline452x16.png')

	DrawBlurIndependent(self)
	surface.SetDrawColor(ColorAlpha(color_white, 190))
	surface.SetMaterial(background)
	surface.DrawTexturedRect(0, 0, w, h)

	surface.SetDrawColor(ColorAlpha(color_black, 170))
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(ColorAlpha(color_white, 90))
	surface.SetMaterial(television)
	surface.DrawTexturedRect(0, 0, w, h)

	surface.SetDrawColor(ColorAlpha(color_white, 240))
	surface.SetMaterial(staticborder)
	surface.DrawTexturedRect(0, 0, w, h)

	surface.SetDrawColor(ColorAlpha(color_black, 255))
	surface.SetMaterial(vignette)
	surface.DrawTexturedRect(0, 0, w, h)
end

--[[ 
  Rejestrujemy panel pod nazwą "ixCharMenuNew", a jako bazę 
  przyjmujemy "ixCharMenuPanel".
--]]
vgui.Register("ixCharMenuNew", PANEL, "ixCharMenuPanel")

--[[ 
  Jeżeli istnieje aktywne ix.gui.characterMenu, to je usuwamy
  i tworzymy nowe. W praktyce odświeżanie panelu.
--]]
if (IsValid(ix.gui.characterMenu)) then
	ix.gui.characterMenu:Remove()

	-- TODO: REMOVE ME (komentarz oryginalny)
	ix.gui.characterMenu = vgui.Create("ixCharMenu")
end
