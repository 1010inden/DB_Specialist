select * from CUSTOMER_STORE(nolock)
select * from GET_ORDER(nolock)
select * from GET_ORDER_DETAIL(nolock)
select * from MANAGER (nolock)
select * from PRODUCT(nolock) 
select * from STOCK_PRODUCT(nolock) 
select * from STOCK_ROOM(nolock) 

/****************************1倉庫ごとの平均在庫個数を求める　ただしgroup byで集約しない**********************************/
select *,
avg(qty) over (partition by stock_room_code) as 'AVERAGE_STOCK_QTY'
from STOCK_PRODUCT(nolock)
order by stock_room_code

/*group byだとstock_room_codeの種類ごとの表示になり集約されてしまう*/
select stock_room_code,
avg(qty)
from STOCK_PRODUCT(nolock)
group by stock_room_code
order by stock_room_code


/*********************************************他の行の値を使う**************************************************/

--select *
--from GET_ORDER(nolock)
--inner join GET_ORDER_DETAIL(nolock)
--on GET_ORDER.ORDER_NUMBER  = GET_ORDER_DETAIL.ORDER_NUMBER


drop table if exists #temp
select CUSTOMER_CODE,ORDER_DATE,sum(QTY)as'TOTAL_SALES' 
into #temp
from GET_ORDER(nolock)
inner join GET_ORDER_DETAIL(nolock)
on GET_ORDER.ORDER_NUMBER  = GET_ORDER_DETAIL.ORDER_NUMBER
group by CUSTOMER_CODE,ORDER_DATE

--LAG関数で１行前の値を使用する
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
ISNULL(
LAG(TOTAL_SALES)over (partition by CUSTOMER_CODE order by ORDER_DATE),0
)as'BEFORE_SALES'
from #temp



/*********************************************他の行の値を使う**************************************************/
--消費者ごと、１注文ごとの注文個数ランキング　　RANK関数(DENSE_LANK）　　
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
RANK()over (partition by CUSTOMER_CODE order by TOTAL_SALES desc)as 'RANK'
from #temp

--他にCUME_DIST関数なら累積分布がNTITLE関数ならグループに順位がつけられる


--単純なナンバリングならROW_NUMBER
--partition by は省略可能　order byは省略不可
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
ROW_NUMBER()over (order by ORDER_DATE)as 'NUM'
from #temp
