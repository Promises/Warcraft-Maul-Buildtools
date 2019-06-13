library Commands initializer Init requires SharedWorld 

    private function GetPlayerIdFromColorName takes string color returns integer
        if(color == "red")then
            return 0
        elseif(color == "blue")then
            return 1
        elseif(color == "teal")then
            return 2
        elseif(color == "purple")then
            return 3
        elseif(color == "yellow")then
            return 4
        elseif(color == "orange")then
            return 5
        elseif(color == "green")then
            return 6
        elseif(color == "pink")then
            return 7
        elseif(color == "grey")then
            return 8
        elseif(color == "lightblue")then
            return 9
        elseif(color == "darkgreen")then
            return 10
        elseif(color == "gray")then
            return 8
        elseif(color == "lb")then
            return 9
        elseif(color == "dg")then
            return 10
        elseif(color == "brown")then
            return 11
        elseif(color == "maroon")then
            return 12
        elseif(color == "purp")then
            return 3
        else
            return -1
        endif
    endfunction

    private function HasCorrectUnitUserData takes nothing returns boolean
        if(LoadIntegerBJ(0, GetHandleIdBJ(GetEnumUnit()), udg_PlayerLeavesTable) == GetConvertedPlayerId(GetTriggerPlayer()))then
            return true
        endif
        return false
    endfunction

    private function EnumSpecialEffect takes nothing returns nothing
        local real x = GetUnitX(GetEnumUnit())
        local real y = GetUnitY(GetEnumUnit())
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", x, y))
    endfunction

    private function SellATower takes nothing returns nothing
        if(HasCorrectUnitUserData())then
            call SharedWorld_SellTower(GetEnumUnit())
        endif
    endfunction

    private function SellAllActions takes nothing returns nothing
        local group grp = GetUnitsOfPlayerAll(GetTriggerPlayer())
        call ForGroupBJ(grp, function SellATower)
        call DestroyGroup(grp)
    endfunction

    private function RepickRemoveConditions takes nothing returns boolean
        if(GetUnitTypeId(GetEnumUnit()) == 'h03S')then
            return false
        endif

        if(GetUnitTypeId(GetEnumUnit()) == 'e00C')then
            return false
        endif

        return true
    endfunction

    private function RemoveTriggeringPlayerUnits takes nothing returns nothing
        if(GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer()) then
            if(RepickRemoveConditions())then
                call RemoveUnit(GetEnumUnit())
            endif
        endif
    endfunction

    private function RepickActions takes nothing returns nothing
        local integer playerid = GetPlayerId(GetTriggerPlayer())
        local group grp = GetUnitsInRectAll(GetPlayableMapRect())
        if playerid == 8 then
            if (GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 150) then
                call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 150)
            endif
        else
            if (GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) > 100) then
                call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, 100)
            endif
        endif
        call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1)
        call ForGroupBJ(grp, function RemoveTriggeringPlayerUnits)
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function RepickConditions takes nothing returns boolean
        if not(udg_CreepLevel==1) then
            return false
        endif

        if udg_IsWaveInProgress then
            return false
        endif

        if udg_HasHardcoreRandomed[GetPlayerId(GetTriggerPlayer())] then
            return false
        endif

        if udg_HasHybridRandomed[GetPlayerId(GetTriggerPlayer())] then
            return false
        endif

        return true
    endfunction

    private function CloseAllSpawns takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 12
            set udg_IsSpawnOpen[i] = 0
            set i = i + 1
        endloop
    endfunction

    private function OpenAllSpawns takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 12
            set udg_IsSpawnOpen[i] = 1
            set i = i + 1
        endloop
    endfunction

    private function ChangeUnitOwnership takes nothing returns nothing
        if(GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer())then
            if(IsUnitIdType(GetUnitTypeId(GetEnumUnit()), UNIT_TYPE_TOWNHALL) == false)then
                if(IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true )then
                    call SetUnitOwner( GetEnumUnit(), Player(udg_UnitOwnershipInt), true )
                endif
            endif
        endif
    endfunction

    private function ChangeUnitOwnershipAction takes nothing returns nothing
        local group grp = GetUnitsSelectedAll(GetTriggerPlayer())
        call ForGroupBJ(grp, function ChangeUnitOwnership)
        call DestroyGroup(grp)
        set grp = null
    endfunction

    private function ChangeRestrictionOfPlayer takes integer pidtrig, integer pid, boolean flag returns nothing
        set udg_PlayerRestrictions[13 * pidtrig + pid] = flag
    endfunction

    private function IsPickedUnitOwnedByDeniedPlayer takes nothing returns boolean
        return udg_PlayerRestrictions[13 * GetPlayerId(GetTriggerPlayer()) + GetPlayerId(GetOwningPlayer(GetEnumUnit()))]
    endfunction

    private function MoveEnumUnitBackToHisOwnSpawn takes nothing returns nothing
        local real x = GetRectCenterX(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
        local real y = GetRectCenterY(udg_PlayerRestrictionArea[GetPlayerId(GetOwningPlayer(GetEnumUnit()))])
        call SetUnitPosition(GetEnumUnit(), x, y)
    endfunction

    private function ChangeOwnershipOfDeniedPlayerTower takes nothing returns nothing
        if IsPickedUnitOwnedByDeniedPlayer() then
            if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
                if not(IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL)) then
                    call SetUnitOwner(GetEnumUnit(), GetTriggerPlayer(), true)
                endif
            else
                call MoveEnumUnitBackToHisOwnSpawn()
            endif
        endif
    endfunction

    private function SellDeniedPlayerTower takes nothing returns nothing
        if IsPickedUnitOwnedByDeniedPlayer() then
            if IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) then
                if not(IsUnitType(GetEnumUnit(), UNIT_TYPE_TOWNHALL)) then
                    call SellATower()
                endif
            else
                call MoveEnumUnitBackToHisOwnSpawn()
            endif
        endif
    endfunction

    private function SellAllDeniedAccessOwnersTowers takes integer pidtrig returns nothing
        local group grp = GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
        call ForGroupBJ(grp, function SellDeniedPlayerTower)
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function ChangeOwnershipOfAllDeniedAccessTowers takes integer pidtrig returns nothing
        local group grp=GetUnitsInRectAll(udg_PlayerRestrictionArea[pidtrig])
        call ForGroupBJ(grp, function ChangeOwnershipOfDeniedPlayerTower)
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function DenyAllPlayers takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 12
            if(i != GetPlayerId(GetTriggerPlayer()))then
                call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), i, true)
            endif
            set i = i + 1
        endloop
        
        call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
    endfunction

    private function AllowAllPlayers takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 12
            if (i != GetPlayerId(GetTriggerPlayer())) then
                call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), i, false)
            endif
            set i = i + 1
        endloop
    endfunction

    private function AllowSpecificPlayer takes nothing returns nothing
        local string colorname = SubStringBJ(GetEventPlayerChatString(), 8, StringLength(GetEventPlayerChatString()))
        local integer playerid = GetPlayerIdFromColorName(colorname)
        if (playerid > -1) then
            if (playerid != GetPlayerId(GetTriggerPlayer())) then
                call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), playerid, false)
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFF00FF00allowed|r to build in your spawn!")
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You are already allowed to to build in this spawn")
            endif
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
        endif
    endfunction

    private function DenySpecificPlayer takes nothing returns nothing
        local string colorname = SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))
        local integer playerid = GetPlayerIdFromColorName(colorname)
        if (playerid > -1) then
            if (playerid != GetPlayerId(GetTriggerPlayer())) then
                call ChangeRestrictionOfPlayer(GetPlayerId(GetTriggerPlayer()), playerid, true)
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r is now |cFFFF0000denied|r access to your spawn!")
                call ChangeOwnershipOfAllDeniedAccessTowers(GetPlayerId(GetTriggerPlayer()))
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't deny yourself access!")
            endif
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
        endif
    endfunction

    private function FindNextSpaceCharacter takes string txt, integer startIndex returns integer
        local integer index = startIndex
        local integer stringLength = StringLength(txt)

        loop
            exitwhen index > stringLength
            if SubStringBJ(txt, index, index) == " " then
                return index
            endif
            set index = index + 1
        endloop
        return -1
    endfunction

    private function GiveGoldToPlayer takes string chatStr, integer spaceCharacterIndex returns nothing
        local string colorname = SubStringBJ(chatStr, 7, spaceCharacterIndex - 1)
        local integer playerid = GetPlayerIdFromColorName(colorname)
        local integer goldAmount
        local string goldAmountStr

        if playerid == -1 then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid player color")
            return
        endif

        set goldAmount = S2I(SubStringBJ(chatStr, spaceCharacterIndex + 1, StringLength(chatStr)))
        set goldAmountStr = I2S(goldAmount)

        if goldAmount > 0 then
            if GetPlayerSlotState(Player(playerid)) == PLAYER_SLOT_STATE_PLAYING then
                if GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) >= goldAmount then
                    call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) - goldAmount)
                    call SetPlayerStateBJ(Player(playerid ), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(Player(playerid), PLAYER_STATE_RESOURCE_GOLD) + goldAmount)
                    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You've sent |cFFFFCC00" + goldAmountStr + "|r gold to " + udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r")
                    call DisplayTimedTextToPlayer(Player(playerid), 0, 0, 5, "You've received |cFFFFCC00" + goldAmountStr + "|r gold from " + udg_PlayerColorCodes[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r")
                else
                    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You do not have this much gold")
                endif
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "This player is not in-game")
            endif
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You can't give this amount")
        endif
    endfunction

    private function GiveGold takes nothing returns nothing
        local string chatStr = GetEventPlayerChatString()
        local integer spaceCharacterIndex = FindNextSpaceCharacter(chatStr, 7)
        if spaceCharacterIndex > 0 then
            call GiveGoldToPlayer(chatStr, spaceCharacterIndex)
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Invalid command")
        endif
    endfunction

    private function CountCurrentVotes takes nothing returns integer
        local integer i = 0
        local integer totalCount = 0
        loop
            exitwhen i > 13
            if (udg_HasVotedToKick[i]) then
                set totalCount = totalCount + 1
            endif
            set i = i + 1
        endloop

        return totalCount
    endfunction

    private function VotekickExpire takes nothing returns nothing
        local integer i = 0
        local integer totalCount = 0

        loop
            exitwhen i > 13
            if (udg_HasVotedToKick[i]) then
                set totalCount = totalCount + 1
            endif
            set udg_HasVotedToKick[i] = false
            set i = i + 1
        endloop

        call DisplayTextToForce(GetPlayersAll(), "Votekick for " + udg_PlayerColorCodes[udg_VotekickPlayerId] + GetPlayerName(Player(udg_VotekickPlayerId)) + "|r has ended with " + I2S(totalCount) + " votes")

        set udg_VotekickInProgress = false
    endfunction

    private function IsPickedUnitOwnedByKickedPlayer takes nothing returns boolean
        if not(GetPlayerId(GetOwningPlayer(GetEnumUnit())) == udg_VotekickPlayerId) then
            return false
        endif

        if not(GetUnitTypeId(GetEnumUnit()) != 'h03S') then
            return false
        endif

        return true
    endfunction

    private function RemoveKickedPlayerTowers takes nothing returns nothing
        if IsPickedUnitOwnedByKickedPlayer() then
            call RemoveUnit(GetEnumUnit())
        endif
    endfunction

    private function RemoveAllKickedPlayerTowers takes nothing returns nothing
        local group grp = GetUnitsInRectAll(GetPlayableMapRect())
        call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()),function RemoveKickedPlayerTowers)
        call DestroyGroup(grp)
        set grp=null
    endfunction

    private function CheckVotes takes nothing returns nothing
        local integer currentVotes = CountCurrentVotes()
        local integer requiredVotes = (udg_PlayerCount / 2) + 1
        local integer missingVotes = requiredVotes - currentVotes
        if (currentVotes >= requiredVotes) then
            set udg_IsSpawnOpen[udg_VotekickPlayerId] = 0
        
            // Remove all towers and units
            call RemoveAllKickedPlayerTowers()

            // Update scoreboard
            call MultiboardSetItemValueBJ(udg_Scoreboard, 1, 7 + udg_PlayerScorePosition[udg_VotekickPlayerId], udg_PlayerColorCodes[udg_VotekickPlayerId] + "<Kicked>|r")
        
            // Set new player count
            set udg_PlayerCount = udg_PlayerCount - 1
            
            call DisplayTextToForce(GetPlayersAll(), "Votekick for " + udg_PlayerColorCodes[udg_VotekickPlayerId] + GetPlayerName(Player(udg_VotekickPlayerId)) + "|r has succeeded!")
            call CustomDefeatBJ(Player(udg_VotekickPlayerId), "Kicked!")
        else
            call DisplayTextToForce(GetPlayersAll(), "You'll need " + I2S(missingVotes) + " more votes to kick")
        endif
    endfunction

    private function VoteYes takes nothing returns nothing
        local integer votingPlayerId = GetPlayerId(GetTriggerPlayer())
        if udg_VotekickInProgress then
            if not (udg_HasVotedToKick[votingPlayerId]) then
                if votingPlayerId != udg_VotekickPlayerId then
                    set udg_HasVotedToKick[votingPlayerId] = true
                    call CheckVotes()
                else
                    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't votekick yourself!")
                endif
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "You have already voted to kick this player")
            endif
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "There is no votekick in progress")
        endif
    endfunction

    private function Votekick takes nothing returns nothing
        local integer votingPlayerId = GetPlayerId(GetTriggerPlayer())
        local string chatStr = GetEventPlayerChatString()
        local string colorname = SubStringBJ(GetEventPlayerChatString(), 11, StringLength(GetEventPlayerChatString()))
        local integer playerid = GetPlayerIdFromColorName(colorname)
        if playerid != -1 then
            if GetPlayerSlotState(Player(playerid)) == PLAYER_SLOT_STATE_PLAYING then
                if not (udg_VotekickInProgress) then
                    if votingPlayerId != playerid then
                        call DisplayTextToForce(GetPlayersAll(), udg_PlayerColorCodes[votingPlayerId] + GetPlayerName(GetTriggerPlayer()) + "|r has started a votekick for " + udg_PlayerColorCodes[playerid] + GetPlayerName(Player(playerid)) + "|r (say -y to vote)")
                        set udg_VotekickInProgress = true
                        set udg_VotekickPlayerId = playerid
                        set udg_HasVotedToKick[votingPlayerId] = true
                        call TimerStart(udg_VotekickTimer, 30.00, false, function VotekickExpire)
                    else
                        call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"You can't votekick yourself!")
                    endif
                else
                    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Votekick already in progress")
                endif
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"This player is no longer in game!")
            endif
        else
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"Please enter a valid color!")
        endif
    endfunction

    private function ZoomPlayerCamera takes string zoomval returns nothing
        call SetCameraFieldForPlayer( GetTriggerPlayer(), CAMERA_FIELD_ZOFFSET, S2I(zoomval), 0 )
    endfunction

    private function CreateImageEx takes string imagePath, real size, real x, real y, real z, boolean showImage returns image
        local image i = CreateImage(imagePath, size, size, 0, x - (size / 2), y - (size / 2), z, 0, 0, 0, 2)
        call SetImageRenderAlways(i, true)
        call ShowImage(i, showImage)
        return i
    endfunction

    private function OutlineBuilding takes string imagePath, real x, real y returns nothing
        call CreateImageEx(imagePath, 192, x, y, 0.00, true)
    endfunction

    /*
    private function OutlineBuilding takes string effectModel, real x, real y returns nothing
        local integer i = 0
        local integer maxIndex = 96
        local real halfIndex = maxIndex / 2.00
        loop
            exitwhen i > maxIndex
            call AddSpecialEffect(effectModel, x - halfIndex + i, y + halfIndex)
            call AddSpecialEffect(effectModel, x + halfIndex, y + halfIndex - i)
            call AddSpecialEffect(effectModel, x + halfIndex - i, y - halfIndex)
            call AddSpecialEffect(effectModel, x - halfIndex, y - halfIndex + i)
            set i = i + 32
        endloop
    endfunction
    */

    private function ShowMaze takes real x, real y, real x2, real y2 returns nothing
        local string effectModel = ""
        local real towardsX2 = x2 - x
        local real towardsY2 = y2 - y
        local real towardsX2Div9 = (towardsX2 / 9)
        local real towardsX2Div18 = (towardsX2 / 18)
        local real towardsY2Div9 = (towardsY2 / 9)
        local real towardsY2Div18 = (towardsY2 / 18)

        if (GetTriggerPlayer() == GetLocalPlayer()) then
            // set effectModel = "Abilities\\Spells\\Undead\\AbsorbMana\\AbsorbManaBirthMissile.mdl"
            // set effectModel = "ReplaceableTextures\\Splats\\HumanUbersplat.blp"
            set effectModel = "ReplaceableTextures\\Splats\\SuggestedPlacementSplat.blp"
        endif

        // Between Checkpoints
        call OutlineBuilding(effectModel, x + towardsX2Div9, y + towardsY2Div9)
        call OutlineBuilding(effectModel, x + 2 * towardsX2Div9, y + 2 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + 3 * towardsX2Div9, y + 3 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + 4 * towardsX2Div9, y + 4 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + 5 * towardsX2Div9, y + 5 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + 6 * towardsX2Div9, y + 6 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + 7 * towardsX2Div9, y + 7 * towardsY2Div9)

        // Around first checkpoint
        call OutlineBuilding(effectModel, x - towardsY2Div9, y - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsX2Div9, y - towardsY2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div9 - towardsX2Div18, y - towardsY2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div9 + towardsY2Div18 + towardsX2Div18, y + towardsY2Div18 + towardsX2Div9 + towardsX2Div18)

        // Around second checkpoint
        call OutlineBuilding(effectModel, x + 8 * towardsX2Div9, y + 8 * towardsY2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div9 + 9 * towardsX2Div9, y + 9 * towardsY2Div9 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + 10 * towardsX2Div9, y + 10 * towardsY2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div9 + 9 * towardsX2Div9 + towardsX2Div18, y + 9 * towardsY2Div9 + towardsY2Div18 - towardsX2Div9)

        // Left side
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18, y + towardsY2Div18 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + towardsX2Div9, y + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 2 * towardsX2Div9, y + towardsY2Div18 + 2 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 3 * towardsX2Div9, y + towardsY2Div18 + 3 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 4 * towardsX2Div9, y + towardsY2Div18 + 4 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 5 * towardsX2Div9, y + towardsY2Div18 + 5 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 6 * towardsX2Div9, y + towardsY2Div18 + 6 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)
        call OutlineBuilding(effectModel, x + towardsY2Div18 + towardsY2Div9 + towardsX2Div18 + 7 * towardsX2Div9, y + towardsY2Div18 + 7 * towardsY2Div9 + towardsX2Div18 + towardsX2Div9)

        // Right side
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 8 * towardsX2Div9, y + towardsY2Div18 + 8 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 7 * towardsX2Div9, y + towardsY2Div18 + 7 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 6 * towardsX2Div9, y + towardsY2Div18 + 6 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 5 * towardsX2Div9, y + towardsY2Div18 + 5 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 4 * towardsX2Div9, y + towardsY2Div18 + 4 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 3 * towardsX2Div9, y + towardsY2Div18 + 3 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + 2 * towardsX2Div9, y + towardsY2Div18 + 2 * towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
        call OutlineBuilding(effectModel, x - towardsY2Div18 - towardsY2Div9 + towardsX2Div18 + towardsX2Div9, y + towardsY2Div18 + towardsY2Div9 - towardsX2Div18 - towardsX2Div9)
    endfunction

    private function ShowMazeAll takes nothing returns nothing
        local integer i = 0
        loop
            exitwhen i > 13
            call ShowMaze(GetRectCenterX(udg_Checkpoints[2 * i]), GetRectCenterY(udg_Checkpoints[2 * i]), GetRectCenterX(udg_Checkpoints[2 * i + 1]), GetRectCenterY(udg_Checkpoints[2 * i + 1]))
            set i = i + 1
        endloop
    endfunction

    private function PlayerChatCommandActions takes nothing returns nothing
        local player p = GetTriggerPlayer()
        if(GetEventPlayerChatString()=="-air")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,"|cFF999999Air:|r 5 / 15 / 20 / 25 / 30")
        elseif(GetEventPlayerChatString()=="-boss")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31")
        elseif(GetEventPlayerChatString()=="-champ")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFF2A137Champion:|r 35 / 36")
        elseif(GetEventPlayerChatString()=="-champion")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFF2A137Champion:|r 35 / 36")
        elseif(GetEventPlayerChatString()=="-light")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32")
        elseif(GetEventPlayerChatString()=="-medium")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33")
        elseif(GetEventPlayerChatString()=="-heavy")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35")
        elseif(GetEventPlayerChatString()=="-fortified")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31")
        elseif(GetEventPlayerChatString()=="-hero")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF7525FFHero:|r 36")
        elseif(GetEventPlayerChatString()=="-waves")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "|cFF999999Air:|r 5 / 15 / 20 / 25 / 30\n|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31\n|cFFF2A137Champion:|r 35 / 36\n|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32\n|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33\n|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35\n|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31\n|cFF7525FFHero:|r 36")
        elseif(GetEventPlayerChatString()=="-buffs")then
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 20, "|cFFFFCC00Hardened Skin:|r Creeps ignore 2x creep level incoming physical damage\n|cFFFFCC00Evasion:|r Creeps will have a 1x creep level chance to evade physical damage\n|cFFFFCC00Armor Bonus:|r Increases creep armor by creep level divided by 3\n|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower, slowing attack speed by 1.5% times creep level\n|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n|cFFFFCC00Divine Shield:|r Creeps ignore damage until they've been damaged 1x creep level times\n|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they reach a checkpoint (not teleports)")
        elseif(GetEventPlayerChatString() == "-repick")then
            if(RepickConditions())then
                call RepickActions()
            else
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,  "You can only repick before wave 1!" )
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-sellall")then
            call SellAllActions()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 3) == "-sa")then
            call SellAllActions()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 2) == "-y")then
            call VoteYes()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-openall")then
            if udg_DebugMode then
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "All spawns are now open!")
                call OpenAllSpawns()
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-gold ")then
            if udg_DebugMode then
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Gold was set to |cFFFFCC00" + SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())) + "|r")
                call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 8) == "-lumber ")then
            if udg_DebugMode then
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Lumber was set to |cFF00C850" + SubStringBJ(GetEventPlayerChatString(), 9, StringLength(GetEventPlayerChatString())) + "|r")
                call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, S2I(SubStringBJ(GetEventPlayerChatString(), 9, StringLength(GetEventPlayerChatString()))))
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-lives ")then
            if udg_DebugMode then
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Lives were set to |cFFFFCC00" + SubStringBJ(GetEventPlayerChatString(), 8, StringLength(GetEventPlayerChatString())) + "|r")
                set udg_TotalLives = S2I(SubStringBJ(GetEventPlayerChatString(), 8, StringLength(GetEventPlayerChatString())))
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 9) == "-closeall")then
            if udg_DebugMode then
                call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "All spawns are now closed!")
                call CloseAllSpawns()
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-diff ")then
            if udg_DebugMode then
                    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5, "Difficulty was set to " + SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())) + "%")
                    call SetPlayerHandicapBJ(Player(13),S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
                    call SetPlayerHandicapBJ(Player(14),S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
                    call SetPlayerHandicapBJ(Player(15),S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
                    call SetPlayerHandicapBJ(Player(16),S2R(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))))
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 10) == "-votekick ")then
            call Votekick()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-give ")then
            call GiveGold()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-send ")then
            call GiveGold()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 7) == "-allow ")then
            call AllowSpecificPlayer()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6) == "-deny ")then
            call DenySpecificPlayer()
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 9) == "-allowall")then
            call AllowAllPlayers()
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,  "ALL players are now |cFF00FF00allowed|r to build in your spawn!" )
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 8)=="-denyall")then
            call DenyAllPlayers()
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,  "ALL players are now |cFFFF0000denied|r access to your spawn!" )
        elseif(GetEventPlayerChatString() == "-claim")then
            call DenyAllPlayers()
            call AllowAllPlayers()
            call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5,  "All towers in your spawn has now been claimed." )
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6)=="-zoom ")then
            if (GetLocalPlayer() == p) then
                call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE,S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString()))), 1)
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 5)=="-cam ")then
            if (GetLocalPlayer() == p) then
                call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE,S2I(SubStringBJ(GetEventPlayerChatString(), 6, StringLength(GetEventPlayerChatString()))), 1)
            endif
        elseif(SubStringBJ(GetEventPlayerChatString(), 1, 6)=="-wave ")then
            if udg_DebugMode then
                set udg_CreepLevel = S2I(SubStringBJ(GetEventPlayerChatString(), 7, StringLength(GetEventPlayerChatString())))
            endif
        elseif(GetEventPlayerChatString()=="-maze")then
            call ShowMazeAll()
        elseif(GetEventPlayerChatString()=="-image")then
            call CreateImageEx("ReplaceableTextures\\Splats\\HumanUbersplat.blp", 128, 0.00, 0.00, 0.00, true)
        endif
    endfunction

    //===========================================================================
    private function Init takes nothing returns nothing
        set udg_trigger43=CreateTrigger()
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(0),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(1),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(2),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(3),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(4),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(5),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(6),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(7),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(8),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(9),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(10),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(11),"-",false)
        call TriggerRegisterPlayerChatEvent(udg_trigger43,Player(12),"-",false)
        call TriggerAddAction(udg_trigger43,function PlayerChatCommandActions)
    endfunction
endlibrary
