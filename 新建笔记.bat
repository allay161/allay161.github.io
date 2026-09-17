@echo off
chcp 65001 >nul

:: 询问笔记标题
set /p title=请输入笔记标题（例如：计组第二章）:
set /p subject=请输入科目代码（例如：computers）:

:: 获取今天的日期
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set datetime=%%a
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%

:: 拼接文件名
set filename=_posts/%year%-%month%-%day%-%title%.md

:: 创建文件并写入头部信息
(
echo ---
echo layout: post
echo title: "%title%"
echo date: %year%-%month%-%day%
echo subject: %subject%
echo categories: 课程笔记
echo ---
echo.
echo 在这里开始写你的笔记...
) > "%filename%"

:: 用记事本打开这个文件
notepad "%filename%"

:: 等待你写完后，自动提交
echo.
echo 笔记写完后，按任意键上传到 GitHub...
pause >nul

git add .
git commit -m "添加笔记：%title%"
git push

echo.
echo 上传完成！1-2分钟后访问网站查看。
pause