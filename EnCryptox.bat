@Echo off
mode 91,30
@Title EnCryptox
: Sets the proper date and time stamp with 24Hr Time for log file naming
: convention

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)
mkdir "%windir%\AdminCheck" 2>nul
if '%errorlevel%' == '0' rmdir "%windir%\AdminCheck" & goto gotPrivileges else goto getPrivileges
:getPrivileges
ECHO.
ECHO                        Administrator Rights are required
ECHO                      Invoking UAC for Privilege Escalation
ECHO.
Resources\runadmin.vbs %0
exit
:gotPrivileges
CD /D "%~dp0"
cd Resources
Batbox.exe /h 0
color 0a
goto Checknumberofruntimes
:Checknumberofruntimes
if exist "%~dp0Resources\log.lg" goto checktimes
goto error
:checktimes
set /p check=<log.lg
if %check% == 0 goto runfirsttime
if %check% == 1 goto Depcheck
goto error
:runfirsttime
MessageBox.exe "Looks like you are using the tool for first.Thanks for using it and please give suggestions and feedback at x-neron@pm.me" "First Time Notification" >nul
echo 1 >"log.lg" 
goto Depcheck
:Depcheck
if exist "%~dp0Resources\swat.exe" goto checkkverifyone
goto error
:checkkverifyone
if exist "%~dp0Resources\batbox.exe" goto checkkveriftwo 
goto error
:checkkveriftwo
if exist "%~dp0Resources\Button.bat" goto checkkverifythree 
goto error
:checkkverifythree
if exist "%~dp0Resources\Exo.exe" goto checkkverifyfour 
goto error
:checkkverifyfour
if exist "%~dp0Resources\GetInput.exe" goto checkkverifyfive
goto error
:checkkverifyfive
if exist "%~dp0Resources\gotoxy.exe" goto Dependenciesverified 
goto error
:Dependenciesverified
:Loop
type maml.lgo
gotoxy 69 5
exo /M:2:1 /C:0e /T:v /C:0b /T:1.1
echo.
exo /M:2:1 /C:0c /T:Written by:  /C:0b /T:Zeeshan azeem 
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
Call Button.bat  35 10 "Encrypt a File" 35 14 "Decrypt a File" 35 18 "  Exit  " # Press
Getinput /m %Press% /h 0b
:: Check for the pressed button 
if %errorlevel%==1 (goto Encryption)
if %errorlevel%==2 (goto Decryption)
if %errorlevel%==3 (exit)
:Encryption
cls
type maml.lgo
gotoxy 69 6
exo /M:2:1 /C:0e /T:v /C:0b /T:1.1
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 8
exo /M:2:1 /C:0c /T:[~] /C:0d /T:Please Choose a File to Encrypt.
gotoxy 30 9
exo /M:2:1 /C:0c /T:[~] /C:0d /T:Report Bugs at x-neron@pm.me
gotoxy 30 10
exo /M:2:1 /C:0c /T:[~] /C:0d /T:See Credits.txt to read Credits.
goto selectfile
:selectfile
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
Call Button.bat  35 13 "Choose a File" 35 16 "Go Back" 35 19 "Exit" # Press
Getinput /m %Press% /h 0b
if %errorlevel%==1 (goto choosefile)
if %errorlevel%==2 (cls & goto Loop)
if %errorlevel%==3 (exit)
:choosefile
if exist "fitno.lg" goto existfitno
goto error
:existfitno
set /p fitno=<fitno.lg
if %fitno% == 0 goto showfitno
if %fitno% == 1 goto dontshowfitno
:showfitno
echo 1 >"fitno.lg"
MessageBox.exe "Before Selecting a file please note that files with whitespaces are not accepted so rename a file containing whitespaces to avoid any malfunction." " First Time Notification" >nul
goto dontshowfitno
:dontshowfitno
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 69 6
exo /M:2:1 /C:0e /T:v /C:0b /T:1.1
gotoxy 1 7
exo /M:2:1 /C:0f /T:INFO:
gotoxy 1 8
exo /M:2:1 /C:0e /T:--------^>:
set File="%file%"
FOR %%i IN ("%File%") DO (
set filedrive=%%~di
set filepath=%%~pi
set fileextension=%%~xi
set filename=%%~ni
)
gotoxy 1 9
exo /M:2:1 /C:0e /T:Drive: /C:0d /T:%filedrive%
gotoxy 1 10
exo /M:2:1 /C:0e /T:File Path: /C:0d /T:%filepath%
gotoxy 1 11
exo /M:2:1 /C:0e /T:File Extension: /C:0d /T:%fileextension%
gotoxy 1 12
exo /M:2:1 /C:0f /T: ----------------/C:0c /T:-------------/C:0d /T:----------------/C:0e /T:--------------/C:0b /T:-------------/C:0c /T:------------------
gotoxy 11 8
exo /M:2:1 /C:0e /T:File Name: /C:0d /T:%filename%

Call Button.bat  35 13 "Continue" 35 17 "Go Back" 35 21 "  Exit  " # Press
Getinput /m %Press% /h 0b
if %errorlevel%==1 (goto continue)
if %errorlevel%==2 (cls & goto Loop)
if %errorlevel%==3 (exit)
:continue
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 1 7
exo /M:2:1 /C:0f /T: ----------------/C:0c /T:-------------/C:0d /T:----------------/C:0e /T:--------------/C:0b /T:-------------/C:0c /T:------------------
gotoxy 1 8
type resc.rs
gotoxy.exe 30 16
call :getPassword user_password "Enter password here: "
:: The user's password has been stored in the variable %user_password%
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0c /T:CONFIRMATION:
gotoxy 30 11
exo /M:2:1 /C:0c /T:Do you want to keep the source file
Call Button.bat  35 13 "Yes" 43 13 "No" # Press
Getinput /m %Press% /h 0c
if %errorlevel%==1 (goto keepsource)
if %errorlevel%==2 (cls & dontkeepsource)
:dontkeepsource
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Encrypting %filename%
swat.exe -e "%file%" "%filename%.Ecx" %user_password% -y >nul
ping localhost -n 2 >nul
gotoxy 30 11
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Removing Source file..
ping localhost -n 2 >nul
gotoxy 30 12
exo.exe /M:2:1 /C:0a /T:[*] /C:0b: /T:Finalizing Process...
echo.
cd ..
cd Resources
if exist "C:\Users\%username%\Desktop\Encrypted" goto existencdir
mkdir "C:\Users\%username%\Desktop\Encrypted"
goto existencdir
:existencdir
move /-y "%filename%.Ecx" "C:\Users\%username%\Desktop\Encrypted\"
cd ..
cd Resources
ping localhost -n 2 >nul
gotoxy.exe 30 12
exo /M:2:1 /C:0d /T:[*] /C:0b: /T:%filename% has been Encrypted
SystemTrayMessage "Encryption Finnished" /V:2 >nul
Call Button.bat  30 14 "Go Back" 30 18 "Exit" # Press
GetInput.exe  /m %Press% /h 0c
if %errorlevel%==1 (cls & goto Loop)
if %errorlevel%==2 (exit)
:keepsource
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Encrypting %filename%
swat.exe -e "%file%" "%filename%.Ecx" %user_password% -n >nul
ping localhost -n 2 >nul
gotoxy.exe 30 11
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Finalizing Process..
gotoxy.exe 30 12
cd ..
cd Resources
if exist "C:\Users\%username%\Desktop\Encrypted" goto existencdir
mkdir "C:\Users\%username%\Desktop\Encrypted"
goto existencdir
:existencdir
move /-y "%filename%.Ecx" "C:\Users\%username%\Desktop\Encrypted\"
cd ..
cd Resources
ping localhost -n 2 >nul
gotoxy.exe 30 13
exo /M:2:1 /C:0d /T:[*] /C:0b: /T:%filename% has been Encrypted
SystemTrayMessage "Encryption Finnished" /V:2 >nul
Call Button.bat  30 14 "Go Back" 30 18 "Exit" # Press
GetInput.exe  /m %Press% /h 0c
if %errorlevel%==1 (cls & goto Loop)
if %errorlevel%==2 (exit)
:: masking input ..taken from stackoverflow
:getPassword
set "_password="

:: We need a backspace to handle character removal
for /f %%a in ('"prompt;$H&for %%b in (0) do rem"') do set "BS=%%a"

:: Prompt the user 
set /p "=%~2" <nul 

:keyLoop
:: Retrieve a keypress
set "key="
for /f "delims=" %%a in ('xcopy /l /w "%~f0" "%~f0" 2^>nul') do if not defined key set "key=%%a"
set "key=%key:~-1%"

:: If No keypress (enter), then exit
:: If backspace, remove character from password and console
:: Otherwise, add a character to password and go ask for next one
if defined key (
    if "%key%"=="%BS%" (
        if defined _password (
            set "_password=%_password:~0,-1%"
            set /p "=!BS! !BS!"<nul
        )
    ) else (
        set "_password=%_password%%key%"
        set /p "="<nul
    )
    goto :keyLoop
)
echo/

:: Return password to caller
set "%~1=%_password%"
goto :eof

pause >nul
:Decryption
cls
type maml.lgo
gotoxy 69 5
exo /M:2:1 /C:0e /T:v /C:0b /T:1.1
echo.
exo /M:2:1 /C:0c /T:Written by:  /C:0b /T:Zeeshan azeem 
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
Call Button.bat  35 10 "Choose a File" 35 14 "Go Back" 35 18 "  Exit  " # Press
Getinput /m %Press% /h 0b
:: Check for the pressed button 
if %errorlevel%==1 (goto choosedecfile)
if %errorlevel%==2 (cls & goto Loop)
if %errorlevel%==3 (exit)
:choosedecfile
if exist "fitno.lg" goto existfitno
goto error
:existfitno
set /p fitno=<fitno.lg
if %fitno% == 0 goto showfitno
if %fitno% == 1 goto dontshowfitno
:showfitno
echo 1 >"fitno.lg"
MessageBox.exe "Before Selecting a file please note that files with whitespaces are not accepted so rename a file containing whitespaces to avoid any malfunction." " First Time Notification" >nul
goto dontshowfitno
:dontshowfitno
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 69 6
exo /M:2:1 /C:0e /T:v /C:0b /T:1.1
gotoxy 1 7
exo /M:2:1 /C:0f /T:INFO:
gotoxy 1 8
exo /M:2:1 /C:0e /T:--------^>:
set File="%file%"
FOR %%i IN ("%File%") DO (
set filedrive=%%~di
set filepath=%%~pi
set fileextension=%%~xi
set filename=%%~ni
)
gotoxy 1 9
exo /M:2:1 /C:0e /T:Drive: /C:0d /T:%filedrive%
gotoxy 1 10
exo /M:2:1 /C:0e /T:File Path: /C:0d /T:%filepath%
gotoxy 1 11
exo /M:2:1 /C:0e /T:File Extension: /C:0d /T:%fileextension%
gotoxy 11 8
exo /M:2:1 /C:0e /T:File Name: /C:0d /T:%filename%
gotoxy 1 12
set/p extension=Please type in the extension to Decrypt(i.e:exe,txt)
gotoxy 1 13
exo /M:2:1 /C:0f /T: ----------------/C:0c /T:-------------/C:0d /T:----------------/C:0e /T:--------------/C:0b /T:-------------/C:0c /T:------------------


Call Button.bat  35 15 "Continue" 35 19 "Go Back" 35 24 "  Exit  " # Press
Getinput /m %Press% /h 0b
if %errorlevel%==1 (goto continue)
if %errorlevel%==2 (cls & goto Loop)
if %errorlevel%==3 (exit)
:continue
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 1 7
exo /M:2:1 /C:0f /T: ----------------/C:0c /T:-------------/C:0d /T:----------------/C:0e /T:--------------/C:0b /T:-------------/C:0c /T:------------------
gotoxy 1 8
type rescd.rs
gotoxy.exe 30 19
call :getPassword user_password "Enter password here: "
:: The user's password has been stored in the variable %user_password%
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0c /T:CONFIRMATION:
gotoxy 30 11
exo /M:2:1 /C:0c /T:Do you want to keep the source file
Call Button.bat  35 13 "Yes" 43 13 "No" # Press
Getinput /m %Press% /h 0c
if %errorlevel%==1 (goto keepsource)
if %errorlevel%==2 (cls & dontkeepsource)
:dontkeepsource
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Decrypting %filename%
swat.exe -d "%file%" "%filename%.%extension%" %user_password% -y >nul
ping localhost -n 2 >nul
gotoxy 30 11
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Removing Source file..
ping localhost -n 2 >nul
gotoxy 30 12
exo.exe /M:2:1 /C:0a /T:[*] /C:0b: /T:Finalizing Process...
echo.
cd ..
cd Resources
if exist "C:\Users\%username%\Desktop\Decrypted" goto existdecdir
mkdir "C:\Users\%username%\Desktop\Decrypted"
goto existdecdir
:existdecdir
move /-y "%filename%.%extension%" "C:\Users\%username%\Desktop\Decrypted\"
cd ..
cd Resources
ping localhost -n 2 >nul
gotoxy.exe 30 12
exo /M:2:1 /C:0d /T:[*] /C:0b: /T:%filename% has been Decrypted
SystemTrayMessage "Decryption Finnished" /V:2 >nul
Call Button.bat  30 14 "Go Back" 30 18 "Exit" # Press
GetInput.exe  /m %Press% /h 0c
if %errorlevel%==1 (cls & goto Loop)
if %errorlevel%==2 (exit)
:keepsource
cls
type maml.lgo
gotoxy 60 50
exo /M:2:1 /C:0b /T:(C)Copyright 2020 Ash Terminal
gotoxy 60 7
exo /M:2:1 /C:0c /T: Time: /C:0b /T: %dtStamp%
gotoxy 30 10
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Decrypting %filename%
swat.exe -d "%file%" "%filename%.%extension%" %user_password% -n >nul
ping localhost -n 2 >nul
gotoxy.exe 30 11
exo /M:2:1 /C:0a /T:[*] /C:0b: /T:Finalizing Process..
gotoxy.exe 30 12
cd ..
cd Resources
if exist "C:\Users\%username%\Desktop\Decrypted" goto existdecdir
mkdir "C:\Users\%username%\Desktop\Decrypted"
goto existdecdir
:existdecdir
move /-y "%filename%.%extension%" "C:\Users\%username%\Desktop\Decrypted\"
cd ..
cd Resources
ping localhost -n 2 >nul
gotoxy.exe 30 13
exo /M:2:1 /C:0d /T:[*] /C:0b: /T:%filename% has been Decrypted
SystemTrayMessage "Decryption Finnished" /V:2 >nul
Call Button.bat  30 14 "Go Back" 30 18 "Exit" # Press
GetInput.exe  /m %Press% /h 0c
if %errorlevel%==1 (cls & goto Loop)
if %errorlevel%==2 (exit)
:: masking input ..taken from stackoverflow
:getPassword
set "_password="

:: We need a backspace to handle character removal
for /f %%a in ('"prompt;$H&for %%b in (0) do rem"') do set "BS=%%a"

:: Prompt the user 
set /p "=%~2" <nul 

:keyLoop
:: Retrieve a keypress
set "key="
for /f "delims=" %%a in ('xcopy /l /w "%~f0" "%~f0" 2^>nul') do if not defined key set "key=%%a"
set "key=%key:~-1%"

:: If No keypress (enter), then exit
:: If backspace, remove character from password and console
:: Otherwise, add a character to password and go ask for next one
if defined key (
    if "%key%"=="%BS%" (
        if defined _password (
            set "_password=%_password:~0,-1%"
            set /p "=!BS! !BS!"<nul
        )
    ) else (
        set "_password=%_password%%key%"
        set /p "="<nul
    )
    goto :keyLoop
)
echo/

:: Return password to caller
set "%~1=%_password%"
goto :eof
pause >nul
goto Loop
:error
echo Dependencies couldn't be verified so Program has self stopped to prevent Malfunction..
pause >nul
exit






















































