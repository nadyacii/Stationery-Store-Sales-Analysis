-- ============================================
-- STATIONERY STORE SQL ANALYSIS
-- Bootcamp Karirnex - Task 1
-- ============================================


-- Task 1: Menampilkan kolom ID Customer dan Order Date dengan 100 transaksi terbaru
SELECT
    ID_Customer,
    Order_date
FROM transactions
ORDER BY Order_date DESC
LIMIT 100;


-- Task 2: Menampilkan jumlah quantity terjual per Brand
SELECT
    Brand,
    SUM(Kuantitas) AS Total_Kuantitas_Terjual
FROM transactions
GROUP BY Brand
ORDER BY Total_Kuantitas_Terjual DESC;


-- Task 3: Menampilkan Top 10 ID Customer dengan Grand Total terbanyak
SELECT
    ID_Customer,
    SUM(Grand_Total) AS Total_Belanja
FROM transactions
GROUP BY ID_Customer
ORDER BY Total_Belanja DESC
LIMIT 10;


-- Task 4: Menampilkan semua barang dan harga dari brand Scriba
SELECT DISTINCT
    Product,
    Harga,
    Brand
FROM transactions
WHERE Brand = 'Scriba'
ORDER BY Product;


-- Task 5: Menampilkan 10 product dan harga dengan harga termurah
SELECT DISTINCT
    Product,
    Harga
FROM transactions
ORDER BY Harga ASC
LIMIT 10;