select c.market,sum(s.sold_quantity) from fact_sales_monthly s
JOIN dim_customer c ON
s.customer_code= c.customer_code
WHERE get_fiscal_year(date)= 2021 and c.market= 'Indonesia'
group by c.market