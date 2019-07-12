import { Tower } from '../../Specs/Tower';
import { GenericAutoAttackTower } from '../../Specs/GenericAutoAttackTower';
import { AttackActionTower } from '../../Specs/AttackActionTower';
import { Defender } from '../../../Players/Defender';
import { WarcraftMaul } from '../../../../WarcraftMaul';
import { SellActionTower } from '../../Specs/SellActionTower';

export class VoidFissure extends Tower implements GenericAutoAttackTower, AttackActionTower, SellActionTower {
    constructor(tower: unit, owner: Defender, game: WarcraftMaul) {
        super(tower, owner, game);
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() + 50);
    }
    public GenericAttack(): void {
        IssueImmediateOrderBJ(GetAttacker(), 'roar');
    }


    public SellAction(): void {
        this.owner.SetVoidFragmentTick(this.owner.GetVoidFragmentTick() - 50);

    }
    public AttackAction(): void {h02S
        const u: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventSource;
        const target: unit | undefined = this.game.gameDamageEngineGlobals.udg_DamageEventTarget;

        if (u === this.tower && target) {
            const rndSpell: number = Util.RandomInt(1, 4);
            const x: number = GetUnitX(this.tower);
            const y: number = GetUnitY(this.tower);
            const dummy: unit = CreateUnit(this.owner.wcPlayer, FourCC('u008'), x, y, bj_UNIT_FACING);
            UnitApplyTimedLifeBJ(3.00, FourCC('BTLF'), dummy);
            switch (rndSpell) {
                case 1:
                    UnitAddAbilityBJ(FourCC('A09I'), dummy);
                    IssuePointOrder(dummy, 'blizzard', x, y);
                    break;
                case 2:
                    UnitAddAbilityBJ(FourCC('A09N'), dummy);
                    IssuePointOrder(dummy, 'flamestrike', x, y);
                    break;
                case 3:
                    UnitAddAbilityBJ(FourCC('A09K'), dummy);
                    IssuePointOrder(dummy, 'monsoon', x, y);
                    break;
                case 4:
                    UnitAddAbilityBJ(FourCC('A09J'), dummy);
                    IssuePointOrder(dummy, 'rainoffire', x, y);
                    break;
            }


        }
    }

}
