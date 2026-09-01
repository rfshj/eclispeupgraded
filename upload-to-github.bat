@echo off
cd /d "%~dp0"
git init
git config user.name "rfshj"
git config user.email "ajbuttner943@gmail.com"
git add .
git commit -m "EclipseMenu 5.9.0 build fixes" 2>nul
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/rfshj/eclispeupgraded
git push -u origin main --force
pause
