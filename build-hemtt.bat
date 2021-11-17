@echo off
set BIOUTPUT=1

if exist a3 (
  rmdir a3
)
mklink /j a3 include\a3

mkdir x
mkdir x\
if exist x\\addons (
  rmdir x\\addons
)
mklink /j x\\addons addons

tools\hemtt build --force --release
set BUILD_STATUS=%errorlevel%

rmdir a3
rmdir x\\addons
rmdir x\
rmdir x

if %BUILD_STATUS% neq 0 (
  echo Build failed
  exit /b %errorlevel%
) else (
  echo Build successful
  EXIT
)
