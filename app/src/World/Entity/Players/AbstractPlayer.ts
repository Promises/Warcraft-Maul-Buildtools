import { COLOUR_CODES } from '../../GlobalSettings';

export abstract class AbstractPlayer {
    wcPlayer: player;
    id: number;

    constructor(id: number) {
        this.id = id;
        this.wcPlayer = Player(id);
    }

    makeAlliance(otherPlayer: AbstractPlayer): void {
        SetPlayerAllianceStateBJ(this.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION);
    }

    getPlayerColour(): string {
        return COLOUR[this.id].toLowerCase();
    }

    getColourCode(): string {
        return COLOUR_CODES[this.id];
    }

    getNameWithColour(): string {
        return Util.ColourString(this.getColourCode(), this.getPlayerName());
    }

    getPlayerName(): string {
        return GetPlayerName(this.wcPlayer);
    }

    sendMessage(message: string): void {
        DisplayTimedTextToPlayer(this.wcPlayer, 0, 0, 10, message);
    }

    setGold(amount: number): void {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, amount);
    }

    setLumber(amount: number): void {
        SetPlayerStateBJ(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, amount);
    }

    setHandicap(percentage: number): void {
        SetPlayerHandicapBJ(this.wcPlayer, percentage);
    }

    giveLumber(amount: number): void {
        AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER);
    }

    giveGold(amount: number): void {
        AdjustPlayerStateBJ(amount, this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD);
    }

    getGold(): number {
        return GetPlayerState(this.wcPlayer, PLAYER_STATE_RESOURCE_GOLD);
    }

    getLumber(): number {
        return GetPlayerState(this.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER);
    }

    defeatPlayer(): void {
        CustomDefeatBJ(this.wcPlayer, 'Defeat!');
    }

}
