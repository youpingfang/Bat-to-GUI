#!/bin/bash

echo "Git Commit and Push Script"

# 将更改添加到暂存区
git pull

git add .

# 提示用户输入提交消息
echo "Enter your commit message:"
read commit_message

# 执行提交操作
git commit -m "$commit_message"

# 推送更改到GitHub
git push origin master

echo "Git Commit and Push Complete"
