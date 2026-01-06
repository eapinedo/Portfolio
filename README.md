# 🛒 Amazon Sales & Sentiment Analytics

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![SQL Server](https://img.shields.io/badge/SQL%20Server-2025-red)
![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

## 📖 Overview

This project analyzes over 1,000 Amazon product ratings and reviews to uncover insights into pricing strategies, customer sentiment, and product performance. 

By simulating a real-world data pipeline, this project involves **Extracting, Transforming, and Loading (ETL)** data using Python, storing it in a **SQL Server** database for querying, and visualizing key performance indicators (KPIs) via an interactive **Power BI Dashboard**.

## 🎯 Business Objective

The goal is to solve key e-commerce challenges:
* **Pricing Strategy:** How does discount depth (High vs. Low) impact customer engagement?
* **Category Dominance:** Which categories drive the most revenue vs. volume?
* **Customer Sentiment:** Do expensive products actually get better ratings?
* **Personalization:** Building a content-based recommendation engine to improve cross-selling.

## 📂 Dataset

The dataset consists of 1K+ records of Amazon products, including pricing, ratings, and textual reviews.

| Feature | Description |
| :--- | :--- |
| `product_id` | Unique Product ID |
| `product_name` | Name of the Product |
| `category` | Hierarchical category (e.g., Computers\|Accessories) |
| `discounted_price` | Final price after discount |
| `actual_price` | Original MSRP |
| `discount_percentage` | Percentage of discount offered |
| `rating` | Average product rating (0-5) |
| `rating_count` | Total number of ratings |
| `about_product` | Product description |
| `user_id` | ID of the user who wrote the review |

*Data Source: Official Amazon Website Data (Simulated/Scraped)*

## 🛠️ Tools & Technologies

* **Python (Pandas, NumPy, Seaborn):** Used for Data Cleaning, Preprocessing, and Exploratory Data Analysis (EDA).
* **SQL Server (T-SQL):** Data warehousing using CTEs, Window Functions, and Ranking algorithms.
* **Power BI:** Dashboarding with DAX measures, Data Modeling, and Custom Visualization.

## ⚙️ Methodology & Steps

### 1. Data Cleaning & ETL (Python)
Raw e-commerce data is messy. The following steps were taken:
* **Regex Cleaning:** Removed currency symbols (`$`) and commas from price columns to convert them to numeric types.
* **Category Parsing:** The `category` column contained hierarchical strings. These were split to extract the `Main Category` and `Sub-Category`.
* **Type Conversion:** Converted `discount_percentage` and `rating_count` to integers/floats.
* **Error Handling:** Fixed data corruption in the `rating` column (e.g., removing `|` characters).

### 2. Advanced SQL Analysis
Moving beyond simple aggregations, I used **T-SQL Window Functions**:
* **`DENSE_RANK()`**: To identify the Top 3 Best-Selling products per category.
* **`LAG()`**: To analyze price gaps between product tiers.
* **`AVG() OVER()`**: To compare individual product prices against their category average.
* **CTEs (Common Table Expressions):** Used to clean data on-the-fly for reporting.

### 3. Interactive Dashboard (Power BI)
Built a dynamic report focusing on 3 Core Views:
* **Financial View:** Donut Chart showing *Revenue Share by Main Category*.
* **Strategic View:** Scatter Chart showing the *Discount Sweet Spot* (Correlation between Discount % and Review Volume).
* **Customer View:** Clustered Column Chart analyzing *Rating Distributions* across Budget vs. Premium segments.

## 📊 Dashboard Snapshot

![Dashboard Placeholder]()

**Key Insights:**
1.  **The "Sweet Spot":** Products discounted between **40-50%** see the highest volume of engagement. Deep discounts (>70%) often correlate with lower ratings (perceived low quality).
2.  **Revenue Drivers:** While "Electronics" has the highest volume, "Home & Kitchen" generates more consistent revenue due to higher average unit prices.
3.  **Price Sensitivity:** There is no strong correlation between high price and high rating, suggesting Amazon customers value "utility" over "premium status."

## 🚀 How to Run This Project

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/eapinedo/Portfolio.git](https://github.com/eapinedo/Portfolio.git)
    ```
2.  **Install Python Dependencies**
    ```bash
    pip install pandas numpy matplotlib seaborn sqlalchemy
    ```
3.  **Run the Analysis**
    * Open `src/python_script.ipynb`.
    * Run the cells to generate the clean CSV.
4.  **SQL Setup**
    * Import `amazon.csv` into SQL Server.
    * Execute `sql/sales_queries.sql` to generate insights.
5.  **View Dashboard**
    * Open `dashboard/Amazon Sales Dashboard.pbix` in Power BI Desktop.

## 🔮 Future Scope
* **Cloud Deployment:** Automate the ETL pipeline using **Apache Airflow** or **Azure Data Factory**.
* **Sentiment Classification:** Use **BERT** or **VADER** to classify review text as Positive/Negative to augment the star rating.

## 👤 Author

**Emilio Pinedo**
* [LinkedIn Profile](https://linkedin.com/in/emilio-pinedo)
