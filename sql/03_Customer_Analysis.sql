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
