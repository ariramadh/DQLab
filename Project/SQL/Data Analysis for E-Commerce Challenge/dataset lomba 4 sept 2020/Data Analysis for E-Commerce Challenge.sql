-- Products
-- Ada 4 kolom pada data produk
-- Ada 1,145 baris pada data produk
-- ########################################################################

-- Orders
-- Ada 10 kolom / variabel pada data order
-- Ada 74,874 baris pada data order
-- Ada 3 variabel yang berisi data amount (rupiah)
-- Ada 3 variabel yang berisi data tanggal
-- ########################################################################


-- Chapter 3
-- 10 Transaksi terbesar user 12476
select seller_id, buyer_id, total as nilai_transaksi, created_at as tanggal_transaksi
from orders
where buyer_id = 12476
order by 3 desc
limit 10
-- ########################################################################

-- Transaksi per bulan
SELECT EXTRACT
(YEAR_MONTH FROM created_at) as tahun_bulan, count
(1) as jumlah_transaksi, sum
(total) as total_nilai_transaksi
from orders
where created_at>='2020-01-01'
group by 1
order by 1
-- ########################################################################

-- Pengguna dengan rata-rata transaksi terbesar di Januari 2020
select buyer_id, count(1) as jumlah_transaksi, avg(total) as avg_nilai_transaksi
from orders
where created_at>='2020-01-01' and created_at<'2020-02-01'
group by 1
having count(1)>= 2
order by 3 desc
limit 10
-- ########################################################################

-- Transaksi besar di Desember 2019
select nama_user
as nama_pembeli, total as nilai_transaksi, created_at as tanggal_transaksi
from orders
inner join users on buyer_id = user_id
where created_at>='2019-12-01' and created_at<'2020-01-01'
and total >= 20000000
order by 1
-- ########################################################################

-- Kategori Produk Terlaris di 2020
select category, sum(quantity) as total_quantity, sum(price) as total_price
from orders
    inner join order_details using(order_id)
    inner join products using(product_id)  
where created_at>='2020-01-01'
    and delivery_at IS NOT NULL
group by 1
order by 2 desc
limit 5
-- ########################################################################

-- Chapter 4
-- Mencari pembeli high value
SELECT nama_user
AS nama_pembeli, 
 COUNT
(1) AS jumlah_transaksi,
 SUM
(total) AS total_nilai_transaksi,
 MIN
(total) AS min_nilai_transaksi
FROM orders
INNER JOIN users
ON buyer_id = user_id
GROUP BY user_id, nama_user
HAVING COUNT
(1) > 5
AND MIN
(total) > 2000000
ORDER BY 3 DESC;
-- ########################################################################

-- Mencari Dropshipper
SELECT nama_user AS nama_pembeli,
    COUNT(1) AS jumlah_transaksi,
    COUNT(DISTINCT orders.kodepos) AS distinct_kodepos,
    SUM(total) AS total_nilai_transaksi,
    AVG(total) AS avg_nilai_transaksi
FROM orders
    INNER JOIN users
    ON buyer_id = user_id
GROUP BY user_id, nama_user
HAVING COUNT(1) >= 10
    AND COUNT(1) = COUNT(DISTINCT orders.kodepos)
ORDER BY 2 DESC;
-- ########################################################################

-- Mencari Reseller Offline
SELECT nama_user AS nama_pembeli,
    COUNT(1) AS jumlah_transaksi,
    SUM(total) AS total_nilai_transaksi,
    AVG(total) AS avg_nilai_transaksi,
    AVG(total_quantity) AS avg_quantity_per_transaksi
FROM orders
    INNER JOIN users
    ON buyer_id = user_id
    INNER JOIN (
 SELECT order_id,
        SUM(quantity) AS total_quantity
    FROM order_details
    GROUP BY 1
) AS summary_order 
USING (order_id)
WHERE orders.kodepos = users.kodepos
GROUP BY user_id, nama_user
HAVING COUNT(1) >= 8
    AND AVG(total_quantity) > 10
ORDER BY 3 DESC;
-- ########################################################################

-- Pembeli sekaligus penjual
SELECT nama_user AS nama_pengguna,
    jumlah_transaksi_beli,
    jumlah_transaksi_jual
FROM users
    INNER JOIN (
 SELECT buyer_id,
        COUNT(1) AS jumlah_transaksi_beli
    FROM orders
    GROUP BY 1
 ) AS buyer
    ON buyer_id = user_id
    INNER JOIN (
 SELECT seller_id,
        COUNT(1) AS jumlah_transaksi_jual
    FROM orders
    GROUP BY 1
 ) AS seller
    ON seller_id = user_id
WHERE jumlah_transaksi_beli >= 7
ORDER BY 1;
-- ########################################################################

-- Lama transaksi dibayar
SELECT EXTRACT(YEAR_MONTH FROM created_at) AS tahun_bulan,
    COUNT(1) AS jumlah_transaksi,
    AVG(DATEDIFF(paid_at, created_at)) AS avg_lama_dibayar,
    MIN(DATEDIFF(paid_at, created_at)) min_lama_dibayar,
    MAX(DATEDIFF(paid_at, created_at)) max_lama_dibayar
FROM orders
WHERE paid_at is NOT NULL
GROUP BY 1
ORDER BY 1;
-- ########################################################################