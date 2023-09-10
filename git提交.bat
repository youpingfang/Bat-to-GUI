@echo off
echo --- Git Commit Script ---

REM 将更改添加到暂存区
git add .

REM 提示用户输入提交消息
set /p commit_message=Enter your commit message: 

REM 执行提交操作
git commit -m "%commit_message%"

REM 推送更改到GitHub
git push origin master

pause

echo --- Git Commit Complete ---

