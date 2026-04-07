SELECT * 
FROM sales_table;

-- Kui palju on toodete kaupa müüdud kogused?

SELECT product_id, SUM(Quantity)
FROM sales_table
GROUP BY product_id
ORDER BY product_id asc;

-- 10. TABELITE ÜHENDAMINE

-- 10.1. Kõik eelarveread eelarve tabelist ja nendega seotud müügiesindaja nimi müügiesindajate tabelist.
SELECT * 
FROM budget_table AS bt
LEFT JOIN sales_rep_table AS srt
ON BT.sales_rep_id = srt.sales_rep_id 
;

-- 10.3. Kõik müügiesindajad müügiesindajate tabelist ja nendega seotud eelarveread eelarve tabelist.
SELECT * 
FROM sales_rep_table AS srt
LEFT JOIN budget_table AS bt
ON BT.sales_rep_id = srt.sales_rep_id 
;

-- 10.4. Näita ainult ridu, millel on müügiesindaja nii eelarve tabelis kui ka väärtus müügiesindajate tabelis.
SELECT * 
FROM sales_rep_table AS srt
INNER JOIN budget_table AS bt
ON BT.sales_rep_id = srt.sales_rep_id 
;

-- 10.5. Näita kõiki ridu eelarve tabelist ja kõiki ridu müügiesindaja tabelist.
SELECT * 
FROM budget_table AS bt
FULL OUTER JOIN sales_rep_table AS srt
ON BT.sales_rep_id = srt.sales_rep_id 
;

-- 10.6. Näita ridu eelarve tabelist, millele pole müügiesindaja tabelis müügiesindajat kirjeldatud.
SELECT * 
FROM budget_table AS bt
LEFT JOIN sales_rep_table AS srt
ON BT.sales_rep_id = srt.sales_rep_id 
WHERE srt.sales_rep_id IS NULL
;

-- 10.7. Näita ridu müügiesindaja tabelist, millele pole kirjeldatud ridu eelarve tabelis.
SELECT * 
FROM sales_rep_table AS srt
LEFT JOIN budget_table AS bt
ON BT.sales_rep_id = srt.sales_rep_id 
WHERE bt.sales_rep_id IS NULL
;

-- 10.8. Näita müügiesindajaid, kellel on puudu eelarve või müügiesindaja tabelist rida.
SELECT bt.sales_rep_id, srt.sales_rep_id
FROM budget_table bt 
FULL OUTER JOIN sales_rep_table srt 
ON bt.sales_rep_id  = srt.sales_rep_id
WHERE bt.sales_rep_id IS NULL or srt.sales_rep_id  IS null ;

-- 10.9. Näita ridu müügitabelist, millel on olemas müügiesindaja info eelarve ja müügiesindaja tabelis.
SELECT * 
FROM sales_table AS st
LEFT JOIN sales_rep_table AS srt
LEFT JOIN budget_table AS bt
ON BT.sales_rep_id = srt.sales_rep_id 
ON st.sales_rep_id = srt.sales_rep_id
WHERE bt.sales_rep_id IS NOT NULL AND srt.sales_rep_id IS NOT NULL
;
