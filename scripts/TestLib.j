library TestLib 



    private function setUpHybrid takes nothing returns nothing
        // TIER ONE 3 - 15

        set udg_TierOneTowers[0] = 'h00Z' // Dragonkin
        set udg_TierOneTowers[1] = 'h03W' // Felguard
        set udg_TierOneTowers[2] = 'hC66' // Tower (5)
        set udg_TierOneTowers[3] = 'hC21' // Ghast
        set udg_TierOneTowers[4] = 'hC02' // Grunt
        set udg_TierOneTowers[5] = 'hC11' // Hippogryph
        set udg_TierOneTowers[6] = 'o003' // Chaos Grunt (10)
        set udg_TierOneTowers[7] = 'o009' // High Elf Swordsman (10)
        set udg_TierOneTowers[8] = 'oC14' // Sasquatch (10)
        set udg_TierOneTowers[9] = 'h01C' // Centaur Outrunner (8)
        set udg_TierOneTowers[10] = 'n009' // Corrupted Moon Well (10)
        set udg_TierOneTowers[11] = 'n031' // Angel Warrior (8)
        set udg_TierOneTowers[12] = 'n02T' // Adventurer (8)
        set udg_TierOneTowers[13] = 'n03D' // Forest Troll (8)
        set udg_TierOneTowers[14] = 'n055' // French Soldier (7)
        set udg_TierOneTowers[15] = 'n047' // Ghoul (8)
        set udg_TierOneTowers[16] = 'n029' // Gnoll (7)
        set udg_TierOneTowers[17] = 'h04T' // [Cavernous Creatures] - Cavern Mushroom (5)
        set udg_TierOneTowers[18] = 'n01Y' // MAZE ME PLOX (3)
        set udg_TierOneTowers[19] = 'n04K' // Mild-Mannered Chris (10)
        set udg_TierOneTowers[20] = 'n05H' // Undead Dwarf (5)
        set udg_TierOneTowers[21] = 'h02H' // Marine (10)
        set udg_TierOneTowers[22] = 'h011' // Goblin PocketFactory (10)
        set udg_TierOneTowers[23] = 'h01Z' // Spirit Wolf (8)
        set udg_TierOneTowers[24] = 'e00J' // Star Shooter (7)
        set udg_TierOneTowers[25] = 'h03D' // [Draenei] - Draenei Hut (5)
        set udg_TierOneTowers[26] = 'h04K' // [Arachnid] - Basement Barrel (10)
        set udg_TierOneTowers[27] = 'n02H' // Roots (3)
        set udg_TierOneTowers[28] = 'h02G' // [Void Cult] - Void Worshipper (8)
        set udg_TierOneTowers[29] = 'h03E' // [Workers Union] - Orc Peon (5)
        set udg_TierOneTowers[30] = 'n02X' // Scavenger (12)
        set udg_TierOneTowers[31] = 'e00E' // [Night Elves] - Wisp (8)
        set udg_TierOneTowers[32] = 'n00F' // Ice Troll (8)


            
        
        set udg_TierOneSize = 32

        // TIER TWO 16 - 99
        set udg_TierTwoTowers[0] = 'h010' // Dragon Egg
        set udg_TierTwoTowers[1] = 'hC27' // Crypt Fiend
        set udg_TierTwoTowers[2] = 'o004' // Chaos Raider (40)
        set udg_TierTwoTowers[3] = 'oC18' // Gargoyle (40)
        set udg_TierTwoTowers[4] = 'o00A' // High Elf Archer (40)
        set udg_TierTwoTowers[5] = 'oC35' // Ogre Warrior (40)
        set udg_TierTwoTowers[6] = 'n00O' // Corrupted Ent (40)
        set udg_TierTwoTowers[7] = 'n02J' // Blademastur (40)
        set udg_TierTwoTowers[8] = 'n04L' // Decimator (40)
        set udg_TierTwoTowers[9] = 'n049' // Fallen Archer (40)
        set udg_TierTwoTowers[10] = 'n05I' // Mortar Dwarves (30)
        set udg_TierTwoTowers[11] = 'n02U' // Sorceress (20)
        set udg_TierTwoTowers[12] = 'n048' // Zombie (40)
        set udg_TierTwoTowers[13] = 'h02I' // Fel Clown (40)
        set udg_TierTwoTowers[14] = 'h020' // Water Elemental (40)
        set udg_TierTwoTowers[15] = 'h03U' // Felhound
        set udg_TierTwoTowers[16] = 'oC56' // Meat Wagon (80)
        set udg_TierTwoTowers[17] = 'oC58' // Shaman (95)
        set udg_TierTwoTowers[18] = 'h01E' // Gnoll Warden (60)
        set udg_TierTwoTowers[19] = 'n056' // Cow Catapult (Sheep) (60)
        set udg_TierTwoTowers[20] = 'n00M' // Den (60)
        set udg_TierTwoTowers[21] = 'n04A' // Abomination (80)
        set udg_TierTwoTowers[22] = 'n05J' // Dwarven Hunter (50)
        set udg_TierTwoTowers[23] = 'n03E' // Forest Troll Berserker (50)
        set udg_TierTwoTowers[24] = 'n02B' // Gnoll Brute (60)
        set udg_TierTwoTowers[25] = 'n04M' // Lord D.O.T (80)
        set udg_TierTwoTowers[26] = 'n05K' // Mountain Dwarf (90)
        set udg_TierTwoTowers[27] = 'n01T' // Stag (50)
        set udg_TierTwoTowers[28] = 'n04V' // The B3ast (80)
        set udg_TierTwoTowers[29] = 'e00K' // Moon Dancer (30)
        set udg_TierTwoTowers[30] = 'h04H' // [Draenei] - Salamander Hatchling (50)
        set udg_TierTwoTowers[31] = 'n010' // Corrupted Ancient of Lore (16)
        set udg_TierTwoTowers[32] = 'h03I' // [Workers Union] - Undead Acolyte (75)
        set udg_TierTwoTowers[33] = 'n02V' // Merchant (16)
        set udg_TierTwoTowers[34] = 'n02W' // Arcane Infuser (28)
        set udg_TierTwoTowers[35] = 'n007' // Elemental (24)
        set udg_TierTwoTowers[36] = 'n012' // Merchant (32)
        set udg_TierTwoTowers[37] = 'hC80' // [Night Elves] - Huntress (75)
        set udg_TierTwoTowers[38] = 'h04R' // [Cavernous Creatures] - Small Cavernous Growth (50)
        set udg_TierTwoTowers[39] = 'h041' // [Cavernous Creatures] - Cavern Frog (80)
        set udg_TierTwoTowers[40] = 'oC19' // [Orc Stronghold] - Headhunter (50)
        set udg_TierTwoTowers[41] = 'n00G' // Ice Troll Berserker (50)



        set udg_TierTwoSize = 41

        // TIER THREE 100 - 149
        set udg_TierThreeTowers[0] = 'hC53' // Ancient Protector
        set udg_TierThreeTowers[1] = 'hC36' // Gyrocopter
        set udg_TierThreeTowers[2] = 'o005' // Chaos Warlock (100)
        set udg_TierThreeTowers[3] = 'o00B' // High Elf Sorceress (100)
        set udg_TierThreeTowers[4] = 'oC73' // Obsidian Statue (120)
        set udg_TierThreeTowers[5] = 'n02K' // Eliminator (100)
        set udg_TierThreeTowers[6] = 'n03F' // Forest Troll Trapper (120)
        set udg_TierThreeTowers[7] = 'n02C' // Gnoll Overseer (120)
        set udg_TierThreeTowers[8] = 'n04B' // Necromancer (120)
        set udg_TierThreeTowers[9] = 'n057' // Witch Hunter (Peasant) (100)
        set udg_TierThreeTowers[10] = 'h02A' // Orc Firebat (100)
        set udg_TierThreeTowers[11] = 'o01R' // Goblin MineLayer (150)
        set udg_TierThreeTowers[12] = 'hC08' // Knight (120)
        set udg_TierThreeTowers[13] = 'e00L' // Druid (100)
        set udg_TierThreeTowers[14] = 'h04F' // [Draenei] - Draenei Seer (100)
        set udg_TierThreeTowers[15] = 'n00H' // Ice Troll Trapper (120)
        set udg_TierThreeTowers[16] = 'o01M' // Goblin Sapper (100)


        set udg_TierThreeSize = 16

        // TIER FOUR 150 - 299
        set udg_TierFourTowers[0] = 'o00C' // [High Elven] - High Elf Captain (200)
        set udg_TierFourTowers[1] = 'n018' // Ice Troll Priest (200)

        set udg_TierFourTowers[2] = 'h01D' // Forest Troll Shadow Priest (150)
        set udg_TierFourTowers[3] = 'n00L' // Corrupted Ancient Protector (150)
        set udg_TierFourTowers[4] = 'n05L' // Blacksmith (150)
        set udg_TierFourTowers[5] = 'n03G' // Forest Troll Warlord (160)
        set udg_TierFourTowers[6] = 'n01U' // Frog (150)
        set udg_TierFourTowers[7] = 'n04C' // Rifleman (160)
        set udg_TierFourTowers[8] = 'n02L' // Sniper (150)
        set udg_TierFourTowers[9] = 'n058' // The Knights Who Say Ni! (180)
        set udg_TierFourTowers[10] = 'h005' // Gryphon Rider (175)
        set udg_TierFourTowers[11] = 'h025' // Serpent Ward (150)
        set udg_TierFourTowers[12] = 'o01N' // Goblin Shredder (225)

        set udg_TierFourTowers[13] = 'hC54' // Siege Engine (160)
        set udg_TierFourTowers[14] = 'h03X' // Succubus
        set udg_TierFourTowers[15] = 'h00Q' // Batrider
        set udg_TierFourTowers[16] = 'h00M' // Harpy
        set udg_TierFourTowers[17] = 'hC94' // Lich
        set udg_TierFourTowers[18] = 'h022' // Spirit Bear (150)

        set udg_TierFourTowers[19] = 'o00R' // Boneyard (250)
        set udg_TierFourTowers[20] = 'o007' // Chaos Champ
        set udg_TierFourTowers[21] = 'o012' // Chaos Shrine (250)
        set udg_TierFourTowers[22] = 'h006' // Phoenix Egg (250)
        set udg_TierFourTowers[23] = 'o00Z' // High Elf Ballista (250)
        set udg_TierFourTowers[24] = 'oC26' // Mountain Giant (200)
        set udg_TierFourTowers[25] = 'h04E' // Archmage (200)
        set udg_TierFourTowers[26] = 'o00X' // Rock Golem (250)
        set udg_TierFourTowers[27] = 'oC64' // Tauren (200)
        set udg_TierFourTowers[28] = 'h01B' // Druid of the Claw (200)
        set udg_TierFourTowers[29] = 'hC34' // Harpy Scout (250)
        set udg_TierFourTowers[30] = 'n02M' // 50fang (250)
        set udg_TierFourTowers[31] = 'n05M' // Dwarven Warrior (225)
        set udg_TierFourTowers[32] = 'n03H' // Forest Troll Shadow Priest (200)
        set udg_TierFourTowers[33] = 'n04D' // Knight (200)
        set udg_TierFourTowers[34] = 'n04N' // Sir C.R.U.S.T.Y. (200)
        set udg_TierFourTowers[35] = 'n059' // Tim the Enchanter (260)
        set udg_TierFourTowers[36] = 'h02J' // Admiral Proudmoore (200)
        set udg_TierFourTowers[37] = 'h026' // Lava Spawn (250)
        set udg_TierFourTowers[38] = 'e00O' // Night Star (200)
        set udg_TierFourTowers[39] = 'h02R' // [Draenei] - Draenei Demolisher (200)
        set udg_TierFourTowers[40] = 'n00U' // [Demon] - Summoning Shrine (225)
        set udg_TierFourTowers[41] = 'h03F' // [Workers Union] - Human Peasant (200)
        set udg_TierFourTowers[42] = 'h02F' // [Void Cult] - Void Priest (200)
        set udg_TierFourTowers[43] = 'hC82' // [Night Elves] - Ancient Protector (150)
        set udg_TierFourTowers[44] = 'hC86' // [Night Elves] - Chimaera Roost (250)
        set udg_TierFourTowers[45] = 'h04M' // [Cavernous Creatures] - Cavern Hermit (200)





        set udg_TierFourSize = 45

        // TIER FIVE 300 - 399
        set udg_TierFiveTowers[0] = 'h03V' // Doom Guard
        set udg_TierFiveTowers[1] = 'hC97' // Iron Golem
        set udg_TierFiveTowers[2] = 'h00R' // Sacrificial Pit
        set udg_TierFiveTowers[3] = 'h027' // Prawn (350)
        set udg_TierFiveTowers[4] = 'n019' // Ice Troll High Priest (320)
        set udg_TierFiveTowers[5] = 'o006' // Chaos Kodo Beast (300)
        set udg_TierFiveTowers[6] = 'o011' // Chaos Wyvern Rider (350)
        set udg_TierFiveTowers[7] = 'oC67' // Flesh Golem (350)
        set udg_TierFiveTowers[8] = 'h04B' // Cold Tower (300)
        set udg_TierFiveTowers[9] = 'oC60' // Wyvern (350)
        set udg_TierFiveTowers[10] = 'h01G' // Razormane (325)
        set udg_TierFiveTowers[11] = 'n00N' // Corrupted Ancient of War (325)
        set udg_TierFiveTowers[12] = 'n04E' // Banshee (300)
        set udg_TierFiveTowers[13] = 'n05B' // Brother Maynard (300)
        set udg_TierFiveTowers[14] = 'n03I' // Forest Troll High Priest (320)
        set udg_TierFiveTowers[15] = 'n02D' // Gnoll Poacher (300)
        set udg_TierFiveTowers[16] = 'n05A' // Killer Rabbit (333)
        set udg_TierFiveTowers[17] = 'n04O' // Mr. Charlie (300)
        set udg_TierFiveTowers[18] = 'n01W' // Penguin (300)
        set udg_TierFiveTowers[19] = 'h02K' // Forgotten One (300)
        set udg_TierFiveTowers[20] = 'h02L' // Hydralisk (350)
        set udg_TierFiveTowers[21] = 'e00P' // Star Chaser (350)
        set udg_TierFiveTowers[22] = 'h04G' // [Draenei] - Draenei Spiritualist (350)
        set udg_TierFiveTowers[23] = 'h04N' // [Cavernous Creatures] - Cavern Turtle (300)



        set udg_TierFiveSize = 23

        // TIER SIX 400 - 499
        set udg_TierSixTowers[0] = 'hC32' // Frost Wyrm (400)
        set udg_TierSixTowers[1] = 'o013' // Chaos Pool (400)
        set udg_TierSixTowers[2] = 'oC68' // Chimera (450)
        set udg_TierSixTowers[3] = 'o00D' // High Elf Blood Mage (450)
        set udg_TierSixTowers[4] = 'o00Q' // Hight Elf Captain (400)
        set udg_TierSixTowers[5] = 'o00S' // Tauren Chieftain (400)
        set udg_TierSixTowers[6] = 'n00P' // Corrupted Tree of Life (400)
        set udg_TierSixTowers[7] = 'n02N' // Captain (400)
        set udg_TierSixTowers[8] = 'n05N' // Flying Dwarf (400)
        set udg_TierSixTowers[9] = 'n03J' // Forest Troll Joker (400)
        set udg_TierSixTowers[10] = 'n01Z' // Pig (450)
        set udg_TierSixTowers[11] = 'h00K' // Death Tower (400)
        set udg_TierSixTowers[12] = 'n04P' // OhMyWTEFF? (400)
        set udg_TierSixTowers[13] = 'e00Q' // Space Runner (450)
        set udg_TierSixTowers[14] = 'h03G' // [Workers Union] - Naga Slave (400)
        set udg_TierSixTowers[15] = 'h00B' // [Night Elves] - Ancient of Wind (400)
        set udg_TierSixTowers[16] = 'h04Q' // [Cavernous Creatures] - Cavern Druid (400)
        set udg_TierSixTowers[17] = 'n01A' // Ice Troll Joker (400)
        set udg_TierSixTowers[18] = 'o01O' // [Goblins] Alchemist (400)

        set udg_TierSixSize = 18

        // TIER SEVEN 500 - 699
        set udg_TierSevenTowers[0] = 'h00F' // Dreadlord
        set udg_TierSevenTowers[1] = 'h00N' // Infernal Fireblaster
        set udg_TierSevenTowers[2] = 'h004' // Sapphiron
        set udg_TierSevenTowers[3] = 'n01B' // Ice Troll King (500)
        set udg_TierSevenTowers[4] = 'o00T' // Blademaster (500)
        set udg_TierSevenTowers[5] = 'o016' // Chaos Farseer (500)
        set udg_TierSevenTowers[6] = 'oC74' // Dune Worm (500)
        set udg_TierSevenTowers[7] = 'o015' // Giant King (600)
        set udg_TierSevenTowers[8] = 'o008' // Gnom Hellscream (600)
        set udg_TierSevenTowers[9] = 'o00G' // Jungle Stalker (500)
        set udg_TierSevenTowers[10] = 'h04C' // Boulder Tower (600)
        set udg_TierSevenTowers[11] = 'o00U' // Phoenix (600)
        set udg_TierSevenTowers[12] = 'o00P' // Rexxar (600)
        set udg_TierSevenTowers[13] = 'o00Y' // Sea Giant (550)
        set udg_TierSevenTowers[14] = 'o00K' // Zealot (600)
        set udg_TierSevenTowers[15] = 'n05O' // Battle Golem (650)
        set udg_TierSevenTowers[16] = 'n04Q' // BladeMastur (600)
        set udg_TierSevenTowers[17] = 'n02E' // Gnoll Assassin (500)
        set udg_TierSevenTowers[18] = 'n01X' // Lizard (550)
        set udg_TierSevenTowers[19] = 'n04F' // Lord Garithos (500)
        set udg_TierSevenTowers[20] = 'n05C' // Sir Galahad the Pure (500)
        set udg_TierSevenTowers[21] = 'n020' // Snow Owl (650)
        set udg_TierSevenTowers[22] = 'n04G' // Varimathras (600)
        set udg_TierSevenTowers[23] = 'o01P' // Goblin BladeMaster (600)
        set udg_TierSevenTowers[24] = 'h02M' // Orc Kart (500)
        set udg_TierSevenTowers[25] = 'h02N' // Undead Kart (650)
        set udg_TierSevenTowers[26] = 'h028' // Skeletal Mage (500)
        set udg_TierSevenTowers[27] = 'h029' // Spirit Hawk (600)
        set udg_TierSevenTowers[28] = 'e00R' // Celestial Mist (600)
        set udg_TierSevenTowers[29] = 'h04I' // [Draenei] - Salamander Lord (500)
        set udg_TierSevenTowers[30] = 'h01M' // [Void Cult] - Void Fissure (500)
        set udg_TierSevenTowers[31] = 'h03H' // [Workers Union] - Night Elf Wisp (600)
        set udg_TierSevenTowers[32] = 'h00G' // [Night Elves] - Warden (550)
        set udg_TierSevenTowers[33] = 'h04O' // [Cavernous Creatures] - Cavern Revenant (600)




        set udg_TierSevenSize = 33

        // TIER EIGHT 700 - 899
        set udg_TierEightTowers[0] = 'e008' // [Night Elves] - Illidan (700)

        set udg_TierEightTowers[1] = 'h002' // Rokhan
        set udg_TierEightTowers[2] = 'o01B' // Chaos Blademaster (800) 
        set udg_TierEightTowers[3] = 'o00N' // Kael (700)
        set udg_TierEightTowers[4] = 'oC65' // Warchief Thrall (800)
        set udg_TierEightTowers[5] = 'h01U' // Fire Lord (850)
        set udg_TierEightTowers[6] = 'n03L' // Forest Troll King (800)
        set udg_TierEightTowers[7] = 'n02F' // Gnoll Warden (800)
        set udg_TierEightTowers[8] = 'n02O' // Grand General Nice-Angel (750)
        set udg_TierEightTowers[9] = 'n04R' // MissyisPissy (800)
        set udg_TierEightTowers[10] = 'n05D' // Shrubbery (700)
        set udg_TierEightTowers[11] = 'n03B' // Spirit Hydra (800)
        set udg_TierEightTowers[12] = 'n021' // iamBEAST (850)
        set udg_TierEightTowers[13] = 'h02O' // Dwarf Kart (800)
        set udg_TierEightTowers[14] = 'h02B' // Treant (700)
        set udg_TierEightTowers[15] = 'h04D' // Flame Tower (750)
        set udg_TierEightTowers[16] = 'h00L' // Dalaran Guard Tower (850)
        set udg_TierEightTowers[17] = 'e00S' // Moonlight (850)
        set udg_TierEightTowers[18] = 'h00I' // [Draenei] - Akama (800)
        set udg_TierEightTowers[19] = 'h01A' // [Void Cult] - Void Corrupter (800)

        set udg_TierEightSize = 19

        // TIER NINE 900+
        set udg_TierNineTowers[0] = 'h000' // Antonidas the Undead
        set udg_TierNineTowers[1] = 'h02V' // Sky-Fury (1000)
        set udg_TierNineTowers[2] = 'o00L' // Mannoroth (1000)
        set udg_TierNineTowers[3] = 'eC93' // Kil'jaeden (1200)
        set udg_TierNineTowers[4] = 'n00R' // Corrupted Shandris (1000)
        set udg_TierNineTowers[5] = 'n00S' // Corrupted Warden (900)
        set udg_TierNineTowers[6] = 'n04S' // BrandTheOne (1400)
        set udg_TierNineTowers[7] = 'n05Q' // Dwarf King (Statue) (2000)
        set udg_TierNineTowers[8] = 'n03K' // Forest Troll Emperor (1000)
        set udg_TierNineTowers[9] = 'n05F' // Sir Lancelot the Brave (1000)
        set udg_TierNineTowers[10] = 'n04H' // Sylvanus Windrunner (900)
        set udg_TierNineTowers[11] = 'n02R' // Dragon Turtle (1200)
        set udg_TierNineTowers[12] = 'n04T' // Trap (1800)
        set udg_TierNineTowers[13] = 'n05E' // The Black Beast of Arrrghhh (1300)
        set udg_TierNineTowers[14] = 'n02P' // White-Angel (900)
        set udg_TierNineTowers[15] = 'n02G' // phoenixfun.rg the gnoll (1000)
        set udg_TierNineTowers[16] = 'h02P' // Diablo Kart (1000)
        set udg_TierNineTowers[17] = 'h02Q' // Iron As In Arthas (1200)
        set udg_TierNineTowers[18] = 'h02D' // Avatar of Vengeance (1000)
        set udg_TierNineTowers[19] = 'o01S' // Goblin Tinker (1100)
        set udg_TierNineTowers[20] = 'h02C' // Quilbeast (900)
        set udg_TierNineTowers[21] = 'e00T' // The Creator (1000)
        set udg_TierNineTowers[22] = 'o001' // Giant King (999)
        set udg_TierNineTowers[23] = 'n03B' // [Cavernous Creatures] - Spirit Hydra (900)
        set udg_TierNineTowers[24] = 'n01C' // Ice Troll Emperor (900)

        set udg_TierNineSize = 24
    endfunction



public function Init takes nothing returns nothing
    call setUpHybrid()
endfunction



endlibrary

