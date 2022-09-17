@echo off
echo [*]Checking the process level...
cd /d %~dp0
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
if NOT "%LEVEL%"=="High" (
powershell.exe -NoProfile -ExecutionPolicy RemoteSigned -Command "Start-Process %~f0 -Verb runas"
exit
)
echo [*]Privilege is OK!

powershell -Command "[string[]]$UwpExist = Get-AppxPackage | Sort-Object Name | Select Name ; if ( $UwpExist.Contains('@{Name=Microsoft.MinecraftUWP}')) { echo [*]Minecraft-was-Detected!! }else{ echo [*]YOU-HAVE-TO-INSTALL-Minecraft!! ; pause ; stop-Process -Name cmd }"

timeout /t 4 /nobreak >nul

cls                                                                                                                                                                                                                  
echo   $$$$$$$$                                         $$                          $$        $$     $$   $$$$$$   
echo      $$                                            $$                          $$        $$     $$  $$    $$  
echo      $$   $$$$$$$  $$    $$   $$$$$$   $$    $$  $$$$$$     $$$$$$    $$$$$$   $$        $$     $$        $$
echo      $$  $$        $$    $$  $$    $$  $$    $$    $$      $$    $$  $$    $$  $$         $$   $$     $$$$$   
echo      $$   $$$$$$   $$    $$  $$        $$    $$    $$      $$    $$  $$    $$  $$          $$ $$          $$  
echo      $$        $$  $$    $$  $$        $$    $$    $$  $$  $$    $$  $$    $$  $$           $$$     $$    $$  
echo      $$  $$$$$$$    $$$$$$   $$         $$$$$$      $$$$    $$$$$$    $$$$$$   $$            $       $$$$$$
echo ----------------------------------------------------------------------------------------------------------------------                             
:select
set /p select=[*]Please enter M / R / E (M : Minecraft / R : fixtool / E : Exit)
if "%select%"=="M" (
        echo [*]You chose [M]
        timeout /t 1 /nobreak >nul
        goto Minecraft
        ) else if "%select%"=="R" (
        echo [*]You chose [R]
        timeout /t 1 /nobreak >nul
        goto fix
        ) else if "%select%"=="E" (
        echo [*]You chose [E]
        timeout /t 1 /nobreak >nul
        exit
        ) else (
        echo [*]Incorrect characters have been entered...
        timeout /t 2 /nobreak >nul
        goto select
        )

:fix
set ValueName=ServiceDll

for /f "tokens=1,2*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "%ValueName%"' ) DO (
 if "%%i"=="%ValueName%" (
  set Value=%%k
 )
)

echo [*] The registry key is %Value%
timeout /t 3 /nobreak >nul
IF "%Value%" EQU "C:\WINDOWS\System32\ClipSVC.dll" (

    echo [*] This is normal.
    timeout /t 3 /nobreak >nul
    goto net
) else (
    echo [*]This is Abnormal
    timeout /t 4 /nobreak >nul
    goto Abnormal
)

:Abnormal
set /p value1=[*]Do you want to change the normal value?  y/n (it means yes or no) :
echo %value1%
timeout /t 3 /nobreak >nul
if "%value1%" EQU "y" (
    echo [*]You chose [y]
    timeout /t 1 /nobreak >nul
    echo [*]Start changing...
    timeout /t 3 /nobreak >nul
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDll /t "REG_EXPAND_SZ" /d "%SystemRoot%\System32\ClipSVC.dll" /f
    timeout /t 2 /nobreak >nul
    echo [*]Done..
    goto net
) else if "%value1%" EQU "n" (
    echo [*]You chose [n]
    timeout /t 1 /nobreak >nul
    echo [*]Sir..
    timeout /t 4 /nobreak >nul
    goto net
) else  (
    echo [*]Incorrect characters have been entered...
    echo [*]Please enter y or n
    goto Abnormal
)

:net 
set /p value2=[*]Next do you want to start ClipSVC? y/n :
echo %value2%
timeout /t 3 /nobreak >nul
IF "%value2%" EQU "y" (
    echo [*]You chose [y]
    timeout /t 1 /nobreak >nul
    echo [*]Now trying to start ClipSVC...
    timeout /t 1 /nobreak >nul
    net start ClipSVC
    timeout /t 3 /nobreak >nul
    echo [*]Done...
    timeout /t 2 /nobreak >nul
    pause
    goto select

) else if "%value2%" EQU "n" (
    echo [*]You chose [n]
    echo [*]OK.. This program will close...
    pause
    goto select
) else (
    echo [*]Incorrect characters have been entered...
    echo [*]Please enter y or n
    timeout /t 4 /nobreak >nul
    goto net
)


:Minecraft
openfiles > NUL 2>&1
if NOT %ERRORLEVEL% EQU 0 goto end

echo [*]operation successfully completed!!*
timeout /t 3 /nobreak >nul
cls


cd /d %~dp0
color a
echo   $$$$$$$$                                         $$                          $$        $$     $$   $$$$$$   
echo      $$                                            $$                          $$        $$     $$  $$    $$  
echo      $$   $$$$$$$  $$    $$   $$$$$$   $$    $$  $$$$$$     $$$$$$    $$$$$$   $$        $$     $$        $$
echo      $$  $$        $$    $$  $$    $$  $$    $$    $$      $$    $$  $$    $$  $$         $$   $$     $$$$$   
echo      $$   $$$$$$   $$    $$  $$        $$    $$    $$      $$    $$  $$    $$  $$          $$ $$          $$  
echo      $$        $$  $$    $$  $$        $$    $$    $$  $$  $$    $$  $$    $$  $$           $$$     $$    $$  
echo      $$  $$$$$$$    $$$$$$   $$         $$$$$$      $$$$    $$$$$$    $$$$$$   $$            $       $$$$$$
echo ----------------------------------------------------------------------------------------------------------------------
echo ########################################################################################################################
echo _________________________________________________________________________________________________________________________
echo This tool enables to play Minecraft win10 edition with free. You have to download and install Minecraft from 
echo Microsoft win10 store before you lanch this tool.
echo !!Please do not close this screen while processing!!
echo If you understand it , please enter some keys (about 100 seconds later, this program will automatically start injecting)
echo By tsuru
echo _________________________________________________________________________________________________________________________

timeout 100 >nul 

echo [*]Now processing ....
echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDll /t "REG_EXPAND_SZ" /d "%SystemRoot%\System32\ClipSVC.dlla" /f 

echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v DisableSubscription /t "REG_DWORD" /d "0" /f

echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v InactivityShutdownDelay /t "REG_DWORD" /d "300" /f

echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ProcessBiosKey /t "REG_DWORD" /d "1" /f

echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v RefreshRequired /t "REG_DWORD" /d "1" /f

echo [*]Changing registry settings ...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDllUnloadOnStop /t "REG_DWORD" /d "1" /f
timeout /t 3 /nobreak >nul

echo [*]Now stopping ClipSVC...
net stop ClipSVC
 
timeout /t 2 /nobreak >nul
start /wait minecraft:
if NOT %ERRORLEVEL% EQU 0 goto WTF
cls

echo  ####      ####    ##  ##   ######     ######    ####    ##  ##    ####    ##  ##     ######   ##  ##   ######     ##  ##   ######   ##  ##   #####     ####      ##     ####      
echo  ## ##    ##  ##   ### ##     ##         ##     ##  ##   ##  ##   ##  ##   ##  ##       ##     ##  ##   ##         ## ##    ##       ##  ##   ##  ##   ##  ##    ####    ## ##    
echo  ##  ##   ##  ##   ######     ##         ##     ##  ##   ##  ##   ##       ##  ##       ##     ##  ##   ##         ####     ##       ##  ##   ##  ##   ##  ##   ##  ##   ##  ##   
echo  ##  ##   ##  ##   ######     ##         ##     ##  ##   ##  ##   ##       ######       ##     ######   ####       ###      ####      ####    #####    ##  ##   ######   ##  ##    
echo  ##  ##   ##  ##   ## ###     ##         ##     ##  ##   ##  ##   ##       ##  ##       ##     ##  ##   ##         ####     ##         ##     ##  ##   ##  ##   ##  ##   ##  ##       
echo  ## ##    ##  ##   ##  ##     ##         ##     ##  ##   ##  ##   ##  ##   ##  ##       ##     ##  ##   ##         ## ##    ##         ##     ##  ##   ##  ##   ##  ##   ## ##    
echo  ####      ####    ##  ##     ##         ##      ####     ####     ####    ##  ##       ##     ##  ##   ######     ##  ##   ######     ##     #####     ####    ##  ##   ####      

:wait
TASKLIST | FIND "Minecraft.Windows.exe" > NUL
IF NOT ERRORLEVEL 1  (
        echo [*]The process of minecraft is detected!!
	GOTO done
) ELSE (
        ECHO Now loading...
	GOTO wait
)
:done
:wait2
echo Dim answer:answer = MsgBox("When the red screen changes to the loading screen, please press the OK button.",vbOKCancel + vbInformation + vbSystemModal, "IMPORTANT MESSAGE"  ):WScript.Quit(answer) > %TEMP%\msgbox.vbs & %TEMP%\msgbox.vbs

IF NOT ERRORLEVEL 1 ( 
        echo [*]Please wait!
        GOTO wait2
) ELSE IF NOT ERRORLEVEL 2 (
        echo [*]Now Trying to stop Runtimebroker...
        GOTO runtime
) ELSE (
        echo [*]Please wait!
        GOTO wait2
)

:runtime
timeout /t 5 /nobreak >nul
echo [*]Now Stopping RuntimeBroker ....
taskkill /f /im RuntimeBroker.exe >nul 2>&1
echo [*]Now Stopping RuntimeBroker ....
taskkill /f /im RuntimeBroker.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo [*]Now Stopping RuntimeBroker ....
taskkill /f /im RuntimeBroker.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo [*]Now Stopping RuntimeBroker ....
taskkill /f /im RuntimeBroker.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo [*]Now Stopping RuntimeBroker ....
taskkill /f /im RuntimeBroker.exe >nul 2>&1



:ok
cls
echo  #####    ##         ##     ##  ##     ##
echo  ##  ##   ##        ####    ##  ##     ##
echo  ##  ##   ##       ##  ##   ##  ##     ##
echo  #####    ##       ######    ####      ##
echo  ##       ##       ##  ##     ##
echo  ##       ##       ##  ##     ##
echo  ##       ######   ##  ##     ##       ##






TASKLIST | FIND "Minecraft.Windows.exe" > NUL
IF NOT ERRORLEVEL 1  (
        ECHO Minecraft is running !!!!!!!!!
        ECHO Minecraft is running !!!!!!!!!
        ECHO Minecraft is running !!!!!!!!!
        ECHO Minecraft is running !!!!!!!!!
	timeout /t 1 /nobreak >nul
	GOTO ok
) ELSE (
        ECHO Minecraft was stopped omg
	GOTO no
)

:no
cls
echo  ##   ##   ####    ##  ##   ######    ####    #####      ##     ######   ######      ##   ##    ##      ####        ####    ######    ####    #####    #####    ######   ####
echo  ### ###    ##     ### ##   ##       ##  ##   ##  ##    ####    ##         ##        ##   ##   ####    ##  ##      ##  ##     ##     ##  ##   ##  ##   ##  ##   ##       ## ##
echo  #######    ##     ######   ##       ##       ##  ##   ##  ##   ##         ##        ##   ##  ##  ##   ##          ##         ##     ##  ##   ##  ##   ##  ##   ##       ##  ##
echo  ## # ##    ##     ######   ####     ##       #####    ######   ####       ##        ## # ##  ######    ####        ####      ##     ##  ##   #####    #####    ####     ##  ##
echo  ##   ##    ##     ## ###   ##       ##       ####     ##  ##   ##         ##        #######  ##  ##       ##          ##     ##     ##  ##   ##       ##       ##       ##  ##
echo  ##   ##    ##     ##  ##   ##       ##  ##   ## ##    ##  ##   ##         ##        ### ###  ##  ##   ##  ##      ##  ##     ##     ##  ##   ##       ##       ##       ## ##
echo  ##   ##   ####    ##  ##   ######    ####    ##  ##   ##  ##   ##         ##        ##   ##  ##  ##    ####        ####      ##      ####    ##       ##       ######   ####

echo ###################################################################################################################################################################################


echo  ####      ####    ##  ##   ######       ####    ##        ####     ####    ######      ######   ##  ##    ####     ####       ##   ##   ####    ##  ##   ####      ####    ##   ##
echo  ## ##    ##  ##   ### ##     ##        ##  ##   ##       ##  ##   ##  ##   ##            ##     ##  ##     ##     ##  ##      ##   ##    ##     ### ##   ## ##    ##  ##   ##   ##
echo  ##  ##   ##  ##   ######     ##        ##       ##       ##  ##   ##       ##            ##     ##  ##     ##     ##          ##   ##    ##     ######   ##  ##   ##  ##   ##   ##
echo  ##  ##   ##  ##   ######     ##        ##       ##       ##  ##    ####    ####          ##     ######     ##      ####       ## # ##    ##     ######   ##  ##   ##  ##   ## # ##
echo  ##  ##   ##  ##   ## ###     ##        ##       ##       ##  ##       ##   ##            ##     ##  ##     ##         ##      #######    ##     ## ###   ##  ##   ##  ##   #######
echo  ## ##    ##  ##   ##  ##     ##        ##  ##   ##       ##  ##   ##  ##   ##            ##     ##  ##     ##     ##  ##      ### ###    ##     ##  ##   ## ##    ##  ##   ### ###
echo  ####      ####    ##  ##     ##         ####    ######    ####     ####    ######        ##     ##  ##    ####     ####       ##   ##   ####    ##  ##   ####      ####    ##   ##

timeout /t 1 /nobreak >nul

echo [*]Changing registry settings ...

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDll /t "REG_EXPAND_SZ" /d "%SystemRoot%\System32\ClipSVC.dll" /f

timeout /t 2 /nobreak >nul
echo [*]Now starting ClipSVC
net start ClipSVC 
goto E



:end
echo ________________________________________________________________________________________________________________________________________________
echo . 
echo   ####    ##       #####      ##      ###     ######      #####    ##  ##   ##  ##      ##   ##   ####   ########  ##  ##
echo  ##  ##   ##       ##        ####    ##  ##   ##          ##  ##   ##  ##   ### ##      ##   ##    ##       ##     ##  ##
echo  ##  ##   ##       ##       ##  ##   ##       ##          ##  ##   ##  ##   ######      ##   ##    ##       ##     ##  ##
echo  #####    ##       ####     ######    ####    ####        #####    ##  ##   ######      ## # ##    ##       ##     ######
echo  ##       ##       ##       ##  ##       ##   ##          ####     ##  ##   ## ###      #######    ##       ##     ##  ##
echo  ##       ##       ##       ##  ##   ##  ##   ##          ## ##    ##  ##   ##  ##      ### ###    ##       ##     ##  ##
echo  ##       ######   ######   ##  ##    ####    ######      ##  ##    ####    ##  ##      ##   ##   ####      ##     ##  ##
echo ________________________________________________________________________________________________________________________________________________ 
echo    ##     ####     ##   ##   ####    ##  ##           #####    #####     ####    ##  ##    ####    ##       ######    ####    ######    ####      ##
echo   ####    ## ##    ### ###    ##     ### ##           ##  ##   ##  ##     ##     ##  ##     ##     ##       ##       ##  ##   ##       ##  ##     ##
echo  ##  ##   ##  ##   #######    ##     ######           ##  ##   ##  ##     ##     ##  ##     ##     ##       ##       ##       ##       ##         ##
echo  ######   ##  ##   ## # ##    ##     ######           #####    #####      ##     ##  ##     ##     ##       ####     ## ###   ####      ####      ##
echo  ##  ##   ##  ##   ##   ##    ##     ## ###           ##       ####       ##     ##  ##     ##     ##       ##       ##  ##   ##           ##
echo  ##  ##   ## ##    ##   ##    ##     ##  ##           ##       ## ##      ##      ####      ##     ##       ##       ##  ##   ##       ##  ##
echo  ##  ##   ####     ##   ##   ####    ##  ##           ##       ##  ##    ####      ##      ####    ######   ######    ####    ######    ####      ##

echo msgbox "Error : You must run with administrator privileges!" ,vbCritical, "tsurutool Error : 10"  > %TEMP%/tsurutool.vbs & %TEMP%/tsurutool.vbs
goto d
:WTF 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDll /t "REG_EXPAND_SZ" /d "%SystemRoot%\System32\ClipSVC.dll" /f
timeout /t 2 /nobreak >nul
echo Now starting ClipSVC
net start ClipSVC 
echo msgbox "Error : You must install A Minecraft Windows10 Edition!" ,vbCritical, "tsurutool Error : 11"  > %TEMP%/msgboxtest.vbs & %TEMP%/msgboxtest.vbs
goto d

:E


timeout /t 10 /nobreak >nul

:d

timeout /t 2 /nobreak >nul



        