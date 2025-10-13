# 🛒 Retail Sales Performance Analysis: Driving Profitability Through Data

### 📊 A Data Analytics Portfolio Project by [Your Name]  
**Tools:** Python · SQL · Power BI · Jupyter Notebook

---

## 🧭 Executive Summary

This project analyzes sales data from a mid-sized retail company to uncover insights that can drive profitability, improve regional performance, and optimize product pricing.  
By combining **SQL**, **Python**, and **Power BI**, this end-to-end analysis delivers both technical rigor and business relevance.

The project highlights:
- Key revenue and profit trends.
- Category and regional performance.
- Actionable recommendations for management.

---

## 🧩 Business Problem

The company’s management team has raised concerns about **stagnant profit growth** despite stable sales volumes.  
They suspect uneven regional performance, cost inflation, and inefficient product pricing may be affecting profitability.

### **Business Questions**
1. Which product categories and regions are most and least profitable?  
2. What are the key factors influencing profit margins?  
3. How can the company improve sales forecasting and inventory decisions?  
4. Which customer segments drive the most value?

---

## ⚙️ Methodology

### **1. Data Sources and Schema**
The dataset includes transactional and reference data stored in SQL tables:

| Table | Description |
|-------|--------------|
| `sales` | Daily sales transactions including revenue and cost |
| `products` | Product details: category, cost, and price |
| `stores` | Store information including location and region |
| `customers` | Customer demographics and loyalty segments |

**Database Schema Example:**
```sql
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    date DATE,
    product_id INT,
    store_id INT,
    customer_id INT,
    quantity INT,
    revenue DECIMAL(10,2),
    cost DECIMAL(10,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    region VARCHAR(50),
    store_size VARCHAR(20)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age_group VARCHAR(20),
    loyalty_status VARCHAR(20)
);
