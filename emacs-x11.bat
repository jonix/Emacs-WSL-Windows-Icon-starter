@echo off
set VCSX="C:\Program Files\VcXsrv\vcxsrv.exe"
echo Detekterar körande X11 server: %VCSX% > info.log
tasklist | find /I "vcxsrv.exe" >nul
if errorlevel 1 (
    echo Starting VcXsrv... >> info.log
    start "" %VCSX% :0 -multiwindow -clipboard -wgl -ac
    timeout /t 2 >nul
) else (
    echo VcXsrv already running >> info.log
)

echo Starting Emacs in WSL... >> info.log
wsl -d Ubuntu /bin/bash -c "unset WAYLAND_DISPLAY ; export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0 ; emacs"
