-- Month
-- Product Name
-- Variant
-- Sold Quantity
-- Gross Price per Item
-- Gross Price Total
select s.date,s.product_code,p.product,p.variant,s.sold_quantity,g.gross_price,
round((g.gross_price*s.sold_quantity),2) as total_gross
from fact_sales_monthly s JOIN dim_product p
ON s.product_code= p.product_code
JOIN fact_gross_price g ON
s.product_code= g.product_code and
g.fiscal_year = get_fiscal_year(s.date)
WHERE
customer_code = 90002002 and
get_fiscal_year(date) =2021 
order by date asc
LIMIT 1000000
