-- 1. Overall Sales Performance

SELECT
    COUNT(DISTINCT ID_Transaction) AS Total_Transactions,
    SUM(Kuantitas) AS Total_Quantity_Sold,
    SUM(Total_Sales) AS Total_Sales,
    SUM(Total_Diskon) AS Total_Discount,
    SUM(Biaya_Ongkir) AS Total_Shipping_Cost,
    SUM(Grand_Total) AS Total_Grand_Total,
    ROUND(AVG(Grand_Total), 0) AS Average_Order_Value
FROM transactions;

-- 2. Monthly Sales Performance
SELECT
    DATE_FORMAT(Order_date, '%Y-%m') AS Tahun_Bulan,
    COUNT(DISTINCT ID_Transaction) AS Total_Transactions,
    SUM(Kuantitas) AS Total_Quantity,
    SUM(Total_Sales) AS Total_Sales
FROM transactions
GROUP BY Tahun_Bulan
ORDER BY Tahun_Bulan;

-- 3 Top 10 Products by Sales

SELECT
    Product,
    SUM(Kuantitas) AS Total_Kuantitas_Terjual,
    SUM(Total_Sales) AS Total_Sales
FROM transactions
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4. Top 10 Products by Quantity Sold

SELECT
    Product,
    SUM(Kuantitas) AS Total_Kuantitas_Terjual,
    SUM(Total_Sales) AS Total_Sales
FROM transactions
GROUP BY Product
ORDER BY Total_Kuantitas_Terjual DESC
LIMIT 10;

-- 5. Product Contribution to Total Sales

SELECT
    Product,
    SUM(Total_Sales) AS Total_Sales,
    ROUND(
        SUM(Total_Sales) /
        (SELECT SUM(Total_Sales) FROM transactions) * 100,
        2
    ) AS Sales_Contribution_Percentage
FROM transactions
GROUP BY Product
ORDER BY Total_Sales DESC;

-- 6. Brand Performance by Sales

SELECT
    Brand,
    SUM(Kuantitas) AS Total_Kuantitas_Terjual,
    SUM(Total_Sales) AS Total_Sales
FROM transactions
GROUP BY Brand
ORDER BY Total_Sales DESC;

-- 2.4.2 Top 5 Brands by Quantity Sold

SELECT
    Brand,
    SUM(Kuantitas) AS Total_Kuantitas_Terjual
FROM transactions
GROUP BY Brand
ORDER BY Total_Kuantitas_Terjual DESC
LIMIT 5;

-- 2.4.3 Brand Contribution to Total Sales

SELECT
    Brand,
    SUM(Total_Sales) AS Total_Sales,
    ROUND(
        SUM(Total_Sales) /
        (SELECT SUM(Total_Sales) FROM transactions) * 100,
        2
    ) AS Sales_Contribution_Percentage
FROM transactions
GROUP BY Brand
ORDER BY Total_Sales DESC;

-- 2.5.1 Top 10 Customers by Total Spending

SELECT
    t.ID_Customer,
    c.Nama_Customer,
    c.Kota,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas,
    SUM(t.Grand_Total) AS Total_Spending
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY
    t.ID_Customer,
    c.Nama_Customer,
    c.Kota
ORDER BY Total_Spending DESC
LIMIT 10;

-- 2.5.2 Top 10 Customers by Transaction Frequency

SELECT
    t.ID_Customer,
    c.Nama_Customer,
    c.Kota,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas,
    SUM(t.Grand_Total) AS Total_Spending
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY
    t.ID_Customer,
    c.Nama_Customer,
    c.Kota
ORDER BY Total_Transaksi DESC
LIMIT 10;


-- 2.5.3 Customer Spending by City

SELECT
    c.Kota,
    COUNT(DISTINCT c.ID_Customer) AS Total_Customer,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas,
    SUM(t.Grand_Total) AS Total_Spending
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY c.Kota
ORDER BY Total_Spending DESC;

-- 2.5.4 Average Spending per Customer

SELECT
    c.Kota,
    COUNT(DISTINCT t.ID_Customer) AS Total_Customer,
    SUM(t.Grand_Total) AS Total_Spending,
    ROUND(
        SUM(t.Grand_Total) / COUNT(DISTINCT t.ID_Customer),
        0
    ) AS Average_Spending_Per_Customer
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY c.Kota
ORDER BY Average_Spending_Per_Customer DESC;


-- 2.6.1 Sales by City

SELECT
    c.Kota,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas_Terjual,
    SUM(t.Total_Sales) AS Total_Sales
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY c.Kota
ORDER BY Total_Sales DESC;

-- 2.6.2 Customer Distribution by City

SELECT
    Kota,
    COUNT(DISTINCT ID_Customer) AS Total_Customer
FROM customer
GROUP BY Kota
ORDER BY Total_Customer DESC;

-- 2.6.3 Sales Contribution by City

SELECT
    c.Kota,
    SUM(t.Total_Sales) AS Total_Sales,
    ROUND(
        SUM(t.Total_Sales) /
        (SELECT SUM(Total_Sales) FROM transactions) * 100,
        2
    ) AS Sales_Contribution_Percentage
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY c.Kota
ORDER BY Total_Sales DESC;

-- 2.6.4 Average Sales per Customer by City

SELECT
    c.Kota,
    COUNT(DISTINCT t.ID_Customer) AS Total_Customer,
    SUM(t.Total_Sales) AS Total_Sales,
    ROUND(
        SUM(t.Total_Sales) /
        COUNT(DISTINCT t.ID_Customer),
        0
    ) AS Average_Sales_Per_Customer
FROM transactions t
JOIN customer c
    ON t.ID_Customer = c.ID_Customer
GROUP BY c.Kota
ORDER BY Average_Sales_Per_Customer DESC;

-- 2.7.1 Order Distribution by Status

SELECT
    s.`Status Order`,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi
FROM transactions t
JOIN status s
    ON t.ID_Transaction = s.ID_Transaction
GROUP BY s.`Status Order`
ORDER BY Total_Transaksi DESC;

-- 2.7.2 Order Status Percentage

SELECT
    s.`Status Order`,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    ROUND(
        COUNT(DISTINCT t.ID_Transaction) /
        (SELECT COUNT(DISTINCT ID_Transaction) FROM transactions) * 100,
        2
    ) AS Persentase_Transaksi
FROM transactions t
JOIN status s
    ON t.ID_Transaction = s.ID_Transaction
GROUP BY s.`Status Order`
ORDER BY Persentase_Transaksi DESC;

-- 2.7.3 Sales Performance by Order Status

SELECT
    s.`Status Order`,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas,
    SUM(t.Total_Sales) AS Total_Sales,
    SUM(t.Grand_Total) AS Total_Grand_Total
FROM transactions t
JOIN status s
    ON t.ID_Transaction = s.ID_Transaction
GROUP BY s.`Status Order`
ORDER BY Total_Sales DESC;


-- 2.7.4 Completed vs Non-Completed Transactions

SELECT
    CASE
        WHEN s.`Status Order` = 'Completed'
            THEN 'Completed'
        ELSE 'Non-Completed'
    END AS Transaction_Category,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Total_Sales) AS Total_Sales
FROM transactions t
JOIN status s
    ON t.ID_Transaction = s.ID_Transaction
GROUP BY Transaction_Category
ORDER BY Total_Transaksi DESC;

-- 2.8.1 Transaction Distribution by Payment Method

SELECT
    p.Payment,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi
FROM transactions t
JOIN payment p
    ON t.ID_Transaction = p.ID_Transaction
GROUP BY p.Payment
ORDER BY Total_Transaksi DESC;

-- 2.8.2 Sales Performance by Payment Method

SELECT
    p.Payment,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Kuantitas) AS Total_Kuantitas,
    SUM(t.Total_Sales) AS Total_Sales
FROM transactions t
JOIN payment p
    ON t.ID_Transaction = p.ID_Transaction
GROUP BY p.Payment
ORDER BY Total_Sales DESC;

-- 2.8.3 Payment Contribution to Total Sales

SELECT
    p.Payment,
    SUM(t.Total_Sales) AS Total_Sales,
    ROUND(
        SUM(t.Total_Sales) /
        (SELECT SUM(Total_Sales) FROM transactions) * 100,
        2
    ) AS Sales_Contribution_Percentage
FROM transactions t
JOIN payment p
    ON t.ID_Transaction = p.ID_Transaction
GROUP BY p.Payment
ORDER BY Total_Sales DESC;

-- 2.8.4 Average Transaction Value by Payment Method

SELECT
    p.Payment,
    COUNT(DISTINCT t.ID_Transaction) AS Total_Transaksi,
    SUM(t.Grand_Total) AS Total_Grand_Total,
    ROUND(
        SUM(t.Grand_Total) /
        COUNT(DISTINCT t.ID_Transaction),
        0
    ) AS Average_Transaction_Value
FROM transactions t
JOIN payment p
    ON t.ID_Transaction = p.ID_Transaction
GROUP BY p.Payment
ORDER BY Average_Transaction_Value DESC;