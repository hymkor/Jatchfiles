@echo off
set "TARGET=%1"
if "%TARGET%" == "" (
    echo If they are same files, make them hardlinked-files.
    echo    %0 TARGETDIR SOURCEFILEs...
    exit /b
)

:loop
    shift
    if "%1" == "" exit /b
    for %%I in (%1) do fc /b "%%~I" "%TARGET%\%%~nxI" 1> nul 2>&1 && move "%TARGET%\%%~nxI" "%TARGET%\%%~nxI~" && mklink /H "%TARGET%\%%~nxI" "%%~I"
goto loop
