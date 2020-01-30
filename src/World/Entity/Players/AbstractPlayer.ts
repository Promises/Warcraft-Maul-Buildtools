import { COLOUR_CODES } from '../../GlobalSettings';
import { Log } from '../../../lib/Serilog/Serilog';

export abstract class AbstractPlayer {
    public wcPlayer: player;
    public id: number;
    private name: string;
    private battleTag: string;

    protected constructor(id: number) {
        this.id = id;
        this.wcPlayer = Player(id);
        this.battleTag = GetPlayerName(this.wcPlayer);

        if (this.battleTag.indexOf('#') > 0) {
            Log.Error(`${this.battleTag} ${this.battleTag.indexOf('#')}`);
            this.name = this.battleTag.slice(0, this.battleTag.indexOf('#'));
            if (this.battleTag === 'Runi95#2202' ||
                this.battleTag === 'Promises#2725' ||
                this.battleTag === 'Arcano#1610' ||
                this.battleTag === 'GenoHacker#2987' ||
                this.battleTag === 'ThaOneSmutje#2560') {
                this.name = `${Util.ColourString('#7ab1df', '[DEV]')} ${this.getNameWithColour()}`;
            }
        } else {
            this.name = this.battleTag;
        }

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
        return this.name;
    }

    public sendMessage(message: string): void {
        Log.Message(`{"s":"${this.getPlayerName()}", "m":"${message}"}`);
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
