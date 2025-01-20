@echo off
setlocal enabledelayedexpansion

rem Create or clear the output CSV file
echo Filename,Mode,Affinity > output.csv

rem Loop through all .txt files in the directory
for %%f in (*.txt) do (
    set "affinity="
    rem Search for the line containing mode 1 and extract the affinity
    for /f "tokens=1,2 delims= " %%a in ('findstr /R "^[ ]*1" "%%f"') do (
        set "affinity=%%b"
    )
    if defined affinity (
        echo %%f,1,!affinity! >> output.csv
    )
)

endlocal
