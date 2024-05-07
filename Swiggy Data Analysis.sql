select * from swiggy
#1
select count(distinct restaurant_name) as high_rated_restaurants
from swiggy where rating>4.5;
#2
select city,count(distinct restaurant_name) as restaurant_count from swiggy
group by city
order by restaurant_count desc
limit 1
#3
select count(distinct restaurant_name) as pizza_restaurants from swiggy
where restaurant_name like'%pizza%'
#4
select cuisine,count(*) as cuisine_count from swiggy 
group by cuisine 
order by cuisine_count desc  limit 1
#5
select city,round(avg(rating),2)as average_rating from swiggy 
group by city
#6
select distinct restaurant_name,menu_category, max(price) as highestprice
from swiggy where menu_category='Recommended'
group by restaurant_name,menu_category 
#7
select distinct restaurant_name,cost_per_person from swiggy 
where cuisine<>'Indian' 
order by cost_per_person desc limit 5
#8
select distinct restaurant_name,cost_per_person from swiggy 
where cost_per_person>(select avg(cost_per_person) from swiggy)
#9
select distinct t1.restaurant_name,t1.city,t2.city from swiggy t1 join swiggy t2
on t1.restaurant_name=t2.restaurant_name and t1.city<>t2.city
#10
select distinct restaurant_name,menu_category,count(item) as no_of_items from swiggy
where menu_category='Main Course'
group by restaurant_name,menu_category
order by no_of_items desc limit 1
#11
select distinct restaurant_name,
(count(case when veg_or_non-veg='Veg' then 1 end)*100/count(*)) as vegetarian_percentage
from swiggy
group by restaurant_name
having vegetarian_percentage=100.00 
order by restaurant_name
#12
select distinct restaurant_name,avg(price) as average_price from swiggy
group by restaurant_name
order by average_price desc limit 1
#13
select distinct restaurant_name,
count(distinct menu_category) as no_of_category
from swiggy
group by restaurant_name
order by no_of_category desc limit 5
#14
select distinct restaurant_name,
count(case when veg_or_nonveg='Non-veg' then 1 end)*100/
count(*) as nonvegetarian_percentage
from swiggy 
group by restaurant_name
order by restaurant_name desc limit 1

