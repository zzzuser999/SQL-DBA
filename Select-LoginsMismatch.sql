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


SELECT dp.type_desc, dp.sid, dp.name AS user_name  
FROM sys.database_principals AS dp  
LEFT JOIN sys.server_principals AS sp  
    ON dp.sid = sp.sid  
WHERE sp.sid IS NULL  
    AND dp.authentication_type_desc = 'INSTANCE'; 

exec sp_change_users_login @Action='Report'

EXEC dbo.sp_change_users_login 'auto_fix', 'ea_prd_dbo';