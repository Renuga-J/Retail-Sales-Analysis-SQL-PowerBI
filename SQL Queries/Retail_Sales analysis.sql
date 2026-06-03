---- Creating Database ----
CREATE DATABASE Retail_Sales_Analysis;
---- Exploration ---
SELECT COUNT(*) AS Total_Rows
FROM dbo.retail_sales_raw;

SELECT TOP 20 *
FROM retail_sales_raw;

SELECT DISTINCT Category
FROM retail_sales_raw;

SELECT DISTINCT Segment 
FROM retail_sales_raw;

SELECT DISTINCT Region
FROM retail_sales_raw;

SELECT MIN(Order_Date) AS StartDate,
	   MAX(Order_Date) AS EndDate
FROM retail_sales_raw;



---- DATA CLEANING ---
--- 1 - CHECKING FOR DUPLICATES --
    SELECT 
    Order_ID,
    Product_ID,
    Discount,
    Quantity,
    COUNT(*) AS Duplicate_Count
FROM retail_sales_raw
GROUP BY 
    Order_ID,
    Product_ID,
    Discount,
    Quantity
HAVING COUNT(*) > 1;


---- 2-DISCOUNT AND PROFIT ANALYSIS ---

SELECT Product_ID, Discount, Profit
FROM retail_sales_raw
WHERE Discount > 0 AND Profit <0;


---- FINAL TABLE CREATION--
SELECT DISTINCT Order_ID, 
                Order_Date,
                YEAR(Order_Date) AS Order_Year, 
                DATENAME (month, Order_Date) AS Order_Month, 
                Segment, 
                Customer_ID, 
                Customer_Name, 
                Country, 
                State,
                Region,
                Product_ID, 
                Product_Name, 
                Category, 
                Sub_Category, 
                Quantity, 
                Sales, 
                Profit, 
                Discount, 
     CASE 
         WHEN Profit<0 THEN 'Loss' 
         ELSE 'Profit' 
     END AS Profit_Status, 
     CASE 
        WHEN Sales = 0 THEN 0 
        ELSE ROUND((Profit/Sales)*100,2) 
    END AS Profit_Margin 

INTO Final_RetailSales_Table 

FROM retail_sales_raw;

SELECT COUNT(*) AS Total_Rows
FROM Final_RetailSales_Table

SELECT TOP 10 *
FROM Final_RetailSales_Table

--- Exploratory Data Analysis---
---- OVERALL BUSINESS PERFORMANCE----
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders, 
       ROUND(SUM(Sales),2) AS Total_Sales, 
       ROUND(SUM(Profit),2) AS Total_Profit, 
       COUNT(DISTINCT Customer_ID) AS No_of_customers, 
       ROUND(AVG(Profit_Margin),2) AS Average_Profit_Margin, 
       ROUND(AVG(Discount),2)  AS Average_Discount
FROM Final_RetailSales_Table

---- CATEGORY PERFORMANCE ANALYSIS---
SELECT Category, 
       ROUND(SUM(Sales),2) AS Total_Sales, 
       ROUND(SUM(Profit),2) AS Total_Profit, 
       ROUND(AVG(Profit_Margin),2) AS Average_Profit_Margin, 
       ROUND(AVG(Discount),2) AS Average_Discount 
FROM Final_RetailSales_Table 
GROUP BY Category

----- SUBCATEGORY ANALYSIS---
SELECT Sub_Category, 
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit, 
       ROUND(AVG(Profit_Margin),2) AS Average_Profit_Margin 
FROM Final_RetailSales_Table 
GROUP BY Sub_Category 
ORDER BY Total_Profit ASC


---- REGION WISE ANALYSIS----

SELECT Region, 
       ROUND(SUM(Sales),2) AS Total_Sales, 
       ROUND(SUM(Profit),2) AS Total_Profit, 
       ROUND(AVG(Profit_Margin),2) AS Average_Profit_Margin,
       ROUND(AVG(Discount),2) AS Average_Discount
FROM Final_RetailSales_Table 
GROUP BY Region 
ORDER BY Total_Profit DESC

---- CUSTOMER SEGMENT ANALYSIS

SELECT Segment, 
     ROUND(SUM(Sales),2) AS Total_Sales, 
     ROUND(SUM(Profit),2) AS Total_Profit, 
     ROUND(AVG(Profit_Margin),2) AS Avg_Profit_Margin, 
     ROUND(AVG(Discount),2) AS Avg_Discount 
FROM Final_RetailSales_Table 
GROUP BY Segment 
ORDER BY Total_Sales DESC

---- DISCOUNT IMPACT ANALYSIS---
WITH Discount_Categories AS (

    SELECT 
        Order_ID,
        Sales,
        Profit,
        Profit_Margin,
        Discount,

        CASE 
            WHEN Discount = 0 THEN 'No Discount'
            WHEN Discount BETWEEN 0.01 AND 0.10 THEN '1% to 10%'
            WHEN Discount BETWEEN 0.11 AND 0.25 THEN '11% to 25%'
            WHEN Discount BETWEEN 0.26 AND 0.50 THEN '26% to 50%'
            ELSE 'Over 50%'
        END AS Discount_Range

    FROM Final_RetailSales_Table

)

SELECT 
    Discount_Range,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND(AVG(Profit_Margin),2) AS Avg_Profit_Margin

FROM Discount_Categories

GROUP BY Discount_Range

ORDER BY MIN(Discount);

--- TIME TREND ANALYSIS---
SELECT Order_Year, 
       COUNT(DISTINCT Order_ID) AS Total_Orders, 
       ROUND(SUM(Sales),2) AS Total_Sales, 
       ROUND(SUM(Profit),2) AS Total_Profit 
FROM Final_RetailSales_Table 
GROUP BY Order_Year 
ORDER BY Order_Year

--- MONTHLY TREND ANALYSIS----
SELECT MONTH(Order_Date) AS Month_Number, 
DATENAME(MONTH,Order_Date) AS Order_Month, 
COUNT(DISTINCT Order_ID) AS Total_Orders,
ROUND(SUM(Sales),2) AS Total_Sales, 
ROUND(SUM(Profit),2) AS Total_Profit 
FROM Final_RetailSales_Table 
GROUP BY 
         MONTH(Order_Date), 
         DATENAME( MONTH,Order_Date) 
ORDER BY MONTH(Order_Date)

--- PROFITABILITY ANALYSIS---
---TOP 10 PRODUCTS---
SELECT TOP 10
    Product_Name,
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS Profit_Margin

FROM Final_RetailSales_Table

GROUP BY Product_Name, Category

ORDER BY Total_Profit DESC;

--- BOTTOM 10 PRODUCTS---
SELECT TOP 10
    Product_Name,
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS Profit_Margin

FROM Final_RetailSales_Table

GROUP BY Product_Name, Category

ORDER BY Total_Profit ASC;

--- LOW PROFIT PRODUCTS----
SELECT TOP 10
    Product_Name,
    ROUND(SUM(Sales),2) AS Total_Sales, 
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS Profit_Margin

FROM Final_RetailSales_Table

GROUP BY Product_Name

HAVING SUM(Sales) > 1000

ORDER BY Profit_Margin ASC, Total_Sales DESC;

---- PROFITABILITY BY STATE----
SELECT TOP 5
    State,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS Profit_Margin

FROM Final_RetailSales_Table

GROUP BY State

ORDER BY Total_Profit DESC;

--- PROFIT MARGIN BY CATEGORY---
SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS Profit_Margin

FROM Final_RetailSales_Table

GROUP BY Category

ORDER BY Profit_Margin DESC;