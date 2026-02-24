@echo off
color 0a
cls

set github_user=allaboutsubha
set /p repo_name="Enter GitHub Repository Name: "
set repo_url=https://github.com/%github_user%/%repo_name%.git

echo.
echo [STEP 0] Creating .gitignore to hide secrets...
:: এখানে আপনার সিক্রেট ফাইলের নামগুলো যোগ করুন (যেমন config.php বা .env)
(
echo .env
echo config.php
echo node_modules/
echo *.log
) > .gitignore
echo [OK] .gitignore created.

echo ---------------------------------------
echo Target URL: %repo_url%
echo Starting Git Operations...
echo ---------------------------------------

:: ১. Git Init
git init && echo [OK] git init Success

:: ২. Git Add (এখন এটি .gitignore মেনে ফাইল অ্যাড করবে)
git add . && echo [OK] Files added (Secrets ignored) Success

:: ৩. Git Commit
git commit -m "secure commit" && echo [OK] git commit Success

:: ৪. Git Branch
git branch -M main && echo [OK] git branch Success

:: ৫. Git Remote Add
git remote remove origin >nul 2>&1
git remote add origin %repo_url% && echo [OK] Remote URL Added Success

:: ৬. Git Push
git push -u origin main && echo [OK] Push to GitHub Success

echo ---------------------------------------
echo All tasks are completed!
echo ---------------------------------------
pause