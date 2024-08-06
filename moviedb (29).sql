-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 09:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user', 1, 'add_user'),
(2, 'Can change user', 1, 'change_user'),
(3, 'Can delete user', 1, 'delete_user'),
(4, 'Can view user', 1, 'view_user'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add trailer', 8, 'add_trailer'),
(30, 'Can change trailer', 8, 'change_trailer'),
(31, 'Can delete trailer', 8, 'delete_trailer'),
(32, 'Can view trailer', 8, 'view_trailer'),
(33, 'Can add comment', 9, 'add_comment'),
(34, 'Can change comment', 9, 'change_comment'),
(35, 'Can delete comment', 9, 'delete_comment'),
(36, 'Can view comment', 9, 'view_comment'),
(37, 'Can add category', 10, 'add_category'),
(38, 'Can change category', 10, 'change_category'),
(39, 'Can delete category', 10, 'delete_category'),
(40, 'Can view category', 10, 'view_category');

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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$720000$hU1v7GHWW7gqyQ8rZU89dK$eSJF+CMxny1lt2SWMqAET4LF/2HCje5h69bMBtBOcsI=', '2024-05-22 07:39:24.867686', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-05-18 06:26:52.962015');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-05-18 06:28:04.462690', '1', 'prijin007', 3, '', 5, 2),
(2, '2024-05-18 06:54:17.327444', '3', 'black007', 1, '[{\"added\": {}}]', 5, 2),
(3, '2024-05-18 06:55:44.726373', '3', 'black007', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 5, 2),
(4, '2024-05-18 07:07:40.961869', '3', 'black007', 3, '', 5, 2),
(5, '2024-05-18 07:33:36.330576', '4', 'joel123', 1, '[{\"added\": {}}]', 5, 2),
(6, '2024-05-18 07:34:22.039916', '4', 'joel123', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 5, 2),
(7, '2024-05-18 07:40:43.301649', '4', 'joel123', 3, '', 5, 2),
(8, '2024-05-21 02:41:28.158169', '1', 'horror/thriller', 1, '[{\"added\": {}}]', 10, 2),
(9, '2024-05-21 02:45:44.266160', '1', 'horror/thriller', 1, '[{\"added\": {}}]', 10, 2),
(10, '2024-05-21 02:53:33.127671', '2', 'Action-Adventure', 1, '[{\"added\": {}}]', 10, 2),
(11, '2024-05-21 02:53:44.002694', '3', 'Action-Animation', 1, '[{\"added\": {}}]', 10, 2),
(12, '2024-05-21 02:53:56.480372', '4', 'Action-Comedy', 1, '[{\"added\": {}}]', 10, 2),
(13, '2024-05-21 02:54:02.711571', '5', 'Action-Crime', 1, '[{\"added\": {}}]', 10, 2),
(14, '2024-05-21 02:54:07.448337', '6', 'Action-Drama', 1, '[{\"added\": {}}]', 10, 2),
(15, '2024-05-21 02:54:20.537468', '7', 'Action-Fantasy', 1, '[{\"added\": {}}]', 10, 2),
(16, '2024-05-21 02:54:28.992004', '8', 'Action-Horror', 1, '[{\"added\": {}}]', 10, 2),
(17, '2024-05-21 02:54:35.944396', '9', 'Action-Mystery', 1, '[{\"added\": {}}]', 10, 2),
(18, '2024-05-21 02:54:53.539227', '10', 'Action-Romance', 1, '[{\"added\": {}}]', 10, 2),
(19, '2024-05-21 02:55:05.472721', '11', 'Action-Sci-Fi', 1, '[{\"added\": {}}]', 10, 2),
(20, '2024-05-21 02:55:12.576453', '12', 'Action-Thriller', 1, '[{\"added\": {}}]', 10, 2),
(21, '2024-05-21 02:55:34.813364', '12', 'Action-Thriller', 3, '', 10, 2),
(22, '2024-05-21 02:55:34.815144', '11', 'Action-Sci-Fi', 3, '', 10, 2),
(23, '2024-05-21 02:55:34.817132', '10', 'Action-Romance', 3, '', 10, 2),
(24, '2024-05-21 02:55:34.820580', '9', 'Action-Mystery', 3, '', 10, 2),
(25, '2024-05-21 02:55:34.822110', '8', 'Action-Horror', 3, '', 10, 2),
(26, '2024-05-21 02:55:34.824065', '7', 'Action-Fantasy', 3, '', 10, 2),
(27, '2024-05-21 02:55:34.825670', '6', 'Action-Drama', 3, '', 10, 2),
(28, '2024-05-21 02:55:34.827786', '5', 'Action-Crime', 3, '', 10, 2),
(29, '2024-05-21 02:55:34.830107', '4', 'Action-Comedy', 3, '', 10, 2),
(30, '2024-05-21 02:55:34.832234', '3', 'Action-Animation', 3, '', 10, 2),
(31, '2024-05-21 02:55:34.834386', '2', 'Action-Adventure', 3, '', 10, 2),
(32, '2024-05-21 02:55:42.879495', '13', 'Action-Adventure', 1, '[{\"added\": {}}]', 10, 2),
(33, '2024-05-21 02:55:47.848562', '14', 'Comedy-Drama', 1, '[{\"added\": {}}]', 10, 2),
(34, '2024-05-21 02:55:52.680425', '15', 'Crime-Thriller', 1, '[{\"added\": {}}]', 10, 2),
(35, '2024-05-21 02:55:57.775705', '16', 'Fantasy-Adventure', 1, '[{\"added\": {}}]', 10, 2),
(36, '2024-05-21 02:56:05.991909', '17', 'Horror-Comedy', 1, '[{\"added\": {}}]', 10, 2),
(37, '2024-05-21 02:56:16.168204', '18', 'Mystery-Drama', 1, '[{\"added\": {}}]', 10, 2),
(38, '2024-05-21 02:56:21.680510', '19', 'Romance-Comedy', 1, '[{\"added\": {}}]', 10, 2),
(39, '2024-05-21 02:56:29.280623', '20', 'Sci-Fi-Action', 1, '[{\"added\": {}}]', 10, 2),
(40, '2024-05-21 02:56:34.521011', '21', 'War-Drama', 1, '[{\"added\": {}}]', 10, 2),
(41, '2024-05-21 02:56:40.880959', '22', 'Historical-Epic', 1, '[{\"added\": {}}]', 10, 2),
(42, '2024-05-21 02:56:50.118889', '23', 'Supernatural-Thriller', 1, '[{\"added\": {}}]', 10, 2),
(43, '2024-05-21 02:56:56.040281', '24', 'Animated-Adventure', 1, '[{\"added\": {}}]', 10, 2),
(44, '2024-05-21 02:57:02.408526', '25', 'Documentary-Drama', 1, '[{\"added\": {}}]', 10, 2),
(45, '2024-05-21 02:57:09.025902', '26', 'Musical-Romance', 1, '[{\"added\": {}}]', 10, 2),
(46, '2024-05-21 02:57:15.056447', '27', 'Teen-Comedy', 1, '[{\"added\": {}}]', 10, 2),
(47, '2024-05-21 02:57:21.255727', '28', 'Crime-Drama-Thriller', 1, '[{\"added\": {}}]', 10, 2),
(48, '2024-05-21 02:57:26.887243', '29', 'Sci-Fi-Horror', 1, '[{\"added\": {}}]', 10, 2),
(49, '2024-05-21 02:57:32.547751', '30', 'Fantasy-Romance', 1, '[{\"added\": {}}]', 10, 2),
(50, '2024-05-21 02:57:39.137329', '31', 'Action-Comedy', 1, '[{\"added\": {}}]', 10, 2),
(51, '2024-05-21 02:57:48.392555', '32', 'Mystery-Horror-Thriller', 1, '[{\"added\": {}}]', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(10, 'movieapp', 'category'),
(9, 'movieapp', 'comment'),
(8, 'movieapp', 'trailer'),
(1, 'movieapp', 'user'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-17 08:30:00.970717'),
(2, 'auth', '0001_initial', '2024-05-17 08:30:01.196250'),
(3, 'admin', '0001_initial', '2024-05-17 08:30:01.255313'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-17 08:30:01.260795'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-17 08:30:01.266782'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-17 08:30:01.300609'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-17 08:30:01.330583'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-05-17 08:30:01.356461'),
(9, 'auth', '0004_alter_user_username_opts', '2024-05-17 08:30:01.361815'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-05-17 08:30:01.384841'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-05-17 08:30:01.386850'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-17 08:30:01.392842'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-05-17 08:30:01.403663'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-17 08:30:01.413030'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-05-17 08:30:01.422023'),
(16, 'auth', '0011_update_proxy_permissions', '2024-05-17 08:30:01.428489'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-17 08:30:01.438200'),
(19, 'sessions', '0001_initial', '2024-05-17 08:30:01.468421'),
(27, 'movieapp', '0001_initial', '2024-05-21 02:44:58.180242'),
(28, 'movieapp', '0002_trailer', '2024-05-21 02:44:58.192862'),
(29, 'movieapp', '0003_trailer_cast_trailer_full_details_and_more', '2024-05-21 02:44:58.258545'),
(30, 'movieapp', '0004_comment', '2024-05-21 02:44:58.334003'),
(31, 'movieapp', '0005_category_alter_trailer_category', '2024-05-21 02:44:58.420192'),
(32, 'movieapp', '0006_trailer_email_alter_comment_user', '2024-05-21 14:12:25.879063'),
(33, 'movieapp', '0007_remove_trailer_email_alter_comment_user', '2024-05-21 14:12:25.972642'),
(34, 'movieapp', '0008_trailer_email_alter_comment_user', '2024-05-21 14:12:26.062254'),
(35, 'movieapp', '0009_remove_trailer_email_alter_comment_user', '2024-05-21 14:12:26.153731'),
(36, 'movieapp', '0010_trailer_username', '2024-05-22 05:37:17.094568');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0am2fd938akxi926w3pytlvb8rvl15ry', 'eyJ1c2VyX2lkIjozOX0:1s8MaU:9ZVi0F_lhCTXKxsJMFwcgmt5Bl8TqEkBGL7ph2wOI5w', '2024-06-01 16:07:10.352137'),
('0to7ql7dxgcao7peh0yzfvn5bzsyhvyt', 'eyJpbnZhbGlkX2xvZ2luIjp0cnVlfQ:1s89ae:WiXpFNjIpfSinN1YT3uU1SaPOYFj3PAoqv8gsATCWF0', '2024-06-01 02:14:28.503376'),
('8cddnr6rf6ka9u4whq8lxvk0k1h3hjl6', 'eyJ1c2VyX2lkIjozNH0:1s8CSy:zT7k9QYpL8C_F0ZuJ9CmWwtY12ydTYWLFAbogRs108E', '2024-06-01 05:18:44.344986'),
('e29c5b7ivlh7adxhueprgy6kqrkvtotu', 'eyJ1c2VyX2lkIjozOX0:1s8vcz:ICnXE0NKF8qK0YJDqQo-OgIWILJGD-xzJ2TcYquwVkA', '2024-06-03 05:32:05.896188'),
('iaj762e7l4t2bsf1jda2c4rql4guy4as', '.eJxVjDsOwjAQBe_iGlmLHf8o6XMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIilDj9bgnzg-sO6I711mRudV3mJHdFHrTLsRE_r4f7d1Cwl2_t0YLXoMmfExgGnHBwIRAyKKsG1tmwdZQniyoP7MAqgy5wsEERMYj3B9lON9Y:1s8ELP:b0UaYABcYyUATj0_hrf_pSvIbuuh6yOr1SmMLy6ldCo', '2024-06-01 07:19:03.743198'),
('jv1f1prx6hcsz8byeia9659rue1shag1', 'eyJ1c2VyX2lkIjozOX0:1s92qt:vKeeKuDege2RGy_J3Ra6FL1eP3PVIf7r6dqFREfCETk', '2024-06-03 13:14:55.641202'),
('muoig6jjrzc103lsae5nq2kr5ram3svl', 'eyJ1c2VyX2lkIjoxfQ:1s9baz:vYhu4NJU5E9PCfCZ1eb3-qF3HZYCgmb7kSzow4MSRFk', '2024-06-05 02:20:49.123209'),
('sejtyzlkggzp44zldeqwvtmff6ywqjnz', 'eyJ1c2VyX2lkIjoxfQ:1s9Loj:DcU1lWTTi3QPslK-8HmjGy7ZT_cNPvRvjQSN7durYfA', '2024-06-04 09:29:57.714414'),
('yije5tbds9wrusqn8h6v5nzdxqjvu9bt', '.eJxVjDsOwjAQBe_iGlmLHf8o6XMGa-3d4ACypTipEHeHSCmgfTPzXiLitpa4dV7iTOIilDj9bgnzg-sO6I711mRudV3mJHdFHrTLsRE_r4f7d1Cwl2_t0YLXoMmfExgGnHBwIRAyKKsG1tmwdZQniyoP7MAqgy5wsEERMYj3B9lON9Y:1s9gZI:0dJ2IrrLS8NINa7EBXP8uYI9ldR3Q3n1CjpGvsQ-YNY', '2024-06-05 07:39:24.879120');

-- --------------------------------------------------------

--
-- Table structure for table `movieapp_category`
--

CREATE TABLE `movieapp_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movieapp_category`
--

INSERT INTO `movieapp_category` (`id`, `name`) VALUES
(13, 'Action-Adventure'),
(14, 'Comedy-Drama'),
(15, 'Crime-Thriller'),
(16, 'Fantasy-Adventure'),
(17, 'Horror-Comedy'),
(18, 'Mystery-Drama'),
(19, 'Romance-Comedy'),
(20, 'Sci-Fi-Action'),
(21, 'War-Drama'),
(22, 'Historical-Epic'),
(23, 'Supernatural-Thriller'),
(24, 'Animated-Adventure'),
(25, 'Documentary-Drama'),
(26, 'Musical-Romance'),
(27, 'Teen-Comedy'),
(28, 'Crime-Drama-Thriller'),
(29, 'Sci-Fi-Horror'),
(30, 'Fantasy-Romance'),
(31, 'Action-Comedy'),
(32, 'Mystery-Horror-Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `movieapp_comment`
--

CREATE TABLE `movieapp_comment` (
  `id` bigint(20) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `trailer_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movieapp_comment`
--

INSERT INTO `movieapp_comment` (`id`, `text`, `created_at`, `trailer_id`, `user_id`) VALUES
(1, 'superb', '2024-05-21 03:09:56.429977', 2, 1),
(2, 'nice', '2024-05-21 17:35:19.867853', 2, 1),
(3, 'vow', '2024-05-21 17:49:44.094979', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movieapp_trailer`
--

CREATE TABLE `movieapp_trailer` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `description` longtext NOT NULL,
  `cast` varchar(255) NOT NULL,
  `full_details` longtext NOT NULL,
  `poster_image` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `youtube_trailer_link` varchar(200) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movieapp_trailer`
--

INSERT INTO `movieapp_trailer` (`id`, `title`, `category_id`, `cover_image`, `rating`, `description`, `cast`, `full_details`, `poster_image`, `release_date`, `youtube_trailer_link`, `username`) VALUES
(2, 'The Big Short', 14, 'covers/Screenshot_2024-05-21_083535.png', 7.8, '\"The Big Short\" is a captivating film directed by Adam McKay, released in 2015. It falls under the genres of comedy and thriller', 'Christian Bale as Michael Burry: one of the first people to discover the American housing market bubble. Burry operates his own hedge fund, Scion Capital, and uses his liquidity to short the housing market. Steve Carell as Mark Baum: the leader of FrontPo', 'To explain financial instruments, the film features cameo appearances by actress Margot Robbie (uncredited), chef Anthony Bourdain, singer-songwriter Selena Gomez (uncredited), economist Richard Thaler, and others who break the fourth wall to explain concepts such as subprime mortgages and synthetic collateralized debt obligations.[5] Several of the film\'s characters directly address the audience, most frequently Gosling\'s, who serves as the narrator.\r\n\r\nThe Big Short began a limited release in the United States on December 11, 2015, followed by a wide release on December 23 by Paramount Pictures.[6][7] A critical and commercial success, the film grossed $133 million on a $50 million budget and received acclaim for the performances of the cast (particularly that of Bale), McKay\'s direction, editing, and the screenplay. The film won the Academy Award for Best Adapted Screenplay in addition to nominations for Best Picture, Best Director, Best Supporting Actor (Bale), and Best Film Editing.', 'posters/Screenshot_2024-05-21_083535.png', '2022-05-05', 'https://youtu.be/vgqG3ITMv1Q?si=YYp4Sm5gOHxyTiEA', 'black007'),
(7, 'Indiana Jones: Raiders of the Lost Ark', 13, 'covers/indiana.png', 8.4, 'An archaeologist races against Nazis to find the Ark of the Covenant.', 'Harrison Ford as Indiana Jones: An archaeology professor and adventurer[4] Karen Allen as Marion Ravenwood: A spirited, tough bar owner and Jones\' former lover[5] Paul Freeman as René Belloq: A rival archaeologist to Jones, in the employ of the Nazis[6] R', 'Raiders of the Lost Ark[b] is a 1981 American action-adventure film directed by Steven Spielberg from a screenplay by Lawrence Kasdan, based on a story by George Lucas and Philip Kaufman. Set in 1936, the film stars Harrison Ford as Indiana Jones, a globetrotting archaeologist vying with Nazi German forces to recover the long-lost Ark of the Covenant which is said to make an army invincible. Teaming up with his tough former romantic interest Marion Ravenwood (Karen Allen), Jones races to stop rival archaeologist René Belloq (Paul Freeman) from guiding the Nazis to the Ark and its power.', 'posters/indiana.png', '1981-05-21', 'https://youtu.be/0xQSIdSRlAk?si=Lcyr5Bvc3wIuRJc8', 'prijin007'),
(8, 'The Dark Knight', 13, 'covers/dark_kni.png', 9, 'Batman faces the Joker in a battle for Gotham\'s soul.', 'Christian Bale as Bruce Wayne / Batman: A wealthy socialite who as a child was traumatized by his parents\' murder. Wayne secretly operates as the heroic vigilante Batman.[4] Michael Caine as Alfred Pennyworth: Wayne\'s father-figure, trusted butler, and co', 'The Dark Knight is a 2008 superhero film directed by Christopher Nolan from a screenplay co-written with his brother Jonathan. Based on the DC Comics superhero Batman, it is the sequel to Batman Begins (2005) and the second installment in The Dark Knight trilogy. The plot follows the vigilante Batman, police lieutenant James Gordon, and district attorney Harvey Dent, who form an alliance to dismantle organized crime in Gotham City. Their efforts are derailed by the Joker, an anarchistic mastermind who seeks to test how far Batman will go to save the city from chaos. The ensemble cast includes Christian Bale, Michael Caine, Heath Ledger, Gary Oldman, Aaron Eckhart, Maggie Gyllenhaal, and Morgan Freeman.', 'posters/dark_kni.png', '2008-02-25', 'https://youtu.be/EXeTwQWrcwY?si=_07KI9o-klk62KYR', 'black007'),
(13, 'The Departed', 15, 'covers/departed.png', 8.5, 'In the gritty underworld of Boston, a dangerous game of cat and mouse ensues as an undercover cop and a mole within the police force race to uncover each other\'s identities, all while navigating the treacherous territory of an Irish gang led by conflicting loyalties and escalating violence.', 'Leonardo DiCaprio as Trooper William \"Billy\" Costigan Jr. Matt Damon as Staff Sergeant Colin Sullivan Jack Nicholson as Francis \"Frank\" Costello Mark Wahlberg as Staff Sergeant Sean Dignam Martin Sheen as Captain Oliver \"Charlie\" Queenan Ray Winstone as A', 'The Departed is a 2006 American epic crime thriller film[2][3][4] film directed by Martin Scorsese and written by William Monahan.[5] It is both a remake of the 2002 Hong Kong film Infernal Affairs and also loosely based on the real-life Boston Winter Hill Gang; the character Colin Sullivan is based on the corrupt FBI agent John Connolly, while the character Frank Costello is based on Irish-American gangster and crime boss Whitey Bulger.[6][7][8] The film stars Leonardo DiCaprio, Matt Damon, Jack Nicholson, and Mark Wahlberg, with Martin Sheen, Ray Winstone, Vera Farmiga, Alec Baldwin, Anthony Anderson and James Badge Dale in supporting roles.', 'posters/departed.png', '2006-05-22', 'https://youtu.be/iojhqm0JTW4?si=-bbBPh5cI1pMnu7d', 'black007'),
(14, 'Se7en', 15, 'covers/Screenshot_2024-05-22_123513.png', 8.6, 'In a bleak and rain-soaked city, two detectives are thrust into a harrowing investigation to track down a sadistic serial killer who methodically chooses his victims based on the seven deadly sins, leading them on a twisted journey into the darkest corners of the human psyche.', 'Brad Pitt as David Mills: A well-meaning but impulsive homicide detective[2] Morgan Freeman as William Somerset: A veteran police officer disillusioned with his job[2][3][4] Gwyneth Paltrow as Tracy Mills: Detective Mills\' pregnant wife[2][5] R. Lee Ermey', 'Seven (often stylized as Se7en)[1] is a 1995 American crime thriller film directed by David Fincher and written by Andrew Kevin Walker. It stars Brad Pitt, Morgan Freeman, Gwyneth Paltrow, and John C. McGinley. Set in an unnamed, crime-ridden city, Seven\'s narrative follows disenchanted, nearly retired detective William Somerset (Freeman) and his newly transferred partner David Mills (Pitt) as they try to stop a serial killer from executing a series of murders based on the seven deadly sins.', 'posters/Screenshot_2024-05-22_123513.png', '1995-05-22', 'https://youtu.be/znmZoVkCjpI?si=_HPiAlglIUb5qrMp', 'black007');

-- --------------------------------------------------------

--
-- Table structure for table `movieapp_user`
--

CREATE TABLE `movieapp_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movieapp_user`
--

INSERT INTO `movieapp_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'prijin007', 'jafar', 'khan', 'jafarkhan6425@gmail.com', 'Jafar007'),
(2, 'black007', 'jafar', 'khan', 'blackorlov9656@gmail.com', 'Jafar007');

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
-- Indexes for table `movieapp_category`
--
ALTER TABLE `movieapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movieapp_comment`
--
ALTER TABLE `movieapp_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieapp_comment_trailer_id_4e5386ee_fk_movieapp_trailer_id` (`trailer_id`),
  ADD KEY `movieapp_comment_user_id_f1e2c30a_fk_movieapp_user_id` (`user_id`);

--
-- Indexes for table `movieapp_trailer`
--
ALTER TABLE `movieapp_trailer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieapp_trailer_category_id_dce4e413` (`category_id`);

--
-- Indexes for table `movieapp_user`
--
ALTER TABLE `movieapp_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `movieapp_category`
--
ALTER TABLE `movieapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `movieapp_comment`
--
ALTER TABLE `movieapp_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movieapp_trailer`
--
ALTER TABLE `movieapp_trailer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `movieapp_user`
--
ALTER TABLE `movieapp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `movieapp_comment`
--
ALTER TABLE `movieapp_comment`
  ADD CONSTRAINT `movieapp_comment_trailer_id_4e5386ee_fk_movieapp_trailer_id` FOREIGN KEY (`trailer_id`) REFERENCES `movieapp_trailer` (`id`);

--
-- Constraints for table `movieapp_trailer`
--
ALTER TABLE `movieapp_trailer`
  ADD CONSTRAINT `movieapp_trailer_category_id_dce4e413_fk_movieapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `movieapp_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
