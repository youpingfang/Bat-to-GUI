@ECHO OFF
ECHO.[�����ֻ�����]
ECHO.-------------------------------
ECHO.[Exce ] �ֻ�����
adb shell screencap -p /sdcard/screen.png
ECHO.[Tips ] ��������ͼƬ������
adb pull /sdcard/screen.png "%~dp0\ScreenShot\screen.png"

REM ������ͼĿ¼����������ڣ�
IF NOT EXIST "%~dp0\ScreenShot" (
    mkdir "%~dp0\ScreenShot"
)

ren ScreenShot\screen.png "%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.png"
ECHO.[Tips] δɾ���ն�screen.png�ļ�
::adb shell rm /sdcard/screen.png �������ڽ�ͼ��ɾ���ն˵�ͼƬ�ļ�����
ECHO.[�򿪽�ͼĿ¼]
explorer "%cd%\ScreenShot"
ECHO [��ͣ3���Զ��ر�...]
ping -n 3 127.0.0.1>nul
@ECHO ON

