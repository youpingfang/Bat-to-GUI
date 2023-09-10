@ECHO OFF
ECHO.[快速手机截屏]
ECHO.-------------------------------
ECHO.[Exce ] 手机截屏
adb shell screencap -p /sdcard/screen.png
ECHO.[Tips ] 拷贝截屏图片至电脑
adb pull /sdcard/screen.png "%~dp0\ScreenShot\screen.png"

REM 创建截图目录（如果不存在）
IF NOT EXIST "%~dp0\ScreenShot" (
    mkdir "%~dp0\ScreenShot"
)

ren ScreenShot\screen.png "%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.png"
ECHO.[Tips] 未删除终端screen.png文件
::adb shell rm /sdcard/screen.png （若需在截图后删除终端的图片文件，则）
ECHO.[打开截图目录]
explorer "%cd%\ScreenShot"
ECHO [暂停3秒自动关闭...]
ping -n 3 127.0.0.1>nul
@ECHO ON

