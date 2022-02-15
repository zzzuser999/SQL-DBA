select
object_name(object_id) as OBJ_NAME, database_id, index_id, user_seeks,user_scans, user_lookups, user_updates, last_user_seek, last_user_scan, last_user_update
from
sys.dm_db_index_usage_stats
where
database_id = db_id(db_name())
Order by
dm_db_index_usage_stats.last_user_update desc