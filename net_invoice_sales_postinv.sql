select*,(1-pre_invoice_discount_pct)*gross_price_total 
as net_invoice_sales,(discounts_pct+other_deductions_pct) as total_post_invoice_deductions
from sales_preinv_discount s
JOIN fact_post_invoice_deductions po
ON po.date= s.date and 
po.customer_code=s.customer_code and
po.product_code=s.product_code