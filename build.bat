@echo off
setlocal
cd /d "%~dp0"
if not defined GEODE_SDK (
 echo ERROR: GEODE_SDK is not set.
 echo Set GEODE_SDK to your Geode SDK folder.
 pause
 exit /b 1
)
if exist build rmdir /s /q build
cmake -B build -G "Visual Studio 17 2022" -A Win32
if errorlevel 1 goto fail
cmake --build build --config Release
if errorlevel 1 goto fail
echo.
echo BUILD SUCCEEDED.
pause
exit /b 0
:fail
echo.
echo BUILD FAILED. See the error above.
pause
exit /b 1
