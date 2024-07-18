--drop database DB_SPECIALIST--Cannot drop database "DB_SPECIALIST" because it is currently in use.
--alter database DB_SPECIALIST

create database DATABASE_SPECIALIST
COLLATE Japanese_CI_AS;  --nvarcvharだけでなくこれを設定しないと漢字が？？になる


 -- Japanese_CI_ASは日本語用の照合順序です
--漢字が入りそうな属性はnvarchar
--なぜnvarchar(255)なのか
/*担当者*/
create table MANAGER(
MANAGER_CODE varchar(3) primary key,
MANAGER_NAME nvarchar(20)
)

/*得意先*/
create table CUSTOMER_STORE(
CUSTOMER_CODE varchar(6) primary key,
CUSTOMER_NAME nvarchar(20) not null,
ADRESS nvarchar(255),
PHONE_NUMBER varchar(13), 
    CONSTRAINT check_phone_number_format 
    CHECK (PHONE_NUMBER LIKE '[0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
	       PHONE_NUMBER LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
MANAGER_CODE varchar(3)not null,
 CONSTRAINT FK_MANAGER_CODE FOREIGN KEY (MANAGER_CODE)
    REFERENCES MANAGER(MANAGER_CODE)
	)





/*商品*/
create table PRODUCT(
PRODUCT_CODE varchar(5)primary key,
PRODUCT_NAME nvarchar(20),
PRICE int)

/*受注*/
create table GET_ORDER(  /*ORDERはMYSQｌの予約語*/
ORDER_NUMBER varchar(5)primary key,
ORDER_DATE varchar(8),
constraint check_date_format
check(ORDER_DATE like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CUSTOMER_CODE varchar(6)
)

/*受注明細*/
create table GET_ORDER_DETAIL(
ORDER_NUMBER varchar(5),
ROW int,
PRODUCT_CODE varchar(5),
QTY int,
primary key(ORDER_NUMBER,PRODUCT_CODE),
 CONSTRAINT FK_GET_ORDER FOREIGN KEY (ORDER_NUMBER)
    REFERENCES GET_ORDER(ORDER_NUMBER),
 CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY (PRODUCT_CODE)
    REFERENCES PRODUCT(PRODUCT_CODE),
)

/*倉庫*/
create table STOCK_ROOM(
STOCK_ROOM_CODE varchar(3) primary key,
STOCK_ROOM_NAME nvarchar(10) not null,
)


/*在庫*/
create table STOCK_PRODUCT(
STOCK_ROOM_CODE varchar(3),
PRODUCT_CODE varchar(5),
QTY int,
 CONSTRAINT FK_STOCK_ROOM_CODE_FOR_STOCK FOREIGN KEY (STOCK_ROOM_CODE)
    REFERENCES STOCK_ROOM(STOCK_ROOM_CODE),
 CONSTRAINT FK_PRODUCT_CODE_FOR_STOCK FOREIGN KEY (PRODUCT_CODE)
    REFERENCES PRODUCT(PRODUCT_CODE)
)

