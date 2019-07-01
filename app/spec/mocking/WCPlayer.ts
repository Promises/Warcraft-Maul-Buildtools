/** @noSelfInFile **/

import { Sounds } from '../../src/World/GlobalSettings';

enum PlayerType {
    PLAYER,
    COMPUTER,
    NONE,
    NEUTRAL,
}

_G.PLAYER_SLOT_STATE_PLAYING = true;
_G.MAP_CONTROL_USER = PlayerType.PLAYER;

// tslint:disable-next-line:class-name
interface player {
    name: string;
    type: number;
    colour: number;
    gold: number;
    lumber: number;
    bounty: boolean;
}

interface alliance {
    playerA: player;
    playerB: player;
    state: number;
}

_G.bj_ALLIANCE_UNALLIED = 1;
_G.bj_ALLIANCE_ALLIED_VISION = 2;
let alliances: alliance[] = [];

_G.PLAYER_STATE_RESOURCE_GOLD = 'gold';
_G.PLAYER_STATE_RESOURCE_LUMBER = 'lumber';
_G.PLAYER_STATE_GIVES_BOUNTY = 'bounty';

_G.IngamePlayers = [
    {name: 'Red', type: PlayerType.PLAYER, colour: 0, gold: 0, lumber: 0, bounty: false},
    {name: 'Blue', type: PlayerType.PLAYER, colour: 1, gold: 0, lumber: 0, bounty: false},
    {name: 'Teal', type: PlayerType.PLAYER, colour: 2, gold: 0, lumber: 0, bounty: false},
    {name: 'Purple', type: PlayerType.PLAYER, colour: 3, gold: 0, lumber: 0, bounty: false},
    {name: 'Yellow', type: PlayerType.PLAYER, colour: 4, gold: 0, lumber: 0, bounty: false},
    {name: 'Orange', type: PlayerType.PLAYER, colour: 5, gold: 0, lumber: 0, bounty: false},
    {name: 'Pink', type: PlayerType.PLAYER, colour: 6, gold: 0, lumber: 0, bounty: false},
    {name: 'Green', type: PlayerType.PLAYER, colour: 7, gold: 0, lumber: 0, bounty: false},
    {name: 'Gray', type: PlayerType.PLAYER, colour: 8, gold: 0, lumber: 0, bounty: false},
    {name: 'Light Blue', type: PlayerType.PLAYER, colour: 9, gold: 0, lumber: 0, bounty: false},
    {name: 'Dark Green', type: PlayerType.PLAYER, colour: 10, gold: 0, lumber: 0, bounty: false},
    {name: 'Brown', type: PlayerType.PLAYER, colour: 11, gold: 0, lumber: 0, bounty: false},
    {name: 'Maroon', type: PlayerType.PLAYER, colour: 12, gold: 0, lumber: 0, bounty: false},
    {name: 'Forces of North', type: PlayerType.COMPUTER, colour: 13, gold: 0, lumber: 0, bounty: false},
    {name: 'Forces of North', type: PlayerType.COMPUTER, colour: 14, gold: 0, lumber: 0, bounty: false},
    {name: 'Forces of North', type: PlayerType.COMPUTER, colour: 15, gold: 0, lumber: 0, bounty: false},
    {name: 'Forces of North', type: PlayerType.COMPUTER, colour: 16, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 17, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 18, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 19, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 20, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 21, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 22, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NONE, colour: 23, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NEUTRAL, colour: 24, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NEUTRAL, colour: 25, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NEUTRAL, colour: 26, gold: 0, lumber: 0, bounty: false},
    {name: '', type: PlayerType.NEUTRAL, colour: 27, gold: 0, lumber: 0, bounty: false},

];
_G.PLAYER_NEUTRAL_PASSIVE = 24;
_G.Player = (colourId: number): player => {
    return _G.IngamePlayers[colourId + 1];
};

_G.SetPlayerStateBJ = function (whichPlayer: player, whichPlayerState: string, value: number): void {
    // @ts-ignore
    whichPlayer[whichPlayerState] = value;
    // @ts-ignore
};

_G.SetPlayerFlagBJ = function (whichPlayerFlag: playerstate, flag: boolean, whichPlayer: player): void {
    // @ts-ignore
    whichPlayer[whichPlayerFlag] = flag;
};


_G.GetPlayerSlotState = function (p: player): boolean {
    return p.name !== '';
};

_G.GetPlayerController = function (whichPlayer: player): PlayerType {
    return whichPlayer.type;
};

_G.GetPlayerName = function (p: player): string {
    return p.name;
};

_G.SetPlayerName = function (p: player, name: string): void {
    p.name = name;
};

_G.SetPlayerAllianceStateBJ = function (sourcePlayer: player, otherPlayer: player, allianceState: number): void {
    alliances.push({playerA: sourcePlayer, playerB: otherPlayer, state: allianceState});
};

_G.SetSoundParamsFromLabel = function (audio: sound, label: string): void {
    return;
};
_G.SetSoundDuration = function (audio: sound, duration: number): void {
    return;
};
_G.SetSoundChannel = function (audio: sound, channel: number): void {
    return;
};
_G.SetSoundDistances = function (audio: sound, minDist: number, maxDist: number): void {
    return;
};
