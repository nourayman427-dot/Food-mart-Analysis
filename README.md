# Food-mart-Analysis
End to end sales, customers and products analysis with SQL server and power bi to create helpful insights on regions, stores and products performance


 Sales & Customer Analysis Project

 📌 Project Overview
This project focuses on analyzing sales performance, customer behavior, and regional store efficiency.
The goal is to understand purchasing patterns, compare transaction values across regions and stores,
in order to support data-driven business decisions.

---

## 🎯 Objectives
- Identify top-performing regions and stores
- Analyze customer segments by income and membership type
- Compare transaction value across regions 
- Evaluate profitability vs store count

---

## 🛠 Tools & Technologies
- SQL Server (Data Cleaning, Modeling, Analysis)
- Power BI (Visualization & Dashboards)
- Excel / CSV (Raw Data)
- GitHub (Version Control)

---

🔧 **Data Preparation & Transformation (ETL Steps)**

-import raw data from csv file and consolidated data in stagging tables in sql server
-Ensure all raw data is capurted without any modification
- moved data from staging tables to main tables
-establish relationship between tables for easy quering 
- checked for null and duplicate records
-create view for analysis 


**  📌 loading in power Bi 

-imported cleaned and transformed data into power BI
-build relationship, measures, kpis and mdel table for dashbords
-use dashbord to extract helpful insights
---

## 📊 Dashboards
- Sales Overview
- Regions & Store Performance
- Customer Analysis
- Product & Market Basket Analysis
- return pattern analysis

Screenshots are available in the screenshots/ folder.

---

## 🔍 Key Insights
-identifying top performing regions and stores by sales
-comparing store performance to detect most effecient store type
-understanding the relationship between store size and transaction volume by store type 
- Increasing store count does not always improve profit margin in some store types
- Certain customer income segments drive the majority of revenue ( 10K- 50K)
- Some products  have high return rates and low sales and needed actions must be taken
-sustainabilty products are more attractive to customers
-customers with no children or large families ( +5 children ) show significcantly lower purchases rates.


---

## 📂 Repository Structure
See folders:
- sql/ for all SQL scripts
- powerbi/ for Power BI dashboard
- data/ for raw and processed data

---

## 🚀 Next Improvements
- Add time-series forecasting
- Automate ETL process
- Enhance Market Basket Analysis with lift & confidence

---

👩‍💻 Author

Nour Ayman Power BI | Data Analytics | Visualization Profile : https://github.com/nourayman427-dot

Linkedin : www.linkedin.com/in/nour-ayman-220b11155

Gmail : nourayman427@gmail.com
