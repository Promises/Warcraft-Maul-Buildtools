library TestLib requires Utility



    private function setUpHybrid takes nothing returns nothing
         call Utility_DisplayMessageToAllPlayers("Welcome to Warcraft Maul Reimagined")
         call Utility_DisplayMessageToAllPlayers("This is build: NaN, built May 07 2019.")
         //========== TIER: One
         set udg_TierOneTowers[0] = 'u00C' // [Forsaken] - Tombstone
         set udg_TierOneTowers[1] = 'h00Z' // [Dragons] - Dragonkin
         set udg_TierOneTowers[2] = 'h011' // [Goblins] - Pocket Factory
         set udg_TierOneTowers[3] = 'h03W' // [Demon] - Felguard
         set udg_TierOneTowers[4] = 'hC66' // Tower
         set udg_TierOneTowers[5] = 'hC21' // Ghast
         set udg_TierOneTowers[6] = 'o003' // [Outland] - Chaos Grunt
         set udg_TierOneTowers[7] = 'o009' // [High Elven] - Elven Swordsman
         set udg_TierOneTowers[8] = 'oC14' // Sasquatch
         set udg_TierOneTowers[9] = 'h01C' // Centaur Outrunner
         set udg_TierOneTowers[10] = 'n009' // Corrupted Moon Well
         set udg_TierOneTowers[11] = 'n031' // Angel Warrior
         set udg_TierOneTowers[12] = 'n02T' // Adventurer
         set udg_TierOneTowers[13] = 'n03D' // Forest Troll
         set udg_TierOneTowers[14] = 'n055' // French Soldier
         set udg_TierOneTowers[15] = 'n029' // Gnoll
         set udg_TierOneTowers[16] = 'n01Y' // [Critters] - Mazing Tower
         set udg_TierOneTowers[17] = 'n04K' // Mild-Mannered Chris
         set udg_TierOneTowers[18] = 'n05H' // Undead Dwarf
         set udg_TierOneTowers[19] = 'h02H' // Marine
         set udg_TierOneTowers[20] = 'h01Z' // [Summons] - Spirit Wolf
         set udg_TierOneTowers[21] = 'h03D' // [Draenei] - Draenei Hut
         set udg_TierOneTowers[22] = 'n02X' // Scavenger
         set udg_TierOneTowers[23] = 'n02H' // Roots
         set udg_TierOneTowers[24] = 'hC02' // [Orc Stronghold] - Grunt
         set udg_TierOneTowers[25] = 'hC11' // Hippogryph
         set udg_TierOneTowers[26] = 'e00J' // Star Shooter
         set udg_TierOneTowers[27] = 'h04K' // [Arachnid] - Basement Barrel
         set udg_TierOneTowers[28] = 'h02G' // [Void Cult] - Void Worshipper
         set udg_TierOneTowers[29] = 'h03E' // [Workers Union] - Orc Peon
         set udg_TierOneTowers[30] = 'e00E' // [Night Elves] - Wisp
         set udg_TierOneTowers[31] = 'h04T' // [Cavernous Creatures] - Cavern Mushroom
         set udg_TierOneTowers[32] = 'n00F' // Ice Troll
         set udg_TierOneSize = 32
         //========== TIER: Two
         set udg_TierTwoTowers[0] = 'u00D' // [Forsaken] - Necromancer
         set udg_TierTwoTowers[1] = 'h010' // [Dragons] - Dragon Egg
         set udg_TierTwoTowers[2] = 'hC27' // Crypt Fiend
         set udg_TierTwoTowers[3] = 'o004' // [Outland] - Chaos Raider
         set udg_TierTwoTowers[4] = 'oC18' // Gargoyle
         set udg_TierTwoTowers[5] = 'oC19' // [Orc Stronghold] - Headhunter
         set udg_TierTwoTowers[6] = 'o00A' // [High Elven] - High Elf Archer
         set udg_TierTwoTowers[7] = 'oC35' // Ogre Warrior
         set udg_TierTwoTowers[8] = 'n00O' // Corrupted Ent
         set udg_TierTwoTowers[9] = 'n02J' // Gar'thok
         set udg_TierTwoTowers[10] = 'n04L' // Decimator
         set udg_TierTwoTowers[11] = 'n05I' // Mortar Dwarves
         set udg_TierTwoTowers[12] = 'n02U' // Sorceress
         set udg_TierTwoTowers[13] = 'h02I' // Fel Clown
         set udg_TierTwoTowers[14] = 'h020' // [Summons] - Water Elemental
         set udg_TierTwoTowers[15] = 'h04H' // [Draenei] - Salamander Hatchling
         set udg_TierTwoTowers[16] = 'h03U' // [Demon] - Felhound
         set udg_TierTwoTowers[17] = 'oC56' // Meat Wagon
         set udg_TierTwoTowers[18] = 'h01E' // Gnoll Warden
         set udg_TierTwoTowers[19] = 'n056' // Cow Catapult (Sheep)
         set udg_TierTwoTowers[20] = 'n00M' // Den
         set udg_TierTwoTowers[21] = 'n05J' // Dwarven Hunter
         set udg_TierTwoTowers[22] = 'n03E' // Forest Troll Beserker
         set udg_TierTwoTowers[23] = 'n02B' // Gnoll Brute
         set udg_TierTwoTowers[24] = 'n04M' // Lord D.O.T.
         set udg_TierTwoTowers[25] = 'n05K' // Mountain Dwarf
         set udg_TierTwoTowers[26] = 'n02V' // Merchant
         set udg_TierTwoTowers[27] = 'n01T' // [Critters] - Stag
         set udg_TierTwoTowers[28] = 'n04V' // The B3ast
         set udg_TierTwoTowers[29] = 'n02W' // Arcane Infuser
         set udg_TierTwoTowers[30] = 'n007' // Elemental
         set udg_TierTwoTowers[31] = 'e00K' // Moon Dancer
         set udg_TierTwoTowers[32] = 'n010' // Corrupted Ancient of Lore
         set udg_TierTwoTowers[33] = 'h03I' // [Workers Union] - Undead Acolyte
         set udg_TierTwoTowers[34] = 'n012' // Sacrificial Altar
         set udg_TierTwoTowers[35] = 'hC80' // [Night Elves] - Huntress
         set udg_TierTwoTowers[36] = 'h04R' // [Cavernous Creatures] - Small Cavernous Growth
         set udg_TierTwoTowers[37] = 'h041' // [Cavernous Creatures] - Cavern Frog
         set udg_TierTwoTowers[38] = 'n00G' // Ice Troll Berserker
         set udg_TierTwoSize = 38
         //========== TIER: Three
         set udg_TierThreeTowers[0] = 'u00E' // [Forsaken] - Abomination
         set udg_TierThreeTowers[1] = 'o01M' // [Goblins] - Sappers
         set udg_TierThreeTowers[2] = 'hC08' // Knight
         set udg_TierThreeTowers[3] = 'h04F' // [Draenei] - Draenei Seer
         set udg_TierThreeTowers[4] = 'hC53' // Rock Giant
         set udg_TierThreeTowers[5] = 'hC36' // Gyrocopter
         set udg_TierThreeTowers[6] = 'o005' // Chaos Warlock
         set udg_TierThreeTowers[7] = 'oC73' // Obsidian Statue
         set udg_TierThreeTowers[8] = 'n02K' // Eliminator
         set udg_TierThreeTowers[9] = 'n03F' // Forest Troll Trapper
         set udg_TierThreeTowers[10] = 'n02C' // Gnoll Elite
         set udg_TierThreeTowers[11] = 'n057' // Witch Hunter (Peasant)
         set udg_TierThreeTowers[12] = 'h02A' // Orc Firebat
         set udg_TierThreeTowers[13] = 'n01U' // [Critters] - Frog
         set udg_TierThreeTowers[14] = 'e00L' // Druid
         set udg_TierThreeTowers[15] = 'n00H' // Ice Troll Trapper
         set udg_TierThreeSize = 15
         //========== TIER: Four
         set udg_TierFourTowers[0] = 'u00F' // [Forsaken] - Gargoyle Spire
         set udg_TierFourTowers[1] = 'o01R' // [Goblins] - Goblin Minelayer
         set udg_TierFourTowers[2] = 'o01N' // [Goblins] - Shredder
         set udg_TierFourTowers[3] = 'oC58' // [Orc Stronghold] - Barrelmaster
         set udg_TierFourTowers[4] = 'o00B' // [High Elven] - Elven Sorceress
         set udg_TierFourTowers[5] = 'h022' // [Summons] - Spirit Bear
         set udg_TierFourTowers[6] = 'h01D' // Forest Troll Shadow Priest
         set udg_TierFourTowers[7] = 'n00L' // Corrupted Ancient Protector
         set udg_TierFourTowers[8] = 'n05L' // Blacksmith
         set udg_TierFourTowers[9] = 'n03G' // Forest Troll Warlord
         set udg_TierFourTowers[10] = 'n02L' // Sniper
         set udg_TierFourTowers[11] = 'n058' // The Knights Who Say Ni!
         set udg_TierFourTowers[12] = 'h005' // Gryphon Rider
         set udg_TierFourTowers[13] = 'h025' // [Summons] - Serpent Ward
         set udg_TierFourTowers[14] = 'hC54' // Siege Engine
         set udg_TierFourTowers[15] = 'h03X' // [Demon] - Succubus
         set udg_TierFourTowers[16] = 'h00Q' // Batrider
         set udg_TierFourTowers[17] = 'h00M' // Harpy
         set udg_TierFourTowers[18] = 'hC94' // Lich
         set udg_TierFourTowers[19] = 'o00R' // Boneyard
         set udg_TierFourTowers[20] = 'o007' // [Outland] - Fel Champion
         set udg_TierFourTowers[21] = 'o012' // Chaos Shrine
         set udg_TierFourTowers[22] = 'oC26' // Iron Golem Statue
         set udg_TierFourTowers[23] = 'o00X' // Ancient Golem
         set udg_TierFourTowers[24] = 'oC64' // [Orc Stronghold] - Tauren
         set udg_TierFourTowers[25] = 'h01B' // Druid of Nature
         set udg_TierFourTowers[26] = 'hC34' // Harpy Scout
         set udg_TierFourTowers[27] = 'n02M' // 50fang
         set udg_TierFourTowers[28] = 'n05M' // Dwarven Warrior
         set udg_TierFourTowers[29] = 'n03H' // Forest Troll Shadow Priest
         set udg_TierFourTowers[30] = 'n04D' // Knight
         set udg_TierFourTowers[31] = 'n04N' // Sir C.R.U.S.T.Y.
         set udg_TierFourTowers[32] = 'n059' // Tim the Enchanter
         set udg_TierFourTowers[33] = 'h02J' // Admiral Proudmoore
         set udg_TierFourTowers[34] = 'h026' // [Summons] - Lava Spawn
         set udg_TierFourTowers[35] = 'h02R' // [Draenei] - Draenei Demolisher
         set udg_TierFourTowers[36] = 'h006' // Phoenix Egg
         set udg_TierFourTowers[37] = 'h04E' // Archmage
         set udg_TierFourTowers[38] = 'e00O' // Night Star
         set udg_TierFourTowers[39] = 'n00U' // [Demon] - Summoning Shrine
         set udg_TierFourTowers[40] = 'h02F' // [Void Cult] - Void Priest
         set udg_TierFourTowers[41] = 'h03F' // [Workers Union] - Human Peasant
         set udg_TierFourTowers[42] = 'hC82' // [Night Elves] - Ancient Protector
         set udg_TierFourTowers[43] = 'hC86' // [Night Elves] - Chimaera Roost
         set udg_TierFourTowers[44] = 'h04M' // [Cavernous Creatures] - Cavern Hermit
         set udg_TierFourTowers[45] = 'o00C' // [High Elven] - High Elf Captain
         set udg_TierFourTowers[46] = 'n018' // Ice Troll Priest
         set udg_TierFourTowers[47] = 'n01W' // [Critters] - Penguin
         set udg_TierFourSize = 47
         //========== TIER: Five
         set udg_TierFiveTowers[0] = 'u010' // [Forsaken] - Banshee
         set udg_TierFiveTowers[1] = 'h03V' // [Demon] - Doom Guard
         set udg_TierFiveTowers[2] = 'hC97' // Ogre Magi
         set udg_TierFiveTowers[3] = 'h00R' // Sacrificial Pit
         set udg_TierFiveTowers[4] = 'o006' // Chaos Kodo Beast
         set udg_TierFiveTowers[5] = 'o011' // [Outland] - Nether Drake
         set udg_TierFiveTowers[6] = 'oC67' // Ogre Lord
         set udg_TierFiveTowers[7] = 'oC60' // Wyvern
         set udg_TierFiveTowers[8] = 'h01G' // Razormane
         set udg_TierFiveTowers[9] = 'n00N' // Corrupted Ancient of War
         set udg_TierFiveTowers[10] = 'n05B' // Brother Maynard
         set udg_TierFiveTowers[11] = 'n03I' // Forest Troll High Priest
         set udg_TierFiveTowers[12] = 'n02D' // Gnoll Poacher
         set udg_TierFiveTowers[13] = 'n05A' // Killer Rabbit
         set udg_TierFiveTowers[14] = 'n04O' // Mr. Charlie
         set udg_TierFiveTowers[15] = 'h02K' // Forgotten One
         set udg_TierFiveTowers[16] = 'h02L' // Hydralisk
         set udg_TierFiveTowers[17] = 'h027' // [Summons] - Prawn
         set udg_TierFiveTowers[18] = 'h04B' // Cold Tower
         set udg_TierFiveTowers[19] = 'o00S' // [Orc Stronghold] - Tauren Chieftain
         set udg_TierFiveTowers[20] = 'n01Z' // [Critters] - Pig
         set udg_TierFiveTowers[21] = 'h04G' // [Draenei] - Draenei Spiritualist
         set udg_TierFiveTowers[22] = 'e00P' // Star Chaser
         set udg_TierFiveTowers[23] = 'o00Z' // [High Elven] - Ballista
         set udg_TierFiveTowers[24] = 'h04N' // [Cavernous Creatures] - Cavern Turtle
         set udg_TierFiveTowers[25] = 'n019' // Ice Troll High Priest
         set udg_TierFiveSize = 25
         //========== TIER: Six
         set udg_TierSixTowers[0] = 'o01O' // [Goblins] - Alchemist
         set udg_TierSixTowers[1] = 'hC32' // Frost Wyrm
         set udg_TierSixTowers[2] = 'o013' // Chaos Pool
         set udg_TierSixTowers[3] = 'oC68' // Chimera
         set udg_TierSixTowers[4] = 'o00Q' // [High Elven] - Spellbreaker
         set udg_TierSixTowers[5] = 'n00P' // Corrupted Tree of Life
         set udg_TierSixTowers[6] = 'n02N' // Captain
         set udg_TierSixTowers[7] = 'n05N' // Flying Dwarf
         set udg_TierSixTowers[8] = 'n03J' // Forest Troll Joker
         set udg_TierSixTowers[9] = 'h00K' // Death Tower
         set udg_TierSixTowers[10] = 'n04P' // OhMyWTEFF?
         set udg_TierSixTowers[11] = 'e00Q' // Space Runner
         set udg_TierSixTowers[12] = 'h03G' // [Workers Union] - Naga Slave
         set udg_TierSixTowers[13] = 'h00B' // [Night Elves] - Ancient of Wind
         set udg_TierSixTowers[14] = 'h04Q' // [Cavernous Creatures] - Cavern Druid
         set udg_TierSixTowers[15] = 'n01A' // Ice Troll Joker
         set udg_TierSixSize = 15
         //========== TIER: Seven
         set udg_TierSevenTowers[0] = 'u011' // [Forsaken] - Destroyer
         set udg_TierSevenTowers[1] = 'o01P' // [Goblins] - Goblin Blademaster
         set udg_TierSevenTowers[2] = 'n04Q' // Blackrock Clan Member
         set udg_TierSevenTowers[3] = 'o00D' // [High Elven] - Sylvanus Windrunner
         set udg_TierSevenTowers[4] = 'h00F' // [Demon] - Demonized Dreadlord
         set udg_TierSevenTowers[5] = 'h00N' // Infernal Fireblaster
         set udg_TierSevenTowers[6] = 'h004' // Sapphiron
         set udg_TierSevenTowers[7] = 'o00T' // Blademaster
         set udg_TierSevenTowers[8] = 'o016' // [Outland] - Black Citadel WarMachine
         set udg_TierSevenTowers[9] = 'oC74' // Dune Worm
         set udg_TierSevenTowers[10] = 'o015' // Giant Revenant
         set udg_TierSevenTowers[11] = 'o008' // Grom Hellscream
         set udg_TierSevenTowers[12] = 'o00G' // Flesh Golem
         set udg_TierSevenTowers[13] = 'o00U' // Phoenix
         set udg_TierSevenTowers[14] = 'o00P' // [Orc Stronghold] - Rexxar
         set udg_TierSevenTowers[15] = 'o00Y' // Sea Giant
         set udg_TierSevenTowers[16] = 'o00K' // Zealot
         set udg_TierSevenTowers[17] = 'h04I' // [Draenei] - Salamander Lord
         set udg_TierSevenTowers[18] = 'n05O' // Battle Golem
         set udg_TierSevenTowers[19] = 'n02E' // Gnoll Assassin
         set udg_TierSevenTowers[20] = 'n01X' // [Critters] - Lizard
         set udg_TierSevenTowers[21] = 'n05C' // Sir Galahad the Pure
         set udg_TierSevenTowers[22] = 'n020' // [Critters] - Snow Owl
         set udg_TierSevenTowers[23] = 'h02M' // Orc Kart
         set udg_TierSevenTowers[24] = 'h02N' // Undead Kart
         set udg_TierSevenTowers[25] = 'h028' // [Summons] - Skeletal Mage
         set udg_TierSevenTowers[26] = 'h029' // [Summons] - Spirit Hawk
         set udg_TierSevenTowers[27] = 'h04C' // Boulder Tower
         set udg_TierSevenTowers[28] = 'e00R' // Celestial Mist
         set udg_TierSevenTowers[29] = 'h01M' // [Void Cult] - Void Fissure
         set udg_TierSevenTowers[30] = 'h03H' // [Workers Union] - Night Elf Wisp
         set udg_TierSevenTowers[31] = 'h00G' // [Night Elves] - Warden
         set udg_TierSevenTowers[32] = 'h04O' // [Cavernous Creatures] - Cavern Revenant
         set udg_TierSevenTowers[33] = 'n01B' // Ice Troll King
         set udg_TierSevenSize = 33
         //========== TIER: Eight
         set udg_TierEightTowers[0] = 'u012' // [Forsaken] - Varimathras
         set udg_TierEightTowers[1] = 'h002' // [Orc Stronghold] - Rokhan
         set udg_TierEightTowers[2] = 'o01B' // [Outland] - Rend Blackhand
         set udg_TierEightTowers[3] = 'o00N' // [High Elven] - Kael
         set udg_TierEightTowers[4] = 'h01U' // Fire Lord
         set udg_TierEightTowers[5] = 'n03L' // Forest Troll King
         set udg_TierEightTowers[6] = 'n02F' // Gnoll Warden
         set udg_TierEightTowers[7] = 'n02O' // Grand General Nice-Angel
         set udg_TierEightTowers[8] = 'n04R' // MissyisPissy
         set udg_TierEightTowers[9] = 'n05D' // Shrubbery
         set udg_TierEightTowers[10] = 'n021' // [Critters] - Black Sheep
         set udg_TierEightTowers[11] = 'h02O' // Dwarf Kart
         set udg_TierEightTowers[12] = 'h02B' // [Summons] - Treant
         set udg_TierEightTowers[13] = 'h04D' // Flame Tower
         set udg_TierEightTowers[14] = 'h00L' // Dalaran Guard Tower
         set udg_TierEightTowers[15] = 'o00L' // [Demon] - Mannoroth
         set udg_TierEightTowers[16] = 'h00I' // [Draenei] - Akama
         set udg_TierEightTowers[17] = 'e00S' // Moonlight
         set udg_TierEightTowers[18] = 'h01A' // [Void Cult] - Void Corrupter
         set udg_TierEightTowers[19] = 'e008' // [Night Elves] - Illidan
         set udg_TierEightSize = 19
         //========== TIER: Nine
         set udg_TierNineTowers[0] = 'u013' // [Forsaken] - Sylvanas Windrunner
         set udg_TierNineTowers[1] = 'u01C' // [Outland] - Magtheridon
         set udg_TierNineTowers[2] = 'o01S' // [Goblins] - Tinker
         set udg_TierNineTowers[3] = 'oC65' // [Orc Stronghold] - Warchief Thrall
         set udg_TierNineTowers[4] = 'n03B' // [Cavernous Creatures] - Spirit Hydra
         set udg_TierNineTowers[5] = 'h000' // Antonidas the Undead
         set udg_TierNineTowers[6] = 'eC93' // [Demon] - Kil'jaeden
         set udg_TierNineTowers[7] = 'n00R' // Corrupted Shandris
         set udg_TierNineTowers[8] = 'n00S' // Corrupted Warden
         set udg_TierNineTowers[9] = 'n04S' // BrandTheOne
         set udg_TierNineTowers[10] = 'n05Q' // Dwarf King (Statue)
         set udg_TierNineTowers[11] = 'n03K' // Forest Troll Emperor
         set udg_TierNineTowers[12] = 'n05F' // Sir Lancelot the Brave
         set udg_TierNineTowers[13] = 'n02R' // Dragon Turtle
         set udg_TierNineTowers[14] = 'n05E' // The Black Beast of Arrrghhh
         set udg_TierNineTowers[15] = 'n02P' // White-Angel
         set udg_TierNineTowers[16] = 'n02G' // Gnoll Leader
         set udg_TierNineTowers[17] = 'h02P' // Diablo Kart
         set udg_TierNineTowers[18] = 'h02Q' // Iron As In Arthas
         set udg_TierNineTowers[19] = 'h02D' // [Summons] - Avatar of Vengeance
         set udg_TierNineTowers[20] = 'h02C' // [Summons] - Quilbeast
         set udg_TierNineTowers[21] = 'h02V' // Earth-Fury
         set udg_TierNineTowers[22] = 'e00T' // The Creator
         set udg_TierNineTowers[23] = 'o001' // Giant King
         set udg_TierNineTowers[24] = 'n01C' // Ice Troll Emperor
         set udg_TierNineSize = 24

    endfunction



    public function Init takes nothing returns nothing
        call setUpHybrid()
    endfunction



endlibrary

