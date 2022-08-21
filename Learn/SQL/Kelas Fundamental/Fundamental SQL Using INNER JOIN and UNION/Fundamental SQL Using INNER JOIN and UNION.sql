-- Tugas Praktek
SELECT * FROM ms_item_kategori;
SELECT * FROM ms_item_warna;
-- ########################################################################

-- Quiz: Mana kolom dari kedua tabel yang memiliki kecocokan data?
-- nama_barang dan nama_item
-- ########################################################################

-- Quiz: Mana data dari pasangan key column yang cocok?
-- bayam
-- ########################################################################

-- Menggabungkan Tabel dengan Key Columns
SELECT * FROM ms_item_kategori, ms_item_warna WHERE nama_barang = nama_item;
-- ########################################################################

-- Quiz: Mana Query Penggabungan Tabel Yang Benar?
SELECT * FROM A, B where kolom1 = kolom2
-- ########################################################################

-- Quiz: Mana Penjelasan Hasil Penggabungan Yang Benar?
-- tabel ms_item_kategori dan ms_item_warna dapat digabungkan jika kondisi isi pada kolom nama_barang sesuai dengan isi pada kolom nama_item.
-- ########################################################################

-- Bagaimana jika urutan Tabel diubah?
SELECT * FROM ms_item_warna, ms_item_kategori WHERE nama_barang=nama_item;
-- ########################################################################

-- Menggunakan Prefix Nama Tabel
SELECT ms_item_kategori.*, ms_item_warna.*
FROM ms_item_warna, ms_item_kategori
WHERE nama_barang = nama_item;
-- ########################################################################

-- Penggabungan Tanpa Kondisi
SELECT * FROM ms_item_kategori, ms_item_warna
-- ########################################################################

-- Quiz: Berapa Jumlah Baris Hasil “Join Tanpa Kondisi” Berikut?
-- 80
-- ########################################################################

-- Tugas Praktek: Menggunakan INNER JOIN (1/3)
SELECT * FROM ms_item_warna
INNER JOIN ms_item_kategori
ON ms_item_warna.nama_barang = ms_item_kategori.nama_item;
-- ########################################################################

-- tabel tr_penjualan dan tabel ms_produk
SELECT * FROM tr_penjualan;
SELECT * FROM ms_produk;
-- ########################################################################

-- Quiz: Mengidentifikasi Key Column tabel tr_penjualan dan ms_produk
-- Kode_produk dari tabel tr_penjualan dengan kode_produk dari tabel ms_produk
-- ########################################################################

-- Tugas Praktek: Menggunakan INNER JOIN (2/3)
SELECT * FROM tr_penjualan INNER JOIN ms_produk ON tr_penjualan.kode_produk = ms_produk.kode_produk;
-- ########################################################################

-- Tugas Praktek: Menggunakan INNER JOIN (3/3)
SELECT tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, tr_penjualan.kode_produk, ms_produk.nama_produk, ms_produk.harga, tr_penjualan.qty , ms_produk.harga * tr_penjualan.qty as total
FROM tr_penjualan
INNER JOIN ms_produk
ON tr_penjualan.kode_produk = ms_produk.kode_produk;
-- ########################################################################

-- Tabel yang Akan Digabungkan
select * from tabel_A;
select * from tabel_B;
-- ########################################################################

-- Menggunakan UNION
SELECT * FROM tabel_A 
UNION
SELECT * FROM tabel_B;
-- ########################################################################

-- Menggunakan UNION dengan Klausa WHERE
SELECT * FROM tabel_A
Where kode_pelanggan = 'dqlabcust03'
union
select * from tabel_b
where kode_pelanggan = 'dqlabcust03';
-- ########################################################################

-- Menggunakan UNION dan Menyelaraskan Kolom-Kolomnya.
SELECT CustomerName, ContactName, City, PostalCode
FROM Customers
UNION
SELECT SupplierName, ContactName, City, PostalCode
FROM Suppliers;
-- ########################################################################

-- Quiz
JOIN secara horizontal tanpa relasi, dan UNION secara vertikal.
-- ########################################################################

-- Project INNER JOIN
SELECT DISTINCT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat
FROM ms_pelanggan
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.kode_produk = 'prod-01' or tr_penjualan.kode_produk = 'prod-03' or tr_penjualan.kode_produk = 'prod-10';
-- ########################################################################

-- Project UNION
SELECT nama_produk, kode_produk, harga 
FROM ms_produk_1
WHERE harga <100000
UNION
SELECT nama_produk, kode_produk, harga 
FROM ms_produk_2
WHERE harga <50000;
-- ########################################################################

