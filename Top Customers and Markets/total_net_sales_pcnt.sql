with cte1 as (SELECT c.customer,round(sum(net_sales)/1000000,2) as net_sales_mln FROM gdb041.net_sales n
JOIN dim_customer c
ON n.customer_code= c.customer_code
where fiscal_year= 2021
group by customer
order by net_sales_mln desc)
select *,net_sales_mln*100/sum(net_sales_mln) over()
as total_sales_mln_pct
from cte1 