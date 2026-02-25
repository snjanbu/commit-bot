@echo off
cd /d "%~dp0" || exit /b 1

for /f %%i in ('powershell -command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set info=Commit: %%i

echo %info%>> output.txt
echo %info%
echo.

for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set branch=%%i

git add output.txt
git commit -m "%info%"
git push origin %branch%