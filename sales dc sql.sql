select * from sales;

SELECT order_number, date, product_line, total
FROM sales;

-- count of total sales
SELECT COUNT(*)
FROM sales;

-- calculating average of UNIT_PRICE
SELECT AVG(unit_price)
FROM sales;

-- Calculating the average sales over moving window of 7 days.  
    SELECT 
    date,
    total,
    AVG(total) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_7day_avg
FROM sales
WHERE date IS NOT NULL
ORDER BY date;

-- Percentaile Analysis ( calculating values that fall within specific percentiles(25th, 50th,75th)
WITH RankedSales AS (
    SELECT 
        total,
        NTILE(4) OVER (ORDER BY total) AS quartile
    FROM sales
    WHERE total IS NOT NULL
)
SELECT
    MIN(CASE WHEN quartile = 1 THEN total END) AS percentile_25,
    MIN(CASE WHEN quartile = 2 THEN total END) AS percentile_50,
    MIN(CASE WHEN quartile = 3 THEN total END) AS percentile_75
FROM RankedSales;

-- Top selling products within basis of client type or warehouse
SELECT
    client_type,
    product_line,
    SUM(total) AS total_sales,
    RANK() OVER (PARTITION BY client_type ORDER BY SUM(total) DESC) AS rnk
FROM sales
WHERE total IS NOT NULL AND client_type IS NOT NULL AND product_line IS NOT NULL
GROUP BY client_type, product_line
ORDER BY client_type, rnk;

-- Calculate the total sales for each payment type, showing the count of orders for each payment type.
SELECT
    payment,
    COUNT(order_number) AS order_count,
    SUM(total) AS total_sales
FROM sales
WHERE payment IS NOT NULL
GROUP BY payment
ORDER BY total_sales DESC;

--  Categorize customers into different spending segments (e.g., High Spenders, Medium Spenders, Low Spenders) based on their total purchase amount.
WITH CustomerSpending AS (
    SELECT
        client_type,
        SUM(total) AS total_spending
    FROM sales
    WHERE client_type IS NOT NULL AND total IS NOT NULL
    GROUP BY client_type
),
SpendingSegments AS (
    SELECT
        client_type,
        total_spending,
        NTILE(3) OVER (ORDER BY total_spending DESC) AS segment
    FROM CustomerSpending
)
SELECT
    client_type,
    total_spending,
    CASE
        WHEN segment = 1 THEN 'High Spender'
        WHEN segment = 2 THEN 'Medium Spender'
        WHEN segment = 3 THEN 'Low Spender'
    END AS spending_segment
FROM SpendingSegments
ORDER BY total_spending DESC;

-- Analyze the sales performance of different product lines in each warehouse.
SELECT
    warehouse,
    product_line,
    SUM(total) AS total_sales,
    COUNT(order_number) AS order_count
FROM sales
WHERE warehouse IS NOT NULL AND product_line IS NOT NULL AND total IS NOT NULL
GROUP BY warehouse, product_line
ORDER BY warehouse, total_sales DESC;

-- Examine the distribution of payment methods and their impact on payment fees.
SELECT
    payment,
    COUNT(order_number) AS order_count,
    AVG(payment_fee) AS average_payment_fee,
    SUM(payment_fee) AS total_payment_fees
FROM sales
WHERE payment IS NOT NULL AND payment_fee IS NOT NULL
GROUP BY payment
ORDER BY order_count DESC;

