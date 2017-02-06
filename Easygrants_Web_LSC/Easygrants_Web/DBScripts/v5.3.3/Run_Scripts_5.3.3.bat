rem set path=%path%;C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Binn;

set MSSQLSERVER_NAME=<<ENTER SERVER NAME HERE>>
set MSSQLSERVER_DBNAME=<<ENTER DATABASE NAME HERE>>

REM *****************************
REM EXECUTE	POST VERSION 5.3.3 UPGRADE SCRIPTS
REM *****************************

sqlcmd -S %MSSQLSERVER_NAME% -d %MSSQLSERVER_DBNAME% -i 01_Insert_a_STANDARD_FORM_RELATED_PAGE.sql
