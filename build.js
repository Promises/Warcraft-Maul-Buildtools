const fs = require('fs-extra');
const jassToTs = require('./node_modules/convertjasstots/dist/jassParser');
const CommandLineParser = require('./node_modules/typescript-to-lua/dist/CommandLineParser');
const typescriptToLua = require('typescript-to-lua');
const ts = require("typescript");
const {execSync} = require('child_process');
let reportDiagnostic = typescriptToLua.createDiagnosticReporter(true);

class Build {
    constructor(args) {
        for (const arg of args) {
            console.log(arg);
        }
        this.os = process.platform;
        this.doTasks(args)

    }
    async doTasks(args){
        if (args.indexOf('build') >= 0) {
            await this.build()
        }
        if (args.indexOf('test') >= 0) {
            this.test()
        }
        if (args.indexOf('run') >= 0) {
            this.run()
        }
    }

    env() {
        const dir = './config';

        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
        }
        if (!fs.existsSync(`${dir}/warcraft.json`)) {
            console.log('missing file');
            fs.writeFileSync(`${dir}/warcraft.json`, JSON.stringify({
                path: '',
            }))
        }
        this.settings = JSON.parse(fs.readFileSync(`${dir}/warcraft.json`));
        if (!this.settings.path.length > 0) {
            console.error('Path to wc3 is not setup, please set it in ./config/warcraft.json');
            process.exit(1)
        }

    }

    async build() {
        this.cleanup();
        this.generateWCM();

        var map = 'map.w3x';
        fs.mkdirSync('target');

        fs.copySync(`maps/${map}`, `target/${map}`);

        let sharedArgs = `extract "target/${map}" "war3map.lua" "maps/map"`;
        let mpqEditor = '';
        if (this.os === "win32") {
            mpqEditor = "tools/MPQEditor/x64/MPQEditor.exe";
        } else {
            mpqEditor = "WINEDEBUG=-all wine64 tools/MPQEditor/x64/MPQEditor.exe";
        }

        execSync(`${mpqEditor} ${sharedArgs}`, (err, stdout, stderr) => {
            if (err) {
                throw err;
            }
            console.log('Extracted map files')

        });
        const parser = new jassToTs.JassParser();
        await parser.main(['', '', "app/src/lib/core/blizzard.j", "app/src/lib/core/blizzard.d.ts"]);
        await parser.main(['', '', "app/src/lib/core/common.j", "app/src/lib/core/common.d.ts"]);

        const commandLine = typescriptToLua.parseCommandLine(['-p', 'tsconfig.json']);

        const commandLineOptions = commandLine.options;

        // const configParseResult = CommandLineParser.parseConfigFileWithSystem('tsconfig.json', commandLineOptions);
        // this.performCompilation(configParseResult.fileNames, configParseResult.projectReferences, configParseResult.options, ts.getConfigFileParsingDiagnostics(configParseResult));

        const {emitResult, diagnostics} = typescriptToLua.transpileProject('tsconfig.json');
        console.log(diagnostics);

        // emitResult.forEach(({ name, text }) => ts.sys.writeFile(name, text));
        // fs.copySync(`src/app/src/main.lua`, `src/main.lua`);
        //
        // sharedArgs = `build "map"`;
        // let ceres = '';
        // switch (this.os) {
        //     case "win32":
        //         ceres = "tools/ceres/ceres.exe";
        //         break;
        //     case "darwin":
        //         ceres = "tools/ceres/ceres";
        //         break;
        //     default:
        //         ceres = "tools/ceres/ceres-linux";
        //         break;
        // }
        //
        // execSync(`${ceres} ${sharedArgs}`, (err, stdout, stderr) => {
        //     if (err) {
        //         throw err;
        //     }
        //     console.log('Extracted map files')
        //
        // });
        // sharedArgs = `add "target/map.w3x" "target/map/*" "/c" "/auto" "/r"`;
        //
        // execSync(`${mpqEditor} ${sharedArgs}`, (err, stdout, stderr) => {
        //     if (err) {
        //         throw err;
        //     }
        //     console.log('Extracted map files')
        //
        // });
    }

    test() {

    }

    run() {
        this.env();
        let suffix = '';
        switch (this.os) {
            case "linux":
                suffix = "WINEDEBUG=-all wine64 ";
                break;
            default:
                suffix = "";
                break;
        }
        let sharedArgs = `-loadfile `;
        let currentDir = String(__dirname);
        currentDir = String(currentDir).replace('/', '\\');

        sharedArgs += '"Z:' + currentDir + '\\target\\map.w3x"';

        execSync(`${suffix}"${this.settings.path}" ${sharedArgs}`, (err, stdout, stderr) => {
            if (err) {
                throw err;
            }
            console.log('Extracted map files')

        });
    }

    cleanup() {
        if (fs.existsSync(`./src`)) {
            fs.removeSync('./src');
        }
        if (fs.existsSync(`./target`)) {
            fs.removeSync('./target');
        }
    }

    generateWCM() {
        const file = 'GenerateHybrid.py';
        switch (this.os) {
            case "win32":
                execSync(`py -3 ${file}`, (err, stdout, stderr) => {
                    if (err) {
                        throw err;
                    }
                    console.log('Generated warcraftmaul configs')

                });
                break;
            default:
                execSync(`python3 ${file}`, (err, stdout, stderr) => {
                    if (err) {
                        throw err;
                    }
                    console.log('Generated warcraftmaul configs')
                });
                break;
        }
    }

    performCompilation(rootNames, projectReferences, options, configFileParsingDiagnostics) {
        const program = ts.createProgram({
            rootNames,
            options,
            projectReferences,
            configFileParsingDiagnostics,
        });
        const {transpiledFiles, diagnostics: transpileDiagnostics} = typescriptToLua.transpile({program});
        const diagnostics = ts.sortAndDeduplicateDiagnostics([
            ...ts.getPreEmitDiagnostics(program),
            ...transpileDiagnostics,
        ]);

        const emitResult = typescriptToLua.emitTranspiledFiles(options, transpiledFiles);
        emitResult.forEach(({name, text}) => ts.sys.writeFile(name, text));
        diagnostics.forEach(reportDiagnostic);
        const exitCode = diagnostics.length === 0
            ? ts.ExitStatus.Success
            : transpiledFiles.length === 0
                ? ts.ExitStatus.DiagnosticsPresent_OutputsSkipped
                : ts.ExitStatus.DiagnosticsPresent_OutputsGenerated;
        return exitCode;
    }
}

new Build(process.argv);
