# SQL Sales Dashboard

## Project Overview

This project is a Sales Analysis project built using MySQL and SQL.

The project uses a relational sales database containing customer, product, order, and order detail information. SQL queries are used to analyze sales performance and generate business insights.

## Objective

The objective of this project is to analyze sales data and identify important business trends related to revenue, profit, products, customers, regions, payments, and orders.

## Tools Used

- MySQL 8.0
- MySQL Workbench
- SQL
- GitHub
- Jira

## Database Tables

The project contains four tables:

1. Customers
2. Products
3. Orders
4. Order_Details

## Key Analysis

### Sales Analysis
- Total Revenue
- Total Orders
- Total Quantity Sold
- Total Profit
- Average Order Value
- Profit Margin

### Product Analysis
- Sales by Product
- Quantity Sold
- Top 5 Products
- Highest Revenue Product
- Highest Profit Product

### Category Analysis
- Sales by Category
- Profit by Category
- Best Performing Category

### Regional Analysis
- Sales by Region
- Sales by City
- Best Performing Region
- Lowest Performing Region

### Customer Analysis
- Top 5 Customers
- Customer Revenue
- Customer Order Count
- Customers with Multiple Orders

### Monthly Analysis
- Monthly Sales
- Monthly Profit
- Monthly Orders
- Highest Sales Month
- Lowest Sales Month

### Payment Analysis
- Sales by Payment Method
- Orders by Payment Method
- Most Used Payment Method

### Order Analysis
- Completed Orders
- Cancelled Orders
- Order Status Distribution
- Cancellation Rate

### Profit Analysis
- Profit by Product
- Profit by Category
- Total Profit
- Profit Margin

## Database Structure

```text
Customers
    |
    | customer_id
    v
Orders
    |
    | order_id
    v
Order_Details
    |
    | product_id
    v
Products
