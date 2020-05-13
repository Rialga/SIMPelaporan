-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2020 at 04:30 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpelaporan`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_laporan`
--

CREATE TABLE `detail_laporan` (
  `detail_laporan_id` int(11) NOT NULL,
  `laporan_id` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `nama_pemilik` varchar(30) NOT NULL,
  `detail_laporan_ket` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_laporan`
--

INSERT INTO `detail_laporan` (`detail_laporan_id`, `laporan_id`, `jenis_id`, `nama_pemilik`, `detail_laporan_ket`, `created_at`, `updated_at`) VALUES
(23, 8, 1, 'ijay', 'motor Beat', '2020-03-01 08:26:51', '2020-03-01 08:26:51'),
(24, 9, 2, 'ilhamudin armain', 'A no : 121627162', '2020-03-01 08:33:09', '2020-03-01 08:33:09'),
(25, 9, 3, 'ilhamudin armain', 'no : 161727817281781', '2020-03-01 08:33:09', '2020-03-01 08:33:09'),
(27, 11, 5, 'ijay', 'buku tabungan BNI', '2020-03-01 09:21:47', '2020-03-01 09:21:47'),
(28, 12, 1, 'ijay', 'STNK motor', '2020-03-01 13:13:26', '2020-03-01 13:13:26'),
(29, 13, 4, 'ijay', 'ATM bri', '2020-03-01 13:20:51', '2020-03-01 13:20:51'),
(31, 15, 2, 'ilhamudin armain', 'SIM A', '2020-03-01 13:24:31', '2020-03-01 13:24:31'),
(32, 16, 2, 'ijay', 'SIM C', '2020-03-01 13:38:42', '2020-03-01 13:38:42'),
(33, 17, 2, 'ijay', 'SIM A', '2020-03-01 13:40:16', '2020-03-01 13:40:16'),
(34, 19, 2, 'ijay', 'ajhssa', '2020-03-01 14:59:13', '2020-03-01 14:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `doc_pendukung`
--

CREATE TABLE `doc_pendukung` (
  `doc_pendukung_id` int(11) NOT NULL,
  `laporan_id` int(11) NOT NULL,
  `doc_pendukung_nama` varchar(191) NOT NULL,
  `doc_pendukung_file` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_pendukung`
--

INSERT INTO `doc_pendukung` (`doc_pendukung_id`, `laporan_id`, `doc_pendukung_nama`, `doc_pendukung_file`, `created_at`, `updated_at`) VALUES
(24, 8, 'KTP', 'ktp.jpg', '2020-03-01 08:26:51', '2020-03-01 08:26:51'),
(25, 9, 'SIM', 'Gambar Mewarnai Ikan Paus.JPG', '2020-03-01 08:33:09', '2020-03-01 08:33:09'),
(27, 11, 'SIM', 'gambar-mewarna-burung-hebat-mewarnai-burung-merpati-h-warna-of-gambar-mewarna-burung.jpg', '2020-03-01 09:21:47', '2020-03-01 09:21:47'),
(28, 12, 'KTP', 'Gambar Mewarnai Ikan Paus.JPG', '2020-03-01 13:13:26', '2020-03-01 13:13:26'),
(29, 13, 'KTP', 'ktp.jpg', '2020-03-01 13:20:51', '2020-03-01 13:20:51'),
(31, 15, 'KTP', 'Gambar Mewarnai Ikan Paus.JPG', '2020-03-01 13:24:30', '2020-03-01 13:24:30'),
(32, 16, 'KTP', 'Gambar Mewarnai Ikan Paus.JPG', '2020-03-01 13:38:42', '2020-03-01 13:38:42'),
(33, 17, 'KTP', 'Gambar Mewarnai Ikan Paus.JPG', '2020-03-01 13:40:16', '2020-03-01 13:40:16'),
(34, 19, 'KTP', 'Gambar Mewarnai Ikan Paus.JPG|gambar-mewarna-burung-hebat-mewarnai-burung-merpati-h-warna-of-gambar-mewarna-burung.jpg', '2020-03-01 14:59:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `jenis_id` int(11) NOT NULL,
  `jenis_nama` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`jenis_id`, `jenis_nama`, `created_at`, `updated_at`) VALUES
(1, 'STNK', NULL, NULL),
(2, 'SIM', NULL, NULL),
(3, 'KK', NULL, NULL),
(4, 'ATM', NULL, NULL),
(5, 'Buku Tabungan', NULL, NULL),
(6, 'Paspor', NULL, NULL),
(7, 'Sertifikat', NULL, NULL),
(8, 'Surat Nikah', NULL, NULL),
(9, 'Surat Lain - Lain', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` int(11) NOT NULL,
  `user_nrp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelapor_nik` varchar(30) NOT NULL,
  `laporan_no` varchar(50) NOT NULL,
  `laporan_tgllapor` timestamp NOT NULL DEFAULT current_timestamp(),
  `laporan_tglhilang` timestamp NULL DEFAULT NULL,
  `laporan_lokasi` varchar(50) NOT NULL,
  `laporan_keterangan` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id`, `user_nrp`, `pelapor_nik`, `laporan_no`, `laporan_tgllapor`, `laporan_tglhilang`, `laporan_lokasi`, `laporan_keterangan`, `created_at`, `updated_at`) VALUES
(8, '1611521021', '1371091611580008', 'LP/001/III/2020', '2020-03-01 08:26:50', '2020-02-29 17:00:00', 'pauhh', 'tercecer', '2020-03-01 08:26:50', '2020-03-01 09:06:14'),
(9, '1611521021', '1711321871288118', 'LP/009/III/2020', '2020-03-01 08:33:09', '2020-02-28 17:00:00', 'pisang', 'jatuh', '2020-03-01 08:33:09', '2020-03-01 08:33:09'),
(11, '1611521021', '1371091611580008', 'LP/010/III/2020', '2020-03-01 09:21:47', '2020-03-01 17:00:00', 'tunggul hitam', 'tercecer', '2020-03-01 09:21:47', '2020-03-01 09:21:47'),
(12, '1611521021', '1371091611580008', 'LP/012/III/2020', '2020-03-01 13:13:26', '2020-03-14 17:00:00', 'telkom', 'jatuh', '2020-03-01 13:13:26', '2020-03-01 13:13:26'),
(13, '1611521021', '1371091611580008', 'LP/013/III/2020', '2020-03-01 13:20:51', '2020-02-29 17:00:00', 'sawah', 'sawah den', '2020-03-01 13:20:51', '2020-03-01 13:20:51'),
(15, '1611521021', '1371091611580008', 'LP/014/III/2020', '2020-03-01 13:24:30', '2020-02-29 17:00:00', 'semen padang', 'kalah', '2020-03-01 13:24:30', '2020-03-01 13:24:30'),
(16, '1611521021', '1371091611580008', 'LP/016/III/2020', '2020-03-01 13:38:42', '2020-02-29 17:00:00', 'cece', 'cantik', '2020-03-01 13:38:42', '2020-03-01 13:38:42'),
(17, '1611521021', '1371091611580008', 'LP/017/III/2020', '2020-03-01 13:40:16', '2020-03-09 17:00:00', 'cece', 'halus', '2020-03-01 13:40:16', '2020-03-01 13:40:16'),
(18, '1611521021', '1371091611580008', 'LP/018/III/2020', '2020-03-01 14:49:43', '2020-03-16 17:00:00', 'sakdkj', 'sdhhjs', '2020-03-01 14:49:43', '2020-03-01 14:49:43'),
(19, '1611521021', '1371091611580008', 'LP/019/III/2020', '2020-03-01 14:59:13', '2020-02-29 17:00:00', 'ksakdj', 'jnj', '2020-03-01 14:59:13', '2020-03-01 14:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `pangkat`
--

CREATE TABLE `pangkat` (
  `pangkat_id` varchar(6) COLLATE utf8mb4_swedish_ci NOT NULL,
  `pangkat_name` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Dumping data for table `pangkat`
--

INSERT INTO `pangkat` (`pangkat_id`, `pangkat_name`) VALUES
('AJ11', 'AIPTU'),
('AJ12', 'AIPDA'),
('AJB1', 'AKBP'),
('AK11', 'AKP'),
('B111', 'BRIPKA'),
('B112', 'BRIGADIR'),
('B113', 'BRIPTU'),
('B114', 'BRIPDA'),
('BR11', 'JENDRAL'),
('BR12', 'KOMJEN'),
('BR13', 'IRJEN'),
('BR14', 'BRIGJEN'),
('IP11', 'IPTU'),
('IP12', 'IPDA'),
('KB11', 'KOMBES'),
('KM11', 'KOMPOL');

-- --------------------------------------------------------

--
-- Table structure for table `pelapor`
--

CREATE TABLE `pelapor` (
  `pelapor_nik` varchar(30) NOT NULL,
  `pelapor_nama` varchar(30) NOT NULL,
  `pelapor_tgl_lahir` date NOT NULL DEFAULT '0000-00-00',
  `pelapor_jekel` varchar(15) NOT NULL,
  `pelapor_alamat` varchar(90) NOT NULL,
  `pelapor_pekerjaan` varchar(50) NOT NULL,
  `pelapor_notelp` varchar(20) DEFAULT NULL,
  `pelapor_suku` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelapor`
--

INSERT INTO `pelapor` (`pelapor_nik`, `pelapor_nama`, `pelapor_tgl_lahir`, `pelapor_jekel`, `pelapor_alamat`, `pelapor_pekerjaan`, `pelapor_notelp`, `pelapor_suku`, `created_at`, `updated_at`) VALUES
('1371091611580008', 'stefano lilipalu', '1964-10-28', 'Laki-Laki', 'bungo pasang', 'kuliah', '082289898989', 'minang', '2020-02-20 10:30:12', '2020-02-24 17:13:17'),
('1711321871288118', 'ilhamudin armain', '1984-11-27', 'Laki-Laki', 'tunggul hitam', 'gojek', '082289407555', 'minang', '2020-02-20 10:33:45', '2020-02-20 10:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'superadmin'),
(2, 'spkt'),
(3, 'sabara');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_nrp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pangkat_id` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_nrp`, `user_nama`, `password`, `pangkat_id`, `role_id`, `created_at`, `updated_at`) VALUES
('12345', 'ija', '$2y$10$j8uLl3yNoBHvV9KE2VcMAewOtqanYG/yhiHyDXHFfhqQnSNbYSxeG', 'B114', 2, '2020-02-01 12:42:37', '2020-02-01 12:43:22'),
('1611521001', 'hery', '$2y$10$EK.upvxClEAkPrqlgQE5U.ohttZ/un2dpDiuY1LLEREfh7sN5hvHm', 'AJ12', 3, '2020-02-22 13:55:37', '2020-02-23 13:21:45'),
('1611521021', 'FAJAR WIRYA PUTRA', '$2y$10$QEm9hJ0DhxQAxdCky.DtxOj0ZCw8NB3NV1wf0K3MXBmCOcHKPxBVG', 'BR11', 2, '2020-02-01 05:35:45', '2020-02-01 05:35:45'),
('1611523005', 'Muhamad Febri Algani', '$2y$10$fuOLVk6FkySHgr7clAzclOj9k02JV0m3ng3vcFQDjNEIy8QJqRNSm', 'B113', 1, '2020-01-06 08:33:12', '2020-01-06 08:33:12'),
('1711523001', 'apel', '$2y$10$JlT2mPruo21PbIfYxbIS1uZLMJ9wW7kjpcqSYPcBlEUDEMFRLfDFe', 'AJ11', 1, '2020-02-20 09:59:43', '2020-02-20 09:59:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD PRIMARY KEY (`detail_laporan_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `laporan_id` (`laporan_id`);

--
-- Indexes for table `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  ADD PRIMARY KEY (`doc_pendukung_id`),
  ADD KEY `laporan_id` (`laporan_id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`jenis_id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_nrp` (`user_nrp`),
  ADD KEY `pelapor_nik` (`pelapor_nik`);

--
-- Indexes for table `pangkat`
--
ALTER TABLE `pangkat`
  ADD PRIMARY KEY (`pangkat_id`);

--
-- Indexes for table `pelapor`
--
ALTER TABLE `pelapor`
  ADD PRIMARY KEY (`pelapor_nik`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_nrp`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `pangkat_id` (`pangkat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  MODIFY `detail_laporan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  MODIFY `doc_pendukung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `jenis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD CONSTRAINT `detail_laporan_ibfk_1` FOREIGN KEY (`laporan_id`) REFERENCES `laporan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_laporan_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`jenis_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  ADD CONSTRAINT `c_doc_laporan` FOREIGN KEY (`laporan_id`) REFERENCES `laporan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`user_nrp`) REFERENCES `user` (`user_nrp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`pelapor_nik`) REFERENCES `pelapor` (`pelapor_nik`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `pangkat_ibfk_1` FOREIGN KEY (`pangkat_id`) REFERENCES `pangkat` (`pangkat_id`),
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
