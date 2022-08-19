-- Fungsi Skalar Matematika - ABS()
SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) as MarkGrowth FROM students;
-- ########################################################################

-- Fungsi Skalar Matematika - CEILING()
SELECT StudentID, FirstName, LastName, CEILING(Semester1) as Semester1, CEILING(Semester2) as SEMESTER2, MarkGrowth FROM students;
-- ########################################################################

-- Fungsi Skalar Matematika - FLOOR()
SELECT StudentID, FirstName, LastName, FLOOR(Semester1) as Semester1, FLOOR(Semester2) as Semester2, MarkGrowth FROM students;
-- ########################################################################

-- Fungsi Skalar Matematika - ROUND()
SELECT StudentID, FirstName, LastName, ROUND(Semester1,1) as Semester1, Round(Semester2,0) as Semester2, MarkGrowth FROM students;
-- ########################################################################

-- Fungsi Skalar Matematika - SQRT( )
select StudentID, FirstName, LastName, SQRT(Semester1) as Semester1, Semester2, MarkGrowth
From students;
-- ########################################################################

-- Tugas Praktek
Select StudentID, FirstName, LastName, MOD(Semester1,2) as Semester1, Semester2, EXP(MarkGrowth)
FROM students
-- ########################################################################

-- Fungsi Text - CONCAT( )
SELECT StudentID, CONCAT(FirstName, Lastname) as Name, Semester1, Semester2, MarkGrowth FROM students;
-- ########################################################################

-- Fungsi Text - SUBSTRING_INDEX( )
Select StudentID, SUBSTRING_INDEX(Email,'@',1) as Name From students;
-- ########################################################################

-- Fungsi Text - SUBSTR( )
SELECT StudentID, SUBSTR(FirstName, 2, 3) as Initial From students;
-- ########################################################################

-- Fungsi Text - LENGTH( )
SELECT StudentID, FirstName, LENGTH(FirstName) as Total_Char FROM students;
-- ########################################################################

-- Fungsi Text - REPLACE( )
SELECT StudentID, Email, REPLACE(Email, 'yahoo', 'gmail') as New_Email FROM students;
-- ########################################################################

-- Tugas Praktek
SELECT StudentID, UPPER(FirstName) as FirstName, LOWER(LastName) as LastName from students
-- ########################################################################

-- Fungsi Aggregate - SUM()
Select SUM(Semester1) as Total_1, SUM(Semester2) as Total_2 FROM students;
-- ########################################################################

-- Fungsi Aggregate - COUNT()
SELECT COUNT(FirstName) as Total_Student From students;
-- ########################################################################

-- Fungsi Aggregate - AVG( )
SELECT AVG(Semester1) as AVG_1, AVG(Semester2) as AVG_2 FROM students;
-- ########################################################################

-- Tugas Praktek
SELECT MIN(Semester1) as Min1, MAX(Semester1) as Max1, MIN(Semester2) Min2, MAX(Semester2) Max2
FROM students
-- ########################################################################

-- Group by Single Column
SELECT province,
count(DISTINCT order_id) as total_order,
SUM(item_price) as total_price
FROM sales_retail_2019
GROUP BY province;
-- ########################################################################

-- Group by Multiple Column
Select province, brand,
COUNT(DISTINCT order_id) as total_order,
SUM(item_price) as total_price
FROM sales_retail_2019
GROUP BY province, brand
-- ########################################################################

-- Fungsi Aggregate dengan Grouping
SELECT province, COUNT(DISTINCT order_id) AS total_unique_order, SUM(item_price) AS revenue FROM sales_retail_2019
GROUP BY province
-- ########################################################################

-- Tugas Praktek
SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
CASE  
    WHEN sum(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN sum(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY order_month;
-- ########################################################################

-- Proyek Pekerjaan - Analisis Penjualan Part 1
## 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total 
FROM tr_penjualan;
## 2. Total quantity seluruh produk yang terjual.
SELECT sum(qty) as qty 
FROM tr_penjualan;
## 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;
-- ########################################################################

-- Proyek Pekerjaan - Analisis Penjualan Part 2
## 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
## 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan;
-- ########################################################################

