use restaurant_db;
select * from menu_items;
select * from order_details;
select * from menu_items
order by price desc; 

-- most expensive item is Shrimp Scampi

select * from menu_items
order by price asc;

-- least expensive item is Edamame

select * from menu_items
where category = 'Italian'
order by price asc;

-- least expensive Italian dishe is Spaghetti

select * from menu_items
where category = 'Italian'
order by price desc;

-- most expensive Italian dishe is Shrimp Scampi

select category, count(menu_item_id) from menu_items
group by category;

-- Total Number of dishes by category 
-- American 6
-- Asian 8
-- Mexican 9
-- Italian 9

select category, avg(price) from menu_items
group by category;

-- The average dish price within category 
-- American 10.06
-- Asian 13.47
-- Mexican 11.80
-- Italian 16.75

-- Objective 2

select min(order_date), max(order_date) from order_details;

-- Order date ranges from 2023-01-01 to 2023-03-31

select * from order_details;
select count(distinct order_id) from order_details;

-- Total orders made within date range = 5370

select count(*) from order_details;

-- Total items ordered = 12234

select order_id, count(item_id) as num_items 
from order_details
group by order_id
order by num_items desc;

-- order id 330 had the most number of items = 14

select count(*) from
(select order_id, count(item_id) as num_items 
from order_details
group by order_id
having num_items > 12) as number_of_orders;


-- Total orders with >12 items = 20

-- objective 3

select * from menu_items;
select * from order_details;

select * from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id;

select item_name, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases;

-- Least ordered item is Chicken Tacos, Category - Mexican

select item_name, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name
order by num_purchases desc;

-- most ordered item is Hamburger, CAtegory - American

select item_name, category, count(order_details_id) as num_purchases
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases desc;

select order_id, sum(price) as total_spend
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
limit 5;

-- The top orders
-- 440 - 192.15
-- 2075 - 191.05
-- 1957 - 190.10
-- 330 - 189.70
-- 2675 - 185.10

select * from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440;

select category from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

select category, count(item_id) as num_items
from order_details od left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category;

select * from order_details;
select category, price from menu_items
order by price desc




