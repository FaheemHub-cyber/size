@echo off
setlocal

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Not a git repository.
    pause
    exit /b 1
)

set "MSG=%~1"
if "%MSG%"=="" set /p "MSG=Commit message (leave blank for timestamp): "
if "%MSG%"=="" set "MSG=Update %date% %time%"

git add -A
git commit -m "%MSG%"
if errorlevel 1 (
    echo Nothing to commit or commit failed.
    pause
    exit /b 1
)

git push
if errorlevel 1 (
    echo Push failed.
    pause
    exit /b 1
)

echo Done.
pause
