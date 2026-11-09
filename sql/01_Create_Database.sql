CREATE DATABASE ecommerce_rfm;
use ecommerce_rfm;
SELECT DATABASE(); -- verify database selection
SELECT COUNT(*) AS imported_rows
FROM retail_transactions;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
USE ecommerce_rfm;

CREATE TABLE retail_transactions (
    Invoice VARCHAR(30),
    StockCode VARCHAR(30),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(15,4),
    `Customer ID` BIGINT,
    Country VARCHAR(100),
    Revenue DECIMAL(18,4)
);

SELECT COUNT(*) AS existing_rows
FROM retail_transactions;
DESCRIBE retail_transactions;
LOAD DATA LOCAL INFILE
'C:/Users/Devyani/OneDrive/Desktop/Data Analytics projects/E-commerce Customer Segmentation & RFM Analysis/data/processed/retail_cleaned.csv'

INTO TABLE retail_transactions

FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'

LINES TERMINATED BY '\n'

IGNORE 1 ROWS

(Invoice, StockCode, Description, Quantity, InvoiceDate,
 Price, @customer_id, Country, Revenue)

SET `Customer ID` = CAST(@customer_id AS UNSIGNED);


CREATE TABLE customer_rfm (
    `Customer ID` BIGINT PRIMARY KEY,
    Recency INT,
    Frequency INT,
    Monetary DECIMAL(18,2),
    R_Score INT,
    F_Score INT,
    M_Score INT,
    RFM_Score VARCHAR(10),
    Segment VARCHAR(50),
    ML_Cluster INT
);
LOAD DATA LOCAL INFILE
'C:/Users/Devyani/OneDrive/Desktop/Data Analytics projects/E-commerce Customer Segmentation & RFM Analysis/data/processed/customer_rfm_ml.csv'

INTO TABLE customer_rfm

FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'

LINES TERMINATED BY '\n'

IGNORE 1 ROWS

(`Customer ID`, Recency, Frequency, Monetary,
 R_Score, F_Score, M_Score, RFM_Score, Segment, ML_Cluster);
 
 
SELECT COUNT(*) AS total_records
FROM retail_transactions;

SELECT *
FROM retail_transactions
LIMIT 10;

SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Invoice) AS Unique_Invoices,
    COUNT(DISTINCT `Customer ID`) AS Unique_Customers,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_transactions;
DROP  table retail_transactions;
show  tables;
DESCRIBE customer_rfm;

-- KPI
SELECT
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    SUM(Quantity) AS Total_Units_Sold,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(AVG(Revenue), 2) AS Average_Line_Revenue
FROM retail_transactions;

-- MONTHLY REVENUE SALES 
SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    ROUND(SUM(Revenue), 2) AS Monthly_Revenue,
    COUNT(DISTINCT Invoice) AS Total_Orders
FROM retail_transactions
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month DESC;
-- Country-wise revenue analysis
SELECT
    Country,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM retail_transactions
GROUP BY Country
ORDER BY Total_Revenue DESC;

-- Identify the top 10 valuable customers
SELECT
    `Customer ID`,
    Recency,
    Frequency,
    Monetary,
    Segment
FROM customer_rfm
ORDER BY Monetary DESC
LIMIT 10;
USE ecommerce_rfm;
-- Analyze customer segments
SELECT
    Segment,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Recency), 2) AS Average_Recency,
    ROUND(AVG(Frequency), 2) AS Average_Frequency,
    ROUND(AVG(Monetary), 2) AS Average_Monetary,
    ROUND(SUM(Monetary), 2) AS Segment_Revenue
FROM customer_rfm
GROUP BY Segment
ORDER BY Segment_Revenue DESC;

-- Find customers at risk
SELECT
    `Customer ID`,
    Recency,
    Frequency,
    Monetary,
    Segment
FROM customer_rfm
WHERE Segment LIKE '%At Risk%'
   OR Segment LIKE '%Lost%'
ORDER BY Monetary DESC;
-- Analyze RFM score combinations
SELECT
    RFM_Score,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Monetary), 2) AS Average_Spending
FROM customer_rfm
GROUP BY RFM_Score
ORDER BY Total_Customers DESC;
-- Analyze ML clusters
SELECT
    ML_Cluster,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Recency), 2) AS Average_Recency,
    ROUND(AVG(Frequency), 2) AS Average_Frequency,
    ROUND(AVG(Monetary), 2) AS Average_Monetary
FROM customer_rfm
GROUP BY ML_Cluster
ORDER BY ML_Cluster;