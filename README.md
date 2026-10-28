
# Retail Sales & Profitability Intelligence | SQL + Power BI

### Turning Retail Sales Data into Meaningful Business Insights

## 📌 Project Overview

High sales don't always mean high profits.

A business might generate strong revenue while losing money on certain products, offering excessive discounts, or overlooking underperforming categories.

I built this project to understand where a retail business earns its profits, where it loses money, and what opportunities exist to improve overall performance.

Using **PostgreSQL, SQL, and Power BI**, I analyzed **9,994 retail transactions** to explore sales trends, product profitability, regional performance, discount patterns, and customer segments.

My goal was not just to build a dashboard, but to understand the business behind the numbers and turn the findings into actionable recommendations.

---

## 🎯 Business Questions

I started this project with five questions:

1. Which product categories and regions contribute the most revenue and profit?
2. Are there products generating strong sales but little or no profit?
3. How does profitability vary across different discount levels?
4. Which customer segments contribute the most to business performance?
5. What changes could help improve overall profit margins?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| PostgreSQL | Data storage and querying |
| SQL | Data validation, aggregation, and profitability analysis |
| Power BI | Dashboard development and data visualization |
| DAX | KPI calculations and analytical measures |

### SQL Concepts Used

- Data validation and quality checks
- GROUP BY and HAVING
- Aggregate functions
- CASE statements
- Common Table Expressions (CTEs)
- Window functions
- ROW_NUMBER()
- LAG()
- DATE_TRUNC()
- NULLIF()

---

## 📂 Dataset

**Dataset:** Sample Superstore

**Records:** 9,994

**Period:** 2014–2017

The dataset contains retail transaction information, including:

- Orders and customers
- Product categories and subcategories
- Sales and profit
- Discounts
- Customer segments
- Geographic regions
- Order dates

Before starting the analysis, I checked for duplicate records, missing values, and date-format issues to ensure the data was suitable for reporting.

---

## 📊 Overall Business Performance

| KPI | Value |
|-----|------:|
| Total Revenue | $2.30M |
| Total Profit | $286.40K |
| Overall Profit Margin | 12.47% |
| Furniture Profit Margin | 2.49% |
| No-Discount Profit Margin | 29.51% |
| Above 30% Discount Margin | -48.16% |

The business generated approximately **$2.30 million in revenue**, but its overall profit margin was only **12.47%**.

This encouraged me to investigate which categories, products, and discount levels were affecting profitability.

---

## 🔍 Key Business Findings

### 1. Furniture Generates Revenue but Struggles with Profitability

Furniture generated approximately **$742K in revenue**, making it a significant contributor to overall sales.

However, its profit margin was just **2.49%**.

| Category | Revenue | Profit Margin |
|----------|--------:|--------------:|
| Technology | $836.15K | 17.40% |
| Office Supplies | $719.05K | 17.04% |
| Furniture | $742.00K | 2.49% |

Looking deeper into Furniture, I found that:

- Tables recorded a loss of approximately **$17.73K**.
- Bookcases recorded a loss of approximately **$3.47K**.

**Business Takeaway:**

Revenue alone isn't enough to evaluate product performance. Furniture requires closer attention to pricing, discounts, and product-level costs.

---

### 2. Higher Discounts Are Associated with Lower Profit Margins

One of the clearest patterns appeared in the discount analysis.

| Discount Range | Profit Margin |
|----------------|--------------:|
| No Discount | 29.51% |
| 1–10% | 16.61% |
| 11–20% | 11.58% |
| 21–30% | -10.05% |
| Above 30% | -48.16% |

Transactions with discounts above 30% had a **-48.16% profit margin**.

Although this does not prove that discounts alone caused the losses, it highlights a significant profitability risk.

**Business Takeaway:**

The business should review heavily discounted transactions and consider margin-based discount controls to reduce potential losses.

---

### 3. Regional Performance Shows Opportunities for Improvement

Profitability varied across regions.

| Region | Profit Margin |
|--------|--------------:|
| West | 14.94% |
| East | 13.48% |
| South | 11.93% |
| Central | 7.92% |

West achieved the highest profit margin, while Central recorded the lowest.

**Business Takeaway:**

Comparing Central with higher-margin regions could help identify differences in product mix, pricing, and discount practices.

---

### 4. Customer Segments Contribute Differently to Profitability

Consumer generated the highest total profit, while Home Office achieved the highest profit margin.

| Customer Segment | Total Profit | Profit Margin |
|------------------|-------------:|--------------:|
| Consumer | $134.12K | 11.55% |
| Corporate | $91.98K | 13.03% |
| Home Office | $60.30K | 14.03% |

**Business Takeaway:**

Consumer contributes the most profit in absolute terms, while Home Office shows stronger profitability relative to revenue.

Both insights can support customer growth and profitability strategies.

---

## 📈 Power BI Dashboard

I developed a **three-page Power BI dashboard** to present the findings and make business performance easier to understand.

### Page 1 — Executive Sales Overview

This page provides a high-level view of retail performance.

**Key Features:**
- Revenue, profit, profit margin, and order KPIs
- Monthly sales and profit trends
- Category profitability comparison
- Regional performance analysis
- Key business insights

![Executive Sales Overview](Screenshots/Executive_Overview.png)

---

### Page 2 — Product & Profitability Intelligence

This page focuses on identifying products and categories affecting profitability.

**Key Features:**
- Top 10 revenue-generating products
- Top 10 loss-making products
- Furniture subcategory profitability
- Business insights and recommendations

![Product and Profitability Intelligence](Screenshots/Product_Profitability.png)

---

### Page 3 — Discount & Customer Insights

This page explores the relationship between discount levels, customer segments, and profitability.

**Key Features:**
- Profit margin by discount group
- Customer segment profit contribution
- Discount profitability KPI cards
- Business recommendations

![Discount and Customer Insights](Screenshots/Discount_Customer_Insights.png)

---

## 💡 Business Recommendations

Based on the analysis, I would recommend the following actions:

### 1. Review Furniture Profitability

Investigate loss-making Tables and Bookcases, particularly their pricing, discounts, and costs.

### 2. Introduce Margin-Aware Discount Controls

Review transactions with discounts above 20% and assess whether additional approval or pricing rules could help protect margins.

### 3. Investigate Regional Differences

Compare Central with higher-margin regions to understand the impact of product mix, pricing, and discounts.

### 4. Focus on Profitable Customer Segments

Explore opportunities to grow profitable customer segments while maintaining overall revenue performance.

### 5. Monitor Profitability Alongside Sales

Track profit margins regularly rather than relying only on revenue growth.

These recommendations are based on the available data and would require further validation before implementation.

---

## 📁 Project Structure

```text
Retail-Sales-Profitability-Intelligence/
│
├── SQL/
│   └── SQL analysis scripts
│
├── PowerBI/
│   └── Retail_Sales_Profitability_Intelligence.pbix
│
├── Screenshots/
│   ├── Executive_Overview.png
│   ├── Product_Profitability.png
│   └── Discount_Customer_Insights.png
│
├── Documentation/
│   └── Retail_Sales_Dashboard.pdf
│
└── README.md
```

---

## 📚 What I Learned

This project helped me strengthen both my technical and business analysis skills.

On the technical side, I gained hands-on experience using SQL for data validation, aggregation, and deeper analysis, along with Power BI for building KPI measures and dashboards.

More importantly, I learned how to move beyond reporting numbers and ask why certain patterns appear in the data.

For example, identifying Furniture as a low-margin category was only the starting point. Investigating its subcategories helped reveal where losses were concentrated and what the business might need to examine next.

The project also helped me practice presenting technical findings in a way that supports business decisions.

---

## 🚀 Conclusion

This project reinforced an important lesson:

**Strong sales performance does not always translate into strong business performance.**

By combining SQL analysis with Power BI, I identified profitability risks, compared performance across different parts of the business, and developed data-backed recommendations.

This project reflects my interest in using analytics to solve business problems and support better decision-making.

---

### Skills Demonstrated

`SQL` `PostgreSQL` `Power BI` `DAX` `Data Validation` `Business Analysis` `KPI Reporting` `Profitability Analysis` `Data Visualization` `Data Storytelling`
