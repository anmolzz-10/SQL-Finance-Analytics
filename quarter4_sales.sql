SELECT * FROM fact_sales_monthly
WHERE get_fiscal_year(date)=2021 and 
	  get_quarter(date)="Q4"
order by date asc
limit 1000000