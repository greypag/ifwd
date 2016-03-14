@echo off
echo Optimizing JPEG ^& PNG Images...
cd %~dp0..\images
set programPath=%~dp0
echo %programPath%


forfiles /s /m *.jpg /c "cmd /c @%programPath%jpegtran.exe -copy none -optimize -progressive -outfile @file @file"
forfiles /s /m *.png /c "cmd /c @%programPath%optipng.exe -o7 -strip all @file"

echo. & echo Process done!
pause