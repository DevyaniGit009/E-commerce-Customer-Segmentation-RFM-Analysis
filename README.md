\# 🛒 E-commerce Customer Segmentation \& RFM Analysis



An end-to-end data analytics project that combines \*\*Python, SQL, RFM analysis, K-Means clustering, and Power BI\*\* to understand e-commerce customer behavior, identify high-value and at-risk customers, and generate actionable business insights.



\## 📌 Project Overview



This project analyzes customer transaction data to understand purchasing behavior and answer business questions such as:



\- Which customers are the most valuable?

\- Which customers are loyal and engaged?

\- Which customers are at risk of becoming inactive?

\- How can customers be grouped based on their purchasing behavior?

\- How do rule-based RFM segments compare with ML-based customer clusters?

\- What insights can support customer retention and business decision-making?



The project follows an end-to-end analytics workflow:



\*\*Data Cleaning → RFM Analysis → Customer Segmentation → SQL Business Analysis → ML Clustering → Power BI Dashboard\*\*



\---



\## 🎯 Business Problem



E-commerce businesses generate large volumes of transaction data, but raw transaction records do not directly explain customer behavior.



The objective of this project is to transform transaction-level data into meaningful customer-level insights that can help businesses:



\- Identify high-value customers

\- Understand customer purchasing patterns

\- Find customers who may be at risk of churn

\- Prioritize customer retention efforts

\- Compare traditional business segmentation with machine learning-based clustering



\---



\## 🛠️ Tech Stack



| Technology | Purpose |

|---|---|

| \*\*Python\*\* | Data cleaning, transformation, EDA and analysis |

| \*\*Pandas \& NumPy\*\* | Data manipulation and numerical analysis |

| \*\*Scikit-learn\*\* | Feature scaling and K-Means clustering |

| \*\*Matplotlib \& Seaborn\*\* | Exploratory data analysis and visualization |

| \*\*MySQL\*\* | Data storage and SQL-based business analysis |

| \*\*SQL\*\* | KPI, customer, revenue and business analysis |

| \*\*Power BI\*\* | Interactive dashboards and reporting |

| \*\*Excel\*\* | Data export / analytical bridge |

| \*\*Jupyter Notebook\*\* | Analysis workflow and documentation |

| \*\*Git \& GitHub\*\* | Version control and project portfolio |



\---



\## 📂 Dataset



The project uses an e-commerce transaction dataset containing information such as:



\- Invoice

\- Stock Code

\- Product Description

\- Quantity

\- Invoice Date

\- Unit Price

\- Customer ID

\- Country



The original dataset contained \*\*1M+ transaction records\*\*.



After data cleaning and removing invalid transactions and records without Customer IDs, the final analytical dataset contained approximately:



\- \*\*779K+ transactions\*\*

\- \*\*5,878 customers\*\*

\- \*\*36,969 invoices\*\*



The large raw and cleaned transaction-level datasets are intentionally \*\*not included in this repository\*\* because of their size.



Smaller customer-level analytical datasets generated during the project are included in `data/processed/`.



\---



\## 🔄 Project Workflow



```text

Raw Transaction Data

&#x20;       ↓

Data Cleaning \& Validation

&#x20;       ↓

Customer-Level RFM Dataset

&#x20;       ↓

RFM Scoring \& Segmentation

&#x20;       ↓

SQL Business Analysis

&#x20;       ↓

Feature Transformation \& Scaling

&#x20;       ↓

K-Means Customer Clustering

&#x20;       ↓

RFM vs ML Comparison

&#x20;       ↓

Power BI Dashboard

```



\---



\## 🧹 Data Cleaning \& Preparation



The transaction data was cleaned using Python before performing customer-level analysis.



Key cleaning steps included:



\- Removed cancelled invoices

\- Removed return transactions / negative quantities

\- Removed invalid and non-positive prices

\- Removed transactions without Customer IDs

\- Removed duplicates

\- Created a \*\*Revenue\*\* column using quantity and price

\- Performed final data-quality validation



The final dataset was validated for:



\- Missing Customer IDs

\- Duplicate records

\- Negative quantities

\- Invalid prices

\- Negative revenue values



\---



\## 👥 RFM Analysis \& Customer Segmentation



Customer behavior was analyzed using \*\*RFM (Recency, Frequency, Monetary)\*\* analysis.



\### RFM Metrics



| Metric | Meaning |

|---|---|

| \*\*Recency\*\* | How recently a customer made a purchase |

| \*\*Frequency\*\* | How often a customer purchased |

| \*\*Monetary\*\* | How much revenue a customer generated |



Customers were scored using their RFM behavior and grouped into meaningful business segments.



\### Major Customer Segments



\- 🏆 Champions

\- 💙 Loyal Customers

\- ⚠️ At Risk

\- 💤 Hibernating

\- 🌱 New Customers

\- ⭐ Potential Loyalists

\- Others



This segmentation provides a business-oriented view of customer behavior and can support targeted retention and engagement strategies.



\---



\## 🤖 Machine Learning — Customer Clustering



To complement the rule-based RFM segmentation, \*\*K-Means clustering\*\* was applied to customer-level RFM features.



\### ML Workflow



1\. Applied log transformation to reduce the effect of skewed RFM distributions

2\. Standardized the transformed features using `StandardScaler`

3\. Compared multiple K-Means cluster configurations

4\. Evaluated clustering using the \*\*Silhouette Score\*\*

5\. Selected a 4-cluster solution for business interpretation



\### Final Cluster Interpretation



| Cluster | Interpretation |

|---|---|

| \*\*Cluster 0\*\* | Hibernating |

| \*\*Cluster 1\*\* | Recent |

| \*\*Cluster 2\*\* | High Value |

| \*\*Cluster 3\*\* | At Risk |



The ML clusters were then compared with the RFM-based customer segments to understand similarities and differences between the two approaches.



\---



\## 🗄️ SQL Business Analysis



MySQL was used to perform structured business analysis on the cleaned transaction data.



The SQL analysis includes:



\- Database and table creation

\- Data loading

\- Data validation

\- Overall business KPIs

\- Revenue analysis

\- Monthly revenue analysis

\- Customer-level analysis

\- RFM-related analysis

\- Business-oriented customer insights



The SQL queries are available in the `sql/` folder.



\---



\## 📊 Power BI Dashboard



The final analysis was presented through a multi-page Power BI dashboard.



\### Dashboard Pages



\#### 1. Sales Overview

Provides a high-level view of sales performance and key business KPIs.



\#### 2. Customer Segmentation

Shows the distribution and characteristics of different RFM customer segments.



\#### 3. RFM Analysis

Provides deeper analysis of customer Recency, Frequency and Monetary behavior.



\#### 4. ML Cluster Analysis

Visualizes the customer clusters generated using K-Means and their business interpretations.



\### Dashboard Screenshots



\#### Sales Overview



!\[Sales Overview](reports/screenshots/Customer%20Insights.png)



\#### Customer Segmentation



!\[Customer Segmentation](reports/screenshots/Customer%20Segmentation.png)



\#### RFM Analysis



!\[RFM Analysis](reports/screenshots/RFM%20Analysis.png)



\#### ML Cluster Analysis



!\[ML Cluster Analysis](reports/screenshots/ML%20Cluster%20Analysis.png)



\---



\## 💡 Key Business Insights



The analysis provides several actionable perspectives for an e-commerce business:



\- \*\*High-value customers\*\* can be prioritized for loyalty programs and personalized engagement.

\- \*\*Champions and loyal customers\*\* represent customers with strong purchasing relationships with the business.

\- \*\*At-risk customers\*\* can be targeted with retention campaigns before they become inactive.

\- \*\*Hibernating customers\*\* may require reactivation strategies.

\- \*\*New customers\*\* can be monitored and nurtured toward becoming loyal customers.

\- Comparing \*\*RFM segmentation with K-Means clustering\*\* provides both a business-rule perspective and a data-driven ML perspective on customer behavior.



\---



\## 📁 Project Structure



```text

E-commerce-Customer-Segmentation-RFM-Analysis/

│

├── data/

│   ├── raw/

│   └── processed/

│       ├── customer\_rfm.csv

│       ├── customer\_rfm\_ml.csv

│       ├── ml\_cluster\_profile.csv

│       ├── rfm\_ml\_comparison.csv

│       └── segment\_summary.csv

│

├── notebooks/

│   ├── 01\_Data\_Exploration.ipynb

│   ├── 02\_RFM\_Analysis.ipynb

│   └── 03\_ML\_Customer\_Clustering.ipynb

│

├── powerbi/

│   └── ecommerce\_customer\_rfm\_dashboard.pbix

│

├── reports/

│   └── screenshots/

│

├── sql/

│   ├── 01\_Create\_Database.sql

│   ├── 02\_Create\_Customer\_RFM\_Table.sql

│   └─── 03\_Customer\_Analysis.sql

│   

│

├── src/

│   └── export\_mysql\_to\_excel.py

│

├── .gitignore

├── README.md

└── requirements.txt

```



> Large transaction-level datasets and local Python virtual environments are excluded from the repository using `.gitignore`.



\---



\## 🚀 How to Run



\### 1. Clone the repository



```bash

git clone https://github.com/DevyaniGit009/E-commerce-Customer-Segmentation-RFM-Analysis.git

cd E-commerce-Customer-Segmentation-RFM-Analysis

```



\### 2. Install Python dependencies



```bash

pip install -r requirements.txt

```



\### 3. Explore the notebooks



Start with:



```text

notebooks/01\_Data\_Exploration.ipynb

```



Then continue with:



```text

notebooks/02\_RFM\_Analysis.ipynb

notebooks/03\_ML\_Customer\_Clustering.ipynb

```



\### 4. SQL Analysis



The SQL scripts are available in:



```text

sql/

```



The original large transaction dataset is not included in the repository, so reproducing the complete pipeline requires access to the original dataset.



\### 5. Power BI



Open:



```text

powerbi/ecommerce\_customer\_rfm\_dashboard.pbix

```



to explore the interactive dashboard.



\---



\## 📌 Key Skills Demonstrated



\*\*Data Analytics\*\*

\- Data Cleaning

\- Exploratory Data Analysis

\- RFM Analysis

\- Customer Segmentation

\- Business KPI Analysis

\- Data Visualization



\*\*SQL \& Databases\*\*

\- MySQL

\- SQL Queries

\- Aggregations

\- Customer Analysis

\- Revenue Analysis

\- Data Validation



\*\*Machine Learning\*\*

\- Feature Transformation

\- Standardization

\- K-Means Clustering

\- Silhouette Score

\- Cluster Interpretation



\*\*Business Intelligence\*\*

\- Power BI

\- Dashboard Design

\- KPI Reporting

\- Interactive Analysis

\- Business Storytelling



\*\*Tools\*\*

\- Python

\- Jupyter Notebook

\- MySQL

\- Power BI

\- Git \& GitHub



\---



\## 👩‍💻 Author



\*\*Devyani Daphal\*\*



Computer Engineering | Data Science



Interested in \*\*Data Analytics, Business Analytics, SQL, Python, Machine Learning and Business Intelligence\*\*.



\---



⭐ If you found this project useful, feel free to explore the notebooks, SQL analysis and Power BI dashboard.

