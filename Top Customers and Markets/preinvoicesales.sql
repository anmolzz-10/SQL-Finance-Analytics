SELECT * FROM (
    SELECT 
        s.date, 
        s.product_code, 
        p.product, 
        p.variant, 
        s.sold_quantity, 
        g.gross_price AS gross_price_per_item,
        ROUND(s.sold_quantity * g.gross_price, 2) AS gross_price_total,
        pre.pre_invoice_discount_pct
    FROM fact_sales_monthly s
    JOIN dim_product p ON s.product_code = p.product_code
    JOIN fact_gross_price g ON g.fiscal_year = s.fiscal_year
                             AND g.product_code = s.product_code
    JOIN fact_pre_invoice_deductions pre ON pre.customer_code = s.customer_code 
                                         AND pre.fiscal_year = s.fiscal_year
    WHERE s.fiscal_year = 2021 
    ORDER BY s.date
    LIMIT 50000 OFFSET 0
) AS subquery;
