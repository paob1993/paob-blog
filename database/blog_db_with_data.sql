-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2021 a las 04:20:16
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interactions`
--

CREATE TABLE `interactions` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `publication_id` bigint(20) UNSIGNED NOT NULL,
  `reaction` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `interactions`
--

INSERT INTO `interactions` (`user_id`, `publication_id`, `reaction`, `visits`, `created_at`, `updated_at`) VALUES
(1, 1, 'N', 3, NULL, NULL),
(1, 3, 'Y', 2, NULL, NULL),
(2, 1, NULL, 1, NULL, NULL),
(2, 2, NULL, 1, NULL, NULL),
(2, 3, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2021_06_27_003246_create_publications_table', 1),
(7, '2021_06_27_185333_create_users_table', 1),
(8, '2021_06_28_190242_create_interactions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('61793c3d7b33a3fc9c91fc3475005f914f488c3e14a5666075c4b84fd1d4f145e8710194c3c9f1b2', 1, 1, 'Personal Access Token', '[]', 0, '2021-06-29 05:35:22', '2021-06-29 05:35:22', '2021-06-29 02:35:22'),
('88e999ae36a248addcd14c6d7114e366bee528adb38fc4254ec73ec3fd927523165e64b1abdf9fae', 1, 1, 'Personal Access Token', '[]', 0, '2021-06-29 05:33:22', '2021-06-29 05:33:22', '2021-06-29 02:33:22'),
('8dad9b7898a130d982386ca9f2ac6e71174c6c304baf819bd9d2144b686b2fa5e93d7110f85d62b8', 2, 1, 'Personal Access Token', '[]', 0, '2021-06-29 05:34:59', '2021-06-29 05:34:59', '2021-06-29 02:34:59'),
('9abfa24b1f28528e055c8d014406cf6fd89bf8142a6443b3c5f3ea511907a4fe01ee94cd0cb999c2', 1, 1, 'Personal Access Token', '[]', 0, '2021-06-29 05:33:32', '2021-06-29 05:33:32', '2021-06-29 02:33:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Blog Personal Access Client', '2eaxmZsTHZ8fb8aw9Y26hqf7DAtBbYILLhMmj4lr', NULL, 'http://localhost', 1, 0, 0, '2021-06-29 05:33:02', '2021-06-29 05:33:02'),
(2, NULL, 'Blog Password Grant Client', 'gTg8hfOIM3t9zmzer7bkSHtAeP764MQPqyJkT3OL', 'users', 'http://localhost', 0, 1, 0, '2021-06-29 05:33:02', '2021-06-29 05:33:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-29 05:33:02', '2021-06-29 05:33:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publications`
--

CREATE TABLE `publications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `author` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publications`
--

INSERT INTO `publications` (`id`, `image`, `title`, `content`, `publish_date`, `author`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Publicación de prueba 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan finibus augue, et rutrum erat vestibulum vitae. Nulla ac purus urna. Suspendisse varius aliquam lobortis. Suspendisse diam sem, cursus eu ligula in, semper faucibus lorem. Nullam tempus, urna sed posuere cursus, tortor arcu accumsan sem, eget porta turpis risus euismod nisl. Nullam ultrices sem in odio tincidunt, vitae venenatis justo interdum. Maecenas facilisis sed neque at tristique. Nulla malesuada nisl id est consectetur placerat.Etiam suscipit dui aliquet urna luctus consectetur. Phasellus vel pellentesque dui. In lacus tortor, vulputate non odio in, scelerisque elementum orci. Nunc ultricies malesuada ipsum. Etiam id orci vel diam sollicitudin condimentum. Etiam ac lectus nec leo finibus dapibus ut eu mi. Maecenas eget turpis vel magna fringilla porttitor. Sed imperdiet tellus pretium, vehicula est auctor, iaculis arcu. Proin sodales eu urna eget molestie. Vivamus lectus est, porta eget nisi a, ullamcorper mattis tortor. Nam elementum laoreet massa dignissim mattis. Donec malesuada libero elit, ultrices imperdiet diam mollis a. Quisque eu orci tempus, efficitur lacus sed, volutpat libero. Cras ut viverra libero.', '2021-06-29 01:34:08', 'PaoB1993', '2021-06-29 05:34:08', '2021-06-29 05:34:08'),
(2, NULL, 'Publicación de prueba 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan finibus augue, et rutrum erat vestibulum vitae. Nulla ac purus urna. Suspendisse varius aliquam lobortis. Suspendisse diam sem, cursus eu ligula in, semper faucibus lorem. Nullam tempus, urna sed posuere cursus, tortor arcu accumsan sem, eget porta turpis risus euismod nisl. Nullam ultrices sem in odio tincidunt, vitae venenatis justo interdum. Maecenas facilisis sed neque at tristique. Nulla malesuada nisl id est consectetur placerat.Etiam suscipit dui aliquet urna luctus consectetur. Phasellus vel pellentesque dui. In lacus tortor, vulputate non odio in, scelerisque elementum orci. Nunc ultricies malesuada ipsum. Etiam id orci vel diam sollicitudin condimentum. Etiam ac lectus nec leo finibus dapibus ut eu mi. Maecenas eget turpis vel magna fringilla porttitor. Sed imperdiet tellus pretium, vehicula est auctor, iaculis arcu. Proin sodales eu urna eget molestie. Vivamus lectus est, porta eget nisi a, ullamcorper mattis tortor. Nam elementum laoreet massa dignissim mattis. Donec malesuada libero elit, ultrices imperdiet diam mollis a. Quisque eu orci tempus, efficitur lacus sed, volutpat libero. Cras ut viverra libero.', '2021-06-29 01:34:10', 'PaoB1993', '2021-06-29 05:34:10', '2021-06-29 05:34:10'),
(3, NULL, 'Publicación de prueba 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan finibus augue, et rutrum erat vestibulum vitae. Nulla ac purus urna. Suspendisse varius aliquam lobortis. Suspendisse diam sem, cursus eu ligula in, semper faucibus lorem. Nullam tempus, urna sed posuere cursus, tortor arcu accumsan sem, eget porta turpis risus euismod nisl. Nullam ultrices sem in odio tincidunt, vitae venenatis justo interdum. Maecenas facilisis sed neque at tristique. Nulla malesuada nisl id est consectetur placerat.Etiam suscipit dui aliquet urna luctus consectetur. Phasellus vel pellentesque dui. In lacus tortor, vulputate non odio in, scelerisque elementum orci. Nunc ultricies malesuada ipsum. Etiam id orci vel diam sollicitudin condimentum. Etiam ac lectus nec leo finibus dapibus ut eu mi. Maecenas eget turpis vel magna fringilla porttitor. Sed imperdiet tellus pretium, vehicula est auctor, iaculis arcu. Proin sodales eu urna eget molestie. Vivamus lectus est, porta eget nisi a, ullamcorper mattis tortor. Nam elementum laoreet massa dignissim mattis. Donec malesuada libero elit, ultrices imperdiet diam mollis a. Quisque eu orci tempus, efficitur lacus sed, volutpat libero. Cras ut viverra libero.', '2021-06-29 01:34:11', 'PaoB1993', '2021-06-29 05:34:11', '2021-06-29 05:34:11'),
(4, NULL, 'Publicación de prueba 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan finibus augue, et rutrum erat vestibulum vitae. Nulla ac purus urna. Suspendisse varius aliquam lobortis. Suspendisse diam sem, cursus eu ligula in, semper faucibus lorem. Nullam tempus, urna sed posuere cursus, tortor arcu accumsan sem, eget porta turpis risus euismod nisl. Nullam ultrices sem in odio tincidunt, vitae venenatis justo interdum. Maecenas facilisis sed neque at tristique. Nulla malesuada nisl id est consectetur placerat.Etiam suscipit dui aliquet urna luctus consectetur. Phasellus vel pellentesque dui. In lacus tortor, vulputate non odio in, scelerisque elementum orci. Nunc ultricies malesuada ipsum. Etiam id orci vel diam sollicitudin condimentum. Etiam ac lectus nec leo finibus dapibus ut eu mi. Maecenas eget turpis vel magna fringilla porttitor. Sed imperdiet tellus pretium, vehicula est auctor, iaculis arcu. Proin sodales eu urna eget molestie. Vivamus lectus est, porta eget nisi a, ullamcorper mattis tortor. Nam elementum laoreet massa dignissim mattis. Donec malesuada libero elit, ultrices imperdiet diam mollis a. Quisque eu orci tempus, efficitur lacus sed, volutpat libero. Cras ut viverra libero.', '2021-06-29 01:34:12', 'PaoB1993', '2021-06-29 05:34:12', '2021-06-29 05:34:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 2,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Blog', 'admin@blog.com', '$2y$10$RTUHF4Bh2eiTqXvI7/bwDuMKRmzLNNFqfxVB1o/FdPvmmNgF/G7GS', 1, NULL, NULL, NULL),
(2, 'User', 'Blog', 'user@blog.com', '$2y$10$RTUHF4Bh2eiTqXvI7/bwDuMKRmzLNNFqfxVB1o/FdPvmmNgF/G7GS', 2, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`user_id`,`publication_id`),
  ADD KEY `interactions_publication_id_foreign` (`publication_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `publications`
--
ALTER TABLE `publications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `interactions`
--
ALTER TABLE `interactions`
  ADD CONSTRAINT `interactions_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
