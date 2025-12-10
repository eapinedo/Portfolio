# 🛒 Amazon Sales & Sentiment Analytics

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-red)
![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

## 📖 Overview

This project analyzes over 1,000 Amazon product ratings and reviews to uncover insights into pricing strategies, customer sentiment, and product performance. 

By simulating a real-world data pipeline, this project involves **Extracting, Transforming, and Loading (ETL)** data using Python, storing it in a **SQL Server** database for querying, and visualizing key performance indicators (KPIs) via an interactive **Power BI Dashboard**.

## 🎯 Business Objective

The goal of this analysis is to answer key business questions:
* How does discount depth correlate with customer ratings?
* Which product categories generate the most engagement?
* What is the relationship between actual price and discounted price across categories?
* **Sentiment Analysis:** Understanding customer satisfaction through rating distributions.

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
| `review_content` | Long-form textual review |

*Data Source: Official Amazon Website Data (Simulated/Scraped)*

## 🛠️ Tools & Technologies

* **Python (Pandas, NumPy, Seaborn):** Used for Data Cleaning, Preprocessing, and Exploratory Data Analysis (EDA).
* **SQL Server:** Used as the data warehouse to run complex queries and aggregations.
* **Power BI:** Used to build the interactive dashboard and report.
* **DAX:** Used for calculating measures like *Average Rating* and *Total Revenue Estimates*.

## ⚙️ Methodology & Steps

### 1. Data Cleaning & Preprocessing (Python)
Raw data from e-commerce is rarely clean. The following steps were taken:
* **Currency Cleaning:** Removed currency symbols (`₹`, `$`) and commas from price columns to convert them to numeric types.
* **Category Parsing:** The `category` column contained hierarchical strings. These were split to extract the `Main Category` and `Sub-Category`.
* **Type Conversion:** Converted `discount_percentage` and `rating_count` to integers/floats.
* **Handling Nulls:** Imputed missing rating values with the category mean.

### 2. Exploratory Data Analysis (EDA)
Performed univariate and bivariate analysis to understand distributions:
* Visualized the distribution of Ratings (mostly skewed towards 4.0+).
* Analyzed the correlation between *Discount Percentage* and *Rating Count*.

### 3. SQL Data Management
* Loaded the cleaned dataframe into **SQL Server**.
* Wrote SQL queries to extract KPIs such as "Top 10 Products by Discount" and "Average Rating per Category."

### 4. Dashboarding (Power BI)
Created a report focusing on the following KPIs:
* **Avg Discount %**: 46% (Example)
* **Total Reviews Processed**: 24K+
* **Category Performance**: Bar charts showing volume by category.

## 📊 Dashboard Snapshot

*(Place a screenshot of your Power BI dashboard here. Example:)*

![Dashboard Placeholder](https://via.placeholder.com/800x400?text=Power+BI+Dashboard+Screenshot)

**Key Insights derived:**
1.  **Discount Sensitivity:** Products with discounts between 30-50% tend to have the highest volume of reviews, suggesting this is the "sweet spot" for conversion.
2.  **Category Dominance:** "Electronics" and "Cables" dominate the dataset in terms of sheer volume, but "Home Appliances" have slightly higher average ratings.
3.  **Pricing Strategy:** There is a weak positive correlation between higher actual prices and lower ratings, suggesting customers are more critical of expensive items.

## 🚀 How to Run This Project

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/yourusername/amazon-analytics-project.git](https://github.com/yourusername/amazon-analytics-project.git)
    ```
2.  **Install Python Dependencies**
    ```bash
    pip install pandas numpy matplotlib seaborn sqlalchemy
    ```
3.  **Run the ETL Script**
    * Open `src/data_cleaning.ipynb` to clean the `amazon.csv` file.
    * This will export a `clean_amazon_data.csv`.
4.  **SQL Setup**
    * Import `clean_amazon_data.csv` into your SQL Server instance.
    * Run queries found in `sql_queries.sql` to verify data.
5.  **View Dashboard**
    * Open `dashboard/Amazon_Analytics.pbix` in Power BI Desktop.

## 🔮 Future Scope
* **NLP Sentiment Analysis:** Implement NLTK or TextBlob to classify `review_content` into Positive/Negative/Neutral tags.
* **Recommendation System:** Build a content-based filtering system using `product_name` and `about_product` to recommend similar items to users.

## 👤 Author

**Emilio Pinedo**
* [LinkedIn Profile](https://linkedin.com/in/emilio-pinedo)

---
*If you find this project useful, please give it a ⭐!*
