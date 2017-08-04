@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined timestamp set timestamp=%%x
set dump_file=xray_dump_%timestamp:~0,14%.sql

echo about to backup preciousa xray database ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump"  -h192.168.68.128 -uquilpole -pfmi-drooga -B xray > %dump_file%

echo.
echo press any key to exit ...
pause > nul
