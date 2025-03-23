@echo off
:: Emelt szintű jogok kérése
:: Ha nem rendszergazdai módban fut, újraindítja magát admin jogokkal
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Ujrainditas rendszergazdakent...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit
)

:: Set the path to the executable
set "exePath=C:\Windows\System32\mapper.exe"
set "driver1=spoof.sys"
set "data=.data"

:: Change to the directory where the executable is located
cd /d "C:\Windows\System32\"

:: Leállítja a winmgmt szolgáltatást megerősítés nélkül
sc stop winmgmt >nul 2>&1

:: Run the command with the specified parameters
"%exePath%" %driver1% %data%

:: Elindítja újra a winmgmt szolgáltatást megerősítés nélkül
sc start winmgmt >nul 2>&1

:: Check the error level to determine if the command was successful
if %errorlevel% equ 0 (
    echo Setup successfully.
) else (
    echo Command failed setup with error code %errorlevel%.
)



