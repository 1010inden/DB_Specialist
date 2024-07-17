
create database DB_SPECIALIST

/*íSìñé“*/
create table MANAGER(
MANAGER_CODE varchar(3) primary key,
MANAGER_NAME nvarchar(20)
)

/*ìæà”êÊ*/
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





/*è§ïi*/
create table PRODUCT(
PRODUCT_CODE varchar(5)primary key,
PRODUCT_NAME nvarchar(20),
PRICE int)

/*éÛíç*/
create table GET_ORDER(  /*ORDERÇÕMYSQÇåÇÃó\ñÒåÍ*/
ORDER_NUMBER varchar(5)primary key,
ORDER_DATE varchar(8),
constraint check_date_format
check(ORDER_DATE like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CUSTOMER_CODE varchar(6)
)

/*éÛíçñæç◊*/
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


/*ç›å…*/
create table STOCK(
STOCK_ROOM_CODE varchar(3),
PRODUCT_CODE varchar(5),
QTY int,
primary key(STOCK_ROOM_CODE,PRODUCT_CODE))

/*ëqå…*/
create table STOCK_ROOM(
STOCK_ROOM_CODE varchar(3) primary key,
STOCK_ROOM_NAME nvarchar(10) not null,
 CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY (STOCK_ROOM_CODE)
    REFERENCES STOCK(STOCK_ROOM_CODE)
)

