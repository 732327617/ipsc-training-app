@echo off
echo Building IPSC Training App...

echo Creating www directory...
mkdir www 2>NUL

echo Copying index.html to www...
copy index.html www\index.html

echo Building Android APK...
cd android
gradlew.bat assembleRelease

if %ERRORLEVEL% equ 0 (
    echo Build successful!
    echo APK location: app\build\outputs\apk\release\app-release.apk
) else (
    echo Build failed!
)

cd ..
