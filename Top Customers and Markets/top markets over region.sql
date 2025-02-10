with cte1 as (select c.region,c.customer,round(sum(net_sales)/1000000,2) as net_sales_mln
from net_sales n JOIN dim_customer c ON
n.customer_code= c.customer_code
WHERE fiscal_year=2021
GROUP BY c.customer, c.region)
select *, net_sales_mln*100/sum(net_sales_mln) over(partition by region) as net_sales_pct_by_region
from cte1 order by net_sales_mln desc