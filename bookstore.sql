-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2017 at 01:59 AM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add book state', 7, 'add_bookstate'),
(20, 'Can change book state', 7, 'change_bookstate'),
(21, 'Can delete book state', 7, 'delete_bookstate'),
(22, 'Can add category', 8, 'add_category'),
(23, 'Can change category', 8, 'change_category'),
(24, 'Can delete category', 8, 'delete_category'),
(25, 'Can add rate user book', 9, 'add_rateuserbook'),
(26, 'Can change rate user book', 9, 'change_rateuserbook'),
(27, 'Can delete rate user book', 9, 'delete_rateuserbook'),
(28, 'Can add book', 10, 'add_book'),
(29, 'Can change book', 10, 'change_book'),
(30, 'Can delete book', 10, 'delete_book'),
(31, 'Can add author', 11, 'add_author'),
(32, 'Can change author', 11, 'change_author'),
(33, 'Can delete author', 11, 'delete_author'),
(34, 'Can add user profile', 12, 'add_userprofile'),
(35, 'Can change user profile', 12, 'change_userprofile'),
(36, 'Can delete user profile', 12, 'delete_userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$bGZSGZzbLAzG$EUJGNjxYe5hERAluYQPAyxbmWORfz7q3RvtFgTmE11g=', '2017-04-30 22:57:14.994932', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2017-04-25 11:49:32.502617'),
(2, 'pbkdf2_sha256$36000$b9mvAGtFgzhO$ee8s/jU7usTog+b2GHmcwh5pPjRLV9zAAEsTbJKtK84=', '2017-04-30 15:33:48.258351', 0, 'seif', '', '', 'seif@gmail.com', 0, 1, '2017-04-25 15:15:14.544253'),
(3, 'pbkdf2_sha256$36000$6BeIzFbVXqB2$MGevmS7dfnURX10wSckjU6J75Pl76eGV+ZIwq5HECbQ=', NULL, 0, 'adham', '', '', 'adham@gmail.com', 0, 1, '2017-04-30 04:44:14.124519'),
(4, 'pbkdf2_sha256$36000$WRtrCGKxt2Lo$YrO9rM8ERIJI4yxOsvN0CqnaH/E59iQ1jPNhHDcUYw8=', NULL, 0, 'ali', '', '', 'ali@gmail.com', 0, 1, '2017-04-30 05:28:10.188775'),
(5, 'pbkdf2_sha256$36000$EalEZV2fWdJY$B91WdtQkVPZ3YVNzD0rOUJ9Pp2hweSqGqi7eZsDfx6k=', NULL, 0, 'samy', '', '', 'samy@gmail.com', 0, 1, '2017-04-30 05:33:32.415523'),
(6, 'pbkdf2_sha256$36000$OG7NTH9sjOUR$FnpjawCEeA1H5jYeUSZNOibYgxLtJw3Hs7WO7K7wrgU=', '2017-04-30 22:56:18.365190', 0, 'hassan', '', '', 'hassan@gmail.com', 0, 1, '2017-04-30 07:02:17.865894');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-04-25 12:00:22.038792', '1', 'Mostafa Mahmoud', 1, '[{"added": {}}]', 11, 1),
(2, '2017-04-28 12:56:47.499827', '2', 'Dan brown', 1, '[{"added": {}}]', 11, 1),
(3, '2017-04-28 13:06:54.907615', '3', 'Abd El-Wahab El-Msery', 1, '[{"added": {}}]', 11, 1),
(4, '2017-04-28 13:24:20.205096', '1', 'Philosphy', 1, '[{"added": {}}]', 8, 1),
(5, '2017-04-28 13:24:26.458280', '1', 'Philosphy', 2, '[]', 8, 1),
(6, '2017-04-28 13:24:36.682030', '2', 'Novels', 1, '[{"added": {}}]', 8, 1),
(7, '2017-04-28 13:24:53.502093', '3', 'Science', 1, '[{"added": {}}]', 8, 1),
(8, '2017-04-28 13:25:21.886117', '1', 'Asr Al-Qroud', 1, '[{"added": {}}]', 10, 1),
(9, '2017-04-28 13:26:32.272110', '2', 'The Lost Symbol', 1, '[{"added": {}}]', 10, 1),
(10, '2017-04-28 13:28:02.040342', '3', 'Rehlty Al-Fikria', 1, '[{"added": {}}]', 10, 1),
(11, '2017-04-30 17:59:25.202952', '4', 'Agatha Christie', 1, '[{"added": {}}]', 11, 1),
(12, '2017-04-30 18:00:48.628014', '4', 'Strangers', 1, '[{"added": {}}]', 10, 1),
(13, '2017-04-30 18:01:30.702354', '5', 'mosters', 1, '[{"added": {}}]', 10, 1),
(14, '2017-04-30 22:47:36.003343', '5', 'said', 1, '[{"added": {}}]', 11, 1),
(15, '2017-04-30 22:57:33.678378', '6', 'walid', 1, '[{"added": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(11, 'store', 'author'),
(10, 'store', 'book'),
(7, 'store', 'bookstate'),
(8, 'store', 'category'),
(9, 'store', 'rateuserbook'),
(12, 'store', 'userprofile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-04-25 11:46:34.677501'),
(2, 'auth', '0001_initial', '2017-04-25 11:46:46.086531'),
(3, 'admin', '0001_initial', '2017-04-25 11:46:48.205209'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-04-25 11:46:48.555454'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-04-25 11:46:50.180733'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-04-25 11:46:50.390189'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-04-25 11:46:50.560828'),
(8, 'auth', '0004_alter_user_username_opts', '2017-04-25 11:46:50.628705'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-04-25 11:46:51.365663'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-04-25 11:46:51.398306'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-04-25 11:46:51.447153'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-04-25 11:46:51.841100'),
(13, 'sessions', '0001_initial', '2017-04-25 11:46:52.674909'),
(14, 'store', '0001_initial', '2017-04-25 11:47:02.760211'),
(15, 'store', '0002_auto_20170425_1146', '2017-04-25 11:47:04.029770'),
(16, 'store', '0003_auto_20170425_1151', '2017-04-25 11:51:42.654774'),
(17, 'store', '0004_auto_20170425_1154', '2017-04-25 11:55:00.509739'),
(18, 'store', '0005_userprofile', '2017-04-25 12:36:18.127506'),
(19, 'store', '0006_auto_20170425_1243', '2017-04-27 07:24:40.324532');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7cnpvj1stm8us38bz7f763ciswob7qag', 'ZTJkZTMyM2E0NWZhN2U4M2Q1NzY5ZjZlZWQ2MTAxOWE3YzU5Nzk2ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVlMWE5NWEwMDIzZjY4MWUzMTMwYTIzZGNkZWMxZDQwZDc3ZWRmMGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-05-14 22:57:15.118178');

-- --------------------------------------------------------

--
-- Table structure for table `store_author`
--

CREATE TABLE `store_author` (
  `id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_author`
--

INSERT INTO `store_author` (`id`, `image`, `name`, `country`, `dob`) VALUES
(1, 'imgs/person3.png', 'Mostafa Mahmoud', 'Egypt', '2017-04-25'),
(2, 'imgs/person2.png', 'Dan brown', 'England', '2017-04-28'),
(3, 'imgs/mesery1_HRgu3wF.jpg', 'Abd El-Wahab El-Msery', 'Egypt', '2017-04-28'),
(4, 'imgs/agathaProfile.jpg', 'Agatha Christie', 'England', '1890-09-15'),
(5, 'imgs/person4.png', 'said', 'Egypt', '2017-04-30'),
(6, 'imgs/person3_tWNwu52.png', 'walid', 'Egypt', '2017-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `store_author_followers`
--

CREATE TABLE `store_author_followers` (
  `id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_author_followers`
--

INSERT INTO `store_author_followers` (`id`, `author_id`, `user_id`) VALUES
(1, 1, 1),
(5, 1, 2),
(6, 1, 6),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(8, 5, 1),
(9, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `store_book`
--

CREATE TABLE `store_book` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `publish_date` date NOT NULL,
  `summary` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cover` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_book`
--

INSERT INTO `store_book` (`id`, `title`, `publish_date`, `summary`, `author_id`, `category_id`, `cover`) VALUES
(1, 'Asr Al-Qroud', '2017-04-28', 'Love, affection and compassion - between the couple - the difference between the three?! Why were the two mentioned in the Qur\'an instead of love? What is the difference between love and lust? Are they the same thing? Do they meet in person?\r\nThe previous questions and more of them are discussed with us now book of the era of monkeys, which is between your hands to the writer - Mustafa Mahmoud', 1, 1, 'covers/22-81.jpg'),
(2, 'The Lost Symbol', '2017-04-02', 'In this stunning follow-up to the global phenomenon The Da Vinci Code, Dan Brown demonstrates once again why he is the world\'s most popular thriller writer. The Lost Symbol is a masterstroke of storytelling - a deadly race through a real-world labyrinth of codes, secrets, and unseen truths...all under the watchful eye of Brown\'s most terrifying', 2, 2, 'covers/LostSymbol.jpg'),
(3, 'Rehlty Al-Fikria', '2017-04-05', 'Wahab Al - Messiri. Its individual transformations are made in thought and methodology and are chronicled, at the same time, for an entire generation, or for a sector thereof. Fathulat owner of this biography is not in any way germane to what was happening around him. From this point of view, the events of the author\'s life are not only important in themselves, but are important in the extent to which they shed light on its intellectual development.', 3, 1, 'covers/images.jpg'),
(4, 'Strangers', '2017-04-30', 'sum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently w', 4, 2, 'covers/agatha.jpg'),
(5, 'mosters', '2017-04-30', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their', 4, 2, 'covers/agatha2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `store_bookstate`
--

CREATE TABLE `store_bookstate` (
  `id` int(11) NOT NULL,
  `statues` varchar(1) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_bookstate`
--

INSERT INTO `store_bookstate` (`id`, `statues`, `book_id`, `user_id`) VALUES
(1, '0', 2, 2),
(2, '1', 1, 2),
(3, '2', 2, 6),
(4, '0', 3, 6),
(5, '0', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_category`
--

INSERT INTO `store_category` (`id`, `name`) VALUES
(1, 'Philosphy'),
(2, 'Novels'),
(3, 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `store_rateuserbook`
--

CREATE TABLE `store_rateuserbook` (
  `id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_rateuserbook`
--

INSERT INTO `store_rateuserbook` (`id`, `rate`, `book_id`, `user_id`) VALUES
(1, 4, 3, 2),
(2, 4, 2, 2),
(3, 3, 4, 2),
(4, 4, 2, 6),
(5, 2, 3, 6),
(6, 4, 5, 6),
(7, 4, 1, 6),
(8, 4, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `store_userprofile`
--

CREATE TABLE `store_userprofile` (
  `id` int(11) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_userprofile`
--

INSERT INTO `store_userprofile` (`id`, `avatar`, `user_id`) VALUES
(1, 'avatars/person8.png', 2),
(2, 'avatars/person2.png', 3),
(3, 'avatars/person4.png', 4),
(4, 'avatars/person3.png', 5),
(5, 'avatars/orange.png', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `store_author`
--
ALTER TABLE `store_author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_author_followers`
--
ALTER TABLE `store_author_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_author_user_author_id_user_id_c17b46a9_uniq` (`author_id`,`user_id`),
  ADD KEY `store_author_followers_user_id_48a273a4_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_book`
--
ALTER TABLE `store_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_book_author_id_b581e597_fk_store_author_id` (`author_id`),
  ADD KEY `store_book_category_id_46de4d82_fk_store_category_id` (`category_id`);

--
-- Indexes for table `store_bookstate`
--
ALTER TABLE `store_bookstate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_bookstate_book_id_43c45eb8_fk_store_book_id` (`book_id`),
  ADD KEY `store_bookstate_user_id_5761a469_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_rateuserbook`
--
ALTER TABLE `store_rateuserbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_rateuserbook_book_id_69819387_fk_store_book_id` (`book_id`),
  ADD KEY `store_rateuserbook_user_id_87f01535_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `store_userprofile`
--
ALTER TABLE `store_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `store_author`
--
ALTER TABLE `store_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `store_author_followers`
--
ALTER TABLE `store_author_followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `store_book`
--
ALTER TABLE `store_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `store_bookstate`
--
ALTER TABLE `store_bookstate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `store_rateuserbook`
--
ALTER TABLE `store_rateuserbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `store_userprofile`
--
ALTER TABLE `store_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_author_followers`
--
ALTER TABLE `store_author_followers`
  ADD CONSTRAINT `store_author_followers_author_id_fed5300a_fk_store_author_id` FOREIGN KEY (`author_id`) REFERENCES `store_author` (`id`),
  ADD CONSTRAINT `store_author_followers_user_id_48a273a4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_book`
--
ALTER TABLE `store_book`
  ADD CONSTRAINT `store_book_author_id_b581e597_fk_store_author_id` FOREIGN KEY (`author_id`) REFERENCES `store_author` (`id`),
  ADD CONSTRAINT `store_book_category_id_46de4d82_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`);

--
-- Constraints for table `store_bookstate`
--
ALTER TABLE `store_bookstate`
  ADD CONSTRAINT `store_bookstate_book_id_43c45eb8_fk_store_book_id` FOREIGN KEY (`book_id`) REFERENCES `store_book` (`id`),
  ADD CONSTRAINT `store_bookstate_user_id_5761a469_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_rateuserbook`
--
ALTER TABLE `store_rateuserbook`
  ADD CONSTRAINT `store_rateuserbook_book_id_69819387_fk_store_book_id` FOREIGN KEY (`book_id`) REFERENCES `store_book` (`id`),
  ADD CONSTRAINT `store_rateuserbook_user_id_87f01535_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `store_userprofile`
--
ALTER TABLE `store_userprofile`
  ADD CONSTRAINT `store_userprofile_user_id_6db609dc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
