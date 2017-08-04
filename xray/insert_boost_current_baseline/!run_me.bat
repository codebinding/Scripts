@echo off
set version=$Id: !run_me.bat 15491 2016-03-16 18:28:51Z jiongboz $
echo %version%
echo *********************************************************
echo Are you running on CONSOLE PC ???
echo If yes, press ENTER to continue, else press CTRL+C to stop
echo *********************************************************
pause > nul

for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined timestamp set timestamp=%%x
set dump_file=xray_dump_%timestamp:~0,14%.sql

echo.
echo about to backup current xray database ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump"  -uroot -pfmi-drooga -B xray > %dump_file%
pause

echo.
echo about to insert boost current baseline ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql"  -uroot -pfmi-drooga < ".\insert_5176_2150_2251.sql"


echo.
echo before exit, please check whether there is any error message above.
echo.
echo old database has been backed up in %dump_file%
echo press any key to exit ...
pause > nul