SELECT c.customer,round(sum(net_sales)/1000000,2) as net_sales_mln FROM gdb041.net_sales n
JOIN dim_customer c
ON n.customer_code= c.customer_code
where fiscal_year= 2021 and n.market= 'India'
group by customer
order by net_sales_mln desc
limit 5