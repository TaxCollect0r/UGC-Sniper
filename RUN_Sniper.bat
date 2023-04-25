@echo off
setlocal enabledelayedexpansion

:menu
type logo.txt
echo Please select an option:
echo [1] - Run Sniper
echo [2] - Set up 
echo [3] - Add cookie
echo [4] - Clear cookie
echo [5] - Discord webhook
echo [6] - Help
set /p option="Option: "



if "%option%"=="1" (
    py main.py
) else if "%option%"=="2" (
    pip install colored
    pip install rich
    pip install requests
    pip install discord_webhook
    cls
    goto menu
) else if "%option%"=="3" (
    cls
    set /p cookie="Enter your cookie: "
    >>cookies.txt echo !cookie!
    echo Cookie !cookie! successfully added!
    pause
    cls
    goto menu
) else if "%option%"=="4" (
    type nul > cookies.txt
    echo Cleared all cookies
    pause
    cls
    goto menu
) else if "%option%"=="5" (
    cls
    set /p webhook="Do you want a Discord webhook?[y]/[n]: "
	if "%webhook%"=="y" (
        set /p webhook="Paste the webhook here: "
        type nul > webhook.txt
        >>webhook.txt echo !webhook!
		echo succesfully added webhook.
		pause
		cls
		goto menu
    ) if "%webhook%"=="n" (
        cls
        echo Webhook not added!
        set "webhook_enabled=false"
        goto update_config
    )
) else if "%option%"=="6" (
    start chrome https://docs.google.com/document/d/1VAqSW067-8OlexScBwje-HJcMn7vXJJM3WuRHE97-QU/edit
    goto menu
) else (
    cls
    echo Invalid option selected. Please try again.
    goto menu
)
