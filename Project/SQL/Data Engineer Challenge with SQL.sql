-- Left Join
-- 5 row
-- ########################################################################

-- Right Join
-- 5row
-- ########################################################################

-- Kesamaan 2 statement SQL
SELECT * FROM table1 WHERE nama IN ('Cyntia', 'Rheny')
SELECT * FROM table1 WHERE nama LIKE 'Cyntia' OR nama LIKE 'Rheny'
-- ########################################################################

-- Union
-- 6
-- ########################################################################

-- Inner Join
-- 4
-- ########################################################################

-- Produk DQLab Mart
SELECT * FROM ms_produk
WHERE harga >= 50000 and harga <= 150000
-- ########################################################################

-- Thumb drive di DQLab Mart
SELECT * FROM ms_produk
WHERE nama_produk LIKE '%Flashdisk%'
-- ########################################################################

-- Pelanggan Bergelar
SELECT * FROM MS_PELANGGAN
WHERE NAMA_PELANGGAN LIKE '%S.H%' 
	OR NAMA_PELANGGAN LIKE '%Ir.%'
	OR NAMA_PELANGGAN LIKE '%Drs.%'
-- ########################################################################

-- Mengurutkan Nama Pelanggan
SELECT NAMA_PELANGGAN FROM MS_PELANGGAN
ORDER BY NAMA_PELANGGAN ASC
-- ########################################################################

-- Mengurutkan Nama Pelanggan Tanpa Gelar
SELECT NAMA_PELANGGAN FROM MS_PELANGGAN
ORDER BY SUBSTRING_INDEX(nama_pelanggan, ". ", -1);
-- ########################################################################

-- Nama Pelanggan yang Paling Panjang
SELECT NAMA_PELANGGAN FROM MS_PELANGGAN
WHERE LENGTH(NAMA_PELANGGAN) = (
  SELECT MAX(LENGTH(nama_pelanggan))
        FROM ms_pelanggan
    );
-- ########################################################################

-- Nama Pelanggan yang Paling Panjang dengan Gelar
SELECT nama_pelanggan FROM ms_pelanggan WHERE
	LENGTH(nama_pelanggan) IN (
        (
            SELECT
                MAX(LENGTH(nama_pelanggan))
            FROM
                ms_pelanggan
        ),
        (
            SELECT
                MIN(LENGTH(nama_pelanggan))
            FROM
                ms_pelanggan
        )
    )
ORDER BY
    LENGTH(nama_pelanggan) DESC;
-- ########################################################################

-- Kuantitas Produk yang Banyak Terjual
SELECT
    ms_produk.kode_produk,
    ms_produk.nama_produk,
    SUM(tr_penjualan_detail.qty) AS total_qty
FROM
    ms_produk
INNER JOIN tr_penjualan_detail ON ms_produk.kode_produk = tr_penjualan_detail.kode_produk
GROUP BY
    ms_produk.kode_produk,
    ms_produk.nama_produk
HAVING
    SUM(tr_penjualan_detail.qty) > 2;
-- ########################################################################

-- Pelanggan Paling Tinggi Nilai Belanjanya
SELECT kode_pelanggan, nama_pelanggan, SUM(tr_penjualan_detail.qty * tr_penjualan_detail.harga_satuan) AS total_harga
FROM
	ms_pelanggan
	INNER JOIN tr_penjualan USING (kode_pelanggan)
	INNER JOIN tr_penjualan_detail USING (kode_transaksi)
GROUP BY
    tr_penjualan.kode_pelanggan,
    ms_pelanggan.nama_pelanggan
ORDER BY
    total_harga DESC
LIMIT
    1;
-- ########################################################################

-- Pelanggan yang Belum Pernah Berbelanja
SELECT
    kode_pelanggan,
    nama_pelanggan,
    alamat
FROM
    ms_pelanggan
WHERE
    kode_pelanggan NOT IN (
        SELECT
            kode_pelanggan
        FROM
            tr_penjualan
    );
-- ########################################################################

-- Transaksi Belanja dengan Daftar Belanja lebih dari 1
SELECT
    tr.kode_transaksi,
    tr.kode_pelanggan,
    ms.nama_pelanggan,
    tr.tanggal_transaksi,
    COUNT(td.qty) AS jumlah_detail
FROM
    tr_penjualan tr
    INNER JOIN ms_pelanggan ms ON tr.kode_pelanggan = ms.kode_pelanggan
    INNER JOIN tr_penjualan_detail td ON tr.kode_transaksi = td.kode_transaksi
GROUP BY
    tr.kode_transaksi,
    tr.kode_pelanggan,
    ms.nama_pelanggan,
    tr.tanggal_transaksi
HAVING
    jumlah_detail > 1;
-- ########################################################################