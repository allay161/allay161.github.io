@echo off
chcp 65001 >nul

git pull origin main --rebase
git add .
git commit -m "更新笔记 %date% %time%"
git push

echo ✅ 上传完成！1-2分钟后访问网站查看。
pause