select *
from sys.server_principals sp
left join sys.sql_logins sl
          on sp.principal_id = sl.principal_id
where sp.type not in ('G', 'R') and sp.name like '%GTT_ABBTools_reader%'
order by sp.name;