-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 10 2024 г., 21:05
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
  `email` varchar(249) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `verified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `resettable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `roles_mask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registered` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `force_logout` mediumint(7) UNSIGNED NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `status`, `verified`, `resettable`, `roles_mask`, `registered`, `last_login`, `force_logout`, `role`) VALUES
(23, 'Pepe@example.com', '$2y$10$lhvcSeAfAKp3uyPePSVrFOY.BayttSNlE1YAIuZM3e0UMcOaIzNJS', 'Pepe', 0, 1, 1, 1, 1730645189, 1730653473, 0, 'user'),
(22, 'John@example.com', '$2y$10$OngKzE0qYj27p1y6Es6v0OYWZD0NI3XzoThkpbAmIv/92GHKZEuYe', 'John', 0, 0, 1, 0, 1730635651, NULL, 0, 'user'),
(21, 'Mave@example.com', '$2y$10$3BOOnsBxo4VCwTR8Z7XCruksDau0PzmenjARUO.3tgiAKA/ISSsse', 'Mave', 0, 1, 1, 0, 1730565329, 1730566157, 0, 'user'),
(20, 'Mark@example.com', '$2y$10$2vGh0g6eiyRkhYiifxRW5.VXD3cWqsmVo83msClMWstHV5CFzZgpC', 'Mark', 0, 1, 1, 0, 1730556304, 1730557199, 0, 'user'),
(19, 'Bob@example.com', '$2y$10$xAAnJkFD31jXO47bW/4RpejGefkg/AaXqx0NolqTk25Nh9OXX7bUC', 'Bob', 0, 0, 1, 0, 1730546470, NULL, 0, 'user'),
(18, 'Igor@example.com', '$2y$10$Ca1sMjM7f0zq6mBt2QwP4u256HhRE3xa0GHO26lVk6u2wWxbhRyEO', 'Igor', 0, 0, 1, 0, 1730545684, NULL, 0, 'user'),
(17, 'Max@example.com', '$2y$10$z1UMyJUp8vmBzDgTMYEWe.uLYgAIlumZbpeay6bVPxIjQrS.q24uu', 'Max', 0, 0, 1, 0, 1730543519, NULL, 0, 'user'),
(14, 'Ivan@example.com', '$2y$10$InHFGUnPg9LXfdwtkrHmie1NCinQrHnKY4XM8IaEOGW2/mttkCvma', 'Ivan', 0, 0, 1, 0, 1730490506, NULL, 0, 'user'),
(15, 'July@example.com', '$2y$10$61VjzI0eIdpM.bbHxQNsfOgyQk0yclpQwUwz3bFL9lBJdgodkBNrK', 'July', 0, 0, 1, 0, 1730491607, NULL, 0, 'user'),
(16, 'Bebe@example.com', '$2y$10$o2pEA0JPZcxE9NzrABgy3O4NWCzw2M382cfy3rTySOg6bwtcWizoW', 'Bebe', 0, 1, 1, 0, 1730492843, 1731243710, 0, 'user'),
(24, 'Pasha@example.com', '$2y$10$xqfHCSLsjNLolBW.xnhLTOUg7S7Vd96TZKYCZzt7CGAty3dnDurw2', 'Pasha', 0, 0, 1, 0, 1730900263, NULL, 0, 'user');

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

--
-- Дамп данных таблицы `users_confirmations`
--

INSERT INTO `users_confirmations` (`id`, `user_id`, `email`, `selector`, `token`, `expires`) VALUES
(2, 2, 'Ivan@example.com', '6Lxbek95LFyKlNij', '$2y$10$n9UjxbwjORTC2DqBsq7XGeVwJ0s9p/2xwN1c3Ch/LYu8iiC55qX4a', 1730282641),
(3, 3, 'July@example.com', 'How8S9qYXQoxh3Yc', '$2y$10$81zsctpWgFT8PlLOrur1zukd1iM80QQOLrpjDFKVRst10dvW/ESAG', 1730317990),
(4, 4, 'Igor@example.com', '1F-lsvsxfaEDb0mT', '$2y$10$ohBntKK4VKwyDa14VjPXzedDPPgRkUq/lThPxJ4lQVv/vNkyWFNcG', 1730320486),
(5, 5, 'Bob@example.com', 'suVQ5Vz2FqtfaLJJ', '$2y$10$SRRW2XqVFkyAOT/P5r8fmOgXkXsBBoW9IH1hRPqwa5F5eT2kKf8ZC', 1730321160),
(6, 6, 'Mary@example.com', 'zTK3sdMbgZCGEqSN', '$2y$10$TnVOnimukpLrHuYfIq6JEuQiYNVxJPsIFFW0uSq2tp8DjzBYuFjai', 1730371406),
(7, 7, 'Alex@example.com', 'W7OfAPgx8epcwrgY', '$2y$10$5Y6lM6unBSo3yrpPg0i.FO512TtUWkWFADzi8sSmJu26jrgs2fySG', 1730480855),
(8, 8, 'Jane@example.com', 'LJgEZA8Yr6Y0QJRM', '$2y$10$9jXTDWksLpCV.b4SXPPYS.P45YFlbbOHquLSFIowcVM289WcrYCoC', 1730554247),
(9, 9, 'Bony@example.com', 'HJkUGxOggMAsM-Zf', '$2y$10$8mowhkt7OKhz3R4HxKHepuPYE1e0ffJlwu58Z9xVc3fvzpp263Qoa', 1730555877),
(10, 10, 'Ilon@example.com', 'C4WMqXq9SGRP8okE', '$2y$10$O4yW5xBOiCCYlGCIp2k.BOk853ehQRYcO2CoGBrRWgYqi4OvwMDve', 1730556226),
(11, 11, 'Anna@example.com', 'V2MZOZ7uIhby9HWp', '$2y$10$5At3/kevAo26bzjl6QLVz.3QBqbV2F0UDerm.o772wzlQ9ki0h.6e', 1730556708),
(12, 12, 'Rr@example.com', 'uAr3hQ9M3xHGMyLl', '$2y$10$ii/lJKSIc3D9y.Jjx3MOZ.khV4mNBaDRPmitItryfd7skA/h/XqpK', 1730557245),
(13, 13, 'Oop@example.com', 'PkvSmnrfoNCwF9Gf', '$2y$10$JCFXvNbdC5zChHPjC2TzAO1cfALP.c3lAoB63abWlnAEV.WElbx8O', 1730560785),
(14, 14, 'Ivan@example.com', 'dV-jh23frotLu2NE', '$2y$10$ZBiqJAgMUZabJxTJjcEXVuOUnPQDn9YetD8vmbIgCzIpfQTWPa.Y6', 1730576906),
(15, 15, 'July@example.com', 'iR7v9KNavUUOttQP', '$2y$10$f11NkJdFQcKi7hgXze0.EONR0j/DOTYS2U3K02OTwf5kmMzOAPtXS', 1730578007),
(17, 17, 'Max@example.com', 'cCeaK7GFwcoBpCWa', '$2y$10$t.BRWZmBq/vXikCWoi6VNeaaMDbGFTiAkBeBntPSz5ZY25gmW7Iuy', 1730629919),
(18, 18, 'Igor@example.com', 'oCHTrEAK6KpY9uWQ', '$2y$10$2CCBkgpj3k9mC/WE8qKd5udjMQnhLS/49PzaRvjHP.n15KNTNdtHG', 1730632084),
(19, 19, 'Bob@example.com', 'YHgazN4LmaEAuhwn', '$2y$10$RJoTGkTwp0PJfCUM8Pi4WOiS/jV/jOtOyGsrJ6ucXFytzRFz/cxpK', 1730632870),
(22, 22, 'John@example.com', '47l07fhqDuYiiOCu', '$2y$10$Vg3vCaBi7M2RIDdla0w/M.fEKnDnoaPgrF5qd27sQwKWErOS9h3tm', 1730722051),
(24, 24, 'Pasha@example.com', '3LWViaZB74shtIMt', '$2y$10$83zYPoXYcMT/nIo4ue5i2ejaVLHXixtp/032B.9CCA9bJaNmVpXBO', 1730986663);

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
('py90jzaAqDRiDAr0XWq5MjGK_KelKoHOrEMJ_uKYlZE', 21.305, 1731253287, 1731325287),
('QG-7mhO6KMAQVd27hY19XX1a63Bor0g5I5PFXNbxqNI', 21.305, 1731253287, 1731325287),
('4v8npHQs7oK-g8tXonUC2IGpD4Hx9GW6bHPsZ8NAoLU', 28, 1730645371, 1730717371),
('afEvVlD9vPyxr5TlE3igfuJxDIZM41RAGIKVcpyUGFA', 28, 1730645371, 1730717371),
('HIJQJPUQ2qyyTt0Q7_AuZA0pXm27czJnqpJsoA5IFec', 42.175, 1731253287, 1731325287),
('PZ3qJtO_NLbJfRIP-8b4ME4WA3xxc6n9nbCORSffyQ0', 4, 1730900268, 1731332268),
('QduM75nGblH2CDKFyk0QeukPOwuEVDAUFE54ITnHM38', 74, 1731243710, 1731783710);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `users_2fa`
--
ALTER TABLE `users_2fa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users_confirmations`
--
ALTER TABLE `users_confirmations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
