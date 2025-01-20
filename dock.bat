@echo off
setlocal enabledelayedexpansion

rem Set the path to Vina executable
set VINA_PATH="C:\Program Files (x86)\The Scripps Research Institute\Vina\vina.exe" 
set RECEPTOR="protein.pdbqt"
set CENTER_X=  
set CENTER_Y=
set CENTER_Z=
set SIZE_X=
set SIZE_Y=
set SIZE_Z=

rem Loop through all PDBQT files in the current directory
for %%f in (*.pdbqt) do (
    set LIGAND=%%f
    set OUTPUT=%%~nf_output.pdbqt
    set LOG=%%~nf_log.txt

    echo Docking !LIGAND!...
    %VINA_PATH% --receptor %RECEPTOR% --ligand !LIGAND! --out !OUTPUT! --log !LOG! --center_x %CENTER_X% --center_y %CENTER_Y% --center_z %CENTER_Z% --size_x %SIZE_X% --size_y %SIZE_Y% --size_z %SIZE_Z%
)

echo Docking completed!
pause