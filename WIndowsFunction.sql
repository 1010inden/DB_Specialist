select * from CUSTOMER_STORE(nolock)
select * from GET_ORDER(nolock)
select * from GET_ORDER_DETAIL(nolock)
select * from MANAGER (nolock)
select * from PRODUCT(nolock) 
select * from STOCK_PRODUCT(nolock) 
select * from STOCK_ROOM(nolock) 

/****************************1�q�ɂ��Ƃ̕��ύ݌Ɍ������߂�@������group by�ŏW�񂵂Ȃ�**********************************/
select *,
avg(qty) over (partition by stock_room_code) as 'AVERAGE_STOCK_QTY'
from STOCK_PRODUCT(nolock)
order by stock_room_code

/*group by����stock_room_code�̎�ނ��Ƃ̕\���ɂȂ�W�񂳂�Ă��܂�*/
select stock_room_code,
avg(qty)
from STOCK_PRODUCT(nolock)
group by stock_room_code
order by stock_room_code


/*********************************************���̍s�̒l���g��**************************************************/

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

--LAG�֐��łP�s�O�̒l���g�p����
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
ISNULL(
LAG(TOTAL_SALES)over (partition by CUSTOMER_CODE order by ORDER_DATE),0
)as'BEFORE_SALES'
from #temp



/*********************************************���̍s�̒l���g��**************************************************/
--����҂��ƁA�P�������Ƃ̒����������L���O�@�@RANK�֐�(DENSE_LANK�j�@�@
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
RANK()over (partition by CUSTOMER_CODE order by TOTAL_SALES desc)as 'RANK'
from #temp

--����CUME_DIST�֐��Ȃ�ݐϕ��z��NTITLE�֐��Ȃ�O���[�v�ɏ��ʂ�������


--�P���ȃi���o�����O�Ȃ�ROW_NUMBER
--partition by �͏ȗ��\�@order by�͏ȗ��s��
select CUSTOMER_CODE,ORDER_DATE,TOTAL_SALES,
ROW_NUMBER()over (order by ORDER_DATE)as 'NUM'
from #temp
