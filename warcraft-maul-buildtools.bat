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

echo Cleaning up...
move temp\\out.w3x .
rd /s temp
echo Done!