PLUGIN.name = 'Guilds'
PLUGIN.description = 'Guilds'
PLUGIN.author = 'DrodA'
PLUGIN.version = 1.0

--[[-------------------------------------------------------------------------
Poziom 1
- Lider frakcji oraz jego zastępcy otrzymują możliwość założenia wspólnego banku frakcji. Każdy członek frakcji może wpłacać do niego dowolną sumę pieniędzy (bez ograniczeń).
- Wpłacać środki może każdy członek frakcji, natomiast wypłacać je mogą wyłącznie lider oraz zastępcy.
- Dodatkowo istnieje opcja ustalania wynagrodzeń dla poszczególnych rang według uznania lidera – wypłaty są finansowane z banku frakcji, jeżeli lider tego zechce.

Poziom 2
- Odblokowuje się po zaakceptowaniu przez administrację (podobnie jak kolejne poziomy).
- Frakcja zyskuje dostęp do wspólnego magazynu o rozmiarach 10×10. Każdy członek frakcji może wkładać do niego przedmioty, lecz wyjmować mogą je tylko lider bądź zastępcy.

Poziom 3
- Każdy członek frakcji otrzymuje stały bonus +15 HP do swojej maksymalnej puli zdrowia.
- Dodatkowo zostaje wprowadzony pasywny regenerujący efekt: +2 HP co 5 godzin, uwzględniając także czas, gdy gracz jest offline.

Poziom 4
- Limit członków frakcji wzrasta z 6 do 20.
---------------------------------------------------------------------------]]

ix.config.Add('minGuildNameLength', 3, 'The minimum number of characters a player can have.', nil, {
  data = { min = 1, max = 32 },
  category = 'guild'
})

ix.config.Add('maxGuildNameLength', 32, 'The maximum number of characters a player can have.', nil, {
  data = { min = 1, max = 32 },
  category = 'guild'
})

CAMI.RegisterPrivilege({ Name = 'Guilds - Manage guilds', MinAccess = 'superadmin' })

ix.util.Include 'meta/sh_guild.lua'

ix.util.Include 'cl_plugin.lua'
ix.util.Include 'sv_plugin.lua'

ix.util.Include 'database/sv_database.lua'

ix.char.RegisterVar('guildUID', {
  field = 'guild',
  fieldType = ix.type.number,
  default = -1,
  bNoDisplay = true,
  OnSet = function(this, value)
    local client = this:GetPlayer()

    if (IsValid(client)) then
      this.vars.guildUID = value

      net.Start('ixCharacterVarChanged')
        net.WriteUInt(this:GetID(), 32)
        net.WriteString('guildUID')
        net.WriteType(this.vars.guildUID)
      net.Broadcast()
    end
  end,

  OnGet = function(this, default)
    return this.vars.guildUID or -1
  end,

  OnAdjust = function(this, client, data, value, new_data)
    new_data.guildUID = value
  end
})

ix.command.Add('GuildManager', {
  description = '@cmdGuildManager',
  superAdminOnly = true,
  OnRun = function(this, client)
    net.Start('ix_guild_mgmt_get_all')
    net.Send(client)
  end
})
