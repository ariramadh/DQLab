-- ########################################################################
-- Sistem Database Relasional (Relational Database Management System)
-- ########################################################################
-- MySQL, Oracle, PostgreSQL
-- ########################################################################
-- Database, Table, Column
-- ########################################################################
-- Column
-- ########################################################################
-- B
-- ########################################################################
-- Structured Query Language
-- ########################################################################

-- Perintah SELECT [2/2]
SELECT * FROM ms_produk

-- ########################################################################
-- Data Definition Language
-- ########################################################################
-- Data Manipulation Language
-- ########################################################################
-- DML
-- ########################################################################

-- Mengambil Satu Kolom dari Table
SELECT nama_produk FROM ms_produk
-- ########################################################################

-- Mana perintah SQL yang benar? (1)
SELECT harga FROM ms_produk
-- ########################################################################

-- Mengambil Lebih dari Satu Kolom
SELECT nama_produk, harga FROM ms_produk;
-- ########################################################################

-- Mana perintah SQL yang benar? (2)
SELECT kode_produk, harga FROM ms_produk
-- ########################################################################

-- Membatasi Pengambilan Jumlah Row Data
SELECT nama_produk FROM ms_produk LIMIT 3;
-- ########################################################################

-- Mana penggunaan limit berikut yang benar?
SELECT * FROM ms_produk LIMIT 4
-- ########################################################################

-- Menggunakan Prefix pada Nama Kolom
SELECT ms_produk.kode_produk FROM ms_produk
-- ########################################################################

-- Mana penggunaan prefix berikut yang benar?
SELECT ms_produk.* FROM ms_produk;
SELECT ms_produk.kode_produk FROM ms_produk;
-- ########################################################################

-- Menggunakan Alias pada Kolom
SELECT no_urut AS nomor, nama_produk AS nama FROM ms_produk
-- ########################################################################

-- Mana Penggunaan Alias yang Benar untuk Kolom?
SELECT kode_produk as kode FROM ms_produk;
-- ########################################################################

-- Menghilangkan Keyword 'AS'
SELECT no_urut nomor, nama_produk nama FROM ms_produk
-- ########################################################################

-- Mana Penggunaan Variasi Alias yang Benar?
SELECT kode_produk as kode, nama_produk as nama FROM ms_produk;
-- ########################################################################

-- Menggabungkan Prefix dan Alias
SELECT ms_produk.harga AS harga_jual from ms_produk;
-- ########################################################################

-- Menggunakan Alias pada Table
SELECT * FROM ms_produk t2
-- ########################################################################

-- Prefix dengan Alias Table
SELECT t2.nama_produk, t2.harga FROM ms_produk t2
-- ########################################################################

-- Mana Kombinasi Prefix dan Alias yang Benar?
SELECT a1.kode_produk kode, a1.nama_produk AS nama FROM ms_produk a1
-- ########################################################################

-- Menggunakan WHERE
SELECT * FROM ms_produk WHERE nama_produk = 'Tas Travel Organizer DQLab';
-- ########################################################################

-- Menggunakan Operand OR
select * from ms_produk where nama_produk = 'Gantungan Kunci DQLab' or nama_produk = 'Tas Travel Organizer DQLab' or nama_produk = 'Flashdisk DQLab 64 GB';
-- ########################################################################

-- Filter untuk Angka
SELECT * FROM ms_produk WHERE harga > 50000;
-- ########################################################################

-- Menggunakan Operand AND
Select * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQLab' AND harga < 50000
-- ########################################################################

-- Mana Query Filter dengan OR yang Benar?
SELECT * FROM ms_produk WHERE nama_produk = 'Gantungan Kunci DQLab' OR harga < 50000;
-- ########################################################################

-- Mana Filter yang Akan Mengeluarkan Hasil?
SELECT * FROM ms_produk WHERE harga > 50000 OR harga < 50000;
-- ########################################################################