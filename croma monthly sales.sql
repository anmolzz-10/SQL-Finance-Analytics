-- Month
-- total gross for that month for croma in india
select s.date,
sum(round((g.gross_price*s.sold_quantity),2)) as total_gross
FROM fact_sales_monthly s
JOIN fact_gross_price g 
ON
g.product_code= s.product_code and
g.fiscal_year = get_fiscal_year(s.date)
WHERE
customer_code = 90002002
GROUP BY s.date
order by date asc