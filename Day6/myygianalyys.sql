--‣1. Leia müügisummad toodete kaupa – toote ID ja müügisumma
SELECT product_id, SUM(sale_sum )
FROM sales_table
GROUP BY product_id
ORDER BY product_id asc;

--‣2. Leia müügisummad klientide kaupa – kliendi ID ja müügisumma
SELECT customer_id, SUM(sale_sum )
FROM sales_table
GROUP BY customer_id
ORDER BY customer_id asc;

--‣3. Leia müügisummad müügiesindajate kaupa – kliendiesindaja ID ja müügisumma
SELECT sales_rep_id, SUM(sale_sum )
FROM sales_table
GROUP BY sales_rep_id
ORDER BY sales_rep_id asc;

--‣4. Leia müügisummad aastate kaupa – aasta ja müügisumma

SELECT EXTRACT(YEAR FROM sale_date) AS year_extracted, SUM(sale_sum )
FROM sales_table
GROUP BY year_extracted
ORDER BY year_extracted asc;

--‣Alternatiivne

SELECT DATE_PART('year', sale_date) AS year_extracted, SUM(sale_sum )
FROM sales_table
GROUP BY year_extracted
ORDER BY year_extracted asc;

--‣5. Lisa müükidele müügisumma kategooriad
-- 1.Large Sale > 500
-- 2.Medium Sale <= 500 and >= 250
-- 3.Small Sale < 250

ALTER TABLE 
sales_table 
ADD COLUMN category VARCHAR;

select * from sales_table; 

UPDATE sales_table SET category = 
CASE 
	WHEN sale_sum > 500 THEN 'Large Sale'
	WHEN sale_sum BETWEEN 250 AND 500 THEN 'Medium Sale'
	ELSE 'Small Sale' END
;

--‣6. Leia müükide arv ja müügisumma müügisumma kategooriate kaupa - Müügisumma kategooria, müükide arv, müügisumma

SELECT category, COUNT(sale_id), SUM(sale_sum )
FROM sales_table
GROUP BY category
ORDER BY category asc;

--‣Alternatiivne lahendus oleks ajutise tabeli abil
WITH sales_per_category as (SELECT 
CASE 
	WHEN sale_sum > 500 THEN 'Large Sale'
	WHEN sale_sum BETWEEN 250 AND 500 THEN 'Medium Sale'
	ELSE 'Small Sale' 
	END AS category,
	COUNT (*) as nr_of_sales,
	SUM(sale_sum) as total_sum
	FROM sales_table
	GROUP BY category
	)



--‣7. Mida veel võiks leida? 
-- 7.1 Allahindlus müügimeeste lõikes võrrelduna firma keskmisega
	
SELECT sales_rep_id, AVG(discount) as avg_discount_per_salesrep,
	(SELECT AVG(discount) as avg_discount_in_company FROM sales_table), 
AVG(DISCOUNT) - (SELECT AVG(discount) AS avg_discount_in_company FROM sales_table) AS difference_from_company_average
FROM sales_table
GROUP BY sales_rep_id
ORDER BY sales_rep_id asc;