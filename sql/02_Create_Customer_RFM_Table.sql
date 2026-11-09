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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 