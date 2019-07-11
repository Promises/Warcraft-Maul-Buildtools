import { Tower } from '../Specs/Tower';
import { KillingActionTower } from '../Specs/KillingActionTower';

export class SeaGiant extends Tower implements KillingActionTower {


    public KillingAction(): void {
        const u: unit | undefined = GetKillingUnitBJ();
        const target: unit | undefined = GetDyingUnit();

        if (u === this.tower && target) {


            const x: number = GetUnitX(target);
            const y: number = GetUnitY(target);
            const rand: number = Util.RandomInt(0, 359);
            const dummyOne: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 10 * CosBJ(rand + 45), y + 10 * SinBJ(rand + 45), 0);
            const dummyTwo: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 10 * CosBJ(rand + 135), y + 10 * SinBJ(rand + 135), 0);
            const dummyThree: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 10 * CosBJ(rand + 225), y + 10 * SinBJ(rand + 225), 0);
            const dummyFour: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x + 10 * CosBJ(rand + 315), y + 10 * SinBJ(rand + 315), 0);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummyOne);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummyTwo);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummyThree);
            UnitApplyTimedLifeBJ(1.00, FourCC('BTLF'), dummyFour);
            UnitAddAbilityBJ(FourCC('A03T'), dummyOne);
            UnitAddAbilityBJ(FourCC('A03T'), dummyTwo);
            UnitAddAbilityBJ(FourCC('A03T'), dummyThree);
            UnitAddAbilityBJ(FourCC('A03T'), dummyFour);
            IssuePointOrder(dummyOne, 'carrionswarm', x + 150 * CosBJ(rand + 45), y + 150 * SinBJ(rand + 45));
            IssuePointOrder(dummyTwo, 'carrionswarm', x + 150 * CosBJ(rand + 135), y + 150 * SinBJ(rand + 135));
            IssuePointOrder(dummyThree, 'carrionswarm', x + 150 * CosBJ(rand + 225), y + 150 * SinBJ(rand + 225));
            IssuePointOrder(dummyFour, 'carrionswarm', x + 150 * CosBJ(rand + 315), y + 150 * SinBJ(rand + 315));


        }

    }


}
