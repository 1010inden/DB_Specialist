select * from CUSTOMER_STORE 
select * from GET_ORDER 
select * from GET_ORDER_DETAIL 
select * from MANAGER 
select * from PRODUCT 
select * from STOCK 
select * from STOCK_ROOM 

/*1�q�ɂ��Ƃ̕��ύ݌Ɍ������߂�@������group by�ŏW�񂵂Ȃ�*/
select *,
avg(qty) over (partition by stock_room_code) as '1�q�ɂ��Ƃ̕��ύ݌Ɍ�'
from stock 
order by stock_room_code

/*group by����stock_room_code�̎�ނ��Ƃ̕\���ɂȂ�W�񂳂�Ă��܂�*/
select stock_room_code,
avg(qty)
from stock 
group by stock_room_code
order by stock_room_code


