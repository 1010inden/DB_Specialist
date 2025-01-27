

/*得意先*/

insert into customer_store values('00001','A商店','大阪市中央区','06-6311-8989','101')
insert into customer_store values('00002','B商店','大阪市福島区','06-6312-1278','102')
insert into customer_store values('00003','Cスーパー','大阪市北区','06-6313-4235','104')
insert into customer_store values('00004','Dスーパー','大阪市淀川区','06-6314-1235','106')
insert into customer_store values('00005','E商店','大阪市北区','06-6315-2389','101')
/*担当者*/
insert into manager values('101','三好泰之')
insert into manager values('102','山下伸吾')
insert into manager values('103','松田総')
insert into manager values('104','山本史郎')
insert into manager values('106','豊田久')
/*商品*/
insert into product values('00001','鉛筆','400')
insert into product  values('00002','ノート','200')
insert into product  values('00003','ふでばこ','800')
insert into product  values('00004','かばん','3000')
insert into product  values('00005','下敷き','150')
/*受注*/
insert into get_order  values('00001','20230704','000001')
insert into get_order  values('00007','20230705','000003')
insert into get_order  values('00011','20230706','000001')
insert into get_order  values('00012','20230706','000002')


/*受注明細*/
insert into get_order_detail  values('00001','01','00002','3')
insert into get_order_detail  values('00001','02','00003','2')
insert into get_order_detail  values('00001','03','00004','6')
insert into get_order_detail  values('00007','01','00002','4')
insert into get_order_detail  values('00007','02','00001','2')
insert into get_order_detail  values('00007','03','00003','8')
insert into get_order_detail  values('00007','04','0005','10')
insert into get_order_detail  values('00011','01','00004','12')
insert into get_order_detail  values('00011','02','00003','5')
insert into get_order_detail  values('00012','01','00001','7')
insert into get_order_detail  values('00012','02','00004','9')
insert into get_order_detail  values('00012','03','00005','10')

/*倉庫*/
insert into stock_room  values('201','茨城倉庫')
insert into stock_room  values('202','尼崎倉庫')
insert into stock_room  values('203','京都倉庫')


/*在庫*/
insert into STOCK_PRODUCT  values('201','00001','1000')
insert into STOCK_PRODUCT  values('201','00002','2000')
insert into STOCK_PRODUCT  values('201','00003','2000')
insert into STOCK_PRODUCT  values('201','00004','3000')
insert into STOCK_PRODUCT  values('201','00005','2000')
insert into STOCK_PRODUCT  values('202','00003','2900')
insert into STOCK_PRODUCT  values('202','00004','3200')
insert into STOCK_PRODUCT  values('202','00005','3500')
insert into STOCK_PRODUCT  values('203','00001','3800')
insert into STOCK_PRODUCT  values('203','00002','4100')
insert into STOCK_PRODUCT  values('203','00003','4400')
insert into STOCK_PRODUCT  values('203','00005','100')