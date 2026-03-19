# 📊 CRM SQL Analysis & Python Program

### 📘 Course: MIS 443 – Business Data Management

---

## 👥 Team Members

* **Pham Thuy Huyen** – Student ID: 2132309006
* **Le Anh Khuong** – Student ID: 2332309001

---

## 📌 Project Overview

This project focuses on analyzing Customer Relationship Management (CRM) data to support business decision-making through SQL and data visualization techniques.

The goal is to transform raw CRM sales data into meaningful insights by applying data cleaning, database design, and analytical processes, and then presenting the results through structured analysis and visualizations.

The project simulates a real-world business scenario where data analysts work with CRM systems to evaluate sales performance, customer behavior, and operational efficiency.

---

## 🎯 Objectives

* Analyze CRM sales data to identify key business insights
* Design and implement a relational database system
* Perform data cleaning and transformation
* Use SQL for querying and analysis
* Apply Python for data extraction and visualization
* Support data-driven decision-making

---

## 🛠️ Tools & Technologies

* **SQL (PostgreSQL)** – Data storage, querying, and transformation
* **Python (Pandas, SQLAlchemy, Psycopg2)** – Data extraction and analysis
* **Power Query** – Data cleaning
* **Data Modeling** – Star Schema design

---

## 🗂️ Dataset Description

The dataset consists of four main tables:

* **sales_pipeline** – Contains all sales opportunity records
* **accounts** – Customer company information
* **products** – Product catalog
* **sales_teams** – Sales organization structure

These tables are structured into a relational database where:

* `sales_pipeline` acts as the **Fact Table**
* Other tables serve as **Dimension Tables**

This structure enables efficient data analysis and reporting.

---

## 🧹 Data Cleaning & Preparation

* Removed incomplete records (e.g., “Engaging” deals)
* Standardized date formats
* Fixed inconsistent product naming
* Verified revenue values and data types

---

## 🏗️ Database Design

The project uses a **Star Schema model**:

* **Fact Table:** sales_pipeline
* **Dimension Tables:** accounts, products, sales_teams

Relationships:

* One-to-many relationships between dimension tables and fact table
* Foreign keys ensure referential integrity

---

## ⚙️ Data Processing & SQL Analysis

SQL is used to:

* Insert and update CRM data
* Perform JOIN operations across multiple tables
* Extract business insights

Example analyses include:

* High-value deals identification
* Sales performance evaluation
* Customer segmentation

---

## 📊 Data Analysis & Insights

### 1. Regional Revenue Performance

* Revenue is concentrated in key regions
* Some regions underperform

---

### 2. Product Pricing & Discount Trends

* Price variation exists across products
* Some products maintain stable pricing

---

### 3. Sector Performance Analysis

* Certain industries generate higher deal volume
* Some sectors have lower conversion rates

---

## 🔗 Python Integration

* Connect database using SQLAlchemy and Psycopg2
* Extract data with SQL queries
* Analyze using Pandas

---

## 📈 Business Impact

* Improves visibility of sales performance
* Supports strategic decision-making
* Enhances understanding of CRM systems

---

## ✅ Conclusion

This project demonstrates how SQL and Python can transform CRM data into actionable insights, supporting data-driven decision-making and improving business performance.

---

## 🚀 Future Improvements

* Develop interactive BI dashboards
* Enable real-time data updates
* Apply predictive analytics

---
