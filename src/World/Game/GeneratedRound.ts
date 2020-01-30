import { WarcraftMaul } from '../WarcraftMaul';

export class GeneratedRound {

    private readonly game: WarcraftMaul;
    private readonly wave: number;
    private readonly waveStrength: number;
    private mobCount: number = 20;
    private isAir: boolean = false;
    private isChampion: boolean = false;
    private moveSpeed: number = 0;
    private hpRegen: number = 0;
    private armor: number = 0;
    private armorType: number = 0; // 0 Unarmored, 1 Light, 2 Medium, 3 Heavy, 4 Fortified
    private hitPoints: number = 0;

    constructor(game: WarcraftMaul, wave: number, waveStrength: number) {
        this.game = game;
        this.wave = wave;
        this.waveStrength = waveStrength;
        this.GenerateWave();
    }

    private GenerateWave(): void {
        if (Util.RandomInt(1, 100) < 20) {
            this.isAir = true;
        } else {
            this.isAir = false;
        }
        if (!this.isAir) {
            if (Util.RandomInt(1, 100) > 20) {
                this.mobCount = 20;
                this.isChampion = false;
            } else {
                this.mobCount = 8;
                this.isChampion = true;
            }
        } else {
            this.mobCount = 20;
            this.isChampion = false;
        }
        if (!this.isAir) {
            if (this.wave < 10) {
                this.moveSpeed = Util.RandomInt(170, 215);
            } else {
                this.moveSpeed = Util.RandomInt(200, 330);
            }
        } else {
            if (this.wave < 10) {
                this.moveSpeed = Util.RandomInt(350, 400);
            } else {
                this.moveSpeed = Util.RandomInt(380, 500);
            }
        }
        this.hpRegen = Util.RandomInt(0, 3) * this.wave;
        this.armor = Math.ceil(this.wave / 10) * 3 + Util.RandomInt(0, 1);
        if (this.isChampion) {
            this.armor *= 2;
        }
        this.armorType = Util.RandomInt(0, 4);
        const damageReduction: number = (this.armor * 0.06) / (1 + this.armor * 0.06);
        this.hitPoints = (1 - damageReduction) * this.waveStrength / (this.moveSpeed * this.mobCount);
    }
}
