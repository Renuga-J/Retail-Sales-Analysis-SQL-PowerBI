# Retail Sales Analysis Dashboard | SQL & Power BI

## Project Overview

This project analyzes retail sales data using SQL Server and Power BI to uncover business insights related to sales performance, profitability, customer behavior, product performance, discount impact, and regional trends.

The objective was to transform raw transactional data into actionable business insights through data cleaning, exploratory data analysis (EDA), SQL-based reporting, and interactive Power BI dashboards.

---

## Tools Used

* SQL Server
* Power BI
* DAX
* Excel

---

## Project Workflow

### 1. Data Exploration

* Examined dataset structure and data types
* Analyzed categories, segments, regions, and product information
* Identified date ranges and business coverage period
* Investigated profit and discount patterns

### 2. Data Cleaning

* Checked for duplicate records
* Validated date fields and discount values
* Examined negative profit transactions
* Created a cleaned analytical table for reporting

### 3. Exploratory Data Analysis

Performed analysis across:

* Overall business performance
* Product categories and sub-categories
* Regional performance
* Customer segments
* Discount impact
* Time trends
* Product profitability
* State-wise profitability

### 4. Dashboard Development

Built a 3-page interactive Power BI dashboard featuring:

* Executive Overview
* Product & Regional Analysis
* Customer Insights

---

# Business Questions Answered

* How has sales performance changed over time?
* Which regions generate the highest revenue?
* Which customer segments contribute most to sales?
* Which product categories are most profitable?
* How do discounts affect profitability?
* Which products generate the highest profits?
* Which products create losses despite strong sales?
* Which states drive business profitability?
* How do customers contribute to overall revenue and profit?

---

# Dashboard Pages

## 1. Executive Overview

Provides a high-level summary of business performance.

### KPIs

* Total Sales
* Total Profit
* Total Customers
* Total Orders
* Profit Margin (%)

### Visualizations

* Monthly Sales & Profit Trend
* Sales Distribution by Customer Segment
* Regional Sales Performance
<img width="1352" height="736" alt="Executive_Overview" src="https://github.com/user-attachments/assets/7d7a58a0-ee47-4fe6-ac2c-2116e6a66519" />



---

## 2. Product & Regional Analysis

Focuses on category, product, and geographic performance.

### Visualizations

* Sales by Product Category
* Profit by Product Category
* Top States by Sales
* Top Products by Sales
* Profitability by Product Sub-Category

<img width="1337" height="727" alt="Product_Regional_Analysis" src="https://github.com/user-attachments/assets/da31afc8-6e82-4630-802c-38926cc197f9" />


---

## 3. Customer Insights

Provides insights into customer purchasing behavior and profitability.

### KPIs

* Average Sales per Customer
* Average Orders per Customer

### Visualizations

* Customer Distribution by Segment
* Customer Sales & Profit Summary
* Top Customers by Profit
* Monthly Customer Activity
<img width="1347" height="747" alt="Customer_Insights" src="https://github.com/user-attachments/assets/941215eb-52c3-4eab-9b6a-fcffeb797b1a" />


---

# SQL Analysis Performed

## Overall Business Performance

* Total Sales
* Total Profit
* Total Orders
* Total Customers
* Average Profit Margin
* Average Discount

## Product Performance

* Category Analysis
* Sub-Category Analysis
* Top 10 Profitable Products
* Top 10 Loss-Making Products
* High Sales, Low Profit Products

## Regional Analysis

* Region-wise Sales and Profit
* State-wise Profitability Analysis

## Customer Analysis

* Customer Segment Analysis
* Sales per Customer
* Orders per Customer

## Trend Analysis

* Year-wise Performance
* Month-wise Performance

## Discount Analysis

* Profitability across discount ranges
* Impact of discounts on overall profit margins

---

# Key Business Insights

## Sales Performance

* Generated over **$2.30M** in total sales across four years.
* Processed approximately **5000 orders**.
* Served **793 unique customers**.
* Sales showed consistent growth from 2014 to 2017.

## Seasonal Trends

* November and December recorded the highest sales volumes.
* September also demonstrated strong sales performance.
* Sales activity increased significantly during the final quarter of each year.

## Category Performance

* Technology achieved the highest profit margin (**17.4%**).
* Office Supplies maintained consistent profitability (**17.0%**).
* Furniture generated strong revenue but only a **2.5% profit margin**, indicating profitability challenges.

## Regional Performance

* California generated the highest overall sales.
* New York and Washington were among the most profitable states.
* Michigan recorded the highest profit margin among top-performing states.

## Discount Impact

* Orders without discounts generated the highest profits.
* Discounts above 25% significantly reduced profitability.
* Discounts above 50% resulted in overall negative profits.

### Business Recommendation

Excessive discounting should be carefully monitored, as high discount levels consistently reduced or eliminated profits.

## Product Profitability

### Top Performing Product

* Canon imageCLASS 2200 Advanced Copier generated the highest total profit.

### Loss-Making Products

Several products generated significant losses despite substantial sales volumes, including:

* Cubify CubeX 3D Printer Double Head Print
* Cubify CubeX 3D Printer Triple Head Print
* Lexmark MX611dhe Monochrome Laser Printer

### Business Recommendation

Review pricing, discounting, and inventory strategies for high-sales but low-profit products.

---

# DAX Measures Created

## Total Sales

```DAX
Total Sales = SUM('Retail Sales Analysis'[Sales])
```

## Total Profit

```DAX
Total Profit = SUM('Retail Sales Analysis'[Profit])
```

## Total Orders

```DAX
Total Orders =
DISTINCTCOUNT('Retail Sales Analysis'[Order_ID])
```

## Total Customers

```DAX
Total Customers =
DISTINCTCOUNT('Retail Sales Analysis'[Customer_ID])
```

## Profit Margin

```DAX
Profit Margin =
DIVIDE(
    SUM('Retail Sales Analysis'[Profit]),
    SUM('Retail Sales Analysis'[Sales])
)
```

## Average Sales per Customer

```DAX
Sales per Customer =
DIVIDE(
    SUM('Retail Sales Analysis'[Sales]),
    DISTINCTCOUNT('Retail Sales Analysis'[Customer_ID])
)
```

## Average Orders per Customer

```DAX
Orders per Customer =
DIVIDE(
    DISTINCTCOUNT('Retail Sales Analysis'[Order_ID]),
    DISTINCTCOUNT('Retail Sales Analysis'[Customer_ID])
)
```

---

# Skills Demonstrated

* SQL Querying
* Data Cleaning
* Exploratory Data Analysis (EDA)
* Business Intelligence
* Data Visualization
* Dashboard Design
* DAX Calculations
* KPI Development
* Customer Analytics
* Product Analytics
* Profitability Analysis
* Business Reporting

---

# Project Files

* SQL Queries
* Power BI Dashboard (.pbix)
* Dashboard Screenshots
* Dataset
* Project Documentation

---

## Author

**Renuga J**

LinkedIn: https://www.linkedin.com/in/renuga-j/

GitHub: https://github.com/Renuga-J

