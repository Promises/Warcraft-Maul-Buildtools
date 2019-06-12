call Windows-Build.bat

if %ERRORLEVEL% GEQ 1 EXIT /B 1

"C:\Stuff\Games\Warcraft III\x86_64\Warcraft III.exe" -loadfile "%cd%\\out.w3x"

"C:\Program Files (x86)\Warcraft III\x86_64\Warcraft III.exe" -loadfile "%cd%\\out.w3x"
