--外部キーの参照元となるテーブルから消していく
drop table MANAGER 
drop table  CUSTOMER_STORE 

drop table GET_ORDER_DETAIL 
drop table GET_ORDER 
drop table PRODUCT 

drop table STOCK 
drop table STOCK_ROOM 

--存在チェック
SELECT * FROM sys.tables WHERE name = 'MANAGER';
SELECT * FROM sys.tables WHERE name = 'CUSTOMER_STORE';
SELECT * FROM sys.tables WHERE name = 'GET_ORDER_DETAIL';
SELECT * FROM sys.tables WHERE name = 'GET_ORDER';
SELECT * FROM sys.tables WHERE name = 'PRODUCT';
SELECT * FROM sys.tables WHERE name = 'STOCK';
SELECT * FROM sys.tables WHERE name = 'STOCK_ROOM';

--データ
truncate table  CUSTOMER_STORE 
truncate table GET_ORDER 
truncate table GET_ORDER_DETAIL 
truncate table MANAGER 
truncate table PRODUCT 
truncate table STOCK 
truncate table STOCK_ROOM 


SELECT * FROM sys.tables WHERE name = 'MANAGER';

SELECT
    --USER_NAME(p.grantee_principal_id) AS Grantee,
    --dp.permission_name AS Permission,
    --p.state_desc AS State
	*
FROM sys.database_permissions AS dp
JOIN sys.database_principals AS p
    ON dp.grantee_principal_id = p.principal_id
WHERE p.name = USER_NAME();

GRANT DROP TABLE TO CONNECT;