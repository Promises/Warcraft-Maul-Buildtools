const WCJsonToSLK = require("wc3-json-to-slk/dist/WCJsonToSLK");

const fse = require('fs-extra');
const jassToTs = require('./node_modules/convertjasstots/dist/jassParser');
const typescriptToLua = require('typescript-to-lua');
const ts = require("typescript");
const {execSync} = require('child_process');
const minimist = require('minimist');
let reportDiagnostic = typescriptToLua.createDiagnosticReporter(true);
const objectHandler = require("wc3-objectified-handler");


const helptext = `
Usage: build.js [options]
    options:
        -b, --build             Build the project
        -r, --run               Run the map in Warcraft 3
        -t, --test              Run the tests in busted (currently not implemented)
        --buildnumber <number>  Set the ingame buildnumber for the map
        --release <num.num.num> Set The full release version
        -h, --help              Shows this help menu
`;
class Build {

    constructor(args) {
        // console.log(args);
        this.os = process.platform;
        if (args['help'] || args['h']) {
            console.log(helptext);
            process.exit(1)
        }
        if (args['buildnumber']) {
            this.buildnumber = args['buildnumber'];
        } else {
            this.buildnumber = '';
        }

        if (args['release']) {
            this.isFull = true;
            this.release = args['release'];
        } else {
            this.isFull = false;
        }
        // console.log(this.buildnumber);
        this.doTasks(args)

    }

    async doTasks(args) {
        if (args['build'] || args['b']) {
            await this.build()
        }
        if (args['test'] || args['t']) {
            this.test()
        }
        if (args['run'] || args['r']) {
            this.run()
        }
    }

    env() {
        const dir = './config';

        if (!fse.existsSync(dir)) {
            fse.mkdirSync(dir);
        }
        if (!fse.existsSync(`${dir}/warcraft.json`)) {
            console.log('missing file');
            fse.writeFileSync(`${dir}/warcraft.json`, JSON.stringify({
                path: '',
            }))
        }
        this.settings = JSON.parse(fse.readFileSync(`${dir}/warcraft.json`));
        if (!this.settings.path.length > 0) {
            console.error('Path to wc3 is not setup, please set it in ./config/warcraft.json');
            process.exit(1)
        }

    }

    nativeExecute(cmdline) {
        execSync(cmdline, (err, stdout, stderr) => {
            if (err) {
                throw err;
            }
            return false;

        });
        return true;
    }

    async build() {
        this.cleanup();

        var map = 'map.w3x';
        fse.mkdirSync('target');

        fse.copySync(`maps/${map}`, `target/${map}`);

        this.generateWCM();

        let sharedArgs = `extract "target/${map}" "war3map.lua" "maps/map"`;
        let mpqEditor = '';
        if (this.os === "win32") {
            mpqEditor = '"tools/MPQEditor/x64/MPQEditor.exe"';
        } else {
            mpqEditor = "WINEDEBUG=-all wine64 tools/MPQEditor/x64/MPQEditor.exe";
        }

        this.nativeExecute(`${mpqEditor} ${sharedArgs}`);
        // const parser = new jassToTs.JassParser();
        // await parser.main(['', '', "app/src/lib/core/blizzard.j", "app/src/lib/core/blizzard.d.ts"]);
        // await parser.main(['', '', "app/src/lib/core/common.j", "app/src/lib/core/common.d.ts"]);
        // await parser.main(['', '', "app/src/lib/core/common.ai", "app/src/lib/core/commonai.d.ts"]);

        // const commandLine = typescriptToLua.parseCommandLine(['-p', 'tsconfig.json']);

        // const commandLineOptions = commandLine.options;

        // const configParseResult = CommandLineParser.parseConfigFileWithSystem('tsconfig.json', commandLineOptions);
        // this.performCompilation(configParseResult.fileNames, configParseResult.projectReferences, configParseResult.options, ts.getConfigFileParsingDiagnostics(configParseResult));

        const {emitResult, diagnostics} = typescriptToLua.transpileProject('tsconfig.json');
        for (let diag of diagnostics) {
            console.log(diag.messageText);
            if (diag.code != 2306) {
                console.error('FATAL ERROR IN TYPESCRIPT');
                console.error(diag);
                // console.log(diag);
                throw diag;

            }

        }

        emitResult.forEach(({name, text}) => ts.sys.writeFile(name, text));
        fse.copySync(`src/app/src/main.lua`, `src/main.lua`);
        fse.copySync(`tools/extras/app`, `src/app`);

        sharedArgs = `build -- --map map --output dir`;
        let ceres = '';
        switch (this.os) {
            case "win32":
                ceres = '"tools/ceres/ceres.exe"';
                break;
            case "darwin":
                ceres = "tools/ceres/ceres";
                break;
            default:
                ceres = "tools/ceres/ceres-linux";
                break;
        }
        //
        this.nativeExecute(`${ceres} ${sharedArgs}`);
        let sed = '';

        switch (this.os) {
            case "win32":
                sed = '"tools/sed.exe"';
                break;
            default:
                sed = "LC_ALL=C sed";
                break;
        }

        this.nativeExecute(`${sed} -i "s/local function __module_/function __module_/g" "target/map.dir/war3map.lua"`);

        if(this.buildnumber && !this.isFull){
            this.nativeExecute(`${sed} -i "s/TestMap WCMaul Reimagined/TestMap ${this.buildnumber} WCMaul Reimagined/g" "target/map.dir/war3map.wts"`);
        } else if (this.isFull) {
            this.nativeExecute(`${sed} -i "s/TestMap WCMaul Reimagined/Warcraft Maul: Reimagined v${this.release}/g" "target/map.dir/war3map.wts"`);

        }


        sharedArgs = `add "target/map.w3x" "target/map.dir/*" "/c" "/auto" "/r"`;
        //
        this.nativeExecute(`${mpqEditor} ${sharedArgs}`);
    }

    test() {

    }

    run() {
        this.env();
        let suffix = '';
        let sharedArgs = `-windowmode windowed -nowfpause -loadfile `;
        let currentDir = String(__dirname);
        switch (this.os) {
            case "linux":
                suffix = "WINEDEBUG=-all wine64 ";
                currentDir = String(currentDir).replace('/', '\\');
                sharedArgs += '"Z:' + currentDir + '\\target\\map.w3x"';
                break;
            case "win32":
                sharedArgs += currentDir + '\\target\\map.w3x"';
                break;
            case "darwin":
                sharedArgs += currentDir + '/target/map.w3x';
                break;
            default:
                suffix = "";
                break;
        }


        console.log(`${suffix}"${this.settings.path}" ${sharedArgs}`);
        this.nativeExecute(`${suffix}"${this.settings.path}" ${sharedArgs}`);
    }

    cleanup() {
        if (fse.existsSync(`./src`)) {
            fse.removeSync('./src');
        }
        if (fse.existsSync(`./target`)) {
            fse.removeSync('./target');
        }
    }

    generateWCM() {
        const objHandler = new objectHandler.WC3ObjectHandler();
        const file = 'GenerateHybrid.py';
        new WCJsonToSLK.WCJsonToSLK('Data/Units/Units.json', 'maps/map/Units', objHandler);
        switch (this.os) {
            case "win32":
                this.nativeExecute(`"tools/Warcraft-Maul-Race-Parser.exe" maps/map/Units units.json`);
                this.nativeExecute(`py -3 ${file} ${this.buildnumber}`);
                break;
            default:
                this.nativeExecute(`Warcraft-Maul-Race-Parser maps/map/Units units.json`);
                this.nativeExecute(`python3 ${file} ${this.buildnumber}`);
                break;
        }
    }


}

new Build(minimist(process.argv));
