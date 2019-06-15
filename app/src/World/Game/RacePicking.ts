import * as settings from '../GlobalSettings';
import { Trigger } from '../../JassOverrides/Trigger';
import { WarcraftMaul } from '../WarcraftMaul';
import { Defender } from '../Entity/Players/Defender';
import { Race } from './Races/Race';

export class RacePicking {
    raceSelectTrigger: Trigger;
    private game: WarcraftMaul;

    constructor(game: WarcraftMaul) {
        this.game = game;
        this.raceSelectTrigger = new Trigger();
        this.raceSelectTrigger.RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELL_ITEM);
        this.raceSelectTrigger.AddCondition(() => this.RaceSelectionConditions());
        this.raceSelectTrigger.AddAction(() => this.RaceSelectionActions());


        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03Q'), -1920.00, 3000.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h00H'), -1920.00, 2624.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h00O'), -1920.00, 2240.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03C'), -1920.00, 1856.00, 0.00);
        CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC('h03K'), -1920.00, 1472.00, 0.00);
        for (let player of settings.players.values()) {
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 3000.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 2624.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 2240.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 1856.00, 0.00);
            CreateUnit(player.wcPlayer, FourCC('e00C'), -1920.00, 1472.00, 0.00);
        }
    }

    private RaceSelectionConditions() {
        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03Q')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h00H')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h00O')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03C')) {
            return true;
        }

        if (GetUnitTypeId(GetSellingUnit()) == FourCC('h03K')) {
            return true;
        }

        return false;

    }



    private RaceSelectionActions() {
        let player = settings.players.get(GetPlayerId(GetOwningPlayer(GetBuyingUnit())));
        if (!player) {
            return;
        }
        this.game.worldMap.playerSpawns[player.id].isOpen = true;
        let soldItem = GetItemTypeId(GetSoldItem());

        if (soldItem == FourCC('I00W')) { // Hardcore random
            if (player.hasHybridRandomed) {
                player.giveLumber(1);
                player.sendMessage('You can only use Hybrid Random!');
            } else {
                if(!player.hasHardcoreRandomed) {
                    if(player.repickCounter == 0){
                        player.hasHardcoreRandomed = true;
                        this.HardCoreRandomRace(player);
                        player.giveGold(50);
                    } else {
                        player.giveLumber(1);
                        player.sendMessage("You can't hardcore random after using normal random!");
                    }
                } else {
                    player.giveLumber(1);
                }
            }
        } else if (soldItem == FourCC('I00V')) { // Normal Random
            if (player.hasHybridRandomed) {
                player.giveLumber(1);
                player.sendMessage('You can only use Hybrid Random!');
            } else {
                if(player.repickCounter < 3){
                    player.repickCounter++;
                }
                player.giveGold(40 - 10 * player.repickCounter);
                this.NormalRandomRace(player);
            }
        } else if (soldItem == FourCC('I00X')) { // Hybrid Random
            if(player.repickCounter == 0 && !player.hasHardcoreRandomed && !player.hasNormalPicked){
                this.HybridRandomRace(player);
                player.giveGold(50);
            } else {
                player.giveLumber(1);
                player.sendMessage("You can't hybrid random after using normal / hardcore random / selection!");
            }
        } else {
            if(player.hasHybridRandomed){
                player.giveLumber(1);
                player.sendMessage("You can only use Hybrid Random!");
            } else {
                player.hasNormalPicked = true;
                this.GetSelectedRace(player, soldItem);
            }
        }

    }

    private HardCoreRandomRace(player: Defender) {
        let randomedRace = this.RandomRace(player);
        if(randomedRace){
            DisplayTextToForce( GetPlayersAll(), player.getNameWithColour()+" has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " + randomedRace.name);
        }



    }

    private GiveBuyingPlayerBuilder(player: Defender, randomedRace: Race) {
        randomedRace.pickAction(player)
    }

    private GetSelectedRace(player: Defender, soldItem: number) {
        let race = this.getRaceFromItem(soldItem);
        if(race){
            player.races.push(race);
            race.pickAction(player);
            DisplayTextToForce( GetPlayersAll(), player.getNameWithColour()+" has chosen " + race.name);
        }

    }


    private getRaceFromItem(soldItem: number){
        for (let race of this.game.worldMap.races) {
            if(FourCC(race.itemid) == soldItem){
                return race;
            }
        }
        return null;
    }
    private NormalRandomRace(player:Defender){
        let randomedRace = this.RandomRace(player);
        if(randomedRace){
            DisplayTextToForce( GetPlayersAll(), player.getNameWithColour()+" has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " + randomedRace.name);
        }

    }

    private RandomRace(player: Defender): Race | undefined {
        let randomNumber = Util.randomInt(0, this.game.worldMap.races.length -1);
        if(player.races.length - this.game.worldMap.races.length  <= this.game.worldMap.disabledRaces){
            player.giveLumber(1);
            return;
        }
        let randomedRace = this.game.worldMap.races[randomNumber];

        if(!randomedRace.enabled){
            return this.RandomRace(player);
        }

        if (player.hasRace(randomedRace)){
            return this.RandomRace(player);
        }
        player.races.push(randomedRace);
        this.GiveBuyingPlayerBuilder(player, randomedRace);
        return randomedRace;
    }

    private HybridRandomRace(player: Defender) {

    }
}
