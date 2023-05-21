local _, ns = ...
local Dispels = ns.Dispels
local SpellList = Dispels.SpellList or {}

local band = bit.band
local format = string.format
local tinsert = table.insert
local tremove = table.remove
-- local twipe = table.wipe

-- Blizzard
local GetInstanceInfo = _G.GetInstanceInfo
local IsInInstance = _G.IsInInstance
local IsInGroup = _G.IsInGroup
local IsInRaid = _G.IsInRaid
local CombatLogGetCurrentEventInfo = _G.CombatLogGetCurrentEventInfo
local GetSpellLink = _G.GetSpellLink
local SendChatMessage = _G.SendChatMessage
local COMBATLOG_OBJECT_AFFILIATION_MINE = _G.COMBATLOG_OBJECT_AFFILIATION_MINE     -- 0x00000001

local CombatEvents = {
    SPELL_DISPEL = true,
    SPELL_STOLEN = true,
    SPELL_DISPEL_FAILED = true
}

function Dispels:BuildSpellList(instanceID)
    if (not instanceID) then instanceID = 0 end
    if SpellList[instanceID] then
        for spellID, enabled in pairs(SpellList[instanceID]) do
            local name = GetSpellInfo(spellID)
            if (name) then
                self.spells[spellID] = enabled
            else
                print("|cffff330fDispels WARNING:|r", "Invalid spellID (" .. spellID .. ")")
            end
        end
    end
end

Dispels:RegisterEvent("PLAYER_LOGIN")
Dispels:RegisterEvent("PLAYER_ENTERING_WORLD")
Dispels:SetScript("OnEvent", function(self, event, ...)
    -- call one of the event handlers
    self[event](self, ...)
end)

function Dispels:PLAYER_LOGIN()
    self.unit = "player"
    self.guid = UnitGUID(self.unit)
    self.chatType = "SAY"
    self.spells = {}
end

function Dispels:PLAYER_ENTERING_WORLD()
    -- local IsInInstance, instanceType = IsInInstance()
    local inInstance, inGroup, inRaid = IsInGroup(LE_PARTY_CATEGORY_INSTANCE), IsInGroup(), IsInRaid()
    local instanceName, instanceType, _, _, _, _, _, instanceID, _, _ = GetInstanceInfo()
    
    if (instanceType == "raid" or instanceType == "party") then
        self:BuildSpellList()
        self:BuildSpellList(instanceID)
        self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    else
        self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        self.spells = table.wipe(self.spells)
    end

    -- -- check group status
    -- if (instanceType == "raid") or (instanceType == "party") then
    --     if (inInstance) then
    --         chatType = "INSTANCE_CHAT"
    --     elseif (inRaid) then
    --         chatType = "RAID"
    --     elseif (inGroup) then
    --         chatType = "PARTY"
    --     else
    --         chatType = "SAY"
    --     end
    -- else
    --     chatType = "SAY"
    -- end
end

function Dispels:COMBAT_LOG_EVENT_UNFILTERED()
    local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
        destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()

    -- filter combat events type
    if (not CombatEvents[eventType]) then return end

    -- filter casters, only player or belong to player
    if (band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= COMBATLOG_OBJECT_AFFILIATION_MINE) or (sourceGUID ~= self.guid) then return end

    local spellID, spellName, spellSchool, extraSpellID, extraSpellName, extraSchool,
        auraType = select(12, CombatLogGetCurrentEventInfo())

    if (self.spells[extraSpellID]) then
        local extraSpellLink = GetSpellLink(extraSpellID)
        if (eventType == "SPELL_DISPEL") then
            self:SendChatMessage("%s %s dispeled!", destName, extraSpellLink)
        elseif (eventType == "SPELL_STOLEN") then
            self:SendChatMessage("%s's %s stolen!", destName, extraSpellLink)
        elseif (eventType == "SPELL_DISPEL_FAILED") then
            self:SendChatMessage("%s's %s dispel FAILED!", destName, extraSpellLink)
        end
    end
end 

function Dispels:SendChatMessage(fmt, ...)
    local text = format(fmt, ...)
    SendChatMessage(text, self.chatType or "SAY")
end
