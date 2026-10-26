
# Retail Sales Performance & Profitability Analysis Using SQL

## Project Overview

This project analyzes retail sales data using PostgreSQL to identify revenue trends, profitability issues, product performance, regional differences, and customer purchasing patterns.

The analysis uses 9,994 records from the Sample Superstore dataset, covering 2014–2017.

The objective is to transform raw transactional data into actionable business insights that support pricing, product, and sales strategy decisions.

## Business Problem

A retail business may generate substantial sales revenue while experiencing low profitability in certain products, categories, or regions.

This project investigates:

- Which categories generate the highest revenue and profit?
- Why is Furniture less profitable than other categories?
- Which regions have the lowest profit margins?
- How does revenue change month by month?
- Which products generate the most revenue and losses?
- Are higher discounts associated with lower profitability?
- Which customer segments contribute the most profit?

## Tools & Technologies

- PostgreSQL 18
- pgAdmin 4
- SQL
- GitHub

### SQL Concepts Applied

- SELECT, WHERE, GROUP BY, ORDER BY
- COUNT, SUM, AVG, ROUND
- DISTINCT and HAVING
- CASE WHEN
- Common Table Expressions (CTEs)
- DATE_TRUNC and TO_DATE
- LAG and ROW_NUMBER
- Window functions with PARTITION BY
- NULLIF for safe division
- Data validation and type casting

## Dataset Information

**Dataset:** Sample Superstore

**Source:** Kaggle — add the exact dataset URL used.

**Records:** 9,994

**Period:** January 2014 – December 2017

**Geographical coverage:** United States

**Product categories:**
- Technology
- Office Supplies
- Furniture

**Customer segments:**
- Consumer
- Corporate
- Home Office

### Important Fields

| Field | Description |
|---|---|
| order_id | Unique order identifier |
| order_date | Order placement date |
| customer_id | Customer identifier |
| segment | Customer segment |
| region | Sales region |
| category | Product category |
| sub_category | Product subcategory |
| product_name | Product description |
| sales | Revenue generated |
| quantity | Units sold |
| discount | Discount applied |
| profit | Profit or loss |

The source data was imported into the PostgreSQL table `public.superstore_raw`.

## Data Validation

Initial validation was performed to assess data completeness and uniqueness.

| Validation Check | Result |
|---|---:|
| Total records | 9,994 |
| Unique row IDs | 9,994 |
| Duplicate row IDs | 0 |
| Missing order IDs | 0 |
| Missing sales values | 0 |
| Missing profit values | 0 |
| Missing regions | 0 |
| Missing order dates | 0 |
| Invalid date formats | 0 |

These checks confirmed that the tested fields were complete and that row IDs were unique.

Date format validation checked the expected MM/DD/YYYY pattern. Full calendar-validity and complete data-cleaning verification remain outside the confirmed checks.

### Revenue Reconciliation

Monthly aggregated totals were compared against the original dataset.

| Metric | Monthly Total | Raw Total |
|---|---:|---:|
| Revenue | $2,297,200.86 | $2,297,200.86 |
| Profit | $286,397.02 | $286,397.02 |

Both totals matched, confirming that the monthly aggregation preserved the recorded revenue and profit.

## Executive KPI Summary

| KPI | Value |
|---|---:|
| Total Sales Revenue | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Overall Profit Margin | 12.47% |
| Total Records | 9,994 |
| Period Analyzed | 2014–2017 |
| Highest-Revenue Category | Technology |
| Lowest-Margin Category | Furniture |
| Highest-Margin Region | West |
| Lowest-Margin Region | Central |

Profit Margin = (Total Profit / Total Revenue) × 100

---

# SQL Analysis & Business Insights

## 1. Category Revenue & Profitability

### Business Question

Which product categories generate the highest revenue and profit?

### Results

| Category | Revenue | Profit | Profit Margin |
|---|---:|---:|---:|
| Technology | $836,154.03 | $145,454.95 | 17.40% |
| Office Supplies | $719,047.03 | $122,490.80 | 17.04% |
| Furniture | $741,999.80 | $18,451.27 | 2.49% |

### Business Interpretation

**Observation:** Technology generates the highest revenue and profit. Furniture generates approximately $742K in revenue but only $18.5K in profit.

**KPI:** Furniture profit margin is 2.49%, compared with 17.40% for Technology.

**Business Issue:** Furniture contributes significant revenue but comparatively little profit.

**Next Investigation:** Examine Furniture subcategories, individual products, and discount patterns.

**Recommendation:** Prioritize Furniture profitability improvements instead of focusing exclusively on revenue growth.

### Furniture Subcategory Analysis

| Subcategory | Revenue | Profit | Margin | Avg. Discount |
|---|---:|---:|---:|---:|
| Tables | $206,965.53 | -$17,725.48 | -8.56% | 26.13% |
| Bookcases | $114,880.00 | -$3,472.56 | -3.02% | 21.11% |
| Furnishings | $91,705.16 | $13,059.14 | 14.24% | 13.83% |
| Chairs | $328,449.10 | $26,590.17 | 8.10% | 17.02% |

**Observation:** Tables and Bookcases are loss-making subcategories.

**KPI:** Tables recorded a loss of $17,725.48 and an average discount of 26.13%.

**Business Issue:** Loss-making subcategories reduce overall Furniture profitability.

**Next Investigation:** Examine transaction-level discounts, regions, and individual Table and Bookcase products.

**Recommendation:** Review pricing and promotional strategies for Tables and Bookcases, particularly products with recurring losses.

The relationship between discounts and losses requires further investigation before drawing causal conclusions.

---

## 2. Regional Sales Performance

### Business Question

Which regions generate the highest revenue and which have the lowest profitability?

### Results

| Region | Orders | Revenue | Profit | Margin |
|---|---:|---:|---:|---:|
| Central | 1,175 | $501,239.89 | $39,706.36 | 7.92% |
| South | 822 | $391,721.91 | $46,749.43 | 11.93% |
| East | 1,401 | $678,781.24 | $91,522.78 | 13.48% |
| West | 1,611 | $725,457.82 | $108,418.45 | 14.94% |

### Business Interpretation

**Observation:** West generates the highest revenue and profit. Central has the lowest profit margin.

**KPI:** West profit margin is 14.94%, while Central achieves only 7.92%.

**Business Issue:** Central generates substantial sales but has weaker profitability than the other regions.

**Next Investigation:** Analyze Central's product mix, state-level profitability, and discount patterns.

**Recommendation:** Prioritize Central for margin improvement analysis and compare its performance with the West region.

---

## 3. Monthly Revenue Trends

### Business Question

How does revenue change over time, and which months generate the highest sales?

### Validation

- 48 monthly periods analyzed
- 0 missing order dates
- 0 date-format mismatches
- Monthly revenue matches raw revenue
- Monthly profit matches raw profit

### Top 5 Revenue Months

| Month | Revenue | Profit |
|---|---:|---:|
| November 2017 | $118,447.83 | $9,690.10 |
| December 2016 | $96,999.04 | $17,885.31 |
| September 2017 | $87,866.65 | $10,991.56 |
| December 2017 | $83,829.32 | $8,483.35 |
| September 2014 | $81,777.35 | $8,328.10 |

### Business Interpretation

**Observation:** November 2017 recorded the highest monthly revenue at $118,447.83.

**KPI:** Peak monthly revenue was $118,447.83 across 48 months of data.

**Business Issue:** Monthly sales fluctuate, creating challenges for forecasting and operational planning.

**Next Investigation:** Compare the same months across different years to identify potential seasonal patterns.

**Recommendation:** Use historical sales trends to improve revenue forecasting, inventory planning, and promotional scheduling.

### Additional Finding

Although November 2017 had higher revenue, December 2016 generated greater profit.

This demonstrates that revenue growth does not always translate into higher profitability.

### SQL Techniques

- CTEs
- DATE_TRUNC
- TO_DATE
- LAG
- Window functions
- Month-over-month growth calculations

---

## 4. Product Performance & Ranking

### Business Question

Which products generate the highest revenue, and which products contribute the largest losses?

### Top 5 Revenue Products

| Product | Revenue | Profit |
|---|---:|---:|
| Canon imageCLASS 2200 Advanced Copier | $61,599.82 | $25,199.93 |
| Fellowes PB500 Electric Punch Binding Machine | $27,453.38 | $7,753.04 |
| Cisco TelePresence System EX90 | $22,638.48 | -$1,811.08 |
| HON 5400 Series Task Chairs | $21,870.58 | $0.00 |
| GBC DocuBind TL300 Binding System | $19,823.48 | $2,233.51 |

### Top 5 Loss-Making Products

| Product | Revenue | Profit |
|---|---:|---:|
| Cubify CubeX 3D Printer Double Head Print | $11,099.96 | -$8,879.97 |
| Lexmark MX611dhe Monochrome Laser Printer | $16,829.90 | -$4,589.97 |
| Cubify CubeX 3D Printer Triple Head Print | $7,999.98 | -$3,839.99 |
| Chromcraft Conference Tables & Bases | $9,917.64 | -$2,876.12 |
| Bush Racetrack Conference Table | $9,544.73 | -$1,934.40 |

### Business Interpretation

**Observation:** Canon imageCLASS 2200 Advanced Copier generated the highest product revenue and substantial profit. Cubify CubeX Double Head Printer generated the largest product loss.

**KPI:** Highest product revenue: $61,599.82. Largest product loss: $8,879.97.

**Business Issue:** Some high-revenue products are unprofitable. Cisco TelePresence, for example, generated $22,638.48 in revenue but recorded a loss of $1,811.08.

**Next Investigation:** Examine discount levels, regions, and transaction-level profitability for loss-making products.

**Recommendation:** Evaluate products using both revenue and profitability. Prioritize loss-making products for pricing and promotional reviews.

### SQL Techniques

- GROUP BY
- HAVING
- LIMIT
- ROW_NUMBER
- PARTITION BY
- Product ranking

---

## 5. Discount & Profitability Analysis

### Business Question

Are higher discounts associated with lower profitability?

### Results

| Discount Group | Order Lines | Revenue | Profit | Margin |
|---|---:|---:|---:|---:|
| No Discount | 4,798 | $1,087,908.47 | $320,987.60 | 29.51% |
| 1–10% | 94 | $54,369.35 | $9,029.18 | 16.61% |
| 11–20% | 3,709 | $792,152.89 | $91,756.30 | 11.58% |
| 21–30% | 227 | $103,226.66 | -$10,369.28 | -10.05% |
| Above 30% | 1,166 | $259,543.49 | -$125,006.78 | -48.16% |

### Business Interpretation

**Observation:** Profit margins decline across higher discount groups. Transactions with discounts above 30% recorded a total loss of $125,006.78.

**KPI:** No-discount margin: 29.51%. Above-30% discount margin: -48.16%.

**Business Issue:** High-discount transactions are associated with substantial profitability losses.

**Next Investigation:** Examine discount patterns across categories, products, and regions.

**Recommendation:** Review discount policies above 20%, especially for products and regions with recurring losses.

### Important Limitation

This analysis identifies an association between discount levels and profitability. It does not establish that discounts alone caused the losses.

---

## 6. Customer Segment Performance

### Business Question

Which customer segments contribute the most revenue and profit?

### Results

| Segment | Customers | Orders | Revenue | Profit | Margin |
|---|---:|---:|---:|---:|---:|
| Consumer | 409 | 2,586 | $1,161,401.35 | $134,119.21 | 11.55% |
| Corporate | 236 | 1,514 | $706,146.37 | $91,979.13 | 13.03% |
| Home Office | 148 | 909 | $429,653.15 | $60,298.68 | 14.03% |

### Business Interpretation

**Observation:** Consumer generates the highest revenue and total profit, while Home Office achieves the highest profit margin.

**KPI:** Consumer profit: $134,119.21. Home Office margin: 14.03%.

**Business Issue:** The largest revenue-generating customer segment does not have the highest profit margin.

**Next Investigation:** Compare purchasing behavior, product categories, and discounts across customer segments.

**Recommendation:** Maintain the Consumer segment's contribution while investigating margin improvement opportunities. Explore profitable growth opportunities in Corporate and Home Office.

---

# Key Business Findings

The analysis highlights five important findings:

1. **Technology leads profitability:** Technology generates $145,454.95 in profit with a 17.40% margin.

2. **Furniture has a profitability problem:** Furniture generates $741,999.80 in revenue but achieves only a 2.49% margin.

3. **Tables and Bookcases generate losses:** These subcategories contribute negatively to Furniture profitability.

4. **High discounts are associated with losses:** Transactions discounted above 30% have a -48.16% profit margin.

5. **Regional and product performance vary:** Central has the lowest regional margin, and several high-revenue products are loss-making.

# Business Recommendations

## 1. Review Discount Policies

Investigate high-discount transactions, especially those above 20%, to identify opportunities to improve margins.

## 2. Improve Furniture Profitability

Prioritize Tables and Bookcases for product-level profitability reviews.

## 3. Investigate Central Region Performance

Analyze product mix, state-level losses, and discounting within Central.

## 4. Optimize Product-Level Decisions

Use both revenue and profit when evaluating products. Review products that repeatedly generate losses.

## 5. Improve Sales Forecasting

Use monthly revenue trends and year-over-year comparisons to support inventory and operational planning.

## 6. Develop Segment-Specific Strategies

Balance total profit contribution with profit margins when planning customer retention and growth initiatives.

---

# Project Structure

```text
retail-sales-performance-analysis-sql/
|
|-- README.md
|
|-- sql/
|   |-- 01_data_validation.sql
|   |-- 02_data_cleaning.sql
|   |-- 03_category_analysis.sql
|   |-- 04_regional_analysis.sql
|   |-- 05_monthly_trends.sql
|   |-- 06_product_analysis.sql
|   |-- 07_discount_analysis.sql
|   |-- 08_customer_segment_analysis.sql
|
|-- results/
|   |-- SQL result exports
|
|-- visuals/
|   |-- Charts and analysis screenshots
```

# How to Reproduce the Analysis

1. Install PostgreSQL and pgAdmin.
2. Create a database named `retail_sales_db`.
3. Download the Sample Superstore dataset from the documented source.
4. Import the dataset into `public.superstore_raw` using the schema defined in the project SQL scripts.
5. Execute the data validation queries.
6. Review and execute the data-cleaning script.
7. Run the category, regional, monthly, product, discount, and customer segment analyses.
8. Compare your outputs with the documented results.

The analytical queries currently use `public.superstore_raw`, with explicit numeric conversions where necessary.

# Project Limitations

- The dataset covers historical transactions from 2014–2017 and does not represent current retail performance.
- Discount analysis identifies correlations rather than proving causation.
- The available data does not independently explain supplier costs, customer behavior, or management decisions.
- Date-format checks and aggregate reconciliation were completed, but comprehensive calendar-date validation and the full cleaning script still require final review.
- Business recommendations are hypotheses for further investigation rather than experimentally verified improvements.

# Conclusion

This SQL project demonstrates how transactional retail data can be analyzed to identify business performance patterns and profitability improvement opportunities.

The findings show that strong revenue does not always guarantee strong profit. Furniture, high-discount transactions, selected products, and the Central region are important areas for further investigation.

The project demonstrates practical SQL skills, analytical reasoning, KPI evaluation, and the ability to translate data into business recommendations.

---

## Author

**Prathibha P**

Aspiring Business Analyst | Data Analyst

[LinkedIn](https://www.linkedin.com/in/prathi282004/)
