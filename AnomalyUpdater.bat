@ECHO OFF
SETLOCAL EnableDelayedExpansion
color 9
SET $Echo=FOR %%I IN (1 2) DO IF %%I==2 (SETLOCAL EnableDelayedExpansion ^& FOR %%A IN (^^^!Text:""^^^^^=^^^^^"^^^!) DO ENDLOCAL ^& ENDLOCAL ^& ECHO %%~A) ELSE SETLOCAL DisableDelayedExpansion ^& SET Text=

SETLOCAL DisableDelayedExpansion

                     
%$Echo% "   _____  _   _  _____         _____  _   _     _     _   _  ___    ___    _____  _____  ___    ___      "
%$Echo% "  (  _  )( ) ( )(  _  )/'\_/`\(  _  )( ) ( )   ( )   ( ) ( )(  _`\ (  _`\ (  _  )(_   _)(  _`\ |  _`\    "
%$Echo% "  | (_) || `\| || ( ) ||     || (_) || | `\`\_/'/'   | | | || |_) )| | ) || (_) |  | |  | (_(_)| (_) )   "
%$Echo% "  |  _  || , ` || | | || (_) ||  _  || |  _`\ /'     | | | || ,__/'| | | )|  _  |  | |  |  _)_ | ,  /    "
%$Echo% "  | | | || |`\ || (_) || | | || | | || |_( )| |      | (_) || |    | |_) || | | |  | |  | (_( )| |\ \    "         
%$Echo% "  (_) (_)(_) (_)(_____)(_) (_)(_) (_)(____/'(_)      (_____)(_)    (____/'(_) (_)  (_)  (____/'(_) (_)   "                 

echo.
echo.
color C
echo [*] Downloading Latest Update . . .
cd "%~dp0"
powershell (New-Object System.Net.WebClient).Downloadfile('https://github.com/OpenBulletAnomaly/OpenBullet-Anomaly/releases/download/1.4.5/OpenBullet-v1.4.5.zip', 'OpenBullet-v1.4.5.zip') 
color 3
echo [*] Extracting Files
color 4
echo [*] Downloading 7zip to decompress file
powershell -Command "$7zip = New-Object System.Net.WebClient; $7zip.DownloadFile('https://github.com/OpenBulletAnomaly/OpenBullet-Anomaly/raw/main/7zip/7za.exe', '7za.exe')"
color B
echo [*] Unpacking with 7zip
7za.exe x -y -o"OpenBullet-v1.4.5" "OpenBullet-v1.4.5.zip" >NUL
color 6
echo [*] Cleaning Up Temp Files !
powershell Remove-Item -Path "OpenBullet-v1.4.5.zip" -Force
powershell Remove-Item -Path "7za.exe" -Force
color A
echo [*] Successfully Updated ! You may Now Run The Program.
ENDLOCAL
PAUSE
ENDLOCAL & EXIT /B

