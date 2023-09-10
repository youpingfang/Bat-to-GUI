@ECHO OFF 
ECHO [�ȴ������ֻ�...]
  adb wait-for-device
ECHO [��ȡ�ֻ���Ϣ]
ECHO -------------------------------
  adb shell cat /system/build.prop>%~dp0\phone.info
FOR /F "tokens=1,2 delims==" %%a in (phone.info) do (
  IF %%a == ro.build.version.release SET androidOS=%%b
  IF %%a == ro.product.model SET model=%%b
  IF %%a == ro.product.brand SET brand=%%b
  IF %%a == ro.build.id SET id=%%b
  IF %%a == ro.product.cpu.abi SET cpu=%%b
  IF %%a == ro.board.platform SET platform=%%b
  IF %%a == ro.product.manufacturer SET manufacturer=%%b
  IF %%a == ro.build.version.sdk SET sdk=%%b
  )
del /a/f/q %~dp0\phone.info
ECHO.
ECHO.�� �� Ʒ ��: %brand%
ECHO.�� �� �� ��: %model%
ECHO.��  ��   ��: %id%
ECHO.Android�汾: Android %androidOS%
ECHO.C P U �� ��: %cpu%
ECHO.S D K �� ��: %sdk%
ECHO.�� �� ƽ ̨: %platform%
ECHO.��  ��   ��: %manufacturer%
ECHO.-------------------------------

ECHO.�� �� Ʒ ��: %brand%>"%~dp0\result\Phone_%model%.txt"
ECHO.�� �� �� ��: %model%>>"%~dp0\result\Phone_%model%.txt"
ECHO.��  ��   ��: %id%>>"%~dp0\result\Phone_%model%.txt"
ECHO.Android�汾: Android %androidOS%>>"%~dp0\result\Phone_%model%.txt"
ECHO.CPU  ��  ��: %cpu%>>"%~dp0\result\Phone_%model%.txt"
ECHO.SDK  ��  ��: %sdk%>>"%~dp0\result\Phone_%model%.txt"
ECHO.�� �� ƽ ̨: %platform%>>"%~dp0\result\Phone_%model%.txt"
ECHO.��  ��   ��: %manufacturer%>>"%~dp0\result\Phone_%model%.txt"

ECHO [��ͣ15���Զ��ر�...]
  ping -n 50 127.0.0.1>nul
@ECHO ON