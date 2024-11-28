-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2024 г., 21:07
-- Версия сервера: 5.7.39
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `my_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `content`) VALUES
(227, 'et minus quo', 'Quis similique ipsum cum. Optio inventore id deserunt qui. Quibusdam quidem nostrum odit.'),
(228, 'doloribus fugit eligendi', 'Sapiente fugiat et inventore ad est incidunt. Ut at quis ut aut dicta est.'),
(229, 'nam eveniet omnis', 'Ad excepturi odio suscipit. Iste delectus occaecati id error. Harum adipisci laborum enim et autem.'),
(230, 'quos unde dolorem', 'Dolorem aut exercitationem magnam. Ea eligendi deserunt eos id nisi. Ab corrupti natus ea dolorem.'),
(231, 'quo in hic', 'Eum dolores quis itaque mollitia sunt dolorum. Et nostrum sunt vel.'),
(232, 'ut voluptatibus vel', 'Eius aut et non fugit quo. Nihil sunt tempora temporibus ipsa. Possimus ab nihil aut quia.'),
(233, 'et enim reiciendis', 'Ut ad quia a ut. Et assumenda cupiditate omnis aut velit. Adipisci aut aut quas dolor quia et.'),
(234, 'fuga natus odio', 'Ut molestias eos eos id voluptas quia et. Et sunt est quasi odit distinctio.'),
(235, 'praesentium ex nulla', 'Deserunt consectetur aperiam suscipit. Magnam ex voluptatum doloremque.'),
(236, 'quo ea iure', 'Sint commodi animi eveniet. Tempora harum expedita nulla aut. Eum illum et voluptatum.'),
(237, 'itaque culpa ut', 'Optio officia eveniet sed praesentium facere. Optio quia sed reprehenderit dolorem qui magni.'),
(238, 'rem incidunt non', 'Totam quos fugiat quas. Rerum ut commodi iste consequatur. Ducimus et id odio officiis et a at.'),
(239, 'accusantium exercitationem ut', 'Molestiae ea molestias et facilis. Itaque et autem dicta atque sit quasi animi.'),
(240, 'rem qui rerum', 'Est qui voluptatem autem sed. Distinctio ut ut nesciunt minus amet expedita et.'),
(241, 'doloremque et molestiae', 'Vel enim et unde distinctio. Esse sunt itaque unde eum.'),
(242, 'nulla commodi ut', 'Error quam placeat inventore recusandae molestiae. Id velit porro animi eos molestias.'),
(243, 'in quaerat quaerat', 'Quam ea debitis doloribus exercitationem doloribus repudiandae. Dolore non voluptas sit non rerum.'),
(244, 'dolor voluptatem quis', 'Dolorem quaerat et necessitatibus ipsum non. Et fuga non aut. Et quam corrupti ullam.'),
(245, 'odit consequuntur sit', 'Voluptas dignissimos ea sapiente ab ipsa. Explicabo voluptatem odio alias veritatis ex at autem.'),
(246, 'repellat quibusdam inventore', 'Tenetur in et quibusdam repudiandae est est. Et odit corporis saepe aliquam.'),
(247, 'quod sint cumque', 'Omnis laudantium repellat aut cumque. Et odit sint autem ex. Laborum laudantium iste cum placeat.'),
(248, 'optio aut impedit', 'Nesciunt ab dolor voluptates voluptatem. Cum tempore molestiae animi deleniti iusto eos.'),
(249, 'ad nemo quisquam', 'Voluptatem nostrum voluptatum fugit. Fugiat qui adipisci dolor earum at quia.'),
(250, 'itaque dolor modi', 'Atque suscipit dolore expedita nam. Distinctio quia vero quia et aut quis labore.'),
(251, 'numquam et ab', 'Unde non sequi ipsa sit maxime maiores. Sunt deleniti quo consequatur sint.'),
(252, 'numquam aut molestiae', 'A est non quia qui qui ipsum. Qui dolores non et nemo nobis. Aut sapiente omnis et magni hic.'),
(253, 'animi autem quia', 'Temporibus aliquid ipsa qui est eos nihil. Consectetur quasi ab sint commodi.'),
(254, 'praesentium quasi labore', 'Cum ullam voluptatem sit quia voluptas doloremque. Et voluptatem reiciendis debitis unde cum.'),
(255, 'animi voluptas et', 'Atque quia dignissimos voluptatibus qui nemo. Natus expedita quo odit sed similique quo.'),
(256, 'quia sint vero', 'Nam illo aut nulla ex consectetur. Tempore quaerat quis numquam ea. Aut praesentium rerum id eius.'),
(257, 'et aut aut', 'Incidunt explicabo itaque cumque id mollitia est nemo. Non eos pariatur quis placeat.'),
(258, 'id commodi tenetur', 'Molestiae optio eius rerum iusto. Laborum aut ex maxime et. Sed dolor earum sint quae non possimus.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `verified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `resettable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `roles_mask` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `registered` int(10) UNSIGNED DEFAULT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `force_logout` mediumint(7) UNSIGNED NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `status_info` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `vk` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `status`, `verified`, `resettable`, `roles_mask`, `registered`, `last_login`, `force_logout`, `avatar`, `job`, `phone`, `adress`, `status_info`, `vk`, `telegram`, `instagram`) VALUES
(46, 'Oliver.kopyov@smartadminwebapp.com', '$2y$10$C3F1dtE9Dm0Yu.JgmfG0/uZvV1yZ7JudrjE1FOFUjUICCZjNSt1nm', 'Oliver', 0, 1, 1, 1, 1732113672, 1732816438, 0, '6744309d1161c.png', 'IT Director, Gotbootstrap Inc.', '+1 317-456-2564', '15 Charist St, Detroit, MI, 48212, USA', 'Онлайн', NULL, NULL, NULL),
(47, 'Alita@smartadminwebapp.com', '$2y$10$UQBkZqwWbpamGj.PninTz..HPQSi2KeS4tSpyk7f1QN/57XU9N5ga', 'Alita Gray', 0, 1, 1, 2, 1732177456, 1732522240, 0, '6744422f10415.png', 'Human Resources, Gotbootstrap Inc.', '+1 313-779-8134', '55 Smyth Rd, Detroit, MI, 48341, USA', 'Онлайн', 'Alita_vk.com', 'Alita_telegram.com', 'Alita_instagram.com'),
(98, 'oleg@example.com', '$2y$10$p58YvimmdE3LC0SLjtSiGOwEmw0/qUgc3YkdD14JwHODjpTiaa5oy', 'Oleg', 0, 1, 1, 2, 1732528562, NULL, 0, '674449d4150ae.png', ' Gotbootstrap Inc.', '+1 317-456-2555', '55 Smyth Rd, Detroit, MI, 48341, USA', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users_2fa`
--

CREATE TABLE `users_2fa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mechanism` tinyint(2) UNSIGNED NOT NULL,
  `seed` varchar(255) DEFAULT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  `expires_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_confirmations`
--

CREATE TABLE `users_confirmations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) NOT NULL,
  `selector` varchar(16) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_otps`
--

CREATE TABLE `users_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mechanism` tinyint(2) UNSIGNED NOT NULL,
  `single_factor` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `selector` varchar(24) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_remembered`
--

CREATE TABLE `users_remembered` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(24) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_resets`
--

CREATE TABLE `users_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_throttling`
--

CREATE TABLE `users_throttling` (
  `bucket` varchar(44) NOT NULL,
  `tokens` float UNSIGNED NOT NULL,
  `replenished_at` int(10) UNSIGNED NOT NULL,
  `expires_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_throttling`
--

INSERT INTO `users_throttling` (`bucket`, `tokens`, `replenished_at`, `expires_at`) VALUES
('PZ3qJtO_NLbJfRIP-8b4ME4WA3xxc6n9nbCORSffyQ0', 3.00769, 1732528562, 1732960562),
('QduM75nGblH2CDKFyk0QeukPOwuEVDAUFE54ITnHM38', 74, 1732816438, 1733356438);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `users_2fa`
--
ALTER TABLE `users_2fa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_mechanism` (`user_id`,`mechanism`);

--
-- Индексы таблицы `users_confirmations`
--
ALTER TABLE `users_confirmations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `email_expires` (`email`,`expires`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users_otps`
--
ALTER TABLE `users_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_mechanism` (`user_id`,`mechanism`),
  ADD KEY `selector_user_id` (`selector`,`user_id`);

--
-- Индексы таблицы `users_remembered`
--
ALTER TABLE `users_remembered`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `users_resets`
--
ALTER TABLE `users_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `user_expires` (`user`,`expires`);

--
-- Индексы таблицы `users_throttling`
--
ALTER TABLE `users_throttling`
  ADD PRIMARY KEY (`bucket`),
  ADD KEY `expires_at` (`expires_at`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `users_2fa`
--
ALTER TABLE `users_2fa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_confirmations`
--
ALTER TABLE `users_confirmations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `users_otps`
--
ALTER TABLE `users_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_remembered`
--
ALTER TABLE `users_remembered`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_resets`
--
ALTER TABLE `users_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
