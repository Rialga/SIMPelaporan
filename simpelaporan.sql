-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2020 pada 05.57
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
  `laporan_no` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `detail_laporan_ket` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `doc_pendukung`
--

CREATE TABLE `doc_pendukung` (
  `doc_pendukung_id` int(11) NOT NULL,
  `doc_pendukung_nama` varchar(191) NOT NULL,
  `doc_pendukung_file` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `jenis_id` int(11) NOT NULL,
  `jensi_nama` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `laporan_no` int(11) NOT NULL,
  `user_nrp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelapor_nik` varchar(30) NOT NULL,
  `laporan_tgllapor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `laporan_tglhilang` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `laporan_lokasi` varchar(50) NOT NULL,
  `laporan_keterangan` longtext NOT NULL,
  `doc_pendukung_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelapor`
--

CREATE TABLE `pelapor` (
  `pelapor_nik` varchar(30) NOT NULL,
  `pelapor_nama` varchar(30) NOT NULL,
  `pelapor_tgl_lahir` datetime NOT NULL,
  `pelapor_jekel` varchar(15) NOT NULL,
  `pelapor_alamat` varchar(90) NOT NULL,
  `pelapor_pekerjaan` varchar(50) NOT NULL,
  `pelapor_notelp` varchar(20) DEFAULT NULL,
  `pelapor_suku` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 'brigadir');

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
('1611522001', 'AdityaWarman', 'BULAN', '$2y$10$Zlts7H6THpDWmOTjSZRjWuNz1V/JR2xtiTE8fD1J7t76SmVTd6O7.', 2, '2020-01-04 21:56:28', '2020-01-04 21:56:28'),
('1611523005', 'Muahamad Febri Algani', 'BINTANG', '$2y$10$GLTabq.xrO4xFeJ4cE5UrewXyJQtC7jLB7/uEgTm5OaBXwLvqwH7i', 1, '2020-01-04 21:54:22', '2020-01-04 21:54:22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_laporan`
--
ALTER TABLE `detail_laporan`
  ADD PRIMARY KEY (`detail_laporan_id`),
  ADD KEY `laporan_no` (`laporan_no`),
  ADD KEY `jenis_id` (`jenis_id`);

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
  MODIFY `detail_laporan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  MODIFY `doc_pendukung_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `jenis_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `laporan_no` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `detail_laporan_ibfk_1` FOREIGN KEY (`laporan_no`) REFERENCES `laporan` (`laporan_no`),
  ADD CONSTRAINT `detail_laporan_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`jenis_id`);

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
