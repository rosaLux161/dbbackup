@echo off

echo Backup script for EDV Hauptmann database
echo Jan Luetzler, 2019
set backupname=db_%date:~-4%%date:~3,2%%date:~0,2%

set errorcode=0

:main
call :zip
call :logging
goto :end

:zip
%~dp07zcli\7za.exe a c:\backup_repdb\%backupname%.zip V:\*
set /a errorcode = %errorcode%
goto :eof

:logging
echo %date:~-4%_%date:~3,2%_%date:~0,2%__%time:~0,2%_%time:~3,2%_%time:~6,2% %db%: %errorcode% >> c:\backup_repdb\log.log
goto :eof

:end
exit
