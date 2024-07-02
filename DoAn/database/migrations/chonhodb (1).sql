-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th5 15, 2024 lúc 10:08 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chonhodb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `card_item_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Quần áo', 'Danh mục dành cho mọi loại quần áo cả nam, nữ và em bé', '2024-05-12 23:25:40', '2024-05-12 23:25:40'),
(2, 'Điện tử', 'Danh mục dành cho các thiết bị điện tử ti vi, máy tính, điện thoại...', '2024-05-13 18:28:31', '2024-05-13 18:28:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_05_13_053615_create_users_table', 2),
(5, '2024_05_10_070205_create_user_details', 3),
(6, '2024_05_10_070503_create_categories_table', 3),
(7, '2024_05_10_070548_create_products_table', 3),
(8, '2024_05_10_070756_create_vouchers_table', 3),
(9, '2024_05_10_071005_create_products_vouchers_table', 3),
(10, '2024_05_10_072122_create_orders_table', 3),
(11, '2024_05_10_072251_create_order_items_table', 4),
(12, '2024_05_10_072505_create_reviews_table', 4),
(13, '2024_05_14_003322_add_user_id_to_products_table', 5),
(16, '2024_05_14_151436_add_voucher_id_to_products_table', 6),
(17, '2024_05_15_070454_create_carts_table', 7),
(18, '2024_05_15_080010_create_cart_items_table', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `order_description` text DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_order` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status_order` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_photo` varchar(255) NOT NULL,
  `product_detail` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_photo`, `product_detail`, `quantity`, `status`, `price`, `category_id`, `user_id`, `voucher_id`, `created_at`, `updated_at`) VALUES
(29, 'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện', 'uploads/images/f6.jpg', 'Product 1 detail', 10, 'active', 100.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(30, 'Áo Hoodie thêu chữ basic nam nữ unisex form rộng mặc cực đẹp, chất nỉ cotton Hàn cao cấp, hợp mọi thời đại', 'uploads/images/f7.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(31, 'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện', 'uploads/images/f8.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(32, 'Áo Hoodie thêu chữ basic nam nữ unisex form rộng mặc cực đẹp, chất nỉ cotton Hàn cao cấp, hợp mọi thời đại', 'uploads/images/f9.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(33, 'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện', 'uploads/images/n1.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(34, 'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện', 'uploads/images/n2.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(35, 'Áo khoác gió nam-nữ 2 lớp, Áo khoác dù chất liệu vải gió cao cấp kháng nước full tem tag phụ kiện', 'uploads/images/n3.jpg', 'Product 2 detail', 20, 'active', 200.00, 1, 1, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(36, 'Iphone 15', 'uploads/images/e2.jpg', 'Sản phẩm ra mắt năm 2023', 15, 'active', 20000000.00, 2, 3, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52'),
(37, 'Iphone 12', 'uploads/images/e1.jpg', 'Sản phẩm ra mắt năm 2021', 20, 'active', 10400000.00, 2, 2, NULL, '2024-05-14 09:03:52', '2024-05-14 09:03:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_vouchers`
--

CREATE TABLE `products_vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `review_detail` text NOT NULL,
  `star_quantity` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `reviewed_date` timestamp NULL DEFAULT '2024-05-12 22:49:35',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demarcus McDermott', 'ohodkiewicz@example.net', '2024-05-13 18:06:19', '$2y$10$zgXIvEeX45pIkRZgNfT2aO4msH0lFvNDXhrtp3c5mSrYeuS5EdtJ6', 0, 'IUQXNIfb6j', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(2, 'Prof. Leonardo Leffler Jr.', 'omorar@example.org', '2024-05-13 18:06:19', '$2y$10$JPUlcxZFnNZEIs.4/N4Qdueq60M9/mQ81a0rwjVLdWNiPUZFX.IFO', 1, 'BzklGgStcE', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(3, 'Richmond Corwin', 'danny51@example.net', '2024-05-13 18:06:19', '$2y$10$67AvyMLey5Psh2pdr7I9Re70er9Xw7XNWwEOzkcuy.hMNEYhQk/LC', 1, 'onEnsA0OMa', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(4, 'Kasandra Simonis DDS', 'emerson29@example.net', '2024-05-13 18:06:19', '$2y$10$pFANUfGQK55QrP9CGTTjIuhl466yyq3EsqHNXui/SQICRFQD5riEy', 0, 'gAragkX1oJ', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(5, 'Doug Klein', 'karlie10@example.org', '2024-05-13 18:06:19', '$2y$10$/yjk/HT4dZlVL8fbPfqedeSXllADHCeWYoraFeGL/uF4LfZX76h26', 0, 'zABuy0L18M', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(6, 'Mrs. Myrna Littel', 'madonna.osinski@example.org', '2024-05-13 18:06:19', '$2y$10$kclcnFpepmojFmP3VK5KyuWMPHlf/7BeTbfbHVUMbxLM0zrWe7jD.', 1, 'ZL9cgWEMVy', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(7, 'Mitchel Considine', 'giovanny77@example.com', '2024-05-13 18:06:19', '$2y$10$khTaL9eTdQfZ/AHrkfK/A.9HyJ1OVRAh1sWduFws.VYg/1rVdwIvW', 0, 'jXhAW4t688', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(8, 'Mr. Elton Cartwright MD', 'king.hailee@example.net', '2024-05-13 18:06:19', '$2y$10$bEGQ3zh7hbu/hIClrzEnW.nYG1yfl7y0uKeYScibAmiO.QrJOzlwK', 0, '5lODX1ygBt', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(9, 'Virgil Koch', 'huels.august@example.com', '2024-05-13 18:06:20', '$2y$10$q.3B0j0xHsYp4P1XKWH5CeWcdMKYiC9ZmEP/L9EWHiLll.pUaDWAS', 0, 'amnwZgykSE', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(10, 'Mrs. Angelita Pollich', 'trantow.urban@example.net', '2024-05-13 18:06:20', '$2y$10$gQNKS6.nyuc1JjNbloTbNezxqFiszqfRLkLG5tYahXyyZ.zE9Q9oG', 1, 'xtvfqIKja4', '2024-05-13 18:06:20', '2024-05-13 18:06:20'),
(11, 'Thad Hoppe', 'xbartoletti@example.com', '2024-05-14 08:46:19', '$2y$10$sWhP58qJ30ms35AxFKvao.BlWIBUed0NG3IsPVhEqfQOpX6PNa9CG', 0, 'sKZpVbtwO0', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(12, 'Mrs. Lacey Schulist', 'bhuel@example.org', '2024-05-14 08:46:19', '$2y$10$/mJYwLKo3WwWj2cxfEVqdOZPMSDmKnj4he7FpOYnlmq2o9NM4ucnW', 1, 'SeSaPRCdNO', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(13, 'Addison Eichmann', 'kohler.lupe@example.net', '2024-05-14 08:46:19', '$2y$10$CZ390EEeiAmovOpG.SnIL.JC1JhLdRZCyhnT2Y0h5bS9Gk3/hPKQy', 1, 'c9EHbN7wnU', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(14, 'Miles Durgan', 'ole.boyle@example.net', '2024-05-14 08:46:19', '$2y$10$KIMMYistq40xZZxEPyGBzecpRlCcKUPOc2/tueFHjcynwjqY84vZG', 0, '2SBcDJE7Wm', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(15, 'Rusty Prohaska', 'rocio20@example.com', '2024-05-14 08:46:20', '$2y$10$9AsKyE.dqVpwY7CX6Co1He2tU9zrXaV597U7oV4wD/PtwMafCW44G', 1, 'f8NMuQIbTF', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(16, 'Dalton Torp', 'carter.mason@example.net', '2024-05-14 08:46:20', '$2y$10$PE7EH1aFiBlZxq7ipEF6DO6UkCwpIgPPuaL9rML/LHNVAAntH7s5G', 1, 'Oen5UHAH9j', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(17, 'Una McClure I', 'mills.leopold@example.com', '2024-05-14 08:46:20', '$2y$10$dLzfstF1QG3flHtFrrM3UeT0w7u4xPW0zK94z1dwLhbdIGVQk49SW', 1, 'SkpxiaeIZl', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(18, 'Jaylen Langworth', 'okeefe.adolfo@example.net', '2024-05-14 08:46:20', '$2y$10$akNCZ.YRbwSQw/K8pxTVEuhiJakEXM.nxr9vHJa5yDk0fiDxYVFT6', 0, 'JYDp5gEpbR', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(19, 'Jaren Davis', 'rhuels@example.com', '2024-05-14 08:46:20', '$2y$10$oRxE1oYDdMgxortmrAQe9.V9x/pEQtblaQKNMvmgIo.bBCSRHotMq', 0, '86zB40X3Z9', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(20, 'Miss Pearlie Little', 'lionel15@example.net', '2024-05-14 08:46:20', '$2y$10$n.W0VHdKEHaqgv72CuNzdeD9X/jdaXCaSvGRCoi8jba4ww3lXM/H6', 1, 'KbQbZ8vHL0', '2024-05-14 08:46:21', '2024-05-14 08:46:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_details`
--

CREATE TABLE `user_details` (
  `detail_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `sex` enum('male','female','other') NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_name` varchar(50) NOT NULL,
  `voucher_quantity` int(11) NOT NULL,
  `voucher_detail` varchar(100) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `voucher_name`, `voucher_quantity`, `voucher_detail`, `discount_percentage`, `begin_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Discount10', 100, '10% off on all products', 10.00, '2024-05-14', '2024-06-14', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(2, 'SummerSale', 50, '15% off on summer collection', 15.00, '2024-05-14', '2024-06-14', '2024-05-14 08:46:21', '2024-05-14 08:46:21'),
(3, 'BlackFriday', 200, '20% off on Black Friday', 20.00, '2024-05-14', '2024-06-14', '2024-05-14 08:46:21', '2024-05-14 08:46:21');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`card_item_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_voucher_id_foreign` (`voucher_id`);

--
-- Chỉ mục cho bảng `products_vouchers`
--
ALTER TABLE `products_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_vouchers_product_id_foreign` (`product_id`),
  ADD KEY `products_vouchers_voucher_id_foreign` (`voucher_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`detail_user_id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `card_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `products_vouchers`
--
ALTER TABLE `products_vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user_details`
--
ALTER TABLE `user_details`
  MODIFY `detail_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `voucher_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`voucher_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products_vouchers`
--
ALTER TABLE `products_vouchers`
  ADD CONSTRAINT `products_vouchers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_vouchers_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`voucher_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
