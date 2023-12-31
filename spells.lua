local _, ns = ...
local Dispels = ns.Dispels

-- referece: https://wowpedia.fandom.com/wiki/InstanceID

Dispels.SpellList = {
    --[[ Classic ]]--
        -- Shadowfang Keep
        [33] = {},
        -- The Stockade
        [34] = {},
        -- The Deadmines
        [36] = {},
        -- Wailing Caverns
        [43] = {},
        -- Razorfen Kraul
        [47] = {},
        -- Blackfathom Deeps
        [48] = {},
        -- Uldaman
        [70] = {},
        -- Gnomeregan
        [90] = {},
        -- The Temple of Atal'Hakkar
        [109] = {},
        -- Razorfen Downs
        [129] = {},
        -- Zul'Farrak
        [209] = {},
        -- Blackrock Spire
        [229] = {},
        -- Blackrock Depths
        [230] = {},
        -- Stratholme
        [329] = {},
        -- Maraudon
        [349] = {},
        -- Ragefire Chasm
        [389] = {},
        -- Dire Maul
        [429] = {},
        -- Scarlet Halls
        [1001] = {},
        -- Scarlet Monastery
        [1004] = {},
        -- Scholomance
        [1007] = {},

        -- Molten Core
        [409] = {},
        -- Blackwing Lair
        [469] = {},
        -- Ruins of Ahn'Qiraj
        [509] = {},
        -- Temple of Ahn'Qiraj
        [531] = {},

    -- [[ The Burning Crusade ]]--
        -- The Black Morass
        [269] = {},
        -- The Shattered Halls
        [540] = {},
        -- The Blood Furnace
        [542] = {},
        -- Hellfire Ramparts
        [543] = {},
        -- The Steamvault
        [545] = {},
        -- The Underbog
        [546] = {},
        -- The Slave Pens
        [547] = {},
        -- The Arcatraz
        [552] = {},
        -- The Botanica
        [553] = {},
        -- The Mechanar
        [554] = {},
        -- Shadow Labyrinth
        [555] = {},
        -- Sethekk Halls
        [556] = {},
        -- Mana-Tombs
        [557] = {},
        -- Auchenai Crypts
        [558] = {},
        -- Old Hillsbrad Foothills
        [560] = {},
        -- Magisters' Terrace
        [585] = {},

        -- Karazhan
        [532] = {},
        -- Hyjal Summit
        [534] = {},
        -- Magtheridon's Lair
        [544] = {},
        -- Serpentshrine Cavern
        [548] = {},
        -- Tempest Keep
        [550] = {},
        -- Black Temple
        [564] = {},
        -- Gruul's Lair
        [565] = {},
        -- Sunwell Plateau
        [580] = {},

    --[[ Wrath of the Lich King ]]--
        -- Utgarde Keep
        [574] = {},
        -- Utgarde Pinnacle
        [575] = {},
        -- The Nexus
        [576] = {},
        -- The Oculus
        [578] = {},
        -- The Culling of Stratholme
        [595] = {},
        -- Halls of Stone
        [599] = {},
        -- Drak'Tharon Keep
        [600] = {},
        -- Azjol-Nerub
        [601] = {},
        -- Halls of Lightning
        [602] = {},
        -- Gundrak
        [604] = {},
        -- The Violet Hold
        [608] = {},
        -- Ahn'kahet: The Old Kingdom
        [619] = {},
        -- The Forge of Souls
        [632] = {},
        -- Trial of the Champion
        [650] = {},
        -- Pit of Saron
        [658] = {},
        -- Halls of Reflection
        [668] = {},

        -- Onyxia's Lair
        [249] = {},
        -- Naxxramas
        [533] = {},
        -- Ulduar
        [603] = {},
        -- The Obsidian Sanctum
        [615] = {},
        -- The Eye of Eternity
        [616] = {},
        -- Vault of Archavon
        [624] = {},
        -- Icecrown Citadel
        [631] = {},
        -- Trial of the Crusader
        [649] = {},
        -- The Ruby Sanctum
        [724] = {},

    --[[ Cataclysm ]]--
        -- Zul'Aman
        [568] = {},
        -- Throne of the Tides
        [643] = {},
        -- Halls of Origination
        [644] = {},
        -- Blackrock Caverns
        [645] = {},
        -- The Vortex Pinnacle
        [657] = {
            [87618] = true                   -- Static Cling
        },
        -- Grim Batol
        [670] = {},
        -- The Stonecore
        [725] = {},
        -- Lost City of the Tol'vir
        [755] = {},
        -- Zul'Gurub
        [859] = {},
        -- End Time
        [938] = {},
        -- Well of Eternity
        [939] = {},
        -- Hour of Twilight
        [940] = {},

        -- Blackwing Descent
        [669] = {},
        -- The Bastion of Twilight
        [671] = {},
        -- Firelands
        [720] = {},
        -- Throne of the Four Winds
        [754] = {},
        -- Baradin Hold
        [757] = {},
        -- Dragon Soul
        [967] = {},

    --[[ Mists of Pandaria ]]--
        -- Shado-pan Monastery
        [959] = {},
        -- Temple of the Jade Serpent
        [960] = {
            [106113] = true
        },
        -- Stormstout Brewery
        [961] = {},
        -- Gate of the Setting Sun
        [962] = {},
        -- Mogu'Shan Palace
        [994] = {},
        -- Siege of Niuzao Temple
        [1011] = {},

        -- Terrace of Endless Spring
        [996] = {
            [117398] = true,                 -- Lightning Prison
            [117235] = true,                 -- Purified
            [123011] = true                  -- Terrorize
        },
        -- Mogu'shan Vaults
        [1008] = {
            [117961] = true,                 -- Impervious Shield
            [117697] = true,                 -- Shield of Darkness
            [117837] = true,                 -- Delirious
            [117949] = true                  -- Closed Circuit
        },
        -- Heart of Fear
        [1009] = {
            [122149] = true,                 -- Quickening
            [124862] = true                  -- Visions of Demise
        },
        -- Throne of Thunder
        [1098] = {},
        -- Siege of Orgrimmar
        [1136] = {
            [143791] = true                  -- Corrosive Blood
        },

    --[[ Warlords of Draenor ]]--
        -- Auchindoun
        [1182] = {},
        -- Bloodmaul Slag Mines
        [1175] = {},
        -- Shadowmoon Burial Grounds
        [1176] = {},
        -- Iron Docks
        [1195] = {},
        -- Grimrail Depot
        [1208] = {},
        -- Skyreach
        [1209] = {},
        -- The Everbloom
        [1279] = {},
        -- Upper Blackrock Spire
        [1358] = {},

        -- Blackrock Foundry
        [1205] = {},
        -- Highmaul
        [1228] = {},
        -- Hellfire Citadel
        [1448] = {},

    --[[ Legion ]]--
        -- Eye of Azshara
        [1456] = {},
        -- Neltharion's Lair
        [1458] = {},
        -- Darkheart Thicket
        [1466] = {},
        -- Halls of Valor
        [1477] = {},
        -- Maw of Souls
        [1492] = {},
        -- Vault of the Wardens
        [1493] = {},
        -- Black Rook Hold
        [1501] = {},
        -- The Arcway
        [1516] = {},
        -- Violet Hold
        [1544] = {},
        -- Court of Stars
        [1571] = {},
        -- Return to Karazhan
        [1651] = {},
        -- Cathedral of Eternal Night
        [1677] = {},
        -- Seat of the Triumvirate
        [1753] = {},

        -- The Emerald Nightmare
        [1520] = {},
        -- The Nighthold
        [1530] = {},
        -- Trial of Valor
        [1648] = {},
        -- Tomb of Sargeras
        [1676] = {},
        -- Antorus, the Burning Throne
        [1712] = {},

    --[[ Battle for Azeroth ]]--
        -- The MOTHERLODE!!
        [1594] = {},
        -- Freehold
        [1754] = {
            [257908] = true                  -- Oiled Blade
        },
        -- Kings' Rest
        [1762] = {},
        -- Atal'Dazar
        [1763] = {},
        -- Tol Dagor
        [1771] = {},
        -- Siege of Boralus
        [1822] = {},
        -- The Underrot
        [1841] = {},
        -- Waycrest Manor
        [1862] = {},
        -- Shrine of the Storm
        [1864] = {},
        -- Temple of Sethraliss
        [1877] = {},
        -- Operation: Mechagon
        [2097] = {},

        -- Uldir
        [1861] = {},
        -- Battle of Dazar'alor
        [2070] = {},
        -- Crucible of Storms
        [2096] = {},
        -- The Eternal Palace
        [2164] = {},
        -- Ny'alotha
        [2217] = {},

    --[[ Shadowlands ]]--
        -- Sanguine Depths
        [2284] = {},
        -- Spires of Ascension
        [2285] = {},
        -- The Necrotic Wake
        [2286] = {},
        -- Halls of Atonement
        [2287] = {},
        -- Plaguefall
        [2289] = {},
        -- Mists of Tirna Scithe
        [2290] = {},
        -- De Other Side
        [2291] = {},
        -- Theater of Pain
        [2293] = {},
        -- Tazavesh the Veiled Market
        [2441] = {},

        -- Castle Nathria
        [2296] = {},
        -- Sanctum of Domination
        [2450] = {},
        -- Sepulcher of the First Ones
        [2481] = {},

    --[[ Dragonflight ]]--
        -- Uldaman: Legacy of Tyr
        [2451] = {},
        -- The Azure Vault
        [2515] = {},
        -- The Nokhud Offensive
        [2516] = {
            [376827] = true                  -- Conductive Strike
        },
        -- Neltharus
        [2519] = {},
        -- Brackenhide Hollow
        [2520] = {
            [381379] = true                  -- Decayed Senses
        },
        -- Ruby Life Pools
        [2521] = {
            [373589] = true,                 -- Primal Chill
            [372749] = true                  -- Ice Shield
        },
        -- Algeth'ar Academy
        [2526] = {
            [389033] = true                  -- Lasher Toxin
        },
        -- Halls of Infusion
        [2527] = {},

        -- Vault of the Incarnates
        [2522] = {},
        -- Aberrus, the Shadowed Crucible
        [2569] = {},
    -- General
    [0] = {
    --     [395938] = true,    -- Necrotic Decay
    --     [395946] = true,    -- Putrid Bolt Poison
    --     [395950] = true     -- Festeing Burst Poison
    }
}

local General = Dispels.SpellList[0]

if (Dispels.isRetail) then
    -- Mithyc Affixes
    General[395938] = true     -- Necrotic Decay
    General[395946] = true     -- Putrid Bolt Poison
    General[395950] = true     -- Festeing Burst Poison
    General[409472] = true     -- Diseased Spirit
end
