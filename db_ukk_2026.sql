-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2026 at 07:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ukk_2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_guru`
--

CREATE TABLE `t_guru` (
  `id` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated-at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_guru`
--

INSERT INTO `t_guru` (`id`, `nip`, `nama`, `email`, `status_aktif`, `user_id`, `created_at`, `updated-at`) VALUES
(3, '198806250405000104', 'Dody Jaenudin, S.Pd.', 'dodyjaenudin@gmail.com', 0, 5, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(4, '198907300505000105', 'Dedi Kardiman, S.Pd', 'dedikardiman@gmail.com', 0, 6, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(5, '199008040605000106', 'Uca Musa Yusenda, S.Pd', 'ucamusayusenda@gmail.com', 0, 7, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(6, '196509090705000107', 'Drs. Ahmad Nur Mukhlis', 'ahmadnurmukhlis@gmail.com', 1, 8, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(7, '196610140805000108', 'Drs. Heri', 'heri@gmail.com', 1, 9, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(8, '196711190905000109', 'Asep Bastaman', 'asepbastaman@gmail.com', 1, 10, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(9, '196812241005000110', 'H. Encep Maemun, S.T.,M.Pd', 'encepmaemun@gmail.com', 1, 11, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(10, '197001291105000111', 'Opik', 'opik@gmail.com', 1, 12, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(11, '197102031205000112', 'Ida Farida, S.Pd', 'idafarida@gmail.com', 1, 13, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(12, '197203101305000113', 'Idah Mahmudah, S.Pd', 'idahmahmudah@gmail.com', 1, 14, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(13, '196304151405000114', 'Drs. Muhamad Ali', 'muhamadali@gmail.com', 1, 15, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(14, '197405201505000115', 'Helmi Ali Akbar, S.Pd.I', 'helmialiakbar@gmail.com', 1, 16, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(15, '197506251605000116', 'Syeni Suswarini, S.Pd', 'syenisuswarini@gmail.com', 1, 17, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(16, '197607301705000117', 'Wiwid Yulianti, S.Pd', 'wiwidyulianti@gmail.com', 1, 18, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(17, '197708041805000118', 'Ansor Muhajir, S.T', 'ansormuhajir@gmail.com', 1, 19, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(18, '197809091905000119', 'Ogi Gaosun Gias, S.Pd.I', 'ogigaosungias@gmail.com', 1, 20, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(19, '197910142005000120', 'Sandi Mulyana, S.Pd', 'sandimulyana@gmail.com', 1, 21, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(20, '198011192105000121', 'Erna Suryani, S.Pd', 'ernasuryani@gmail.com', 1, 22, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(21, '198112242205000122', 'Ai Wahidah, S.Ag', 'aiwahidah@gmail.com', 1, 23, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(22, '198301292305000123', 'Chandra Aditya Yusup, S.Pd', 'chandraadityayusup@gmail.com', 1, 24, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(23, '198402032405000124', 'Arif Kusmawan, S.Pd', 'arifkusmawan@gmail.com', 1, 25, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(24, '198503102505000125', 'Asep Taufiq Hidayat, S.Kom', 'aseptaufiqhidayat@gmail.com', 1, 26, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(25, '198604152605000126', 'Rendy Ichsan Kusumah, S.T', 'rendyichsankusumah@gmail.com', 1, 27, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(26, '198705202705000127', 'Feri Rahmawan, S.Pd', 'ferirahmawan@gmail.com', 1, 28, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(27, '198806252805000128', 'Ari Sandriana, S.Kom', 'arisandriana@gmail.com', 1, 29, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(28, '198907302905000129', 'Yaneu Nurdian, S.Pd', 'yaneunurdian@gmail.com', 1, 30, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(29, '199008043005000130', 'Ucu Muhammad Khoer N, S.Pd', 'ucumuhammadkhoern@gmail.com', 1, 31, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(30, '199109093105000131', 'Mira Dwi Rahmawati, S.Ag', 'miradwirahmawati@gmail.com', 1, 32, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(31, '199210143205000132', 'Aldi Maulana, S.Pd', 'aldimaulana@gmail.com', 1, 33, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(32, '199311193305000133', 'Eli Rosliah, S.Pd', 'elirosliah@gmail.com', 1, 34, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(33, '199412243405000134', 'Isni Nur Fitriani, S.Pd', 'isninurfitriani@gmail.com', 1, 35, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(34, '199501293505000135', 'Aanisah Putri Nur Aini, S.Pd', 'aanisahputrinuraini@gmail.com', 1, 36, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(35, '199602033605000136', 'Yusi Luthfiani, S.Sos.I', 'yusiluthfiani@gmail.com', 1, 37, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(36, '199703103705000137', 'Lilis Rustandy Mawardi, S.Pd., M.Pd', 'lilisrustandymawardi@gmail.com', 1, 38, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(37, '199804153805000138', 'Yusrin Noer Sabrina, S.Pd', 'yusrinnoersabrina@gmail.com', 1, 39, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(38, '199905203905000139', 'Senny Indayani, S.Pd', 'sennyindayani@gmail.com', 1, 40, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(39, '200006254005000140', 'Ilma Amalia, S.Pd', 'ilmaamalia@gmail.com', 1, 41, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(40, '200107304105000141', 'Alvira Sofwatunnisa, S.Pd', 'alvirasofwatunnisa@gmail.com', 1, 42, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(41, '200208044205000142', 'Risna Andriyani, S.Pd', 'risnaandriyani@gmail.com', 1, 43, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(42, '200309094305000143', 'Dra. Tintin Noerhayati', 'tintinnoerhayati@gmail.com', 1, 44, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(43, '200410144405000144', 'Rizkia Fahira, S.Pd', 'rizkiafahira@gmail.com', 1, 45, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(44, '200511194505000145', 'Frasetio', 'frasetio@gmail.com', 1, 46, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(45, '200612244605000146', 'Ratnaningsih Hatil Aeni, S.Pd.', 'ratnaningsihhatilaeni@gmail.com', 1, 47, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(46, '200701294705000147', 'Dheny Darajatul Hasani, S.Pd.', 'dhenydarajatulhasani@gmail.com', 1, 48, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(47, '200802034805000148', 'Fahrullah, S.Pd', 'fahrullah@gmail.com', 1, 49, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(48, '200903104905000149', 'Aan Andriana, S.T', 'aanandriana@gmail.com', 1, 50, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(49, '201004155005000150', 'Fitri Fauziah, S.Pd', 'fitrifauziah@gmail.com', 1, 51, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(50, '201105205105000151', 'Nida Aulia, S.Pd', 'nidaaulia@gmail.com', 1, 52, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(51, '201206255205000152', 'Sri Nurrizki Putri Krisnadi, S.Pd', 'srinurrizkiputrikrisnadi@gmail.com', 1, 53, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(52, '201307305305000153', 'Riesy Putri Navia, S.Kom', 'riesyputrinavia@gmail.com', 1, 54, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(53, '201408045405000154', 'Rurry Febriani Maryadi, S.Pd', 'rurryfebrianimaryadi@gmail.com', 1, 55, '2026-11-05 00:38:16', '2026-11-05 00:38:16'),
(54, '201509095505000155', 'Irvan Rizal, S.Pd', 'irvanrizal@gmail.com', 1, 56, '2026-11-05 00:38:16', '2026-11-05 00:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas`
--

CREATE TABLE `t_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tingkat` varchar(20) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `maksimal_siswa` int(11) DEFAULT 25
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_kelas`
--

INSERT INTO `t_kelas` (`id`, `nama`, `tingkat`, `jurusan`, `status_aktif`, `created_at`, `updated_at`, `update_at`, `maksimal_siswa`) VALUES
(1, 'X RPL 1', 'X', 'REKAYASA PERANGKAT LUNAK', 0, '2026-11-05 01:12:49', '2026-11-05 08:22:55', '2026-11-05 01:12:49', 28),
(2, 'X RPL 2', 'X', 'REKAYASA PERANGKAT LUNAK', 0, '2026-11-05 01:13:07', '2026-11-05 08:17:41', '2026-11-05 01:13:07', 28),
(3, 'XI RPL 1', 'XI', 'REKAYASA PERANGKAT LUNAK', 0, '2026-11-05 01:13:27', '2026-11-05 08:17:49', '2026-11-05 01:13:27', 28),
(4, 'XI RPL 2', 'XI', 'REKAYASA PERANGKAT LUNAK', 0, '2026-11-05 01:13:41', '2026-11-05 08:17:59', '2026-11-05 01:13:41', 28),
(5, 'XII RPL 1', 'XII', 'REKAYASA PERANGKAT LUNAK', 0, '2026-11-05 01:14:02', '2026-11-05 08:23:01', '2026-11-05 01:14:02', 28),
(6, 'XII RPL 2', 'XII', 'REKAYASA PERANGKAT LUNAK', 1, '2026-11-05 01:14:19', '2026-11-05 08:27:50', '2026-11-05 01:14:19', 28),
(7, 'X TKJ 1', 'X', 'TEKNIK KELOLA JARINGAN', 0, '2026-11-05 01:15:38', '2026-11-05 08:18:05', '2026-11-05 01:15:38', 25),
(8, 'X TKJ 2', 'X', 'TEKNIK KELOLA JARINGAN', 1, '2026-11-05 01:15:49', '2026-11-10 09:58:26', '2026-11-05 01:15:49', 25),
(9, 'XI TKJ 1', 'XI', 'TEKNIK KELOLA JARINGAN', 0, '2026-11-05 01:15:58', '2026-11-05 08:18:15', '2026-11-05 01:15:58', 25),
(10, 'XI TKJ 2', 'XI', 'TEKNIK KELOLA JARINGAN', 0, '2026-11-05 01:16:36', '2026-11-05 08:18:20', '2026-11-05 01:16:36', 25),
(11, 'XII TKJ 1', 'XII', 'TEKNIK KELOLA JARINGAN', 0, '2026-11-05 01:16:48', '2026-11-05 08:18:41', '2026-11-05 01:16:48', 25),
(12, 'XII TKJ 2', 'XII', 'TEKNIK KELOLA JARINGAN', 0, '2026-11-05 01:17:13', '2026-11-05 08:18:34', '2026-11-05 01:17:13', 25),
(13, 'XII TKR 3', 'XII', 'Teknik Kendaraan Ringan', 1, '2026-11-09 07:32:05', '2026-11-09 14:32:05', '2026-11-09 07:32:05', 25),
(14, 'X TKR 2', 'X', 'Tenik Kendaraan Ringan', 1, '2026-11-10 03:06:47', '2026-11-10 10:06:47', '2026-11-10 03:06:47', 30);

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas_siswa`
--

CREATE TABLE `t_kelas_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_kelas_siswa`
--

INSERT INTO `t_kelas_siswa` (`id`, `siswa_id`, `tahun_ajaran_id`, `kelas_id`, `tanggal_mulai`, `tanggal_selesai`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 27, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:17:26', '2026-11-05 01:17:26'),
(2, 28, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:22:35', '2026-11-05 01:22:35'),
(3, 29, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:22:44', '2026-11-05 01:22:44'),
(4, 30, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:22:49', '2026-11-05 01:22:49'),
(5, 31, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:10', '2026-11-05 01:23:10'),
(6, 32, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:14', '2026-11-05 01:23:14'),
(7, 33, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:18', '2026-11-05 01:23:18'),
(8, 34, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:24', '2026-11-05 01:23:24'),
(9, 35, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:28', '2026-11-05 01:23:28'),
(10, 36, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:33', '2026-11-05 01:23:33'),
(11, 37, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:42', '2026-11-05 01:23:42'),
(12, 38, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:46', '2026-11-05 01:23:46'),
(13, 39, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:50', '2026-11-05 01:23:50'),
(14, 40, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:23:56', '2026-11-05 01:23:56'),
(15, 41, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:03', '2026-11-05 01:24:03'),
(16, 42, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:37', '2026-11-05 01:24:37'),
(17, 43, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:41', '2026-11-05 01:24:41'),
(18, 44, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:45', '2026-11-05 01:24:45'),
(19, 45, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:51', '2026-11-05 01:24:51'),
(20, 46, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:24:56', '2026-11-05 01:24:56'),
(21, 47, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:01', '2026-11-05 01:25:01'),
(22, 48, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:05', '2026-11-05 01:25:05'),
(23, 49, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:10', '2026-11-05 01:25:10'),
(24, 50, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:14', '2026-11-05 01:25:14'),
(25, 51, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:22', '2026-11-05 01:25:22'),
(26, 52, 7, 6, '0000-00-00', '0000-00-00', 0, '2026-11-05 01:25:26', '2026-11-05 01:25:26'),
(27, 53, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:33:41', '2026-11-09 07:33:41'),
(28, 54, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:33:47', '2026-11-09 07:33:47'),
(29, 55, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:33:52', '2026-11-09 07:33:52'),
(30, 56, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:33:57', '2026-11-09 07:33:57'),
(31, 57, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:02', '2026-11-09 07:34:02'),
(32, 58, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:06', '2026-11-09 07:34:06'),
(33, 59, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:10', '2026-11-09 07:34:10'),
(34, 60, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:14', '2026-11-09 07:34:14'),
(35, 61, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:20', '2026-11-09 07:34:20'),
(36, 62, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:24', '2026-11-09 07:34:24'),
(37, 63, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:30', '2026-11-09 07:34:30'),
(38, 64, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:36', '2026-11-09 07:34:36'),
(39, 65, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:41', '2026-11-09 07:34:41'),
(40, 66, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:45', '2026-11-09 07:34:45'),
(41, 67, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:34:53', '2026-11-09 07:34:53'),
(42, 68, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:36:35', '2026-11-09 07:36:35'),
(43, 69, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:36:39', '2026-11-09 07:36:39'),
(44, 70, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:36:45', '2026-11-09 07:36:45'),
(45, 71, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:36:57', '2026-11-09 07:36:57'),
(46, 72, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:02', '2026-11-09 07:37:02'),
(47, 73, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:07', '2026-11-09 07:37:07'),
(48, 74, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:19', '2026-11-09 07:37:19'),
(49, 75, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:24', '2026-11-09 07:37:24'),
(50, 76, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:33', '2026-11-09 07:37:33'),
(51, 77, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:37', '2026-11-09 07:37:37'),
(52, 78, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:46', '2026-11-09 07:37:46'),
(53, 79, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:50', '2026-11-09 07:37:50'),
(54, 80, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:37:55', '2026-11-09 07:37:55'),
(55, 81, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:38:00', '2026-11-09 07:38:00'),
(56, 82, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:38:05', '2026-11-09 07:38:05'),
(57, 83, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:38:10', '2026-11-09 07:38:10'),
(58, 84, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:38:15', '2026-11-09 07:38:15'),
(59, 85, 7, 13, '0000-00-00', '0000-00-00', 0, '2026-11-09 07:38:20', '2026-11-09 07:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran`
--

CREATE TABLE `t_pelanggaran` (
  `id` int(11) NOT NULL,
  `pelanggaran_kategori_id` int(11) DEFAULT NULL,
  `kode` varchar(30) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `poin` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_pelanggaran`
--

INSERT INTO `t_pelanggaran` (`id`, `pelanggaran_kategori_id`, `kode`, `nama`, `poin`, `deskripsi`, `status_aktif`, `created_at`, `updated_at`) VALUES
(56, 51, 'SIK001', 'Terlambat masuk sekolah tanpa alasan sah', 5, 'Datang terlambat melebihi waktu yang ditentukan tanpa keterangan tertulis dari orang tua/wali', 1, '2026-11-11 02:33:52', '2026-11-11 02:33:52'),
(57, 51, 'SIK002', 'Meninggalkan kelas saat jam pelajaran berlangsung', 7, 'Keluar dari ruang kelas tanpa izin dari guru yang mengajar', 1, '2026-11-11 02:33:52', '2026-11-11 02:33:52'),
(58, 51, 'SIK003', 'Tidak sopan kepada guru, karyawan, atau warga sekolah', 10, 'Berkata atau bersikap tidak hormat kepada warga sekolah', 1, '2026-11-11 02:33:52', '2026-11-11 02:33:52'),
(59, 51, 'SIK004', 'Berbicara kasar atau mengeluarkan kata-kata tidak pantas', 8, 'Menggunakan bahasa yang tidak sopan/mengandung unsur kasar di lingkungan sekolah', 1, '2026-11-11 02:33:52', '2026-11-11 02:33:52'),
(60, 51, 'SIK005', 'Melawan perintah guru atau petugas sekolah', 12, 'Menolak/melaksanakan perintah yang diberikan oleh guru atau petugas sekolah', 1, '2026-11-11 02:33:52', '2026-11-11 02:33:52'),
(61, 52, 'PKN001', 'Tidak memakai seragam sekolah sesuai hari', 5, 'Memakai seragam yang tidak sesuai dengan jadwal yang ditentukan sekolah', 1, '2026-11-11 02:34:03', '2026-11-11 02:34:03'),
(62, 52, 'PKN002', 'Seragam tidak rapi atau tidak lengkap', 6, 'Seragam kusut, tidak dimasukkan, atau ada bagian yang tidak dipakai', 1, '2026-11-11 02:34:03', '2026-11-11 02:34:03'),
(63, 52, 'PKN003', 'Tidak memakai sepatu hitam sesuai aturan', 4, 'Memakai sepatu berwarna atau sepatu sandal saat jam sekolah', 1, '2026-11-11 02:34:03', '2026-11-11 02:34:03'),
(64, 52, 'PKN004', 'Memakai aksesoris berlebihan yang mengganggu konsentrasi', 5, 'Memakai perhiasan, jam tangan, atau aksesoris lain yang tidak sesuai aturan', 1, '2026-11-11 02:34:03', '2026-11-11 02:34:03'),
(65, 52, 'PKN005', 'Rambut tidak rapi atau memakai cat rambut', 8, 'Rambut gondrong, berwarna, atau tidak diatur sesuai aturan sekolah', 1, '2026-11-11 02:34:03', '2026-11-11 02:34:03'),
(66, 55, 'BER001', 'Berkelahi atau melakukan tindak kekerasan', 25, 'Melakukan perkelahian fisik atau mengajak berkelahi di lingkungan sekolah', 1, '2026-11-11 02:38:47', '2026-11-11 02:38:47'),
(67, 55, 'BER002', 'Merokok di lingkungan sekolah', 20, 'Merokok atau membawa rokok di area sekolah', 1, '2026-11-11 02:38:47', '2026-11-11 02:38:47'),
(68, 55, 'BER003', 'Mencuri atau merusak barang milik orang lain/sekolah', 30, 'Mengambil tanpa izin atau merusak fasilitas sekolah dan barang milik orang lain', 1, '2026-11-11 02:38:47', '2026-11-11 02:38:47'),
(69, 55, 'BER004', 'Membawa benda berbahaya ke sekolah', 35, 'Membawa senjata tajam, senjata api, atau bahan berbahaya lainnya', 1, '2026-11-11 02:38:47', '2026-11-11 02:38:47'),
(70, 55, 'BER005', 'Menyebarkan berita bohong/mencemarkan nama baik', 15, 'Menyebarkan informasi yang tidak benar dan merugikan orang lain', 1, '2026-11-11 02:38:47', '2026-11-11 02:38:47'),
(71, 54, 'KBR001', 'Membuang sampah tidak pada tempatnya', 4, 'Membuang sampah sembarangan di lingkungan sekolah', 1, '2026-11-11 02:38:57', '2026-11-11 02:38:57'),
(72, 54, 'KBR002', 'Mengotori dinding, meja, atau fasilitas sekolah', 7, 'Menulis, mencoret, atau mengotori fasilitas milik sekolah', 1, '2026-11-11 02:38:57', '2026-11-11 02:38:57'),
(73, 54, 'KBR003', 'Tidak melaksanakan piket kelas sesuai jadwal', 5, 'Tidak hadir saat jadwal piket kelas tanpa alasan', 1, '2026-11-11 02:38:57', '2026-11-11 02:38:57'),
(74, 54, 'KBR004', 'Merusak tanaman atau fasilitas taman sekolah', 6, 'Merusak tanaman atau fasilitas taman yang ada di sekolah', 1, '2026-11-11 02:38:57', '2026-11-11 02:38:57'),
(75, 54, 'KBR005', 'Meninggalkan sampah pribadi di kelas/ruang umum', 4, 'Meninggalkan barang atau sampah pribadi setelah selesai menggunakan ruangan', 1, '2026-11-11 02:38:57', '2026-11-11 02:38:57'),
(76, 53, 'DSP001', 'Tidak hadir tanpa keterangan (alfa)', 7, 'Tidak masuk sekolah tanpa surat keterangan dari orang tua/wali', 1, '2026-11-11 02:39:11', '2026-11-11 02:39:11'),
(77, 53, 'DSP002', 'Pulang sebelum jam sekolah berakhir tanpa izin', 6, 'Meninggalkan sekolah sebelum jam selesai tanpa izin dari guru/petugas', 1, '2026-11-11 02:39:11', '2026-11-11 02:39:11'),
(78, 53, 'DSP003', 'Izin keluar kelas berlebihan', 4, 'Sering keluar kelas saat jam pelajaran berlangsung tanpa alasan penting', 1, '2026-11-11 02:39:11', '2026-11-11 02:39:11'),
(79, 53, 'DSP004', 'Meninggalkan kegiatan sekolah tanpa izin', 8, 'Tidak mengikuti kegiatan sekolah seperti upacara, ekstrakurikuler, dll', 1, '2026-11-11 02:39:11', '2026-11-11 02:39:11'),
(80, 53, 'DSP005', 'Sering terlambat dalam jangka waktu tertentu', 10, 'Terlambat masuk sekolah berulang kali dalam satu minggu/bulan', 1, '2026-11-11 02:39:11', '2026-11-11 02:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran_kategori`
--

CREATE TABLE `t_pelanggaran_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jenis` varchar(100) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `poin` int(11) DEFAULT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_pelanggaran_kategori`
--

INSERT INTO `t_pelanggaran_kategori` (`id`, `nama`, `jenis`, `deskripsi`, `poin`, `status_aktif`, `created_at`, `updated_at`) VALUES
(51, 'SIKAP', NULL, '', 0, 1, '2026-11-11 01:57:45', '2026-11-11 02:00:48'),
(52, 'PAKAIAN', NULL, '', 0, 1, '2026-11-11 02:00:23', '2026-11-11 02:00:52'),
(53, 'KEDISIPLINAN & KEHADIRAN', NULL, '', NULL, 1, '2026-11-11 02:35:56', '2026-11-11 02:35:56'),
(54, 'KEBERSIHAN & LINGKUNGAN', NULL, '', NULL, 1, '2026-11-11 02:36:11', '2026-11-11 02:36:11'),
(55, 'PELANGGARAN BERAT & KESUSILAAN', NULL, '', NULL, 1, '2026-11-11 02:36:22', '2026-11-11 02:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `t_pelanggaran_siswa`
--

CREATE TABLE `t_pelanggaran_siswa` (
  `id` int(11) NOT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `pelanggaran_id` int(11) DEFAULT NULL,
  `nama_pelanggaran` varchar(150) NOT NULL,
  `pelanggaran_kategori_id` int(11) DEFAULT NULL,
  `guru_id` int(11) DEFAULT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text NOT NULL,
  `poin` int(11) NOT NULL,
  `tindakan` text NOT NULL,
  `pemberi_tindakan_id` int(11) DEFAULT NULL,
  `waktu_tindakan` datetime DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `updated-at` timestamp NOT NULL DEFAULT current_timestamp(),
  `tindakan_selesai` tinyint(1) DEFAULT 0 COMMENT '0=Belum ditindak, 1=Sudah selesai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_pelanggaran_siswa`
--

INSERT INTO `t_pelanggaran_siswa` (`id`, `tahun_ajaran_id`, `siswa_id`, `kategori_id`, `nama_siswa`, `kelas_id`, `nama_kelas`, `pelanggaran_id`, `nama_pelanggaran`, `pelanggaran_kategori_id`, `guru_id`, `nama_guru`, `tanggal`, `keterangan`, `poin`, `tindakan`, `pemberi_tindakan_id`, `waktu_tindakan`, `status`, `created_at`, `updated_at`, `updated-at`, `tindakan_selesai`) VALUES
(17, NULL, 53, 54, '', NULL, '', 71, '', NULL, 31, '', NULL, '', 4, 'Di kepret 3x', NULL, NULL, '', '2026-11-11 04:45:07', NULL, '2026-11-11 04:45:07', 0),
(18, NULL, 55, 54, '', NULL, '', 71, '', NULL, 31, '', NULL, '', 4, '', NULL, NULL, '', '2026-11-11 04:56:24', NULL, '2026-11-11 04:56:24', 0),
(19, NULL, 58, 52, '', NULL, '', 63, '', NULL, 31, '', NULL, '', 4, 'Push up', NULL, NULL, '', '2026-11-11 04:56:45', NULL, '2026-11-11 04:56:45', 1),
(20, NULL, 27, 53, '', NULL, '', 78, '', NULL, 31, '', NULL, '', 4, 'Bolos', NULL, NULL, '', '2026-11-11 04:57:30', NULL, '2026-11-11 04:57:30', 1),
(21, NULL, 77, 52, '', NULL, '', 62, '', NULL, 31, '', NULL, '', 6, 'Sabuk', NULL, NULL, '', '2026-11-11 05:00:27', NULL, '2026-11-11 05:00:27', 1),
(22, NULL, 74, 51, '', NULL, '', 58, '', NULL, 31, '', NULL, '', 10, 'Tidak sopan', NULL, NULL, '', '2026-11-11 05:09:51', NULL, '2026-11-11 05:09:51', 1),
(23, NULL, 85, 52, '', NULL, '', 62, '', NULL, 31, '', NULL, '', 6, 'Baju', NULL, NULL, '', '2026-11-11 05:10:25', NULL, '2026-11-11 05:10:25', 1),
(24, NULL, 28, 54, '', NULL, '', 71, '', NULL, 41, '', NULL, '', 4, 'Sampah', NULL, NULL, '', '2026-11-11 05:13:06', NULL, '2026-11-11 05:13:06', 1),
(25, NULL, 54, 55, '', NULL, '', 67, '', NULL, 31, '', NULL, '', 20, 'PANGGIL ORTU', 7, '2026-11-11 12:32:41', '', '2026-11-11 05:17:49', '2026-11-11 12:32:41', '2026-11-11 05:17:49', 1),
(26, NULL, 28, 55, '', NULL, '', 69, '', NULL, 41, '', NULL, '', 35, 'Pisua', NULL, NULL, '', '2026-11-11 05:38:36', NULL, '2026-11-11 05:38:36', 1),
(27, NULL, 54, 51, '', NULL, '', 59, '', NULL, 7, '', NULL, '', 8, 'Kasar', NULL, NULL, '', '2026-11-11 05:39:30', NULL, '2026-11-11 05:39:30', 1),
(28, NULL, 54, 54, '', NULL, '', 71, '', NULL, 7, '', NULL, '', 4, '', NULL, NULL, '', '2026-11-11 05:41:07', NULL, '2026-11-11 05:41:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_siswa`
--

CREATE TABLE `t_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(30) DEFAULT NULL,
  `nisn` varchar(20) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_siswa`
--

INSERT INTO `t_siswa` (`id`, `nis`, `nisn`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `status_aktif`, `created_at`, `updated_at`) VALUES
(27, '102410544', '', 'ADITTIA NUR LANTIP', 'L', '2008-01-15', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:56:25'),
(28, '102410545', '', 'AGNIA ROSYA NOERILLAH', 'P', '2008-02-20', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:57:31'),
(29, '102410546', '', 'ANISA AMIRULLA', 'P', '2008-03-05', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:57:38'),
(30, '102410547', '', 'ARADEA KANDI', 'L', '2008-04-12', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:57:50'),
(31, '102410548', '', 'ARFA DIESA OKMALELIZA', 'P', '2008-05-18', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:58:35'),
(32, '102410549', '', 'FITRI NUR SYIAMI', 'P', '2008-06-25', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:58:44'),
(33, '102410550', '', 'JUNITA PUTRI NUR RAHMAN', 'P', '2008-07-03', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:58:52'),
(34, '102410551', '', 'MOHAMMAD ATALARIK ALI SYAHBANA', 'L', '2008-08-09', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 00:59:02'),
(35, '102410552', '', 'MUHAMAD FAHRIL FAHRUROZI', 'L', '2008-09-14', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:01'),
(36, '102410750', '', 'MUHAMMAD ADNAN SYAEFUL ISLAMI', 'L', '2008-10-22', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:08'),
(37, '102410553', '', 'MUHAMMAD ZAHRU AQILA FIKRI', 'L', '2008-11-08', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:17'),
(38, '102410554', '', 'NADIA ZULFA SORAYA', 'P', '2008-12-30', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:24'),
(39, '102410555', '', 'NAZRIL ILHAM', 'L', '2008-01-28', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:32'),
(40, '102410556', '', 'PUSPITA DEWI', 'P', '2008-02-14', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:42'),
(41, '102410558', '', 'RAKHA MUHAMMAD HAYKAL', 'L', '2008-03-22', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:50'),
(42, '102410559', '', 'RANI MEILANI', 'P', '2008-04-30', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:08:58'),
(43, '102410560', '', 'REIHAN MUZAKI', 'L', '2008-05-10', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:06'),
(44, '102410561', '', 'RESA JULIANSAH', 'L', '2008-06-17', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:13'),
(45, '102410562', '', 'RIZKI PERMATA SUGIANTO', 'L', '2008-07-24', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:21'),
(46, '102410563', '', 'SAHIRA FIRAJ', 'P', '2008-08-05', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:30'),
(47, '102410564', '', 'SENDI MARDIAN', 'L', '2008-09-11', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:38'),
(48, '102410755', '', 'SHAHAIDAN NIZZAR', 'L', '2008-10-19', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:48'),
(49, '102410565', '', 'SHERLY SATRIANI', 'P', '2008-11-25', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:09:56'),
(50, '102410566', '', 'SOFI NURJANAH', 'P', '2008-12-08', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:10:38'),
(51, '102410567', '', 'SURAIYA SALSABILA AZZAHRA', 'P', '2008-02-02', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:10:14'),
(52, '102410568', '', 'TONI ANTONIO', 'L', '2008-03-14', 'Tasikmalaya', 1, '2026-11-05 00:25:52', '2026-11-05 01:10:22'),
(53, '102410301', '102410306', 'ADAM LASMANA NUGRAHA', 'L', '2008-03-15', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(54, '102410302', '102410308', 'AFEP SAEPUL HIDAYAH', 'L', '2008-07-22', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(55, '102410303', '102410309', 'AGIS PRATAMA', 'L', '2009-01-05', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(56, '102410304', '102410310', 'DAWAM ARIASA PUTRA', 'L', '2008-11-30', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(57, '102410305', '102410311', 'DIKA ADITYA', 'L', '2009-04-18', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(58, '102410306', '102410312', 'DIKI SAPUTRA', 'L', '2008-09-10', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(59, '102410307', '102410313', 'DIMAS ANUGRAH PRANATAMA', 'L', '2009-02-27', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(60, '102410308', '102410314', 'ERGI ZULVIAN RAZVI', 'L', '2008-06-08', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(61, '102410309', '102410315', 'EVAN RASENDRIYA', 'L', '2008-12-12', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(62, '102410310', '102410316', 'FAIZ FAUZAN ABDURAHMAN', 'L', '2009-05-03', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(63, '102410311', '102410317', 'FATIR RIZKY', 'L', '2008-08-19', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(64, '102410312', '102410318', 'GUNTUR MUHAMAD AZRIL', 'L', '2009-03-25', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(65, '102410313', '102410319', 'HIBAN SA\'BAN', 'L', '2008-10-07', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(66, '102410314', '102410320', 'HILMAN SOHIBUL KIYAM', 'L', '2009-06-14', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(67, '102410315', '10239766', 'IAD RAYI NURFAIS ANSORI', 'L', '2008-02-21', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(68, '102410316', '102410321', 'IQBAL MUHARROM', 'L', '2009-07-30', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(69, '102410317', '102410322', 'IZAZ SYAKIR', 'L', '2008-04-11', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(70, '102410318', '102410323', 'MOCH FAIZAL GILANG PERMANA', 'L', '2009-08-06', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(71, '102410319', '102410325', 'MUHAMAD RIZKY GOZALI', 'L', '2008-05-28', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(72, '102410320', '102410326', 'MUHAMMAD RIKMAN NULHAKIM', 'L', '2009-09-22', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(73, '102410321', '102410327', 'MUHAMMAD SIDDIQ IBRAHIM SOBARI', 'L', '2008-01-16', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(74, '102410322', '102410328', 'NIZAR SURYANA', 'L', '2009-10-09', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(75, '102410323', '102410330', 'RASYA ABDUL BASITH', 'L', '2008-07-03', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(76, '102410324', '102410331', 'RAUSAN VIKRI', 'L', '2009-11-17', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(77, '102410325', '102410332', 'REVALDI NURWANSYAH', 'L', '2008-03-29', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(78, '102410326', '102410333', 'REVAN RUDIANSYAH', 'L', '2009-02-02', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(79, '102410327', '102410334', 'RIZKI RADITYA', 'L', '2008-09-05', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(80, '102410328', '102410335', 'ROBY ORIE AL RASYA', 'L', '2009-05-11', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(81, '102410329', '102410336', 'RULY RUDIANSHAH', 'L', '2008-06-24', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(82, '102410330', '102410337', 'SYAHDAN RASDANI', 'L', '2009-04-07', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(83, '102410331', '102410338', 'TABA HAERUL SALIM', 'L', '2008-12-01', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(84, '102410332', '102410339', 'TIRTA NUR ZAMZAM', 'L', '2009-01-19', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(85, '102410333', '102410340', 'ZILHAD AYALTHUHAQ', 'L', '2008-10-13', 'Tasikmalaya', 1, '2026-11-09 07:30:35', '2026-11-09 07:30:35'),
(86, '1087001', '3201000001', 'Abdul Azis Ramadan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(87, '1087002', '3201000002', 'Ade Rifqi Nurhakim', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(88, '1087003', '3201000003', 'Ahmad Abdul Barri', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(89, '1087004', '3201000004', 'Albi Fariz', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(90, '1087005', '3201000005', 'Alfi Maulana Sholeh', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(91, '1087006', '3201000006', 'Alvaro Agustino Yahya', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(92, '1087007', '3201000007', 'Andra Gunawan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(93, '1087008', '3201000008', 'Arjun Julian', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(94, '1087009', '3201000009', 'Bari Muharom', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(95, '1087010', '3201000010', 'Dapi Paturahman', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(96, '1087011', '3201000011', 'Fahmi Akbar Permana', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(97, '1087012', '3201000012', 'Firman Ramadhan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(98, '1087013', '3201000013', 'Hikmal Arizal Sofyan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(99, '1087014', '3201000014', 'Lutfi Muhammad Fauzi', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(100, '1087015', '3201000015', 'Michael Tri Geni Isyanto', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(101, '1087016', '3201000016', 'Mohamad Azril Maulana', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(102, '1087017', '3201000017', 'Muhammad Akbar Heri Hendriyani', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(103, '1087018', '3201000018', 'Muhammad Atep Maulana', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(104, '1087019', '3201000019', 'Muhammad Shifan Afzal Fajarudin', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(105, '1087020', '3201000020', 'Muhammad Lutfi Fawwaz Rizaldi', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(106, '1087021', '3201000021', 'Muhammad Rafi Zaelani', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(107, '1087022', '3201000022', 'Pahrul Azmi', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(108, '1087023', '3201000023', 'Pahrul Fikri Ansori', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(109, '1087024', '3201000024', 'Rajip Setiawan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(110, '1087025', '3201000025', 'Rayhan Firdaus', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(111, '1087026', '3201000026', 'Reviansyah', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(112, '1087027', '3201000027', 'Ripki Permana', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(113, '1087028', '3201000028', 'Rizky Darajat', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(114, '1087029', '3201000029', 'Sakthi Fradja Naian', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57'),
(115, '1087030', '3201000030', 'Ziyad Afkar Ramadhan', '', '0000-00-00', '', 1, '2026-11-10 03:04:57', '2026-11-10 03:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `t_tahun_ajaran`
--

CREATE TABLE `t_tahun_ajaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_tahun_ajaran`
--

INSERT INTO `t_tahun_ajaran` (`id`, `nama`, `tanggal_mulai`, `tanggal_selesai`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, '2020/2021', '2020-07-01', '2021-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(2, '2021/2022', '2021-07-01', '2022-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(3, '2022/2023', '2022-07-01', '2023-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(4, '2023/2024', '2023-07-01', '2024-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(5, '2024/2025', '2024-07-01', '2025-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(6, '2025/2026', '2025-07-01', '2026-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(7, '2026/2027', '2026-07-01', '2027-06-30', 1, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(8, '2027/2028', '2027-07-01', '2028-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(9, '2028/2029', '2028-07-01', '2029-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(10, '2029/2030', '2029-07-01', '2030-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(11, '2030/2031', '2030-07-01', '2031-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(12, '2031/2032', '2031-07-01', '2032-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(13, '2032/2033', '2032-07-01', '2033-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(14, '2033/2034', '2033-07-01', '2034-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(15, '2034/2035', '2034-07-01', '2035-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(16, '2035/2036', '2035-07-01', '2036-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(17, '2036/2037', '2036-07-01', '2037-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(18, '2037/2038', '2037-07-01', '2038-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(19, '2038/2039', '2038-07-01', '2039-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(20, '2039/2040', '2039-07-01', '2040-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(21, '2040/2041', '2040-07-01', '2041-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(22, '2041/2042', '2041-07-01', '2042-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(23, '2042/2043', '2042-07-01', '2043-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(24, '2043/2044', '2043-07-01', '2044-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(25, '2044/2045', '2044-07-01', '2045-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(26, '2045/2046', '2045-07-01', '2046-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(27, '2046/2047', '2046-07-01', '2047-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(28, '2047/2048', '2047-07-01', '2048-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(29, '2048/2049', '2048-07-01', '2049-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(30, '2049/2050', '2049-07-01', '2050-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(31, '2050/2051', '2050-07-01', '2051-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(32, '2051/2052', '2051-07-01', '2052-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(33, '2052/2053', '2052-07-01', '2053-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(34, '2053/2054', '2053-07-01', '2054-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(35, '2054/2055', '2054-07-01', '2055-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(36, '2055/2056', '2055-07-01', '2056-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(37, '2056/2057', '2056-07-01', '2057-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(38, '2057/2058', '2057-07-01', '2058-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(39, '2058/2059', '2058-07-01', '2059-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(40, '2059/2060', '2059-07-01', '2060-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(41, '2060/2061', '2060-07-01', '2061-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(42, '2061/2062', '2061-07-01', '2062-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(43, '2062/2063', '2062-07-01', '2063-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(44, '2063/2064', '2063-07-01', '2064-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(45, '2064/2065', '2064-07-01', '2065-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(46, '2065/2066', '2065-07-01', '2066-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(47, '2066/2067', '2066-07-01', '2067-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(48, '2067/2068', '2067-07-01', '2068-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(49, '2068/2069', '2068-07-01', '2069-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32'),
(50, '2069/2070', '2069-07-01', '2070-06-30', 0, '2026-09-23 02:24:09', '2026-11-11 02:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'administrator1', 'admin01@sekolah.test', '2026-09-23 02:23:41', 'admin123', '', 'admin', '2026-09-23 02:23:41', '2026-09-23 02:23:41'),
(2, 'administrator2', 'admin02@sekolah.test', '2026-09-23 02:23:41', 'admin123', '', 'admin', '2026-09-23 02:23:41', '2026-09-23 02:23:41'),
(3, 'Ai Nuryaidah, S.Pd', 'ainuryaidah@gmail.com', '2026-11-05 00:47:05', 'ai', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(4, 'Maya Permata Endah, S.Pd', 'mayapermataendah@gmail.com', '2026-11-05 00:47:05', 'maya', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(5, 'Dody Jaenudin, S.Pd.', 'dodyjaenudin@gmail.com', '2026-11-05 00:47:05', 'dody', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(6, 'Dedi Kardiman, S.Pd', 'dedikardiman@gmail.com', '2026-11-05 00:47:05', 'dedi', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(7, 'Uca Musa Yusenda, S.Pd', 'ucamusayusenda@gmail.com', '2026-11-05 00:47:05', 'uca', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(8, 'Drs. Ahmad Nur Mukhlis', 'ahmadnurmukhlis@gmail.com', '2026-11-05 00:47:05', 'ahmad', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(9, 'Drs. Heri', 'heri@gmail.com', '2026-11-05 00:47:05', 'heri', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(10, 'Asep Bastaman', 'asepbastaman@gmail.com', '2026-11-05 00:47:05', 'asep', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(11, 'H. Encep Maemun, S.T.,M.Pd', 'encepmaemun@gmail.com', '2026-11-05 00:47:05', 'encep', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(12, 'Opik', 'opik@gmail.com', '2026-11-05 00:47:05', 'opik', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(13, 'Ida Farida, S.Pd', 'idafarida@gmail.com', '2026-11-05 00:47:05', 'ida', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(14, 'Idah Mahmudah, S.Pd', 'idahmahmudah@gmail.com', '2026-11-05 00:47:05', 'idah', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(15, 'Drs. Muhamad Ali', 'muhamadali@gmail.com', '2026-11-05 00:47:05', 'muhamad', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(16, 'Helmi Ali Akbar, S.Pd.I', 'helmialiakbar@gmail.com', '2026-11-05 00:47:05', 'helmi', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(17, 'Syeni Suswarini, S.Pd', 'syenisuswarini@gmail.com', '2026-11-05 00:47:05', 'syeni', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(18, 'Wiwid Yulianti, S.Pd', 'wiwidyulianti@gmail.com', '2026-11-05 00:47:05', 'wiwid', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(19, 'Ansor Muhajir, S.T', 'ansormuhajir@gmail.com', '2026-11-05 00:47:05', 'ansor', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(20, 'Ogi Gaosun Gias, S.Pd.I', 'ogigaosungias@gmail.com', '2026-11-05 00:47:05', 'ogi', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(21, 'Sandi Mulyana, S.Pd', 'sandimulyana@gmail.com', '2026-11-05 00:47:05', 'sandi', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(22, 'Erna Suryani, S.Pd', 'ernasuryani@gmail.com', '2026-11-05 00:47:05', 'erna', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(23, 'Ai Wahidah, S.Ag', 'aiwahidah@gmail.com', '2026-11-05 00:47:05', 'aiwahidah', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(24, 'Chandra Aditya Yusup, S.Pd', 'chandraadityayusup@gmail.com', '2026-11-05 00:47:05', 'chandra', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(25, 'Arif Kusmawan, S.Pd', 'arifkusmawan@gmail.com', '2026-11-05 00:47:05', 'arif', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(26, 'Asep Taufiq Hidayat, S.Kom', 'aseptaufiqhidayat@gmail.com', '2026-11-05 00:47:05', 'aseptaufiq', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(27, 'Rendy Ichsan Kusumah, S.T', 'rendyichsankusumah@gmail.com', '2026-11-05 00:47:05', 'rendy', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(28, 'Feri Rahmawan, S.Pd', 'ferirahmawan@gmail.com', '2026-11-05 00:47:05', 'feri', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(29, 'Ari Sandriana, S.Kom', 'arisandriana@gmail.com', '2026-11-05 00:47:05', 'ari', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(30, 'Yaneu Nurdian, S.Pd', 'yaneunurdian@gmail.com', '2026-11-05 00:47:05', 'yaneu', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(31, 'Ucu Muhammad Khoer N, S.Pd', 'ucumuhammadkhoern@gmail.com', '2026-11-05 00:47:05', 'ucu', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(32, 'Mira Dwi Rahmawati, S.Ag', 'miradwirahmawati@gmail.com', '2026-11-05 00:47:05', 'mira', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(33, 'Aldi Maulana, S.Pd', 'aldimaulana@gmail.com', '2026-11-05 00:47:05', 'aldi', '', 'wali_kelas', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(34, 'Eli Rosliah, S.Pd', 'elirosliah@gmail.com', '2026-11-05 00:47:05', 'eli', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(35, 'Isni Nur Fitriani, S.Pd', 'isninurfitriani@gmail.com', '2026-11-05 00:47:05', 'isni', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(36, 'Aanisah Putri Nur Aini, S.Pd', 'aanisahputrinuraini@gmail.com', '2026-11-05 00:47:05', 'aanisah', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(37, 'Yusi Luthfiani, S.Sos.I', 'yusiluthfiani@gmail.com', '2026-11-05 00:47:05', 'yusi', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(38, 'Lilis Rustandy Mawardi, S.Pd., M.Pd', 'lilisrustandymawardi@gmail.com', '2026-11-05 00:47:05', 'lilis', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(39, 'Yusrin Noer Sabrina, S.Pd', 'yusrinnoersabrina@gmail.com', '2026-11-05 00:47:05', 'yusrin', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(40, 'Senny Indayani, S.Pd', 'sennyindayani@gmail.com', '2026-11-05 00:47:05', 'senny', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(41, 'Ilma Amalia, S.Pd', 'ilmaamalia@gmail.com', '2026-11-05 00:47:05', 'ilma', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(42, 'Alvira Sofwatunnisa, S.Pd', 'alvirafwatunnisa@gmail.com', '2026-11-05 00:47:05', 'alvira', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(43, 'Risna Andriyani, S.Pd', 'risnaandriyani@gmail.com', '2026-11-05 00:47:05', 'risna', '', 'wali_kelas', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(44, 'Dra. Tintin Noerhayati', 'tintinnoerhayati@gmail.com', '2026-11-05 00:47:05', 'tintin', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(45, 'Rizkia Fahira, S.Pd', 'rizkiafahira@gmail.com', '2026-11-05 00:47:05', 'rizkia', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(46, 'Frasetio', 'frasetio@gmail.com', '2026-11-05 00:47:05', 'frasetio', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(47, 'Ratnaningsih Hatil Aeni, S.Pd.', 'ratnaningsihhatilaeni@gmail.com', '2026-11-05 00:47:05', 'ratnaningsih', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(48, 'Dheny Darajatul Hasani, S.Pd.', 'dhenydarajatulhasani@gmail.com', '2026-11-05 00:47:05', 'dheny', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(49, 'Fahrullah, S.Pd', 'fahrullah@gmail.com', '2026-11-05 00:47:05', 'fahrullah', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(50, 'Aan Andriana, S.T', 'aanandriana@gmail.com', '2026-11-05 00:47:05', 'aan', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(51, 'Fitri Fauziah, S.Pd', 'fitrifauziah@gmail.com', '2026-11-05 00:47:05', 'fitri', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(52, 'Nida Aulia, S.Pd', 'nidaaulia@gmail.com', '2026-11-05 00:47:05', 'nida', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(53, 'Sri Nurrizki Putri Krisnadi, S.Pd', 'srinurrizkiputrikrisnadi@gmail.com', '2026-11-05 00:47:05', 'sri', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(54, 'Riesy Putri Navia, S.Kom', 'riesyputrinavia@gmail.com', '2026-11-05 00:47:05', 'riesy', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(55, 'Rurry Febriani Maryadi, S.Pd', 'rurryfebrianimaryadi@gmail.com', '2026-11-05 00:47:05', 'rurry', '', 'guru', '2026-11-05 00:47:05', '2026-11-05 00:47:05'),
(56, 'Irvan Rizal, S.Pd', 'irvanrizal@gmail.com', '2026-11-05 00:47:05', 'irvan', '', 'wali_kelas', '2026-11-05 00:47:05', '2026-11-05 00:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_wali_kelas`
--

CREATE TABLE `t_wali_kelas` (
  `id` int(11) NOT NULL,
  `tahun_ajaran_id` int(11) DEFAULT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `guru_id` int(11) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `status_aktif` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_wali_kelas`
--

INSERT INTO `t_wali_kelas` (`id`, `tahun_ajaran_id`, `kelas_id`, `guru_id`, `tanggal_mulai`, `tanggal_selesai`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 7, 6, 31, '2026-07-01', '2027-06-30', 1, '2026-11-05 01:25:44', '2026-11-05 01:25:44'),
(2, 7, 13, 41, '2026-07-01', '2027-06-30', 1, '2026-11-09 07:33:19', '2026-11-09 07:33:19'),
(3, 7, 14, 54, '2026-07-01', '2027-06-30', 1, '2026-11-10 03:07:20', '2026-11-10 03:07:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_guru`
--
ALTER TABLE `t_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_kelas`
--
ALTER TABLE `t_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggaran_kategori_id` (`pelanggaran_kategori_id`);

--
-- Indexes for table `t_pelanggaran_kategori`
--
ALTER TABLE `t_pelanggaran_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`,`siswa_id`,`kelas_id`,`pelanggaran_id`,`pelanggaran_kategori_id`,`guru_id`),
  ADD KEY `guru_id` (`guru_id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `pelanggaran_kategori_id` (`pelanggaran_kategori_id`),
  ADD KEY `pelanggaran_id` (`pelanggaran_id`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `t_siswa`
--
ALTER TABLE `t_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tahun_ajaran`
--
ALTER TABLE `t_tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_guru` (`guru_id`),
  ADD KEY `tahun_ajaran_id` (`tahun_ajaran_id`,`kelas_id`,`guru_id`),
  ADD KEY `guru_id` (`guru_id`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_guru`
--
ALTER TABLE `t_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `t_kelas`
--
ALTER TABLE `t_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `t_pelanggaran_kategori`
--
ALTER TABLE `t_pelanggaran_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `t_siswa`
--
ALTER TABLE `t_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `t_tahun_ajaran`
--
ALTER TABLE `t_tahun_ajaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_guru`
--
ALTER TABLE `t_guru`
  ADD CONSTRAINT `fk_guru_user` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD CONSTRAINT `t_kelas_siswa_ibfk_1` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kelas_siswa_ibfk_2` FOREIGN KEY (`siswa_id`) REFERENCES `t_siswa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kelas_siswa_ibfk_3` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_pelanggaran`
--
ALTER TABLE `t_pelanggaran`
  ADD CONSTRAINT `t_pelanggaran_ibfk_1` FOREIGN KEY (`pelanggaran_kategori_id`) REFERENCES `t_pelanggaran_kategori` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_pelanggaran_siswa`
--
ALTER TABLE `t_pelanggaran_siswa`
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_1` FOREIGN KEY (`guru_id`) REFERENCES `t_guru` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_2` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_3` FOREIGN KEY (`siswa_id`) REFERENCES `t_siswa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_4` FOREIGN KEY (`pelanggaran_kategori_id`) REFERENCES `t_pelanggaran_kategori` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_5` FOREIGN KEY (`pelanggaran_id`) REFERENCES `t_pelanggaran` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pelanggaran_siswa_ibfk_6` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_wali_kelas`
--
ALTER TABLE `t_wali_kelas`
  ADD CONSTRAINT `t_wali_kelas_ibfk_2` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `t_tahun_ajaran` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_wali_kelas_ibfk_3` FOREIGN KEY (`guru_id`) REFERENCES `t_guru` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_wali_kelas_ibfk_4` FOREIGN KEY (`kelas_id`) REFERENCES `t_kelas` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
