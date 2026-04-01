siin on andmetarkuse kursuse materjalid

# Sales Report
You can find the Power BI file for Sales Report: https://github.com/virverani/andmetarkus2026/blob/main/SalesReport.pbix
This file can be opened in Power BI Desktop.
Next, the analysis steps are explained.

## Overview of Dataset
This is an example dataset created by OpenAI.

## Data Cleaning
The original table was "SalesTable.csv" which was controlled for data quality through PowerQuery.
I checked for format issues and outliers.

Fixes made:
1) CustomerID:
1) CustomerID: C005 peaks olema C004, muudetud alusfailis 31.03.2026 müügiesindaja sisendi põhjal
2) ProductID: P005 ja P006 peaks olema P004, muudetud alusfailis 31.03.2026 müügiesindaja sisendi põhjal
3) Vigane kogus müügireal S00009, oli 300, muudetud 3-ks puhastatud failis 31.03.2026 müügiesindaja sisendi põhjal
4) Vigane kogus müügireal S00010, oli 2000, muudetud 20-ks puhastatud failis 31.03.2026 müügiesindaja sisendi põhjal
