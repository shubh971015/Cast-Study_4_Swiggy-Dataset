create database swiggy_database_cloudyml;
use swiggy_database_cloudyml;
CREATE TABLE swiggy(
   restaurant_no   INTEGER  NOT NULL 
  ,restaurant_name VARCHAR(50) NOT NULL
  ,city            VARCHAR(9) NOT NULL
  ,address         VARCHAR(204)
  ,rating          NUMERIC(3,1) NOT NULL
  ,cost_per_person INTEGER 
  ,cuisine         VARCHAR(49) NOT NULL
  ,restaurant_link VARCHAR(136) NOT NULL
  ,menu_category   VARCHAR(66)
  ,item            VARCHAR(188)
  ,price           VARCHAR(12) NOT NULL
  ,veg_or_nonveg   VARCHAR(7)
);
INSERT INTO swiggy (restaurant_no,restaurant_name,city,address,rating,cost_per_person,cuisine,restaurant_link,menu_category,item,price,veg_or_nonveg) 
VALUES (1,'Tandoor Hut','Bangalore','Tandoor Hut, 477, KHB Colony, 5th Block, Koramangala',4.3,300,'Biryani,Chinese','https://www.swiggy.com/restaurants/tandoor-hut-5th-block-koramangala-bangalore-1','Accompaniments','Roasted Papad','35','Veg');
select * from swiggy
limit 1000;

select city ,count(distinct restaurant_name) as count_restaurant from swiggy
group by city
order by count_restaurant desc
limit 1 ;
-- how many restaurant having rating 4.5..
select count(distinct restaurant_name)  from swiggy 
where rating > 4.5;

select count(distinct restaurant_name)
from swiggy
where restaurant_name like "%pizza%"
;

select cuisine,count(*) as count_cuisine from swiggy
group by cuisine
order by  count_cuisine desc
limit 5;
select * from swiggy  ;

select distinct restaurant_name , city,
menu_category, max(price) as highest_price
from swiggy
where menu_category='Recommended'
group by restaurant_name,menu_category
order by highest_price desc
;


select city ,round(avg(rating),2) from swiggy
group by city;
 
select * from swiggy limit 100;
select distinct restaurant_name, cost_per_person,cuisine
from swiggy
group by restaurant_name
having cuisine != 'indian'
order by cost_per_person  desc
limit 5 ;

select * from swiggy limit 100;
select distinct restaurant_name, cost_per_person as more_than_avg_cost_per_person
from swiggy 
where cost_per_person > (select avg(cost_per_person) from swiggy )
order by more_than_avg_cost_per_person desc
limit 10
;
select * from swiggy limit 1000;

select distinct restaurant_name , menu_category, count(item) as no_of_items from swiggy 
where menu_category= 'main course'
group by restaurant_name
order by count(item) desc
limit 1  ;

select distinct restaurant_name as alphabetical_order ,veg_or_nonveg
from swiggy
where veg_or_nonveg = 'veg'
order by restaurant_name asc
;
select * from swiggy limit 1000;
-- lowest avg price among all rest
select ceil(avg(price)) as avg_price ,  restaurant_name from swiggy 
group by restaurant_name
order by avg_price 
 limit 1;
 
select distinct restaurant_name,count(distinct menu_category) as no_of_menu
from swiggy
group by restaurant_name
order by no_of_menu desc
limit 5;
