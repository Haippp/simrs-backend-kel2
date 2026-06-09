-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk simrs_kel2
CREATE DATABASE IF NOT EXISTS `simrs_kel2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simrs_kel2`;

-- membuang struktur untuk table simrs_kel2.asesmen
CREATE TABLE IF NOT EXISTS `asesmen` (
  `id_asesmen` int NOT NULL AUTO_INCREMENT,
  `id_perawat` int NOT NULL,
  `id_antrian` int DEFAULT NULL,
  `id_pasien` int DEFAULT NULL,
  `keluhan_utama` text,
  `alergi` varchar(50) DEFAULT NULL,
  `tensi` varchar(30) DEFAULT NULL,
  `suhu` decimal(4,1) DEFAULT NULL,
  `tinggi_badan` int DEFAULT NULL,
  `berat_badan` int DEFAULT NULL,
  `nadi` int DEFAULT NULL,
  `respirasi` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_asesmen`),
  KEY `fk_mengisi` (`id_perawat`),
  CONSTRAINT `fk_mengisi` FOREIGN KEY (`id_perawat`) REFERENCES `perawat` (`id_perawat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.asesmen: ~4 rows (lebih kurang)
INSERT INTO `asesmen` (`id_asesmen`, `id_perawat`, `id_antrian`, `id_pasien`, `keluhan_utama`, `alergi`, `tensi`, `suhu`, `tinggi_badan`, `berat_badan`, `nadi`, `respirasi`, `created_at`, `updated_at`) VALUES
	(10, 1, 1024, 88, 'Pusing dan mual sejak pagi hari ini.', NULL, '120/80', 36.5, 170, 65, 80, 18, '2026-06-07 02:27:53', '2026-06-07 02:27:53'),
	(11, 1, 1024, 88, 'Demam tinggi sudah 3 hari, disertai batuk berdahak.', NULL, '110/70', 38.5, 160, 55, 95, 22, '2026-06-07 02:38:17', '2026-06-07 02:38:17'),
	(12, 1, 1024, 88, 'Demam tinggi sudah 3 hari, disertai batuk berdahak.', NULL, '110/70', 38.5, 160, 55, 95, 22, '2026-06-07 02:39:59', '2026-06-07 02:39:59'),
	(13, 1, 1024, 88, 'Demam tinggi sudah 3 hari, disertai batuk berdahak.', 'Seafood', '110/70', 38.5, 160, 55, 95, 22, '2026-06-07 02:44:34', '2026-06-07 02:44:34');

-- membuang struktur untuk table simrs_kel2.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.cache: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.cache_locks: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.detail_e_resep
CREATE TABLE IF NOT EXISTS `detail_e_resep` (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_resep` int NOT NULL,
  `id_obat` int NOT NULL,
  `dosis` varchar(50) DEFAULT NULL,
  `aturan_pakai` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `fk_berisi` (`id_resep`),
  CONSTRAINT `fk_berisi` FOREIGN KEY (`id_resep`) REFERENCES `e_resep` (`id_resep`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.detail_e_resep: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.detail_tindakan_rm
CREATE TABLE IF NOT EXISTS `detail_tindakan_rm` (
  `id_detail_tindakan` int NOT NULL AUTO_INCREMENT,
  `id_rm` int NOT NULL,
  `id_layanan` int NOT NULL,
  `jumlah` int DEFAULT '1',
  `catatan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail_tindakan`),
  KEY `fk_meliputi_tindakan` (`id_rm`),
  CONSTRAINT `fk_meliputi_tindakan` FOREIGN KEY (`id_rm`) REFERENCES `rekam_medik` (`id_rm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.detail_tindakan_rm: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `id_dokter` int NOT NULL AUTO_INCREMENT,
  `id_unit` int unsigned DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `nama_dokter` varchar(50) DEFAULT NULL,
  `biaya_layanan` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.dokter: ~4 rows (lebih kurang)
INSERT INTO `dokter` (`id_dokter`, `id_unit`, `id_user`, `nama_dokter`, `biaya_layanan`) VALUES
	(1, 1, 14, 'dr. Budi Setiawan, Sp.M', 85000.00),
	(2, 2, 15, 'drg. Citra Lestari', 95000.00),
	(3, 3, 16, 'dr. Ahmad Hidayat, Sp.PD', 100000.00),
	(4, 4, 17, 'dr. Sinta Wijaya, Sp.JP', 155000.00);

-- membuang struktur untuk table simrs_kel2.e_resep
CREATE TABLE IF NOT EXISTS `e_resep` (
  `id_resep` int NOT NULL AUTO_INCREMENT,
  `id_rm` int NOT NULL,
  `id_dokter` int NOT NULL,
  `id_antrian` int DEFAULT NULL,
  `id_pasien` int DEFAULT NULL,
  `catatan_tambahan` text,
  `status_resep` varchar(30) DEFAULT 'diterbitkan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_resep`),
  KEY `fk_membuat` (`id_dokter`),
  KEY `fk_meresepkan` (`id_rm`),
  CONSTRAINT `fk_membuat` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_meresepkan` FOREIGN KEY (`id_rm`) REFERENCES `rekam_medik` (`id_rm`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.e_resep: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.failed_jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.jobs: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.job_batches: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.migrations: ~4 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_04_25_105408_create_personal_access_tokens_table', 1);

-- membuang struktur untuk table simrs_kel2.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.password_reset_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.perawat
CREATE TABLE IF NOT EXISTS `perawat` (
  `id_perawat` int NOT NULL AUTO_INCREMENT,
  `id_unit` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `nama_perawat` varchar(30) DEFAULT NULL,
  `biaya_layanan` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id_perawat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.perawat: ~4 rows (lebih kurang)
INSERT INTO `perawat` (`id_perawat`, `id_unit`, `id_user`, `nama_perawat`, `biaya_layanan`) VALUES
	(1, 1, 10, 'Ns. Via', 50000.00),
	(2, 2, 11, 'Ns. Mijie', 50000.00),
	(3, 3, 12, 'Ns. Janny', 50000.00),
	(4, 4, 13, 'Ns. Geyen Purnama', 50000.00);

-- membuang struktur untuk table simrs_kel2.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.personal_access_tokens: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.rekam_medik
CREATE TABLE IF NOT EXISTS `rekam_medik` (
  `id_rm` int NOT NULL AUTO_INCREMENT,
  `id_dokter` int NOT NULL,
  `id_asesmen` int NOT NULL,
  `id_antrian` int DEFAULT NULL,
  `id_pasien` int DEFAULT NULL,
  `diagnosa` text,
  `kode_icd` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_rm`),
  KEY `fk_mendiagnosa` (`id_dokter`),
  KEY `fk_berdasarkan_asesmen` (`id_asesmen`),
  CONSTRAINT `fk_berdasarkan_asesmen` FOREIGN KEY (`id_asesmen`) REFERENCES `asesmen` (`id_asesmen`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mendiagnosa` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel simrs_kel2.rekam_medik: ~0 rows (lebih kurang)

-- membuang struktur untuk table simrs_kel2.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.sessions: ~9 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('2t2lCzf5nhkAfDgv8gwP4lw3roBGi2pdLEw39F2N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'eyJfdG9rZW4iOiJoOXU3SnpvRGNjbERZdGtWdVg4ekQ1OGhzU1JCSGhDa3FIYkFRT2wxIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kb2NzXC9hcGkiLCJyb3V0ZSI6InNjcmFtYmxlLmRvY3MudWkifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1779441030),
	('EdBuMKEVYMavGt8pFv4Z1Xiep7iiKDByvqP2ed2Q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'eyJfdG9rZW4iOiJrdm1WSEw0MUxjbG9IUHBiVUttUldNQVp4aFdvWVRZTmI3RDZzTW13IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1778779601),
	('ewwU7DTxBDk13SWjpnf2x5aDBhJFSA1teQ1TirIy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'eyJfdG9rZW4iOiJGbDh2eEdmMENyVEdoWFVDRVZWY2VneFU1T2ZSb1VrWndvbnlDYzZJIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1779156760),
	('f76hBnddrBPzgNLrxIjfkcRg38QnK2qoA01pLlBC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'eyJfdG9rZW4iOiI4eGNNenNlek9ZcUJPd3BQSDNSWDVtNjd2SDNJV0FsZ3Zhc3VtNFZuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1778779587),
	('FMQhCbNkN51lmH1qu5jugKz1b0NEwy43f3lhKw6S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'eyJfdG9rZW4iOiI5UWZ1NE5KRnpnVDd1b0lQVmk4RkYyRENYc0tTUm5kcHdabEh3YkJKIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kb2NzXC9hcGkiLCJyb3V0ZSI6InNjcmFtYmxlLmRvY3MudWkifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1779441029),
	('GX7jfb5Cn0ssmViq89DEXsSqYg3bXVYhswhZAHIz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'eyJfdG9rZW4iOiJCODlpS211THpGMk5jaUJlQ2FnZ3JQb1RZQWFhaEpvMmMwME1lQk05IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1779268515),
	('ho9mzBHZslw4LBBPhZt3o1rOIpNtTUj6amHO7qXN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.120.0 Chrome/142.0.7444.265 Electron/39.8.8 Safari/537.36', 'eyJfdG9rZW4iOiI5Y1RjeFVYbm84ZWlkTVYyOFlEWjFTS1FGVmhsZTJyejNmYmlkM1pIIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1778777287),
	('ilnr8O9KQBes5OTwrS5KC2leH1cubnhNEoj5zeoR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'eyJfdG9rZW4iOiJSMFZ3eDNITjVaeXJqSVpCUHdmZ0daMm5GT01xRGdzSTN5YzZISzgxIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1779251053),
	('YVcvCpzrKRW77EYHuBLPOYBXo2yPRYMi02vSFbbX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJwMklmalpOa0h0YThscnUyYmxxekI0clJMOWlCZXNhV2xSM1VqMDV4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kb2NzXC9hcGkiLCJyb3V0ZSI6InNjcmFtYmxlLmRvY3MudWkifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1779269484);

-- membuang struktur untuk table simrs_kel2.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel simrs_kel2.users: ~0 rows (lebih kurang)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
