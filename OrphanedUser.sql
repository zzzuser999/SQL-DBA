-- https://www.sqlshack.com/how-to-discover-and-handle-orphaned-database-users-in-sql-server/

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

-- ######################################

exec sp_change_users_login @Action='Report' ;