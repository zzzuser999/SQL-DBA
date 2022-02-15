select sp.name as login,
       sp.type_desc as login_type,
       --sl.password_hash,
	   sp.default_database_name,
       sp.create_date,
       sp.modify_date,
       case when sp.is_disabled = 1 then 'Disabled'
            else 'Enabled' end as status
from sys.server_principals sp
left join sys.sql_logins sl
          on sp.principal_id = sl.principal_id
--where sp.type not in ('G', 'R')
where sp.type_desc like '%sql%' and sp.is_disabled = 0
order by sp.name;