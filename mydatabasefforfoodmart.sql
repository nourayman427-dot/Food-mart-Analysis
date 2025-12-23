create table Calendars (
date date  primary key not null ,
year int,
month varchar(50),
quarter varchar(50),
day varchar(50))




create table Calendarr_stg (
date varchar(50),
year varchar(50),
month varchar(50),
quarter varchar(50),
day varchar(50))

bulk INSERT Calendarr_stg
FROM 'C:\Users\HP\Desktop\Calendar..csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')


create table Customer(
customer_id int primary key ,
customer_name varchar(100),
customer_adress varchar(100),
country varchar(100),
city varchar(100),
birthdate date ,
martial_status varchar(100),
income_per_year varchar(100),
total_children varchar(100),
gender varchar(50),
education varchar(50),
acc_open_date date,
member_Card varchar(50),
occupation varchar(50),
homeoner varchar(100))



create table Customer_stg(
customer_id varchar(50) ,
customer_name varchar(100),
customer_adress varchar(100),
country varchar(100),
city varchar(100),
birthdate varchar(50) ,
martial_status varchar(50),
income_per_year varchar(50),
total_children varchar(50),
gender varchar(50),
education varchar(50),
acc_open_date varchar(50),
member_Card varchar(50),
occupation varchar(50),
homeoner varchar(50))

bulk insert Customer_stg from 'C:\Users\HP\Downloads\Customers.csv' 
with ( 
firstrow=5 , fieldterminator=',' , rowterminator='\n' )


create table Product(
product_id int primary key ,
product_name varchar(50),
brand  varchar(50),
retail_price float,
cost_price float,
weight float ,
recycable varchar(50),
low_fat varchar(50))

create table Product_stg(
product_id varchar(50) ,
product_name varchar(50),
brand  varchar(50),
retail_price varchar(50),
cost_price varchar(50),
weight varchar(50) ,
recycable varchar(50),
low_fat varchar(50))

bulk insert Product_stg from 'C:\Users\HP\Downloads\Productts.csv' 
with ( 
firstrow=3 , fieldterminator=',' , rowterminator='\n' )

select * from Product_stg


create table Regions(
region_id int primary key ,
sales_district varchar(100),
sales_region  varchar(50))

create table Regions_Stg(
region_id varchar(50),
sales_district varchar(100),
sales_region  varchar(50))

BULK INSERT Regions
FROM 'C:\Users\HP\Downloads\Region.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')

select * from Regions_stg 


create table Store (
store_id int primary key ,
region_id int ,
store_type varchar(50),
store_name varchar(50),
adress varchar(50),
city varchar(50),
state varchar(50),
country varchar(50),
first_open_date date,
last_remodel_date date ,
total_sqft int, 
grocery_sqft int ,
foreign key (region_id ) REFERENCES Regions(region_id))

create table Store_stg (
store_id varchar(50) ,
region_id varchar(50),
store_type varchar(50),
store_name varchar(50),
adress varchar(50),
city varchar(50),
state varchar(50),
country varchar(50),
first_open_date varchar(50) ,
last_remodel_date varchar(50)  ,
total_sqft varchar(50) , 
grocery_sqft varchar(50))


BULK INSERT Store_stg 
FROM 'C:\Users\HP\Downloads\Stores.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')


create table Returns (
Return_date date ,
product_id int ,
store_id int  ,
quantity int,
foreign key (product_id ) REFERENCES Product(product_id),
foreign key (store_id) REFERENCES Store(store_id))



create table Returns_stg (
Return_date varchar(50) ,
product_id varchar(50) ,
store_id varchar(50)  ,
quantity varchar(50))

BULK INSERT Returns_Stg
FROM 'C:\Users\HP\Downloads\Returns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')

    BULK INSERT Returns
FROM 'C:\Users\HP\Downloads\Returns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')




create table sale_2017(
transaction_date date,
stock_date date,
product_id int,
customer_id int,
store_id int, 
quantity int,
foreign key (product_id) REFERENCES Product(product_id),
foreign key (store_id) REFERENCES Store(store_id),
foreign key (customer_id) REFERENCES Customer(customer_id))


create table sale_2017_stg(
transaction_date varchar(50),
stock_date varchar(50),
product_id varchar(50),
customer_id varchar(50),
store_id varchar(50), 
quantity varchar(50))

BULK INSERT sale_2017
FROM 'C:\Users\HP\Downloads\Sales 2017.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')

select * from sale_2017_stg

create table sale_2018(
transaction_date date,
stock_date date,
product_id int,
customer_id int,
store_id int, 
quantity int,
foreign key (product_id) REFERENCES Product(product_id),
foreign key (store_id) REFERENCES Store(store_id),
foreign key (customer_id) REFERENCES Customer(customer_id))

create table sale_2018_stg(
transaction_date varchar(50),
stock_date varchar(50),
product_id varchar(50),
customer_id varchar(50),
store_id varchar(50), 
quantity varchar(50))

BULK INSERT sale_2018
FROM 'C:\Users\HP\Downloads\Sales 2018.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')


BULK INSERT sale_2018_Stg
FROM 'C:\Users\HP\Downloads\Sales 2018.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n')

--cleaning :
select * from  Customer_stg where customer_id is null

--checking for nulls 


select * from Calendarr_stg 

select * from Customer_stg where customer_id is null

select * from Product_stg
select * from Product_stg where product_id is null

select * from Regions_Stg
select * from Regions_Stg where region_id is null

select * from Store_stg where store_id is null

select * from Returns_stg where Return_date is null
select * from sale_2017_stg
select * from sale_2018_stg

--checking for duplicates 

select date ,month , year,  day, quarter, count(*) as duplicates from Calendarr_Stg
group by date, month, year, day , quarter
having count(*) >1

with cte as ( select row_number() over(partition by date, month , year,  day, quarter order by date ) as rn 
from Calendarr_stg )
delete from CTE where rn>1

select *  from Calendarr_stg

select product_id, count(*) as duplicates from Product_stg 
group by product_id having count(*) >1

select customer_id, count(*) as duplicates from Customer_stg
group by customer_id having count(*) >1

select store_id ,count(*) as duplicates from  Store_stg 
group by store_id having count(*) >1

select region_id , count (*) as duplicates from Regions_stg 
group by region_id having count(*) >1

 select Return_date, store_id, product_id , quantity, count(*) as duplicates from Returns_stg
group by Return_date, store_id, product_id , quantity having count(*) >1


select Return_date, store_id, product_id , quantity, count(*) as duplicates from Returns
group by Return_date, store_id, product_id , quantity having count(*) >1


select transaction_date, customer_id,store_id, product_id, quantity,  count(*) as duplicates  from sale_2017_stg
group by transaction_date, customer_id,store_id, product_id , quantity having count(*)>1 


--sale_2017_stg having duplicates 
with CTE as (select row_number()
over( partition by transaction_date, customer_id,store_id, product_id, quantity order by transaction_date) as rn 
from  sale_2017_stg ) 
delete from CTE where rn>1

with CTE as (select row_number()
over( partition by transaction_date, customer_id,store_id, product_id, quantity order by transaction_date) as rn 
from  sale_2017 ) 
delete from CTE where rn>1

select transaction_date, customer_id,store_id, product_id, quantity,  count(*) as duplicates  from sale_2018_stg
group by transaction_date, customer_id,store_id, product_id , quantity having count(*)>1 

with CTE as (select row_number()
over( partition by transaction_date, customer_id,store_id, product_id, quantity order by transaction_date) as rn 
from  sale_2018_stg ) 
delete from CTE where rn>1

with CTE as (select row_number()
over( partition by transaction_date, customer_id,store_id, product_id, quantity order by transaction_date) as rn 
from  sale_2018) 
delete from CTE where rn>1



create view Sales as ( 
select transaction_date, customer_id,store_id, product_id , quantity ,stock_date from sale_2017
union  
 select transaction_date, customer_id,store_id, product_id , quantity ,stock_date from sale_2018 )

 select * from Sales


  --changing data types 
select distinct top 10 date from Calendarr_stg

SELECT date, TRY_CONVERT(date, date, 101) AS Date_new FROM Calendarr_stg;

ALTER TABLE Calendarr_stg ADD Date_new date;
UPDATE Calendarr_stg SET date = TRY_CONVERT(date, date, 101)


select * from Calendars
select * from Calendarr_stg

insert into Calendars ( date, year, month, quarter, day )
select  date,year, month, quarter, day from Calendarr_stg

alter table Calenadarr_stg add date int 
select * from Calendars


update Customer_stg set birthdate = TRY_Convert( date,birthdate, 101) 
update Customer_stg set acc_open_date = TRY_Convert( date,acc_open_date, 101) 



insert into Customer ( customer_id, customer_name ,customer_adress ,country ,city, birthdate, martial_status,
income_per_year , total_children ,gender ,education ,acc_open_date, member_Card, occupation ,homeoner )
select  customer_id, customer_name ,customer_adress ,country ,city,  birthdate, martial_status,
income_per_year , total_children ,gender ,education ,acc_open_date, member_Card, occupation ,homeoner 
from Customer_stg



insert into Product( product_id , product_name ,brand  ,retail_price , cost_price ,weight ,recycable ,low_fat )
select * from Product_stg

insert into Regions(region_id,sales_district, sales_region) 
select * from Regions_Stg

insert into Store (
store_id , region_id, store_type, store_name, adress, city, state,
country, first_open_date, last_remodel_date, total_sqft, grocery_sqft)
select * from Store_stg

insert into sale_2017( transaction_date, customer_id,store_id, product_id, quantity, stock_date )
select transaction_date, customer_id,store_id, product_id, quantity, stock_date from sale_2017_stg
where customer_id in (select customer_id from Customer) and product_id in( select product_id from Product) 
and store_id in( select store_id from Store)

insert into sale_2018( transaction_date, customer_id,store_id, product_id, quantity, stock_date )
select transaction_date, customer_id,store_id, product_id, quantity, stock_date from sale_2018_stg
where customer_id in (select customer_id from Customer) and product_id in( select product_id from Product)
and store_id in( select store_id from Store)

 select * from Calendars


 --data validation
 select count(*) from Calendars
 select count(*) from Calendarr_stg

 select count(*) from Product
 select count(*) from Product_stg

 select count(*) from Customer
 select count(*) from Customer_stg

 select count(*) from Regions
 select count(*) from Regions_Stg

 select count(*) from Store
 select count(*) from Store_stg

 select count(*) from Returns
 select count(*) from Returns_stg


  select count(*) from sale_2017
 select count(*) from sale_2017_stg

   select count(*) from sale_2018
 select count(*) from sale_2018_stg

 ------

 create  or alter view Store_analysis as 
 select  Returns.Return_date, Returns.store_id, Returns.quantity, Regions.sales_district, Regions.sales_region , Store.store_name from Returns join 
Store on Returns.store_id = Store.store_id 
join Regions on Store.region_id =Regions.region_id

create view soldProducts as 
select Product.product_id, Product.brand, Product.product_name, Sales.quantity, Product.retail_price
from Product full join Sales 
on Product.product_id = Sales.product_id


create view returns_analysis as
select Returns.product_id, Product.product_name ,Returns.quantity,Product.retail_price, (Product.retail_price*Returns.quantity) as Returned_Value 
from Returns join Product 
on Returns.product_id=Product.product_id

select sum(returns_analysis.quantity) from returns_analysis

create or alter view Sales_by_place as 
select Regions.sales_region, (Product.retail_price*Sales.quantity) as Sales_value, Regions.sales_district ,store.country, store.store_id, store.store_type
  from Regions join Store on Regions.region_id= Store.region_id
join sales on Store.store_id = sales.store_id
join Product on sales.product_id=PRODUCT.product_id


create or alter view Returning_demographic_analysis as
select Returns.quantity as returned_quantity, Store.country, Store.region_id, Regions.sales_region, Store.store_type, Returns.Return_date
from Returns join Store
on Returns.store_id =Store.store_id
join Regions 
on Store.region_id= Regions.region_id

select * from Returning_demographic_analysis

create  or alter view transactions as 
select Customer.customer_id, Sales.store_id, Product.product_id,( sales.quantity*Product.retail_price )as sales, Product.product_name, Sales.transaction_date, Customer.income_per_year, Customer.member_Card
from Product join sales on Product.product_id= Sales.product_id 
join Customer on sales.customer_id= Customer.customer_id

select * from transactions

create  or alter view return_per_customers as
select Customer.customer_id, Customer.income_per_year, Returns.quantity
from Customer join Sales on Customer.customer_id= Sales.customer_id
join Returns on Returns.product_id = sales.product_id



create view incomeBuckets_PER_region as 
select Customer.income_per_year, store.store_type, store.store_name
from Customer join Sales on Customer.customer_id = Sales.customer_id
join Store on sales.store_id= store.store_id
 
 select * from Customer

create or alter view transation_PEr_products as 
select Customer.customer_id , Sales.product_id, Sales.transaction_date , row_number() over(partition by Customer.customer_id order by transaction_date)
as transaction_id , Product.product_name
from Customer join Sales
on Customer.customer_id= Sales.customer_id 
join Product on sales.product_id = Product.product_id

select * from transation_PEr_products

create or alter view product_basket as
select transation_PEr_products.product_name, transation_PEr_products.customer_id , transation_PEr_products.transaction_id,
transation_PEr_products.transaction_date from transation_PEr_products 


create or alter view product_pair as
 select top 20  count(*) as frequency , product_basket.product_name as product_1 , transation_PEr_products.product_name as product_2
, product_basket.transaction_id
from product_basket join transation_PEr_products
on product_basket.transaction_id = transation_PEr_products.transaction_id and
product_basket.product_name> transation_PEr_products.product_name and product_basket.customer_id = transation_PEr_products.customer_id
group by  product_basket.product_name , transation_PEr_products.product_name, product_basket.transaction_id
having count(*) = 2
order by  frequency desc

select * from product_pair

create or alter view Frequent_product_sold as 
select  top 40 product_pair.frequency,  product_1, product_2,
Sales.quantity, Sales.store_id , Product.retail_price
from product_pair join transation_PEr_products on product_pair.transaction_id= transation_PEr_products.product_id
join sales on transation_PEr_products.product_id = sales.product_id
join Product on Sales.product_id= Product.product_id
group by  product_1, product_2 , product_pair.frequency, Sales.quantity,
sales.store_id, Product.retail_price
order by Sales.quantity desc 

select * from Frequent_product_sold
