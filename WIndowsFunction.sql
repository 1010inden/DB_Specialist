select * from CUSTOMER_STORE 
select * from GET_ORDER 
select * from GET_ORDER_DETAIL 
select * from MANAGER 
select * from PRODUCT 
select * from STOCK 
select * from STOCK_ROOM 

/*1倉庫ごとの平均在庫個数を求める　ただしgroup byで集約しない*/
select *,
avg(qty) over (partition by stock_room_code) as '1倉庫ごとの平均在庫個数'
from stock 
order by stock_room_code

/*group byだとstock_room_codeの種類ごとの表示になり集約されてしまう*/
select stock_room_code,
avg(qty)
from stock 
group by stock_room_code
order by stock_room_code


