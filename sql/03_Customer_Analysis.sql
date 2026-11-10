use ecommerce_rfm;
SELECT
    COUNT(*) AS Total_Transactions,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Revenue) / COUNT(DISTINCT Invoice), 2) AS Average_Order_Value,
    ROUND(SUM(Revenue) / COUNT(DISTINCT `Customer ID`), 2) AS Revenue_Per_Customer
FROM retail_transactions;

SELECT COUNT(*) AS Total_Rows
FROM retail_transactions;

SELECT
    COUNT(Invoice) AS Invoice_Count,
    COUNT(`Customer ID`) AS Customer_ID_Count,
    COUNT(Revenue) AS Revenue_Count
FROM retail_transactions;

SELECT
    COUNT(DISTINCT Invoice) AS Unique_Invoices,
    COUNT(DISTINCT `Customer ID`) AS Unique_Customers,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_transactions;

SELECT
    DATABASE() AS Current_Database,
    @@hostname AS MySQL_Host,
    @@port AS MySQL_Port;
    
    SELECT COUNT(*) AS Total_Rows
FROM ecommerce_rfm.retail_transactions;

SHOW CREATE TABLE ecommerce_rfm.retail_transactions;
DESCRIBE retail_transactions;

SELECT
    MIN(InvoiceDate) AS First_Date,
    MAX(InvoiceDate) AS Last_Date,
    COUNT(*) AS Total_Rows
FROM retail_transactions;

SHOW WARNINGS LIMIT 20;

DESCRIBE retail_transactions;

SELECT Invoice, Quantity, Price, Revenue
FROM retail_transactions
LIMIT 10;
SHOW WARNINGS LIMIT 10;

SELECT
    Invoice,
    Quantity,
    Price,
    Revenue
FROM retail_transactions
LIMIT 15;

SHOW CREATE TABLE retail_transactions;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        ABS(Revenue - (Quantity * Price)) > 0.000001
    ) AS incorrect_revenue_rows
FROM retail_transactions;

SELECT DATABASE();
SELECT COUNT(*) AS total_rows
FROM retail_transactions;
SELECT COUNT(*) AS total_rows
FROM retail_transactions;

DROP TABLE IF EXISTS retail_transactions;

CREATE TABLE retail_transactions (
    Invoice VARCHAR(20),
    StockCode VARCHAR(30),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,2),
    `Customer ID` INT,
    Country VARCHAR(100),
    Revenue DECIMAL(12,2)
);

SELECT
    COUNT(*) AS total_rows,
    SUM(Revenue <> Quantity * Price) AS incorrect_revenue_rows
FROM retail_transactions;
SHOW ENGINES;
-- ============================================================
-- CUSTOMER & BUSINESS ANALYSIS
-- ============================================================
-- 1. Revenue by Customer Segment
use ecommerce_rfm;
SELECT
    Segment,
    COUNT(*) AS Customer_Count,
    ROUND(SUM(Monetary), 2) AS Total_Revenue,
    ROUND(AVG(Monetary), 2) AS Average_Customer_Revenue
FROM customer_rfm
GROUP BY Segment
ORDER BY Total_Revenue DESC;

-- 2. Customer Count by Segment

SELECT
    Segment,
    COUNT(*) AS Customer_Count,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_rfm),
        2
    ) AS Customer_Percentage
FROM customer_rfm
GROUP BY Segment
ORDER BY Customer_Count DESC;

-- 3. Top 10 Customers by Monetary Value

SELECT
    `Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    RFM_Score,
    Segment
FROM customer_rfm
ORDER BY Monetary DESC
LIMIT 10;

-- 4. Top 10 Customers by Purchase Frequency

SELECT
    `Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    RFM_Score,
    Segment
FROM customer_rfm
ORDER BY Frequency DESC
LIMIT 10;

-- 5. Customers with the Most Recent Purchases

SELECT
    `Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    RFM_Score,
    Segment
FROM customer_rfm
ORDER BY Recency ASC
LIMIT 10;

-- 6. At-Risk Customers

SELECT
    `Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    RFM_Score,
    Segment
FROM customer_rfm
WHERE Segment = 'At Risk'
ORDER BY Monetary DESC
LIMIT 20;

-- 7. Champion Customers

SELECT
    `Customer ID`,
    Recency,
    Frequency,
    ROUND(Monetary, 2) AS Monetary,
    RFM_Score
FROM customer_rfm
WHERE Segment = 'Champions'
ORDER BY Monetary DESC
LIMIT 20;

-- 8. Average RFM Metrics by Segment

SELECT
    Segment,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Recency), 2) AS Avg_Recency,
    ROUND(AVG(Frequency), 2) AS Avg_Frequency,
    ROUND(AVG(Monetary), 2) AS Avg_Monetary
FROM customer_rfm
GROUP BY Segment
ORDER BY Avg_Monetary DESC;










