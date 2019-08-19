import { InitGame } from './init_game';
import { InitConfig } from './init_config';


ceres.addHook('config::after', () => InitConfig.run());

// const hostDetect: HostDetection = new HostDetection();
ceres.addHook('main::after', () => InitGame.run());

