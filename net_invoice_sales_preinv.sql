select *,(1-pre_invoice_discount_pct)*gross_price_total as net_invoice_sales from sales_preinv_discount