Select min(cost_of_product) from data_of_orders;
Select max(cost_of_product) from data_of_orders;
select count(cost_of_product) from data_of_orders;
Select avg(cost_of_product) from data_of_orders;
select sum(cost_of_product) from data_of_orders
where year_of_order=2016;
SELECT min(cost_of_product)FROM data_of_orders;

select * FROM data_of_orders
WHERE cost_of_product=(SELECT min(cost_of_product)FROM data_of_orders);


Select year_of_order, count(*) as Number_of_orders from data_of_orders
group by year_of_order;

select state, sum(revenue-opex) as net_profit 
from data_of_orders
where year_of_order=2016
group by state 
order by net_profit desc;


