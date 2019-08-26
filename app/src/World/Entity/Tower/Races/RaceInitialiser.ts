import { TowerMap } from '../Specs/TowerMap';
import { AllianceOfBladesTowers } from './AllianceOfBlades/AllianceOfBladesTowers';
import { ArachnidTowers } from './Arachnid/ArachnidTowers';
import { AviariesTowers } from './Aviaries/AviariesTowers';
import { CavernousCreaturesTowers } from './CavernousCreatures/CavernousCreaturesTowers';
import { CorruptedNightElfTowers } from './CorruptedNightElves/CorruptedNightElfTowers';
import { DemonTowers } from './Demon/DemonTowers';
import { DraeneiTowers } from './Draenei/DraeneiTowers';
import { DwarfTowers } from './Dwaven/DwarfTowers';
import { ElementalistTowers } from './Elementalist/ElementalistTowers';
import { ForestTrollTowers } from './ForestTrolls/ForestTrollTowers';
import { ForsakenTowers } from './Forsaken/ForsakenTowers';
import { GalaxyTowers } from './Galaxy/GalaxyTowers';
import { GiantsTowers } from './Giants/GiantsTowers';
import { GoblinTowers } from './Goblin/GoblinTowers';
import { HighElvenTowers } from './HighElven/HighElvenTowers';
import { HumanTowers } from './Human/HumanTowers';
import { IceTrollTowers } from './IceTrolls/IceTrollTowers';
import { NightElfTowers } from './NightElf/NightElfTowers';
import { OrcStrongholdTowers } from './OrcStronghold/OrcStrongholdTowers';
import { OutlandTowers } from './Outland/OutlandTowers';
import { ShrineOfBuffsTowers } from './ShrineOfBuffs/ShrineOfBuffsTowers';
import { SummonsTowers } from './Summons/SummonsTowers';
import { TavernTowers } from './Tavern/TavernTowers';
import { UndeadTowers } from './Undead/UndeadTowers';
import { UniqueTowers } from './Unique/UniqueTowers';
import { VoidTowers } from './Void/VoidTowers';
import { WorkersUnionTowers } from './WorkersUnion/WorkersUnionTowers';
import { AntiJuggleTower } from '../../AntiJuggle/AntiJuggleTower';
import { RaceTowers } from './RaceTowers';

export function InitialiseAllRaceTowers(): TowerMap<number, object> {
    const _towerTypes: TowerMap<number, object> = new TowerMap<number, object>();
    const races: RaceTowers[] = [];

    races.push(new AllianceOfBladesTowers());
    races.push(new ArachnidTowers());
    races.push(new AviariesTowers());
    races.push(new CavernousCreaturesTowers());
    races.push(new CorruptedNightElfTowers());
    races.push(new DemonTowers());
    races.push(new DraeneiTowers());
    races.push(new DwarfTowers());
    races.push(new ElementalistTowers());
    races.push(new ForestTrollTowers());
    races.push(new ForsakenTowers());
    races.push(new GalaxyTowers());
    races.push(new GiantsTowers());
    races.push(new GoblinTowers());
    races.push(new HighElvenTowers());
    races.push(new HumanTowers());
    races.push(new IceTrollTowers());
    races.push(new NightElfTowers());
    races.push(new OrcStrongholdTowers());
    races.push(new OutlandTowers());
    races.push(new ShrineOfBuffsTowers());
    races.push(new SummonsTowers());
    races.push(new TavernTowers());
    races.push(new UndeadTowers());
    races.push(new UniqueTowers());
    races.push(new VoidTowers());
    races.push(new WorkersUnionTowers());

    races.forEach(race => race.AddTowersToList(_towerTypes));


    _towerTypes.add(FourCC('uC14'), AntiJuggleTower);
    return _towerTypes;
}
