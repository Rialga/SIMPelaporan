-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jan 2020 pada 16.15
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

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
-- Struktur dari tabel `detail_laporan`
--

CREATE TABLE `detail_laporan` (
  `detail_laporan_id` int(11) NOT NULL,
  `laporan_no` varchar(50) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `nama_pemilik` varchar(30) NOT NULL,
  `detail_laporan_ket` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_laporan`
--

INSERT INTO `detail_laporan` (`detail_laporan_id`, `laporan_no`, `jenis_id`, `nama_pemilik`, `detail_laporan_ket`, `created_at`, `updated_at`) VALUES
(4, '1201820', 1, 'Pelpaor', 'Surat Tanah', '2020-01-27 17:50:59', '2020-01-27 17:50:59'),
(5, '1201820', 2, 'Cinta', 'Kepalan Jantung', '2020-01-27 17:50:59', '2020-01-27 17:50:59'),
(6, '1201820', 1, 'Bunda', 'KK di hilangkan bunda', '2020-01-27 17:50:59', '2020-01-27 17:50:59'),
(7, '1201820', 2, 'Mereka', 'Kepercayaan', '2020-01-27 17:50:59', '2020-01-27 17:50:59'),
(8, '038302', 1, 'Ndk tahu', 'seperti tulang', '2020-01-27 17:53:34', '2020-01-27 17:53:34'),
(9, '038302', 2, 'Nadin Amizah', 'Kepercayaan', '2020-01-27 17:53:34', '2020-01-27 17:53:34'),
(10, '038302', 2, 'Raisa', 'suara', '2020-01-27 17:53:34', '2020-01-27 17:53:34'),
(11, '038302', 2, 'anya', 'otak', '2020-01-27 17:53:35', '2020-01-27 17:53:35'),
(12, '038302', 1, 'pelapor', 'surat hanyut', '2020-01-27 17:53:35', '2020-01-27 17:53:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doc_pendukung`
--

CREATE TABLE `doc_pendukung` (
  `doc_pendukung_id` int(11) NOT NULL,
  `doc_pendukung_nama` varchar(191) NOT NULL,
  `doc_pendukung_file` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `doc_pendukung`
--

INSERT INTO `doc_pendukung` (`doc_pendukung_id`, `doc_pendukung_nama`, `doc_pendukung_file`, `created_at`, `updated_at`) VALUES
(10, 'BMTHl', '20150927071731.jpg', '2020-01-24 16:31:32', '2020-01-24 16:31:32'),
(11, 'BMTHl', '20150927071731.jpg', '2020-01-24 16:32:27', '2020-01-24 16:32:27'),
(12, 'BMTH', '5454428-bring-me-the-horizon-wallpaper.jpg', '2020-01-25 08:37:04', '2020-01-25 08:37:04'),
(13, 'BMTHl', '5454428-bring-me-the-horizon-wallpaper.jpg', '2020-01-25 08:58:06', '2020-01-25 08:58:06'),
(14, 'Unic', 'bmth.jpg', '2020-01-27 17:50:59', '2020-01-27 17:50:59'),
(15, 'Bermuda Merah', 'black_3d_pyramid_glow_red____by_cytherina-d5gzbe0.jpg', '2020-01-27 17:53:34', '2020-01-27 17:53:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `jenis_id` int(11) NOT NULL,
  `jenis_nama` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`jenis_id`, `jenis_nama`) VALUES
(1, 'Surat Berharga'),
(2, 'Barang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `laporan_no` varchar(50) NOT NULL,
  `user_nrp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelapor_nik` varchar(30) NOT NULL,
  `laporan_tgllapor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `laporan_tglhilang` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `laporan_lokasi` varchar(50) NOT NULL,
  `laporan_keterangan` longtext NOT NULL,
  `doc_pendukung_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`laporan_no`, `user_nrp`, `pelapor_nik`, `laporan_tgllapor`, `laporan_tglhilang`, `laporan_lokasi`, `laporan_keterangan`, `doc_pendukung_id`, `created_at`, `updated_at`) VALUES
('038302', '1611523005', '200929182', '2020-01-27 17:53:34', '2019-11-30 17:00:00', 'Unand Jaya', 'DIculik', 15, '2020-01-27 17:53:34', '2020-01-27 17:53:34'),
('1201820', '1611523005', '1001231231', '2020-01-27 17:50:59', '2020-01-08 17:00:00', 'Padang', 'Hilang Begitu Saja bung', 14, '2020-01-27 17:50:59', '2020-01-27 17:50:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelapor`
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
-- Dumping data untuk tabel `pelapor`
--

INSERT INTO `pelapor` (`pelapor_nik`, `pelapor_nama`, `pelapor_tgl_lahir`, `pelapor_jekel`, `pelapor_alamat`, `pelapor_pekerjaan`, `pelapor_notelp`, `pelapor_suku`, `created_at`, `updated_at`) VALUES
('1001231231', 'Rekto', '1999-11-18', 'Laki-Laki', 'Jekade', 'Musisi', '123098120389', 'Sunda', '2020-01-27 17:48:41', '2020-01-27 17:48:41'),
('200929182', 'Harimaupura Martabal', '1989-06-21', 'Perempuan', 'Medan utara', 'Ninja Saga', '0808080808080', 'Batak', '2020-01-23 17:47:49', '2020-01-23 19:07:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'spkt'),
(2, 'sabara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_nrp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pangkat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_nrp`, `user_nama`, `user_pangkat`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
('1611522001', 'AdityaWarman', 'BULAN', '$2y$10$Zlts7H6THpDWmOTjSZRjWuNz1V/JR2xtiTE8fD1J7t76SmVTd6O7.', 2, '2020-01-04 21:56:28', '2020-01-06 03:09:50'),
('1611523005', 'Muhamad Febri Algani', 'Bintang', '$2y$10$fuOLVk6FkySHgr7clAzclOj9k02JV0m3ng3vcFQDjNEIy8QJqRNSm', 1, '2020-01-06 08:33:12', '2020-01-06 08:33:12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD PRIMARY KEY (`detail_laporan_id`),
  ADD KEY `jenis_id` (`jenis_id`),
  ADD KEY `laporan_no` (`laporan_no`);

--
-- Indeks untuk tabel `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  ADD PRIMARY KEY (`doc_pendukung_id`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`jenis_id`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`laporan_no`),
  ADD KEY `user_nrp` (`user_nrp`),
  ADD KEY `pelapor_nik` (`pelapor_nik`),
  ADD KEY `doc_pendukung_id` (`doc_pendukung_id`);

--
-- Indeks untuk tabel `pelapor`
--
ALTER TABLE `pelapor`
  ADD PRIMARY KEY (`pelapor_nik`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_nrp`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_laporan`
--
ALTER TABLE `detail_laporan`
  MODIFY `detail_laporan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  MODIFY `doc_pendukung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `jenis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD CONSTRAINT `detail_laporan_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`jenis_id`),
  ADD CONSTRAINT `detail_laporan_ibfk_3` FOREIGN KEY (`laporan_no`) REFERENCES `laporan` (`laporan_no`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`user_nrp`) REFERENCES `user` (`user_nrp`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`pelapor_nik`) REFERENCES `pelapor` (`pelapor_nik`),
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`doc_pendukung_id`) REFERENCES `doc_pendukung` (`doc_pendukung_id`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
