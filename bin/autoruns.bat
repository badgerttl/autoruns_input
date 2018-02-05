@echo off
rem ***********************************************************************
rem This bat file runs Autorunc commandline for use with Splunk
rem -a *             Autostart entry selection for ALL
rem -ct              Print output as tab-delimited values
rem -h               Show file hashes
rem -s               Verify digital signatures.
rem -t               Show timestamps in normalized UTC (YYYYMMDD-hhmmss).
rem -vt              Query VirusTotal without terms prompt
rem ***********************************************************************

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT "%PROGRAMFILES%\SplunkUniversalForwarder\etc\apps\Splunk_TA_Autoruns\bin\windows_x86\autorunsc.exe" -a * -ct -h -s -t -vt user=* -nobanner

if %OS%==64BIT "%PROGRAMFILES%\SplunkUniversalForwarder\etc\apps\Splunk_TA_Autoruns\bin\windows_x86_64\autorunsc64.exe" -a * -ct -h -s -t -vt user=* -nobanner

set "OS="
