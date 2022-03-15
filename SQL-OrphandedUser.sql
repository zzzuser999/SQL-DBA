/* Reference: 
https://www.sqlshack.com/how-to-discover-and-handle-orphaned-database-users-in-sql-server/
*/

-- Finding orphaned USERS

USE [DBNAME]
GO

select p.name,p.sid
from sys.database_principals p
where p.type in ('G','S','U')
and p.sid not in (select sid from sys.server_principals)
and p.name not in (
    'dbo',
    'guest',
    'INFORMATION_SCHEMA',
    'sys',
    'MS_DataCollectorInternalUser'
) ;


-- Matching login with USER

EXEC dbo.sp_change_users_login 
@Action          = 'update_one', 
@UserNamePattern = 'ABBEpmTools_prod_reader', 
@LoginName       = 'ABBEpmTools_prod_reader';