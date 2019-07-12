import { Tower } from '../../Specs/Tower';
import { TickingTower } from '../../Specs/TickingTower';

export class IronGolemStatue extends Tower implements TickingTower {
    public Action(): void {
        if (this.game.gameRoundHandler.isWaveInProgress) {

            const y: number = GetUnitY(this.tower);
            const x: number = GetUnitX(this.tower);
            const impalers: unit[] = [];

            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(135), y + 100 * SinBJ(135), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(225), y + 100 * SinBJ(225), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(315), y + 100 * SinBJ(315), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(45), y + 100 * SinBJ(45), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(0), y + 100 * SinBJ(0), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(90), y + 100 * SinBJ(90), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(180), y + 100 * SinBJ(180), 0));
            impalers.push(CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 100 * CosBJ(270), y + 100 * SinBJ(270), 0));

            impalers.forEach((impaler) => {
                UnitApplyTimedLifeBJ(1, FourCC('BTLF'), impaler);
                UnitAddAbilityBJ(FourCC('A030'), impaler);

            });
            IssuePointOrder(impalers[0], 'impale', x + 150 * CosBJ(45), y + 150 * SinBJ(45));
            IssuePointOrder(impalers[1], 'impale', x + 150 * CosBJ(135), y + 150 * SinBJ(135));
            IssuePointOrder(impalers[2], 'impale', x + 150 * CosBJ(225), y + 150 * SinBJ(225));
            IssuePointOrder(impalers[3], 'impale', x + 150 * CosBJ(315), y + 150 * SinBJ(315));
            IssuePointOrder(impalers[4], 'impale', x + 150 * CosBJ(0), y + 150 * SinBJ(0));
            IssuePointOrder(impalers[5], 'impale', x + 150 * CosBJ(90), y + 150 * SinBJ(90));
            IssuePointOrder(impalers[6], 'impale', x + 150 * CosBJ(180), y + 150 * SinBJ(180));
            IssuePointOrder(impalers[7], 'impale', x + 150 * CosBJ(270), y + 150 * SinBJ(270));
        }
    }

    public GetTickModulo(): number {
        return 49;
    }

}
