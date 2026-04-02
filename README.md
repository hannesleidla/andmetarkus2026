Siin on andmetarkuse kursuse materjalid. 

# Sales Report 
You can find the Power BI file for Sales Report: https://github.com/virverani/andmetarkus2026/blob/main/SalesReport.pbix  
This file can be opened in Power BI Desktop.  
The goal of this report was to provide an overview of sales and profitability and analyze how profitability could be increased.

## Overview of Dataset 
This is an example dataset provided during a data analytics course. The dataset included 7 tables: 
<img width="816" height="753" alt="image" src="https://github.com/user-attachments/assets/34ee239a-6ffd-4a98-a1fd-cd8b9f562e50"/>

## Data Cleaning
The original table was "SalesTable.csv" which was controlled for data quality through PowerQuery.  
I checked for format issues and outliers and asked the author of the dataset if and how the outliers should be fixed. 
I created a new file "SalesTableCleaned.csv" with corrected data.

Errors found and fixes made:
1) CustomerID: C005 had only two sales, dataset owner gave the information that these should be C004.
2) ProductID: P005 and P006 had only few sales, dataset owner gave the information that these should be P004.
3) Quantity: Had a maximum value of 300 when all other sales were less than 10 units, dataset owner gave the information that this should be 3.
4) UnitPrice: Had a maximum value of 2000 when all other sales were less than 100 euros per unit, dataset owner gave the information that this should be 20.

## Analysis
I created pages for YTD Sales, Sales vs Budget and Profitability views by Product, Sales Representative and Region.  
During the analysis, I noticed that two products: Device D and Gadget C have lower profitability than other products:  
<img width="371" height="157" alt="image" src="https://github.com/user-attachments/assets/f59bc082-3798-4a28-9651-9e26e2f64010" />

I checked if this is caused by the cost of producing these products or by the discounts made. The analysis showed that the cause is cost of these products being higher than the other two products: 
<img width="512" height="123" alt="image" src="https://github.com/user-attachments/assets/1b243b4e-8eb4-4803-92a2-ba6146cc3312" />

## Recommendations
Based on the analysis, it is recommended to look over the pricing model as products that have an higher cost of producing are being sold at the same price as products with a lower cost of producing.  

# Employee Report

## Problem Statement
HR department wants an overview of active and left employees over time and results of the satisfaction survey. 

## Plan
I will create a Power BI report to give this overview. 

## Data
HR department gave me two files: 
- "Employee_Satisfaction_Survey.xlsx"
- "HR_Dataset.CSV"

### Data Cleaning
I checked data for uniqueness, formats and outliers through PowerQuery. 
Survey dataset didn't have a unique key column. I created a new column "AnswerKey" which combined "Question Round" and "Answer ID".  
In HR dataset, I removed columns with personal data: "First Name", "Last Name" and "Email". Also removed the column "Employment Status" as the data in that column was not up to date according to the HR department.  
Column "Salary" was changed to Decimal Number format.

