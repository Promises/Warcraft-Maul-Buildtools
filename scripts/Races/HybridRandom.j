library TestLib initializer Init requires Utility



    private function setUpHybrid takes nothing returns nothing
         call Utility_DisplayMessageToAllPlayers("Welcome to Warcraft Maul Reimagined")
         call Utility_DisplayMessageToAllPlayers("This is build: NaN, built May 27 2019.")
         //========== TIER: One
         set udg_TierOneTowers[0] = 'u00C' // [Forsaken] - Tombstone
         set udg_TierOneTowers[1] = 'h00Z' // [Dragons] - Dragonkin
         set udg_TierOneTowers[2] = 'h011' // [Goblins] - Pocket Factory
         set udg_TierOneTowers[3] = 'h03W' // [Demon] - Felguard
         set udg_TierOneTowers[4] = 'hC66' // [Humans] - Tower
         set udg_TierOneTowers[5] = 'hC21' // [Undead] - Ghast
         set udg_TierOneTowers[6] = 'o003' // [Outland] - Chaos Grunt
         set udg_TierOneTowers[7] = 'o009' // [High Elven] - Elven Swordsman
         set udg_TierOneTowers[8] = 'oC14' // [Giants] - Sasquatch
         set udg_TierOneTowers[9] = 'h01C' // [Tavern] - Centaur Outrunner
         set udg_TierOneTowers[10] = 'n009' // [Corrupt N.Elves] - Corrupted Moon Well
         set udg_TierOneTowers[11] = 'n03D' // [Forest Trolls] - Forest Troll
         set udg_TierOneTowers[12] = 'n055' // [Caerbannog] - French Soldier
         set udg_TierOneTowers[13] = 'n029' // [Gnolls] - Gnoll
         set udg_TierOneTowers[14] = 'n01Y' // [Critters] - Mazing Tower
         set udg_TierOneTowers[15] = 'n05H' // [Dwarves] - Undead Dwarf
         set udg_TierOneTowers[16] = 'h02H' // [Uniques] - Marine
         set udg_TierOneTowers[17] = 'h01Z' // [Summons] - Spirit Wolf
         set udg_TierOneTowers[18] = 'h03D' // [Draenei] - Draenei Hut
         set udg_TierOneTowers[19] = 'n02H' // [Corrupt N.Elves] - Roots
         set udg_TierOneTowers[20] = 'hC02' // [Orc Stronghold] - Grunt
         set udg_TierOneTowers[21] = 'hC11' // [Aviaries] - Hippogryph
         set udg_TierOneTowers[22] = 'e00J' // [Galaxy] - Star Shooter
         set udg_TierOneTowers[23] = 'h04K' // [Arachnid] - Basement Barrel
         set udg_TierOneTowers[24] = 'h02G' // [Void Cult] - Void Worshipper
         set udg_TierOneTowers[25] = 'h03E' // [Workers Union] - Orc Peon
         set udg_TierOneTowers[26] = 'e00E' // [Night Elves] - Wisp
         set udg_TierOneTowers[27] = 'h04T' // [Cavernous Creatures] - Cavern Mushroom
         set udg_TierOneTowers[28] = 'n00F' // [Ice Trolls] - Ice Troll
         set udg_TierOneSize = 28
         //========== TIER: Two
         set udg_TierTwoTowers[0] = 'u00D' // [Forsaken] - Necromancer
         set udg_TierTwoTowers[1] = 'h010' // [Dragons] - Dragon Egg
         set udg_TierTwoTowers[2] = 'o01M' // [Goblins] - Sappers
         set udg_TierTwoTowers[3] = 'hC27' // [Undead] - Crypt Fiend
         set udg_TierTwoTowers[4] = 'o004' // [Outland] - Chaos Raider
         set udg_TierTwoTowers[5] = 'oC18' // [Aviaries] - Gargoyle
         set udg_TierTwoTowers[6] = 'oC19' // [Orc Stronghold] - Headhunter
         set udg_TierTwoTowers[7] = 'o00A' // [High Elven] - High Elf Archer
         set udg_TierTwoTowers[8] = 'oC35' // [Giants] - Ogre Warrior
         set udg_TierTwoTowers[9] = 'n00O' // [Corrupt N.Elves] - Corrupted Ent
         set udg_TierTwoTowers[10] = 'n05I' // [Dwarven Mine] - Mortar Dwarves
         set udg_TierTwoTowers[11] = 'h020' // [Summons] - Water Elemental
         set udg_TierTwoTowers[12] = 'h04H' // [Draenei] - Salamander Hatchling
         set udg_TierTwoTowers[13] = 'h03U' // [Demon] - Felhound
         set udg_TierTwoTowers[14] = 'oC56' // [Undead] - Meat Wagon
         set udg_TierTwoTowers[15] = 'h01E' // [Gnolls] - Gnoll Warden
         set udg_TierTwoTowers[16] = 'n056' // [Caerbannog] - Cow Catapult (Sheep)
         set udg_TierTwoTowers[17] = 'n00M' // [Corrupt N.Elves] - Den
         set udg_TierTwoTowers[18] = 'n05J' // [Dwarven Mine] - Dwarven Hunter
         set udg_TierTwoTowers[19] = 'n03E' // [Forest Trolls] - Forest Troll Beserker
         set udg_TierTwoTowers[20] = 'n02B' // [Gnolls] - Gnoll Brute
         set udg_TierTwoTowers[21] = 'n05K' // [Dwarven Mine] - Mountain Dwarf
         set udg_TierTwoTowers[22] = 'n01T' // [Critters] - Stag
         set udg_TierTwoTowers[23] = 'e00K' // [Galaxy] - Moon Dancer
         set udg_TierTwoTowers[24] = 'n010' // [Corrupt N.Elves] - Corrupted Ancient of Lore
         set udg_TierTwoTowers[25] = 'h03I' // [Workers Union] - Undead Acolyte
         set udg_TierTwoTowers[26] = 'hC80' // [Night Elves] - Huntress
         set udg_TierTwoTowers[27] = 'h04R' // [Cavernous Creatures] - Small Cavernous Growth
         set udg_TierTwoTowers[28] = 'h041' // [Cavernous Creatures] - Cavern Frog
         set udg_TierTwoTowers[29] = 'n00G' // [Ice Trolls] - Ice Troll Berserker
         set udg_TierTwoSize = 29
         //========== TIER: Three
         set udg_TierThreeTowers[0] = 'u00E' // [Forsaken] - Abomination
         set udg_TierThreeTowers[1] = 'hC08' // [Humans] - Knight
         set udg_TierThreeTowers[2] = 'h04F' // [Draenei] - Draenei Seer
         set udg_TierThreeTowers[3] = 'hC53' // [Giants] - Rock Giant
         set udg_TierThreeTowers[4] = 'hC36' // [Aviaries] - Gyrocopter
         set udg_TierThreeTowers[5] = 'o005' // [Outland] - Chaos Warlock
         set udg_TierThreeTowers[6] = 'oC73' // [Undead] - Obsidian Statue
         set udg_TierThreeTowers[7] = 'n03F' // [Forest Trolls] - Forest Troll Trapper
         set udg_TierThreeTowers[8] = 'n02C' // [Gnolls] - Gnoll Elite
         set udg_TierThreeTowers[9] = 'n057' // [Caerbannog] - Witch Hunter (Peasant)
         set udg_TierThreeTowers[10] = 'h02A' // [Uniques] - Orc Firebat
         set udg_TierThreeTowers[11] = 'n01U' // [Critters] - Frog
         set udg_TierThreeTowers[12] = 'e00L' // [Galaxy] - Druid
         set udg_TierThreeTowers[13] = 'n00H' // [Ice Trolls] - Ice Troll Trapper
         set udg_TierThreeSize = 13
         //========== TIER: Four
         set udg_TierFourTowers[0] = 'u00F' // [Forsaken] - Gargoyle Spire
         set udg_TierFourTowers[1] = 'o01R' // [Goblins] - Goblin Minelayer
         set udg_TierFourTowers[2] = 'o01N' // [Goblins] - Shredder
         set udg_TierFourTowers[3] = 'oC58' // [Orc Stronghold] - Barrelmaster
         set udg_TierFourTowers[4] = 'o00B' // [High Elven] - Elven Sorceress
         set udg_TierFourTowers[5] = 'h022' // [Summons] - Spirit Bear
         set udg_TierFourTowers[6] = 'h01D' // [Forest Trolls] - Forest Troll Shadow Priest
         set udg_TierFourTowers[7] = 'n00L' // [Corrupt N.Elves] - Corrupted Ancient Protector
         set udg_TierFourTowers[8] = 'n05L' // [Dwarven Mine] - Blacksmith
         set udg_TierFourTowers[9] = 'n03G' // [Forest Trolls] - Forest Troll Warlord
         set udg_TierFourTowers[10] = 'n058' // [Caerbannog] - The Knights Who Say Ni!
         set udg_TierFourTowers[11] = 'h005' // [Aviaries] - Gryphon Rider
         set udg_TierFourTowers[12] = 'h025' // [Summons] - Serpent Ward
         set udg_TierFourTowers[13] = 'hC54' // [Humans] - Siege Engine
         set udg_TierFourTowers[14] = 'h03X' // [Demon] - Succubus
         set udg_TierFourTowers[15] = 'h00Q' // Batrider
         set udg_TierFourTowers[16] = 'h00M' // [Aviaries] - Harpy
         set udg_TierFourTowers[17] = 'hC94' // [Undead] - Lich
         set udg_TierFourTowers[18] = 'o00R' // [Undead] - Boneyard
         set udg_TierFourTowers[19] = 'o007' // [Outland] - Fel Champion
         set udg_TierFourTowers[20] = 'o012' // [Shrine of Buffs] - Chaos Shrine
         set udg_TierFourTowers[21] = 'oC26' // [Giants] - Iron Golem Statue
         set udg_TierFourTowers[22] = 'o00X' // [Giants] - Ancient Golem
         set udg_TierFourTowers[23] = 'oC64' // [Orc Stronghold] - Tauren
         set udg_TierFourTowers[24] = 'hC34' // [Tavern] - Harpy Scout
         set udg_TierFourTowers[25] = 'n05M' // [Dwarven Mine] - Dwarven Warrior
         set udg_TierFourTowers[26] = 'n03H' // [Forest Trolls] - Forest Troll Shadow Priest
         set udg_TierFourTowers[27] = 'n059' // [Caerbannog] - Tim the Enchanter
         set udg_TierFourTowers[28] = 'h02J' // [Uniques] - Admiral Proudmoore
         set udg_TierFourTowers[29] = 'h026' // [Summons] - Lava Spawn
         set udg_TierFourTowers[30] = 'h02R' // [Draenei] - Draenei Demolisher
         set udg_TierFourTowers[31] = 'h006' // [Humans] - Phoenix Egg
         set udg_TierFourTowers[32] = 'e00O' // [Galaxy] - Night Star
         set udg_TierFourTowers[33] = 'n00U' // [Demon] - Summoning Shrine
         set udg_TierFourTowers[34] = 'h02F' // [Void Cult] - Void Priest
         set udg_TierFourTowers[35] = 'h03F' // [Workers Union] - Human Peasant
         set udg_TierFourTowers[36] = 'hC82' // [Night Elves] - Ancient Protector
         set udg_TierFourTowers[37] = 'hC86' // [Night Elves] - Chimaera Roost
         set udg_TierFourTowers[38] = 'h04M' // [Cavernous Creatures] - Cavern Hermit
         set udg_TierFourTowers[39] = 'o00C' // [High Elven] - High Elf Captain
         set udg_TierFourTowers[40] = 'n018' // [Ice Trolls] - Ice Troll Priest
         set udg_TierFourTowers[41] = 'n01W' // [Critters] - Penguin
         set udg_TierFourSize = 41
         //========== TIER: Five
         set udg_TierFiveTowers[0] = 'u010' // [Forsaken] - Banshee
         set udg_TierFiveTowers[1] = 'h03V' // [Demon] - Doom Guard
         set udg_TierFiveTowers[2] = 'hC97' // [Giants] - Ogre Magi
         set udg_TierFiveTowers[3] = 'h00R' // [Undead] - Sacrificial Pit
         set udg_TierFiveTowers[4] = 'o006' // [Shrine of Buffs] - Chaos Kodo Beast
         set udg_TierFiveTowers[5] = 'o011' // [Outland] - Nether Drake
         set udg_TierFiveTowers[6] = 'oC67' // [Giants] - Ogre Lord
         set udg_TierFiveTowers[7] = 'oC60' // [Aviaries] - Wyvern
         set udg_TierFiveTowers[8] = 'h01G' // [Tavern] - Razormane
         set udg_TierFiveTowers[9] = 'n00N' // [Corrupt N.Elves] - Corrupted Ancient of War
         set udg_TierFiveTowers[10] = 'n05B' // [Caerbannog] - Brother Maynard
         set udg_TierFiveTowers[11] = 'n03I' // [Forest Trolls] - Forest Troll High Priest
         set udg_TierFiveTowers[12] = 'n02D' // [Gnolls] - Gnoll Poacher
         set udg_TierFiveTowers[13] = 'n05A' // [Caerbannog] - Killer Rabbit
         set udg_TierFiveTowers[14] = 'h027' // [Summons] - Prawn
         set udg_TierFiveTowers[15] = 'h04B' // [Humans] - Cold Tower
         set udg_TierFiveTowers[16] = 'o00S' // [Orc Stronghold] - Tauren Chieftain
         set udg_TierFiveTowers[17] = 'h04G' // [Draenei] - Draenei Spiritualist
         set udg_TierFiveTowers[18] = 'e00P' // [Galaxy] - Star Chaser
         set udg_TierFiveTowers[19] = 'o00Z' // [High Elven] - Ballista
         set udg_TierFiveTowers[20] = 'h04N' // [Cavernous Creatures] - Cavern Turtle
         set udg_TierFiveTowers[21] = 'n019' // [Ice Trolls] - Ice Troll High Priest
         set udg_TierFiveSize = 21
         //========== TIER: Six
         set udg_TierSixTowers[0] = 'o01O' // [Goblins] - Alchemist
         set udg_TierSixTowers[1] = 'h02K' // [Uniques] - Butthole Monstrosity
         set udg_TierSixTowers[2] = 'o013' // [Shrine of Buffs] - Chaos Pool
         set udg_TierSixTowers[3] = 'oC68' // [Aviaries] - Chimera
         set udg_TierSixTowers[4] = 'o00Q' // [High Elven] - Spellbreaker
         set udg_TierSixTowers[5] = 'n00P' // [Corrupt N.Elves] - Corrupted Tree of Life
         set udg_TierSixTowers[6] = 'n05N' // [Dwarven Mine] - Flying Dwarf
         set udg_TierSixTowers[7] = 'n03J' // [Forest Trolls] - Forest Troll Joker
         set udg_TierSixTowers[8] = 'n01Z' // [Critters] - Pig
         set udg_TierSixTowers[9] = 'h00K' // [Humans] - Death Tower
         set udg_TierSixTowers[10] = 'e00Q' // [Galaxy] - Space Runner
         set udg_TierSixTowers[11] = 'h03G' // [Workers Union] - Naga Slave
         set udg_TierSixTowers[12] = 'h00B' // [Night Elves] - Ancient of Wind
         set udg_TierSixTowers[13] = 'h04Q' // [Cavernous Creatures] - Cavern Druid
         set udg_TierSixTowers[14] = 'n01A' // [Ice Trolls] - Ice Troll Joker
         set udg_TierSixSize = 14
         //========== TIER: Seven
         set udg_TierSevenTowers[0] = 'u011' // [Forsaken] - Destroyer
         set udg_TierSevenTowers[1] = 'o01P' // [Goblins] - Goblin Blademaster
         set udg_TierSevenTowers[2] = 'h02L' // [Uniques] - Hydralisk
         set udg_TierSevenTowers[3] = 'o00D' // [High Elven] - Sylvanus Windrunner
         set udg_TierSevenTowers[4] = 'h00F' // [Demon] - Demonized Dreadlord
         set udg_TierSevenTowers[5] = 'h00N' // [Undead] - Infernal Fireblaster
         set udg_TierSevenTowers[6] = 'o016' // [Outland] - Black Citadel WarMachine
         set udg_TierSevenTowers[7] = 'oC74' // [Undead] - Dune Worm
         set udg_TierSevenTowers[8] = 'o015' // [Giants] - Giant Revenant
         set udg_TierSevenTowers[9] = 'o008' // [Shrine of Buffs] - Grom Hellscream
         set udg_TierSevenTowers[10] = 'o00G' // [Giants] - Flesh Golem
         set udg_TierSevenTowers[11] = 'o00U' // [Aviaries] - Phoenix
         set udg_TierSevenTowers[12] = 'o00P' // [Orc Stronghold] - Rexxar
         set udg_TierSevenTowers[13] = 'o00Y' // [Giants] - Sea Giant
         set udg_TierSevenTowers[14] = 'h04I' // [Draenei] - Salamander Lord
         set udg_TierSevenTowers[15] = 'n05O' // [Dwarven Mine] - Battle Golem
         set udg_TierSevenTowers[16] = 'n02E' // [Gnolls] - Gnoll Assassin
         set udg_TierSevenTowers[17] = 'n01X' // [Critters] - Lizard
         set udg_TierSevenTowers[18] = 'n05C' // [Caerbannog] - Sir Galahad the Pure
         set udg_TierSevenTowers[19] = 'h028' // [Summons] - Skeletal Mage
         set udg_TierSevenTowers[20] = 'h029' // [Summons] - Spirit Hawk
         set udg_TierSevenTowers[21] = 'h04C' // [Humans] - Boulder Tower
         set udg_TierSevenTowers[22] = 'e00R' // [Galaxy] - Celestial Mist
         set udg_TierSevenTowers[23] = 'h01M' // [Void Cult] - Void Fissure
         set udg_TierSevenTowers[24] = 'h03H' // [Workers Union] - Night Elf Wisp
         set udg_TierSevenTowers[25] = 'h00G' // [Night Elves] - Warden
         set udg_TierSevenTowers[26] = 'h04O' // [Cavernous Creatures] - Cavern Revenant
         set udg_TierSevenTowers[27] = 'n01B' // [Ice Trolls] - Ice Troll King
         set udg_TierSevenSize = 27
         //========== TIER: Eight
         set udg_TierEightTowers[0] = 'u012' // [Forsaken] - Varimathras
         set udg_TierEightTowers[1] = 'n020' // [Critters] - Snow Owl
         set udg_TierEightTowers[2] = 'h002' // [Orc Stronghold] - Rokhan
         set udg_TierEightTowers[3] = 'o01B' // [Outland] - Rend Blackhand
         set udg_TierEightTowers[4] = 'o00N' // [High Elven] - Kael
         set udg_TierEightTowers[5] = 'h01U' // [Tavern] - Fire Lord
         set udg_TierEightTowers[6] = 'n03L' // [Forest Trolls] - Forest Troll King
         set udg_TierEightTowers[7] = 'n02F' // [Gnolls] - Gnoll Warden
         set udg_TierEightTowers[8] = 'n05D' // [Caerbannog] - Shrubbery
         set udg_TierEightTowers[9] = 'h02B' // [Summons] - Treant
         set udg_TierEightTowers[10] = 'h04D' // [Humans] - Flame Tower
         set udg_TierEightTowers[11] = 'h00L' // [Humans] - Dalaran Guard Tower
         set udg_TierEightTowers[12] = 'o00L' // [Demon] - Mannoroth
         set udg_TierEightTowers[13] = 'h02Q' // [Uniques] - Iron Arthas
         set udg_TierEightTowers[14] = 'h00I' // [Draenei] - Akama
         set udg_TierEightTowers[15] = 'e00S' // [Galaxy] - Moonlight
         set udg_TierEightTowers[16] = 'h01A' // [Void Cult] - Void Corrupter
         set udg_TierEightTowers[17] = 'e008' // [Night Elves] - Illidan
         set udg_TierEightSize = 17
         //========== TIER: Nine
         set udg_TierNineTowers[0] = 'u013' // [Forsaken] - Sylvanas Windrunner
         set udg_TierNineTowers[1] = 'u01C' // [Outland] - Magtheridon
         set udg_TierNineTowers[2] = 'o01S' // [Goblins] - Tinker
         set udg_TierNineTowers[3] = 'oC65' // [Orc Stronghold] - Warchief Thrall
         set udg_TierNineTowers[4] = 'n03B' // [Cavernous Creatures] - Spirit Hydra
         set udg_TierNineTowers[5] = 'n021' // [Critters] - Black Sheep
         set udg_TierNineTowers[6] = 'h000' // [Undead] - Antonidas the Undead
         set udg_TierNineTowers[7] = 'eC93' // [Demon] - Kil'jaeden
         set udg_TierNineTowers[8] = 'n00R' // [Corrupt N.Elves] - Corrupted Shandris
         set udg_TierNineTowers[9] = 'n00S' // [Corrupt N.Elves] - Corrupted Warden
         set udg_TierNineTowers[10] = 'n05Q' // [Dwarven Mine] - Dwarf King (Statue)
         set udg_TierNineTowers[11] = 'n03K' // [Forest Trolls] - Forest Troll Emperor
         set udg_TierNineTowers[12] = 'n05F' // [Caerbannog] - Sir Lancelot the Brave
         set udg_TierNineTowers[13] = 'n02R' // Dragon Turtle
         set udg_TierNineTowers[14] = 'n05E' // [Caerbannog] - The Black Beast of Arrrghhh
         set udg_TierNineTowers[15] = 'n02G' // [Gnolls] - Gnoll Leader
         set udg_TierNineTowers[16] = 'h02D' // [Summons] - Avatar of Vengeance
         set udg_TierNineTowers[17] = 'h02C' // [Summons] - Quilbeast
         set udg_TierNineTowers[18] = 'h02V' // [Humans] - Earth-Fury
         set udg_TierNineTowers[19] = 'e00T' // [Galaxy] - The Creator
         set udg_TierNineTowers[20] = 'o001' // [Giants] - Giant King
         set udg_TierNineTowers[21] = 'n01C' // [Ice Trolls] - Ice Troll Emperor
         set udg_TierNineSize = 21

    endfunction



    public function Init takes nothing returns nothing
        call setUpHybrid()
    endfunction



endlibrary

