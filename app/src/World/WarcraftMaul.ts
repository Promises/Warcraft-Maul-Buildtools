import {Defender} from "./Entity/Players/Defender";
import {enemies, InitializeStaticSounds, players} from "./GlobalSettings";
import {Attacker} from "./Entity/Players/Attacker";
import {WorldMap} from "./WorldMap"
import {SpawnedCreeps} from "./Entity/SpawnedCreeps";
import { Commands } from './Game/Commands';
import { GameRound } from './Game/GameRound';

export class WarcraftMaul {

    debugMode: boolean = false;

    waveTimer: number = 90;

    stringtest: string;
    worldMap: WorldMap;


    gameTime: number = 0;
    gameEnded: boolean = false;
    gameEndTimer: number = 600;

    constructor() {
        this.stringtest = `Hello player ${GetPlayerName(Player(0))}`;


        // Should we enable debug mode?
        if (GetPlayerName(Player(0)) === "WorldEdit") {
            this.debugMode = true;
        }
        if(this.debugMode) {
            this.waveTimer = 4;
        }

        // Set up all players
        for (let i = 0; i < 24; i++) {
            if (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING) {
                if (GetPlayerController(Player(i)) == MAP_CONTROL_USER) {
                    players.set(i, new Defender(i));
                }
            }
        }

        // Set up enemies
        enemies.push(new Attacker(COLOUR.NAVY));
        enemies.push(new Attacker(COLOUR.TURQUOISE));
        enemies.push(new Attacker(COLOUR.VOILET));
        enemies.push(new Attacker(COLOUR.WHEAT));

        // Set Enemies should be allied with eachother

        for(let enemy of enemies){
            for (let enemyAlly of enemies) {
                enemy.makeAlliance(enemyAlly);
            }
        }

        //Initialise sounds
        InitializeStaticSounds();

        // Create the map
        this.worldMap = new WorldMap(this);
        let cmds = new Commands(this);
        cmds.OpenAllSpawns();



        new GameRound(this);

        // Spawn testing units when in debug mode
        if(this.debugMode) {
            CreateUnit(Player(COLOUR.RED), FourCC('e00B'), 0.00, 0.00, bj_UNIT_FACING);
            CreateUnit(Player(COLOUR.RED), FourCC('hC07'), 0.00, 0.00, bj_UNIT_FACING);
        }



    }

    DefeatAllPlayers(){
        for (let player of players.values()){
            player.defeatPlayer();
        }
    }





}
