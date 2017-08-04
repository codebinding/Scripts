@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined timestamp set timestamp=%%x
set dump_file=xray_dump_%timestamp:~0,14%.sql

echo.
echo about to backup current xray database ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump"  -h192.168.68.128 -uquilpole -pfmi-drooga -B xray > %dump_file%


echo about to drop preciousa xray database ...
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysql"  -h192.168.68.128 -uquilpole -pfmi-drooga < ".\drop_xray.sql"

pause
