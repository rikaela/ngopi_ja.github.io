-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2021 at 03:35 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngopi_ja`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(130) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(6, 'Sidikalang 200g Kopi Arabica', 'Untuk setiap bubuk kopi single origin yang dijual di Otten C', 'Kopi', 65000, 0, '5edde9f3b31aa055713606.jpg'),
(7, 'Garut 200g Kopi Arabica', 'Kopi Garut juga diproses dengan perhatian khusus untuk menghasilkan karakter dan citarasa luar nantinya. Segera pesan single origin Garut hanya di Otten Coffee sebelum kehabisan.', 'Kopi', 75000, 5, '5eddc9e863747968007551.jpg'),
(8, 'Java Sukawangi 200g Kopi Arabica', 'Jika Anda mencari kopi arabica asli Jawa Barat, Anda kini dapat mencarinya di ujung timur kabupaten Bogor, tepatnya di Desa Sukawangi. Desa yang berbatasan langsung dengan Kabupaten Cianjur ini telah menjadi surganya kopi ara', 'Kopi', 75000, 0, '5eddc9e8637479680075511.jpg'),
(9, 'Aceh Gayo Natural Process 200g', 'Siapa yang tidak kenal dengan kopi Aceh Gayo yang sudah ters', 'Kopi', 85000, 1, '5eddcac3c1c0a663741451.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `alamat` varchar(230) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'rikako', 'sutopadan, bantul', '2021-01-05 21:52:41', '2021-01-06 21:52:41'),
(2, 'anchan', 'sutopadan, bantul', '2021-01-06 19:07:21', '2021-01-07 19:07:21'),
(3, '', '', '2021-01-06 22:03:26', '2021-01-07 22:03:26'),
(4, '', '', '2021-01-07 23:38:24', '2021-01-08 23:38:24'),
(5, 'anchan', 'shizkouka', '2021-01-07 23:45:45', '2021-01-08 23:45:45'),
(6, 'anchan', 'shizkouka', '2021-01-07 23:45:58', '2021-01-08 23:45:58'),
(7, '', '', '2021-01-12 12:00:58', '2021-01-13 12:00:58'),
(8, 'Daffa Hafisha', '', '2021-01-12 12:25:21', '2021-01-13 12:25:21'),
(9, '', '', '2021-01-15 18:14:01', '2021-01-16 18:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(60) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 1, 'Coffie ', 1, 650002, ''),
(2, 1, 5, 'BROMIDE', 1, 3500000, ''),
(3, 2, 6, 'Sidikalang 200g Kopi Arabica', 1, 65000, ''),
(4, 3, 6, 'Sidikalang 200g Kopi Arabica', 1, 65000, ''),
(5, 4, 6, 'Sidikalang 200g Kopi Arabica', 1, 65000, ''),
(6, 5, 6, 'Sidikalang 200g Kopi Arabica', 1, 65000, ''),
(7, 7, 6, 'Sidikalang 200g Kopi Arabica', 1, 65000, ''),
(8, 8, 8, 'Java Sukawangi 200g Kopi Arabica', 1, 75000, ''),
(9, 9, 8, 'Java Sukawangi 200g Kopi Arabica', 1, 75000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`, `email`, `is_active`) VALUES
(1, 'rikako', 'rikako', '12345', 1, '', 0),
(2, 'qwerty', 'qwerty', 'qwerty', 1, '', 0),
(3, 'daffa', 'daffa720@gmail.com', 'daffa', 2, '', 0),
(4, 'Daffa Hafisha', '19.01.4292', '12345', 2, '', 0),
(5, 'joko', 'jokomaru', '123456', 2, '', 0),
(8, 'Daffa Hafisha', 'daffa', '12345', 2, 'daffa720@gmail.com', 0),
(9, 'Daffa Hafisha', 'rikako', '12345', 2, 'sunflower@gmail.com', 1),
(10, 'inami', 'anju', '12345', 2, 'anju@gmail.com', 1),
(11, 'ada', 'ada', '1234', 2, 'ada@gmail.com', 0),
(12, 'inami', 'inami2', '12345', 2, 'inami2@gmail.com', 0),
(13, 'Seno', 'Jajangs', '1234', 2, 'seno@email.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
