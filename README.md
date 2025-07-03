# Marketing Campaign Performance Dashboard

This project demonstrates a complete data analytics workflow: from raw CSV ingestion using Python, to SQL analysis in PostgreSQL, to interactive visualizations in Looker Studio. It simulates a real-world scenario for evaluating the effectiveness of digital marketing campaigns.

---

## Project Overview

**Goal:**  
Provide marketing stakeholders with an interactive dashboard that reveals which campaigns are generating the highest ROI, engagement, and revenue across channels.

**Key Questions Answered:**
- Which campaigns are the most profitable?
- What’s the average conversion rate by category?
- How do campaign metrics trend over time?
- Where are marketing dollars being spent efficiently?

---

## 🧠 Tech Stack

| Tool           | Purpose                                |
|----------------|----------------------------------------|
| `Python`       | Load and clean CSV data                |
| `Pandas`       | Data manipulation and datetime parsing |
| `PostgreSQL`   | SQL queries and database storage       |
| `Looker Studio`| Data visualization and reporting       |

---

## 🧱 Project Workflow

1. **Load Data into PostgreSQL**  
   A Python script (`load_to_sql.py`) reads a marketing CSV, formats dates, and loads it into a PostgreSQL database.

2. **SQL Analysis**  
   The `dashboard_queries.sql` file contains all analytical queries used for KPIs, such as:
   - Total revenue
   - Campaign ROI
   - Rolling 7-day revenue
   - CPC, conversion rates, and more

3. **Dashboard Creation**  
   Google Looker Studio is used to connect to the processed data and build interactive visualizations.

---

## 📈 Dashboard Features

- 🔢 **Scorecards** for total revenue, impressions, and profitability
- 📊 **Top campaigns by revenue and ROI**
- 📉 **7-day rolling average** revenue trend
- 📂 **Category-level CPC and conversion rates**
- 🔍 **Interactive filters** by date and category
- 📥 Pre-calculated CSVs used for consistent data flow

---

## 🔗 View the Dashboard

👉 [Live Dashboard](https://tinyurl.com/alanthomasdashboard)  

---

## 📂 Repository Structure




---



