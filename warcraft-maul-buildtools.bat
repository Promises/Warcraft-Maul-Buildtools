@echo off

echo Starting build
set toolsdir=%cd%\\BuildFiles
set mapfilesdir=%cd%\\mapfiles

echo Creating temp map...
md temp
copy "BuildFiles\\base.w3x" "temp\\out.w3x"
set tempdir=%cd%\\temp

echo Adding files to map...
%toolsdir%\\MPQEditor.exe add %tempdir%\\out.w3x %mapfilesdir%\\* /c /auto /r
set jasshelperdir=%toolsdir%\\JassHelper
set common=%jasshelperdir%\\common.j
set blizzard=%jasshelperdir%\\Blizzard.j

echo Compiling jass...
%toolsdir%\\JassHelper\\clijasshelper.exe %common% %blizzard% %tempdir%\\out.w3x

echo Adding patched jass and rebuilding...
%toolsdir%\\MPQEditor.exe extract %tempdir%\\out.w3x war3map.j temp
%toolsdir%\\sed.exe -i "1s/^/\/\/! import \"scripts\/imports.j\"\n/" temp/war3map.j 

%toolsdir%\\Warcraft-Maul-Race-Parser mapfiles/Units/ units.json
python3 GenerateHybrid.py

echo Recompiling jass...
%toolsdir%\\JassHelper\\clijasshelper.exe %common% %blizzard% %tempdir%\\war3map.j %tempdir%\\out.w3x

echo Extracting from out.w3x...
%toolsdir%\\MPQEditor.exe extract %tempdir%\\out.w3x war3map.j temp

echo Cleaning up...
move temp\\out.w3x .
move temp\\war3map.j lastrig.j
rd /s /q temp
echo Done!