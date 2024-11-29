@echo off
cls


REM v1.0
REM Shutdown Timer, by kopa


SET hours=
SET minutes=
SET seconds=
SET total_seconds=

REM Display Zeros

SET hours_zero=
SET minutes_zero=
SET seconds_zero=
SET total_seconds_zero=
SET total_seconds_timer=

SET total_zeros_for_exit=0



:MainMenu
cls
echo Shutdown Timer v1.0 by kopa
echo -----------------------------
echo.
echo.
echo Set the timer:
echo ---------------
echo.




:InputHours
SET hours=
set /p hours=Hours: 
for /f "delims=0123456789" %%a in ("%hours%") do (
    echo Invalid input. Please enter numbers only.
	timeout /t 1 >nul 2>&1
	cls
	echo Shutdown Timer v1.0 by kopa
	echo -----------------------------
	echo.
	echo.
	echo Set the timer:
	echo ---------------
	echo.
    goto InputHours
)



:InputMinutes
SET minutes=
set /p minutes=Minutes: 
for /f "delims=0123456789" %%a in ("%minutes%") do (
    echo Invalid input. Please enter numbers only.
	timeout /t 1 >nul 2>&1
	cls
	echo Shutdown Timer v1.0 by kopa
	echo -----------------------------
	echo.
	echo.
	echo Set the timer:
	echo ---------------
	echo.
	echo Hours: %hours%
    goto InputMinutes
)



:InputSeconds
SET seconds=
set /p seconds=Seconds: 
for /f "delims=0123456789" %%a in ("%seconds%") do (
    echo Invalid input. Please enter numbers only.
	timeout /t 1 >nul 2>&1
	cls
	echo Shutdown Timer v1.0 by kopa
	echo -----------------------------
	echo.
	echo.
	echo Set the timer:
	echo ---------------
	echo.
	echo Hours: %hours%
	echo Minutes: %minutes%
    goto InputSeconds
)



:CheckForZero


REM Check Hours
if "%hours%"=="" (
    SET hours_zero=0
	set /a total_zeros_for_exit=%total_zeros_for_exit% + 1
) else (
	SET hours_zero=%hours%
)


REM Check Minutes
if "%minutes%"=="" (
    SET minutes_zero=0
	set /a total_zeros_for_exit=%total_zeros_for_exit% + 1
) else (
	SET minutes_zero=%minutes%
)


REM Check Seconds
if "%seconds%"=="" (
    SET seconds_zero=0
	set /a total_zeros_for_exit=%total_zeros_for_exit% + 1
) else (
	SET seconds_zero=%seconds%
)



:ExitCheckIfAllZero
if "%total_zeros_for_exit%"=="3" goto ExitProgram




:Calculation
set /a total_seconds=(hours*3600) + (minutes*60) + seconds
set /a total_seconds_timer=(hours*3600) + (minutes*60) + seconds - 4

goto ShutdownSetTimer


:ExitProgram
cls
echo Shutdown Timer v1.0 by kopa
echo -----------------------------
echo.
echo.
echo Set the timer:
echo ---------------
echo.
echo Hours: %hours%
echo Minutes: %minutes%
echo Seconds: %seconds%
echo.
echo.
echo.
echo No time was set. The program will now exit.
timeout /t 2 >nul 2>&1
exit /b



:ShutdownSetTimer


shutdown -s -t %total_seconds%



echo.
echo.
echo The timer has been set at %hours_zero% hours, %minutes_zero% minutes and %seconds_zero% seconds.
echo This PC will Shutdown in %total_seconds% seconds.
echo.
echo.
echo.
timeout /t 1 >nul 2>&1
echo You can press any key to exit.
timeout /t 2 >nul 2>&1
echo.
timeout /t %total_seconds_timer%
exit

