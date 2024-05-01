@echo off
setlocal EnableDelayedExpansion

REM -- Set the path to your text file at the top of the script
set "path=C:\temp\computers.txt"

REM -- Function to get the list of computers in the network
for /f "tokens=2 delims==" %%a in ('wmic computersystem get name /value') do (
    if "%%a" neq "%computername%" (
        echo %%a >> %path%
    )
)

REM -- Function to shut down the computers
for /f "delims=" %%a in (%path%) do (
    echo Shutting down %%a
    shutdown /s /m \\%%a
)

REM -- Clean up
del %path%

endlocal
