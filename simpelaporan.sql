-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jan 2020 pada 15.01
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
(2, '12', 1, 'Fajar Wirya Putra', 'SIM', '2020-01-10 12:08:28', '2020-01-10 12:08:28');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`laporan_no`, `user_nrp`, `pelapor_nik`, `laporan_tgllapor`, `laporan_tglhilang`, `laporan_lokasi`, `laporan_keterangan`, `created_at`, `updated_at`) VALUES
('12', '1611523005', '161152349032092308', '2020-01-10 12:08:28', '2020-01-11 17:00:00', 'Padang', 'Ini terjadi', '2020-01-10 12:08:28', '2020-01-10 12:08:28');

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
  `doc_pendukung_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelapor`
--

INSERT INTO `pelapor` (`pelapor_nik`, `pelapor_nama`, `pelapor_tgl_lahir`, `pelapor_jekel`, `pelapor_alamat`, `pelapor_pekerjaan`, `pelapor_notelp`, `pelapor_suku`, `doc_pendukung_id`, `created_at`, `updated_at`) VALUES
('161152349032092308', 'Muhama Febri Algani', '1998-02-10', 'Laki-Laki', 'Aspol alai blok D no 10', 'Mahasiswa', '085374556747', 'Minang', NULL, '2020-01-10 01:38:52', '2020-01-10 01:38:52');

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
  ADD KEY `pelapor_nik` (`pelapor_nik`);

--
-- Indeks untuk tabel `pelapor`
--
ALTER TABLE `pelapor`
  ADD PRIMARY KEY (`pelapor_nik`),
  ADD KEY `FOREIGN` (`doc_pendukung_id`) USING BTREE;

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
  MODIFY `detail_laporan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `doc_pendukung`
--
ALTER TABLE `doc_pendukung`
  MODIFY `doc_pendukung_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`pelapor_nik`) REFERENCES `pelapor` (`pelapor_nik`);

--
-- Ketidakleluasaan untuk tabel `pelapor`
--
ALTER TABLE `pelapor`
  ADD CONSTRAINT `FOREIGN` FOREIGN KEY (`doc_pendukung_id`) REFERENCES `doc_pendukung` (`doc_pendukung_id`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
