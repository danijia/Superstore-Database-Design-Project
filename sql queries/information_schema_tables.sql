CREATE VIEW INFORMATION_SCHEMA_TABLES AS
    SELECT 'main'     AS TABLE_CATALOG,
           'sqlite'   AS TABLE_SCHEMA,
           tbl_name   AS TABLE_NAME,
           CASE WHEN type = 'table' THEN 'BASE TABLE'
                WHEN type = 'view'  THEN 'VIEW'
           END        AS TABLE_TYPE,
           sql        AS TABLE_SOURCE
    FROM   sqlite_master
    WHERE  type IN ('table', 'view')
           AND tbl_name NOT LIKE 'INFORMATION_SCHEMA_%'
    ORDER BY TABLE_TYPE, TABLE_NAME;
	
SELECT TABLE_SOURCE FROM INFORMATION_SCHEMA_TABLES where TABLE_NAME = 'customers';