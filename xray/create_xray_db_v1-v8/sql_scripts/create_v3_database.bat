@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined timestamp set timestamp=%%x
set dump_file=xray_dump_%timestamp:~0,14%.sql

echo.
echo about to backup current xray database ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump"  -uroot -pfmi-drooga -B xray > %dump_file%

echo.
echo creating 'xray' database v3 ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql"  -uroot -pfmi-drooga xray < ".\v3.sql"

echo.
echo press any key to exit ...
@pause > nul