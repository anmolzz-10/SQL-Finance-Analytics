SELECT market,round(sum(net_sales)/1000000,2) as net_sales_mln FROM gdb041.net_sales
where fiscal_year= 2021
group by market
order by net_sales_mln desc
limit 5