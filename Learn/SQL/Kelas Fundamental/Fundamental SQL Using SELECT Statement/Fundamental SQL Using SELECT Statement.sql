-- Quiz: Apa Singkatan Dari SQL?
-- Structured Query Language
-- ########################################################################

-- Quiz: Kenapa perlu belajar SQL?
-- Semua Benar
-- ########################################################################

-- Quiz: Mana saja yang merupakan nama produk RDBMS?
-- PostgreSQL, MariaDB, SQLite, OracleDB
-- ########################################################################

-- Quiz: Mana urutan hirarki yang benar?
-- Database --> Tabel --> Kolom
-- ########################################################################

-- Quiz: Apa nama komponen tabel ini?
-- Kolom/Column
-- ########################################################################

-- Quiz: Mana yang disebut sebagai row?
-- B
-- ########################################################################

-- Mengambil Seluruh Kolom dalam suatu Tabel
select * from ms_produk
-- ########################################################################

-- Mengambil Satu Kolom dari Tabel
select nama_produk from ms_produk
-- ########################################################################

-- Quiz: Mana perintah SQL yang benar?
SELECT harga FROM ms_produk
-- ########################################################################

-- Mengambil Lebih dari Satu Kolom dari Tabel
select nama_produk, harga from ms_produk
-- ########################################################################

-- Quiz: Mana perintah SQL yang benar?
SELECT kode_produk, harga FROM ms_produk
-- ########################################################################

-- Membatasi Pengambilan Jumlah Row Data
select nama_produk, harga from ms_produk limit 5
-- ########################################################################

-- Quiz: Mana penggunaan limit berikut yang benar?
SELECT * FROM ms_produk LIMIT 4
-- ########################################################################

-- Penggunaan SELECT DISTINCT statement
select distinct nama_customer, alamat from ms_pelanggan
-- ########################################################################

-- Menggunakan Prefix pada Nama Kolom
select ms_produk.kode_produk from ms_produk
-- ########################################################################

-- Quiz: Mana penggunaan prefix berikut yang benar?
SELECT ms_produk.* FROM ms_produk;
-- ########################################################################

-- Menggunakan Alias pada Kolom
select no_urut as nomor, nama_produk as nama from ms_produk
-- ########################################################################

-- Quiz: Mana Penggunaan Alias yang Benar untuk Kolom?
SELECT kode_produk as kode FROM ms_produk;
-- ########################################################################

-- Menghilangkan Keyword 'AS'
select no_urut nomor, nama_produk nama from ms_produk
-- ########################################################################

-- Quiz: Mana Penggunaan Variasi Alias yang Benar?
SELECT kode_produk as kode, nama_produk as nama FROM ms_produk;
-- ########################################################################

-- Menggabungkan Prefix dan Alias
select ms_produk.harga as harga_jual from ms_produk
-- ########################################################################

-- Menggunakan Alias pada Tabel
select * from ms_produk t2
-- ########################################################################

-- Prefix dengan Alias Tabel
select t2.nama_produk , t2.harga from ms_produk t2;
-- ########################################################################

-- Quiz: Mana Kombinasi Prefix dan Alias yang Benar?
SELECT a1.kode_produk kode, a1.nama_produk AS nama FROM ms_produk a1
-- ########################################################################

-- Menggunakan WHERE
select * from ms_produk where nama_produk = 'Tas Travel Organizer DQLab'
-- ########################################################################

-- Menggunakan Operand OR
Select * from ms_produk where nama_produk = 'Gantungan Kunci DQLab' or nama_produk = 'Tas Travel Organizer DQLab' or nama_produk = 'Flashdisk DQLab 64 GB'
-- ########################################################################

-- Filter untuk Angka
Select * from ms_produk where harga >50000
-- ########################################################################

-- Menggunakan Operand AND
Select * from ms_produk where nama_produk = 'Gantungan Kunci DQLab' and harga < 50000;
-- ########################################################################

-- Quiz: Mana Query Filter dengan OR yang Benar?
SELECT * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQLab' OR harga < 50000;
-- ########################################################################

-- Quiz: Mana Filter yang Akan Mengeluarkan Hasil?
SELECT * FROM ms_produk WHERE harga > 50000 OR harga < 50000;
-- ########################################################################

-- Proyek dari Cabang A
select kode_pelanggan, nama_produk, qty, harga, qty*harga as total from tr_penjualan where qty*harga >= 100000 order by total desc
-- ########################################################################

