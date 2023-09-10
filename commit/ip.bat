@echo off
echo 本机IP
ipconfig|find "IPv4"
echo.
echo 电脑名
hostname
pause>nul
exit