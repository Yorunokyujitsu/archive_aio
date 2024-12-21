@ECHO OFF
mode con: cols=101 lines=32
SETLOCAL ENABLEDELAYEDEXPANSION
chcp 949 >nul 2>&1
title ASAP Maker

COLOR 09
set wd=%temp%\sdfiles
set sd=%1

REM ============================================================
:TITLE
COLOR 09
cls
echo -----------------------------------------------------------------------------------------------------
echo =====================================================================================================
echo.
echo           .....                                    .....               .....
echo          .oXXXXOdc,.             cOOkdl:,..       ,0XXXKko;..         lKXXX0xc,.
echo          .xMMMMMMMWKko:'.      .oNMMMMMMWXKOxo:.  :XMMMMMMWX0dc,.     dWMMMMMMWXOd:'.
echo          .xMMMWXXWMMMMWN0xc.  .dNMMWXKNWMMMMMM0'  :XMMMNKNWMMMMWXOo;  dWMMWXXWMMMMMNKkl'
echo          .xMMMK:.;lx0NWMMMWo .dWMMMNx,',:ldk00l   :XMMWd.':oOXWMMMM0, dWMMXc.,cd0XWMMMMx.
echo          .xMMMK,    .'dNMMWd  ;kNMMMWOc.    ..    :XMMWo     .:KMMMK, dWMMX:     .oNMMMk.
echo          .xMMMK,      :XMMWd    ,xXMMMW0l.        :XMMWo      .kMMMK, dWMMX:      ,KMMMk.
echo          .xMMMK;      cNMMWd      'oKWMMWXd,      :XMMWd.     .OMMMK, dWMMXc      ;KMMMk.
echo          .xMMMWKOOOOOOKWMMWd        .l0WMMMNk;.   :XMMMX0OOOOO0NMMMK, dWMMWXOOOOOOKWMMMk.
echo          .xMMMMMMMMMMMMMMMWd  .,;'.   .:ONMMMNk.  :XMMMMMMMMMMMMMMMK, dWMMMMMMMMMMMMMMMk.
echo          .xMMMNOdddddd0WMMWd  lNWNK0kdl:oXMMMWx.  :XMMMKxdddddkXMMMK, dWMMW0ddddddddddd;
echo          .xMMMK,      :XMMWd .xNWMMMMMMMWMMMNo.   :XMMWo      .kMMMK, dWMMX:
echo          .xMMMK,      :XMMWo  .';coxOKNWMMMXl.    :XMMWo      .kMMM0, oWMMX;
echo           'clc;.      .:ccc.         ..,:lo;      .:clc.       'ccc;. .ccl:.
echo.
echo           Asa's Switch Aio Package / As Soon As Possible         
echo.
echo           - Commands -
echo.
echo            Download : 'DOWN' - Download Msys2.exe, python.exe
echo            Prepare  : 'KEYS' - Get the cypher key, keyring ^& prod.keys
echo                       'PREP' - Install extra.7z, DevkitPro ^& Pacman packages
echo            Build    : 'MAKE' - Build all repositories that make up ASAP ^& ASAP.exe
echo            Hiden    : 'SDMC', 'UPDATE', 'MIGRATE'	
echo.
echo =====================================================================================================
echo -----------------------------------------------------------------------------------------------------
echo.

set /p TITLE="     - Press enter the commands: "
if "%TITLE%"=="" GOTO NOTICE
if /i "%TITLE%"=="EXIT" exit
if /i "%TITLE%"=="DOWN" GOTO DOWN
if /i "%TITLE%"=="KEYS" GOTO KEYS
if /i "%TITLE%"=="PREP" GOTO PREP
if /i "%TITLE%"=="MAKE" GOTO MAKE

if /i "%TITLE%"=="SDMC" GOTO NOTICE
if /i "%TITLE%"=="UPDATE" GOTO UPDATE
if /i "%TITLE%"=="MIGRATE" GOTO MIGRATE

if /i "%TITLE%"=="AUTOUPDATE" GOTO AUTOUPDATE

pause>nul 2>&1

REM ============================================================
:NOTICE
COLOR 0C
cls
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                             - Notice - 
echo.
echo                              This batch file is for developers only.
echo.
echo.                                                                                         B = Title
echo -----------------------------------------------------------------------------------------------------
echo.

for /f "usebackq delims=" %%a in (`powershell -command "$ErrorActionPreference='Stop'; $sd = Get-WmiObject -Class Win32_Volume | Where-Object {$_.DriveType -eq 2}; foreach ($s in $sd) { '- Drive found: {0}' -f $s.DriveLetter; if ($s.Label) { '- Drive Name: {0}' -f $s.Label }; '- Format: {0}' -f $s.FileSystem; $size = [math]::Round($s.Capacity / 1GB, 2); if ($size -ge 1) { '- Volume: {0} GB' -f $size } else { '- Volume: {0} MB' -f ($s.Capacity / 1MB) }; '- Used: {0} GB' -f ([math]::Round(($s.Capacity - $s.FreeSpace) / 1GB, 2)); '- Empty: {0} GB' -f ([math]::Round($s.FreeSpace / 1GB, 2)) }"`) do (
    echo %%a
)

echo.

set /p "sd=     - Micro SD Card Drive letter: "

if not exist "%sd%:\" (
	set word=      No Micro SD Card: %sd%         
	GOTO NOTMATCHDRIVE
) else (
	if not exist "%sd%:\*" (
	  GOTO NOTMATCHDRIVE
	  )
)
if /i "%NOTICE%"=="B" GOTO TITLE

REM ============================================================
:BACKUP
COLOR 0A
cls
echo -----------------------------------------------------------------------------------------------------  
echo.
echo                        Backing up important files, please wait a moment...
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
powershell -Command "Start-Sleep -Seconds 3"

set "BackupFolder=%sd%:\backup"
set "AB=%BackupFolder%\"

if not exist "%AB%" (
    mkdir "%AB%" >nul 2>&1
)

set "folders=keys kips savedata tinfoil"

for %%i in (%folders%) do (
    if not exist "%AB%\%%i" (
        mkdir "%AB%\%%i" >nul 2>&1
    )
)

if exist "%sd%:\atmosphere\automatic_backups\*" (
xcopy /I /Y "%sd%:\atmosphere\automatic_backups\*" "%AB%\keys\automatic_backups\" >nul 2>&1
)
if exist "%sd%:\atmosphere\bluetooth_devices.db" (
xcopy /I /Y "%sd%:\atmosphere\bluetooth_devices.db" "%AB%\" >nul 2>&1
)
if exist "%sd%:\emuiibo" (
xcopy /H /Y /C /R /S /E /I "%sd%:\emuiibo" "%AB%\emuiibo" >nul 2>&1
)
if exist "%sd%:\SaltySD" (
xcopy /H /Y /C /R /S /E /I "%sd%:\SaltySD" "%AB%\SaltySD" >nul 2>&1
)
if exist "%sd%:\savedata\*" (
xcopy /I /Y "%sd%:\savedata\*" "%AB%\savedata\" >nul 2>&1
)
if exist "%sd%:\savedata\DBI" (
xcopy /I /Y "%sd%:\savedata\DBI" "%AB%\savedata\" >nul 2>&1
)
if exist "%sd%:\DBI" (
xcopy /I /Y "%sd%:\DBI" "%AB%\savedata\DBI" >nul 2>&1
)
if exist "%sd%:\JKSV" (
xcopy /I /Y "%sd%:\JKSV" "%AB%\savedata\JKSV" >nul 2>&1
)
if exist "%sd%:\config\JKSV\webdav.json" (
xcopy /I /Y "%sd%:\config\JKSV\webdav.json" "%AB%\" >nul 2>&1
)
if exist "%sd%:\switch\prod.keys" (
xcopy /I /Y "%sd%:\switch\prod.keys" "%AB%\keys\" >nul 2>&1
)
if exist "%sd%:\switch\title.keys" (
xcopy /I /Y "%sd%:\switch\title.keys" "%AB%\keys\" >nul 2>&1
)
if exist "%sd%:\switch\dev.keys" (
xcopy /I /Y "%sd%:\switch\dev.keys" "%AB%\keys\" >nul 2>&1
)
if exist "%sd%:\switch\partial_aes.keys" (
xcopy /I /Y "%sd%:\switch\partial_aes.keys" "%AB%\keys\" >nul 2>&1
)
if exist "%sd%:\switch\key_retail.bin" (
xcopy /I /Y "%sd%:\switch\switch\key_retail.bin" "%AB%\keys\" >nul 2>&1
)
if exist "%sd%:\switch\tinfoil\locations.conf" (
xcopy /I /Y "%sd%:\switch\tinfoil\locations.conf" "%AB%\Tinfoil\" >nul 2>&1
)
if exist "%sd%:\switch\tinfoil\options.json" (
xcopy /I /Y "%sd%:\switch\tinfoil\options.json" "%AB%\Tinfoil\" >nul 2>&1
)

if exist "%sd%:\atmosphere\titles" (rename %sd%:\atmosphere\titles contents)
if exist "%sd%:\atmosphere\title" (rename %sd%:\atmosphere\title contents)
if exist "%sd%:\atmosphere\content" (rename %sd%:\atmosphere\content contents)

REM ======= ATMOSPHERE CONTENTS ================================
if exist "%sd%:\atmosphere\config" (RD /S /Q "%sd%:\atmosphere\config")
if exist "%sd%:\atmosphere\config_templates" (RD /S /Q "%sd%:\atmosphere\config_templates")

if exist "%sd%:\atmosphere\contents\0100000000000008" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000008")
if exist "%sd%:\atmosphere\contents\010000000000100B" (RD /S /Q "%sd%:\atmosphere\contents\010000000000100B")
if exist "%sd%:\atmosphere\contents\010000000000000D" (RD /S /Q "%sd%:\atmosphere\contents\010000000000000D")
if exist "%sd%:\atmosphere\contents\010000000000002b" (RD /S /Q "%sd%:\atmosphere\contents\010000000000002b")
if exist "%sd%:\atmosphere\contents\0100000000000032" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000032")
if exist "%sd%:\atmosphere\contents\0100000000000034" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000034")
if exist "%sd%:\atmosphere\contents\0100000000000036" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000036")
if exist "%sd%:\atmosphere\contents\0100000000000037" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000037")
if exist "%sd%:\atmosphere\contents\010000000000003C" (RD /S /Q "%sd%:\atmosphere\contents\010000000000003C")
if exist "%sd%:\atmosphere\contents\0100000000000042" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000042")
if exist "%sd%:\atmosphere\contents\010000000000100C" (RD /S /Q "%sd%:\atmosphere\contents\010000000000100C")
if exist "%sd%:\atmosphere\contents\010000000000100D" (RD /S /Q "%sd%:\atmosphere\contents\010000000000100D")
if exist "%sd%:\atmosphere\contents\0100000000001000" (RD /S /Q "%sd%:\atmosphere\contents\0100000000001000")
if exist "%sd%:\atmosphere\contents\0100000000001013" (RD /S /Q "%sd%:\atmosphere\contents\0100000000001013")
if exist "%sd%:\atmosphere\contents\0000000000534C56" (RD /S /Q "%sd%:\atmosphere\contents\0000000000534C56")
if exist "%sd%:\atmosphere\contents\00FF0000000002AA" (RD /S /Q "%sd%:\atmosphere\contents\00FF0000000002AA")
if exist "%sd%:\atmosphere\contents\00FF0000636C6BF2" (RD /S /Q "%sd%:\atmosphere\contents\00FF0000636C6BF2")
if exist "%sd%:\atmosphere\contents\00FF0000636C6BFF" (RD /S /Q "%sd%:\atmosphere\contents\00FF0000636C6BFF")
if exist "%sd%:\atmosphere\contents\00FF00006D7470FF" (RD /S /Q "%sd%:\atmosphere\contents\00FF00006D7470FF")
if exist "%sd%:\atmosphere\contents\00FF0000A53BB665" (RD /S /Q "%sd%:\atmosphere\contents\00FF0000A53BB665")
if exist "%sd%:\atmosphere\contents\00FF0012656180FF" (RD /S /Q "%sd%:\atmosphere\contents\00FF0012656180FF")
if exist "%sd%:\atmosphere\contents\01FF415446660000" (RD /S /Q "%sd%:\atmosphere\contents\01FF415446660000")
if exist "%sd%:\atmosphere\contents\00FF747765616BFF" (RD /S /Q "%sd%:\atmosphere\contents\00FF747765616BFF")
if exist "%sd%:\atmosphere\contents\0100000000000052" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000052")
if exist "%sd%:\atmosphere\contents\0100000000000081" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000081")
if exist "%sd%:\atmosphere\contents\0100000000000352" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000352")
if exist "%sd%:\atmosphere\contents\0100000000000464" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000464")
if exist "%sd%:\atmosphere\contents\0100000000000523" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000523")
if exist "%sd%:\atmosphere\contents\0100000000000901" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000901")
if exist "%sd%:\atmosphere\contents\0100000000000BED" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000BED")
if exist "%sd%:\atmosphere\contents\0100000000000BEF" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000BEF")
if exist "%sd%:\atmosphere\contents\0100000000000DAD" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000DAD")
if exist "%sd%:\atmosphere\contents\0100000000000F12" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000F12")
if exist "%sd%:\atmosphere\contents\0100000000000FAF" (RD /S /Q "%sd%:\atmosphere\contents\0100000000000FAF")
if exist "%sd%:\atmosphere\contents\0100000000006480" (RD /S /Q "%sd%:\atmosphere\contents\0100000000006480")
if exist "%sd%:\atmosphere\contents\0100000000007200" (RD /S /Q "%sd%:\atmosphere\contents\0100000000007200")
if exist "%sd%:\atmosphere\contents\010000000000bd00" (RD /S /Q "%sd%:\atmosphere\contents\010000000000bd00")
if exist "%sd%:\atmosphere\contents\010000000000C235" (RD /S /Q "%sd%:\atmosphere\contents\010000000000C235")
if exist "%sd%:\atmosphere\contents\010000000000f00f" (RD /S /Q "%sd%:\atmosphere\contents\010000000000f00f")
if exist "%sd%:\atmosphere\contents\010000000000FFAB" (RD /S /Q "%sd%:\atmosphere\contents\010000000000FFAB")
if exist "%sd%:\atmosphere\contents\01000000001ED1ED" (RD /S /Q "%sd%:\atmosphere\contents\01000000001ED1ED")
if exist "%sd%:\atmosphere\contents\0532232232232000" (RD /S /Q "%sd%:\atmosphere\contents\0532232232232000")
if exist "%sd%:\atmosphere\contents\054e4f4558454000" (RD /S /Q "%sd%:\atmosphere\contents\054e4f4558454000")
if exist "%sd%:\atmosphere\contents\2200000000000100" (RD /S /Q "%sd%:\atmosphere\contents\2200000000000100")
if exist "%sd%:\atmosphere\contents\4100000000000324" (RD /S /Q "%sd%:\atmosphere\contents\4100000000000324")
if exist "%sd%:\atmosphere\contents\4200000000000000" (RD /S /Q "%sd%:\atmosphere\contents\4200000000000000")
if exist "%sd%:\atmosphere\contents\4200000000000010" (RD /S /Q "%sd%:\atmosphere\contents\4200000000000010")
if exist "%sd%:\atmosphere\contents\420000000000000E" (RD /S /Q "%sd%:\atmosphere\contents\420000000000000E")
if exist "%sd%:\atmosphere\contents\420000000000000F" (RD /S /Q "%sd%:\atmosphere\contents\420000000000000F")
if exist "%sd%:\atmosphere\contents\4200000000000811" (RD /S /Q "%sd%:\atmosphere\contents\4200000000000811")
if exist "%sd%:\atmosphere\contents\4200000000000BA6" (RD /S /Q "%sd%:\atmosphere\contents\4200000000000BA6")
if exist "%sd%:\atmosphere\contents\4200000000000FFF" (RD /S /Q "%sd%:\atmosphere\contents\4200000000000FFF")
if exist "%sd%:\atmosphere\contents\010000000007E51A" (RD /S /Q "%sd%:\atmosphere\contents\010000000007E51A")
if exist "%sd%:\atmosphere\contents\420000000007E51A" (RD /S /Q "%sd%:\atmosphere\contents\420000000007E51A")
if exist "%sd%:\atmosphere\contents\4200000000474442" (RD /S /Q "%sd%:\atmosphere\contents\4200000000474442")
if exist "%sd%:\atmosphere\contents\4200000000696969" (RD /S /Q "%sd%:\atmosphere\contents\4200000000696969")
if exist "%sd%:\atmosphere\contents\4200000AF1E8DA89" (RD /S /Q "%sd%:\atmosphere\contents\4200000AF1E8DA89")
if exist "%sd%:\atmosphere\contents\42000062616B6101" (RD /S /Q "%sd%:\atmosphere\contents\42000062616B6101")
if exist "%sd%:\atmosphere\contents\4200736372697074" (RD /S /Q "%sd%:\atmosphere\contents\4200736372697074")
if exist "%sd%:\atmosphere\contents\4206900000000012" (RD /S /Q "%sd%:\atmosphere\contents\4206900000000012")
if exist "%sd%:\atmosphere\contents\430000000000000A" (RD /S /Q "%sd%:\atmosphere\contents\430000000000000A")
if exist "%sd%:\atmosphere\contents\430000000000000B" (RD /S /Q "%sd%:\atmosphere\contents\430000000000000B")
if exist "%sd%:\atmosphere\contents\430000000000000C" (RD /S /Q "%sd%:\atmosphere\contents\430000000000000C")
if exist "%sd%:\atmosphere\contents\43000000000000FF" (RD /S /Q "%sd%:\atmosphere\contents\43000000000000FF")
if exist "%sd%:\atmosphere\contents\4300000000000909" (RD /S /Q "%sd%:\atmosphere\contents\4300000000000909")
if exist "%sd%:\atmosphere\contents\5600000000000000" (RD /S /Q "%sd%:\atmosphere\contents\5600000000000000")
if exist "%sd%:\atmosphere\contents\690000000000000D" (RD /S /Q "%sd%:\atmosphere\contents\690000000000000D")
if exist "%sd%:\atmosphere\contents\010B6ECF3B30D000" (RD /S /Q "%sd%:\atmosphere\contents\010B6ECF3B30D000")

if exist "%sd%:\atmosphere\exefs_patches" (RD /S /Q "%sd%:\atmosphere\exefs_patches")
if exist "%sd%:\atmosphere\fatal_errors" (RD /S /Q "%sd%:\atmosphere\fatal_errors")
if exist "%sd%:\atmosphere\flags" (RD /S /Q "%sd%:\atmosphere\flags")
if exist "%sd%:\atmosphere\hb" (RD /S /Q "%sd%:\atmosphere\hb")
if exist "%sd%:\atmosphere\hbl_html" (RD /S /Q "%sd%:\atmosphere\hbl_html")
if exist "%sd%:\atmosphere\hosts" (RD /S /Q "%sd%:\atmosphere\hosts")
if exist "%sd%:\atmosphere\kip_patches" (RD /S /Q "%sd%:\atmosphere\kip_patches")
if exist "%sd%:\atmosphere\kips" (RD /S /Q "%sd%:\atmosphere\kips")
if exist "%sd%:\atmosphere\logs" (RD /S /Q "%sd%:\atmosphere\logs")

if exist "%sd%:\atmosphere\erpt_reports" (RD /S /Q "%sd%:\atmosphere\erpt_reports")
if exist "%sd%:\atmosphere\fatal_reports" (RD /S /Q "%sd%:\atmosphere\fatal_reports")
if exist "%sd%:\atmosphere\crash_reports" (RD /S /Q "%sd%:\atmosphere\crash_reports")

if exist "%sd%:\atmosphere\*.aio" (DEL /F "%sd%:\atmosphere\*.aio")
if exist "%sd%:\atmosphere\*.bat" (DEL /F "%sd%:\atmosphere\*.bat")
if exist "%sd%:\atmosphere\*.bin" (DEL /F "%sd%:\atmosphere\*.bin")
if exist "%sd%:\atmosphere\*.dat" (DEL /F "%sd%:\atmosphere\*.dat")
if exist "%sd%:\atmosphere\*.db" (DEL /F "%sd%:\atmosphere\*.db")
if exist "%sd%:\atmosphere\*.enc" (DEL /F "%sd%:\atmosphere\*.enc")
if exist "%sd%:\atmosphere\*.git" (DEL /F "%sd%:\atmosphere\*.git")
if exist "%sd%:\atmosphere\*.ini" (DEL /F "%sd%:\atmosphere\*.ini")
if exist "%sd%:\atmosphere\*.log" (DEL /F "%sd%:\atmosphere\*.log")
if exist "%sd%:\atmosphere\*.md" (DEL /F "%sd%:\atmosphere\*.md")
if exist "%sd%:\atmosphere\*.nro" (DEL /F "%sd%:\atmosphere\*.nro")
if exist "%sd%:\atmosphere\*.nsp" (DEL /F "%sd%:\atmosphere\*.nsp")
if exist "%sd%:\atmosphere\*.romfs" (DEL /F "%sd%:\atmosphere\*.romfs")
if exist "%sd%:\atmosphere\*.star" (DEL /F "%sd%:\atmosphere\*.star")
if exist "%sd%:\atmosphere\*.te" (DEL /F "%sd%:\atmosphere\*.te")
if exist "%sd%:\atmosphere\*.txt" (DEL /F "%sd%:\atmosphere\*.txt")
if exist "%sd%:\atmosphere\*.zip" (DEL /F "%sd%:\atmosphere\*.zip")
if exist "%sd%:\atmosphere\package3" (DEL /F "%sd%:\atmosphere\package3")

if exist "%sd%:\bootloader" (RD /S /Q "%sd%:\bootloader")
if exist "%sd%:\emuiibo" (RD /S /Q "%sd%:\emuiibo")
if exist "%sd%:\JKSV" (RD /S /Q "%sd%:\JKSV")
if exist "%sd%:\SaltySD" (RD /S /Q "%sd%:\SaltySD")
if exist "%sd%:\config" (RD /S /Q "%sd%:\config")
if exist "%sd%:\nsp" (RD /S /Q "%sd%:\nsp")
if exist "%sd%:\PlusPack" (RD /S /Q "%sd%:\PlusPack")

if exist "%sd%:\switch\.overlays" (RD /S /Q "%sd%:\switch\.overlays")
if exist "%sd%:\switch\.packages" (RD /S /Q "%sd%:\switch\.packages")
if exist "%sd%:\switch\appstore" (RD /S /Q "%sd%:\switch\appstore")
if exist "%sd%:\switch\Daybreak" (RD /S /Q "%sd%:\switch\Daybreak")
if exist "%sd%:\switch\Haze" (RD /S /Q "%sd%:\switch\Haze")
if exist "%sd%:\switch\JKSV" (RD /S /Q "%sd%:\switch\JKSV")
if exist "%sd%:\switch\ldnmitm_config" (RD /S /Q "%sd%:\switch\ldnmitm_config")
if exist "%sd%:\switch\Linkalho" (RD /S /Q "%sd%:\switch\Linkalho")
if exist "%sd%:\switch\NXDumpTool" (RD /S /Q "%sd%:\switch\NXDumpTool")
if exist "%sd%:\switch\NX-Activity-Log" (RD /S /Q "%sd%:\switch\NX-Activity-Log")
if exist "%sd%:\switch\ReverseNX-Tool" (RD /S /Q "%sd%:\switch\ReverseNX-Tool")
if exist "%sd%:\switch\sigpatch-updater" (RD /S /Q "%sd%:\switch\sigpatch-updater")
if exist "%sd%:\switch\SPU" (RD /S /Q "%sd%:\switch\SPU")
if exist "%sd%:\switch\sys-clk-manager" (RD /S /Q "%sd%:\switch\sys-clk-manager")

if exist "%sd%:\switch\*.aio" (DEL /F "%sd%:\switch\*.aio")
if exist "%sd%:\switch\*.bat" (DEL /F "%sd%:\switch\*.bat")
if exist "%sd%:\switch\*.bin" (DEL /F "%sd%:\switch\*.bin")
if exist "%sd%:\switch\*.dat" (DEL /F "%sd%:\switch\*.dat")
if exist "%sd%:\switch\*.enc" (DEL /F "%sd%:\switch\*.enc")
if exist "%sd%:\switch\*.git" (DEL /F "%sd%:\switch\*.git")
if exist "%sd%:\switch\*.ini" (DEL /F "%sd%:\switch\*.ini")
if exist "%sd%:\switch\*.keys" (DEL /F "%sd%:\switch\*.keys")
if exist "%sd%:\switch\*.log" (DEL /F "%sd%:\switch\*.log")
if exist "%sd%:\switch\*.md" (DEL /F "%sd%:\switch\*.md")
if exist "%sd%:\switch\*.nro" (DEL /F "%sd%:\switch\*.nro")
if exist "%sd%:\switch\*.nsp" (DEL /F "%sd%:\switch\*.nsp")
if exist "%sd%:\switch\*.romfs" (DEL /F "%sd%:\switch\*.romfs")
if exist "%sd%:\switch\*.star" (DEL /F "%sd%:\switch\*.star")
if exist "%sd%:\switch\*.te" (DEL /F "%sd%:\switch\*.te")
if exist "%sd%:\switch\*.txt" (DEL /F "%sd%:\switch\*.txt")
if exist "%sd%:\switch\*.zip" (DEL /F "%sd%:\switch\*.zip")

if exist "%sd%:\ams" (RD /S /Q "%sd%:\ams")
if exist "%sd%:\atmo" (RD /S /Q "%sd%:\atmo")
if exist "%sd%:\firmware" (RD /S /Q "%sd%:\firmware")
if exist "%sd%:\games" (RD /S /Q "%sd%:\games")
if exist "%sd%:\music" (RD /S /Q "%sd%:\music")
if exist "%sd%:\modules" (RD /S /Q "%sd%:\modules")
if exist "%sd%:\NSPs" (RD /S /Q "%sd%:\NSPs")
if exist "%sd%:\pegascape" (RD /S /Q "%sd%:\pegascape")
if exist "%sd%:\sept" (RD /S /Q  "%sd%:\sept")
if exist "%sd%:\scripts" (RD /S /Q "%sd%:\scripts")
if exist "%sd%:\sxos" (RD /S /Q  "%sd%:\sxos")
if exist "%sd%:\tegraexplorer" (RD /S /Q "%sd%:\tegraexplorer")
if exist "%sd%:\TinGen" (RD /S /Q "%sd%:\TinGen")
if exist "%sd%:\themes" (RD /S /Q "%sd%:\themes")
if exist "%sd%:\tools" (RD /S /Q "%sd%:\tools")
if exist "%sd%:\warmboot_mariko" (RD /S /Q "%sd%:\warmboot_mariko")


REM ======= Micro SD ROOT ======================================
if exist "%sd%:\*.aio" (DEL /F "%sd%:\*.aio")
if exist "%sd%:\*.bat" (DEL /F "%sd%:\*.bat")
if exist "%sd%:\*.bin" (DEL /F "%sd%:\*.bin")
if exist "%sd%:\*.dat" (DEL /F "%sd%:\*.dat")
if exist "%sd%:\*.enc" (DEL /F "%sd%:\*.enc")
if exist "%sd%:\*.git" (DEL /F "%sd%:\*.git")
if exist "%sd%:\*.ini" (DEL /F "%sd%:\*.ini")
if exist "%sd%:\*.log" (DEL /F "%sd%:\*.log")
if exist "%sd%:\*.md" (DEL /F "%sd%:\*.md")
if exist "%sd%:\*.nro" (DEL /F "%sd%:\*.nro")
if exist "%sd%:\*.nsp" (DEL /F "%sd%:\*.nsp")
if exist "%sd%:\*.romfs" (DEL /F "%sd%:\*.romfs")
if exist "%sd%:\*.star" (DEL /F "%sd%:\*.star")
if exist "%sd%:\*.te" (DEL /F "%sd%:\*.te")
if exist "%sd%:\*.txt" (DEL /F "%sd%:\*.txt")

FOR /D /R "%sd%:\" %%X IN (amsPACK*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (kefir*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (ShallowSea*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (DeepSea*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (reinx*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (firmware*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (sxos*) DO RD /S /Q "%%X"
FOR /D /R "%sd%:\" %%X IN (custom*) DO RD /S /Q "%%X"

GOTO STANDARD

REM ============================================================
:DOWN

@echo off
setlocal enabledelayedexpansion

for /f "tokens=1,2 delims==" %%i in ('type "%~dp0version.inc" ^| find "="') do (
    set %%i=%%j
)

mkdir "%~dp0msys64"
curl -L -o "%~dp0msys2-x86_64-%LATEST_VER%.exe" "https://github.com/msys2/msys2-installer/releases/latest/download/msys2-x86_64-%LATEST_VER%.exe"
curl -L -o "%~dp0python-%PYTHON_VER%-amd64.exe" "https://www.python.org/ftp/python/%PYTHON_VER%/python-%PYTHON_VER%-amd64.exe"

"%~dp0msys2-x86_64-%LATEST_VER%.exe"
"%~dp0python-%PYTHON_VER%-amd64.exe"

GOTO TITLE

REM ============================================================
:KEYS

@echo off
cd /d "%~dp0misc\scripts\"
%~dp0msys64\mingw64.exe %~dp0misc\scripts\keys.sh

GOTO TITLE

REM ============================================================
:PREP

@echo off
cd /d "%~dp0misc\scripts\"

set "MINGW_EXE=%~dp0msys64\mingw64.exe"

echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\admin.vbs"
echo UAC.ShellExecute "%MINGW_EXE%", "%~dp0misc\scripts\prepare.sh", "", "runas", 1 >> "%temp%\admin.vbs"
"%temp%\admin.vbs"
del "%temp%\admin.vbs"

GOTO TITLE

REM ============================================================
:MAKE

@echo off
cd /d "%~dp0misc\scripts\"
%~dp0msys64\mingw64.exe %~dp0misc\scripts\build.sh

exit

REM ============================================================
:UPDATE

@echo off
curl -o "%~dp0ASAP.bat" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/ASAP.bat
curl -o "%~dp0misc\scripts\build.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/build.sh
curl -o "%~dp0misc\scripts\config.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/config.sh
curl -o "%~dp0misc\scripts\keys.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/keys.sh
curl -o "%~dp0misc\scripts\linux.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/linux.sh
curl -o "%~dp0misc\scripts\migrate.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/migrate.sh
curl -o "%~dp0misc\scripts\prepare.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/prepare.sh
curl -o "%~dp0misc\scripts\update.sh" https://raw.githubusercontent.com/Yorunokyujitsu/archive_aio/main/misc/scripts/update.sh

GOTO AUTOUPDATE

REM ============================================================
:AUTOUPDATE
COLOR 09
cls
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                            - UPDATE -  
echo.
echo            This will remove all existing builds and update from the latest repository.
echo.
echo                                      Do you want to run it?
echo.
echo =====================================================================================================
echo.
echo      Y.  Rebuild latest repo
echo.
echo      B.  Select again
echo.
echo -----------------------------------------------------------------------------------------------------
echo.

set /p AUTOUPDATE=     - Please enter the command: 
if /i "%AUTOUPDATE%"=="Y" (
    cd /d "%~dp0misc\scripts\"
    %~dp0msys64\mingw64.exe %~dp0misc\scripts\update.sh
    exit
) else if /i "%AUTOUPDATE%"=="B" GOTO TITLE
pause>nul 2>&1

REM ============================================================
:MIGRATE

@echo off
cd /d "%~dp0misc\scripts\"
%~dp0msys64\mingw64.exe %~dp0misc\scripts\migrate.sh

exit

REM ============================================================
:STANDARD
COLOR 0A
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                            Installing...
echo.
echo =====================================================================================================

cd output\
unzip -o ASAP.zip -d %sd%:\
xcopy "%sd%:\atmosphere" "%sd%:\ASAP\atmosphere" /H /Y /C /R /S /E /I >nul 2>nul
if exist "%sd%:\atmosphere" (RD /S /Q "%sd%:\atmosphere")

GOTO HEKATEUSB

REM ============================================================
:HEKATEUSB
COLOR 0E
cls
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                   - Hekate USB Max Rate -
echo.                             
echo.
echo                                Run only once pre windows PC
echo.
echo =====================================================================================================
echo.
echo      1 = Registry adjustments
echo.
echo      2 = Skip
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo      B = Back
echo.
echo -----------------------------------------------------------------------------------------------------
echo.

set /p HEKATEUSB=     - Please enter the command: 
	if "%HEKATEUSB%"=="1" GOTO USB3
	if "%HEKATEUSB%"=="2" GOTO ATFIXDEL
	if /i "%HEKATEUSB%"=="B" GOTO TITLE
pause>nul 2>&1

:USB3
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\usbstor\11ECA7E0 /v MaximumTransferLength /t REG_DWORD /d 00100000 /f>nul 2>&1
GOTO ATFIXDEL

REM ============================================================	
:ATFIXDEL
COLOR 0A
cls
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                           - Completed -  
echo.
echo                        Modify the archive bit and turn off the attribute
echo.
echo =====================================================================================================

if exist "%sd%:\ASAP" (
	attrib -A -R /S /D %sd%:\ASAP\*
	attrib -A -R %sd%:\ASAP)
if exist "%sd%:\atmosphere" (
	attrib -A -R /S /D %sd%:\atmosphere\*
	attrib -A -R %sd%:\atmosphere)
if exist "%sd%:\backup" (
	attrib -A -R /S /D %sd%:\backup\*
	attrib -A -R %sd%:\backup)
if exist "%sd%:\bootloader" (
	attrib -A -R /S /D %sd%:\bootloader\*
	attrib -A -R %sd%:\bootloader)
if exist "%sd%:\config" (
	attrib -A -R /S /D %sd%:\config\*
	attrib -A -R %sd%:\config)
if exist "%sd%:\emuiibo" (
	attrib -A -R /S /D %sd%:\emuiibo\*
	attrib -A -R %sd%:\emuiibo)
if exist "%sd%:\nsp" (
	attrib -A -R /S /D %sd%:\nsp\*
	attrib -A -R %sd%:\nsp)
if exist "%sd%:\SaltySD" (
	attrib -A -R /S /D %sd%:\SaltySD\*
	attrib -A -R %sd%:\SaltySD)
if exist "%sd%:\switch" (
	attrib -A -R /S /D %sd%:\switch\*
	attrib -A -R %sd%:\switch)
if exist "%sd%:\warmboot_mariko" (
	attrib -A -R /S /D %sd%:\warmboot_mariko\*
	attrib -A -R %sd%:\warmboot_mariko)
if exist "%sd%:\boot.dat" (attrib -A -R %sd%:\boot.dat)
if exist "%sd%:\boot.ini" (attrib -A -R %sd%:\boot.ini)
if exist "%sd%:\payload.bin" (attrib -A -R %sd%:\payload.bin)
if exist .DS_STORE del /s /q /f /a .DS_STORE
if exist ._.* del /s /q /f /a ._.*
powershell -Command "Start-Sleep -Seconds 2"

:ATFIXDEL1
echo.
echo                                    Please wait for a moment...
echo.
echo -----------------------------------------------------------------------------------------------------
powershell -Command "Start-Sleep -Seconds 2"

GOTO ENDPG

REM ============================================================
:NOTMATCHDRIVE
COLOR 0C
cls
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo                                            - Warning - 
echo.
echo                   [ %sd%:/ ] drive selected is missing or disconnected
echo.
echo.
echo =====================================================================================================
echo.
echo      1.  Selected drive is correct^^!
echo.
echo      2.  Select again
echo.
echo -----------------------------------------------------------------------------------------------------
echo.
echo      3.  Quit
echo.
echo -----------------------------------------------------------------------------------------------------
echo.

set /p st=     - Please enter the command: 

for %%A in ("Y" "y" "1") do if "%st%"==%%A (GOTO BACKUP)
for %%A in ("N" "n" "2") do if "%st%"==%%A (GOTO NOTICE)
for %%A in ("B" "b" "3") do if "%st%"==%%A (GOTO ENDPG)

REM ============================================================
:ENDPG
COLOR 0A
echo.
echo                                      - Process termination - 
echo.
echo                                     Safely exits the program^^! 
echo.
echo =====================================================================================================
echo.

if exist "%wd%" (RD /s /q "%wd%\*") >nul 2>nul
powershell -Command "Start-Sleep -Seconds 3"
exit

REM ============================================================
:ENDPG0
COLOR 09
echo.
echo.
echo =====================================================================================================
echo.
echo                                      - Packaging completed - 
echo.
echo                                     Safely exits the program^^! 
echo.
echo =====================================================================================================
echo.

if exist "%wd%" (RD /s /q "%wd%\*") >nul 2>nul
powershell -Command "Start-Sleep -Seconds 3"
exit
