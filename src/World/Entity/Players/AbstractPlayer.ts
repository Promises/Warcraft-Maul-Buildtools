import { COLOUR_CODES } from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';

export abstract class AbstractPlayer {
    public wcPlayer: player;
    public id: number;

    protected constructor(id: number) {
        this.id = id;
        this.wcPlayer = Player(id);
        BJDebugMsg("CrEATED");
    }

    public makeAlliance(otherPlayer: AbstractPlayer): void {
        SetPlayerAllianceStateBJ(this.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION);
    }

    public getPlayerColour(): string {
        return COLOUR[this.id].toLowerCase();
    }

    public getColourCode(): string {
        return COLOUR_CODES[this.id];
    }

    public getNameWithColour(): string {
        return Util.ColourString(this.getColourCode(), this.getPlayerName());
    }

    public getPlayerName(): string {
        return GetPlayerName(this.wcPlayer);
    }

    public sendMessage(message: string): void {
        Log.Message(`{"s":"${this.getPlayerName()}", "m":"${message}"}`)
        DisplayTimedTextToPlayer(this.wcPlayer, 0, 0, 10, message);
    }

    public setGold(amount: number): void {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, amount);
    }

    public setLumber(amount: number): void {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, amount);
    }

    public setHandicap(percentage: number): void {
        SetPlayerHandicapBJ(this.wcPlayer, percentage);
    }

    public giveLumber(amount: number): void {
        AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER);
    }

    public giveGold(amount: number): void {
        if (amount) {
            AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD);
        }
    }

    public getGold(): number {
        return GetPlayerState(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD);
    }

    public getLumber(): number {
        return GetPlayerState(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER);
    }

    public defeatPlayer(): void {
        CustomDefeatBJ(this.wcPlayer, 'Defeat!');
    }

}
