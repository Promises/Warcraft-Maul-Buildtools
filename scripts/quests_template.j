//===========================================================================
// Trigger: Quests
//===========================================================================
library QuestLib initializer Init


private function InitializeQuests takes nothing returns nothing

	{{GENERATE}}

	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Commands", "List of in-game commands\n\n|cffffcc00-waves|r (shows you information about every wave)\n|cffffcc00-air|r (tells you when air waves are coming)\n|cffffcc00-boss|r (Tells you when boss waves are coming)\n|cffffcc00-champion|r (tells you when champion waves are coming)\n|cffffcc00-light|r (tells you when light armored waves are coming)\n|cffffcc00-medium|r (tells you when medium armored waves are coming)\n|cffffcc00-heavy|r (tells you when heavy armored waves are coming)\n|cffffcc00-fortified|r (tells you when fortified armor waves are coming)\n|cffffcc00-hero|r (tells you when hero armored waves are coming)\n|cffffcc00-sellall|r or |cffffcc00-sa|r (sells all towers given to you when a player left)\n|cffffcc00-claim|r (claims ownership of all towers built in your area.)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp")
	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Commands 2", "List of in-game commands\n\n|cffffcc00-deny <color>|r (denies the specified color access to your spawn and gives their towers to you)\n|cffffcc00-allow <color>|r (allows the specified color access to your spawn)\n|cffffcc00-denyall|r (denies access to your spawn for all players)\n|cffffcc00-allowall|r (allows access to your spawn for all players)\n|cffffcc00-zoom <value>|r (zooms your camera out)\n|cffffcc00-buffs|r (gives detailed information about creep buffs)\n|cffffcc00-dt/-disabletowers|r (disables your basic tier 1 tower that sell for 10 or less gold)\n|cffffcc00-give <color> <amount>|r (gives the specified color a specified amount of gold)\n|cffffcc00-votekick <color>|r (starts a votekick for the specified color)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp")
	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Bugs & Suggestions", "If you find a bug or want to suggest a change or feature for our map please post it on maulbot.com and our developers will happily look into it!\n(Please make your post detailed so it's easier for us to find the bug or implement your feature)", "ReplaceableTextures\\CommandButtons\\BTNReplay-Play.blp")
	call CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "Armor types", "Unarmored takes 150% damage from piercing attacks and 150% damage from siege\nLight takes 200% from piercing and 125% from magic attacks\nMedium takes 150% damage from normal, 75% from piercing, 75% from magic and 50% from siege\nHeavy armor takes 200% damage from magic attacks\nFortified takes 70% from normal, 35% from piercing, 35% from magic, 150% from siege and 50% from hero\n\nAnything unmentioned deals the standard 100% damage", "ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpOne.blp")
endfunction

//===========================================================================
private function InitTrig_Quests takes nothing returns nothing
	set udg_trigger46=CreateTrigger()
	call TriggerRegisterTimerEventSingle(udg_trigger46, 1.00)
	call TriggerAddAction(udg_trigger46, function InitializeQuests)
endfunction

private function Init takes nothing returns nothing
    // This will be executed in map initialization, or near it :P
	call InitializeQuests()
endfunction


endlibrary


