-- sv_plugin.lua

util.AddNetworkString("ixShockPain")
util.AddNetworkString("ixBleedingEffect")
util.AddNetworkString("ixCritData")
util.AddNetworkString("ixCritUse")
util.AddNetworkString("ixCritApply")
util.AddNetworkString("RagdollMenu")

-- Główna funkcja zadawania obrażeń
function PLUGIN:TakeAdvancedDamage(entity, bloodDmgInfo)
    if not entity:IsPlayer() or not entity:Alive() then
        return
    end

    local character = entity:GetCharacter()
    if not character then
        return
    end

    character:TakeAdvancedDamage(bloodDmgInfo)
end

-- Rozszerzamy metatablicę postaci (ix.meta.character)
do
    local CHAR = ix.meta.character
    local PLUGIN = PLUGIN

    -------------------------------------------------------------------------
    -- FUNKCJE DODATKOWE DO KRWAWIENIA ETAPOWEGO I RECOVERY
    -------------------------------------------------------------------------

    -- Wywołanie tej funkcji uruchomi etapowe krwawienie oraz sprawdzanie,
    -- czy krwawienie ustaje co 50 sekund (30% szans).
    function CHAR:StartStageBleeding()
        local player = self:GetPlayer()
        -- Upewniamy się, że player istnieje i jest graczem
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local steamID = player:SteamID()
        local identifierStage = "BleedingStage_" .. steamID
        local identifierStop = "BleedingStopCheck_" .. steamID

        -- Najpierw usuwamy stare timery, jeśli istnieją
        timer.Remove(identifierStage)
        timer.Remove(identifierStop)

        -- Timer co 50 sekund sprawdza, czy krwawienie ustaje (np. 30% szans).
        timer.Create(identifierStop, 50, 0, function()
            if not (IsValid(player) and player:IsPlayer()) then
                timer.Remove(identifierStop)
                timer.Remove(identifierStage)
                return
            end

            -- Debug info
            print("[DEBUG] BleedingStopCheck_ timer tick dla " .. player:Nick())

            if math.random(1, 100) <= 30 then
                print("[DEBUG] Krwawienie ustaje dla " .. player:Nick())
                self:SetBleeding(false)
                timer.Remove(identifierStop)
                timer.Remove(identifierStage)
            end
        end)

        -- Określamy interwał sprawdzania etapów krwawienia w zależności od ilości krwi
        local blood = self:GetBlood() or 0
        local interval = 0

        if blood <= 0 then
            -- Jeśli krew <= 0, gracz ginie
            player:Kill()
            print("[DEBUG] Gracz " .. player:Nick() .. " ginie (blood <= 0) w StartStageBleeding()")
            return
        elseif blood >= 2500 and blood <= 3000 then
            interval = 90
        elseif blood >= 2000 and blood < 2500 then
            interval = 60
        elseif blood > 0 and blood < 2000 then
            interval = 30
        end

        if interval > 0 then
            timer.Create(identifierStage, interval, 0, function()
                if not (IsValid(player) and player:IsPlayer()) then
                    timer.Remove(identifierStage)
                    return
                end

                local currentBlood = self:GetBlood() or 0
                if currentBlood <= 0 then
                    player:Kill()
                    print("[DEBUG] Gracz " .. player:Nick() .. " ginie (blood <= 0) w BleedingStage timer.")
                    timer.Remove(identifierStage)
                    return
                end

                print("[DEBUG] BleedingStage_ timer tick dla " .. player:Nick() .. ", blood=" .. currentBlood)

                -- W zależności od poziomu krwi losowo przewracamy gracza.
                if currentBlood >= 2500 and currentBlood <= 3000 then
                    -- 50% szans na przewrócenie co 90 sekund
                    if math.random(1, 100) <= 50 then
                        player:SetRagdolled(true, 5, 5)
                    end
                elseif currentBlood >= 2000 and currentBlood < 2500 then
                    -- 70% szans co 60 sekund
                    if math.random(1, 100) <= 70 then
                        player:SetRagdolled(true, 5, 5)
                    end
                elseif currentBlood > 0 and currentBlood < 2000 then
                    -- Automatyczne przewrócenie co 30 sekund
                    player:SetRagdolled(true, 10, 5)
                end
            end)
        end
    end

    -- Funkcje do regeneracji HP głowy i ogólnego HP co 30 sekund
    -- w zależności od powodu utraty przytomności (head/overall).
    function CHAR:StartHPRecovery(player, recoveryReason)
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local steamID = player:SteamID()

        if recoveryReason == "head" then
            timer.Create("HeadHPRecovery_" .. steamID, 30, 0, function()
                if not (IsValid(player) and player:IsPlayer()) then
                    timer.Remove("HeadHPRecovery_" .. steamID)
                    return
                end

                local headHP = self:GetLimbHealth("head") or 0
                self:SetLimbHealth("head", headHP + 1)
            end)
        elseif recoveryReason == "overall" then
            timer.Create("OverallHPRecovery_" .. steamID, 30, 0, function()
                if not (IsValid(player) and player:IsPlayer()) then
                    timer.Remove("OverallHPRecovery_" .. steamID)
                    return
                end

                local currentHP = player:Health()
                player:SetHealth(currentHP + 3)
            end)
        end
    end

    -------------------------------------------------------------------------
    -- ISTNIEJĄCE FUNKCJE
    -------------------------------------------------------------------------

    function CHAR:SetupUnconscious()
        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local steamID = player:SteamID()
        local identifier = "bsUnconscious" .. steamID

        timer.Create(identifier, 1, 0, function()
            if not (IsValid(player) and player:IsPlayer()) then
                timer.Remove(identifier)
                return
            end

            if not player:Alive() then
                return
            end

            local shock = self:GetShock()
            if shock > 0 then
                self:SetShock(math.max(shock - 5, 0))
            end

            local blood = self:GetBlood()
            local hp = PLUGIN:GetMinimalHealth(self)
            local head = self:GetLimbHealth("head")

            -- Warunki przebudzenia
            if (blood >= 3000) and (hp >= 38) and (head >= 5) then
                if player:IsUnconscious() and not player.ixUnconsciousOut then
                    player:SetAction("@wakingUp", 100, function(ply)
                        ply.ixUnconsciousOut = nil
                        ply:SetLocalVar("knocked", false)
                        ply:SetRagdolled(false)
                    end)
                    player.ixUnconsciousOut = true
                end
                return
            end

            -- Jeśli gracz nie jest nieprzytomny, losowo go przewracamy
            if not player:IsUnconscious() then
                local ratio = math.Clamp(blood / 3000, 0, 1)
                local chance = 1 + (74 * (1 - ratio))

                if math.random(1, 100) <= chance and player:GetMoveType() ~= MOVETYPE_NOCLIP then
                    player:DropActiveWeaponItem()
                    player:SetRagdolled(true)
                    player.ixRagdoll.ixGrace = nil
                    player:SetLocalVar("knocked", true)
                end
            else
                -- Gracz już nieprzytomny - sprawdzamy, czy zaczął się już proces wybudzania
                local ratio = math.Clamp(blood / 3000, 0, 1)
            
                -- Jeśli jeszcze nie trwa akcja wybudzania (ixRegainConscious = false),
                -- to uruchamiamy ją. Jeśli już trwa, nic nie robimy.
                if not player.ixRegainConscious then
                    local time = 15 + math.Round(60 * math.max((1 - ratio), 0))
            
                    player:SetAction("@wakingUp", time, function(ply)
                        ply.ixUnconsciousOut = nil
                        ply:SetLocalVar("knocked", false)
                        ply:SetRagdolled(false)
                        ply.ixRegainConscious = false
                    end)
            
                    -- Ustawiamy flagę, że akcja wybudzania jest w toku
                    player.ixRegainConscious = true
                end
            end            
        end)
    end

    function CHAR:SetupBleeding(status)
        status = status or self:IsBleeding()

        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local steamID = player:SteamID()
        local identifier = "bsBleeding" .. steamID

        player:SetNetVar("isBleeding", status)
        player:SetNetVar("bleedingBone", status and self:GetDmgData().bleedBone or 0)

        net.Start("ixBleedingEffect")
            net.WriteEntity(player)
        net.Broadcast()

        if status then
            -- Timer 1s, ciągłe zadawanie obrażeń krwią
            timer.Create(identifier, 1, 0, function()
                if not (IsValid(player) and player:IsPlayer()) then
                    timer.Remove(identifier)
                    return
                end

                -- Sprawdzamy, czy to wciąż ta sama postać (char).
                if player:GetCharacter() ~= self or not self:IsBleeding() then
                    timer.Remove(identifier)
                    return
                end

                local bleedDmg = self:GetDmgData().bleedDmg or 0
                self:AddBloodDamage(bleedDmg)
            end)

            -- Etapowe krwawienie (co 30/60/90s) + sprawdzanie ustania (50s)
            self:StartStageBleeding()
        else
            -- Jeśli przestajemy krwawić, usuwamy timer 1s
            timer.Remove(identifier)

            -- Usuwamy też timery etapowego krwawienia
            timer.Remove("BleedingStage_" .. steamID)
            timer.Remove("BleedingStopCheck_" .. steamID)
        end
    end

    function CHAR:SetupFeelPain(status)
        status = status or self:IsFeelPain()

        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local steamID = player:SteamID()
        local identifier = "bsPain" .. steamID

        if status then
            timer.Create(identifier, 1, 0, function()
                if not (IsValid(player) and player:IsPlayer()) then
                    timer.Remove(identifier)
                    return
                end

                if player:GetCharacter() ~= self or not self:IsFeelPain() then
                    timer.Remove(identifier)
                    return
                end

                local shock = self:GetShock()
                if shock > 0 then
                    local curTime = CurTime()
                    if not player.nextPainMoan or curTime >= player.nextPainMoan then
                        if IsValid(player.ixRagdoll) then
                            player.nextPainMoan = curTime + math.random(40, 120)
                            return
                        end

                        local sound = hook.Run("GetPlayerPainSound", player)
                        if sound then
                            player:EmitSound(sound)
                        end

                        if math.random(1, 100) <= 25 then
                            net.Start("ixShockPain")
                                net.WriteUInt(1, 3)
                            net.Send(player)
                        end

                        player.nextPainMoan = curTime + math.random(40, 120)
                    end
                else
                    if not self:IsBleeding() then
                        if math.random(1, 100) < 40 then
                            self:SetFeelPain(false)
                        end
                    end
                end
            end)
        else
            timer.Remove(identifier)
        end
    end

    -------------------------------------------------------------------------
    -- ZMIANY W AddShockDamage i AddBloodDamage, aby gracz UMARŁ
    -------------------------------------------------------------------------

    function CHAR:AddShockDamage(shockDmg)
        if shockDmg <= 0 then
            return
        end

        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local result = math.Round(self:GetShock() + shockDmg)
        local delta = math.max(result - self:GetBlood(), 0)

        self:SetShock(result)

        -- net do klienta
        net.Start("ixShockPain")
            net.WriteUInt(1, 5)
        net.Send(player)

        if player:Alive() then
            if delta >= 5000 then
                -- Zamiast SetCriticalState - natychmiastowa śmierć
                player:Kill()
                print("[DEBUG] Gracz " .. player:Nick() .. " ginie od szoku (delta >= 5000).")
            elseif delta > 500 then
                if not IsValid(player.ixRagdoll) and not player:IsUnconscious() then
                    player:DropActiveWeaponItem()
                    local time = math.Round(30 + (30 * (delta / 5000)))
                    player:SetRagdolled(true, time, time)
                end
            end
        end
    end

    function CHAR:AddBloodDamage(bloodDmg)
        if bloodDmg <= 0 then
            return
        end

        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        local blood = self:GetBlood()
        local delta = blood - bloodDmg
        self:SetBlood(math.max(delta, -1))

        if delta <= 0 and player:Alive() then
            -- Natychmiastowa śmierć, zamiast SetCriticalState
            player:Kill()
            print("[DEBUG] Gracz " .. player:Nick() .. " ginie (blood <= 0).")
        end
    end

    function CHAR:SetFeelPain(status)
        -- Wyłączone dla OTA
        if self:IsOTA() then
            return
        end

        local dmgData = self:GetDmgData()
        dmgData.isPain = status
        self:SetDmgData(dmgData)
        self:SetupFeelPain(status)
    end

    function CHAR:SetBleeding(status, bone, dmg)
        dmg = dmg or 1
        status = status or false
        bone = bone or ""

        local dmgData = self:GetDmgData()
        if status then
            local bleedDmg = dmgData.bleedDmg or 5
            if dmg <= bleedDmg then
                dmg = bleedDmg
            end
        end

        dmgData.isBleeding = status
        dmgData.bleedBone = status and self:GetPlayer():LookupBone(bone) or 0
        dmgData.bleedDmg = status and math.Round(dmg) or 0

        self:SetDmgData(dmgData)
        self:SetupBleeding(status)
    end

    function CHAR:HandleBrokenBones()
        local player = self:GetPlayer()
        if not (IsValid(player) and player:IsPlayer()) then
            return
        end

        if player:GetMoveType() == MOVETYPE_NOCLIP then
            return
        end

        if self:IsOTA() then
            return
        end

        local rightLeg = self:GetLimbDamage(HITGROUP_RIGHTLEG)
        local leftLeg = self:GetLimbDamage(HITGROUP_LEFTLEG)
        -- Ewentualnie tu można coś zrobić z prędkością ruchu
    end

    function CHAR:TakeAdvancedDamage(bloodDmgInfo)
        self:AddShockDamage(bloodDmgInfo:GetShock())
        self:AddBloodDamage(bloodDmgInfo:GetBlood())

        if math.random(1, 100) < bloodDmgInfo:GetBleedChance() then
            self:SetBleeding(true, bloodDmgInfo.targetBone, bloodDmgInfo.bleedDmg)
        end

        self:HandleBrokenBones()

        local owner = self:GetPlayer()
        local hp = PLUGIN:GetMinimalHealth(self)
        local head = self:GetLimbHealth("head")

        -- Jeśli HP < 38 lub head < 5 => w oryginale stan krytyczny,
        -- ale skoro chcemy realnie zabić lub zostawić, decyduj co wolisz:
        if ((hp < 38) or (head < 5)) and not owner:IsUnconscious() then
            -- owner:SetCriticalState(true) -- Oryginalnie
            -- Lub nic, jeśli wolisz natychmiast zabić:
            -- owner:Kill()
        end
    end
end

------------------------------------------------------------------------------
-- ROZSZERZENIE METATABLICY GRACZA (SetRagdolled)
------------------------------------------------------------------------------

do
    local PLAYER = FindMetaTable("Player")

    function PLAYER:SetRagdolled(bState, time, getUpGrace)
        if (not self:Alive() or self:Team() == FACTION_DISPATCH) then
            return
        end

        getUpGrace = getUpGrace or time or 5

        if (bState) then
            local entity
            if (IsValid(self.ixRagdoll)) then
                entity = self.ixRagdoll
            else
                entity = self:CreateServerRagdoll()
                entity:CallOnRemove("fixer", function()
                    if (IsValid(self) and self:GetCharacter()) then
                        self:SetLocalVar("blur", nil)
                        self:SetLocalVar("ragdoll", nil)
                        self:SetNetVar("doll", nil)

                        if (not entity.ixNoReset) then
                            self:SetPos(entity:GetPos())
                        end

                        self:SetNoDraw(false)
                        self:SetNotSolid(false)
                        self:SetMoveType(MOVETYPE_WALK)
                        self:SetLocalVelocity(IsValid(entity) and entity.ixLastVelocity or vector_origin)
                        self:SetCriticalState(false)
                    end

                    if (IsValid(self) and not entity.ixIgnoreDelete) then
                        if (entity.ixWeapons) then
                            for _, v in ipairs(entity.ixWeapons) do
                                if (v.class) then
                                    local weapon = self:Give(v.class, true)
                                    if not IsValid(weapon) then continue end

                                    if (v.item) then
                                        weapon.ixItem = v.item
                                    end

                                    self:SetAmmo(v.ammo, weapon:GetPrimaryAmmoType())
                                    weapon:SetClip1(v.clip)
                                elseif (v.item and v.invID == v.item.invID) then
                                    v.item:Equip(self, true, true)
                                    self:SetAmmo(v.ammo, self.carryWeapons[v.item.weaponCategory]:GetPrimaryAmmoType())
                                end
                            end
                        end

                        if (entity.ixActiveWeapon) then
                            if (self:HasWeapon(entity.ixActiveWeapon)) then
                                self:SetActiveWeapon(self:GetWeapon(entity.ixActiveWeapon))
                            else
                                local weapons = self:GetWeapons()
                                if (#weapons > 0) then
                                    self:SetActiveWeapon(weapons[1])
                                end
                            end
                        end
                    end
                end)

                self.ixRagdoll = entity
                entity.ixWeapons = {}
                entity.ixPlayer = self

                if (IsValid(self:GetActiveWeapon())) then
                    entity.ixActiveWeapon = self:GetActiveWeapon():GetClass()
                end

                for _, v in ipairs(self:GetWeapons()) do
                    if (v.ixItem and v.ixItem.Equip and v.ixItem.Unequip) then
                        entity.ixWeapons[#entity.ixWeapons + 1] = {
                            item = v.ixItem,
                            invID = v.ixItem.invID,
                            ammo = self:GetAmmoCount(v:GetPrimaryAmmoType())
                        }
                        v.ixItem:Unequip(self, false)
                    else
                        local clip = v:Clip1()
                        local reserve = self:GetAmmoCount(v:GetPrimaryAmmoType())
                        entity.ixWeapons[#entity.ixWeapons + 1] = {
                            class = v:GetClass(),
                            item = v.ixItem,
                            clip = clip,
                            ammo = reserve
                        }
                    end
                end
            end

            self:SetLocalVar("blur", 25)

            if (getUpGrace) then
                entity.ixGrace = CurTime() + getUpGrace
            end

            if (time and time > 0) then
                entity.ixStart = CurTime()
                entity.ixFinish = entity.ixStart + time
                self:SetAction("@wakingUp", nil, nil, entity.ixStart, entity.ixFinish)
            end

            self:GodDisable()
            self:StripWeapons()
            self:SetMoveType(MOVETYPE_OBSERVER)
            self:SetNoDraw(true)
            self:SetNotSolid(true)

            local uniqueID = "ixUnRagdoll" .. self:SteamID()
            if (time) then
                timer.Create(uniqueID, 0.33, 0, function()
                    if (IsValid(entity) and IsValid(self) and self.ixRagdoll == entity) then
                        local velocity = entity:GetVelocity()
                        entity.ixLastVelocity = velocity
                        self:SetPos(entity:GetPos())

                        if (velocity:Length2D() >= 8) then
                            if (not entity.ixPausing) then
                                -- self:SetAction() -- << to kasowało pasek, skomentowane
                                entity.ixPausing = true
                            end
                            return
                        elseif (entity.ixPausing) then
                            self:SetAction("@wakingUp", time)
                            entity.ixPausing = false
                        end

                        time = time - 0.33
                        if (time <= 0) then
                            entity:Remove()
                        end
                    else
                        timer.Remove(uniqueID)
                    end
                end)
            else
                timer.Create(uniqueID, 0.33, 0, function()
                    if (IsValid(entity) and IsValid(self) and self.ixRagdoll == entity) then
                        self:SetPos(entity:GetPos())
                    else
                        timer.Remove(uniqueID)
                    end
                end)
            end

            self:SetLocalVar("ragdoll", entity:EntIndex())
            self:SetNetVar("doll", entity:EntIndex())

            hook.Run("OnCharacterFallover", self, entity, true)

            net.Start("RagdollMenu")
                net.WriteUInt(self:EntIndex(), 32)
                net.WriteUInt(entity:EntIndex(), 32)
            net.Broadcast()
        elseif (IsValid(self.ixRagdoll)) then
            self.ixRagdoll:Remove()
            hook.Run("OnCharacterFallover", self, nil, false)
        end
    end
end

------------------------------------------------------------------------------
-- FUNKCJA PlayerLoadedCharacter - WYWOŁANIE WSZYSTKIEGO PO ZAŁADOWANIU POSTACI
------------------------------------------------------------------------------

function PLUGIN:PlayerLoadedCharacter(client, character, oldCharacter)
    client.KilledByRP = nil
    client:SetNetVar("doll", nil)
    client:SetLocalVar("knocked", false)
    client.ixUnconsciousOut = nil
    client:SetNetVar("crit", nil)

    if character:GetData("crit") then
        client:SetHealth(1)
        client:SetNetVar("crit", true)
        client:SetRagdolled(true)
        client.ixRagdoll.ixGrace = nil
        client:SetLocalVar("knocked", true)
    end

    -- Uruchamiamy systemy:
    character:SetupUnconscious()
    character:SetupBleeding()
    character:SetupFeelPain()
    character:HandleBrokenBones()
end



