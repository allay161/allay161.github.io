@echo off
chcp 65001 >nul

set /p title=请输入笔记标题（例如：计组第二章）:
set /p subject=请输入科目代码（例如：computers）:

:: 用 PowerShell 获取标准日期
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set date=%%i

set filename=_posts/%date%-%title%.md

if exist "%filename%" (
    echo ⚠️ 文件已存在：%filename%
) else (
    (
        echo ---
        echo layout: post
        echo title: "%title%"
        echo date: %date%
        echo subject: %subject%
        echo categories: 课程笔记
        echo ---
        echo.
        echo 在这里开始写你的笔记...
    ) > "%filename%"
)

notepad "%filename%"

echo.
echo 笔记保存后，按任意键上传到 GitHub...
pause >nul

git add .
git commit -m "添加笔记：%title%"
git pull origin main --rebase
git push

echo ✅ 上传完成！
pause