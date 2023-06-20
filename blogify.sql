-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 09:29 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogify`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'HTML', 'html', NULL, NULL),
(2, 'JavaScript', 'javascript', NULL, NULL),
(3, 'CSS', 'css', NULL, NULL),
(4, 'php', 'php', NULL, NULL),
(5, 'jQuery', 'jquery', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 6, NULL, NULL),
(1, 9, NULL, NULL),
(2, 2, NULL, NULL),
(2, 10, NULL, NULL),
(2, 21, NULL, NULL),
(3, 3, NULL, NULL),
(3, 19, NULL, NULL),
(3, 20, NULL, NULL),
(4, 4, NULL, NULL),
(4, 8, NULL, NULL),
(5, 2, NULL, NULL),
(5, 5, NULL, NULL),
(5, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2014_10_12_000000_create_users_table', 1),
(12, '2014_10_12_100000_create_password_resets_table', 1),
(13, '2019_08_19_000000_create_failed_jobs_table', 1),
(14, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2022_03_30_002206_create_posts_table', 1),
(16, '2022_04_08_232935_create_permissions_table', 1),
(17, '2022_04_08_233120_create_roles_table', 1),
(18, '2022_04_08_233236_create_users_permission_table', 1),
(19, '2022_04_08_233354_create_users_role_table', 1),
(20, '2022_04_08_233533_create_roles_permission_table', 1),
(21, '2022_04_15_234243_create_categories_table', 2),
(22, '2022_04_15_234648_create_category_post_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Show Dashboard', 'show-dashboard', NULL, NULL),
(2, 'Edit Post', 'edit-post', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `post_image`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'Et animi perspiciatis qui quis exercitationem.', 'https://via.placeholder.com/900x300.png/00bb11?text=aspernatur', 'Itaque numquam sit ut repudiandae similique. Delectus et in minus ex amet qui. Eveniet ipsum earum nemo provident labore eaque. Maxime et quibusdam odit quidem maxime sequi.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(2, 1, 'Atque ducimus laboriosam eum consequatur libero fugiat.', 'https://via.placeholder.com/900x300.png/00ddaa?text=aut', 'Ut iusto dolor vitae excepturi odit. Quidem quia quam ipsam aperiam sunt. Dolor qui occaecati ut excepturi ipsam. Quia ullam nostrum id.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(3, 4, 'Quia eveniet voluptatem in non facilis ex.', 'https://via.placeholder.com/900x300.png/0011aa?text=nam', 'Molestiae voluptatem facilis consequatur velit eligendi ut. Ducimus ut voluptate nam ut laboriosam.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(4, 1, 'Ad nam aspernatur error ut ipsa unde perferendis et.', 'https://via.placeholder.com/900x300.png/0000dd?text=ipsum', 'Quasi id velit corrupti nobis. Ad cum et ratione recusandae fugiat praesentium. Ipsam et pariatur facere aspernatur. Voluptas quas consequatur perferendis optio voluptates.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(5, 6, 'Sit autem aut mollitia et ut.', 'https://via.placeholder.com/900x300.png/007788?text=quas', 'Est quia vitae vitae dolores et vitae dolor. Et dolores vel debitis molestias et sit accusamus.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(6, 1, 'Quibusdam dolorem et aut fuga eligendi.', 'https://via.placeholder.com/900x300.png/005599?text=corrupti', 'Earum aut nesciunt voluptatem dolorem. Atque aut culpa quaerat dolorem rerum. Recusandae nihil eum possimus dolorum ipsam consequatur. Molestiae et consequatur repellendus optio vero adipisci.', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(7, 1, 'Pariatur quis qui aut et.', 'https://via.placeholder.com/900x300.png/0088aa?text=qui', 'Hic rerum qui aut deserunt hic enim molestias quaerat. In porro distinctio iste error quisquam ipsum quia. Saepe minus iste ut laboriosam in quia possimus velit. Minima porro atque eius qui rerum beatae.', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(8, 9, 'Qui omnis tenetur amet molestiae dolorem ab.', 'https://via.placeholder.com/900x300.png/00eecc?text=inventore', 'Praesentium occaecati magnam placeat. Distinctio et odit maxime nostrum.', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(9, 10, 'Veniam ratione perspiciatis accusamus vero eos.', 'https://via.placeholder.com/900x300.png/00bb88?text=id', 'Quos corrupti cum doloremque nihil. Itaque illum dolores est repudiandae laudantium voluptatem. Dolores sit est qui cupiditate doloribus vel.', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(10, 1, 'Facere tempora quos dolorum et eaque et praesentium illo.', 'https://via.placeholder.com/900x300.png/00ccaa?text=aut', 'Itaque quasi et quasi vel enim in magnam eaque. Voluptatem quibusdam voluptatum ut eaque ipsa. Sapiente ut est tempore velit quasi vitae. A harum occaecati distinctio tempora occaecati.', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(14, 1, 'aaaaaaaaaaaaaaaaaaaa', 'images/post/Nxy3BYzRONUm1W9S7k00d5CQ2xg0DhFNcQW2VAgw.jpg', 'aaaaaaaaaaaaaaaaaaaaa', '2022-04-15 19:13:44', '2022-04-15 19:14:03'),
(15, 1, 'asasas', 'images/post/KmxDvl7Sy2zkwzjz5XV8te7MCcLJTLRgvPqDmx53.jpg', 'asasasa', '2022-04-15 19:15:28', '2022-04-15 19:15:28'),
(19, 1, 'aaaaaaaaaaaaaaaa', NULL, 'aaaaaaaaaaaaaaaaaaaaa', '2022-04-15 19:22:33', '2022-04-15 19:22:33'),
(20, 1, 'zxczxczxcz', NULL, '<p><strong>czczx</strong></p>\r\n<p style=\"padding-left: 40px;\"><strong>cvcvbc</strong></p>', '2022-04-16 17:31:40', '2022-04-16 17:31:40'),
(21, 1, 'lsfahdj', 'images/post/are9mcmYoNli1W3YInUoVsdaCFUGM2mvnbJiyoT0.png', '<p>djfskfks</p>', '2022-06-14 12:15:47', '2022-06-14 12:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2022-04-14 17:24:29', '2022-04-14 17:24:29'),
(2, 'User', 'user', NULL, '2022-04-15 06:07:52'),
(3, 'Manager', 'manager', NULL, NULL),
(4, 'Author', 'author', NULL, NULL),
(14, 'Demo Role', 'demo-role', '2022-04-15 05:44:55', '2022-04-15 06:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 1, NULL, NULL),
(3, 5, NULL, NULL),
(4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'shakil19', 'Shakil Khan', 'khan.shakil.1414@gmail.com', 'images/user/nDAqKe4PEyOfC0AbjrBvhrbCRDQ8DDbs3sq5ouiO.jpg', NULL, '$2a$12$RxKXC/BysxZw/b4wwG1E7eA6llFrn9awMUDV9xdvDEbq66v.Lflde', NULL, '2022-04-09 15:48:33', '2022-04-09 17:36:36'),
(2, 'nmcglynn', 'Madelynn Pagac', 'yadira.schroeder@example.org', 'https://via.placeholder.com/900x300.png/0022ee?text=reiciendis', '2022-04-09 15:50:49', '$2y$10$v5AEKGQjtjsNdyrpoH.aUO1tWJ/l1qR.VlmeooKvpW984s1bksqwC', 'FTlJE82mzD', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(3, 'amira41', 'Prof. Abner Bogan', 'oma.strosin@example.net', 'https://via.placeholder.com/900x300.png/008800?text=quia', '2022-04-09 15:50:49', '$2y$10$y2OC3uCarVFv0q5AoRT6de/q8p9V9SXVWLAQe3rGYTUjl38z89BHG', '4vhXhIGSqO', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(4, 'amiya.moore', 'Lazaro Gottlieb III', 'kertzmann.robb@example.org', 'https://via.placeholder.com/900x300.png/00bbee?text=natus', '2022-04-09 15:50:49', '$2y$10$4aow45xUOO6mCm3xTZ6J.uKY.Pna3TXnL5kyJafoyj3RHehqrEusm', 'wTfa1VO6iZ', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(5, 'joelle97', 'Tavares Boehm', 'tillman.maxine@example.org', 'https://via.placeholder.com/900x300.png/0033bb?text=veritatis', '2022-04-09 15:50:49', '$2y$10$CR.D4g6tqzl9DRdPRLy53uko2ua5fxVZnycC4pUwEWawIcakDjdVe', 'kMjjl0KBnU', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(6, 'hills.brielle', 'Kaelyn Marquardt DVM', 'zulauf.orlando@example.com', 'https://via.placeholder.com/900x300.png/003355?text=labore', '2022-04-09 15:50:49', '$2y$10$cxB33IrhPPMnTImDnbziROVL5X8tEih7I/8VX3tMrAMtRRke0J2qG', 'BcGFhlXKl3', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(7, 'lester.nader', 'Dr. Lindsey Satterfield DVM', 'clifton.rath@example.com', 'https://via.placeholder.com/900x300.png/0011bb?text=omnis', '2022-04-09 15:50:49', '$2y$10$xsehQITdyJeZai5CWXGbf.m2hcRVLYzaOlh7mAACeLLzePylzeMJi', 'TVBM5VNFCK', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(8, 'lambert.fisher', 'Chase Smith', 'tstehr@example.org', 'https://via.placeholder.com/900x300.png/007744?text=error', '2022-04-09 15:50:50', '$2y$10$3pZDOcMTiu74E4VPRRhMAuzIX.OQADW4ZqZOSgYwRmCljvXkfg6ca', 'oTeiMJiBuW', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(9, 'yoshiko11', 'Sterling Johns', 'vullrich@example.net', 'https://via.placeholder.com/900x300.png/007777?text=architecto', '2022-04-09 15:50:50', '$2y$10$k1R6pqx8shzLww3kfnJ2beDGTDtkF4Ye6EljnlOoAAjf6gJ9D7.t6', 'PLxWCkgzGp', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(10, 'nico38', 'Maurine Conn V', 'ankunding.doris@example.org', 'https://via.placeholder.com/900x300.png/00eecc?text=consequuntur', '2022-04-09 15:50:50', '$2y$10$8XspkSG4wI2i4nSRbdvoruwrzamCwo0SEHnzVpGZOWaTasbhsun8e', 'yNoAZpmasH', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(11, 'abdullah.champlin', 'Jedidiah Labadie II', 'bobbie96@example.com', 'https://via.placeholder.com/900x300.png/001133?text=consequatur', '2022-04-09 15:50:50', '$2y$10$EgckzSVQ5tYOZjpm29v8WuIUu.B1dX1B52P2UoLIEauvES1jxw7/u', 'rhajPD1a9v', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(12, 'aleen34', 'Eleonore Lueilwitz', 'bshields@example.org', 'https://via.placeholder.com/900x300.png/00ff33?text=tenetur', '2022-04-09 15:50:50', '$2y$10$hhdlN8WN5mWLJx0I/dPb7.bNWamsyADDP0NJL7SoEebfToUsxKsxu', 'DUjOs5L1R7', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(13, 'ondricka.hanna', 'Ms. Eldora Bartoletti', 'ulind@example.net', 'https://via.placeholder.com/900x300.png/002222?text=sed', '2022-04-09 15:50:50', '$2y$10$9nBKJ7/o1VcxysyoIFC38.AvKOmYdVYlxaMu4lZt3jmdqRZJCuVXe', '8T7A8mU1fK', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(14, 'bheidenreich', 'Ms. Velda Mueller III', 'mccullough.myah@example.net', 'https://via.placeholder.com/900x300.png/0099cc?text=error', '2022-04-09 15:50:50', '$2y$10$COMXIajibDOaDjqGe7680eZiYqXjbcPAjEf4BF6l9r28qTNGMw6AC', 'lk0NctneOi', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(15, 'ilene30', 'Mrs. Hulda Cremin', 'jimmy82@example.net', 'https://via.placeholder.com/900x300.png/007711?text=suscipit', '2022-04-09 15:50:50', '$2y$10$MY1iMIVlAjmIGe0AGnmuveMud/NhcPIjVbyMsGLHAmUfNI168OM3e', 'ZEzDQpVnzm', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(16, 'claudie15', 'Miracle Roberts IV', 'virginie38@example.net', 'https://via.placeholder.com/900x300.png/0055bb?text=vel', '2022-04-09 15:50:50', '$2y$10$HYVaXqydhAMYC/K5fBBb5.P6sgdkc5t6eHR4i3KECMEFPShKrfeUK', '0vKar9cpMY', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(17, 'xstokes', 'Leonard Shanahan', 'white.makayla@example.net', 'https://via.placeholder.com/900x300.png/008833?text=id', '2022-04-09 15:50:50', '$2y$10$4sW3YhIjps3XLOIiw1.xVOGh4zGabfE/ELv.WnknH96xCTXHcgnNS', 'UGLvynmyOp', '2022-04-09 15:50:50', '2022-04-09 15:50:50'),
(18, 'carrie64', 'Mrs. Robyn Swaniawski', 'lucas59@example.com', 'https://via.placeholder.com/900x300.png/00ee77?text=minima', '2022-04-09 15:50:50', '$2y$10$3JbUSR/bUYC2kZRpPN.39eHkNkA2XkHEB1ghc/fZPDLpcSScZUPPu', 'dDv1DFUqzS', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(19, 'lynn.mohr', 'Edyth Terry', 'preynolds@example.org', 'https://via.placeholder.com/900x300.png/00aaee?text=quam', '2022-04-09 15:50:51', '$2y$10$f8iJ1Rpfii/jTA0B.sT0KeKpZFX5Z8ori1l2Ng.9s8FNm4PivIU.C', '3i42FmQu2R', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(20, 'pfeffer.alexys', 'Chloe Kerluke III', 'sincere73@example.org', 'https://via.placeholder.com/900x300.png/00ffcc?text=optio', '2022-04-09 15:50:51', '$2y$10$aSd8cFxPQYGfhlselR.mZuTeNuhd32k0r/zw8JSDwJ0Jufk1L9Lxi', 'wqHt26Y9gq', '2022-04-09 15:50:51', '2022-04-09 15:50:51'),
(22, 'batm9651', 'Shakil Khan', 'batm9651@gmail.com', NULL, NULL, '$2y$10$thJCeiQ5hTeXNYzEu1vwxeKFSfZ7uErCYF6xbdyVxpAI7dNSKX5YG', NULL, '2022-04-15 11:46:38', '2022-04-15 11:46:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`category_id`,`post_id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`permission_id`,`user_id`),
  ADD KEY `permission_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
