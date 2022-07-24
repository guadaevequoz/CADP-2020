@echo off
SET THEFILE=c:\users\guada\desktop\facultad\primer~1\cadp20~1\practi~1\cinco\cincop~1.2\untitl~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\guada\desktop\facultad\primer~1\cadp20~1\practi~1\cinco\cincop~1.2\untitl~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
