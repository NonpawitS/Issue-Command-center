@echo off
echo Starting Issue Command Center...

REM Start Python server in background
start /B py -m http.server 8765 2>nul

REM Wait a moment for server to start
timeout /t 2 /nobreak >nul

REM Open Chrome with CORS disabled (safe for internal use only)
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" ^
  --disable-web-security ^
  --user-data-dir="%TEMP%\chrome-icc-session" ^
  --allow-running-insecure-content ^
  "http://localhost:8765/Issue-Command-Center.html"

echo.
echo Dashboard opened at http://localhost:8765/Issue-Command-Center.html
echo NOTE: This Chrome window has CORS disabled for SharePoint fetch to work.
echo Close this window to stop the server.
pause
