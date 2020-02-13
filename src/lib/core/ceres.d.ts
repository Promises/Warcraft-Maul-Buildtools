/** @noselfinfile */

/*
    A note about compiletime, runtime and macros:

    Ceres is able to execute arbitrary Lua code during the map compilation stage.
    This can be used to write source-injecting macros and modify object data of the
    currently compiling map, amongst other things.

    This is called compiletime.

    There are two ways to execute code at compiletime:
        * by putting it inside `build.lua`,
        * by using macros.

    Declarations that are only available during compiletime are marked @compiletime.
    Declarations that are macros are marked @macro.
    Declarations that are only available to the map itself when running inside WC3 are marked @runtime.
*/

declare namespace ceres {
    /**
     * Flag indicating whether Ceres has already been initialized,
     * i.e. whether the `main` function has been run.
     *
     * This is most useful for the detection of a live reload.
     * @runtime
     */
    const initialized: boolean;

    /**
     * Flag to indicate whether the currently executing code
     * is running at compiletime.
     *
     * This can be used in shared code to distinguish between
     * runtime and compiletime executions.
     * @compiletime
     */
    const compiletime: boolean;

    /**
     * Configuration used by Ceres to determine how to launch
     * WC3 when running Ceres via `ceres run`.
     * @compiletime
     */
    let runConfig: RunMapOptions;

    /**
     * Configuration used by Ceres to get info about the directory
     * layout of the project.
     * @compiletime
     */
    let layout: CeresLayout;

    /**
     * Adds a hook to run at a certain point in the map lifecycle.
     *
     * Currently only two hooks are supported:
     *      reload::after
     *      reload::before
     *
     * Which happen respectively before and after a map has been
     * live-reloaded.
     * @runtime
     */
    function addHook(name: 'reload::before' | 'reload::after', callback: () => void): void;

    /**
     * Simple alternative to `pcall`, will safely call the
     * provided function and print the error if any occured,
     * or return the function result if succeeded.
     * @runtime
     */
    function safeCall<Args extends any[], R>(f: (...args: Args) => R, ...args: Args): R;

    /**
     * Wraps the provided function in a `safeCall`, such that
     * when the returned function is called, any produced
     * errors will be handled by `safeCall`.
     * @runtime
     */
    function wrapSafeCall<C extends (...args: any[]) => any>(f: C): C;

    /**
     * Adds a hook to be called after the map script has been built by Ceres.
     *
     * `name` is used to distinguish between hooks when building maps multiple times.
     * @compiletime
     */
    function addPostScriptBuildHook(name: string, callback: (...args: any[]) => void): void;

    /**
     * Adds a hook to be called after the map has been built by Ceres.
     *
     * `name` is used to distinguish between hooks when building maps multiple times.
     * @compiletime
     */
    function addPostMapBuildHook(name: string, callback: (...args: any[]) => void): void;

    /**
     * Adds a hook to be called after the game has been launched by Ceres.
     *
     * `name` is used to distinguish between hooks when building maps multiple times.
     * @compiletime
     */
    function addPostRunHook(name: string, callback: (...args: any[]) => void): void;

    /**
     * Opens a WC3 map at the specified path.
     * Ceres will auto-detect whether the map is in directory format or MPQ format.
     *
     * If loading the map failed for whatever reason, will return `false` and an error message instead.
     * @compiletime
     * @tuplereturn
     */
    function openMap(name: string): WarMap | [false, string];

    /**
     * Compiles a script with the given parameters.
     *
     * Will try to locate "main", "init" and "config" modules as entry points.
     * @compiletime
     * @tuplereturn
     */
    function compileScript(options: CompileOptions): string | [false, string];

    /**
     * Builds a map with the given command.
     *
     * @compiletime
     */
    function buildMap(command: BuildCommand): BuildArtifact | false;

    /**
     * Launches WC3 with the map at the specified path, and
     * using @see ceres.runConfig for configuration.
     * @compiletime
     */
    function runMap(path: string): void;
}

declare namespace fs {
    /**
     * Reads the file at the specified path, returning its contents
     * as a string if successful, or false and an error if failed.
     * @compiletime
     * @tuplereturn
     */
    function readFile(path: string): string | [false, string];

    /**
     * Writes a file at the specified path and content,
     * returning nothing if successful, and false and an error if failed.
     * @compiletime
     * @tuplereturn
     */
    function writeFile(path: string, content: string): undefined | [false, string];

    /**
     * Copies a file from a source to another destiantion,
     * returning nothing if successful, and false and an error if failed.
     * @compiletime
     * @tuplereturn
     */
    function copyFile(from: string, to: string): undefined | [false, string];

    /**
     * Copies one directory into another, recursively. Returns true if successful,
     * false and an error otherwise.
     *
     * Specifically, contents in `from/` will appear at `to/`, e.g. a file like
     * `from/a/b/c.txt` will be copied to `to/a/b/c.txt`, if copying from `from` to `to`.
     *
     * @compiletime
     * @tuplereturn
     */
    function copyDir(from: string, to: string): true | [false, string];

    /**
     * Reads directories and files at the specified directory,
     * returning them as two arrays, first files, then directories if successful,
     * or false and an error if failed
     *
     * @compiletime
     * @tuplereturn
     */
    function readDir(path: string): [[string], [string]] | [false, string];

    /**
     * Tests if the specified path is a directory.
     *
     * @compiletime
     */
    function isDir(path: string): boolean;

    /**
     * Tests if the specified path is a file.
     *
     * @compiletime
     */
    function isFile(path: string): boolean;

    /**
     * Tests if anything exists at the specified path.
     *
     * @compiletime
     */
    function exists(path: string): boolean;

    /**
     * 'Absolutizes' a path, meaning that it takes a relative
     * path and transforms it into an absolute path, regardless
     * of whether or not this path actually exists.
     *
     * Returns false and an error if failed.
     *
     * @compiletime
     * @tuplereturn
     */
    function absolutize(path: string): string | [false, string];

    /**
     * 'Watches' a file for changes, calling the specified callback
     * each time a change occurs, with the new file contents as the argument.
     *
     * Will only exit if an error occurs.
     * @compiletime
     * @tuplereturn
     */
    function watchFile(path: string, callback: (data: string) => void): [false, string];
}

declare namespace mpq {
    /**
     * Creates a new MPQ builder.
     * @compiletime
     */
    function create(): MpqBuilder;

    /**
     * Opens an MPQ archive for reading,
     * returning false and an error if failed.
     * @compiletime
     * @tuplereturn
     */
    function open(path: string): MpqViewer | [false, string];
}

/**
 * A map build request.
 * Encapsulates possible parameters to ask of Ceres when building a map.
 */
interface BuildCommand {
    /**
     * Path to the map file. Can be omitted to make a script-only, mapless compilation.
     */
    input?: string;

    /**
     * Type of artifact to produce.
     */
    output: 'script' | 'mpq' | 'dir';

    /**
     * Whether to retain the original map script during building.
     */
    retainMapScript: boolean;
}

/**
 * A build artifact produced by a map compilation step.
 */
interface BuildArtifact {
    /**
     * Type of artifact produced.
     */
    type: 'script' | 'mpq' | 'dir';

    /**
     * Filesystem path to the produced artifact.
     */
    path: string;

    /**
     * If the produced artifact was a script, this will be its contents.
     */
    content?: string;
}

/**
 * A view into an MPQ archive.
 *
 * @compiletime
 */
declare interface MpqViewer {
    /**
     * Reads a file from this MPQ archive.
     *
     * Returns false and an error if failed.
     * @tuplereturn
     */
    readFile(path: string): string | [false, string];

    /**
     * Reads a list of all files from this MPQ archive.
     */
    files(): [string];

    /**
     * Extracts all the files in this archive to the specified path.
     *
     * Return false an an error if failed.
     * @tuplereturn
     */
    extractTo(path: string): true | [false, string];
}

/**
 * Possible options to specify when adding a file to an MPQ archive.
 */
declare interface MpqAddOptions {
    /**
     * Encrypts the file using MPQ encryption.
     *
     * Not actually useful, just a waste of CPU time.
     */
    encrypt: boolean;

    /**
     * Compresses the file. True by default.
     */
    compress: boolean;
}

/**
 * A builder of MPQ archives.
 *
 * @compiletime
 */
declare interface MpqBuilder {
    /**
     * Adds a file to the MPQ archive with the specified path and content.
     */
    add(path: string, content: string, options?: MpqAddOptions): void;

    /**
     * Adds a file to the MPQ archive from disk.
     *
     * Returns false and an error if reading the file failed.
     *
     * @tuplereturn
     */
    addFromFile(
        archivePath: string,
        diskPath: string,
        options?: MpqAddOptions,
    ): true | [false, string];

    /**
     * Adds the contents of the specified directory to the MPQ archive.
     *
     * Returns false and an error if reading the directory (or its files) failed.
     *
     * @tuplereturn
     */
    addFromDir(path: string, options?: MpqAddOptions): true | [false, string];

    /**
     * Adds the contents of another MPQ archive to this one.
     *
     * Returns false and an error if adding the contents failed.
     *
     * @tuplereturn
     */
    addFromMpq(other: MpqViewer, options?: MpqAddOptions): true | [false, string];

    /**
     * Builds and writes this archive to the specified path.
     *
     * Returns false and an error if writing failed.
     *
     * @tuplereturn
     */
    write(path: string): true | [false, string];
}

/**
 * Directory layout used by the default buildscript.
 *
 * @compiletime
 */
declare interface CeresLayout {
    /**
     * Where to find maps. This is used by the command line
     * to avoid having to type `--map maps/my.w3x` all the time.
     */
    mapsDirectory: string;

    /**
     * Directories to be tried, in order, by the module resolution
     * algorithm of Ceres when compiling the script.
     */
    srcDirectories: [string];

    /**
     * Where to put build artifacts.
     */
    targetDirectory: string;
}

/**
 * Options that are passed to @see ceres.runMap
 *
 * @compiletime
 */
declare interface RunMapOptions {
    /**
     * Command used to launch WC3.
     *
     * This can be anything so long as your system can properly execute this command.
     */
    command: string;

    /**
     * Workaround for Linux users. If you are launching WC3 via Wine, this parameter
     * can be used to prefix all map paths with it. This can turn a path like
     * `/path/to/map` into `Z:/path/to/map`.
     */
    prefix?: string;

    /**
     * Additional arguments to be passed to WC3. This can be anything. Multi-word arguments
     * should be separated.
     *
     * E.g: ["-windowmode", "windowed"] instead of ["-windowmode windowed"]
     */
    args?: string[];
}

/**
 * Options that are passed to @see ceres.compileScript
 */
declare interface CompileOptions {
    /**
     * Directories to look for modules in.
     *
     * Order determines priority.
     */
    srcDirectories: [string];

    /**
     * The map script, if any, to include in the compilation process.
     *
     * Will be included verbatim in the resulting lua file.
     */
    mapScript: string;
}

type objectType = 'unit' | 'item' | 'ability' | 'destructable' | 'doodad' | 'buff' | 'upgrade';
type objectExt = 'w3a' | 'w3t' | 'w3u' | 'w3b' | 'w3d' | 'w3h' | 'w3q';

/**
 * A WC3 object data entity. Represents anything from units to doodads.
 *
 * @compiletime
 */
declare interface WarObject {
    /** All fields available on this object */
    all: string[];

    /** This object's id as a string. */
    id: string;

    /** Parent's id as a string. */
    parentId: string;

    /** This object's type. */
    type: objectType;

    /**
     * Clones this object, creating an independent instance of it.
     *
     * This instance can then be assigned into a `WarObjects` object
     * to insert it into the map.
     */
    clone(): WarObject;

    /**
     * Fields of this object.
     *
     * Two syntaxes are accepted:
     * 1) SLK-like, where fields have a 'proper' name, sometimes postfixed with
     * a number to indicate which level of the field to get/set. Examples include,
     * `Name`, `DataA1`, `DataC10`, etc.
     * 2) Raw, using a four-character rawid, optionally with a `+X` postfix
     * to indicate which level to use, for fields which can have multiple levels.
     * E.g.: `unam`, `xxxx+1`, `xxxx+10`
     *
     * The gotten/setted value will be automatically converted to the appropriate type if possible.
     * WC3 has 4 fundamental types for fields:
     * real - standard float value
     * unreal - float value clamped between 0.0 and 1.0
     * int - standard signed integer value
     * string - null-terminated string
     *
     * Setting a field into null/undefined will reset it to its default value.
     *
     * Due to the limitations in TypeScript, this field does not have an appropriate type.
     */
    [id: string]: any;
}

/**
 * Encapsulates all WC3 objects of a particular type in a map.
 *
 * @compiletime
 */
declare interface WarObjects {
    /** All WC3 objects of this type in the map. Meant for iteration. */
    all: WarObjects[];

    /** Extension string for this WC3 object type. */
    ext: objectExt;

    /** Type string for this WC3 object type. */
    typestr: objectType;

    /**
     * Reads WC3 objects from the supplied string into this object.
     * The expected format is that of WC3 object data files, which is the same for all object data types.
     */
    readFromString(data: string): void;

    /**
     * Writes the WC3 objects contained in this object out into the string.
     * The resulting format is that of WC3 object data files, which is the same for all object data types.
     */
    writeToString(): string;

    /**
     * WC3 Objects inside this object.
     *
     * Index is a rawid. Upon getting an object, you get a
     * reference which you can use to mutate it.
     *
     * When setting an object, Ceres will clone the target
     * and set the clone's id to that specified here.
     *
     * For example:
     *
     * // getting a reference to an object
     * let myFoo = currentMap.objects.units['hfoo'] as WarObject
     * // this will mutate the 'hfoo' unit
     * myFoo['Name'] = "Crab"
     * // this will create a clone of the "Crab" 'hfoo' with the id 'xxxx'
     * currentMap.objects.units['xxxx'] = myFoo
     *
     * // this will get a clone instead, which won't modify the original object
     * let myPea = (currentMap.objects.units['hpea'] as WarObject).clone()
     * // this will only modify the clone now
     * myPea['Name'] = "Arnold"
     * currentMap.objects.units['yyyy'] = myPea
     *
     * Setting an object into null/undefined will reset it to defaults for a stock
     * object, and delete it for a custom object.
     *
     * Due to the limitations in TypeScript, this field does not have an appropriate type.
     * Cast into `WarObject` manually.
     */
    [id: string]: any;
}

/**
 * Encapsulates all objects of all types in a map.
 *
 * @compiletime
 */
declare interface WarMapObjects {
    ability: WarObjects;
    item: WarObjects;
    unit: WarObjects;
    destructable: WarObjects;
    doodad: WarObjects;
    buff: WarObjects;
    upgrade: WarObjects;
}

/**
 * Encapsulates a WC3 map during the compilation stage.
 *
 * @compiletime
 */
declare interface WarMap {
    /** Reference to all objects in this map. */
    objects: WarMapObjects;

    /**
     * Reads a file from the map. Returns the file contents as a
     * string upon success, or false + an error message upon failure.
     *
     * @tupleReturn
     */
    readFile(path: string): string | [false, string];

    /**
     * Adds a directory to the map, preserving the file hierarcy.
     * Note: the directory will only be written when writeToDir() or writeToMpq() has been called.
     */
    addDir(path: string): void;

    /**
     * Adds a file to the map with the specified content as a string.
     * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
     */
    addFileString(archivePath: string, contents: string): void;

    /**
     * Adds a file to the map, reading it from disk at the specified lcoation.
     * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
     */
    addFileDisk(archivePath: string, diskPath: string): void;

    /**
     * Writes the map and all manually added files to the specified directory.
     */
    writeToDir(path: string): void;

    /**
     * Writes the map and all manually added files to an MPQ archive at the specified path.
     */
    writeToMpq(path: string): void;

    /**
     * Initializes an object storage for the specified extension type.
     * This will read objects already present in the map if appropriate.
     */
    initObjectStorage(ext: objectExt): void;

    /**
     * Initializes all object storages in the map.
     */
    initObjects(): void;

    /**
     * Writes out all the object storages to their respective files in the map.
     */
    commitObjectStorage(objects: WarObjects): void;
}

/**
 * Last build command issued.
 * @compiletime
 */
declare const lastBuildCommand: BuildCommand;

/**
 * Currently compiling map, if any.
 * @compiletime
 */
declare const currentMap: WarMap | undefined;

/**
 * Logs the provided arguments to stderr.
 * @compiletime
 */
declare function log(...args: any[]): void;

/**
 * A macro function gets all its inputs evaluated at compiletime,
 * and returns either null or string.
 *
 * If it returned a string, its content will be
 * injected unmodified into the resulting map script.
 *
 * Keep in mind that the injected code will be interpreted
 * as Lua, not TypeScript.
 */
declare type MacroFunction = (...args: any[]) => string | null;

/**
 * If `arg` is a function, runs it, otherwise, evaluates `arg`
 * itself, at compiletime, and injects the computed result
 * into the source, formatted as a Lua value.
 *
 * Specifically:
 * * if the result is a table, it will format it as a table,
 * * if the result is a string, it will format it as a string,
 * * if the result is a number, it will format it as a number.
 *
 * If the result evaluated to nothing, then nothing is injected into the source.
 * @macro
 */
declare function compiletime<R extends string | number | object | null | undefined>(
    arg: R | (() => R),
): R;

/**
 * Reads the file at `path`, and if it exists, includes its contents
 * into the source, unmodified.
 *
 * Will cause a compilation error if the file could not be read.
 * @macro
 */
declare function include(path: string): string;

/**
 * Creates a new macro with the specified name and handler function.
 * @see MacroFunction for information about the handler.
 *
 * After the registration, any raw function call in the form of `name`()
 * will be interpreted as a macro call, and Ceres will call the
 * specified handler function.
 * @macro
 */
declare function macro_define(name: string, handler: MacroFunction): void;
