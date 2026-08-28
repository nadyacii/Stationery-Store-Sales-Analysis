# Stationery Store Sales Analysis
A sales analytics dashboard developed as part of the Karirnex Bootcamp, providing insights into sales performance, products, customers, payment methods, and order status using SQL and Looker Studio.

---

## 1. Project Overview

Project ini merupakan salah satu project yang saya kerjakan selama mengikuti **Karirnex Bootcamp** pada bidang Data Analytics. Project ini bertujuan untuk menganalisis data transaksi sebuah toko alat tulis dari berbagai perspektif, mulai dari performa penjualan, produk dan brand, customer, lokasi customer, metode pembayaran, hingga status transaksi.

Proses analisis dilakukan menggunakan **MySQL** untuk data processing dan exploratory data analysis (EDA), kemudian hasil analisis divisualisasikan melalui **Looker Studio** dalam bentuk interactive dashboard. Project ini dibuat untuk menghasilkan insight yang dapat membantu memahami kondisi bisnis serta mendukung pengambilan keputusan berdasarkan data.

---

## 2. Project Objectives

Tujuan utama dari project ini adalah:

- Menganalisis performa penjualan secara keseluruhan.
- Mengidentifikasi tren penjualan berdasarkan waktu.
- Mengetahui produk dengan kontribusi sales terbesar.
- Menganalisis performa masing-masing brand.
- Mengidentifikasi customer dengan spending tertinggi.
- Menganalisis distribusi customer berdasarkan kota.
- Mengetahui distribusi transaksi berdasarkan status order.
- Menganalisis preferensi metode pembayaran customer.
- Membuat interactive dashboard untuk memvisualisasikan hasil analisis.
- Menghasilkan business insights dan recommendations berdasarkan data.

---

## 3. Business Questions

Beberapa business questions yang ingin dijawab melalui analisis ini adalah:

### Sales Performance
1. Berapa total sales dan jumlah transaksi selama periode analisis?
2. Bagaimana tren sales dari bulan ke bulan?
3. Bagaimana performa penjualan berdasarkan brand?

### Product Performance
4. Produk apa yang menghasilkan sales terbesar?
5. Produk apa yang memiliki jumlah unit terjual paling tinggi?
6. Brand mana yang memiliki performa sales terbaik?

### Customer Analysis
7. Siapa customer dengan total spending tertinggi?
8. Customer mana yang paling sering melakukan transaksi?
9. Kota mana yang memiliki jumlah customer terbanyak?

### Transaction Analysis
10. Bagaimana distribusi transaksi berdasarkan status order?
11. Berapa besar tingkat penyelesaian transaksi?
12. Metode pembayaran apa yang paling banyak digunakan customer?
13. Bagaimana nilai rata-rata transaksi berdasarkan metode pembayaran?

---

## 4. Dataset Overview

Dataset yang digunakan merupakan dataset transaksi toko alat tulis dalam format Excel.

Data dianalisis menggunakan beberapa tabel yang saling berhubungan, antara lain:

- `transactions` — berisi data transaksi dan informasi penjualan.
- `customer` — berisi informasi customer dan kota.
- `status` — berisi status order.
- `payment` — berisi metode pembayaran.

### Periode Data

Periode transaksi yang dianalisis:

**1 Januari 2022 – 3 Juni 2025**

### Dataset Summary

Berdasarkan dashboard final:

| Metric | Value |
|---|---:|
| Total Sales | Rp647.34 juta |
| Total Transactions | 10,000 |
| Total Quantity Sold | 30,049 |
| Total Customers | 4,500 |
| Average Transaction Value | Rp93.55 ribu |
| Completion Rate | 70.1% |

---

## Tools & Technologies

Tools yang digunakan dalam project ini:

Microsoft Excel — Data preparation dan initial data validation
MySQL — Data processing dan SQL analysis
MySQL Workbench — SQL query development
Looker Studio — Interactive dashboard development
GitHub — Project documentation dan version control

## 5. Data Preparation & Cleaning

Sebelum melakukan analisis, dilakukan proses data preparation untuk memastikan data siap digunakan untuk analisis SQL dan dashboard.

### 1. Data Validation

Dilakukan pengecekan terhadap struktur dan nilai pada dataset untuk memastikan setiap kolom dapat digunakan sesuai dengan kebutuhan analisis.

### 2. Shipping Cost Validation

Nilai `Biaya_Ongkir = 0` dipertahankan karena nilai tersebut dapat merepresentasikan transaksi dengan **free shipping**.

Nilai 0 pada biaya ongkir tidak dianggap sebagai missing value atau error.

### 3. Grand Total Correction

Kolom `Grand_Total` diperbaiki agar mengikuti formula:

Grand Total = Total Sales + Biaya Ongkir

Perbaikan dilakukan untuk memastikan nilai total transaksi dapat digunakan secara konsisten dalam analisis.

### 4. Clean Dataset

Setelah proses pengecekan dan perbaikan selesai, clean dataset digunakan sebagai sumber data untuk proses SQL analysis dan dashboard development.


## SQL Analysis & EDA

Setelah proses data cleaning selesai, dataset di-import ke MySQL untuk dilakukan exploratory data analysis (EDA) menggunakan SQL.

Sebanyak 16 SQL analysis queries digunakan untuk mengeksplorasi performa bisnis dari berbagai perspektif.

Analysis Performed
### 1. Overall Sales Performance

Menganalisis performa penjualan secara keseluruhan berdasarkan:

Total Transactions
Total Quantity Sold
Total Sales
Total Discount
Total Shipping Cost
Total Grand Total
Average Order Value

### 2. Monthly Sales Performance

Menganalisis perkembangan sales, quantity terjual, dan jumlah transaksi berdasarkan bulan.

### 3. Top 10 Products by Sales

Mengidentifikasi 10 produk dengan nilai sales terbesar serta sales contribution percentage terhadap total sales.

### 4. Top 10 Products by Quantity Sold

Mengidentifikasi 10 produk dengan jumlah quantity terjual paling tinggi.

### 5. Brand Performance by Sales

Menganalisis performa setiap brand berdasarkan total quantity sold dan total sales.

### 6. Top 5 Brands by Quantity Sold

Mengidentifikasi lima brand dengan jumlah quantity terjual tertinggi.

### 7. Top 10 Customers by Total Spending

Mengidentifikasi 10 customer dengan total spending terbesar serta melihat jumlah transaksi dan quantity yang dibeli.

### 8. Top 10 Customers by Transaction Frequency

Mengidentifikasi 10 customer dengan frekuensi transaksi tertinggi.

### 9. Sales by City

Menganalisis performa sales berdasarkan kota customer.

### 10. Customer Distribution by City

Menganalisis jumlah customer unik pada masing-masing kota.

### 11. Sales Contribution by City

Menganalisis kontribusi sales dari masing-masing kota terhadap total sales.

### 12. Order Distribution by Status

Menganalisis distribusi transaksi berdasarkan status order.

### 13. Sales Performance by Order Status

Membandingkan jumlah transaksi, quantity, sales, dan grand total berdasarkan status order.

### 14. Completed vs Non-Completed Transactions

Membandingkan transaksi yang berstatus Completed dengan transaksi Non-Completed.

### 15. Sales Performance by Payment Method

Menganalisis jumlah transaksi, quantity, dan sales berdasarkan metode pembayaran.

### 16. Average Transaction Value by Payment Method

Menganalisis average transaction value berdasarkan metode pembayaran.

## Key Insight
### 1. Kalkulator menjadi product dengan sales tertinggi

Kalkulator menjadi produk dengan sales tertinggi yaitu sebesar Rp313,3 juta (48,4% dari total sales). Tiga produk teratas, yaitu Kalkulator, Kertas HV, dan Binder A5, menyumbang 73,9% dari total sales.








