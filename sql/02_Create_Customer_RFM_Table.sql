USE ecommerce_rfm;

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
 
 SELECT COUNT(*) AS Total_Customers
FROM customer_rfm;

SELECT *
FROM customer_rfm
LIMIT 10;
 DESCRIBE retail_transactions;
 
 ALTER TABLE customer_rfm RENAME TO customer_rfm_ml;

 select count(*)
 from customer_rfm;
 
 select count(*)
 from ml_cluster_profile;

  select count(*)
 from segment_summary;
 
   select count(*)
 from  rfm_ml_comparison;
 USE ecommerce_rfm;

SHOW TABLES;
SELECT 'retail_transactions' AS Table_Name, COUNT(*) AS Total_Rows
FROM retail_transactions
UNION ALL
SELECT 'customer_rfm', COUNT(*) FROM customer_rfm
UNION ALL
SELECT 'customer_rfm_ml', COUNT(*) FROM customer_rfm_ml
UNION ALL
SELECT 'ml_cluster_profile', COUNT(*) FROM ml_cluster_profile
UNION ALL
SELECT 'segment_summary', COUNT(*) FROM segment_summary
UNION ALL
SELECT 'rfm_ml_comparison', COUNT(*) FROM rfm_ml_comparison;
 
 
 
 -- 9. ML Cluster Performance
use ecommerce_rfm;
SELECT
    ML_Cluster,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Recency), 2) AS Avg_Recency,
    ROUND(AVG(Frequency), 2) AS Avg_Frequency,
    ROUND(AVG(Monetary), 2) AS Avg_Monetary,
    ROUND(SUM(Monetary), 2) AS Total_Revenue
FROM customer_rfm_ml
GROUP BY ML_Cluster
ORDER BY ML_Cluster;
select * from ml_cluster_profile
limit 4 ;

-- 10. RFM Segment vs ML Cluster

SELECT
    Segment,
    ML_Cluster,
    COUNT(*) AS Customer_Count
FROM customer_rfm_ml
GROUP BY Segment, ML_Cluster
ORDER BY Segment, ML_Cluster;

 -- 11. High-Value At-Risk Customers

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
 
 
 
 
 
 
 
 
 
 
 
 
 