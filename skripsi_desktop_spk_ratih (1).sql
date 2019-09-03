-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 31, 2019 at 05:50 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skripsi_desktop_spk_ratih`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `totalresponden`
-- (See below for the actual view)
--
CREATE TABLE `totalresponden` (
`kode_user` int(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `t_hasil_quisioner`
--

CREATE TABLE `t_hasil_quisioner` (
  `id` int(11) NOT NULL,
  `kode_klausal` varchar(25) NOT NULL,
  `kode_keamanan` varchar(25) NOT NULL,
  `kode_tujuan` varchar(25) NOT NULL,
  `point` int(1) NOT NULL,
  `kode_user` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_hasil_quisioner`
--

INSERT INTO `t_hasil_quisioner` (`id`, `kode_klausal`, `kode_keamanan`, `kode_tujuan`, `point`, `kode_user`) VALUES
(28, 'A.6', 'A.6.1', 'A.6.1.1', 5, 13),
(29, 'A.6', 'A.6.1', 'A.6.1.2', 5, 13),
(30, 'A.6', 'A.6.1', 'A.6.1.3', 4, 13),
(31, 'A.6', 'A.6.1', 'A.6.1.4', 5, 13),
(32, 'A.6', 'A.6.1', 'A.6.1.5', 4, 13),
(33, 'A.6', 'A.6.2', 'A.6.2.1', 5, 13),
(34, 'A.6', 'A.6.2', 'A.6.2.2', 5, 13),
(35, 'A.5', 'A.5.1', 'A.5.1.1', 2, 13),
(36, 'A.5', 'A.5.1', 'A.5.1.2', 5, 13),
(37, 'A.11', 'A.11.1', 'A.11.1.1', 4, 17),
(38, 'A.11', 'A.11.1', 'A.11.1.2', 5, 17),
(39, 'A.11', 'A.11.1', 'A.11.1.3', 5, 17),
(40, 'A.11', 'A.11.1', 'A.11.1.4', 5, 17),
(41, 'A.11', 'A.11.1', 'A.11.1.5', 5, 17),
(42, 'A.11', 'A.11.1', 'A.11.1.6', 2, 17),
(43, 'A.11', 'A.11.2', 'A.11.2.1', 3, 17),
(44, 'A.11', 'A.11.1', 'A.11.2.2', 4, 17),
(45, 'A.11', 'A.11.1', 'A.11.2.3', 4, 17),
(46, 'A.11', 'A.11.1', 'A.11.2.4', 3, 17),
(57, 'A.7', 'A.7.1', 'A.7.1.1', 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `t_jabatan`
--

CREATE TABLE `t_jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jabatan`
--

INSERT INTO `t_jabatan` (`id`, `nama`) VALUES
(1, 'Maintenance and Support System'),
(2, 'Develop Program Siater'),
(3, 'Bagian Biro Administrasi Akademik'),
(4, 'Bagian Pengembangan Sumber Daya Manusia');

-- --------------------------------------------------------

--
-- Table structure for table `t_keamanan`
--

CREATE TABLE `t_keamanan` (
  `id_keamanan` int(11) NOT NULL,
  `kode_klausal` varchar(25) NOT NULL,
  `kode_keamanan` varchar(25) NOT NULL,
  `keamanan` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_keamanan`
--

INSERT INTO `t_keamanan` (`id_keamanan`, `kode_klausal`, `kode_keamanan`, `keamanan`, `created_at`, `updated_at`) VALUES
(1, 'A.5', 'A.5.1', 'Arah manajemen untuk informasi keamanan', '2019-02-12 05:38:25', NULL),
(2, 'A.6', 'A.6.1', 'Organisasi Internal', '2019-02-12 08:14:07', NULL),
(3, 'A.6', 'A.6.2', 'Perangkat Seluler dan Teleworking ', '2019-02-27 09:26:29', NULL),
(4, 'A.7', 'A.7.1', 'Sebelum Bekerja', '2019-02-27 09:27:16', NULL),
(5, 'A.7', 'A.7.2', 'Selama Bekerja', '2019-02-27 09:28:45', NULL),
(6, 'A.7', 'A.7.3', 'Pengakhiran dan Perubahan Pekerjaan', '2019-02-27 09:29:12', NULL),
(7, 'A.8', 'A.8.1', 'Tanggung Jawab Untuk Asset', '2019-02-27 09:30:26', NULL),
(8, 'A.8', 'A.8.2', 'Klasifikasi Informasi', '2019-02-27 09:37:59', NULL),
(9, 'A.8', 'A.8.3', 'Penanganan Media', '2019-02-27 09:38:45', NULL),
(10, 'A.9', 'A.9.1', 'Persyaratan Bisnis Untuk Kontrol Akses', '2019-02-27 09:41:07', NULL),
(11, 'A.8', 'A.9.2', 'Manajemen Akses Pengguna', '2019-02-27 09:41:57', NULL),
(12, 'A.8', 'A.9.3', 'Tanggung Jawab Pengguna', '2019-02-27 09:42:29', NULL),
(13, 'A.8', 'A.9.4', 'Sistem dan Kontrol Akses Aplikasi', '2019-02-27 09:51:18', NULL),
(14, 'A.10', 'A.10.1', 'Kontrol Kriptografi', '2019-02-27 09:51:58', NULL),
(15, 'A.11', 'A.11.1', 'Area aman', '2019-02-27 11:19:27', NULL),
(16, 'A.11', 'A.11.2', 'Peralatan', '2019-02-27 11:19:52', NULL),
(17, 'A.12', 'A.12.1', 'Prosedur operasional dan tanggung jawab', '2019-02-28 01:31:27', NULL),
(18, 'A.12', 'A.12.2', 'Perlindungan dari malware', '2019-02-28 01:32:02', NULL),
(19, 'A.12', 'A.12.3', 'Back-Up', '2019-02-28 01:32:23', NULL),
(20, 'A.12', 'A.12.4', 'Pencatatan dan pemantauan untuk merekam peristiwa dan menghasilkan bukti', '2019-02-28 01:33:40', NULL),
(21, 'A.12', 'A.12.5', 'Kontrol perangkat lunak operasional', '2019-02-28 01:34:14', NULL),
(22, 'A.12', 'A.12.6', 'Pengelolaan kerentanan teknis', '2019-02-28 01:34:49', NULL),
(23, 'A.12', 'A.12.7', 'Audit sistem informasi', '2019-02-28 01:35:21', NULL),
(24, 'A.13', 'A.13.1', 'Manajemen keamanam jaringan', '2019-02-28 01:36:18', NULL),
(25, 'A.13', 'A.13.2', 'Transfer Informasi', '2019-02-28 01:36:48', NULL),
(26, 'A.14', 'A.14.1', 'Persyaratan keamanan sistem informasi', '2019-02-28 05:14:40', NULL),
(27, 'A.14', 'A.14.2', 'Keamanan dalam pengembangan dan dukungan proses', '2019-02-28 05:15:55', NULL),
(28, 'A.14', 'A.14.3', 'Data uji', '2019-02-28 05:16:56', NULL),
(29, 'A.15', 'A.15.1', 'Keamanan dalam hubungan pemasok', '2019-02-28 05:17:39', NULL),
(30, 'A.15', 'A.15.2', 'Manajemen pengiriman layanan pemasok', '2019-02-28 05:18:41', NULL),
(31, 'A.16', 'A.16.1', 'Pengelolaan keamanan informasi insiden dan perbaikan', '2019-02-28 05:19:53', NULL),
(32, 'A.17', 'A.17.1', 'Aspek keamanan informasi bisnis manajemen kontinuitas', '2019-02-28 05:21:03', NULL),
(33, 'A.17', 'A.17.2', 'Redudansi', '2019-02-28 05:21:29', NULL),
(34, 'A.18', 'A.18.1', 'Kepatuhan dengan persyaratan hukum', '2019-02-28 05:22:00', NULL),
(35, 'A.18', 'A.18.2', 'Tinjauan keamanan informasi', '2019-02-28 05:22:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_klausal`
--

CREATE TABLE `t_klausal` (
  `id_klausal` int(11) NOT NULL,
  `kode_klausal` varchar(25) NOT NULL,
  `klausal` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_klausal`
--

INSERT INTO `t_klausal` (`id_klausal`, `kode_klausal`, `klausal`, `created_at`, `updated_at`, `id_jabatan`) VALUES
(1, 'A.5', 'Kebijakan Keamanan Informasi', '2019-07-27 07:34:24', '0000-00-00 00:00:00', 2),
(2, 'A.6', 'Keamanan Informasi Organisasi', '2019-07-27 07:34:26', '0000-00-00 00:00:00', 2),
(3, 'A.7', 'Keamanan Sumber Daya Manusia', '2019-07-27 07:34:51', '0000-00-00 00:00:00', 4),
(4, 'A.8', 'Manajemen Asset', '2019-07-27 07:33:43', '0000-00-00 00:00:00', 1),
(5, 'A.9', 'Keamanan Logis / Kontrol Akses', '2019-07-27 07:33:46', '0000-00-00 00:00:00', 1),
(6, 'A.10', 'Kriptografi', '2019-07-27 07:33:50', '0000-00-00 00:00:00', 1),
(7, 'A.11', 'Keamanan Fisik dan Lingkungan', '2019-07-27 07:33:52', '0000-00-00 00:00:00', 1),
(8, 'A.12', 'Keamanan Operasi', '2019-07-27 07:34:42', '0000-00-00 00:00:00', 3),
(9, 'A.13', 'Keamanan Komunikasi ', '2019-07-27 07:34:44', '0000-00-00 00:00:00', 3),
(10, 'A.14', 'Sistem Akuisisi , Pengembangan, dan Pemeliharaan', '2019-07-27 07:34:09', '0000-00-00 00:00:00', 1),
(11, 'A.15', 'Hubungan Pemasok', '2019-07-27 07:34:13', '0000-00-00 00:00:00', 1),
(12, 'A.16', 'Manajemen Insiden Keamanan Informasi', '2019-07-27 07:34:31', '0000-00-00 00:00:00', 2),
(13, 'A.17', 'Kesinambungan Bisnis', '2019-07-27 07:34:47', '0000-00-00 00:00:00', 3),
(14, 'A.18', 'Kepatuhan', '2019-07-27 07:34:16', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_kuisioner`
--

CREATE TABLE `t_kuisioner` (
  `id_kuisioner` int(11) NOT NULL,
  `kode_klausal` varchar(25) NOT NULL,
  `kode_keamanan` varchar(25) NOT NULL,
  `kode_tujuan` varchar(25) NOT NULL,
  `kuisioner` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kuisioner`
--

INSERT INTO `t_kuisioner` (`id_kuisioner`, `kode_klausal`, `kode_keamanan`, `kode_tujuan`, `kuisioner`, `created_at`, `updated_at`) VALUES
(3, 'A.5', 'A.5.1', 'A.5.1.1', 'Apakah kebijakan keamanan informasi yang disetujui oleh manajemen dan sudah diterbitkan telah cukupdikomunikasikan kepada semua karyawan dan pihak relevan?', '2019-03-01 08:21:23', NULL),
(4, 'A.5', 'A.5.1', 'A.5.1.2', 'Apakah peninjauan secara berkala pada kebijakan keamanan informasi untuk memastikan kelanjutan kesesuaian sudah efektif ?', '2019-03-01 08:22:30', NULL),
(5, 'A.6', 'A.6.1', 'A.6.1.1', 'Apakah  pihak manajemen aktif mendukung keamanan dalam organisasi melalui kejelasan arah, komitmen, tugas eksplisit, serta pengakuan tanggungjawab keamanan informasi ?', '2019-03-01 08:25:09', NULL),
(6, 'A.11', 'A.11.1', 'A.11.1.1', 'Bagaimana batas keamanan batas keamanan (dinding gerbang masuk) melindungi area yang mengandung informasi dan fasilitas pengolahan informasi ?\r\n', '2019-03-01 08:42:19', NULL),
(7, 'A.11', 'A.11.1', 'A.11.1.2', 'Bagaimana perancangan keamanan fisik untuk kantor, ruangan, dan fasilitas ?', '2019-03-01 08:43:58', NULL),
(8, 'A.11', 'A.11.1', 'A.11.1.3', 'Bagaimana penerapan perlindungan fisik terhadap kerusakan akibat kebakaran, bajir, gempa bumi, ledakan, kerusuhan sipil, dan bentuk lain dari bencana alam maupun buatan manusia ?', '2019-03-01 08:45:41', NULL),
(9, 'A.11', 'A.11.1', 'A.11.1.4', 'Bagaimana penerapan perlindungan fisik dan pedoman untuk bekerja didaerah yang aman ?', '2019-03-01 08:47:13', NULL),
(10, 'A.11', 'A.11.1', 'A.11.1.5', 'Bagaimana pengendalian jalur akses seperti area pengiriman dan pemuatan serta filter orang-orang yang tidak memiliki hak akses untuk masuk ?', '2019-03-01 08:48:42', NULL),
(11, 'A.6', 'A.6.1', 'A.6.1.2', 'Apakah setiap perwakilan dari berbagai pihak bagian dari organisasi sudah dikoordinasikan sesuai dengan peran dan fungsi pekerjaan relevan ?', '2019-03-01 08:49:09', NULL),
(12, 'A.11', 'A.11.1', 'A.11.1.6', 'Bagaimana upaya perlindungan peralatan untuk mengurangi resiko dari ancaman lingkungan, bahaya, maupun dari akses yang tisak sah ?', '2019-03-01 08:49:41', NULL),
(13, 'A.6', 'A.6.1', 'A.6.1.3', 'Bagaimana ketetapan semua tanggungjawab keamanan informasi ?', '2019-03-01 08:49:48', NULL),
(14, 'A.6', 'A.6.1', 'A.6.1.4', 'Apakah proses otorisasi manajemen untuk fasilitas pemrosesan informasi baru sudah didefinisikan dan diimplementasikan dengan baik ?', '2019-03-01 08:50:43', NULL),
(15, 'A.11', 'A.11.2', 'A.11.2.1', 'Bagaimana perlindungan dari kemungkinan gangguan listrik dan gangguan lain yang disebabkan oleh kegagalan dalam pendukung utilitas ?', '2019-03-01 08:52:48', NULL),
(16, 'A.11', 'A.11.1', 'A.11.2.2', 'Bagaimana perlindungan kabel daya dan telekomunikasi pembawa data atau layanan informasi pendukung dari intersepsi atau kerusakan ?', '2019-03-01 08:53:29', NULL),
(17, 'A.11', 'A.11.1', 'A.11.2.3', 'Bagaimana pemeliharaan peralatan yang memastikan ketersediaan dan integritas yang berkelanjutan ?', '2019-03-01 08:54:06', NULL),
(18, 'A.11', 'A.11.1', 'A.11.2.4', 'Bagaimana penerapan keamanan pada peralatan di luar lokasi dengan mempertimbangkan resiko yang berbeda diluar tempat organisasi ?', '2019-03-01 08:54:44', NULL),
(19, 'A.6', 'A.6.1', 'A.6.1.5', 'Apakah peninjauan perjanjian kerahasiaan yang mencerminkan kebutuhan organisasi untuk perlindungan informasi sudah diidentifikasikan secara teratur ?', '2019-03-05 14:02:40', NULL),
(20, 'A.6', 'A.6.2', 'A.6.2.1', 'Sebelum diberi akses, apakah resiko terhadap fasilitas informasi dan pemrosesan informasi organisasi proses bisnis yang melibatkan pihak eksternal sudah cuckup diidentifikasikan ?', '2019-03-05 14:03:36', NULL),
(21, 'A.6', 'A.6.2', 'A.6.2.2', 'Apakah semua persyaratan keamana yang diidentifikasi sudah ditangani dengan baik sebelum memberikan akases kepada pengguna ?', '2019-03-05 14:04:15', NULL),
(22, 'A.7', 'A.7.1', 'A.7.1.1', 'Apakah peran dan tanggungjawab keamanan karyawan, kontraktor, dan pengguna pihak ketiga sudah didefinisikan dan didokumentasikan sesuai dengan kemanan informasi organisasi ?', '2019-03-05 15:41:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_tujuan`
--

CREATE TABLE `t_tujuan` (
  `id_tujuan` int(11) NOT NULL,
  `kode_klausal` varchar(25) NOT NULL,
  `kode_keamanan` varchar(25) NOT NULL,
  `kode_tujuan` varchar(25) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tujuan`
--

INSERT INTO `t_tujuan` (`id_tujuan`, `kode_klausal`, `kode_keamanan`, `kode_tujuan`, `tujuan`, `created_at`, `updated_at`) VALUES
(1, 'A.5', 'A.5.1', 'A.5.1.1', 'Kebijakan untuk Keamanan informasi', '2019-02-12 05:39:20', NULL),
(2, 'A.5', 'A.5.1', 'A.5.1.2', 'Tujuan Kebijakan Untuk Keamanan Informasi', '2019-02-12 05:40:00', NULL),
(3, 'A.6', 'A.6.1', 'A.6.1.1', 'Peran Keamanan Informasi dan Tanggung Jawab', '2019-02-12 08:15:33', NULL),
(4, 'A.6', 'A.6.1', 'A.6.1.2', 'Kontak dengan pihak yang berwenang', '2019-02-27 10:05:32', NULL),
(5, 'A.6', 'A.6.1', 'A.6.1.3', 'Kontak dengan kelompok minat khusus', '2019-02-27 10:06:24', NULL),
(6, 'A.6', 'A.6.1', 'A.6.1.4', 'Keamanan informasi dalam manajemen proyek', '2019-02-27 10:07:07', NULL),
(7, 'A.6', 'A.6.1', 'A.6.1.5', 'Segresi tugas', '2019-02-27 10:07:39', NULL),
(8, 'A.6', 'A.6.2', 'A.6.2.1', 'Kebijakan perangkat seluler', '2019-02-27 10:08:36', NULL),
(9, 'A.6', 'A.6.2', 'A.6.2.2', 'Teleworking', '2019-02-27 10:09:07', NULL),
(10, 'A.7', 'A.7.1', 'A.7.1.1', 'Penyaringan', '2019-02-27 11:16:11', NULL),
(11, 'A.7', 'A.7.1', 'A.7.1.2', 'Syarat dan ketentuan pekerjaan', '2019-02-27 11:16:45', NULL),
(12, 'A.7', 'A.7.2', 'A.7.2.1', 'Tanggung jawab manajemen', '2019-02-28 05:42:57', NULL),
(13, 'A.7', 'A.7.2', 'A.7.2.2', 'Kesadaran keamanan informasi, pendidikan dan pelatihan', '2019-02-28 05:43:38', NULL),
(14, 'A.7', 'A.7.2', 'A.7.2.3', 'Proses pendisiplinan', '2019-02-28 05:44:37', NULL),
(15, 'A.7', 'A.7.3', 'A.7.3.1', 'Penghentian atau tanggung jawab perubahan pekerjaan', '2019-02-28 05:45:24', NULL),
(16, 'A.8', 'A.8.1', 'A.8.1.1', 'Inventarisasi asset', '2019-02-28 06:01:40', NULL),
(17, 'A.8', 'A.8.1', 'A.8.1.2', 'Kepemilikan asset', '2019-02-28 06:02:01', NULL),
(18, 'A.8', 'A.8.1', 'A.8.1.3', 'Penggunaan asset yang diterima', '2019-02-28 06:02:59', NULL),
(19, 'A.8', 'A.8.2', 'A.8.2.1', 'Klasifikasi informasi', '2019-02-28 06:10:55', NULL),
(20, 'A.8', 'A.8.2', 'A.8.2.2', 'Pemberian label informasi', '2019-02-28 06:11:47', NULL),
(21, 'A.8', 'A.8.2', 'A.8.2.3', 'Penanganan asset', '2019-02-28 06:12:15', NULL),
(22, 'A.8', 'A.8.2', 'A.8.2.4', 'Pengembalian asset', '2019-02-28 06:43:06', NULL),
(23, 'A.8', 'A.8.3', 'A.8.3.1', 'Pengelolaan media yang dapat dilepas', '2019-02-28 06:43:41', NULL),
(24, 'A.8', 'A.8.3', 'A.8.3.2', 'Pembuangan media', '2019-02-28 06:44:01', NULL),
(25, 'A.8', 'A.8.3', 'A.8.3.3', 'Transfer media fisik', '2019-02-28 06:44:28', NULL),
(26, 'A.9', 'A.9.1', 'A.9.1.1', 'Kebijakan kontrol akses', '2019-02-28 06:51:41', NULL),
(27, 'A.9', 'A.9.1', 'A.9.1.2', 'Kebijakan tentang pengguna layanan jaringan', '2019-02-28 06:52:18', NULL),
(28, 'A.9', 'A.9.2', 'A.9.2.1', 'Registrasi pengguna', '2019-02-28 06:52:55', NULL),
(29, 'A.9', 'A.9.2', 'A.9.2.2', 'Manajemen hak istimewa', '2019-02-28 06:53:24', NULL),
(30, 'A.9', 'A.9.2', 'A.9.2.3', 'Manajemen otentikasi rahasia informasi pengguna', '2019-02-28 06:53:55', NULL),
(31, 'A.9', 'A.9.2', 'A.9.2.4', 'Tinjauan hak akses pengguna', '2019-02-28 07:37:45', NULL),
(32, 'A.9', 'A.9.2', 'A.9.2.5', 'Penghapusan atau penyesuaian hak akses', '2019-02-28 07:39:52', NULL),
(33, 'A.9', 'A.9.3', 'A.9.3.1', 'Penggunaan informasi otentikasi rahasia', '2019-02-28 07:40:41', NULL),
(34, 'A.9', 'A.9.4', 'A.9.4.1', 'Pembatasan akses informasi', '2019-02-28 07:41:14', NULL),
(35, 'A.9', 'A.9.4', 'A.9.4.2', 'Prosedur login yang aman', '2019-02-28 07:41:55', NULL),
(36, 'A.9', 'A.9.4', 'A.9.4.3', 'Sistem manajemen kata sandi', '2019-02-28 08:24:53', NULL),
(37, 'A.9', 'A.9.4', 'A.9.4.4', 'Penggunaan program utilitas istimewa', '2019-02-28 08:25:25', NULL),
(38, 'A.9', 'A.9.4', 'A.9.4.5', 'Kontrol akses ke kode sumber program', '2019-02-28 08:25:55', NULL),
(39, 'A.10', 'A.10.1', 'A.10.1.1', 'Kebijakan tentang penggunaan kontrol kriptografi', '2019-02-28 08:28:17', NULL),
(40, 'A.10', 'A.10.1', 'A.10.1.2', 'Pengelolaan kunci', '2019-02-28 08:28:41', NULL),
(41, 'A.11', 'A.11.1', 'A.11.1.1', 'Perimeter keamanan fisik', '2019-02-28 08:29:14', NULL),
(42, 'A.11', 'A.11.1', 'A.11.1.2', 'Kontrol entri fisik', '2019-02-28 08:29:52', NULL),
(43, 'A.11', 'A.11.1', 'A.11.1.3', 'Mengamankan kantor, ruangan dan fasilitas', '2019-02-28 08:30:50', NULL),
(44, 'A.11', 'A.11.1', 'A.11.1.4', 'Melindungi ujung eksterna dari ancaman lingkungan', '2019-02-28 08:31:24', NULL),
(45, 'A.11', 'A.11.1', 'A.11.1.5', 'Bekerja di area yang aman', '2019-02-28 08:31:44', NULL),
(46, 'A.11', 'A.11.1', 'A.11.1.6', 'Area pengiriman dan pemuatan', '2019-02-28 08:32:10', NULL),
(47, 'A.11', 'A.11.2', 'A.11.2.1', 'Penempatan dan perlindungan peralatan', '2019-02-28 08:34:16', NULL),
(48, 'A.11', 'A.11.2', 'A.11.2.2', 'Utilitas pendukung', '2019-02-28 08:34:42', NULL),
(49, 'A.11', 'A.11.2', 'A.11.2.3', 'Keamanan kabel', '2019-02-28 08:35:07', NULL),
(50, 'A.11', 'A.11.2', 'A.11.2.4', 'Pemeliharaan peralatan', '2019-02-28 08:35:41', NULL),
(51, 'A.11', 'A.11.2', 'A.11.2.5', 'Penghapusan asset', '2019-02-28 08:36:09', NULL),
(52, 'A.11', 'A.11.2', 'A.11.2.6', 'Keamanan peralatan dan aset off tempat', '2019-02-28 08:36:52', NULL),
(53, 'A.11', 'A.11.2', 'A.11.2.7', 'Pembuangan atau penggunaan  kembali peralatan secara umum', '2019-02-28 09:01:47', NULL),
(54, 'A.11', 'A.11.2', 'A.11.2.8', 'Penggunaan peralatan yang tidak diawasi', '2019-02-28 09:02:23', NULL),
(55, 'A.11', 'A.11.2', 'A.11.2.9', 'Meja yang jelas dan kebijakan layar yang jelas', '2019-02-28 09:03:10', NULL),
(56, 'A.12', 'A.12.1', 'A.12.1.1', 'Prosedur operasi terdokumentasi', '2019-02-28 09:04:01', NULL),
(57, 'A.12', 'A.12.1', 'A.12.1.2', 'Manajemen perubahan', '2019-02-28 09:04:31', NULL),
(58, 'A.12', 'A.12.1', 'A.12.1.3', 'Manajemen kapasitas', '2019-02-28 09:05:02', NULL),
(59, 'A.12', 'A.12.1', 'A.12.1.4', 'Pemisahan, pengembangan, pengujian dan lingkungan operasional', '2019-02-28 09:49:37', NULL),
(60, 'A.12', 'A.12.2', 'A.12.2.1', 'Kontrol terhadap malware', '2019-02-28 09:50:10', NULL),
(61, 'A.12', 'A.12.3', 'A.12.3.1', 'Pencadangan informasi', '2019-02-28 09:50:36', NULL),
(62, 'A.12', 'A.12.4', 'A.12.4.1', 'Pencatatan kejadian', '2019-02-28 09:51:04', NULL),
(63, 'A.12', 'A.12.4', 'A.12.4.2', 'Perlindungan informasi log', '2019-02-28 09:51:39', NULL),
(64, 'A.12', 'A.12.4', 'A.12.4.3', 'Log administrasi dan operator', '2019-02-28 09:52:07', NULL),
(65, 'A.12', 'A.12.4', 'A.12.4.4', 'Sinkronisasi jam', '2019-02-28 09:52:35', NULL),
(66, 'A.12', 'A.12.5', 'A.12.5.1', 'Pemasangan perangkat lunak pada operasional', '2019-02-28 09:54:54', NULL),
(67, 'A.12', 'A.12.6', 'A.12.6.1', 'Pengelolaan kerentanan teknis', '2019-02-28 09:55:48', NULL),
(68, 'A.12', 'A.12.6', 'A.12.6.2', 'Pembatasan pada instalasi perangkat lunak', '2019-02-28 09:56:19', NULL),
(69, 'A.12', 'A.12.7', 'A.12.7.1', 'Kontrol audit sistem informasi', '2019-02-28 09:56:49', NULL),
(70, 'A.13', 'A.13.1', 'A.13.1.1', 'Kontrol jaringan', '2019-02-28 09:58:08', NULL),
(71, 'A.13', 'A.13.1', 'A.13.1.2', 'Keamanan layanan jaringan', '2019-02-28 09:58:35', NULL),
(72, 'A.13', 'A.13.1', 'A.13.1.3', 'Segresi dalam jaringan', '2019-02-28 09:59:00', NULL),
(73, 'A.13', 'A.13.2', 'A.13.2.1', 'Kebijakan transfer informasi dan prosedur', '2019-02-28 09:59:50', NULL),
(74, 'A.13', 'A.13.2', 'A.13.2.2', 'Kesepakatan tentang transfer informasi', '2019-02-28 10:00:19', NULL),
(75, 'A.13', 'A.13.2', 'A.13.2.3', 'Pesan elektronik', '2019-02-28 10:00:37', NULL),
(76, 'A.13', 'A.13.2', 'A.13.2.4', 'Kerahasiaan atau non pengungkapan pekerjaan', '2019-02-28 10:01:15', NULL),
(77, 'A.14', 'A.14.1', 'A.14.1.1', 'Analisis persyaratan keamanan dan spesifikasi', '2019-02-28 10:02:25', NULL),
(78, 'A.14', 'A.14.1', 'A.14.1.2', 'Mengamankan layanan aplikasi didepan umum', '2019-02-28 10:02:56', NULL),
(79, 'A.14', 'A.14.1', 'A.14.1.3', 'Melindungi transaksi layanan aplikasi', '2019-02-28 10:03:30', NULL),
(80, 'A.14', 'A.14.2', 'A.14.2.1', 'Kebijakan pembangunan yang aman', '2019-02-28 10:04:35', NULL),
(81, 'A.14', 'A.14.2', 'A.14.2.2', 'Tinjauan teknis aplikasi setelah perubahan platform operasi', '2019-02-28 10:05:17', NULL),
(82, 'A.14', 'A.14.2', 'A.14.2.3', 'Batasan perubahan perangkat lunak', '2019-02-28 10:05:56', NULL),
(83, 'A.14', 'A.14.2', 'A.14.2.4', 'Prosedur pengembangan sistem', '2019-02-28 10:06:53', NULL),
(84, 'A.14', 'A.14.2', 'A.14.2.5', 'Lingkungan pengembangan yang aman', '2019-02-28 10:07:27', NULL),
(85, 'A.14', 'A.14.2', 'A.14.2.6', 'Pengembangan yang dialihdayakan', '2019-02-28 10:08:00', NULL),
(86, 'A.14', 'A.14.2', 'A.14.2.7', 'Pengujian keamanan system', '2019-02-28 10:08:27', NULL),
(87, 'A.14', 'A.14.2', 'A.14.2.8', 'Pengujian penerimaan system', '2019-02-28 10:08:49', NULL),
(88, 'A.14', 'A.14.3', 'A.14.3.1', 'Perlindungan data uji', '2019-02-28 10:09:32', NULL),
(89, 'A.15', 'A.15.1', 'A.15.1.1', 'Kebijakan keamanan informasi untuk hubungan pemasok', '2019-02-28 10:10:17', NULL),
(90, 'A.15', 'A.15.1', 'A.15.1.2', 'Mengatasi keamanan dalam perjanjian pemasok', '2019-02-28 10:10:49', NULL),
(91, 'A.15', 'A.15.1', 'A.15.1.3', 'Rantai pasokan TIK', '2019-02-28 10:12:02', NULL),
(92, 'A.15', 'A.15.2', 'A.15.2.1', 'Pemantauan dan peninjauan layanan pemasok', '2019-03-01 05:09:09', NULL),
(93, 'A.15', 'A.15.2', 'A.15.2.2', 'Mengelola perubahan pada layanan pemasok', '2019-03-01 05:09:37', NULL),
(94, 'A.16', 'A.16.1', 'A.16.1.1', 'Tanggung jawab dan prosedur', '2019-03-01 05:10:27', NULL),
(95, 'A.16', 'A.16.1', 'A.16.1.2', 'Pelaporan kejadian keamanan informasi', '2019-03-01 05:11:05', NULL),
(96, 'A.16', 'A.16.1', 'A.16.1.3', 'Pelaporan kelemahan keamanan informasi', '2019-03-01 05:14:33', NULL),
(97, 'A.16', 'A.16.1', 'A.16.1.4', 'Penilaian dan keputusan peristiwa keamanan', '2019-03-01 05:38:23', NULL),
(98, 'A.16', 'A.16.1', 'A.16.1.5', 'Tanggapan terhadap insiden keamanan informasi', '2019-03-01 05:40:03', NULL),
(99, 'A.16', 'A.16.1', 'A.16.1.6', 'Belajar dari keamanan insiden informasi', '2019-03-01 05:41:29', NULL),
(100, 'A.16', 'A.16.1', 'A.16.1.7', 'Pengumpulan bukti', '2019-03-01 05:41:55', NULL),
(101, 'A.17', 'A.17.1', 'A.17.1.1', 'Merencanakan keberlanjutan keamanan informasi', '2019-03-01 05:42:55', NULL),
(102, 'A.17', 'A.17.1', 'A.17.1.2', 'Menerapkan keamanan informasi kontinuitas', '2019-03-01 05:43:37', NULL),
(103, 'A.17', 'A.17.1', 'A.17.1.3', 'Verifikasi, tinjauan dan evaluasi informasi', '2019-03-01 05:44:13', NULL),
(104, 'A.17', 'A.17.2', 'A.17.2.1', 'Ketersediaan pemrosesan informasi fasilitas ', '2019-03-01 05:46:25', NULL),
(105, 'A.18', 'A.18.1', 'A.18.1.1', 'Identifikasi peraturan yang berlaku', '2019-03-01 05:46:55', NULL),
(106, 'A.18', 'A.18.1', 'A.18.1.2', 'Hak kekayaan intelektual', '2019-03-01 05:47:21', NULL),
(107, 'A.18', 'A.18.1', 'A.18.1.3', 'Perlindungan catatan organisai', '2019-03-01 05:47:59', NULL),
(108, 'A.18', 'A.18.1', 'A.18.1.4', 'Perlindungan data dari privasi informasi pribadi', '2019-03-01 07:55:41', NULL),
(109, 'A.18', 'A.18.1', 'A.18.1.5', 'Pencegahan penyalahgunaan fasilitas pemrosesan informasi', '2019-03-01 07:56:24', NULL),
(110, 'A.18', 'A.18.1', 'A.18.1.6', 'Pengaturan kontrol kriptografi', '2019-03-01 07:56:56', NULL),
(111, 'A.18', 'A.18.2', 'A.18.2.1', 'Tinjauan independen terhadap keamanan informasi', '2019-03-01 07:57:34', NULL),
(112, 'A.18', 'A.18.2', 'A.18.2.2', 'Kepatuhan dengan kebijakan keamanan dan standar', '2019-03-01 07:58:10', NULL),
(113, 'A.18', 'A.18.2', 'A.18.2.3', 'Tinjauan kepatuhan teknis', '2019-03-01 07:58:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id_user` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_jabatan` int(25) NOT NULL,
  `level` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id_user`, `name`, `username`, `email`, `password`, `id_jabatan`, `level`, `created_at`, `updated_at`) VALUES
(13, 'Atox', 'atox', 'atox@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, '2', '2019-07-27 02:30:31', '0000-00-00 00:00:00'),
(14, 'admin', 'admin', 'admin@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 0, '1', '2019-07-27 07:59:00', '0000-00-00 00:00:00'),
(15, 'coks', 'coksss', 'coks@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, '2', '2019-07-27 04:09:51', '0000-00-00 00:00:00'),
(16, 'y', 'y', 'y@gmail.com', '415290769594460e2e485922904f345d', 3, '2', '2019-07-28 11:15:00', '0000-00-00 00:00:00'),
(17, 't', 't', 't@mail.com', 'e358efa489f58062f10dd7316b65649e', 1, '2', '2019-07-28 11:15:53', '0000-00-00 00:00:00'),
(18, '1', '1', '1@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, '2', '2019-07-28 11:20:03', '0000-00-00 00:00:00'),
(19, 'q', 'q', 'q@gmail.com', '7694f4a66316e53c8cdd9d9954bd611d', 4, '2', '2019-07-28 11:25:04', '0000-00-00 00:00:00'),
(20, 'a', 'a', 'a@gmail.com', '0cc175b9c0f1b6a831c399e269772661', 4, '2', '2019-07-28 11:25:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure for view `totalresponden`
--
DROP TABLE IF EXISTS `totalresponden`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalresponden`  AS  select distinct `t_hasil_quisioner`.`kode_user` AS `kode_user` from `t_hasil_quisioner` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_hasil_quisioner`
--
ALTER TABLE `t_hasil_quisioner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_keamanan`
--
ALTER TABLE `t_keamanan`
  ADD PRIMARY KEY (`id_keamanan`);

--
-- Indexes for table `t_klausal`
--
ALTER TABLE `t_klausal`
  ADD PRIMARY KEY (`id_klausal`);

--
-- Indexes for table `t_kuisioner`
--
ALTER TABLE `t_kuisioner`
  ADD PRIMARY KEY (`id_kuisioner`);

--
-- Indexes for table `t_tujuan`
--
ALTER TABLE `t_tujuan`
  ADD PRIMARY KEY (`id_tujuan`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_hasil_quisioner`
--
ALTER TABLE `t_hasil_quisioner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_keamanan`
--
ALTER TABLE `t_keamanan`
  MODIFY `id_keamanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `t_klausal`
--
ALTER TABLE `t_klausal`
  MODIFY `id_klausal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_kuisioner`
--
ALTER TABLE `t_kuisioner`
  MODIFY `id_kuisioner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_tujuan`
--
ALTER TABLE `t_tujuan`
  MODIFY `id_tujuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
