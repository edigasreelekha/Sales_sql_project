# Sales_sql_project

This repository contains SQL queries and scripts for analyzing sales data based on a provided schema. The project focuses on demonstrating various SQL techniques for data exploration, aggregation, and analysis.


## Project Description

This project aims to provide a collection of SQL queries designed to analyze sales data. The queries cover a range of complexities, from basic data retrieval to advanced analytical techniques, including window functions, conditional aggregation, and date-based analysis.


## Database Schema

The sales data is stored in a table named `sales` with the following schema:

| Column Name   | Data Type         | Nullable | Description                               |
|---------------|-------------------|----------|-------------------------------------------|
| order_number  | character varying | No       | Unique identifier for each order          |
| date          | date              | Yes      | Date of the order                         |
| warehouse     | character varying | Yes      | Location of the warehouse                 |
| client_type   | character varying | Yes      | Type of client (e.g., Retail, Wholesale) |
| product_line  | character varying | Yes      | Category of the product                   |
| quantity      | integer           | Yes      | Number of units sold                      |
| unit_price    | double precision  | Yes      | Price per unit                            |
| total         | numeric           | Yes      | Total sales amount for the order          |
| payment       | character varying | Yes      | Method of payment                         |
| payment_fee   | double precision  | Yes      | Fee associated with the payment           |

## Getting Started

### Prerequisites

- A relational database management system (RDBMS) such as PostgreSQL, MySQL, SQL Server, or SQLite.
- A SQL client or IDE (e.g., pgAdmin, MySQL Workbench, DBeaver).

### Installation

1. Clone the repository to your local machine:

    - git clone [repository URL]

   
- Create a database and import the sales table schema. You can use the following SQL script to create the table:

## SQL

- CREATE TABLE sales (
    - order_number VARCHAR(255) NOT NULL,
    - date DATE,
   - warehouse VARCHAR(255),
   - client_type VARCHAR(255),
   - product_line VARCHAR(255),
   - quantity INTEGER,
   - unit_price DOUBLE PRECISION,
   - total NUMERIC,
   - payment VARCHAR(255),
   - payment_fee DOUBLE PRECISION
);


### Populate the sales table with your sales data.

## SQL Queries

- Basic Queries
- Select All Data: SELECT * FROM sales;
- Filter Data: SELECT * FROM sales WHERE client_type = 'Retail';
- Aggregate Data: SELECT product_line, SUM(total) FROM sales GROUP BY product_line;
- Order Data: SELECT * FROM sales ORDER BY total DESC;
  
## Advanced Queries

- Rolling/Moving Averages: Calculate sales trends over time.
- Percentile Analysis: Identify top/bottom performers.
- Window Functions for Ranking: Rank products by sales within categories.
- Conditional Aggregation: Analyze sales by payment type.
- Date-Based Analysis: Calculate monthly sales growth.
- Customer Segmentation: Categorize customers based on spending.
- Product Performance by Warehouse: Analyze product sales in different warehouses.
- Payment Method Analysis: Examine payment method distribution and fees.
- Sales Trend by Product Line: Visualize sales trends over time.
 
(Refer to the SQL files in the repository for specific query implementations.)

## Usage

Open your SQL client or IDE.
Connect to your database.
Open the desired SQL script from the repository.
Execute the script.
Analyze the results.

## Contributing

Contributions are welcome! If you have any improvements, new queries, or suggestions, please follow these steps:

## Fork the repository.

- Create a new branch for your feature or fix.
- Commit your changes.
- Push to the branch.
- Open a pull request. 

## License

This project is licensed under the [MIT License]().


## Author 

EDIGA SREELEKHA


srilekhagowd8@gmail.com
