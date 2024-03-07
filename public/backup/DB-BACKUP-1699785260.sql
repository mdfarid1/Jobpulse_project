DROP TABLE IF EXISTS accounts;

CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_date` date NOT NULL,
  `account_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` decimal(10,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES('1','Cash','2022-11-01','cash','BDT','0.00','','1','2022-11-01 11:05:49','2022-11-01 11:05:49');
INSERT INTO accounts VALUES('2','Bank','2022-12-14','2234 3434 0343 2222','BDT','5000.00','','1','2022-12-14 14:31:42','2022-12-14 14:31:42');
INSERT INTO accounts VALUES('3','Cash','2023-01-02','','BDT','0.00','','2','2023-01-02 13:10:28','2023-01-02 13:10:28');



DROP TABLE IF EXISTS activity_logs;

CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `related_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `activity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO activity_logs VALUES('3','projects','1','Assign To Kamal','2','1','2022-12-14 14:50:17','2022-12-14 14:50:17');
INSERT INTO activity_logs VALUES('4','projects','1','Change Project Status - In Progress','2','1','2022-12-14 14:53:06','2022-12-14 14:53:06');
INSERT INTO activity_logs VALUES('5','projects','1','Updated Project','2','1','2022-12-14 14:53:06','2022-12-14 14:53:06');



DROP TABLE IF EXISTS attendances;

CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int NOT NULL,
  `entry_at` time DEFAULT NULL,
  `exit_at` time DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES('2','0007176026','1','11:04:10','11:29:38','1','2023-02-16 11:04:49','2023-03-15 16:21:46');
INSERT INTO attendances VALUES('4','0007176026','1','16:20:33','17:15:18','1','2023-02-20 16:21:21','2023-02-20 17:15:22');
INSERT INTO attendances VALUES('10','0007219790','1','11:28:07','11:33:07','1','2023-02-22 11:28:11','2023-03-15 16:25:00');
INSERT INTO attendances VALUES('11','0007176026','1','10:04:03','10:04:03','1','2023-02-28 10:04:07','2023-02-28 10:04:13');
INSERT INTO attendances VALUES('12','0007219790','1','10:04:38','10:05:14','1','2023-02-28 10:05:06','2023-02-28 10:05:19');
INSERT INTO attendances VALUES('13','0007219790','1','10:17:55','','1','2023-03-01 10:17:59','2023-03-01 10:17:59');
INSERT INTO attendances VALUES('14','0007176026','1','10:07:48','16:48:32','1','2023-03-05 10:07:51','2023-03-05 16:48:37');
INSERT INTO attendances VALUES('15','0007219790','1','10:08:04','16:48:42','1','2023-03-05 10:08:07','2023-03-05 16:48:46');
INSERT INTO attendances VALUES('16','0007176026','1','11:29:22','12:06:29','1','2023-03-06 11:29:26','2023-03-06 12:06:32');
INSERT INTO attendances VALUES('17','0007219790','1','11:29:31','17:29:33','1','2023-03-06 11:29:34','2023-03-06 17:29:38');
INSERT INTO attendances VALUES('18','0007176026','1','10:40:24','','1','2023-03-09 10:43:15','2023-03-09 10:43:15');
INSERT INTO attendances VALUES('19','0007219790','1','10:43:19','','1','2023-03-09 10:43:25','2023-03-09 10:43:25');
INSERT INTO attendances VALUES('22','0007176026','1','10:15:44','11:27:34','1','2023-03-12 11:04:23','2023-03-12 11:27:39');
INSERT INTO attendances VALUES('23','0007219790','1','11:04:27','','1','2023-03-12 11:04:37','2023-03-12 11:04:37');
INSERT INTO attendances VALUES('24','0007219790','1','10:52:52','11:24:20','1','2023-03-15 10:54:55','2023-03-15 16:21:08');
INSERT INTO attendances VALUES('25','0007176026','1','10:55:00','11:37:42','1','2023-03-15 10:55:51','2023-03-15 16:20:19');
INSERT INTO attendances VALUES('26','0007219790','1','10:17:09','','1','2023-03-19 10:17:15','2023-03-19 10:17:15');
INSERT INTO attendances VALUES('27','0007176026','1','10:17:20','','1','2023-03-19 10:17:24','2023-03-19 10:17:24');
INSERT INTO attendances VALUES('28','0007219790','1','10:39:26','','1','2023-03-20 10:39:29','2023-03-20 10:39:29');
INSERT INTO attendances VALUES('29','0007176026','1','10:39:34','','1','2023-03-20 10:39:37','2023-03-20 10:39:37');
INSERT INTO attendances VALUES('30','0007176026','1','10:11:57','13:14:19','1','2023-03-22 10:12:14','2023-03-22 13:14:22');
INSERT INTO attendances VALUES('31','0007219790','1','10:12:19','13:14:27','1','2023-03-22 10:12:35','2023-03-22 13:14:46');
INSERT INTO attendances VALUES('32','0007219790','1','10:44:49','','1','2023-03-23 10:45:08','2023-03-23 10:45:08');
INSERT INTO attendances VALUES('33','0007176026','1','10:45:14','','1','2023-03-23 10:45:20','2023-03-23 10:45:20');
INSERT INTO attendances VALUES('36','0007176026','1','10:35:02','','1','2023-03-27 10:36:15','2023-03-27 10:36:15');
INSERT INTO attendances VALUES('39','40','2','10:50:44','','1','2023-03-27 10:50:48','2023-03-27 10:50:48');
INSERT INTO attendances VALUES('40','0007219790','1','10:57:10','','1','2023-03-27 10:57:13','2023-03-27 10:57:13');
INSERT INTO attendances VALUES('41','0007176026','1','09:49:24','','1','2023-03-28 09:56:12','2023-03-28 09:56:12');
INSERT INTO attendances VALUES('42','40','2','09:56:18','','1','2023-03-28 11:35:43','2023-03-28 11:35:43');
INSERT INTO attendances VALUES('44','0007219790','1','11:36:07','','1','2023-03-28 11:43:23','2023-03-28 11:43:23');
INSERT INTO attendances VALUES('45','0007219790','1','11:16:51','','1','2023-03-29 11:16:56','2023-03-29 11:16:56');
INSERT INTO attendances VALUES('46','0007176026','1','11:17:01','','1','2023-03-29 11:17:03','2023-03-29 11:17:03');
INSERT INTO attendances VALUES('65','0007219790','1','10:39:24','12:14:55','1','2023-04-01 10:39:29','2023-04-01 12:14:59');
INSERT INTO attendances VALUES('66','0007176026','1','10:39:33','12:03:10','1','2023-04-01 10:41:50','2023-04-01 12:12:03');
INSERT INTO attendances VALUES('67','30','2','10:41:55','','1','2023-04-01 10:42:16','2023-04-01 10:42:16');
INSERT INTO attendances VALUES('68','40','2','10:43:17','','1','2023-04-01 10:43:25','2023-04-01 10:43:25');
INSERT INTO attendances VALUES('69','30','2','10:18:33','11:09:59','1','2023-04-05 10:18:36','2023-04-05 11:10:02');
INSERT INTO attendances VALUES('70','0007219790','1','10:20:41','','1','2023-04-05 10:20:49','2023-04-05 10:20:49');
INSERT INTO attendances VALUES('71','0007176026','1','10:31:17','','1','2023-04-05 10:31:26','2023-04-05 10:31:26');
INSERT INTO attendances VALUES('72','40','2','12:07:45','','1','2023-04-05 12:09:07','2023-04-05 12:09:07');
INSERT INTO attendances VALUES('73','0007176026','1','11:14:57','','1','2023-04-06 11:15:13','2023-04-06 11:15:13');
INSERT INTO attendances VALUES('74','0007176026','1','10:07:23','','1','2023-04-09 10:07:37','2023-04-09 10:07:37');
INSERT INTO attendances VALUES('75','0007219790','1','10:07:48','','1','2023-04-09 10:08:26','2023-04-09 10:08:26');
INSERT INTO attendances VALUES('76','0007219790','1','10:00:30','','1','2023-04-11 10:01:38','2023-04-11 10:01:38');
INSERT INTO attendances VALUES('77','0007176026','1','10:01:41','','1','2023-04-11 10:02:08','2023-04-11 10:02:08');
INSERT INTO attendances VALUES('78','1001','1','11:32:13','','1','2023-04-11 12:06:14','2023-04-11 12:06:14');
INSERT INTO attendances VALUES('84','0007176026','1','10:19:50','','1','2023-11-12 10:20:03','2023-11-12 10:20:03');
INSERT INTO attendances VALUES('85','0007219790','1','10:19:50','','1','2023-11-12 10:20:11','2023-11-12 10:20:11');
INSERT INTO attendances VALUES('86','0007250470','2','10:19:50','','1','2023-11-12 10:20:20','2023-11-12 10:20:20');



DROP TABLE IF EXISTS blog_categories;

CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO blog_categories VALUES('7','Vehicle ','control mechanisms which a notice is sent to the registered','','1','2022-12-27 10:04:21','2022-12-27 10:04:21');
INSERT INTO blog_categories VALUES('8','Driver','control mechanisms which a notice is sent to the registered','Is this the right.png','3','2022-12-27 10:04:44','2022-12-27 10:04:44');
INSERT INTO blog_categories VALUES('9','User Account','control mechanisms which a notice is sent to the registered','Is this the right.png','3','2022-12-27 10:06:44','2022-12-27 10:06:44');
INSERT INTO blog_categories VALUES('10','Packages','control mechanisms which a notice is sent to the registered','Is this the right.png','2','2022-12-27 10:07:41','2022-12-27 10:07:41');
INSERT INTO blog_categories VALUES('11','Booking System','control mechanisms which a notice is sent to the registered','','3','2022-12-27 10:32:27','2022-12-27 10:32:27');
INSERT INTO blog_categories VALUES('12','Test','control mechanisms which a notice is sent to the registered','1.png','3','2022-12-27 10:32:39','2022-12-27 10:32:39');
INSERT INTO blog_categories VALUES('13','Private Car','control mechanisms which a notice is sent to the registered','download.jpg','2','2022-12-29 12:43:49','2022-12-29 12:43:49');
INSERT INTO blog_categories VALUES('14','Bangladesh navy motor transport workshop','control mechanisms which a notice is sent to the registered','','2','2023-01-02 11:30:09','2023-01-02 11:30:09');



DROP TABLE IF EXISTS blogs;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `blog_img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_link_fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_link_gg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO blogs VALUES('26','7','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium','<p>\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>','1','blog_img1672550835.jpg','sed-ut-perspiciatis-unde-omnis-iste-natus-error-sit-voluptatem-accusantium','https://www.facebook.com/mdfaridhossain24','https://www.facebook.com/mdfaridhossain24','2023-01-01 05:27:15','2023-01-01 05:27:15');
INSERT INTO blogs VALUES('28','7','On the other hand, we denounce with righteous indignation','<p>\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>','1','blog_img1672550913.jpg','on-the-other-hand-we-denounce-with-righteous-indignation','https://www.facebook.com/mdfaridhossain24','https://www.facebook.com/mdfaridhossain24','2023-01-01 05:28:34','2023-01-01 05:28:34');



DROP TABLE IF EXISTS chart_of_accounts;

CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chart_of_accounts VALUES('1','Trip Income','income','1','2022-11-01 11:06:17','2022-11-01 11:06:17');
INSERT INTO chart_of_accounts VALUES('2','Purchase','expense','1','2022-12-08 12:05:07','2022-12-08 12:05:07');
INSERT INTO chart_of_accounts VALUES('3','Trip_Income','income','2','2023-01-02 13:11:10','2023-01-02 13:11:10');
INSERT INTO chart_of_accounts VALUES('4','Driver Expense','expense','1','2023-01-11 11:20:43','2023-01-11 11:20:43');
INSERT INTO chart_of_accounts VALUES('5','Bakshish','expense','1','2023-01-24 16:44:27','2023-01-24 16:44:27');
INSERT INTO chart_of_accounts VALUES('6','Fuel','expense','1','2023-02-02 12:03:03','2023-02-02 12:03:03');



DROP TABLE IF EXISTS chat_group_users;

CREATE TABLE `chat_group_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS chat_groups;

CREATE TABLE `chat_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS chat_messages;

CREATE TABLE `chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from` bigint NOT NULL,
  `to` bigint NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS cm_email_subscribers;

CREATE TABLE `cm_email_subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS cm_faqs;

CREATE TABLE `cm_faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cm_faqs VALUES('1','a:2:{s:6:\"Bangla\";s:19:\"How Can I register?\";s:7:\"English\";s:19:\"How Can I register?\";}','a:2:{s:6:\"Bangla\";s:52:\"<p>Click to Sign Up button and fill up the form.</p>\";s:7:\"English\";s:52:\"<p>Click to Sign Up button and fill up the form.</p>\";}','2023-11-12 16:23:17','2023-11-12 16:23:17');



DROP TABLE IF EXISTS cm_features;

CREATE TABLE `cm_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cm_features VALUES('1','<i class=\'lni lni-package\'></i>','Easy Accounting','Manage Account without any accounting knowledge','','');
INSERT INTO cm_features VALUES('2','<i class=\'lni lni-files\'></i>','Invoice','Create professional Invoice and accept online payments','','');
INSERT INTO cm_features VALUES('3','<i class=\'lni lni-user\'></i>','CRM','Contacts with Contact Group and Rich Customer Portal','','');
INSERT INTO cm_features VALUES('4','<i class=\'lni lni-phone-set\'></i>','Leads','Manage leads from different lead sources with kanban view','','');
INSERT INTO cm_features VALUES('5','<i class=\'lni lni-briefcase\'></i>','Projects','Manage different types of projects with milestone','','');
INSERT INTO cm_features VALUES('6','<i class=\'lni lni-alarm\'></i>','Tasks','Manage tasks with kanban view and assign task to staff','','');
INSERT INTO cm_features VALUES('7','<i class=\'lni lni-empty-file\'></i>','Quotation','Create Professional Quotation for getting customer attention','','');
INSERT INTO cm_features VALUES('8','<i class=\'lni lni-facebook-messenger\'></i>','Live Chat','Real time Chat with staffs, customers and private groups','','');
INSERT INTO cm_features VALUES('9','<i class=\'lni lni-credit-cards\'></i>','Online Payments','Accept Online Payments from Clients','','');



DROP TABLE IF EXISTS companies;

CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int unsigned NOT NULL,
  `package_id` int DEFAULT NULL,
  `package_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` date NOT NULL,
  `last_email` date DEFAULT NULL,
  `staff_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacts_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drivers_limit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicles_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `invoice_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_transaction` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_chat` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_manager` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_module` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_module` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrm_module` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_module` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_management_module` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_payment` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_panel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO companies VALUES('1','ABC Public School & College','1','3','monthly','member','2028-04-27','','30','3','3','0','300','300','Yes','Yes','Yes','Yes','','','','No','Yes','Yes','2022-11-01 10:19:42','2023-11-09 13:02:27');
INSERT INTO companies VALUES('28','Mizbah School & College','1','1','monthly','trial','2023-11-14','','','500','','No','','','','','','','','','','','','No','2023-11-07 15:12:53','2023-11-07 15:12:53');
INSERT INTO companies VALUES('29','Test School & College','1','1','monthly','trial','2023-11-16','','','500','','No','','','','','','','','','','','','No','2023-11-09 15:41:17','2023-11-09 15:41:17');



DROP TABLE IF EXISTS company_email_template;

CREATE TABLE `company_email_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_email_template VALUES('1','Transport','Test','<p><strong>Hello,&nbsp;</strong></p>
<p><strong>This is test SMS<br /><br />Regards.</strong></p>','invoice','1','2022-12-22 12:14:21','2022-12-22 12:14:21');



DROP TABLE IF EXISTS company_settings;

CREATE TABLE `company_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_settings VALUES('1','invoice_starting','1082','1','2022-11-01 11:04:23','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('2','default_account','1','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('3','default_chart_id','1','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('4','paypal_active','no','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('5','paypal_currency','USD','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('6','paypal_email','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('7','stripe_active','no','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('8','stripe_currency','USD','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('9','stripe_secret_key','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('10','stripe_publishable_key','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('11','razorpay_active','no','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('12','razorpay_currency','INR','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('13','razorpay_key_id','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('14','razorpay_secret_key','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('15','paystack_active','no','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('16','paystack_public_key','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('17','paystack_secret_key','','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('18','paystack_currency','GHS','1','2022-11-01 11:11:34','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('19','base_currency','BDT','1','2022-11-01 11:11:58','2022-11-01 11:11:58');
INSERT INTO company_settings VALUES('20','currency_position','right','1','2022-11-01 11:11:58','2022-11-01 11:11:58');
INSERT INTO company_settings VALUES('21','backend_direction','ltr','1','2022-11-01 11:11:58','2023-03-01 10:17:45');
INSERT INTO company_settings VALUES('22','timezone','Asia/Dhaka','1','2022-11-01 11:11:58','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('23','date_format','d-m-Y','1','2022-11-01 11:11:58','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('24','time_format','12','1','2022-11-01 11:11:58','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('25','quotation_starting','1','1','2022-12-14 14:29:01','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('26','company_name','ABC Public School & College','1','2022-12-18 11:43:19','2023-11-07 12:06:39');
INSERT INTO company_settings VALUES('27','phone','01615352866','1','2022-12-18 11:43:19','2023-11-07 12:06:39');
INSERT INTO company_settings VALUES('28','vat_id','','1','2022-12-18 11:43:19','2023-02-22 16:25:29');
INSERT INTO company_settings VALUES('29','reg_no','','1','2022-12-18 11:43:19','2023-11-07 12:06:39');
INSERT INTO company_settings VALUES('30','email','abcmail@mail.com','1','2022-12-18 11:43:19','2023-11-07 12:06:39');
INSERT INTO company_settings VALUES('31','address','House 3, Road No-9/B, Uttara 5 no. Sector Dhaka','1','2022-12-18 11:43:19','2023-11-07 12:06:39');
INSERT INTO company_settings VALUES('32','invoice_prefix','ATA','1','2022-12-21 17:42:48','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('33','quotation_prefix','QATA','1','2022-12-21 17:42:48','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('34','invoice_footer','<p>Powered by&nbsp;Akand Transport Agency</p>','1','2022-12-21 17:42:48','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('35','quotation_footer','','1','2022-12-21 17:42:48','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('36','sms_api_link','http://bulksmsbd.net/api/smsapi?api_key=IBPJuXuI2JXlzglJkS3Z&type=text&senderid=8809612440788','1','2022-12-22 11:16:52','2023-11-07 11:45:11');
INSERT INTO company_settings VALUES('37','sms_api_username','01689655055','1','2022-12-22 11:16:52','2022-12-22 11:37:11');
INSERT INTO company_settings VALUES('38','sms_api_password','01689655055','1','2022-12-22 11:16:52','2022-12-22 11:37:11');
INSERT INTO company_settings VALUES('39','invoice_prefix','MTC','2','2023-01-02 11:57:44','2023-01-02 11:57:44');
INSERT INTO company_settings VALUES('40','invoice_starting','1007','2','2023-01-02 11:57:44','2023-01-02 13:31:47');
INSERT INTO company_settings VALUES('41','quotation_prefix','','2','2023-01-02 11:57:44','2023-01-02 11:57:44');
INSERT INTO company_settings VALUES('42','quotation_starting','1001','2','2023-01-02 11:57:44','2023-01-02 11:57:44');
INSERT INTO company_settings VALUES('43','invoice_footer','','2','2023-01-02 11:57:44','2023-01-02 11:57:44');
INSERT INTO company_settings VALUES('44','quotation_footer','','2','2023-01-02 11:57:44','2023-01-02 11:57:44');
INSERT INTO company_settings VALUES('45','sms_api_link','http://66.45.237.70/api.php?','2','2023-01-02 13:06:59','2023-01-02 13:06:59');
INSERT INTO company_settings VALUES('46','sms_api_username','01689655055','2','2023-01-02 13:06:59','2023-01-02 13:06:59');
INSERT INTO company_settings VALUES('47','sms_api_password','01689655055','2','2023-01-02 13:06:59','2023-01-02 13:06:59');
INSERT INTO company_settings VALUES('48','ssl_active','yes','1','2023-01-07 11:37:56','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('49','ssl_currency','BDT','1','2023-01-07 11:37:56','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('51','ssl_store_id','softw63b257c889fa3','1','2023-01-07 12:25:03','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('52','ssl_store_pswd','softw63b257c889fa3@ssl','1','2023-01-07 12:25:03','2023-01-07 12:25:03');
INSERT INTO company_settings VALUES('53','product_active','no','1','2023-01-08 12:13:06','2023-01-24 15:38:00');
INSERT INTO company_settings VALUES('54','max_entry_time','10','1','2023-02-15 14:27:35','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('55','duration_time','30','1','2023-02-15 14:27:35','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('56','company_logo','company_logo1677061617.png','1','2023-02-16 13:01:00','2023-02-22 16:26:57');
INSERT INTO company_settings VALUES('57','default_holidays','Friday,Saturday','1','2023-11-05 12:28:33','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('58','access_code','1234','1','2023-11-05 12:28:33','2023-11-06 12:44:49');
INSERT INTO company_settings VALUES('59','friday_holiday','yes','1','2023-11-05 12:30:49','2023-11-05 12:30:49');
INSERT INTO company_settings VALUES('61','duration_time','20','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('60','max_entry_time','10','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('62','timezone','Asia/Dhaka','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('63','date_format','Y-m-d','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('64','time_format','24','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('65','default_holidays','Friday,Saturday','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('66','access_code','1234','27','2023-11-07 11:19:24','2023-11-07 11:19:24');
INSERT INTO company_settings VALUES('67','institute_short_name','ABCPSC','1','2023-11-07 12:06:39','2023-11-07 12:06:39');



DROP TABLE IF EXISTS company_sms_templates;

CREATE TABLE `company_sms_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_sms_templates VALUES('2','Enter','Student Exit','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is entered at {enter_time}</pre>','enter','1','1','2023-03-28 14:36:48','2023-11-08 10:43:11');
INSERT INTO company_sms_templates VALUES('8','Enter','Student Enter','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is entered at {enter_time}</pre>','enter','1','29','2023-11-09 15:41:19','2023-11-09 15:41:19');
INSERT INTO company_sms_templates VALUES('3','Exit','Exit Message','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is exited at {exit_time}</pre>','exit','1','1','2023-03-28 14:39:57','2023-04-01 12:14:35');
INSERT INTO company_sms_templates VALUES('4','Entry Sms','','<pre class=\"border border-info p-2\">{student_name} is entered at {enter_time}. Regards {company_short_name}</pre>
<p>&nbsp;</p>','enter','1','27','2023-11-07 12:39:44','2023-11-07 12:40:24');
INSERT INTO company_sms_templates VALUES('5','Enter','Student Enter','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is entered at {enter_time}</pre>','enter','1','28','2023-11-07 15:12:54','2023-11-07 15:15:06');
INSERT INTO company_sms_templates VALUES('6','Exit','Exit Message','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is exited at {exit_time}</pre>','exit','1','28','2023-11-07 15:12:54','2023-11-07 15:12:54');
INSERT INTO company_sms_templates VALUES('7','Absent','Absent Message','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is absent today</pre>','absent','1','28','2023-11-07 15:12:54','2023-11-07 15:12:54');
INSERT INTO company_sms_templates VALUES('9','Exit','Exit Message','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is exited at {exit_time}</pre>','exit','1','29','2023-11-09 15:41:19','2023-11-09 15:41:19');
INSERT INTO company_sms_templates VALUES('10','Absent','Absent Message','<pre class=\"border border-info p-2\">{student_name} ({id_no}) is absent today</pre>','absent','1','29','2023-11-09 15:41:19','2023-11-09 15:41:19');



DROP TABLE IF EXISTS contact_groups;

CREATE TABLE `contact_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO contact_groups VALUES('1','Regular','','1','2022-11-01 10:59:23','2022-11-01 10:59:23');
INSERT INTO contact_groups VALUES('2','Test','','2','2022-12-06 11:50:51','2022-12-06 11:50:51');
INSERT INTO contact_groups VALUES('3','hghf','','2','2022-12-06 11:58:14','2022-12-06 11:58:14');



DROP TABLE IF EXISTS contacts;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `profile_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `contact_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO contacts VALUES('1','1','Individual','','Mizbah','mizbah@gmail.com','','0007219790','01521484948','','BDT','','','','Sholoshahar 2no. gate','','','','','contact_image1676435318.jpeg','1','4','1','','2023-02-01 10:31:19','2023-03-15 16:43:46');
INSERT INTO contacts VALUES('7','1','','','Farid','farid@gmail.com','','0007176026','01309323741','','BDT','','','','House 3, Road 9/B, Uttara, Dhaka','','','','','contact_image1676435279.jpg','1','','1','','2023-02-09 10:57:03','2023-03-15 16:39:34');
INSERT INTO contacts VALUES('8','2','','','John','j@gmail.com','','30','01615352866','','BDT','','','','Road: 1/2, Uttara , Dhaka','','','','','avatar.png','1','','1','','2023-03-27 10:41:34','2023-03-27 10:41:34');
INSERT INTO contacts VALUES('9','2','','','Arif Ovi','arif@gmail.com','','40','01613477581','','BDT','','','','test area Dhaka','','','','','avatar.png','1','','1','','2023-03-27 10:49:29','2023-03-27 10:49:29');
INSERT INTO contacts VALUES('10','1','','','Test','','','1001','01212313','','BDT','','','','','','','','','avatar.png','1','','1','','2023-04-06 14:54:49','2023-04-11 10:01:06');
INSERT INTO contacts VALUES('11','2','','','Sinhath','sin@gmail.com','','0007250470','012324242542','','BDT','','','','Gazipur','','','','','contact_image1699513347.jpg','1','','1','','2023-11-09 13:02:27','2023-11-09 13:02:27');



DROP TABLE IF EXISTS currency_rates;

CREATE TABLE `currency_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currency_rates VALUES('1','AED','4.101083','','');
INSERT INTO currency_rates VALUES('2','AFN','85.378309','','');
INSERT INTO currency_rates VALUES('3','ALL','123.510844','','');
INSERT INTO currency_rates VALUES('4','AMD','548.849773','','');
INSERT INTO currency_rates VALUES('5','ANG','2.008050','','');
INSERT INTO currency_rates VALUES('6','AOA','556.155120','','');
INSERT INTO currency_rates VALUES('7','ARS','70.205746','','');
INSERT INTO currency_rates VALUES('8','AUD','1.809050','','');
INSERT INTO currency_rates VALUES('9','AWG','2.009782','','');
INSERT INTO currency_rates VALUES('10','AZN','1.833159','','');
INSERT INTO currency_rates VALUES('11','BAM','1.966840','','');
INSERT INTO currency_rates VALUES('12','BBD','2.245460','','');
INSERT INTO currency_rates VALUES('13','BDT','95.162306','','');
INSERT INTO currency_rates VALUES('14','BGN','1.952383','','');
INSERT INTO currency_rates VALUES('15','BHD','0.421787','','');
INSERT INTO currency_rates VALUES('16','BIF','2117.865003','','');
INSERT INTO currency_rates VALUES('17','BMD','1.116545','','');
INSERT INTO currency_rates VALUES('18','BND','1.583270','','');
INSERT INTO currency_rates VALUES('19','BOB','7.718004','','');
INSERT INTO currency_rates VALUES('20','BRL','5.425949','','');
INSERT INTO currency_rates VALUES('21','BSD','1.121775','','');
INSERT INTO currency_rates VALUES('22','BTC','0.000244','','');
INSERT INTO currency_rates VALUES('23','BTN','82.818317','','');
INSERT INTO currency_rates VALUES('24','BWP','12.683055','','');
INSERT INTO currency_rates VALUES('25','BYN','2.621037','','');
INSERT INTO currency_rates VALUES('26','BYR','9999.999999','','');
INSERT INTO currency_rates VALUES('27','BZD','2.261248','','');
INSERT INTO currency_rates VALUES('28','CAD','1.552879','','');
INSERT INTO currency_rates VALUES('29','CDF','1898.127343','','');
INSERT INTO currency_rates VALUES('30','CHF','1.056023','','');
INSERT INTO currency_rates VALUES('31','CLF','0.033950','','');
INSERT INTO currency_rates VALUES('32','CLP','936.781769','','');
INSERT INTO currency_rates VALUES('33','CNY','7.827878','','');
INSERT INTO currency_rates VALUES('34','COP','4491.872864','','');
INSERT INTO currency_rates VALUES('35','CRC','635.520417','','');
INSERT INTO currency_rates VALUES('36','CUC','1.116545','','');
INSERT INTO currency_rates VALUES('37','CUP','29.588450','','');
INSERT INTO currency_rates VALUES('38','CVE','110.887227','','');
INSERT INTO currency_rates VALUES('39','CZK','26.906059','','');
INSERT INTO currency_rates VALUES('40','DJF','198.432393','','');
INSERT INTO currency_rates VALUES('41','DKK','7.472892','','');
INSERT INTO currency_rates VALUES('42','DOP','60.196240','','');
INSERT INTO currency_rates VALUES('43','DZD','134.499489','','');
INSERT INTO currency_rates VALUES('44','EGP','17.585483','','');
INSERT INTO currency_rates VALUES('45','ERN','16.748349','','');
INSERT INTO currency_rates VALUES('46','ETB','36.696587','','');
INSERT INTO currency_rates VALUES('47','EUR','1.000000','','');
INSERT INTO currency_rates VALUES('48','FJD','2.549240','','');
INSERT INTO currency_rates VALUES('49','FKP','0.908257','','');
INSERT INTO currency_rates VALUES('50','GBP','0.907964','','');
INSERT INTO currency_rates VALUES('51','GEL','3.115301','','');
INSERT INTO currency_rates VALUES('52','GGP','0.908257','','');
INSERT INTO currency_rates VALUES('53','GHS','6.220337','','');
INSERT INTO currency_rates VALUES('54','GIP','0.908257','','');
INSERT INTO currency_rates VALUES('55','GMD','56.605069','','');
INSERT INTO currency_rates VALUES('56','GNF','9999.999999','','');
INSERT INTO currency_rates VALUES('57','GTQ','8.576324','','');
INSERT INTO currency_rates VALUES('58','GYD','234.489495','','');
INSERT INTO currency_rates VALUES('59','HKD','8.674753','','');
INSERT INTO currency_rates VALUES('60','HNL','27.678062','','');
INSERT INTO currency_rates VALUES('61','HRK','7.590196','','');
INSERT INTO currency_rates VALUES('62','HTG','106.356510','','');
INSERT INTO currency_rates VALUES('63','HUF','341.150311','','');
INSERT INTO currency_rates VALUES('64','IDR','9999.999999','','');
INSERT INTO currency_rates VALUES('65','ILS','4.159226','','');
INSERT INTO currency_rates VALUES('66','IMP','0.908257','','');
INSERT INTO currency_rates VALUES('67','INR','82.763894','','');
INSERT INTO currency_rates VALUES('68','IQD','1339.198712','','');
INSERT INTO currency_rates VALUES('69','IRR','9999.999999','','');
INSERT INTO currency_rates VALUES('70','ISK','151.202539','','');
INSERT INTO currency_rates VALUES('71','JEP','0.908257','','');
INSERT INTO currency_rates VALUES('72','JMD','151.606351','','');
INSERT INTO currency_rates VALUES('73','JOD','0.791685','','');
INSERT INTO currency_rates VALUES('74','JPY','118.278988','','');
INSERT INTO currency_rates VALUES('75','KES','115.283224','','');
INSERT INTO currency_rates VALUES('76','KGS','81.395812','','');
INSERT INTO currency_rates VALUES('77','KHR','4603.144194','','');
INSERT INTO currency_rates VALUES('78','KMF','495.355724','','');
INSERT INTO currency_rates VALUES('79','KPW','1004.922902','','');
INSERT INTO currency_rates VALUES('80','KRW','1372.190164','','');
INSERT INTO currency_rates VALUES('81','KWD','0.344879','','');
INSERT INTO currency_rates VALUES('82','KYD','0.934921','','');
INSERT INTO currency_rates VALUES('83','KZT','456.318281','','');
INSERT INTO currency_rates VALUES('84','LAK','9978.233671','','');
INSERT INTO currency_rates VALUES('85','LBP','1696.373291','','');
INSERT INTO currency_rates VALUES('86','LKR','206.967335','','');
INSERT INTO currency_rates VALUES('87','LRD','221.076044','','');
INSERT INTO currency_rates VALUES('88','LSL','18.121543','','');
INSERT INTO currency_rates VALUES('89','LTL','3.296868','','');
INSERT INTO currency_rates VALUES('90','LVL','0.675387','','');
INSERT INTO currency_rates VALUES('91','LYD','1.557311','','');
INSERT INTO currency_rates VALUES('92','MAD','10.730569','','');
INSERT INTO currency_rates VALUES('93','MDL','19.734707','','');
INSERT INTO currency_rates VALUES('94','MGA','4165.265277','','');
INSERT INTO currency_rates VALUES('95','MKD','61.516342','','');
INSERT INTO currency_rates VALUES('96','MMK','1566.586511','','');
INSERT INTO currency_rates VALUES('97','MNT','3088.650418','','');
INSERT INTO currency_rates VALUES('98','MOP','8.975925','','');
INSERT INTO currency_rates VALUES('99','MRO','398.607011','','');
INSERT INTO currency_rates VALUES('100','MUR','43.205754','','');
INSERT INTO currency_rates VALUES('101','MVR','17.250725','','');
INSERT INTO currency_rates VALUES('102','MWK','825.239292','','');
INSERT INTO currency_rates VALUES('103','MXN','24.963329','','');
INSERT INTO currency_rates VALUES('104','MYR','4.810633','','');
INSERT INTO currency_rates VALUES('105','MZN','73.591410','','');
INSERT INTO currency_rates VALUES('106','NAD','18.121621','','');
INSERT INTO currency_rates VALUES('107','NGN','408.099790','','');
INSERT INTO currency_rates VALUES('108','NIO','37.844015','','');
INSERT INTO currency_rates VALUES('109','NOK','11.405599','','');
INSERT INTO currency_rates VALUES('110','NPR','132.508354','','');
INSERT INTO currency_rates VALUES('111','NZD','1.847363','','');
INSERT INTO currency_rates VALUES('112','OMR','0.429801','','');
INSERT INTO currency_rates VALUES('113','PAB','1.121880','','');
INSERT INTO currency_rates VALUES('114','PEN','3.958258','','');
INSERT INTO currency_rates VALUES('115','PGK','3.838505','','');
INSERT INTO currency_rates VALUES('116','PHP','57.698037','','');
INSERT INTO currency_rates VALUES('117','PKR','176.121721','','');
INSERT INTO currency_rates VALUES('118','PLN','4.386058','','');
INSERT INTO currency_rates VALUES('119','PYG','7386.917924','','');
INSERT INTO currency_rates VALUES('120','QAR','4.065302','','');
INSERT INTO currency_rates VALUES('121','RON','4.826717','','');
INSERT INTO currency_rates VALUES('122','RSD','117.627735','','');
INSERT INTO currency_rates VALUES('123','RUB','83.568390','','');
INSERT INTO currency_rates VALUES('124','RWF','1067.822267','','');
INSERT INTO currency_rates VALUES('125','SAR','4.190432','','');
INSERT INTO currency_rates VALUES('126','SBD','9.235251','','');
INSERT INTO currency_rates VALUES('127','SCR','14.529548','','');
INSERT INTO currency_rates VALUES('128','SDG','61.772847','','');
INSERT INTO currency_rates VALUES('129','SEK','10.785247','','');
INSERT INTO currency_rates VALUES('130','SGD','1.587844','','');
INSERT INTO currency_rates VALUES('131','SHP','0.908257','','');
INSERT INTO currency_rates VALUES('132','SLL','9999.999999','','');
INSERT INTO currency_rates VALUES('133','SOS','653.732410','','');
INSERT INTO currency_rates VALUES('134','SRD','8.327212','','');
INSERT INTO currency_rates VALUES('135','STD','9999.999999','','');
INSERT INTO currency_rates VALUES('136','SVC','9.816821','','');
INSERT INTO currency_rates VALUES('137','SYP','575.019506','','');
INSERT INTO currency_rates VALUES('138','SZL','18.038821','','');
INSERT INTO currency_rates VALUES('139','THB','35.884679','','');
INSERT INTO currency_rates VALUES('140','TJS','10.875343','','');
INSERT INTO currency_rates VALUES('141','TMT','3.907909','','');
INSERT INTO currency_rates VALUES('142','TND','3.186636','','');
INSERT INTO currency_rates VALUES('143','TOP','2.635661','','');
INSERT INTO currency_rates VALUES('144','TRY','7.131927','','');
INSERT INTO currency_rates VALUES('145','TTD','7.585158','','');
INSERT INTO currency_rates VALUES('146','TWD','33.739208','','');
INSERT INTO currency_rates VALUES('147','TZS','2582.397529','','');
INSERT INTO currency_rates VALUES('148','UAH','29.335146','','');
INSERT INTO currency_rates VALUES('149','UGX','4169.685347','','');
INSERT INTO currency_rates VALUES('150','USD','1.116545','','');
INSERT INTO currency_rates VALUES('151','UYU','48.718630','','');
INSERT INTO currency_rates VALUES('152','UZS','9999.999999','','');
INSERT INTO currency_rates VALUES('153','VEF','11.151499','','');
INSERT INTO currency_rates VALUES('154','VND','9999.999999','','');
INSERT INTO currency_rates VALUES('155','VUV','133.944917','','');
INSERT INTO currency_rates VALUES('156','WST','3.074259','','');
INSERT INTO currency_rates VALUES('157','XAF','659.652615','','');
INSERT INTO currency_rates VALUES('158','XAG','0.088073','','');
INSERT INTO currency_rates VALUES('159','XAU','0.000756','','');
INSERT INTO currency_rates VALUES('160','XCD','3.017519','','');
INSERT INTO currency_rates VALUES('161','XDR','0.809234','','');
INSERT INTO currency_rates VALUES('162','XOF','659.646672','','');
INSERT INTO currency_rates VALUES('163','XPF','119.931356','','');
INSERT INTO currency_rates VALUES('164','YER','279.475009','','');
INSERT INTO currency_rates VALUES('165','ZAR','18.603040','','');
INSERT INTO currency_rates VALUES('166','ZMK','9999.999999','','');
INSERT INTO currency_rates VALUES('167','ZMW','17.892580','','');
INSERT INTO currency_rates VALUES('168','ZWL','359.527584','','');



DROP TABLE IF EXISTS current_stocks;

CREATE TABLE `current_stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO current_stocks VALUES('1','2','1.00','1','2022-12-08 12:02:51','2023-01-07 10:59:39');
INSERT INTO current_stocks VALUES('2','3','0.00','1','2022-12-10 15:31:19','2022-12-10 15:31:19');
INSERT INTO current_stocks VALUES('3','4','0.00','1','2022-12-14 11:21:44','2022-12-14 11:21:44');



DROP TABLE IF EXISTS districts;

CREATE TABLE `districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO districts VALUES('1','1','Comilla','কুমিল্লা','23.4682747','91.1788135','www.comilla.gov.bd','','');
INSERT INTO districts VALUES('2','1','Feni','ফেনী','23.023231','91.3840844','www.feni.gov.bd','','');
INSERT INTO districts VALUES('3','1','Brahmanbaria','ব্রাহ্মণবাড়িয়া','23.9570904','91.1119286','www.brahmanbaria.gov.bd','','');
INSERT INTO districts VALUES('4','1','Rangamati','রাঙ্গামাটি','','','www.rangamati.gov.bd','','');
INSERT INTO districts VALUES('5','1','Noakhali','নোয়াখালী','22.869563','91.099398','www.noakhali.gov.bd','','');
INSERT INTO districts VALUES('6','1','Chandpur','চাঁদপুর','23.2332585','90.6712912','www.chandpur.gov.bd','','');
INSERT INTO districts VALUES('7','1','Lakshmipur','লক্ষ্মীপুর','22.942477','90.841184','www.lakshmipur.gov.bd','','');
INSERT INTO districts VALUES('8','1','Chattogram','চট্টগ্রাম','22.335109','91.834073','www.chittagong.gov.bd','','');
INSERT INTO districts VALUES('9','1','Coxsbazar','কক্সবাজার','','','www.coxsbazar.gov.bd','','');
INSERT INTO districts VALUES('10','1','Khagrachhari','খাগড়াছড়ি','23.119285','91.984663','www.khagrachhari.gov.bd','','');
INSERT INTO districts VALUES('11','1','Bandarban','বান্দরবান','22.1953275','92.2183773','www.bandarban.gov.bd','','');
INSERT INTO districts VALUES('12','2','Sirajganj','সিরাজগঞ্জ','24.4533978','89.7006815','www.sirajganj.gov.bd','','');
INSERT INTO districts VALUES('13','2','Pabna','পাবনা','23.998524','89.233645','www.pabna.gov.bd','','');
INSERT INTO districts VALUES('14','2','Bogura','বগুড়া','24.8465228','89.377755','www.bogra.gov.bd','','');
INSERT INTO districts VALUES('15','2','Rajshahi','রাজশাহী','','','www.rajshahi.gov.bd','','');
INSERT INTO districts VALUES('16','2','Natore','নাটোর','24.420556','89.000282','www.natore.gov.bd','','');
INSERT INTO districts VALUES('17','2','Joypurhat','জয়পুরহাট','','','www.joypurhat.gov.bd','','');
INSERT INTO districts VALUES('18','2','Chapainawabganj','চাঁপাইনবাবগঞ্জ','24.5965034','88.2775122','www.chapainawabganj.gov.bd','','');
INSERT INTO districts VALUES('19','2','Naogaon','নওগাঁ','','','www.naogaon.gov.bd','','');
INSERT INTO districts VALUES('20','3','Jashore','যশোর','23.16643','89.2081126','www.jessore.gov.bd','','');
INSERT INTO districts VALUES('21','3','Satkhira','সাতক্ষীরা','','','www.satkhira.gov.bd','','');
INSERT INTO districts VALUES('22','3','Meherpur','মেহেরপুর','23.762213','88.631821','www.meherpur.gov.bd','','');
INSERT INTO districts VALUES('23','3','Narail','নড়াইল','23.172534','89.512672','www.narail.gov.bd','','');
INSERT INTO districts VALUES('24','3','Chuadanga','চুয়াডাঙ্গা','23.6401961','88.841841','www.chuadanga.gov.bd','','');
INSERT INTO districts VALUES('25','3','Kushtia','কুষ্টিয়া','23.901258','89.120482','www.kushtia.gov.bd','','');
INSERT INTO districts VALUES('26','3','Magura','মাগুরা','23.487337','89.419956','www.magura.gov.bd','','');
INSERT INTO districts VALUES('27','3','Khulna','খুলনা','22.815774','89.568679','www.khulna.gov.bd','','');
INSERT INTO districts VALUES('28','3','Bagerhat','বাগেরহাট','22.651568','89.785938','www.bagerhat.gov.bd','','');
INSERT INTO districts VALUES('29','3','Jhenaidah','ঝিনাইদহ','23.5448176','89.1539213','www.jhenaidah.gov.bd','','');
INSERT INTO districts VALUES('30','4','Jhalakathi','ঝালকাঠি','','','www.jhalakathi.gov.bd','','');
INSERT INTO districts VALUES('31','4','Patuakhali','পটুয়াখালী','22.3596316','90.3298712','www.patuakhali.gov.bd','','');
INSERT INTO districts VALUES('32','4','Pirojpur','পিরোজপুর','','','www.pirojpur.gov.bd','','');
INSERT INTO districts VALUES('33','4','Barisal','বরিশাল','','','www.barisal.gov.bd','','');
INSERT INTO districts VALUES('34','4','Bhola','ভোলা','22.685923','90.648179','www.bhola.gov.bd','','');
INSERT INTO districts VALUES('35','4','Barguna','বরগুনা','','','www.barguna.gov.bd','','');
INSERT INTO districts VALUES('36','5','Sylhet','সিলেট','24.8897956','91.8697894','www.sylhet.gov.bd','','');
INSERT INTO districts VALUES('37','5','Moulvibazar','মৌলভীবাজার','24.482934','91.777417','www.moulvibazar.gov.bd','','');
INSERT INTO districts VALUES('38','5','Habiganj','হবিগঞ্জ','24.374945','91.41553','www.habiganj.gov.bd','','');
INSERT INTO districts VALUES('39','5','Sunamganj','সুনামগঞ্জ','25.0658042','91.3950115','www.sunamganj.gov.bd','','');
INSERT INTO districts VALUES('40','6','Narsingdi','নরসিংদী','23.932233','90.71541','www.narsingdi.gov.bd','','');
INSERT INTO districts VALUES('41','6','Gazipur','গাজীপুর','24.0022858','90.4264283','www.gazipur.gov.bd','','');
INSERT INTO districts VALUES('42','6','Shariatpur','শরীয়তপুর','','','www.shariatpur.gov.bd','','');
INSERT INTO districts VALUES('43','6','Narayanganj','নারায়ণগঞ্জ','23.63366','90.496482','www.narayanganj.gov.bd','','');
INSERT INTO districts VALUES('44','6','Tangail','টাঙ্গাইল','','','www.tangail.gov.bd','','');
INSERT INTO districts VALUES('45','6','Kishoreganj','কিশোরগঞ্জ','24.444937','90.776575','www.kishoreganj.gov.bd','','');
INSERT INTO districts VALUES('46','6','Manikganj','মানিকগঞ্জ','','','www.manikganj.gov.bd','','');
INSERT INTO districts VALUES('47','6','Dhaka','ঢাকা','23.7115253','90.4111451','www.dhaka.gov.bd','','');
INSERT INTO districts VALUES('48','6','Munshiganj','মুন্সিগঞ্জ','','','www.munshiganj.gov.bd','','');
INSERT INTO districts VALUES('49','6','Rajbari','রাজবাড়ী','23.7574305','89.6444665','www.rajbari.gov.bd','','');
INSERT INTO districts VALUES('50','6','Madaripur','মাদারীপুর','23.164102','90.1896805','www.madaripur.gov.bd','','');
INSERT INTO districts VALUES('51','6','Gopalganj','গোপালগঞ্জ','23.0050857','89.8266059','www.gopalganj.gov.bd','','');
INSERT INTO districts VALUES('52','6','Faridpur','ফরিদপুর','23.6070822','89.8429406','www.faridpur.gov.bd','','');
INSERT INTO districts VALUES('53','7','Panchagarh','পঞ্চগড়','26.3411','88.5541606','www.panchagarh.gov.bd','','');
INSERT INTO districts VALUES('54','7','Dinajpur','দিনাজপুর','25.6217061','88.6354504','www.dinajpur.gov.bd','','');
INSERT INTO districts VALUES('55','7','Lalmonirhat','লালমনিরহাট','','','www.lalmonirhat.gov.bd','','');
INSERT INTO districts VALUES('56','7','Nilphamari','নীলফামারী','25.931794','88.856006','www.nilphamari.gov.bd','','');
INSERT INTO districts VALUES('57','7','Gaibandha','গাইবান্ধা','25.328751','89.528088','www.gaibandha.gov.bd','','');
INSERT INTO districts VALUES('58','7','Thakurgaon','ঠাকুরগাঁও','26.0336945','88.4616834','www.thakurgaon.gov.bd','','');
INSERT INTO districts VALUES('59','7','Rangpur','রংপুর','25.7558096','89.244462','www.rangpur.gov.bd','','');
INSERT INTO districts VALUES('60','7','Kurigram','কুড়িগ্রাম','25.805445','89.636174','www.kurigram.gov.bd','','');
INSERT INTO districts VALUES('61','8','Sherpur','শেরপুর','25.0204933','90.0152966','www.sherpur.gov.bd','','');
INSERT INTO districts VALUES('62','8','Mymensingh','ময়মনসিংহ','','','www.mymensingh.gov.bd','','');
INSERT INTO districts VALUES('63','8','Jamalpur','জামালপুর','24.937533','89.937775','www.jamalpur.gov.bd','','');
INSERT INTO districts VALUES('64','8','Netrokona','নেত্রকোণা','24.870955','90.727887','www.netrokona.gov.bd','','');



DROP TABLE IF EXISTS divisions;

CREATE TABLE `divisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO divisions VALUES('1','Chattagram','চট্টগ্রাম','www.chittagongdiv.gov.bd','','');
INSERT INTO divisions VALUES('2','Rajshahi','রাজশাহী','www.rajshahidiv.gov.bd','','');
INSERT INTO divisions VALUES('3','Khulna','খুলনা','www.khulnadiv.gov.bd','','');
INSERT INTO divisions VALUES('4','Barisal','বরিশাল','www.barisaldiv.gov.bd','','');
INSERT INTO divisions VALUES('5','Sylhet','সিলেট','www.sylhetdiv.gov.bd','','');
INSERT INTO divisions VALUES('6','Dhaka','ঢাকা','www.dhakadiv.gov.bd','','');
INSERT INTO divisions VALUES('7','Rangpur','রংপুর','www.rangpurdiv.gov.bd','','');
INSERT INTO divisions VALUES('8','Mymensingh','ময়মনসিংহ','www.mymensinghdiv.gov.bd','','');



DROP TABLE IF EXISTS drivers;

CREATE TABLE `drivers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_issue_date` date NOT NULL,
  `license_expiry_date` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` bigint DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `house_rent` decimal(10,2) DEFAULT NULL,
  `mobile_rent` decimal(10,2) DEFAULT NULL,
  `other_bill` decimal(10,2) DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0=deactive|1=active',
  `company_id` int NOT NULL,
  `temporary` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drivers_license_no_unique` (`license_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO drivers VALUES('1','Sultan','01615352866','RG324 54543','2022-12-01','2023-01-06','test dvdvd dvdsd fdvdvd','profile_picture1671261029.jpeg','license_picture1671261029.png','','','','1997-04-08','','','','','1','1','','2022-12-17 13:10:29','2022-12-17 13:10:33');
INSERT INTO drivers VALUES('2','Monir','01313223423','1234242 2424 2222','2022-09-29','2025-03-07','test sds wdrww sfsf sdfsdsf.','DatMonir.jpeg','license_picture1671346256.png','','','10393424224','2005-01-20','15000.00','500.50','700.09','30.91','1','1','','2022-12-18 12:50:56','2023-01-18 12:33:56');
INSERT INTO drivers VALUES('4','Sultan','01615352866','12123213232','2023-01-01','','','avatar.png','avatar.png','','','','1983-09-23','','','','','1','2','','2023-01-02 12:11:11','2023-01-02 12:11:11');
INSERT INTO drivers VALUES('7','testsd','01521484948','ewerr 6634 erer','2023-01-09','2023-01-13','tedst area','YEDtestsd.jpeg','','','','','1983-09-29','','','','','1','1','1','2023-01-09 15:55:24','2023-01-16 16:07:58');
INSERT INTO drivers VALUES('8','John Test','01615232151','DP0132324343','2005-12-30','2023-01-31','eedfgd','profile_picture1674019633.png','license_picture1674019633.png','papa','mamma','11231232131','2000-06-04','40034.00','','','','1','1','','2023-01-18 11:27:13','2023-01-18 12:32:19');
INSERT INTO drivers VALUES('9','Test','01454546466','DL3424254245','2021-01-22','2026-08-18','Marjal - Kamrabo Rd, Bhairab Bazar-3403, Bangladesh.','SUlTest.jpeg','Tz3Test.png','father','mother','101231312312','1993-03-18','10232.34','200.00','121.00','213.00','1','1','','2023-01-18 12:44:44','2023-01-18 13:04:41');



DROP TABLE IF EXISTS email_templates;

CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_templates VALUES('1','registration','Registration Sucessfully','<div style=\"padding: 15px 30px;\">
<h2 style=\"color: #555555;\">Registration Successful</h2>
<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\">Welcome to Attendance Keeper and thank you for joining with us. You can now sign in to your account using your email and password.<br /><br />Regards<br />Attendance Keeper</span></p>
</div>','','2023-04-01 13:14:51');
INSERT INTO email_templates VALUES('2','premium_membership','Premium Membership','<div style=\"padding: 15px 30px;\">
<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\"><strong>Congratulations</strong> your payment was made sucessfully. Your current membership is valid <strong>until</strong> <strong>{valid_to}</strong></span><span style=\"color: #555555;\"><strong>.</strong>&nbsp;</span></p>
<p style=\"color: #555555;\"><span style=\"color: #555555;\">Thank You</span></p>
</div>','','2023-01-05 12:29:38');
INSERT INTO email_templates VALUES('3','alert_notification','Attendance Keeper Renewals','<div style=\"padding: 15px 30px;\">
<h2 style=\"color: #555555;\">Account Renew Notification</h2>
<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\">Your package is due to <strong>expire on {valid_to}</strong> s</span><span style=\"color: #555555;\">o you will need to renew by then to keep your account active.</span></p>
<p><br style=\"color: #555555;\" /><span style=\"color: #555555;\">Regards</span><br style=\"color: #555555;\" /><span style=\"color: #555555;\">Attendance Keeper</span></p>
</div>','','2023-04-02 10:54:18');



DROP TABLE IF EXISTS file_manager;

CREATE TABLE `file_manager` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_dir` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS files;

CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `related_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS fuels;

CREATE TABLE `fuels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` int NOT NULL,
  `meter_start` decimal(10,2) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `fuel_date` date DEFAULT NULL,
  `fuel_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO fuels VALUES('1','3','10023.32','test','test expense','test note','2023-02-02','nd','1','100.00','500.00','1','2023-02-02 11:34:26','2023-02-02 11:34:26');
INSERT INTO fuels VALUES('2','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:03:03','2023-02-02 12:03:03');
INSERT INTO fuels VALUES('3','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:10:06','2023-02-02 12:10:06');
INSERT INTO fuels VALUES('4','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:11:07','2023-02-02 12:11:07');
INSERT INTO fuels VALUES('5','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:11:54','2023-02-02 12:11:54');
INSERT INTO fuels VALUES('6','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:12:24','2023-02-02 12:12:24');
INSERT INTO fuels VALUES('7','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:12:43','2023-02-02 12:12:43');
INSERT INTO fuels VALUES('8','1','198.87','test','test','test','2023-02-02','vendor','1','100.00','50.67','1','2023-02-02 12:27:10','2023-02-02 12:27:10');
INSERT INTO fuels VALUES('9','1','100.00','','','','2023-02-02','vendor','1','100.00','20.00','1','2023-02-02 12:34:43','2023-02-02 12:34:43');
INSERT INTO fuels VALUES('10','1','100.90','','','','2023-02-02','vendor','1','100.00','20.00','1','2023-02-02 12:37:33','2023-02-02 12:37:33');
INSERT INTO fuels VALUES('11','1','100.90','','','','2023-02-02','vendor','1','100.00','20.00','1','2023-02-02 12:41:00','2023-02-02 12:41:00');
INSERT INTO fuels VALUES('12','1','100.90','','','','2023-02-02','vendor','1','100.00','20.00','1','2023-02-02 12:42:01','2023-02-02 12:42:01');
INSERT INTO fuels VALUES('13','1','100.90','','','','2023-02-02','vendor','1','100.00','20.00','1','2023-02-02 12:42:15','2023-02-02 12:42:15');



DROP TABLE IF EXISTS group_chat_message_status;

CREATE TABLE `group_chat_message_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS group_chat_messages;

CREATE TABLE `group_chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `sender_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS holidays;

CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO holidays VALUES('1','Shab-e-barat','2023-03-08','2023-03-10','1','2023-03-01 17:18:24','0000-00-00 00:00:00');
INSERT INTO holidays VALUES('2','Bangabandhu Birth Anniversary','2023-03-17','2023-03-17','1','2023-03-02 15:23:15','2023-03-02 15:23:15');
INSERT INTO holidays VALUES('3','Mother Language Day','2023-02-21','2023-02-21','1','2023-03-04 10:09:58','2023-03-04 10:09:58');
INSERT INTO holidays VALUES('5','Shab-e-Miraj','2023-02-19','2023-02-19','1','2023-03-04 16:09:47','2023-03-04 16:09:47');
INSERT INTO holidays VALUES('17','Winter holiday','2023-02-01','2023-02-05','1','2023-03-05 12:08:17','2023-03-05 12:08:17');
INSERT INTO holidays VALUES('18','Winter holiday','2023-02-02','2023-02-05','1','2023-03-05 12:08:17','2023-03-05 12:08:17');
INSERT INTO holidays VALUES('19','Winter holiday','2023-02-03','2023-02-05','1','2023-03-05 12:08:17','2023-03-05 12:08:17');
INSERT INTO holidays VALUES('20','Winter holiday','2023-02-04','2023-02-05','1','2023-03-05 12:08:17','2023-03-05 12:08:17');
INSERT INTO holidays VALUES('21','Winter holiday','2023-02-05','2023-02-05','1','2023-03-05 12:08:17','2023-03-05 12:08:17');
INSERT INTO holidays VALUES('23','WInter Holiday','2023-11-08','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('25','WInter Holiday','2023-11-10','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('26','WInter Holiday','2023-11-11','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('29','WInter Holiday','2023-11-14','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('31','WInter Holiday','2023-11-16','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('32','WInter Holiday','2023-11-17','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('33','WInter Holiday','2023-11-18','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('34','WInter Holiday','2023-11-19','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('35','WInter Holiday','2023-11-20','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('36','WInter Holiday','2023-11-21','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');
INSERT INTO holidays VALUES('37','WInter Holiday','2023-11-22','2023-11-22','1','2023-11-05 12:22:01','2023-11-05 12:22:01');



DROP TABLE IF EXISTS institute_classes;

CREATE TABLE `institute_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO institute_classes VALUES('1','Class One','11:27:00','14:05:00','1','1','2023-02-09 10:54:24','2023-02-22 11:27:50');
INSERT INTO institute_classes VALUES('2','Class Two','10:35:00','14:30:00','1','1','2023-03-27 10:38:57','2023-03-27 10:38:57');



DROP TABLE IF EXISTS invoice_item_taxes;

CREATE TABLE `invoice_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `invoice_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_item_taxes VALUES('6','9','28','1','Road Tax @ 5.00%','49.90','1','2022-12-20 16:47:16','2022-12-20 16:47:16');
INSERT INTO invoice_item_taxes VALUES('2','11','14','1','Road Tax @ 5.00%','49.75','1','2022-12-17 16:58:22','2022-12-17 16:58:22');
INSERT INTO invoice_item_taxes VALUES('5','12','19','1','Road Tax @ 5.00%','49.75','1','2022-12-18 15:39:43','2022-12-18 15:39:43');
INSERT INTO invoice_item_taxes VALUES('20','71','136','1','Road Tax @ 5.00%','1000.00','1','2023-01-28 16:21:01','2023-01-28 16:21:01');
INSERT INTO invoice_item_taxes VALUES('19','73','134','1','Road Tax @ 5.00%','48.75','1','2023-01-26 16:58:09','2023-01-26 16:58:09');
INSERT INTO invoice_item_taxes VALUES('18','75','133','2','Extra Police @ 2.00','2.00','1','2023-01-26 16:57:10','2023-01-26 16:57:10');



DROP TABLE IF EXISTS invoice_items;

CREATE TABLE `invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_items VALUES('23','1','1','Dhaka - Rangpur','2.00','10000.00','0.00','','','0.00','20000.00','1','2022-12-20 16:42:23','2022-12-20 16:42:23');
INSERT INTO invoice_items VALUES('36','18','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-21 15:17:54','2022-12-21 15:17:54');
INSERT INTO invoice_items VALUES('31','15','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-21 12:25:30','2022-12-21 12:25:30');
INSERT INTO invoice_items VALUES('114','3','1','','1.00','1000.00','90.00','','','0.00','910.00','1','2023-01-22 16:05:59','2023-01-22 16:05:59');
INSERT INTO invoice_items VALUES('24','4','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-20 16:43:59','2022-12-20 16:43:59');
INSERT INTO invoice_items VALUES('25','6','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-20 16:44:39','2022-12-20 16:44:39');
INSERT INTO invoice_items VALUES('26','7','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-20 16:45:29','2022-12-20 16:45:29');
INSERT INTO invoice_items VALUES('27','8','5','','1.00','20000.00','0.00','','','0.00','20000.00','1','2022-12-20 16:46:13','2022-12-20 16:46:13');
INSERT INTO invoice_items VALUES('28','9','1','','1.00','1000.00','2.00','','','49.90','998.00','1','2022-12-20 16:47:16','2022-12-20 16:47:16');
INSERT INTO invoice_items VALUES('29','10','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-20 16:48:12','2022-12-20 16:48:12');
INSERT INTO invoice_items VALUES('14','11','1','','1.00','1000.00','5.00','','','49.75','995.00','1','2022-12-17 16:58:22','2022-12-17 16:58:22');
INSERT INTO invoice_items VALUES('19','12','1','','1.00','1000.00','5.00','','','49.75','995.00','1','2022-12-18 15:39:43','2022-12-18 15:39:43');
INSERT INTO invoice_items VALUES('21','13','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-18 17:50:31','2022-12-18 17:50:31');
INSERT INTO invoice_items VALUES('35','17','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-21 12:37:24','2022-12-21 12:37:24');
INSERT INTO invoice_items VALUES('37','19','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-24 11:50:32','2022-12-24 11:50:32');
INSERT INTO invoice_items VALUES('38','20','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:17:29','2022-12-25 10:17:29');
INSERT INTO invoice_items VALUES('39','21','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:52:24','2022-12-25 10:52:24');
INSERT INTO invoice_items VALUES('40','22','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:54:04','2022-12-25 10:54:04');
INSERT INTO invoice_items VALUES('41','23','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:55:03','2022-12-25 10:55:03');
INSERT INTO invoice_items VALUES('42','24','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:55:35','2022-12-25 10:55:35');
INSERT INTO invoice_items VALUES('43','25','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:56:59','2022-12-25 10:56:59');
INSERT INTO invoice_items VALUES('44','26','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 10:58:50','2022-12-25 10:58:50');
INSERT INTO invoice_items VALUES('45','27','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:02:26','2022-12-25 11:02:26');
INSERT INTO invoice_items VALUES('46','28','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:02:39','2022-12-25 11:02:39');
INSERT INTO invoice_items VALUES('47','29','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:04:08','2022-12-25 11:04:08');
INSERT INTO invoice_items VALUES('48','30','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:08:50','2022-12-25 11:08:50');
INSERT INTO invoice_items VALUES('49','31','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:09:11','2022-12-25 11:09:11');
INSERT INTO invoice_items VALUES('50','32','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:10:11','2022-12-25 11:10:11');
INSERT INTO invoice_items VALUES('51','33','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:14:20','2022-12-25 11:14:20');
INSERT INTO invoice_items VALUES('52','34','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:14:33','2022-12-25 11:14:33');
INSERT INTO invoice_items VALUES('53','35','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:15:02','2022-12-25 11:15:02');
INSERT INTO invoice_items VALUES('54','36','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:15:18','2022-12-25 11:15:18');
INSERT INTO invoice_items VALUES('55','37','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:17:45','2022-12-25 11:17:45');
INSERT INTO invoice_items VALUES('56','38','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:18:26','2022-12-25 11:18:26');
INSERT INTO invoice_items VALUES('57','39','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:19:48','2022-12-25 11:19:48');
INSERT INTO invoice_items VALUES('58','40','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:38:41','2022-12-25 11:38:41');
INSERT INTO invoice_items VALUES('59','41','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:39:24','2022-12-25 11:39:24');
INSERT INTO invoice_items VALUES('60','42','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:40:43','2022-12-25 11:40:43');
INSERT INTO invoice_items VALUES('61','43','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:41:20','2022-12-25 11:41:20');
INSERT INTO invoice_items VALUES('62','44','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:42:11','2022-12-25 11:42:11');
INSERT INTO invoice_items VALUES('63','45','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:42:23','2022-12-25 11:42:23');
INSERT INTO invoice_items VALUES('64','46','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:42:58','2022-12-25 11:42:58');
INSERT INTO invoice_items VALUES('65','47','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:44:10','2022-12-25 11:44:10');
INSERT INTO invoice_items VALUES('66','48','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:44:49','2022-12-25 11:44:49');
INSERT INTO invoice_items VALUES('67','49','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:46:21','2022-12-25 11:46:21');
INSERT INTO invoice_items VALUES('68','50','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:47:07','2022-12-25 11:47:07');
INSERT INTO invoice_items VALUES('69','51','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:47:40','2022-12-25 11:47:40');
INSERT INTO invoice_items VALUES('70','52','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:50:51','2022-12-25 11:50:51');
INSERT INTO invoice_items VALUES('71','53','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:54:52','2022-12-25 11:54:52');
INSERT INTO invoice_items VALUES('72','54','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 11:56:11','2022-12-25 11:56:11');
INSERT INTO invoice_items VALUES('131','83','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-01-26 16:54:22','2023-01-26 16:54:22');
INSERT INTO invoice_items VALUES('132','82','1','','1.00','1000.00','50.00','','','0.00','950.00','1','2023-01-26 16:56:17','2023-01-26 16:56:17');
INSERT INTO invoice_items VALUES('75','57','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 12:07:38','2022-12-25 12:07:38');
INSERT INTO invoice_items VALUES('76','58','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 12:10:39','2022-12-25 12:10:39');
INSERT INTO invoice_items VALUES('77','59','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-25 12:11:52','2022-12-25 12:11:52');
INSERT INTO invoice_items VALUES('78','60','1','agf','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-26 11:33:35','2022-12-26 11:33:35');
INSERT INTO invoice_items VALUES('79','61','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-28 10:51:03','2022-12-28 10:51:03');
INSERT INTO invoice_items VALUES('80','62','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-28 11:09:31','2022-12-28 11:09:31');
INSERT INTO invoice_items VALUES('81','63','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-28 11:10:40','2022-12-28 11:10:40');
INSERT INTO invoice_items VALUES('83','65','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-28 11:14:03','2022-12-28 11:14:03');
INSERT INTO invoice_items VALUES('84','66','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-28 12:51:29','2022-12-28 12:51:29');
INSERT INTO invoice_items VALUES('139','67','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-02-01 11:04:13','2023-02-01 11:04:13');
INSERT INTO invoice_items VALUES('86','68','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-29 10:46:40','2022-12-29 10:46:40');
INSERT INTO invoice_items VALUES('87','69','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2022-12-29 10:58:05','2022-12-29 10:58:05');
INSERT INTO invoice_items VALUES('88','70','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-01-01 11:27:07','2023-01-01 11:27:07');
INSERT INTO invoice_items VALUES('136','71','5','','1.00','20000.00','0.00','','','1000.00','20000.00','1','2023-01-28 16:21:01','2023-01-28 16:21:01');
INSERT INTO invoice_items VALUES('135','72','5','','1.00','20000.00','0.00','','','0.00','20000.00','1','2023-01-28 15:58:56','2023-01-28 15:58:56');
INSERT INTO invoice_items VALUES('134','73','1','','1.00','1000.00','25.00','','','48.75','975.00','1','2023-01-26 16:58:09','2023-01-26 16:58:09');
INSERT INTO invoice_items VALUES('130','84','5','','1.00','20000.00','0.00','','','0.00','20000.00','1','2023-01-26 16:52:45','2023-01-26 16:52:45');
INSERT INTO invoice_items VALUES('133','75','5','','1.00','20000.00','0.00','','','2.00','20000.00','1','2023-01-26 16:57:10','2023-01-26 16:57:10');
INSERT INTO invoice_items VALUES('94','76','6','','1.00','8000.00','0.00','','','0.00','8000.00','2','2023-01-02 13:01:28','2023-01-02 13:01:28');
INSERT INTO invoice_items VALUES('95','77','6','','1.00','8000.00','0.00','','','0.00','8000.00','2','2023-01-02 13:12:33','2023-01-02 13:12:33');
INSERT INTO invoice_items VALUES('129','84','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-01-26 16:52:45','2023-01-26 16:52:45');
INSERT INTO invoice_items VALUES('99','81','6','','1.00','8000.00','0.00','','','0.00','8000.00','2','2023-01-02 13:31:47','2023-01-02 13:31:47');
INSERT INTO invoice_items VALUES('98','80','6','','1.00','8000.00','0.00','','','0.00','8000.00','2','2023-01-02 13:28:14','2023-01-02 13:28:14');
INSERT INTO invoice_items VALUES('128','85','1','','2.00','1000.00','0.00','','','0.00','2000.00','1','2023-01-26 16:52:01','2023-01-26 16:52:01');
INSERT INTO invoice_items VALUES('119','86','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-01-25 16:37:26','2023-01-25 16:37:26');
INSERT INTO invoice_items VALUES('113','87','1','','1.00','1000.00','0.00','','','0.00','1000.00','1','2023-01-22 15:49:42','2023-01-22 15:49:42');



DROP TABLE IF EXISTS invoice_templates;

CREATE TABLE `invoice_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoices;

CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `pickup_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_addr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meter_start` double DEFAULT NULL,
  `meter_end` double DEFAULT NULL,
  `mile` decimal(10,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `related_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `client_id` bigint NOT NULL,
  `driver_id` int DEFAULT NULL,
  `vehicle_id` int NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoices VALUES('1','1001','booked','2022-11-01','2022-11-01','2023-01-31','12/D/E, Main Avenue, Dhaka 1229','105 Pragati Swarani, Dhaka 1212','20000.00','0.00','15000.00','20000.00','Partially_Paid','classic-red','','','','Thanks for business with us','contacts','1','1','2','1','1','2022-11-01 11:04:23','2022-12-20 16:42:23');
INSERT INTO invoices VALUES('3','1003','booked','2022-12-14','2022-12-14','2023-01-30','Test Area','Test 1 area','910.00','0.00','0.00','910.00','Unpaid','classic-red','','0','','','contacts','1','1','1','1','1','2022-12-14 14:30:34','2023-01-22 16:05:59');
INSERT INTO invoices VALUES('4','1004','delivered','2022-12-01','2023-01-06','','Badda Link Road, Dhaka 1212
Dhaka, 1212
Bangladesh','Dhanmondi Plaza, H-18, Rd No. 6, Dhaka 1205','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','test','contacts','6','6','1','1','1','2022-12-15 14:48:43','2022-12-20 16:49:35');
INSERT INTO invoices VALUES('6','1006','delivered','2022-11-27','2023-01-07','','Test area 1234','Test area 5678','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','','contacts','1','1','2','1','1','2022-12-15 15:20:21','2022-12-20 16:50:14');
INSERT INTO invoices VALUES('7','1007','ongoing','2022-11-29','2023-01-13','','Bashundhara Main Gate, Dhaka 1229','V9FR+W99, Gareeb-e-Nawaz Ave, Dhaka 1230','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','sdgs ddtgrs','contacts','6','6','2','1','1','2022-12-15 15:34:31','2022-12-20 16:45:29');
INSERT INTO invoices VALUES('8','1008','ongoing','2022-11-27','2023-02-03','','House-5, 1st Floor, Probal Housing, রিং রোড, ঢাকা 1207','চট্টগ্রাম বিশ্ববিদ্যালয় সড়ক, 4331','20000.00','0.00','15000.00','20000.00','Partially_Paid','classic-red','','','','Thanks for business with us.','contacts','6','6','2','1','1','2022-12-15 16:43:03','2022-12-20 16:50:55');
INSERT INTO invoices VALUES('9','1009','booked','2022-12-01','2023-01-07','','Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230','Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230','1097.80','49.90','0.00','1097.80','Unpaid','classic-red','','','','','contacts','6','6','2','1','1','2022-12-17 11:50:00','2022-12-20 16:47:16');
INSERT INTO invoices VALUES('10','1010','delivered','2022-11-28','2022-12-28','','Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230','House-5, 1st Floor, Probal Housing, রিং রোড, ঢাকা 1207','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','Thanks for business with us.','contacts','1','1','1','1','1','2022-12-17 15:23:56','2022-12-20 16:51:45');
INSERT INTO invoices VALUES('11','1011','delivered','2022-11-27','2022-12-17','','Test adreess 1','Test Address 2','1094.50','49.75','1094.50','1094.50','Paid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-17 16:58:22','2022-12-20 16:52:03');
INSERT INTO invoices VALUES('12','1012','delivered','2022-12-02','2022-12-18','','Test area 123 dd ddv,','Test area 123 dd ddv,','1094.50','49.75','0.00','1094.50','Unpaid','classic-red','','','','','contacts','1','1','2','1','1','2022-12-18 12:07:49','2022-12-18 15:39:43');
INSERT INTO invoices VALUES('13','1013','cancelled','2022-12-18','2022-12-18','','Test','Test2','1000.00','0.00','0.00','1000.00','Canceled','classic-red','','','','','contacts','1','1','2','1','1','2022-12-18 17:34:23','2022-12-20 11:57:54');
INSERT INTO invoices VALUES('18','1018','booked','2022-12-21','2022-12-21','','test 1','test 2','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-21 15:17:54','2022-12-21 15:17:54');
INSERT INTO invoices VALUES('15','1014','ongoing','2022-12-21','2022-12-21','','Test area 123','Test area 542','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','6','6','1','1','1','2022-12-21 12:25:30','2022-12-21 12:35:45');
INSERT INTO invoices VALUES('17','1017','delivered','2022-12-01','2022-12-31','','rtests rrv','tetdsec edcec','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','Thanks for using','contacts','6','6','1','1','1','2022-12-21 12:36:54','2022-12-21 12:37:38');
INSERT INTO invoices VALUES('19','ATA1019','cancelled','2022-12-24','2022-12-24','','Test area 1','test area 2','1000.00','0.00','0.00','1000.00','Canceled','classic-red','','','','','contacts','1','1','1','1','1','2022-12-24 11:50:32','2022-12-26 16:50:21');
INSERT INTO invoices VALUES('20','ATA1020','booked','2022-12-25','2022-12-25','','Test adress 1','Test adress 123','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:17:29','2022-12-25 10:17:29');
INSERT INTO invoices VALUES('21','ATA1020','booked','2022-12-25','2022-12-25','','Test adress 1','Test adress 123','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:52:24','2022-12-25 10:52:24');
INSERT INTO invoices VALUES('22','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:54:04','2022-12-25 10:54:04');
INSERT INTO invoices VALUES('23','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:55:03','2022-12-25 10:55:03');
INSERT INTO invoices VALUES('24','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:55:35','2022-12-25 10:55:35');
INSERT INTO invoices VALUES('25','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:56:59','2022-12-25 10:56:59');
INSERT INTO invoices VALUES('26','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 10:58:50','2022-12-25 10:58:50');
INSERT INTO invoices VALUES('27','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:02:26','2022-12-25 11:02:26');
INSERT INTO invoices VALUES('28','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:02:39','2022-12-25 11:02:39');
INSERT INTO invoices VALUES('29','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:04:08','2022-12-25 11:04:08');
INSERT INTO invoices VALUES('30','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:08:50','2022-12-25 11:08:50');
INSERT INTO invoices VALUES('31','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:09:11','2022-12-25 11:09:11');
INSERT INTO invoices VALUES('32','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:10:11','2022-12-25 11:10:11');
INSERT INTO invoices VALUES('33','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:14:20','2022-12-25 11:14:20');
INSERT INTO invoices VALUES('34','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:14:33','2022-12-25 11:14:33');
INSERT INTO invoices VALUES('35','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:15:02','2022-12-25 11:15:02');
INSERT INTO invoices VALUES('36','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:15:18','2022-12-25 11:15:18');
INSERT INTO invoices VALUES('37','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:17:45','2022-12-25 11:17:45');
INSERT INTO invoices VALUES('38','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:18:26','2022-12-25 11:18:26');
INSERT INTO invoices VALUES('39','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:19:48','2022-12-25 11:19:48');
INSERT INTO invoices VALUES('40','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:38:41','2022-12-25 11:38:41');
INSERT INTO invoices VALUES('41','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:39:24','2022-12-25 11:39:24');
INSERT INTO invoices VALUES('42','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:40:43','2022-12-25 11:40:43');
INSERT INTO invoices VALUES('43','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:41:20','2022-12-25 11:41:20');
INSERT INTO invoices VALUES('44','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:42:11','2022-12-25 11:42:11');
INSERT INTO invoices VALUES('45','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:42:23','2022-12-25 11:42:23');
INSERT INTO invoices VALUES('46','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:42:58','2022-12-25 11:42:58');
INSERT INTO invoices VALUES('47','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:44:10','2022-12-25 11:44:10');
INSERT INTO invoices VALUES('48','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:44:49','2022-12-25 11:44:49');
INSERT INTO invoices VALUES('49','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:46:21','2022-12-25 11:46:21');
INSERT INTO invoices VALUES('50','ATA1020','booked','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:47:07','2022-12-25 11:47:07');
INSERT INTO invoices VALUES('51','ATA1020','cancelled','2022-12-25','2022-12-25','','test','test','1000.00','0.00','0.00','1000.00','Canceled','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:47:40','2022-12-26 16:52:12');
INSERT INTO invoices VALUES('52','ATA1052','booked','2022-12-25','2022-12-25','','Test 1 dfd g sfdgsd','Tesadsffv vdsjg','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:50:51','2022-12-25 11:50:51');
INSERT INTO invoices VALUES('53','ATA1053','booked','2022-12-14','2022-12-25','','Test  bfdgvbdf vdgvbdv','Test dcvb dc cfbdfbv','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-25 11:54:52','2023-01-07 18:07:05');
INSERT INTO invoices VALUES('54','ATA1054','booked','2022-12-25','2022-12-25','','tewtdsadc sfvsdv','vds dfvbsdf cbdfb','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','','contacts','6','6','1','1','1','2022-12-25 11:56:11','2023-01-07 18:01:26');
INSERT INTO invoices VALUES('83','ATA1077','delivered','2023-01-09','2023-01-09','2023-01-09','test','test','1000.00','0.00','1000.00','1000.00','Paid','classic-red','343.332','390.33','','','contacts','6','6','1','1','1','2023-01-09 10:20:18','2023-01-26 16:54:22');
INSERT INTO invoices VALUES('82','ATA1076','delivered','2023-01-08','2023-01-08','2023-01-08','Paschim Nasirabad, Chattogram, Bangladesh','House 3 Road-9/B, Dhaka 1230, Bangladesh','950.00','0.00','950.00','950.00','Paid','classic-red','','190','267.35','test','contacts','6','6','2','3','1','2023-01-08 17:57:38','2023-01-26 16:56:17');
INSERT INTO invoices VALUES('57','ATA1057','booked','2022-12-01','2022-12-25','','test 1 dfd dgvdf b','Test 2 dfgvbd  fdgvdfg','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','','contacts','6','6','2','1','1','2022-12-25 12:07:38','2023-01-07 17:38:19');
INSERT INTO invoices VALUES('58','ATA1057','booked','2022-12-01','2022-12-25','','test 1 dfd dgvdf b','Test 2 dfgvbd  fdgvdfg','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','6','6','2','1','1','2022-12-25 12:10:39','2022-12-25 12:10:39');
INSERT INTO invoices VALUES('59','ATA1059','booked','2022-12-22','2022-12-25','','Test aread','Tets sdfsdfv','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','','contacts','6','6','1','1','1','2022-12-25 12:11:52','2023-01-07 17:36:35');
INSERT INTO invoices VALUES('60','ATA1060','cancelled','2022-12-26','2022-12-26','','Dhaka','CTG','1000.00','0.00','0.00','1000.00','Canceled','classic-red','','','','Note','contacts','7','7','2','1','1','2022-12-26 11:33:35','2022-12-26 16:42:54');
INSERT INTO invoices VALUES('61','ATA1061','booked','2022-12-01','2022-12-28','','Test area dhaka','Test area ctg','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','rerefdfdvd fbdbvdf fsgdfsvb','contacts','1','1','1','1','1','2022-12-28 10:51:03','2023-01-07 17:34:26');
INSERT INTO invoices VALUES('62','ATA1062','booked','2022-12-28','2022-12-28','','Test is here','Test is here asrea','1000.00','0.00','1000.00','1000.00','Paid','classic-red','','','','Test','contacts','1','1','1','1','1','2022-12-28 11:09:31','2023-01-07 17:33:26');
INSERT INTO invoices VALUES('63','ATA1062','booked','2022-12-28','2022-12-28','','Test is here','Test is here asrea','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','Test','contacts','1','1','1','1','1','2022-12-28 11:10:40','2022-12-28 11:10:40');
INSERT INTO invoices VALUES('65','ATA1065','booked','2022-12-28','2022-12-28','','tesr','test \\233b  u7u 77bgy','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','1','1','1','1','1','2022-12-28 11:14:03','2022-12-28 11:14:03');
INSERT INTO invoices VALUES('66','ATA1066','booked','2022-12-27','2023-01-12','','Test is dhaka','Test is ctg','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','6','6','1','1','1','2022-12-28 12:51:29','2022-12-28 12:51:29');
INSERT INTO invoices VALUES('67','ATA1067','booked','2022-12-28','2022-12-28','2023-01-01','41 Chan Mia Rd, Dhaka, Bangladesh','WC4M+7F4, Mahendranagar, Bangladesh','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','778.34','999','346.57','','contacts','1','1','1','1','1','2022-12-28 13:33:31','2023-02-01 11:04:13');
INSERT INTO invoices VALUES('68','ATA1068','booked','2022-12-29','2023-01-07','','ctg','dhk','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','10343.34','10554','','test','contacts','6','6','1','1','1','2022-12-29 10:46:40','2022-12-29 10:46:40');
INSERT INTO invoices VALUES('69','ATA1069','booked','2022-12-29','2023-01-31','','Dhaka','Rajshahi','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','6','6','1','1','1','2022-12-29 10:58:05','2022-12-29 10:58:05');
INSERT INTO invoices VALUES('70','ATA1070','booked','2023-01-01','2023-02-04','','Dhaka','Ctg','1000.00','0.00','0.00','1000.00','Unpaid','classic-red','','','','','contacts','6','6','2','1','1','2023-01-01 11:27:07','2023-01-01 11:27:07');
INSERT INTO invoices VALUES('71','ATA1071','ongoing','2023-01-01','2023-02-04','2023-01-28','medical college road, laxmipur, Rajshahi 6000, Bangladesh','GFRG+38Q, Gasua, Bangladesh','21000.00','1000.00','21000.00','21000.00','Paid','classic-red','101.23','306','483.28','','contacts','6','6','1','1','1','2023-01-01 11:52:13','2023-01-28 16:24:42');
INSERT INTO invoices VALUES('72','ATA1072','ongoing','2023-01-01','2023-02-04','2023-01-28','Rajshahi, Bangladesh','Paribagh Mosque, 10 Paribagh - Shonargaon St, Dhaka 1000, Bangladesh','20000.00','0.00','20000.00','20000.00','Paid','classic-red','','198','252.56','','contacts','6','6','1','1','1','2023-01-01 11:55:47','2023-01-28 16:14:31');
INSERT INTO invoices VALUES('73','ATA1073','booked','2023-01-01','2023-02-04','2023-01-31','House 3 Road-9/B, Dhaka 1230, Bangladesh','medical college road, laxmipur, Rajshahi 6000, Bangladesh','1023.75','48.75','1023.75','1023.75','Paid','classic-red','','149','237.55','\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"
\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"','contacts','6','6','1','1','1','2023-01-01 12:17:35','2023-01-26 16:58:09');
INSERT INTO invoices VALUES('75','ATA1074','delivered','2023-01-01','2023-02-24','2023-02-12','Test is area','Area from Dhaka','20002.00','2.00','20004.00','20002.00','Paid','classic-red','','106','','This is comment section','contacts','6','6','1','1','1','2023-01-01 12:58:37','2023-01-26 16:57:10');
INSERT INTO invoices VALUES('76','MTC1001','booked','2023-01-02','2023-01-02','','plot No, 41 Gareeb-e-Nawaz Ave, Dhaka:1230 1230','Dhaka - Ashulia Hwy, Dhaka 1341','8000.00','0.00','5000.00','84.07','Partially_Paid','classic-red','','','','','contacts','2','2','4','2','2','2023-01-02 13:01:28','2023-01-02 13:11:33');
INSERT INTO invoices VALUES('77','MTC1002','booked','2023-01-02','2023-01-02','','Dhaka - Ashulia Hwy, Dhaka 1341','plot No, 41 Gareeb-e-Nawaz Ave, Dhaka:1230 1230','8000.00','0.00','0.00','8000.00','Unpaid','classic-red','','','','','contacts','2','2','4','2','2','2023-01-02 13:12:33','2023-01-02 13:12:33');
INSERT INTO invoices VALUES('84','ATA1078','cancelled','2023-01-09','2023-01-09','2023-02-04','t1','t2','21000.00','0.00','0.00','21000.00','Canceled','classic-red','2312.232','2433.33','','','contacts','6','6','1','1','1','2023-01-09 11:04:21','2023-01-26 16:52:45');
INSERT INTO invoices VALUES('85','ATA1079','ongoing','2023-01-09','2023-01-27','2023-02-01','test area 1','test area 2','2000.00','0.00','2000.00','2000.00','Paid','classic-red','434.03','900','','','contacts','6','6','7','1','1','2023-01-09 15:55:24','2023-01-26 16:52:01');
INSERT INTO invoices VALUES('81','MTC1006','booked','2023-01-02','2023-02-03','','Uttara 3rd Phase Connecting, Road সোনারগাঁ জনপথ, ঢাকা 1230','রোড নং ২১, Dhaka 1216','8000.00','0.00','0.00','8000.00','Unpaid','classic-red','','','','','contacts','2','2','4','2','2','2023-01-02 13:31:47','2023-01-02 13:31:47');
INSERT INTO invoices VALUES('80','MTC1003','delivered','2023-01-02','2023-01-02','','Plot No : 276, Narshinghapur, Dhaka 1341','Uttara 3rd Phase Connecting, Road Sonargaon Janapath, Dhaka 1230','8000.00','0.00','8000.00','8000.00','Paid','classic-red','312.343','44321.3432','','','contacts','2','2','4','2','2','2023-01-02 13:28:14','2023-01-02 13:29:37');
INSERT INTO invoices VALUES('86','ATA1080','ongoing','2023-01-09','2023-01-09','2023-02-04','Plot No : 276, Narshinghapur, Dhaka 1341','Sonargaon Janapath, Dhaka 1230, Bangladesh','1000.00','0.00','1000.00','1000.00','Paid','classic-red','123.23','232','7.65','','contacts','6','6','1','1','1','2023-01-09 17:27:27','2023-01-28 15:56:45');
INSERT INTO invoices VALUES('87','ATA1081','cancelled','2023-01-22','2023-01-22','2023-01-31','4 Shah Makhdum Ave, Dhaka 1230, Bangladesh','Aricha Port, RQPH+PPP, Dhaka - Aricha Hwy, শিবালয়, Bangladesh','1000.00','0.00','0.00','1000.00','Canceled','classic-red','20.32','','','Test','contacts','6','6','2','1','1','2023-01-22 15:49:42','2023-01-23 15:37:50');



DROP TABLE IF EXISTS items;

CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO items VALUES('1','Regular Trip','service','1','2022-11-01 11:02:37','2022-11-01 11:02:37');
INSERT INTO items VALUES('2','Test','product','1','2022-12-08 12:02:51','2022-12-08 12:02:51');
INSERT INTO items VALUES('3','Test 2','product','1','2022-12-10 15:31:19','2022-12-10 15:31:19');
INSERT INTO items VALUES('4','TEst','product','1','2022-12-14 11:21:44','2022-12-14 11:21:44');
INSERT INTO items VALUES('5','Heavy Vehicle Trip','service','1','2022-12-14 13:17:05','2022-12-14 13:17:05');
INSERT INTO items VALUES('6','Mini Trip','service','2','2023-01-02 12:58:50','2023-01-02 12:58:50');



DROP TABLE IF EXISTS lead_sources;

CREATE TABLE `lead_sources` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO lead_sources VALUES('1','TYest','','1','2022-12-19 14:34:32','2022-12-19 14:34:32');



DROP TABLE IF EXISTS lead_statuses;

CREATE TABLE `lead_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO lead_statuses VALUES('1','Test','#642222','2','1','2022-12-19 14:34:11','2022-12-19 14:34:11');



DROP TABLE IF EXISTS leads;

CREATE TABLE `leads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted_lead` int DEFAULT NULL,
  `lead_status_id` bigint NOT NULL,
  `lead_source_id` bigint NOT NULL,
  `assigned_user_id` bigint NOT NULL,
  `created_user_id` bigint NOT NULL,
  `contact_date` date NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO leads VALUES('1','Test','Test','','','1','1','8','2','2022-12-31','01723231234','test.com','Bangladesh','BDT','','','','','','','','1','2022-12-19 14:35:46','2022-12-19 14:35:46');



DROP TABLE IF EXISTS leave_statuses;

CREATE TABLE `leave_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `contact_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO leave_statuses VALUES('3','test','2023-03-01','2023-03-05','dengue','7','1','2023-03-01 13:17:14','2023-03-01 13:17:14');
INSERT INTO leave_statuses VALUES('6','r3ede','2023-02-28','2023-03-07','diarrhea','1','1','2023-03-01 13:25:07','2023-03-01 13:25:07');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_06_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('4','2018_08_29_084110_create_permissions_table','1');
INSERT INTO migrations VALUES('5','2018_10_28_101819_create_contact_groups_table','1');
INSERT INTO migrations VALUES('6','2018_10_28_104344_create_contacts_table','1');
INSERT INTO migrations VALUES('7','2018_10_28_151911_create_taxs_table','1');
INSERT INTO migrations VALUES('8','2018_10_29_095644_create_items_table','1');
INSERT INTO migrations VALUES('9','2018_10_29_100449_create_products_table','1');
INSERT INTO migrations VALUES('10','2018_10_29_101301_create_services_table','1');
INSERT INTO migrations VALUES('11','2018_10_29_101756_create_suppliers_table','1');
INSERT INTO migrations VALUES('12','2018_11_12_152015_create_email_templates_table','1');
INSERT INTO migrations VALUES('13','2018_11_13_063551_create_accounts_table','1');
INSERT INTO migrations VALUES('14','2018_11_13_082226_create_chart_of_accounts_table','1');
INSERT INTO migrations VALUES('15','2018_11_13_082512_create_payment_methods_table','1');
INSERT INTO migrations VALUES('16','2018_11_13_141249_create_transactions_table','1');
INSERT INTO migrations VALUES('17','2018_11_14_134254_create_repeating_transactions_table','1');
INSERT INTO migrations VALUES('18','2018_11_17_142037_create_payment_histories_table','1');
INSERT INTO migrations VALUES('19','2019_03_07_084028_create_purchase_orders_table','1');
INSERT INTO migrations VALUES('20','2019_03_07_085537_create_purchase_order_items_table','1');
INSERT INTO migrations VALUES('21','2019_03_19_070903_create_current_stocks_table','1');
INSERT INTO migrations VALUES('22','2019_03_19_123527_create_company_settings_table','1');
INSERT INTO migrations VALUES('23','2019_03_19_133922_create_product_units_table','1');
INSERT INTO migrations VALUES('24','2019_03_20_113605_create_invoices_table','1');
INSERT INTO migrations VALUES('25','2019_03_20_113618_create_invoice_items_table','1');
INSERT INTO migrations VALUES('26','2019_05_11_080519_create_purchase_return_table','1');
INSERT INTO migrations VALUES('27','2019_05_11_080546_create_purchase_return_items_table','1');
INSERT INTO migrations VALUES('28','2019_05_27_153656_create_quotations_table','1');
INSERT INTO migrations VALUES('29','2019_05_27_153712_create_quotation_items_table','1');
INSERT INTO migrations VALUES('30','2019_06_22_062221_create_sales_return_table','1');
INSERT INTO migrations VALUES('31','2019_06_22_062233_create_sales_return_items_table','1');
INSERT INTO migrations VALUES('32','2019_06_23_055645_create_company_email_template_table','1');
INSERT INTO migrations VALUES('33','2019_10_31_172912_create_social_google_accounts_table','1');
INSERT INTO migrations VALUES('34','2019_11_04_133151_create_chat_messages_table','1');
INSERT INTO migrations VALUES('35','2019_11_07_105822_create_chat_groups_table','1');
INSERT INTO migrations VALUES('36','2019_11_08_063856_create_chat_group_users','1');
INSERT INTO migrations VALUES('37','2019_11_08_143329_create_group_chat_messages_table','1');
INSERT INTO migrations VALUES('38','2019_11_08_143607_create_group_chat_message_status_table','1');
INSERT INTO migrations VALUES('39','2019_11_11_170656_create_file_manager_table','1');
INSERT INTO migrations VALUES('40','2020_03_15_154649_create_currency_rates_table','1');
INSERT INTO migrations VALUES('41','2020_03_21_052934_create_companies_table','1');
INSERT INTO migrations VALUES('42','2020_03_21_070022_create_packages_table','1');
INSERT INTO migrations VALUES('43','2020_04_02_155956_create_cm_features_table','1');
INSERT INTO migrations VALUES('44','2020_04_02_160209_create_cm_faqs_table','1');
INSERT INTO migrations VALUES('45','2020_04_02_160249_create_cm_email_subscribers_table','1');
INSERT INTO migrations VALUES('46','2020_05_18_104400_create_invoice_templates_table','1');
INSERT INTO migrations VALUES('47','2020_05_24_152947_create_lead_statuses_table','1');
INSERT INTO migrations VALUES('48','2020_05_24_153000_create_lead_sources_table','1');
INSERT INTO migrations VALUES('49','2020_05_24_153224_create_leads_table','1');
INSERT INTO migrations VALUES('50','2020_06_03_112519_create_files_table','1');
INSERT INTO migrations VALUES('51','2020_06_03_112538_create_notes_table','1');
INSERT INTO migrations VALUES('52','2020_06_03_112553_create_activity_logs_table','1');
INSERT INTO migrations VALUES('53','2020_06_22_083001_create_projects_table','1');
INSERT INTO migrations VALUES('54','2020_06_22_095143_create_project_members_table','1');
INSERT INTO migrations VALUES('55','2020_06_23_083455_create_project_milestones_table','1');
INSERT INTO migrations VALUES('56','2020_06_23_112159_create_task_statuses_table','1');
INSERT INTO migrations VALUES('57','2020_06_23_144512_create_tasks_table','1');
INSERT INTO migrations VALUES('58','2020_06_25_065937_create_timesheets_table','1');
INSERT INTO migrations VALUES('59','2020_06_27_152210_create_notifications_table','1');
INSERT INTO migrations VALUES('60','2020_08_21_063443_add_related_to_company_email_template','1');
INSERT INTO migrations VALUES('61','2020_10_19_082621_create_staff_roles_table','1');
INSERT INTO migrations VALUES('62','2020_10_20_080849_add_description_to_invoice_items','1');
INSERT INTO migrations VALUES('63','2020_12_13_150320_create_invoice_item_taxes_table','1');
INSERT INTO migrations VALUES('64','2020_12_15_055832_create_quotation_item_taxes_table','1');
INSERT INTO migrations VALUES('65','2020_12_15_102722_create_purchase_order_item_taxes_table','1');
INSERT INTO migrations VALUES('66','2020_12_16_070412_create_purchase_return_item_taxes_table','1');
INSERT INTO migrations VALUES('67','2020_12_17_065847_create_sales_return_item_taxes_table','1');
INSERT INTO migrations VALUES('71','2022_12_03_091435_create_drivers_table','2');
INSERT INTO migrations VALUES('72','2022_12_10_051911_create_vehicle_types_table','2');
INSERT INTO migrations VALUES('73','2022_12_11_062858_create_vehicles_table','2');
INSERT INTO migrations VALUES('75','2022_12_21_115955_create_s_m_s_table','3');
INSERT INTO migrations VALUES('76','2019_11_27_040657_create_divisions_table','4');
INSERT INTO migrations VALUES('77','2019_11_27_040723_create_districts_table','4');
INSERT INTO migrations VALUES('78','2019_11_27_040803_create_upazilas_table','4');
INSERT INTO migrations VALUES('79','2023_01_31_044830_create_fuels_table','5');



DROP TABLE IF EXISTS notes;

CREATE TABLE `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `related_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS notices;

CREATE TABLE `notices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT '1' COMMENT '0 = Deactive | 1 = Active',
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notices VALUES('2','Test Notice','School will be closed tomorrow','1','1','2023-03-13 12:32:27','2023-03-13 12:32:27');
INSERT INTO notices VALUES('3','Exam Notice','Exam will starts from 22/02/23','1','1','2023-03-13 12:33:00','2023-03-13 12:33:00');



DROP TABLE IF EXISTS notifications;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES('94165480-4249-44ac-b237-832a7ab7c5bb','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":3,\"url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"client_url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1003\"}','2','','2022-12-14 14:30:34','2022-12-14 14:30:34');
INSERT INTO notifications VALUES('d5b2596d-fe97-465d-8587-358fb38dc547','App\\Notifications\\ProjectCreated','App\\User','2','{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Created New Project\",\"content\":\"Project 1# Test\"}','2','2022-12-15 17:04:18','2022-12-14 14:50:17','2022-12-15 17:04:18');
INSERT INTO notifications VALUES('fa301d17-b8e2-4524-bcd2-2355c5bea446','App\\Notifications\\ProjectCreated','App\\User','8','{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Created New Project\",\"content\":\"Project 1# Test\"}','2','','2022-12-14 14:50:17','2022-12-14 14:50:17');
INSERT INTO notifications VALUES('fa6c2acf-7108-4a87-981d-e1baafee942c','App\\Notifications\\ProjectUpdated','App\\User','2','{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Updated Project\",\"content\":\"Project 1# Test\"}','2','2022-12-15 17:04:03','2022-12-14 14:53:06','2022-12-15 17:04:03');
INSERT INTO notifications VALUES('80842890-f73b-445c-a454-db7d8dcaccfa','App\\Notifications\\ProjectUpdated','App\\User','8','{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Updated Project\",\"content\":\"Project 1# Test\"}','2','','2022-12-14 14:53:06','2022-12-14 14:53:06');
INSERT INTO notifications VALUES('d60ff09f-9af0-44c7-901a-6f7b71547314','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":6,\"url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"client_url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1006\"}','2','','2022-12-15 15:20:22','2022-12-15 15:20:22');
INSERT INTO notifications VALUES('40f798a0-0a90-40f8-8f8b-64559cdd0781','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":10,\"url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"client_url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1010\"}','2','','2022-12-17 15:23:56','2022-12-17 15:23:56');
INSERT INTO notifications VALUES('a933c303-3079-4a84-bc23-45dc7f542b11','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":11,\"url\":\"client\\/view_invoice\\/6512bd43d9caa6e02c990b0a82652dca\",\"client_url\":\"client\\/view_invoice\\/6512bd43d9caa6e02c990b0a82652dca\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1011\"}','2','','2022-12-17 16:58:22','2022-12-17 16:58:22');
INSERT INTO notifications VALUES('cb52910e-73e5-4302-a5f5-10e19ac63e46','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1012\"}','2','','2022-12-18 12:07:50','2022-12-18 12:07:50');
INSERT INTO notifications VALUES('68f058fd-fe49-4795-97e7-352b3c05f8a8','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}','2','','2022-12-18 13:08:16','2022-12-18 13:08:16');
INSERT INTO notifications VALUES('1457186c-31e6-457d-b612-16f60abac897','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}','2','','2022-12-18 13:09:43','2022-12-18 13:09:43');
INSERT INTO notifications VALUES('496d2189-b43c-4d1e-b747-aa61c888064f','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}','2','','2022-12-18 15:39:43','2022-12-18 15:39:43');
INSERT INTO notifications VALUES('577e138c-1137-4f7a-8020-7805407e8598','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":13,\"url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"client_url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1013\"}','2','','2022-12-18 17:34:23','2022-12-18 17:34:23');
INSERT INTO notifications VALUES('647f1c82-5f55-4dc1-b1aa-81396cdeeddd','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":13,\"url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"client_url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1013\"}','2','','2022-12-18 17:50:31','2022-12-18 17:50:31');
INSERT INTO notifications VALUES('bef194ef-28ce-4c96-81da-bd75b0182289','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":3,\"url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"client_url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}','2','','2022-12-20 16:39:28','2022-12-20 16:39:28');
INSERT INTO notifications VALUES('27db471c-1764-4385-bd40-09a404cf3ed8','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":1,\"url\":\"client\\/view_invoice\\/c4ca4238a0b923820dcc509a6f75849b\",\"client_url\":\"client\\/view_invoice\\/c4ca4238a0b923820dcc509a6f75849b\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1001\"}','2','','2022-12-20 16:42:23','2022-12-20 16:42:23');
INSERT INTO notifications VALUES('21d59e01-96e3-4645-a510-fc71f74261fe','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":6,\"url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"client_url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1006\"}','2','','2022-12-20 16:44:39','2022-12-20 16:44:39');
INSERT INTO notifications VALUES('60f2cc92-1bba-492f-991b-98330043818f','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":10,\"url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"client_url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1010\"}','2','','2022-12-20 16:48:12','2022-12-20 16:48:12');
INSERT INTO notifications VALUES('f395e279-2c19-463a-9fe3-a5efdbb320ec','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":16,\"url\":\"client\\/view_invoice\\/c74d97b01eae257e44aa9d5bade97baf\",\"client_url\":\"client\\/view_invoice\\/c74d97b01eae257e44aa9d5bade97baf\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1014\"}','2','2022-12-21 12:29:01','2022-12-21 12:28:47','2022-12-21 12:29:01');
INSERT INTO notifications VALUES('40fe482e-872a-4f3a-b01d-82d396bbf5b9','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":14,\"url\":\"client\\/view_invoice\\/aab3238922bcc25a6f606eb525ffdc56\",\"client_url\":\"client\\/view_invoice\\/aab3238922bcc25a6f606eb525ffdc56\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1014\"}','2','2022-12-21 12:39:21','2022-12-21 12:33:39','2022-12-21 12:39:21');
INSERT INTO notifications VALUES('66c6f895-e3ce-48dd-9e3d-d18d172bf750','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":15,\"url\":\"client\\/view_invoice\\/9bf31c7ff062936a96d3c8bd1f8f2ff3\",\"client_url\":\"client\\/view_invoice\\/9bf31c7ff062936a96d3c8bd1f8f2ff3\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1014\"}','2','2022-12-21 12:40:29','2022-12-21 12:35:45','2022-12-21 12:40:29');
INSERT INTO notifications VALUES('27d02035-3151-4ee7-9665-ce09bd3982cf','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1017\"}','2','2022-12-21 12:39:58','2022-12-21 12:36:54','2022-12-21 12:39:58');
INSERT INTO notifications VALUES('dd9d2461-01af-4a6c-a85d-0d1dc176a187','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1017\"}','2','2022-12-21 12:40:14','2022-12-21 12:37:24','2022-12-21 12:40:14');
INSERT INTO notifications VALUES('80ede486-3ecc-4b6c-9657-2bf484056864','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1017\"}','2','2022-12-21 12:39:49','2022-12-21 12:37:38','2022-12-21 12:39:49');
INSERT INTO notifications VALUES('f1d71a15-a2e0-4bf0-ace4-d0a0095768b7','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":18,\"url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"client_url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1018\"}','2','','2022-12-21 15:17:55','2022-12-21 15:17:55');
INSERT INTO notifications VALUES('6029dcff-61ba-4cb1-9540-9e93143ebb53','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":18,\"url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"client_url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1018\"}','2','2022-12-22 11:18:46','2022-12-21 15:17:55','2022-12-22 11:18:46');
INSERT INTO notifications VALUES('93346288-ffd4-4e1f-a947-c512e38984b8','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":19,\"url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"client_url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1019\"}','2','','2022-12-24 11:50:32','2022-12-24 11:50:32');
INSERT INTO notifications VALUES('94bfc74d-a35e-4f32-86a3-40cc42d2e546','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":19,\"url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"client_url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1019\"}','2','','2022-12-24 11:50:32','2022-12-24 11:50:32');
INSERT INTO notifications VALUES('3cba59e2-294b-480b-acef-c429505515bb','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":20,\"url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"client_url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:17:29','2022-12-25 10:17:29');
INSERT INTO notifications VALUES('d72495eb-4596-45af-a62d-ecca52af4376','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":20,\"url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"client_url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:17:29','2022-12-25 10:17:29');
INSERT INTO notifications VALUES('596de77b-4220-4742-a03d-aead89382083','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":21,\"url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"client_url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:52:24','2022-12-25 10:52:24');
INSERT INTO notifications VALUES('11f197c2-5829-40a7-9f03-3f7307290b25','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":21,\"url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"client_url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:12','2022-12-25 10:52:24','2022-12-26 10:37:12');
INSERT INTO notifications VALUES('0b053c06-cdf4-4d21-8ca8-055fd24a4971','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":22,\"url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"client_url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:54:04','2022-12-25 10:54:04');
INSERT INTO notifications VALUES('ce9a2c1b-0dd4-4ded-9e08-43c5961293a7','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":22,\"url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"client_url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:19','2022-12-25 10:54:04','2022-12-26 10:37:19');
INSERT INTO notifications VALUES('cdadb0a4-c1df-461a-9df6-b425dc34027e','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":23,\"url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"client_url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:55:03','2022-12-25 10:55:03');
INSERT INTO notifications VALUES('1c376145-7536-497b-abfb-659fba4d447f','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":23,\"url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"client_url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:25','2022-12-25 10:55:03','2022-12-26 10:37:25');
INSERT INTO notifications VALUES('ecb22514-639e-4cc2-a680-4001e9cb1f2a','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":24,\"url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"client_url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:55:35','2022-12-25 10:55:35');
INSERT INTO notifications VALUES('faa2ade6-831d-483d-b18e-02fafca7642c','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":24,\"url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"client_url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:31','2022-12-25 10:55:35','2022-12-26 10:37:31');
INSERT INTO notifications VALUES('803e3a65-9136-4a48-b1f8-feb1950808d3','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":25,\"url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"client_url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 10:56:59','2022-12-25 10:56:59');
INSERT INTO notifications VALUES('7f3d2a07-342d-42cc-82f4-f46f6d7c8aff','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":25,\"url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"client_url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:48','2022-12-25 10:56:59','2022-12-26 10:37:48');
INSERT INTO notifications VALUES('3b80ffc0-b6b3-4ef4-a910-3d96fb6d9ef4','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":49,\"url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"client_url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 11:46:21','2022-12-25 11:46:21');
INSERT INTO notifications VALUES('792760d5-09b6-4178-96b6-0ba98b408c82','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":49,\"url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"client_url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-26 10:37:42','2022-12-25 11:46:21','2022-12-26 10:37:42');
INSERT INTO notifications VALUES('3eea9ada-a013-4935-baff-57f47a3368bb','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":50,\"url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"client_url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 11:47:07','2022-12-25 11:47:07');
INSERT INTO notifications VALUES('23bf0dda-5fa5-4e37-b258-6c7d2b768c36','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":50,\"url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"client_url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-25 12:01:23','2022-12-25 11:47:07','2022-12-25 12:01:23');
INSERT INTO notifications VALUES('5e8da4dc-754a-4f71-a301-7c86e0dacbfc','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":51,\"url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"client_url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','','2022-12-25 11:47:40','2022-12-25 11:47:40');
INSERT INTO notifications VALUES('beafe61e-ace7-42d2-9e25-89b5ae90c7e9','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":51,\"url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"client_url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}','2','2022-12-25 11:49:19','2022-12-25 11:47:40','2022-12-25 11:49:19');
INSERT INTO notifications VALUES('fe5f2bef-2002-4e71-bf4e-93dec906b1d9','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":52,\"url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"client_url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1052\"}','2','','2022-12-25 11:50:51','2022-12-25 11:50:51');
INSERT INTO notifications VALUES('1854d665-db7d-4974-b60e-f27f352d58dd','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":52,\"url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"client_url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1052\"}','2','2022-12-25 12:00:08','2022-12-25 11:50:51','2022-12-25 12:00:08');
INSERT INTO notifications VALUES('1554dae8-c5eb-43d6-826f-540758caa1a7','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":53,\"url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"client_url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1053\"}','2','','2022-12-25 11:54:52','2022-12-25 11:54:52');
INSERT INTO notifications VALUES('c66af9ce-b111-460d-a2b0-906cd0e70a9e','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":53,\"url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"client_url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1053\"}','2','2022-12-25 12:00:01','2022-12-25 11:54:52','2022-12-25 12:00:01');
INSERT INTO notifications VALUES('d7ebe3fe-fc10-4c68-bf36-7e9420f1234f','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":54,\"url\":\"client\\/view_invoice\\/a684eceee76fc522773286a895bc8436\",\"client_url\":\"client\\/view_invoice\\/a684eceee76fc522773286a895bc8436\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}','2','2022-12-25 12:01:09','2022-12-25 11:56:11','2022-12-25 12:01:09');
INSERT INTO notifications VALUES('a4e7a1a5-cf09-4945-b1f9-0072709e40f3','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":55,\"url\":\"client\\/view_invoice\\/b53b3a3d6ab90ce0268229151c9bde11\",\"client_url\":\"client\\/view_invoice\\/b53b3a3d6ab90ce0268229151c9bde11\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}','2','2022-12-25 11:59:56','2022-12-25 11:56:46','2022-12-25 11:59:56');
INSERT INTO notifications VALUES('1c4678d0-2dfa-42db-bc7a-6e42de522414','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":56,\"url\":\"client\\/view_invoice\\/9f61408e3afb633e50cdf1b20de6f466\",\"client_url\":\"client\\/view_invoice\\/9f61408e3afb633e50cdf1b20de6f466\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}','2','2022-12-25 11:57:42','2022-12-25 11:57:00','2022-12-25 11:57:42');
INSERT INTO notifications VALUES('e206e0b1-820e-4a4f-bf0a-c5d1efa723f0','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":58,\"url\":\"client\\/view_invoice\\/66f041e16a60928b05a7e228a89c3799\",\"client_url\":\"client\\/view_invoice\\/66f041e16a60928b05a7e228a89c3799\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1057\"}','2','2022-12-26 10:36:52','2022-12-25 12:10:39','2022-12-26 10:36:52');
INSERT INTO notifications VALUES('974bcec4-7464-4de7-8708-9d550a22f173','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":59,\"url\":\"client\\/view_invoice\\/093f65e080a295f8076b1c5722a46aa2\",\"client_url\":\"client\\/view_invoice\\/093f65e080a295f8076b1c5722a46aa2\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1059\"}','2','2022-12-26 10:37:01','2022-12-25 12:11:52','2022-12-26 10:37:01');
INSERT INTO notifications VALUES('f980b3ca-085f-49b2-acf6-0b16b97f263a','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":60,\"url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"client_url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1060\"}','2','2022-12-27 16:32:54','2022-12-26 11:33:36','2022-12-27 16:32:54');
INSERT INTO notifications VALUES('64cbd18f-ab8e-4578-b29e-a09ff21e83de','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":60,\"url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"client_url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1060\"}','2','2022-12-27 16:33:01','2022-12-26 11:55:35','2022-12-27 16:33:01');
INSERT INTO notifications VALUES('c286e30f-a261-4eca-bfef-a20a8d42d210','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":61,\"url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"client_url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1061\"}','2','','2022-12-28 10:51:03','2022-12-28 10:51:03');
INSERT INTO notifications VALUES('e9dcdd8b-8ec6-4d42-afb7-0ada51405d91','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":61,\"url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"client_url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1061\"}','2','2022-12-29 10:22:49','2022-12-28 10:51:03','2022-12-29 10:22:49');
INSERT INTO notifications VALUES('9843ce4a-9484-42d5-b4a6-f31b239e4684','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":62,\"url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"client_url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','','2022-12-28 11:09:31','2022-12-28 11:09:31');
INSERT INTO notifications VALUES('5b440dd6-3c9c-4b6b-b771-dabe17cff6db','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":62,\"url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"client_url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','2022-12-29 10:26:47','2022-12-28 11:09:31','2022-12-29 10:26:47');
INSERT INTO notifications VALUES('ae379963-a90e-45b3-a680-85568f1d0139','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":63,\"url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"client_url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','','2022-12-28 11:10:40','2022-12-28 11:10:40');
INSERT INTO notifications VALUES('cb824827-8160-4d0e-b52f-8707abb86d4a','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":63,\"url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"client_url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','2022-12-29 10:19:24','2022-12-28 11:10:40','2022-12-29 10:19:24');
INSERT INTO notifications VALUES('ebc01edd-683f-4ae7-b5c3-969926b5813f','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":64,\"url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"client_url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','','2022-12-28 11:11:05','2022-12-28 11:11:05');
INSERT INTO notifications VALUES('aae9a9cf-1f53-4b71-8c9c-6d224042ba30','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":64,\"url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"client_url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}','2','2022-12-29 10:19:14','2022-12-28 11:11:05','2022-12-29 10:19:14');
INSERT INTO notifications VALUES('23e380d3-6409-45d3-808e-eb6cb4430f3f','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":65,\"url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"client_url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1065\"}','2','','2022-12-28 11:14:03','2022-12-28 11:14:03');
INSERT INTO notifications VALUES('ea18f903-78e8-47a9-a7c6-5f8e3bd64398','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":65,\"url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"client_url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1065\"}','2','2022-12-28 11:36:29','2022-12-28 11:14:03','2022-12-28 11:36:29');
INSERT INTO notifications VALUES('654d91c4-e45f-492a-88d8-e384665975ac','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":66,\"url\":\"client\\/view_invoice\\/3295c76acbf4caaed33c36b1b5fc2cb1\",\"client_url\":\"client\\/view_invoice\\/3295c76acbf4caaed33c36b1b5fc2cb1\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1066\"}','2','2022-12-29 10:19:06','2022-12-28 12:51:29','2022-12-29 10:19:06');
INSERT INTO notifications VALUES('62f4783b-f5ef-4ee9-8a68-28c220a6c6eb','App\\Notifications\\InvoiceCreated','App\\User','3','{\"id\":67,\"url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"client_url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1067\"}','2','','2022-12-28 13:33:31','2022-12-28 13:33:31');
INSERT INTO notifications VALUES('5d066577-8647-4c4e-87c3-9e08a22cdf92','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":67,\"url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"client_url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1067\"}','2','2022-12-29 10:17:35','2022-12-28 13:33:31','2022-12-29 10:17:35');
INSERT INTO notifications VALUES('5230aef7-01e9-44df-b79b-3717f643ef45','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":68,\"url\":\"c\\/i\\/68\",\"client_url\":\"c\\/i\\/68\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1068\"}','2','2022-12-29 10:47:05','2022-12-29 10:46:41','2022-12-29 10:47:05');
INSERT INTO notifications VALUES('2a12c296-0897-4122-96d8-f35712bb579b','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":69,\"url\":\"c\\/i\\/ATA1069\",\"client_url\":\"c\\/i\\/ATA1069\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1069\"}','2','2022-12-29 10:58:11','2022-12-29 10:58:05','2022-12-29 10:58:11');
INSERT INTO notifications VALUES('5a537980-2686-47b7-a0ba-bafb4e631cf1','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":70,\"url\":\"c\\/i\\/ATA1070\",\"client_url\":\"c\\/i\\/ATA1070\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1070\"}','2','2023-01-01 14:45:56','2023-01-01 11:27:08','2023-01-01 14:45:56');
INSERT INTO notifications VALUES('0e532485-9fb9-4725-82f2-91d95513f57f','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-01 15:39:57','2023-01-01 12:17:37','2023-01-01 15:39:57');
INSERT INTO notifications VALUES('e634b963-1719-494e-b6b9-918db6fc829d','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1074\"}','2','2023-01-01 15:39:50','2023-01-01 12:58:38','2023-01-01 15:39:50');
INSERT INTO notifications VALUES('a96db23a-0a83-446a-8a49-f2be02cb25ae','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}','2','2023-01-02 11:56:36','2023-01-02 11:43:49','2023-01-02 11:56:36');
INSERT INTO notifications VALUES('d1f38402-49c5-4030-8bdb-d277fc70090f','App\\Notifications\\InvoiceCreated','App\\User','5','{\"id\":77,\"url\":\"c\\/i\\/MTC1002\",\"client_url\":\"c\\/i\\/MTC1002\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1002\"}','5','','2023-01-02 13:12:36','2023-01-02 13:12:36');
INSERT INTO notifications VALUES('09d112f9-0f38-4703-83c2-12ea70800f05','App\\Notifications\\InvoiceCreated','App\\User','5','{\"id\":80,\"url\":\"c\\/i\\/MTC1003\",\"client_url\":\"c\\/i\\/MTC1003\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1003\"}','5','','2023-01-02 13:28:14','2023-01-02 13:28:14');
INSERT INTO notifications VALUES('08c9c558-8dd8-468a-b65d-907527f31336','App\\Notifications\\InvoiceUpdated','App\\User','5','{\"id\":80,\"url\":\"c\\/i\\/MTC1003\",\"client_url\":\"c\\/i\\/MTC1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# MTC1003\"}','5','','2023-01-02 13:29:37','2023-01-02 13:29:37');
INSERT INTO notifications VALUES('18dcb29a-ff2a-4a92-bc08-c6465300a74c','App\\Notifications\\InvoiceCreated','App\\User','5','{\"id\":81,\"url\":\"c\\/i\\/MTC1006\",\"client_url\":\"c\\/i\\/MTC1006\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1006\"}','5','','2023-01-02 13:31:47','2023-01-02 13:31:47');
INSERT INTO notifications VALUES('547a8210-3401-416d-8819-1699e0c99b20','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}','2','2023-01-07 17:46:25','2023-01-07 17:32:42','2023-01-07 17:46:25');
INSERT INTO notifications VALUES('7b17d3a0-ffa9-4444-b8f5-fdfe9e231127','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}','2','2023-01-08 10:05:00','2023-01-07 17:32:47','2023-01-08 10:05:00');
INSERT INTO notifications VALUES('1863c305-1f35-483c-a809-be93722b0897','App\\Notifications\\InvoiceCreated','App\\User','26','{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1077\"}','2','','2023-01-09 10:20:21','2023-01-09 10:20:21');
INSERT INTO notifications VALUES('47aa1f91-2326-41d6-aa84-ec45e2889118','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1077\"}','2','2023-01-09 11:04:39','2023-01-09 10:20:21','2023-01-09 11:04:39');
INSERT INTO notifications VALUES('2aef0ea0-c38b-4915-86e4-7db04ce7559d','App\\Notifications\\InvoiceCreated','App\\User','26','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1078\"}','2','','2023-01-09 11:04:23','2023-01-09 11:04:23');
INSERT INTO notifications VALUES('324565eb-a215-41ab-8c81-211d8a7d6b2e','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1078\"}','2','2023-01-09 11:04:29','2023-01-09 11:04:23','2023-01-09 11:04:29');
INSERT INTO notifications VALUES('b0855cf6-c7f2-422f-921e-c5f74da95b1b','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}','2','','2023-01-09 12:47:35','2023-01-09 12:47:35');
INSERT INTO notifications VALUES('5d7cbc4c-998d-4aad-838b-7143ef4e272f','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}','2','2023-01-09 12:52:24','2023-01-09 12:47:35','2023-01-09 12:52:24');
INSERT INTO notifications VALUES('fa1219de-012f-45fd-9a4f-8c93bbdbe767','App\\Notifications\\InvoiceCreated','App\\User','26','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1079\"}','2','','2023-01-09 15:55:24','2023-01-09 15:55:24');
INSERT INTO notifications VALUES('c7a7d9fa-9173-4dc9-a413-203d95d7c9bb','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-09 16:57:17','2023-01-09 15:55:24','2023-01-09 16:57:17');
INSERT INTO notifications VALUES('1244c76c-8fc8-4299-94f9-264df4b4f8b8','App\\Notifications\\InvoiceCreated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-09 17:27:27','2023-01-09 17:27:27');
INSERT INTO notifications VALUES('a254d436-c1f3-4851-b886-b7eedde2ea5e','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 11:17:27','2023-01-09 17:27:27','2023-01-10 11:17:27');
INSERT INTO notifications VALUES('f376db2b-9f91-47e9-801c-45d52334ece1','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-09 17:27:54','2023-01-09 17:27:54');
INSERT INTO notifications VALUES('cc2f61a3-c39d-46ca-8273-ee8a33ee3c49','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 11:18:01','2023-01-09 17:27:54','2023-01-10 11:18:01');
INSERT INTO notifications VALUES('3ad5b065-1fe1-441d-a019-940e68aa55c9','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-09 17:28:11','2023-01-09 17:28:11');
INSERT INTO notifications VALUES('2a822c81-b54c-4b03-88a7-1ecd042cfd2a','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 11:17:45','2023-01-09 17:28:11','2023-01-10 11:17:45');
INSERT INTO notifications VALUES('271f59d1-2191-409b-ac88-8b1898396ca1','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-09 17:28:27','2023-01-09 17:28:27');
INSERT INTO notifications VALUES('06ea92d1-25c8-4a41-827a-bd3b4b68ebd2','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 11:30:11','2023-01-09 17:28:27','2023-01-10 11:30:11');
INSERT INTO notifications VALUES('df921046-f7b6-450f-a79e-d24a6154c82d','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-09 17:29:02','2023-01-09 17:29:02');
INSERT INTO notifications VALUES('4f2d5727-2f4a-475e-9b7c-efef7db71767','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 10:10:14','2023-01-09 17:29:02','2023-01-10 10:10:14');
INSERT INTO notifications VALUES('d01af875-a200-45b6-b6b0-1c76240c09d9','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','','2023-01-09 17:37:55','2023-01-09 17:37:55');
INSERT INTO notifications VALUES('d97bd79c-c5b7-4116-816e-efa6fff8cdc7','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-10 10:06:55','2023-01-09 17:37:55','2023-01-10 10:06:55');
INSERT INTO notifications VALUES('4ce4b794-09f4-4a36-9dd3-e3b5b4f83b11','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-10 11:16:00','2023-01-10 11:16:00');
INSERT INTO notifications VALUES('bfbb0e9d-ac50-44f0-89e3-56e96f21e14d','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-10 11:17:18','2023-01-10 11:16:00','2023-01-10 11:17:18');
INSERT INTO notifications VALUES('e3c3afb8-2d12-4280-bb95-7e7bcbb5483f','App\\Notifications\\InvoiceCreated','App\\User','26','{\"id\":87,\"url\":\"c\\/i\\/ATA1081\",\"client_url\":\"c\\/i\\/ATA1081\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1081\"}','2','','2023-01-22 15:49:44','2023-01-22 15:49:44');
INSERT INTO notifications VALUES('ea79374b-702d-4c5e-a139-9cbe8982be3f','App\\Notifications\\InvoiceCreated','App\\User','2','{\"id\":87,\"url\":\"c\\/i\\/ATA1081\",\"client_url\":\"c\\/i\\/ATA1081\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1081\"}','2','2023-01-22 17:44:33','2023-01-22 15:49:44','2023-01-22 17:44:33');
INSERT INTO notifications VALUES('85998aaa-dc6e-44d7-a89e-b45cec8ceeb3','App\\Notifications\\InvoiceUpdated','App\\User','3','{\"id\":3,\"url\":\"c\\/i\\/1003\",\"client_url\":\"c\\/i\\/1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}','2','','2023-01-22 16:05:59','2023-01-22 16:05:59');
INSERT INTO notifications VALUES('bf384833-88f9-4f6c-a6d5-ae0aa1b1933d','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":3,\"url\":\"c\\/i\\/1003\",\"client_url\":\"c\\/i\\/1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}','2','2023-01-22 17:44:27','2023-01-22 16:05:59','2023-01-22 17:44:27');
INSERT INTO notifications VALUES('05f746c8-96eb-4987-8ab7-e2ec49748534','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-23 12:15:27','2023-01-23 12:15:27');
INSERT INTO notifications VALUES('5ce3d912-7a16-4fbe-9596-f1d8d8eec2a7','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-24 10:30:05','2023-01-23 12:15:27','2023-01-24 10:30:05');
INSERT INTO notifications VALUES('af49590e-b516-43e4-b652-2a22f5a24520','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-23 12:26:16','2023-01-23 12:26:16');
INSERT INTO notifications VALUES('288d05fb-a713-4180-afc8-8e6cd9f41fcd','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-24 10:29:58','2023-01-23 12:26:16','2023-01-24 10:29:58');
INSERT INTO notifications VALUES('c524f242-6adf-44a2-a5f9-d0704ee6cc64','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-23 12:36:23','2023-01-23 12:36:23');
INSERT INTO notifications VALUES('9de5580d-3099-449d-8193-39013886611a','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-24 10:29:47','2023-01-23 12:36:23','2023-01-24 10:29:47');
INSERT INTO notifications VALUES('db35af34-a821-42f9-8a78-fce643d666c1','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-23 12:40:45','2023-01-23 12:40:45');
INSERT INTO notifications VALUES('b150f478-7350-4ef9-a84e-d7a2b788a7ef','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-23 15:17:00','2023-01-23 12:40:45','2023-01-23 15:17:00');
INSERT INTO notifications VALUES('eb564107-d089-4f65-b577-5f546167eace','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','','2023-01-25 16:37:26','2023-01-25 16:37:26');
INSERT INTO notifications VALUES('44f90d88-1a18-4a13-970f-752290d2bc50','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-26 12:01:15','2023-01-25 16:37:26','2023-01-26 12:01:15');
INSERT INTO notifications VALUES('ad411c83-5f38-4aa9-b268-be54b0637f7d','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-26 12:01:06','2023-01-26 11:21:27','2023-01-26 12:01:06');
INSERT INTO notifications VALUES('672cc4e6-4020-482c-8d51-d472dea1b918','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}','2','2023-01-26 12:01:01','2023-01-26 11:41:32','2023-01-26 12:01:01');
INSERT INTO notifications VALUES('1b6eba6c-d2d6-45a9-ab23-09bce633f5a9','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','','2023-01-26 11:44:55','2023-01-26 11:44:55');
INSERT INTO notifications VALUES('42d1349e-a708-4d36-bd52-10d6aa850dcd','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','2023-01-26 12:00:56','2023-01-26 11:44:55','2023-01-26 12:00:56');
INSERT INTO notifications VALUES('2b22c29d-8e38-4834-801b-3c2efe3cc24c','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','','2023-01-26 11:45:24','2023-01-26 11:45:24');
INSERT INTO notifications VALUES('d2428bf0-80c5-46f8-9d92-74573064c75c','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','2023-01-26 12:00:51','2023-01-26 11:45:24','2023-01-26 12:00:51');
INSERT INTO notifications VALUES('0bf1e0ea-189b-4df8-b2ab-f5953ab0757b','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','','2023-01-26 11:46:22','2023-01-26 11:46:22');
INSERT INTO notifications VALUES('41f6c862-fc74-40e2-9f82-5a21b759d188','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','2023-01-26 12:00:45','2023-01-26 11:46:22','2023-01-26 12:00:45');
INSERT INTO notifications VALUES('c32a1fb5-b720-4bbe-afe2-16bfdc838e1e','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','2023-01-26 12:21:02','2023-01-26 12:18:27','2023-01-26 12:21:02');
INSERT INTO notifications VALUES('96e418a3-40c6-40d4-ba18-595b74c0342c','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-26 12:19:17','2023-01-26 12:19:17');
INSERT INTO notifications VALUES('1a86f3a3-b4e1-43e2-866d-9e914d7c1797','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-26 12:21:08','2023-01-26 12:19:17','2023-01-26 12:21:08');
INSERT INTO notifications VALUES('f280c356-2d8e-4e2c-a4e3-7aaf60bd9416','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-26 12:19:42','2023-01-26 12:19:42');
INSERT INTO notifications VALUES('a767d38e-a9f4-46e3-874a-d14cd5da86f6','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-26 12:21:42','2023-01-26 12:19:42','2023-01-26 12:21:42');
INSERT INTO notifications VALUES('ed967596-747b-4b32-b0c4-f35afe24a57a','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-26 12:20:57','2023-01-26 12:20:57');
INSERT INTO notifications VALUES('9eba70c7-7894-455c-a113-98af6482b2e2','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-26 12:21:46','2023-01-26 12:20:57','2023-01-26 12:21:46');
INSERT INTO notifications VALUES('37637d9c-6937-4f19-a480-68a24ad71901','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','','2023-01-26 16:37:04','2023-01-26 16:37:04');
INSERT INTO notifications VALUES('6b1b4809-6397-4fcf-9f90-7024dbf9c4c6','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-28 10:28:47','2023-01-26 16:37:04','2023-01-28 10:28:47');
INSERT INTO notifications VALUES('dde2e9e7-b100-4e94-80bc-b8d684570c35','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','','2023-01-26 16:37:43','2023-01-26 16:37:43');
INSERT INTO notifications VALUES('051f75b0-03ef-454a-8524-bf55df7bb198','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-28 10:29:03','2023-01-26 16:37:43','2023-01-28 10:29:03');
INSERT INTO notifications VALUES('e008c4d5-38dd-4c21-8113-246fa5913385','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','','2023-01-26 16:52:01','2023-01-26 16:52:01');
INSERT INTO notifications VALUES('f64b41e3-9815-441e-b57a-7744d06d2dde','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}','2','2023-01-28 10:28:40','2023-01-26 16:52:01','2023-01-28 10:28:40');
INSERT INTO notifications VALUES('833fb6cb-9065-40c0-8061-f7bd931e9d63','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}','2','','2023-01-26 16:52:45','2023-01-26 16:52:45');
INSERT INTO notifications VALUES('63dc0f6c-324f-4970-8631-7d90dd8d9674','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}','2','2023-01-28 10:28:34','2023-01-26 16:52:45','2023-01-28 10:28:34');
INSERT INTO notifications VALUES('aedab74c-4740-4d10-a30f-8ac325ee9dfd','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}','2','','2023-01-26 16:54:22','2023-01-26 16:54:22');
INSERT INTO notifications VALUES('8c023755-6617-4680-bc5b-aaeacbc530f3','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}','2','2023-01-28 10:28:29','2023-01-26 16:54:22','2023-01-28 10:28:29');
INSERT INTO notifications VALUES('801b3279-685a-4301-9790-8ea5833f4ced','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','','2023-01-26 16:56:17','2023-01-26 16:56:17');
INSERT INTO notifications VALUES('8afac1d2-f68d-4fe6-a96c-6c9ebcaf1e8a','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}','2','2023-01-28 10:28:16','2023-01-26 16:56:17','2023-01-28 10:28:16');
INSERT INTO notifications VALUES('f1a38d20-c65d-45e9-ba5d-5f620ca7e2b5','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}','2','','2023-01-26 16:57:10','2023-01-26 16:57:10');
INSERT INTO notifications VALUES('6e6adf5b-b4be-4846-8e99-05b40c8b4234','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}','2','2023-01-28 10:28:02','2023-01-26 16:57:10','2023-01-28 10:28:02');
INSERT INTO notifications VALUES('c48d7f15-d2ba-4621-ba14-3888a9a1adc9','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','','2023-01-26 16:58:09','2023-01-26 16:58:09');
INSERT INTO notifications VALUES('4b383386-f88f-4a31-a376-5172e2612e36','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}','2','2023-01-28 10:27:29','2023-01-26 16:58:09','2023-01-28 10:27:29');
INSERT INTO notifications VALUES('b97e2cfd-1a44-4305-ac4b-f36b6ad8137d','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}','2','2023-01-28 17:04:00','2023-01-28 15:56:46','2023-01-28 17:04:00');
INSERT INTO notifications VALUES('9fa3dd20-eeee-4731-88b4-b8d5e855b3c0','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}','2','','2023-01-28 15:58:56','2023-01-28 15:58:56');
INSERT INTO notifications VALUES('73cf007b-98da-4717-b5b5-198c1e7930e2','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}','2','2023-01-28 17:03:56','2023-01-28 15:58:56','2023-01-28 17:03:56');
INSERT INTO notifications VALUES('b836e40f-a06f-4d18-bfb3-49377ffba037','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}','2','2023-01-28 17:03:51','2023-01-28 16:14:31','2023-01-28 17:03:51');
INSERT INTO notifications VALUES('d0128c7a-77a0-455f-8048-3e4ef11dae68','App\\Notifications\\InvoiceUpdated','App\\User','26','{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}','2','','2023-01-28 16:21:01','2023-01-28 16:21:01');
INSERT INTO notifications VALUES('35d7091f-12c8-49d8-86b8-186552974123','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}','2','2023-01-28 17:03:46','2023-01-28 16:21:01','2023-01-28 17:03:46');
INSERT INTO notifications VALUES('5dd70b44-9214-4813-9112-06a2539add64','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}','2','2023-01-28 17:03:41','2023-01-28 16:22:10','2023-01-28 17:03:41');
INSERT INTO notifications VALUES('0d8ccdbb-e463-4daa-b0cb-686b6e165f79','App\\Notifications\\InvoiceUpdated','App\\User','4','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','','2023-02-01 10:52:55','2023-02-01 10:52:55');
INSERT INTO notifications VALUES('63317cd8-061b-4565-8f51-46a88ba57dd5','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','2023-02-01 11:05:03','2023-02-01 10:52:55','2023-02-01 11:05:03');
INSERT INTO notifications VALUES('fcd925a2-1f61-4da8-a7a5-fb62e9f6ac8d','App\\Notifications\\InvoiceUpdated','App\\User','4','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','','2023-02-01 11:03:44','2023-02-01 11:03:44');
INSERT INTO notifications VALUES('7587815f-7aaf-45d1-843e-5f5ba4c3464a','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','2023-02-01 11:04:58','2023-02-01 11:03:44','2023-02-01 11:04:58');
INSERT INTO notifications VALUES('f5699db1-5f2c-4e2e-8ed5-4ded0664d481','App\\Notifications\\InvoiceUpdated','App\\User','4','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','','2023-02-01 11:04:13','2023-02-01 11:04:13');
INSERT INTO notifications VALUES('6b85a03b-61b3-44d6-a19f-d86d852db45b','App\\Notifications\\InvoiceUpdated','App\\User','2','{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}','2','2023-02-01 11:04:52','2023-02-01 11:04:13','2023-02-01 11:04:52');



DROP TABLE IF EXISTS packages;

CREATE TABLE `packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_per_month` decimal(10,2) NOT NULL,
  `cost_per_year` decimal(10,2) NOT NULL,
  `staff_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicles_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `invoice_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_transaction` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `live_chat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_manager` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrm_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_management_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_panel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `others` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO packages VALUES('1','Basic','500.00','5000.00','N;','a:2:{s:7:\"monthly\";s:3:\"500\";s:6:\"yearly\";s:4:\"1000\";}','N;','N;','N;','N;','N;','N;','N;','','','','N;','N;','a:2:{s:7:\"monthly\";s:2:\"No\";s:6:\"yearly\";s:3:\"Yes\";}','a:2:{s:7:\"monthly\";s:231:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\";s:6:\"yearly\";s:27:\"Yearly Package is important\";}','1','','','2023-11-04 17:20:10');
INSERT INTO packages VALUES('2','Standard','1000.00','10000.00','N;','a:2:{s:7:\"monthly\";s:4:\"1500\";s:6:\"yearly\";s:9:\"Unlimited\";}','N;','N;','N;','N;','N;','N;','N;','','','','N;','N;','a:2:{s:7:\"monthly\";s:2:\"No\";s:6:\"yearly\";s:2:\"No\";}','a:2:{s:7:\"monthly\";s:20:\"Test Package Monthly\";s:6:\"yearly\";s:19:\"Test Package Yearly\";}','1','','','2023-11-06 11:50:38');



DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS payment_histories;

CREATE TABLE `payment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `package_id` int NOT NULL,
  `package_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_histories VALUES('1','1','Buy Basic Package','Offline','BDT','10.00','1','monthly','paid','2022-11-01 10:24:37','2022-11-01 10:24:37');
INSERT INTO payment_histories VALUES('2','2','Buy Standard Package','Offline','BDT','10000.00','2','yearly','paid','2022-12-06 10:51:16','2022-12-06 10:51:16');
INSERT INTO payment_histories VALUES('3','17','Buy Standard Package','Offline','BDT','10000.00','2','yearly','paid','2023-01-04 12:23:46','2023-01-04 12:23:46');
INSERT INTO payment_histories VALUES('74','19','Buy Standard Package','BKash Mobile Banking','BDT','10000.00','2','yearly','paid','2023-01-05 12:45:10','2023-01-05 12:45:20');
INSERT INTO payment_histories VALUES('73','1','Buy Business Plus Package','BKash Mobile Banking','BDT','2000.00','3','monthly','paid','2023-01-05 12:34:05','2023-01-05 12:34:15');
INSERT INTO payment_histories VALUES('72','1','Buy Basic Package','BKash Mobile Banking','BDT','500.00','1','monthly','paid','2023-01-05 12:31:14','2023-01-05 12:31:23');
INSERT INTO payment_histories VALUES('71','18','Buy Business Plus Package','BKash Mobile Banking','BDT','2000.00','3','monthly','paid','2023-01-05 12:29:58','2023-01-05 12:30:09');
INSERT INTO payment_histories VALUES('70','18','Buy Business Plus Package','BKash Mobile Banking','BDT','20000.00','3','yearly','paid','2023-01-05 12:27:52','2023-01-05 12:28:01');
INSERT INTO payment_histories VALUES('69','18','Buy Standard Package','BKash Mobile Banking','BDT','1000.00','2','monthly','paid','2023-01-05 12:25:21','2023-01-05 12:25:30');
INSERT INTO payment_histories VALUES('68','18','Buy Standard Package','City Bank','BDT','1000.00','2','monthly','paid','2023-01-05 12:23:27','2023-01-05 12:23:39');
INSERT INTO payment_histories VALUES('67','18','Buy Standard Package','BKash Mobile Banking','BDT','1000.00','2','monthly','paid','2023-01-05 12:16:48','2023-01-05 12:17:00');
INSERT INTO payment_histories VALUES('66','18','Buy Standard Package','BKash Mobile Banking','BDT','1000.00','2','monthly','paid','2023-01-05 12:12:56','2023-01-05 12:13:05');
INSERT INTO payment_histories VALUES('76','1','Buy Business Plus Package','BKash Mobile Banking','BDT','20000.00','3','yearly','paid','2023-01-07 10:55:43','2023-01-07 10:55:54');
INSERT INTO payment_histories VALUES('59','18','Buy Standard Package','BKash Mobile Banking','BDT','1000.00','2','monthly','paid','2023-01-05 11:29:18','2023-01-05 11:32:57');
INSERT INTO payment_histories VALUES('77','1','Buy Business Plus Package','Offline','BDT','2000.00','3','monthly','paid','2023-01-11 16:48:18','2023-01-11 16:48:18');
INSERT INTO payment_histories VALUES('61','1','Buy Basic Package','BKash Mobile Banking','BDT','5000.00','1','yearly','paid','2023-01-05 11:35:36','2023-01-05 11:35:45');
INSERT INTO payment_histories VALUES('62','1','Buy Basic Package','QCASH','BDT','500.00','1','monthly','paid','2023-01-05 11:36:54','2023-01-05 11:39:16');
INSERT INTO payment_histories VALUES('63','1','Buy Basic Package','BKash Mobile Banking','BDT','500.00','1','monthly','paid','2023-01-05 11:48:43','2023-01-05 11:48:52');
INSERT INTO payment_histories VALUES('64','1','Buy Basic Package','City Bank','BDT','500.00','1','monthly','paid','2023-01-05 11:51:12','2023-01-05 11:51:24');
INSERT INTO payment_histories VALUES('65','18','Buy Standard Package','BKash Mobile Banking','BDT','1000.00','2','monthly','paid','2023-01-05 11:57:39','2023-01-05 11:57:48');
INSERT INTO payment_histories VALUES('125','1','Buy Business Plus Package','BKash Mobile Banking','BDT','2000.00','3','monthly','paid','2023-03-15 09:43:15','2023-03-15 09:49:30');
INSERT INTO payment_histories VALUES('126','1','Buy Business Plus Package','STANDARD CHARTERED B','BDT','2000.00','3','monthly','paid','2023-03-15 10:51:04','2023-03-15 10:51:41');
INSERT INTO payment_histories VALUES('129','1','Buy Business Plus Package','BKash Mobile Banking','BDT','2000.00','3','monthly','paid','2023-03-30 11:22:22','2023-03-30 11:22:33');
INSERT INTO payment_histories VALUES('132','20','Buy Business Plus Package','BRAC BANK, LTD.','BDT','2000.00','3','monthly','paid','2023-04-02 12:44:20','2023-04-02 12:45:04');
INSERT INTO payment_histories VALUES('133','21','Buy Business Plus Package','Offline','BDT','20000.00','3','yearly','paid','2023-04-06 13:34:41','2023-04-06 13:34:41');



DROP TABLE IF EXISTS payment_methods;

CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_methods VALUES('1','Cash','1','2022-11-01 11:06:28','2022-11-01 11:06:28');
INSERT INTO payment_methods VALUES('2','Bank','1','2022-12-14 14:42:28','2022-12-14 14:42:28');
INSERT INTO payment_methods VALUES('3','Cash','2','2023-01-02 13:11:30','2023-01-02 13:11:30');
INSERT INTO payment_methods VALUES('4','BKash Mobile Banking','1','2023-01-07 16:58:07','2023-01-07 16:58:07');
INSERT INTO payment_methods VALUES('5','Nagad','1','2023-01-26 11:20:33','2023-01-26 11:20:33');
INSERT INTO payment_methods VALUES('6','DBBL Mobile Banking','1','2023-01-26 11:31:50','2023-01-26 11:31:50');
INSERT INTO payment_methods VALUES('7','City Bank','1','2023-01-26 12:24:59','2023-01-26 12:24:59');
INSERT INTO payment_methods VALUES('8','TRUST BANK, LTD.','1','2023-01-28 15:42:50','2023-01-28 15:42:50');
INSERT INTO payment_methods VALUES('9','EASTERN BANK, LTD.','1','2023-01-28 16:11:50','2023-01-28 16:11:50');
INSERT INTO payment_methods VALUES('10','STANDARD CHARTERED BANK','1','2023-01-28 16:24:42','2023-01-28 16:24:42');



DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS product_units;

CREATE TABLE `product_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_units VALUES('1','kg','1','2022-12-08 12:02:45','2022-12-08 12:02:45');
INSERT INTO product_units VALUES('2','Ton','1','2023-01-18 13:41:45','2023-01-18 13:41:45');



DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `product_cost` decimal(10,2) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES('1','2','1','10.00','20.00','kg','exclusive','','test','2022-12-08 12:02:51','2022-12-08 12:02:51');
INSERT INTO products VALUES('2','3','1','120.00','150.00','kg','exclusive','','Test Description','2022-12-10 15:31:19','2022-12-10 15:31:19');
INSERT INTO products VALUES('3','4','1','120.00','100.00','kg','exclusive','','','2022-12-14 11:21:44','2022-12-14 11:21:44');



DROP TABLE IF EXISTS project_members;

CREATE TABLE `project_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO project_members VALUES('1','1','2','2022-12-14 14:50:17','2022-12-14 14:50:17');
INSERT INTO project_members VALUES('2','1','8','2022-12-14 14:50:17','2022-12-14 14:50:17');



DROP TABLE IF EXISTS project_milestones;

CREATE TABLE `project_milestones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `due_date` date NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS projects;

CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint NOT NULL,
  `progress` int DEFAULT NULL,
  `billing_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed_rate` decimal(10,2) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO projects VALUES('1','Test','6','100','fixed','in_progress','4000.00','','2022-12-14','2022-12-30','','','2','1','2022-12-14 14:50:17','2022-12-17 11:03:07');



DROP TABLE IF EXISTS purchase_order_item_taxes;

CREATE TABLE `purchase_order_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint NOT NULL,
  `purchase_order_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_order_items;

CREATE TABLE `purchase_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_order_items VALUES('2','1','2','test','1.00','20.00','0.00','','','0.00','20.00','1','2023-01-07 10:59:39','2023-01-07 10:59:39');



DROP TABLE IF EXISTS purchase_orders;

CREATE TABLE `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `supplier_id` bigint NOT NULL,
  `order_status` tinyint NOT NULL,
  `order_tax_id` bigint DEFAULT NULL,
  `order_tax` decimal(10,2) DEFAULT NULL,
  `order_discount` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `payment_status` tinyint NOT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_orders VALUES('1','2022-12-08','1','3','','0.00','0.00','5.00','20.00','25.00','25.00','2','1670479414storage.zip','','1','2022-12-08 12:03:34','2023-01-07 10:59:39');



DROP TABLE IF EXISTS purchase_return;

CREATE TABLE `purchase_return` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `return_date` date NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_return_item_taxes;

CREATE TABLE `purchase_return_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint NOT NULL,
  `purchase_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_return_items;

CREATE TABLE `purchase_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_item_taxes;

CREATE TABLE `quotation_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint NOT NULL,
  `quotation_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_items;

CREATE TABLE `quotation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotation_items VALUES('1','1','5','','5.00','20000.00','0.00','','','0.00','100000.00','2022-12-14 14:29:01','2022-12-14 14:29:01');



DROP TABLE IF EXISTS quotations;

CREATE TABLE `quotations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_date` date NOT NULL,
  `template` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `related_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO quotations VALUES('1','1001','2022-12-14','classic','100000.00','100000.00','0.00','test','contacts','6','1','2022-12-14 14:29:01','2022-12-14 14:29:01');



DROP TABLE IF EXISTS repeating_transactions;

CREATE TABLE `repeating_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `status` tinyint DEFAULT '0',
  `trans_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS report_date;

CREATE TABLE `report_date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rdate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rdate` (`rdate`)
) ENGINE=InnoDB AUTO_INCREMENT=1528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO report_date VALUES('1','2022-09-01');
INSERT INTO report_date VALUES('2','2022-09-02');
INSERT INTO report_date VALUES('3','2022-09-03');
INSERT INTO report_date VALUES('4','2022-09-04');
INSERT INTO report_date VALUES('6','2022-09-05');
INSERT INTO report_date VALUES('7','2022-09-06');
INSERT INTO report_date VALUES('8','2022-09-07');
INSERT INTO report_date VALUES('9','2022-09-08');
INSERT INTO report_date VALUES('13','2022-09-09');
INSERT INTO report_date VALUES('14','2022-09-10');
INSERT INTO report_date VALUES('15','2022-09-11');
INSERT INTO report_date VALUES('16','2022-09-12');
INSERT INTO report_date VALUES('17','2022-09-13');
INSERT INTO report_date VALUES('18','2022-09-14');
INSERT INTO report_date VALUES('19','2022-09-15');
INSERT INTO report_date VALUES('20','2022-09-16');
INSERT INTO report_date VALUES('28','2022-09-17');
INSERT INTO report_date VALUES('29','2022-09-18');
INSERT INTO report_date VALUES('30','2022-09-19');
INSERT INTO report_date VALUES('31','2022-09-20');
INSERT INTO report_date VALUES('32','2022-09-21');
INSERT INTO report_date VALUES('33','2022-09-22');
INSERT INTO report_date VALUES('34','2022-09-23');
INSERT INTO report_date VALUES('35','2022-09-24');
INSERT INTO report_date VALUES('36','2022-09-25');
INSERT INTO report_date VALUES('37','2022-09-26');
INSERT INTO report_date VALUES('38','2022-09-27');
INSERT INTO report_date VALUES('39','2022-09-28');
INSERT INTO report_date VALUES('40','2022-09-29');
INSERT INTO report_date VALUES('41','2022-09-30');
INSERT INTO report_date VALUES('42','2022-10-01');
INSERT INTO report_date VALUES('43','2022-10-02');
INSERT INTO report_date VALUES('59','2022-10-03');
INSERT INTO report_date VALUES('60','2022-10-04');
INSERT INTO report_date VALUES('61','2022-10-05');
INSERT INTO report_date VALUES('62','2022-10-06');
INSERT INTO report_date VALUES('63','2022-10-07');
INSERT INTO report_date VALUES('64','2022-10-08');
INSERT INTO report_date VALUES('65','2022-10-09');
INSERT INTO report_date VALUES('66','2022-10-10');
INSERT INTO report_date VALUES('67','2022-10-11');
INSERT INTO report_date VALUES('68','2022-10-12');
INSERT INTO report_date VALUES('69','2022-10-13');
INSERT INTO report_date VALUES('70','2022-10-14');
INSERT INTO report_date VALUES('71','2022-10-15');
INSERT INTO report_date VALUES('72','2022-10-16');
INSERT INTO report_date VALUES('73','2022-10-17');
INSERT INTO report_date VALUES('74','2022-10-18');
INSERT INTO report_date VALUES('75','2022-10-19');
INSERT INTO report_date VALUES('76','2022-10-20');
INSERT INTO report_date VALUES('77','2022-10-21');
INSERT INTO report_date VALUES('78','2022-10-22');
INSERT INTO report_date VALUES('79','2022-10-23');
INSERT INTO report_date VALUES('80','2022-10-24');
INSERT INTO report_date VALUES('81','2022-10-25');
INSERT INTO report_date VALUES('82','2022-10-26');
INSERT INTO report_date VALUES('83','2022-10-27');
INSERT INTO report_date VALUES('84','2022-10-28');
INSERT INTO report_date VALUES('85','2022-10-29');
INSERT INTO report_date VALUES('86','2022-10-30');
INSERT INTO report_date VALUES('87','2022-10-31');
INSERT INTO report_date VALUES('88','2022-11-01');
INSERT INTO report_date VALUES('89','2022-11-02');
INSERT INTO report_date VALUES('90','2022-11-03');
INSERT INTO report_date VALUES('122','2022-11-04');
INSERT INTO report_date VALUES('123','2022-11-05');
INSERT INTO report_date VALUES('124','2022-11-06');
INSERT INTO report_date VALUES('125','2022-11-07');
INSERT INTO report_date VALUES('126','2022-11-08');
INSERT INTO report_date VALUES('127','2022-11-09');
INSERT INTO report_date VALUES('128','2022-11-10');
INSERT INTO report_date VALUES('129','2022-11-11');
INSERT INTO report_date VALUES('130','2022-11-12');
INSERT INTO report_date VALUES('131','2022-11-13');
INSERT INTO report_date VALUES('132','2022-11-14');
INSERT INTO report_date VALUES('133','2022-11-15');
INSERT INTO report_date VALUES('134','2022-11-16');
INSERT INTO report_date VALUES('135','2022-11-17');
INSERT INTO report_date VALUES('136','2022-11-18');
INSERT INTO report_date VALUES('137','2022-11-19');
INSERT INTO report_date VALUES('138','2022-11-20');
INSERT INTO report_date VALUES('139','2022-11-21');
INSERT INTO report_date VALUES('140','2022-11-22');
INSERT INTO report_date VALUES('141','2022-11-23');
INSERT INTO report_date VALUES('142','2022-11-24');
INSERT INTO report_date VALUES('143','2022-11-25');
INSERT INTO report_date VALUES('144','2022-11-26');
INSERT INTO report_date VALUES('145','2022-11-27');
INSERT INTO report_date VALUES('146','2022-11-28');
INSERT INTO report_date VALUES('147','2022-11-29');
INSERT INTO report_date VALUES('148','2022-11-30');
INSERT INTO report_date VALUES('149','2022-12-01');
INSERT INTO report_date VALUES('150','2022-12-02');
INSERT INTO report_date VALUES('151','2022-12-03');
INSERT INTO report_date VALUES('152','2022-12-04');
INSERT INTO report_date VALUES('153','2022-12-05');
INSERT INTO report_date VALUES('154','2022-12-06');
INSERT INTO report_date VALUES('155','2022-12-07');
INSERT INTO report_date VALUES('156','2022-12-08');
INSERT INTO report_date VALUES('157','2022-12-09');
INSERT INTO report_date VALUES('158','2022-12-10');
INSERT INTO report_date VALUES('159','2022-12-11');
INSERT INTO report_date VALUES('160','2022-12-12');
INSERT INTO report_date VALUES('161','2022-12-13');
INSERT INTO report_date VALUES('162','2022-12-14');
INSERT INTO report_date VALUES('163','2022-12-15');
INSERT INTO report_date VALUES('164','2022-12-16');
INSERT INTO report_date VALUES('165','2022-12-17');
INSERT INTO report_date VALUES('166','2022-12-18');
INSERT INTO report_date VALUES('167','2022-12-19');
INSERT INTO report_date VALUES('168','2022-12-20');
INSERT INTO report_date VALUES('169','2022-12-21');
INSERT INTO report_date VALUES('170','2022-12-22');
INSERT INTO report_date VALUES('171','2022-12-23');
INSERT INTO report_date VALUES('172','2022-12-24');
INSERT INTO report_date VALUES('173','2022-12-25');
INSERT INTO report_date VALUES('174','2022-12-26');
INSERT INTO report_date VALUES('175','2022-12-27');
INSERT INTO report_date VALUES('176','2022-12-28');
INSERT INTO report_date VALUES('177','2022-12-29');
INSERT INTO report_date VALUES('178','2022-12-30');
INSERT INTO report_date VALUES('179','2022-12-31');
INSERT INTO report_date VALUES('180','2023-01-01');
INSERT INTO report_date VALUES('181','2023-01-02');
INSERT INTO report_date VALUES('182','2023-01-03');
INSERT INTO report_date VALUES('183','2023-01-04');
INSERT INTO report_date VALUES('184','2023-01-05');
INSERT INTO report_date VALUES('185','2023-01-06');
INSERT INTO report_date VALUES('249','2023-01-07');
INSERT INTO report_date VALUES('250','2023-01-08');
INSERT INTO report_date VALUES('251','2023-01-09');
INSERT INTO report_date VALUES('252','2023-01-10');
INSERT INTO report_date VALUES('253','2023-01-11');
INSERT INTO report_date VALUES('254','2023-01-12');
INSERT INTO report_date VALUES('255','2023-01-13');
INSERT INTO report_date VALUES('256','2023-01-14');
INSERT INTO report_date VALUES('257','2023-01-15');
INSERT INTO report_date VALUES('258','2023-01-16');
INSERT INTO report_date VALUES('259','2023-01-17');
INSERT INTO report_date VALUES('260','2023-01-18');
INSERT INTO report_date VALUES('261','2023-01-19');
INSERT INTO report_date VALUES('262','2023-01-20');
INSERT INTO report_date VALUES('263','2023-01-21');
INSERT INTO report_date VALUES('264','2023-01-22');
INSERT INTO report_date VALUES('265','2023-01-23');
INSERT INTO report_date VALUES('266','2023-01-24');
INSERT INTO report_date VALUES('267','2023-01-25');
INSERT INTO report_date VALUES('268','2023-01-26');
INSERT INTO report_date VALUES('269','2023-01-27');
INSERT INTO report_date VALUES('270','2023-01-28');
INSERT INTO report_date VALUES('271','2023-01-29');
INSERT INTO report_date VALUES('272','2023-01-30');
INSERT INTO report_date VALUES('273','2023-01-31');
INSERT INTO report_date VALUES('274','2023-02-01');
INSERT INTO report_date VALUES('275','2023-02-02');
INSERT INTO report_date VALUES('276','2023-02-03');
INSERT INTO report_date VALUES('277','2023-02-04');
INSERT INTO report_date VALUES('278','2023-02-05');
INSERT INTO report_date VALUES('279','2023-02-06');
INSERT INTO report_date VALUES('280','2023-02-07');
INSERT INTO report_date VALUES('281','2023-02-08');
INSERT INTO report_date VALUES('282','2023-02-09');
INSERT INTO report_date VALUES('283','2023-02-10');
INSERT INTO report_date VALUES('284','2023-02-11');
INSERT INTO report_date VALUES('285','2023-02-12');
INSERT INTO report_date VALUES('286','2023-02-13');
INSERT INTO report_date VALUES('287','2023-02-14');
INSERT INTO report_date VALUES('288','2023-02-15');
INSERT INTO report_date VALUES('289','2023-02-16');
INSERT INTO report_date VALUES('290','2023-02-17');
INSERT INTO report_date VALUES('291','2023-02-18');
INSERT INTO report_date VALUES('292','2023-02-19');
INSERT INTO report_date VALUES('293','2023-02-20');
INSERT INTO report_date VALUES('294','2023-02-21');
INSERT INTO report_date VALUES('295','2023-02-22');
INSERT INTO report_date VALUES('296','2023-02-23');
INSERT INTO report_date VALUES('297','2023-02-24');
INSERT INTO report_date VALUES('298','2023-02-25');
INSERT INTO report_date VALUES('299','2023-02-26');
INSERT INTO report_date VALUES('300','2023-02-27');
INSERT INTO report_date VALUES('301','2023-02-28');
INSERT INTO report_date VALUES('302','2023-03-01');
INSERT INTO report_date VALUES('303','2023-03-02');
INSERT INTO report_date VALUES('304','2023-03-03');
INSERT INTO report_date VALUES('305','2023-03-04');
INSERT INTO report_date VALUES('306','2023-03-05');
INSERT INTO report_date VALUES('307','2023-03-06');
INSERT INTO report_date VALUES('308','2023-03-07');
INSERT INTO report_date VALUES('309','2023-03-08');
INSERT INTO report_date VALUES('310','2023-03-09');
INSERT INTO report_date VALUES('311','2023-03-10');
INSERT INTO report_date VALUES('312','2023-03-11');
INSERT INTO report_date VALUES('313','2023-03-12');
INSERT INTO report_date VALUES('314','2023-03-13');
INSERT INTO report_date VALUES('315','2023-03-14');
INSERT INTO report_date VALUES('316','2023-03-15');
INSERT INTO report_date VALUES('317','2023-03-16');
INSERT INTO report_date VALUES('318','2023-03-17');
INSERT INTO report_date VALUES('319','2023-03-18');
INSERT INTO report_date VALUES('320','2023-03-19');
INSERT INTO report_date VALUES('321','2023-03-20');
INSERT INTO report_date VALUES('322','2023-03-21');
INSERT INTO report_date VALUES('323','2023-03-22');
INSERT INTO report_date VALUES('324','2023-03-23');
INSERT INTO report_date VALUES('325','2023-03-24');
INSERT INTO report_date VALUES('326','2023-03-25');
INSERT INTO report_date VALUES('327','2023-03-26');
INSERT INTO report_date VALUES('328','2023-03-27');
INSERT INTO report_date VALUES('329','2023-03-28');
INSERT INTO report_date VALUES('330','2023-03-29');
INSERT INTO report_date VALUES('331','2023-03-30');
INSERT INTO report_date VALUES('332','2023-03-31');
INSERT INTO report_date VALUES('333','2023-04-01');
INSERT INTO report_date VALUES('334','2023-04-02');
INSERT INTO report_date VALUES('335','2023-04-03');
INSERT INTO report_date VALUES('336','2023-04-04');
INSERT INTO report_date VALUES('337','2023-04-05');
INSERT INTO report_date VALUES('338','2023-04-06');
INSERT INTO report_date VALUES('339','2023-04-07');
INSERT INTO report_date VALUES('340','2023-04-08');
INSERT INTO report_date VALUES('341','2023-04-09');
INSERT INTO report_date VALUES('342','2023-04-10');
INSERT INTO report_date VALUES('343','2023-04-11');
INSERT INTO report_date VALUES('344','2023-04-12');
INSERT INTO report_date VALUES('345','2023-04-13');
INSERT INTO report_date VALUES('346','2023-04-14');
INSERT INTO report_date VALUES('347','2023-04-15');
INSERT INTO report_date VALUES('348','2023-04-16');
INSERT INTO report_date VALUES('349','2023-04-17');
INSERT INTO report_date VALUES('350','2023-04-18');
INSERT INTO report_date VALUES('351','2023-04-19');
INSERT INTO report_date VALUES('352','2023-04-20');
INSERT INTO report_date VALUES('353','2023-04-21');
INSERT INTO report_date VALUES('354','2023-04-22');
INSERT INTO report_date VALUES('355','2023-04-23');
INSERT INTO report_date VALUES('356','2023-04-24');
INSERT INTO report_date VALUES('357','2023-04-25');
INSERT INTO report_date VALUES('358','2023-04-26');
INSERT INTO report_date VALUES('359','2023-04-27');
INSERT INTO report_date VALUES('360','2023-04-28');
INSERT INTO report_date VALUES('361','2023-04-29');
INSERT INTO report_date VALUES('362','2023-04-30');
INSERT INTO report_date VALUES('363','2023-05-01');
INSERT INTO report_date VALUES('364','2023-05-02');
INSERT INTO report_date VALUES('365','2023-05-03');
INSERT INTO report_date VALUES('366','2023-05-04');
INSERT INTO report_date VALUES('367','2023-05-05');
INSERT INTO report_date VALUES('368','2023-05-06');
INSERT INTO report_date VALUES('369','2023-05-07');
INSERT INTO report_date VALUES('370','2023-05-08');
INSERT INTO report_date VALUES('371','2023-05-09');
INSERT INTO report_date VALUES('372','2023-05-10');
INSERT INTO report_date VALUES('373','2023-05-11');
INSERT INTO report_date VALUES('374','2023-05-12');
INSERT INTO report_date VALUES('375','2023-05-13');
INSERT INTO report_date VALUES('376','2023-05-14');
INSERT INTO report_date VALUES('504','2023-05-15');
INSERT INTO report_date VALUES('505','2023-05-16');
INSERT INTO report_date VALUES('506','2023-05-17');
INSERT INTO report_date VALUES('507','2023-05-18');
INSERT INTO report_date VALUES('508','2023-05-19');
INSERT INTO report_date VALUES('509','2023-05-20');
INSERT INTO report_date VALUES('510','2023-05-21');
INSERT INTO report_date VALUES('511','2023-05-22');
INSERT INTO report_date VALUES('512','2023-05-23');
INSERT INTO report_date VALUES('513','2023-05-24');
INSERT INTO report_date VALUES('514','2023-05-25');
INSERT INTO report_date VALUES('515','2023-05-26');
INSERT INTO report_date VALUES('516','2023-05-27');
INSERT INTO report_date VALUES('517','2023-05-28');
INSERT INTO report_date VALUES('518','2023-05-29');
INSERT INTO report_date VALUES('519','2023-05-30');
INSERT INTO report_date VALUES('520','2023-05-31');
INSERT INTO report_date VALUES('521','2023-06-01');
INSERT INTO report_date VALUES('522','2023-06-02');
INSERT INTO report_date VALUES('523','2023-06-03');
INSERT INTO report_date VALUES('524','2023-06-04');
INSERT INTO report_date VALUES('525','2023-06-05');
INSERT INTO report_date VALUES('526','2023-06-06');
INSERT INTO report_date VALUES('527','2023-06-07');
INSERT INTO report_date VALUES('528','2023-06-08');
INSERT INTO report_date VALUES('529','2023-06-09');
INSERT INTO report_date VALUES('530','2023-06-10');
INSERT INTO report_date VALUES('531','2023-06-11');
INSERT INTO report_date VALUES('532','2023-06-12');
INSERT INTO report_date VALUES('533','2023-06-13');
INSERT INTO report_date VALUES('534','2023-06-14');
INSERT INTO report_date VALUES('535','2023-06-15');
INSERT INTO report_date VALUES('536','2023-06-16');
INSERT INTO report_date VALUES('537','2023-06-17');
INSERT INTO report_date VALUES('538','2023-06-18');
INSERT INTO report_date VALUES('539','2023-06-19');
INSERT INTO report_date VALUES('540','2023-06-20');
INSERT INTO report_date VALUES('541','2023-06-21');
INSERT INTO report_date VALUES('542','2023-06-22');
INSERT INTO report_date VALUES('543','2023-06-23');
INSERT INTO report_date VALUES('544','2023-06-24');
INSERT INTO report_date VALUES('545','2023-06-25');
INSERT INTO report_date VALUES('546','2023-06-26');
INSERT INTO report_date VALUES('547','2023-06-27');
INSERT INTO report_date VALUES('548','2023-06-28');
INSERT INTO report_date VALUES('549','2023-06-29');
INSERT INTO report_date VALUES('550','2023-06-30');
INSERT INTO report_date VALUES('551','2023-07-01');
INSERT INTO report_date VALUES('552','2023-07-02');
INSERT INTO report_date VALUES('553','2023-07-03');
INSERT INTO report_date VALUES('554','2023-07-04');
INSERT INTO report_date VALUES('555','2023-07-05');
INSERT INTO report_date VALUES('556','2023-07-06');
INSERT INTO report_date VALUES('557','2023-07-07');
INSERT INTO report_date VALUES('558','2023-07-08');
INSERT INTO report_date VALUES('559','2023-07-09');
INSERT INTO report_date VALUES('560','2023-07-10');
INSERT INTO report_date VALUES('561','2023-07-11');
INSERT INTO report_date VALUES('562','2023-07-12');
INSERT INTO report_date VALUES('563','2023-07-13');
INSERT INTO report_date VALUES('564','2023-07-14');
INSERT INTO report_date VALUES('565','2023-07-15');
INSERT INTO report_date VALUES('566','2023-07-16');
INSERT INTO report_date VALUES('567','2023-07-17');
INSERT INTO report_date VALUES('568','2023-07-18');
INSERT INTO report_date VALUES('569','2023-07-19');
INSERT INTO report_date VALUES('570','2023-07-20');
INSERT INTO report_date VALUES('571','2023-07-21');
INSERT INTO report_date VALUES('572','2023-07-22');
INSERT INTO report_date VALUES('573','2023-07-23');
INSERT INTO report_date VALUES('574','2023-07-24');
INSERT INTO report_date VALUES('575','2023-07-25');
INSERT INTO report_date VALUES('576','2023-07-26');
INSERT INTO report_date VALUES('577','2023-07-27');
INSERT INTO report_date VALUES('578','2023-07-28');
INSERT INTO report_date VALUES('579','2023-07-29');
INSERT INTO report_date VALUES('580','2023-07-30');
INSERT INTO report_date VALUES('581','2023-07-31');
INSERT INTO report_date VALUES('582','2023-08-01');
INSERT INTO report_date VALUES('583','2023-08-02');
INSERT INTO report_date VALUES('584','2023-08-03');
INSERT INTO report_date VALUES('585','2023-08-04');
INSERT INTO report_date VALUES('586','2023-08-05');
INSERT INTO report_date VALUES('587','2023-08-06');
INSERT INTO report_date VALUES('588','2023-08-07');
INSERT INTO report_date VALUES('589','2023-08-08');
INSERT INTO report_date VALUES('590','2023-08-09');
INSERT INTO report_date VALUES('591','2023-08-10');
INSERT INTO report_date VALUES('592','2023-08-11');
INSERT INTO report_date VALUES('593','2023-08-12');
INSERT INTO report_date VALUES('594','2023-08-13');
INSERT INTO report_date VALUES('595','2023-08-14');
INSERT INTO report_date VALUES('596','2023-08-15');
INSERT INTO report_date VALUES('597','2023-08-16');
INSERT INTO report_date VALUES('598','2023-08-17');
INSERT INTO report_date VALUES('599','2023-08-18');
INSERT INTO report_date VALUES('600','2023-08-19');
INSERT INTO report_date VALUES('601','2023-08-20');
INSERT INTO report_date VALUES('602','2023-08-21');
INSERT INTO report_date VALUES('603','2023-08-22');
INSERT INTO report_date VALUES('604','2023-08-23');
INSERT INTO report_date VALUES('605','2023-08-24');
INSERT INTO report_date VALUES('606','2023-08-25');
INSERT INTO report_date VALUES('607','2023-08-26');
INSERT INTO report_date VALUES('608','2023-08-27');
INSERT INTO report_date VALUES('609','2023-08-28');
INSERT INTO report_date VALUES('610','2023-08-29');
INSERT INTO report_date VALUES('611','2023-08-30');
INSERT INTO report_date VALUES('612','2023-08-31');
INSERT INTO report_date VALUES('613','2023-09-01');
INSERT INTO report_date VALUES('614','2023-09-02');
INSERT INTO report_date VALUES('615','2023-09-03');
INSERT INTO report_date VALUES('616','2023-09-04');
INSERT INTO report_date VALUES('617','2023-09-05');
INSERT INTO report_date VALUES('618','2023-09-06');
INSERT INTO report_date VALUES('619','2023-09-07');
INSERT INTO report_date VALUES('620','2023-09-08');
INSERT INTO report_date VALUES('621','2023-09-09');
INSERT INTO report_date VALUES('622','2023-09-10');
INSERT INTO report_date VALUES('623','2023-09-11');
INSERT INTO report_date VALUES('624','2023-09-12');
INSERT INTO report_date VALUES('625','2023-09-13');
INSERT INTO report_date VALUES('626','2023-09-14');
INSERT INTO report_date VALUES('627','2023-09-15');
INSERT INTO report_date VALUES('628','2023-09-16');
INSERT INTO report_date VALUES('629','2023-09-17');
INSERT INTO report_date VALUES('630','2023-09-18');
INSERT INTO report_date VALUES('631','2023-09-19');
INSERT INTO report_date VALUES('632','2023-09-20');
INSERT INTO report_date VALUES('633','2023-09-21');
INSERT INTO report_date VALUES('634','2023-09-22');
INSERT INTO report_date VALUES('635','2023-09-23');
INSERT INTO report_date VALUES('636','2023-09-24');
INSERT INTO report_date VALUES('637','2023-09-25');
INSERT INTO report_date VALUES('638','2023-09-26');
INSERT INTO report_date VALUES('639','2023-09-27');
INSERT INTO report_date VALUES('640','2023-09-28');
INSERT INTO report_date VALUES('641','2023-09-29');
INSERT INTO report_date VALUES('642','2023-09-30');
INSERT INTO report_date VALUES('643','2023-10-01');
INSERT INTO report_date VALUES('644','2023-10-02');
INSERT INTO report_date VALUES('645','2023-10-03');
INSERT INTO report_date VALUES('646','2023-10-04');
INSERT INTO report_date VALUES('647','2023-10-05');
INSERT INTO report_date VALUES('648','2023-10-06');
INSERT INTO report_date VALUES('649','2023-10-07');
INSERT INTO report_date VALUES('650','2023-10-08');
INSERT INTO report_date VALUES('651','2023-10-09');
INSERT INTO report_date VALUES('652','2023-10-10');
INSERT INTO report_date VALUES('653','2023-10-11');
INSERT INTO report_date VALUES('654','2023-10-12');
INSERT INTO report_date VALUES('655','2023-10-13');
INSERT INTO report_date VALUES('656','2023-10-14');
INSERT INTO report_date VALUES('657','2023-10-15');
INSERT INTO report_date VALUES('658','2023-10-16');
INSERT INTO report_date VALUES('659','2023-10-17');
INSERT INTO report_date VALUES('660','2023-10-18');
INSERT INTO report_date VALUES('661','2023-10-19');
INSERT INTO report_date VALUES('662','2023-10-20');
INSERT INTO report_date VALUES('663','2023-10-21');
INSERT INTO report_date VALUES('664','2023-10-22');
INSERT INTO report_date VALUES('665','2023-10-23');
INSERT INTO report_date VALUES('666','2023-10-24');
INSERT INTO report_date VALUES('667','2023-10-25');
INSERT INTO report_date VALUES('668','2023-10-26');
INSERT INTO report_date VALUES('669','2023-10-27');
INSERT INTO report_date VALUES('670','2023-10-28');
INSERT INTO report_date VALUES('671','2023-10-29');
INSERT INTO report_date VALUES('672','2023-10-30');
INSERT INTO report_date VALUES('673','2023-10-31');
INSERT INTO report_date VALUES('674','2023-11-01');
INSERT INTO report_date VALUES('675','2023-11-02');
INSERT INTO report_date VALUES('676','2023-11-03');
INSERT INTO report_date VALUES('677','2023-11-04');
INSERT INTO report_date VALUES('678','2023-11-05');
INSERT INTO report_date VALUES('679','2023-11-06');
INSERT INTO report_date VALUES('680','2023-11-07');
INSERT INTO report_date VALUES('681','2023-11-08');
INSERT INTO report_date VALUES('682','2023-11-09');
INSERT INTO report_date VALUES('683','2023-11-10');
INSERT INTO report_date VALUES('684','2023-11-11');
INSERT INTO report_date VALUES('685','2023-11-12');
INSERT INTO report_date VALUES('686','2023-11-13');
INSERT INTO report_date VALUES('687','2023-11-14');
INSERT INTO report_date VALUES('688','2023-11-15');
INSERT INTO report_date VALUES('689','2023-11-16');
INSERT INTO report_date VALUES('690','2023-11-17');
INSERT INTO report_date VALUES('691','2023-11-18');
INSERT INTO report_date VALUES('692','2023-11-19');
INSERT INTO report_date VALUES('693','2023-11-20');
INSERT INTO report_date VALUES('694','2023-11-21');
INSERT INTO report_date VALUES('695','2023-11-22');
INSERT INTO report_date VALUES('696','2023-11-23');
INSERT INTO report_date VALUES('697','2023-11-24');
INSERT INTO report_date VALUES('698','2023-11-25');
INSERT INTO report_date VALUES('699','2023-11-26');
INSERT INTO report_date VALUES('700','2023-11-27');
INSERT INTO report_date VALUES('701','2023-11-28');
INSERT INTO report_date VALUES('702','2023-11-29');
INSERT INTO report_date VALUES('703','2023-11-30');
INSERT INTO report_date VALUES('704','2023-12-01');
INSERT INTO report_date VALUES('705','2023-12-02');
INSERT INTO report_date VALUES('706','2023-12-03');
INSERT INTO report_date VALUES('707','2023-12-04');
INSERT INTO report_date VALUES('708','2023-12-05');
INSERT INTO report_date VALUES('709','2023-12-06');
INSERT INTO report_date VALUES('710','2023-12-07');
INSERT INTO report_date VALUES('711','2023-12-08');
INSERT INTO report_date VALUES('712','2023-12-09');
INSERT INTO report_date VALUES('713','2023-12-10');
INSERT INTO report_date VALUES('714','2023-12-11');
INSERT INTO report_date VALUES('715','2023-12-12');
INSERT INTO report_date VALUES('716','2023-12-13');
INSERT INTO report_date VALUES('717','2023-12-14');
INSERT INTO report_date VALUES('718','2023-12-15');
INSERT INTO report_date VALUES('719','2023-12-16');
INSERT INTO report_date VALUES('720','2023-12-17');
INSERT INTO report_date VALUES('721','2023-12-18');
INSERT INTO report_date VALUES('722','2023-12-19');
INSERT INTO report_date VALUES('723','2023-12-20');
INSERT INTO report_date VALUES('724','2023-12-21');
INSERT INTO report_date VALUES('725','2023-12-22');
INSERT INTO report_date VALUES('726','2023-12-23');
INSERT INTO report_date VALUES('727','2023-12-24');
INSERT INTO report_date VALUES('728','2023-12-25');
INSERT INTO report_date VALUES('729','2023-12-26');
INSERT INTO report_date VALUES('730','2023-12-27');
INSERT INTO report_date VALUES('731','2023-12-28');
INSERT INTO report_date VALUES('732','2023-12-29');
INSERT INTO report_date VALUES('733','2023-12-30');
INSERT INTO report_date VALUES('734','2023-12-31');
INSERT INTO report_date VALUES('735','2024-01-01');
INSERT INTO report_date VALUES('736','2024-01-02');
INSERT INTO report_date VALUES('737','2024-01-03');
INSERT INTO report_date VALUES('738','2024-01-04');
INSERT INTO report_date VALUES('739','2024-01-05');
INSERT INTO report_date VALUES('740','2024-01-06');
INSERT INTO report_date VALUES('741','2024-01-07');
INSERT INTO report_date VALUES('742','2024-01-08');
INSERT INTO report_date VALUES('743','2024-01-09');
INSERT INTO report_date VALUES('744','2024-01-10');
INSERT INTO report_date VALUES('745','2024-01-11');
INSERT INTO report_date VALUES('746','2024-01-12');
INSERT INTO report_date VALUES('747','2024-01-13');
INSERT INTO report_date VALUES('748','2024-01-14');
INSERT INTO report_date VALUES('749','2024-01-15');
INSERT INTO report_date VALUES('750','2024-01-16');
INSERT INTO report_date VALUES('751','2024-01-17');
INSERT INTO report_date VALUES('752','2024-01-18');
INSERT INTO report_date VALUES('753','2024-01-19');
INSERT INTO report_date VALUES('754','2024-01-20');
INSERT INTO report_date VALUES('755','2024-01-21');
INSERT INTO report_date VALUES('756','2024-01-22');
INSERT INTO report_date VALUES('757','2024-01-23');
INSERT INTO report_date VALUES('758','2024-01-24');
INSERT INTO report_date VALUES('759','2024-01-25');
INSERT INTO report_date VALUES('1015','2024-01-26');
INSERT INTO report_date VALUES('1016','2024-01-27');
INSERT INTO report_date VALUES('1017','2024-01-28');
INSERT INTO report_date VALUES('1018','2024-01-29');
INSERT INTO report_date VALUES('1019','2024-01-30');
INSERT INTO report_date VALUES('1020','2024-01-31');
INSERT INTO report_date VALUES('1021','2024-02-01');
INSERT INTO report_date VALUES('1022','2024-02-02');
INSERT INTO report_date VALUES('1023','2024-02-03');
INSERT INTO report_date VALUES('1024','2024-02-04');
INSERT INTO report_date VALUES('1025','2024-02-05');
INSERT INTO report_date VALUES('1026','2024-02-06');
INSERT INTO report_date VALUES('1027','2024-02-07');
INSERT INTO report_date VALUES('1028','2024-02-08');
INSERT INTO report_date VALUES('1029','2024-02-09');
INSERT INTO report_date VALUES('1030','2024-02-10');
INSERT INTO report_date VALUES('1031','2024-02-11');
INSERT INTO report_date VALUES('1032','2024-02-12');
INSERT INTO report_date VALUES('1033','2024-02-13');
INSERT INTO report_date VALUES('1034','2024-02-14');
INSERT INTO report_date VALUES('1035','2024-02-15');
INSERT INTO report_date VALUES('1036','2024-02-16');
INSERT INTO report_date VALUES('1037','2024-02-17');
INSERT INTO report_date VALUES('1038','2024-02-18');
INSERT INTO report_date VALUES('1039','2024-02-19');
INSERT INTO report_date VALUES('1040','2024-02-20');
INSERT INTO report_date VALUES('1041','2024-02-21');
INSERT INTO report_date VALUES('1042','2024-02-22');
INSERT INTO report_date VALUES('1043','2024-02-23');
INSERT INTO report_date VALUES('1044','2024-02-24');
INSERT INTO report_date VALUES('1045','2024-02-25');
INSERT INTO report_date VALUES('1046','2024-02-26');
INSERT INTO report_date VALUES('1047','2024-02-27');
INSERT INTO report_date VALUES('1048','2024-02-28');
INSERT INTO report_date VALUES('1049','2024-02-29');
INSERT INTO report_date VALUES('1050','2024-03-01');
INSERT INTO report_date VALUES('1051','2024-03-02');
INSERT INTO report_date VALUES('1052','2024-03-03');
INSERT INTO report_date VALUES('1053','2024-03-04');
INSERT INTO report_date VALUES('1054','2024-03-05');
INSERT INTO report_date VALUES('1055','2024-03-06');
INSERT INTO report_date VALUES('1056','2024-03-07');
INSERT INTO report_date VALUES('1057','2024-03-08');
INSERT INTO report_date VALUES('1058','2024-03-09');
INSERT INTO report_date VALUES('1059','2024-03-10');
INSERT INTO report_date VALUES('1060','2024-03-11');
INSERT INTO report_date VALUES('1061','2024-03-12');
INSERT INTO report_date VALUES('1062','2024-03-13');
INSERT INTO report_date VALUES('1063','2024-03-14');
INSERT INTO report_date VALUES('1064','2024-03-15');
INSERT INTO report_date VALUES('1065','2024-03-16');
INSERT INTO report_date VALUES('1066','2024-03-17');
INSERT INTO report_date VALUES('1067','2024-03-18');
INSERT INTO report_date VALUES('1068','2024-03-19');
INSERT INTO report_date VALUES('1069','2024-03-20');
INSERT INTO report_date VALUES('1070','2024-03-21');
INSERT INTO report_date VALUES('1071','2024-03-22');
INSERT INTO report_date VALUES('1072','2024-03-23');
INSERT INTO report_date VALUES('1073','2024-03-24');
INSERT INTO report_date VALUES('1074','2024-03-25');
INSERT INTO report_date VALUES('1075','2024-03-26');
INSERT INTO report_date VALUES('1076','2024-03-27');
INSERT INTO report_date VALUES('1077','2024-03-28');
INSERT INTO report_date VALUES('1078','2024-03-29');
INSERT INTO report_date VALUES('1079','2024-03-30');
INSERT INTO report_date VALUES('1080','2024-03-31');
INSERT INTO report_date VALUES('1081','2024-04-01');
INSERT INTO report_date VALUES('1082','2024-04-02');
INSERT INTO report_date VALUES('1083','2024-04-03');
INSERT INTO report_date VALUES('1084','2024-04-04');
INSERT INTO report_date VALUES('1085','2024-04-05');
INSERT INTO report_date VALUES('1086','2024-04-06');
INSERT INTO report_date VALUES('1087','2024-04-07');
INSERT INTO report_date VALUES('1088','2024-04-08');
INSERT INTO report_date VALUES('1089','2024-04-09');
INSERT INTO report_date VALUES('1090','2024-04-10');
INSERT INTO report_date VALUES('1091','2024-04-11');
INSERT INTO report_date VALUES('1092','2024-04-12');
INSERT INTO report_date VALUES('1093','2024-04-13');
INSERT INTO report_date VALUES('1094','2024-04-14');
INSERT INTO report_date VALUES('1095','2024-04-15');
INSERT INTO report_date VALUES('1096','2024-04-16');
INSERT INTO report_date VALUES('1097','2024-04-17');
INSERT INTO report_date VALUES('1098','2024-04-18');
INSERT INTO report_date VALUES('1099','2024-04-19');
INSERT INTO report_date VALUES('1100','2024-04-20');
INSERT INTO report_date VALUES('1101','2024-04-21');
INSERT INTO report_date VALUES('1102','2024-04-22');
INSERT INTO report_date VALUES('1103','2024-04-23');
INSERT INTO report_date VALUES('1104','2024-04-24');
INSERT INTO report_date VALUES('1105','2024-04-25');
INSERT INTO report_date VALUES('1106','2024-04-26');
INSERT INTO report_date VALUES('1107','2024-04-27');
INSERT INTO report_date VALUES('1108','2024-04-28');
INSERT INTO report_date VALUES('1109','2024-04-29');
INSERT INTO report_date VALUES('1110','2024-04-30');
INSERT INTO report_date VALUES('1111','2024-05-01');
INSERT INTO report_date VALUES('1112','2024-05-02');
INSERT INTO report_date VALUES('1113','2024-05-03');
INSERT INTO report_date VALUES('1114','2024-05-04');
INSERT INTO report_date VALUES('1115','2024-05-05');
INSERT INTO report_date VALUES('1116','2024-05-06');
INSERT INTO report_date VALUES('1117','2024-05-07');
INSERT INTO report_date VALUES('1118','2024-05-08');
INSERT INTO report_date VALUES('1119','2024-05-09');
INSERT INTO report_date VALUES('1120','2024-05-10');
INSERT INTO report_date VALUES('1121','2024-05-11');
INSERT INTO report_date VALUES('1122','2024-05-12');
INSERT INTO report_date VALUES('1123','2024-05-13');
INSERT INTO report_date VALUES('1124','2024-05-14');
INSERT INTO report_date VALUES('1125','2024-05-15');
INSERT INTO report_date VALUES('1126','2024-05-16');
INSERT INTO report_date VALUES('1127','2024-05-17');
INSERT INTO report_date VALUES('1128','2024-05-18');
INSERT INTO report_date VALUES('1129','2024-05-19');
INSERT INTO report_date VALUES('1130','2024-05-20');
INSERT INTO report_date VALUES('1131','2024-05-21');
INSERT INTO report_date VALUES('1132','2024-05-22');
INSERT INTO report_date VALUES('1133','2024-05-23');
INSERT INTO report_date VALUES('1134','2024-05-24');
INSERT INTO report_date VALUES('1135','2024-05-25');
INSERT INTO report_date VALUES('1136','2024-05-26');
INSERT INTO report_date VALUES('1137','2024-05-27');
INSERT INTO report_date VALUES('1138','2024-05-28');
INSERT INTO report_date VALUES('1139','2024-05-29');
INSERT INTO report_date VALUES('1140','2024-05-30');
INSERT INTO report_date VALUES('1141','2024-05-31');
INSERT INTO report_date VALUES('1142','2024-06-01');
INSERT INTO report_date VALUES('1143','2024-06-02');
INSERT INTO report_date VALUES('1144','2024-06-03');
INSERT INTO report_date VALUES('1145','2024-06-04');
INSERT INTO report_date VALUES('1146','2024-06-05');
INSERT INTO report_date VALUES('1147','2024-06-06');
INSERT INTO report_date VALUES('1148','2024-06-07');
INSERT INTO report_date VALUES('1149','2024-06-08');
INSERT INTO report_date VALUES('1150','2024-06-09');
INSERT INTO report_date VALUES('1151','2024-06-10');
INSERT INTO report_date VALUES('1152','2024-06-11');
INSERT INTO report_date VALUES('1153','2024-06-12');
INSERT INTO report_date VALUES('1154','2024-06-13');
INSERT INTO report_date VALUES('1155','2024-06-14');
INSERT INTO report_date VALUES('1156','2024-06-15');
INSERT INTO report_date VALUES('1157','2024-06-16');
INSERT INTO report_date VALUES('1158','2024-06-17');
INSERT INTO report_date VALUES('1159','2024-06-18');
INSERT INTO report_date VALUES('1160','2024-06-19');
INSERT INTO report_date VALUES('1161','2024-06-20');
INSERT INTO report_date VALUES('1162','2024-06-21');
INSERT INTO report_date VALUES('1163','2024-06-22');
INSERT INTO report_date VALUES('1164','2024-06-23');
INSERT INTO report_date VALUES('1165','2024-06-24');
INSERT INTO report_date VALUES('1166','2024-06-25');
INSERT INTO report_date VALUES('1167','2024-06-26');
INSERT INTO report_date VALUES('1168','2024-06-27');
INSERT INTO report_date VALUES('1169','2024-06-28');
INSERT INTO report_date VALUES('1170','2024-06-29');
INSERT INTO report_date VALUES('1171','2024-06-30');
INSERT INTO report_date VALUES('1172','2024-07-01');
INSERT INTO report_date VALUES('1173','2024-07-02');
INSERT INTO report_date VALUES('1174','2024-07-03');
INSERT INTO report_date VALUES('1175','2024-07-04');
INSERT INTO report_date VALUES('1176','2024-07-05');
INSERT INTO report_date VALUES('1177','2024-07-06');
INSERT INTO report_date VALUES('1178','2024-07-07');
INSERT INTO report_date VALUES('1179','2024-07-08');
INSERT INTO report_date VALUES('1180','2024-07-09');
INSERT INTO report_date VALUES('1181','2024-07-10');
INSERT INTO report_date VALUES('1182','2024-07-11');
INSERT INTO report_date VALUES('1183','2024-07-12');
INSERT INTO report_date VALUES('1184','2024-07-13');
INSERT INTO report_date VALUES('1185','2024-07-14');
INSERT INTO report_date VALUES('1186','2024-07-15');
INSERT INTO report_date VALUES('1187','2024-07-16');
INSERT INTO report_date VALUES('1188','2024-07-17');
INSERT INTO report_date VALUES('1189','2024-07-18');
INSERT INTO report_date VALUES('1190','2024-07-19');
INSERT INTO report_date VALUES('1191','2024-07-20');
INSERT INTO report_date VALUES('1192','2024-07-21');
INSERT INTO report_date VALUES('1193','2024-07-22');
INSERT INTO report_date VALUES('1194','2024-07-23');
INSERT INTO report_date VALUES('1195','2024-07-24');
INSERT INTO report_date VALUES('1196','2024-07-25');
INSERT INTO report_date VALUES('1197','2024-07-26');
INSERT INTO report_date VALUES('1198','2024-07-27');
INSERT INTO report_date VALUES('1199','2024-07-28');
INSERT INTO report_date VALUES('1200','2024-07-29');
INSERT INTO report_date VALUES('1201','2024-07-30');
INSERT INTO report_date VALUES('1202','2024-07-31');
INSERT INTO report_date VALUES('1203','2024-08-01');
INSERT INTO report_date VALUES('1204','2024-08-02');
INSERT INTO report_date VALUES('1205','2024-08-03');
INSERT INTO report_date VALUES('1206','2024-08-04');
INSERT INTO report_date VALUES('1207','2024-08-05');
INSERT INTO report_date VALUES('1208','2024-08-06');
INSERT INTO report_date VALUES('1209','2024-08-07');
INSERT INTO report_date VALUES('1210','2024-08-08');
INSERT INTO report_date VALUES('1211','2024-08-09');
INSERT INTO report_date VALUES('1212','2024-08-10');
INSERT INTO report_date VALUES('1213','2024-08-11');
INSERT INTO report_date VALUES('1214','2024-08-12');
INSERT INTO report_date VALUES('1215','2024-08-13');
INSERT INTO report_date VALUES('1216','2024-08-14');
INSERT INTO report_date VALUES('1217','2024-08-15');
INSERT INTO report_date VALUES('1218','2024-08-16');
INSERT INTO report_date VALUES('1219','2024-08-17');
INSERT INTO report_date VALUES('1220','2024-08-18');
INSERT INTO report_date VALUES('1221','2024-08-19');
INSERT INTO report_date VALUES('1222','2024-08-20');
INSERT INTO report_date VALUES('1223','2024-08-21');
INSERT INTO report_date VALUES('1224','2024-08-22');
INSERT INTO report_date VALUES('1225','2024-08-23');
INSERT INTO report_date VALUES('1226','2024-08-24');
INSERT INTO report_date VALUES('1227','2024-08-25');
INSERT INTO report_date VALUES('1228','2024-08-26');
INSERT INTO report_date VALUES('1229','2024-08-27');
INSERT INTO report_date VALUES('1230','2024-08-28');
INSERT INTO report_date VALUES('1231','2024-08-29');
INSERT INTO report_date VALUES('1232','2024-08-30');
INSERT INTO report_date VALUES('1233','2024-08-31');
INSERT INTO report_date VALUES('1234','2024-09-01');
INSERT INTO report_date VALUES('1235','2024-09-02');
INSERT INTO report_date VALUES('1236','2024-09-03');
INSERT INTO report_date VALUES('1237','2024-09-04');
INSERT INTO report_date VALUES('1238','2024-09-05');
INSERT INTO report_date VALUES('1239','2024-09-06');
INSERT INTO report_date VALUES('1240','2024-09-07');
INSERT INTO report_date VALUES('1241','2024-09-08');
INSERT INTO report_date VALUES('1242','2024-09-09');
INSERT INTO report_date VALUES('1243','2024-09-10');
INSERT INTO report_date VALUES('1244','2024-09-11');
INSERT INTO report_date VALUES('1245','2024-09-12');
INSERT INTO report_date VALUES('1246','2024-09-13');
INSERT INTO report_date VALUES('1247','2024-09-14');
INSERT INTO report_date VALUES('1248','2024-09-15');
INSERT INTO report_date VALUES('1249','2024-09-16');
INSERT INTO report_date VALUES('1250','2024-09-17');
INSERT INTO report_date VALUES('1251','2024-09-18');
INSERT INTO report_date VALUES('1252','2024-09-19');
INSERT INTO report_date VALUES('1253','2024-09-20');
INSERT INTO report_date VALUES('1254','2024-09-21');
INSERT INTO report_date VALUES('1255','2024-09-22');
INSERT INTO report_date VALUES('1256','2024-09-23');
INSERT INTO report_date VALUES('1257','2024-09-24');
INSERT INTO report_date VALUES('1258','2024-09-25');
INSERT INTO report_date VALUES('1259','2024-09-26');
INSERT INTO report_date VALUES('1260','2024-09-27');
INSERT INTO report_date VALUES('1261','2024-09-28');
INSERT INTO report_date VALUES('1262','2024-09-29');
INSERT INTO report_date VALUES('1263','2024-09-30');
INSERT INTO report_date VALUES('1264','2024-10-01');
INSERT INTO report_date VALUES('1265','2024-10-02');
INSERT INTO report_date VALUES('1266','2024-10-03');
INSERT INTO report_date VALUES('1267','2024-10-04');
INSERT INTO report_date VALUES('1268','2024-10-05');
INSERT INTO report_date VALUES('1269','2024-10-06');
INSERT INTO report_date VALUES('1270','2024-10-07');
INSERT INTO report_date VALUES('1271','2024-10-08');
INSERT INTO report_date VALUES('1272','2024-10-09');
INSERT INTO report_date VALUES('1273','2024-10-10');
INSERT INTO report_date VALUES('1274','2024-10-11');
INSERT INTO report_date VALUES('1275','2024-10-12');
INSERT INTO report_date VALUES('1276','2024-10-13');
INSERT INTO report_date VALUES('1277','2024-10-14');
INSERT INTO report_date VALUES('1278','2024-10-15');
INSERT INTO report_date VALUES('1279','2024-10-16');
INSERT INTO report_date VALUES('1280','2024-10-17');
INSERT INTO report_date VALUES('1281','2024-10-18');
INSERT INTO report_date VALUES('1282','2024-10-19');
INSERT INTO report_date VALUES('1283','2024-10-20');
INSERT INTO report_date VALUES('1284','2024-10-21');
INSERT INTO report_date VALUES('1285','2024-10-22');
INSERT INTO report_date VALUES('1286','2024-10-23');
INSERT INTO report_date VALUES('1287','2024-10-24');
INSERT INTO report_date VALUES('1288','2024-10-25');
INSERT INTO report_date VALUES('1289','2024-10-26');
INSERT INTO report_date VALUES('1290','2024-10-27');
INSERT INTO report_date VALUES('1291','2024-10-28');
INSERT INTO report_date VALUES('1292','2024-10-29');
INSERT INTO report_date VALUES('1293','2024-10-30');
INSERT INTO report_date VALUES('1294','2024-10-31');
INSERT INTO report_date VALUES('1295','2024-11-01');
INSERT INTO report_date VALUES('1296','2024-11-02');
INSERT INTO report_date VALUES('1297','2024-11-03');
INSERT INTO report_date VALUES('1298','2024-11-04');
INSERT INTO report_date VALUES('1299','2024-11-05');
INSERT INTO report_date VALUES('1300','2024-11-06');
INSERT INTO report_date VALUES('1301','2024-11-07');
INSERT INTO report_date VALUES('1302','2024-11-08');
INSERT INTO report_date VALUES('1303','2024-11-09');
INSERT INTO report_date VALUES('1304','2024-11-10');
INSERT INTO report_date VALUES('1305','2024-11-11');
INSERT INTO report_date VALUES('1306','2024-11-12');
INSERT INTO report_date VALUES('1307','2024-11-13');
INSERT INTO report_date VALUES('1308','2024-11-14');
INSERT INTO report_date VALUES('1309','2024-11-15');
INSERT INTO report_date VALUES('1310','2024-11-16');
INSERT INTO report_date VALUES('1311','2024-11-17');
INSERT INTO report_date VALUES('1312','2024-11-18');
INSERT INTO report_date VALUES('1313','2024-11-19');
INSERT INTO report_date VALUES('1314','2024-11-20');
INSERT INTO report_date VALUES('1315','2024-11-21');
INSERT INTO report_date VALUES('1316','2024-11-22');
INSERT INTO report_date VALUES('1317','2024-11-23');
INSERT INTO report_date VALUES('1318','2024-11-24');
INSERT INTO report_date VALUES('1319','2024-11-25');
INSERT INTO report_date VALUES('1320','2024-11-26');
INSERT INTO report_date VALUES('1321','2024-11-27');
INSERT INTO report_date VALUES('1322','2024-11-28');
INSERT INTO report_date VALUES('1323','2024-11-29');
INSERT INTO report_date VALUES('1324','2024-11-30');
INSERT INTO report_date VALUES('1325','2024-12-01');
INSERT INTO report_date VALUES('1326','2024-12-02');
INSERT INTO report_date VALUES('1327','2024-12-03');
INSERT INTO report_date VALUES('1328','2024-12-04');
INSERT INTO report_date VALUES('1329','2024-12-05');
INSERT INTO report_date VALUES('1330','2024-12-06');
INSERT INTO report_date VALUES('1331','2024-12-07');
INSERT INTO report_date VALUES('1332','2024-12-08');
INSERT INTO report_date VALUES('1333','2024-12-09');
INSERT INTO report_date VALUES('1334','2024-12-10');
INSERT INTO report_date VALUES('1335','2024-12-11');
INSERT INTO report_date VALUES('1336','2024-12-12');
INSERT INTO report_date VALUES('1337','2024-12-13');
INSERT INTO report_date VALUES('1338','2024-12-14');
INSERT INTO report_date VALUES('1339','2024-12-15');
INSERT INTO report_date VALUES('1340','2024-12-16');
INSERT INTO report_date VALUES('1341','2024-12-17');
INSERT INTO report_date VALUES('1342','2024-12-18');
INSERT INTO report_date VALUES('1343','2024-12-19');
INSERT INTO report_date VALUES('1344','2024-12-20');
INSERT INTO report_date VALUES('1345','2024-12-21');
INSERT INTO report_date VALUES('1346','2024-12-22');
INSERT INTO report_date VALUES('1347','2024-12-23');
INSERT INTO report_date VALUES('1348','2024-12-24');
INSERT INTO report_date VALUES('1349','2024-12-25');
INSERT INTO report_date VALUES('1350','2024-12-26');
INSERT INTO report_date VALUES('1351','2024-12-27');
INSERT INTO report_date VALUES('1352','2024-12-28');
INSERT INTO report_date VALUES('1353','2024-12-29');
INSERT INTO report_date VALUES('1354','2024-12-30');
INSERT INTO report_date VALUES('1355','2024-12-31');
INSERT INTO report_date VALUES('1356','2025-01-01');
INSERT INTO report_date VALUES('1357','2025-01-02');
INSERT INTO report_date VALUES('1358','2025-01-03');
INSERT INTO report_date VALUES('1359','2025-01-04');
INSERT INTO report_date VALUES('1360','2025-01-05');
INSERT INTO report_date VALUES('1361','2025-01-06');
INSERT INTO report_date VALUES('1362','2025-01-07');
INSERT INTO report_date VALUES('1363','2025-01-08');
INSERT INTO report_date VALUES('1364','2025-01-09');
INSERT INTO report_date VALUES('1365','2025-01-10');
INSERT INTO report_date VALUES('1366','2025-01-11');
INSERT INTO report_date VALUES('1367','2025-01-12');
INSERT INTO report_date VALUES('1368','2025-01-13');
INSERT INTO report_date VALUES('1369','2025-01-14');
INSERT INTO report_date VALUES('1370','2025-01-15');
INSERT INTO report_date VALUES('1371','2025-01-16');
INSERT INTO report_date VALUES('1372','2025-01-17');
INSERT INTO report_date VALUES('1373','2025-01-18');
INSERT INTO report_date VALUES('1374','2025-01-19');
INSERT INTO report_date VALUES('1375','2025-01-20');
INSERT INTO report_date VALUES('1376','2025-01-21');
INSERT INTO report_date VALUES('1377','2025-01-22');
INSERT INTO report_date VALUES('1378','2025-01-23');
INSERT INTO report_date VALUES('1379','2025-01-24');
INSERT INTO report_date VALUES('1380','2025-01-25');
INSERT INTO report_date VALUES('1381','2025-01-26');
INSERT INTO report_date VALUES('1382','2025-01-27');
INSERT INTO report_date VALUES('1383','2025-01-28');
INSERT INTO report_date VALUES('1384','2025-01-29');
INSERT INTO report_date VALUES('1385','2025-01-30');
INSERT INTO report_date VALUES('1386','2025-01-31');
INSERT INTO report_date VALUES('1387','2025-02-01');
INSERT INTO report_date VALUES('1388','2025-02-02');
INSERT INTO report_date VALUES('1389','2025-02-03');
INSERT INTO report_date VALUES('1390','2025-02-04');
INSERT INTO report_date VALUES('1391','2025-02-05');
INSERT INTO report_date VALUES('1392','2025-02-06');
INSERT INTO report_date VALUES('1393','2025-02-07');
INSERT INTO report_date VALUES('1394','2025-02-08');
INSERT INTO report_date VALUES('1395','2025-02-09');
INSERT INTO report_date VALUES('1396','2025-02-10');
INSERT INTO report_date VALUES('1397','2025-02-11');
INSERT INTO report_date VALUES('1398','2025-02-12');
INSERT INTO report_date VALUES('1399','2025-02-13');
INSERT INTO report_date VALUES('1400','2025-02-14');
INSERT INTO report_date VALUES('1401','2025-02-15');
INSERT INTO report_date VALUES('1402','2025-02-16');
INSERT INTO report_date VALUES('1403','2025-02-17');
INSERT INTO report_date VALUES('1404','2025-02-18');
INSERT INTO report_date VALUES('1405','2025-02-19');
INSERT INTO report_date VALUES('1406','2025-02-20');
INSERT INTO report_date VALUES('1407','2025-02-21');
INSERT INTO report_date VALUES('1408','2025-02-22');
INSERT INTO report_date VALUES('1409','2025-02-23');
INSERT INTO report_date VALUES('1410','2025-02-24');
INSERT INTO report_date VALUES('1411','2025-02-25');
INSERT INTO report_date VALUES('1412','2025-02-26');
INSERT INTO report_date VALUES('1413','2025-02-27');
INSERT INTO report_date VALUES('1414','2025-02-28');
INSERT INTO report_date VALUES('1415','2025-03-01');
INSERT INTO report_date VALUES('1416','2025-03-02');
INSERT INTO report_date VALUES('1417','2025-03-03');
INSERT INTO report_date VALUES('1418','2025-03-04');
INSERT INTO report_date VALUES('1419','2025-03-05');
INSERT INTO report_date VALUES('1420','2025-03-06');
INSERT INTO report_date VALUES('1421','2025-03-07');
INSERT INTO report_date VALUES('1422','2025-03-08');
INSERT INTO report_date VALUES('1423','2025-03-09');
INSERT INTO report_date VALUES('1424','2025-03-10');
INSERT INTO report_date VALUES('1425','2025-03-11');
INSERT INTO report_date VALUES('1426','2025-03-12');
INSERT INTO report_date VALUES('1427','2025-03-13');
INSERT INTO report_date VALUES('1428','2025-03-14');
INSERT INTO report_date VALUES('1429','2025-03-15');
INSERT INTO report_date VALUES('1430','2025-03-16');
INSERT INTO report_date VALUES('1431','2025-03-17');
INSERT INTO report_date VALUES('1432','2025-03-18');
INSERT INTO report_date VALUES('1433','2025-03-19');
INSERT INTO report_date VALUES('1434','2025-03-20');
INSERT INTO report_date VALUES('1435','2025-03-21');
INSERT INTO report_date VALUES('1436','2025-03-22');
INSERT INTO report_date VALUES('1437','2025-03-23');
INSERT INTO report_date VALUES('1438','2025-03-24');
INSERT INTO report_date VALUES('1439','2025-03-25');
INSERT INTO report_date VALUES('1440','2025-03-26');
INSERT INTO report_date VALUES('1441','2025-03-27');
INSERT INTO report_date VALUES('1442','2025-03-28');
INSERT INTO report_date VALUES('1443','2025-03-29');
INSERT INTO report_date VALUES('1444','2025-03-30');
INSERT INTO report_date VALUES('1445','2025-03-31');
INSERT INTO report_date VALUES('1446','2025-04-01');
INSERT INTO report_date VALUES('1447','2025-04-02');
INSERT INTO report_date VALUES('1448','2025-04-03');
INSERT INTO report_date VALUES('1449','2025-04-04');
INSERT INTO report_date VALUES('1450','2025-04-05');
INSERT INTO report_date VALUES('1451','2025-04-06');
INSERT INTO report_date VALUES('1452','2025-04-07');
INSERT INTO report_date VALUES('1453','2025-04-08');
INSERT INTO report_date VALUES('1454','2025-04-09');
INSERT INTO report_date VALUES('1455','2025-04-10');
INSERT INTO report_date VALUES('1456','2025-04-11');
INSERT INTO report_date VALUES('1457','2025-04-12');
INSERT INTO report_date VALUES('1458','2025-04-13');
INSERT INTO report_date VALUES('1459','2025-04-14');
INSERT INTO report_date VALUES('1460','2025-04-15');
INSERT INTO report_date VALUES('1461','2025-04-16');
INSERT INTO report_date VALUES('1462','2025-04-17');
INSERT INTO report_date VALUES('1463','2025-04-18');
INSERT INTO report_date VALUES('1464','2025-04-19');
INSERT INTO report_date VALUES('1465','2025-04-20');
INSERT INTO report_date VALUES('1466','2025-04-21');
INSERT INTO report_date VALUES('1467','2025-04-22');
INSERT INTO report_date VALUES('1468','2025-04-23');
INSERT INTO report_date VALUES('1469','2025-04-24');
INSERT INTO report_date VALUES('1470','2025-04-25');
INSERT INTO report_date VALUES('1471','2025-04-26');
INSERT INTO report_date VALUES('1472','2025-04-27');
INSERT INTO report_date VALUES('1473','2025-04-28');
INSERT INTO report_date VALUES('1474','2025-04-29');
INSERT INTO report_date VALUES('1475','2025-04-30');
INSERT INTO report_date VALUES('1476','2025-05-01');
INSERT INTO report_date VALUES('1477','2025-05-02');
INSERT INTO report_date VALUES('1478','2025-05-03');
INSERT INTO report_date VALUES('1479','2025-05-04');
INSERT INTO report_date VALUES('1480','2025-05-05');
INSERT INTO report_date VALUES('1481','2025-05-06');
INSERT INTO report_date VALUES('1482','2025-05-07');
INSERT INTO report_date VALUES('1483','2025-05-08');
INSERT INTO report_date VALUES('1484','2025-05-09');
INSERT INTO report_date VALUES('1485','2025-05-10');
INSERT INTO report_date VALUES('1486','2025-05-11');
INSERT INTO report_date VALUES('1487','2025-05-12');
INSERT INTO report_date VALUES('1488','2025-05-13');
INSERT INTO report_date VALUES('1489','2025-05-14');
INSERT INTO report_date VALUES('1490','2025-05-15');
INSERT INTO report_date VALUES('1491','2025-05-16');
INSERT INTO report_date VALUES('1492','2025-05-17');
INSERT INTO report_date VALUES('1493','2025-05-18');
INSERT INTO report_date VALUES('1494','2025-05-19');
INSERT INTO report_date VALUES('1495','2025-05-20');
INSERT INTO report_date VALUES('1496','2025-05-21');
INSERT INTO report_date VALUES('1497','2025-05-22');
INSERT INTO report_date VALUES('1498','2025-05-23');
INSERT INTO report_date VALUES('1499','2025-05-24');
INSERT INTO report_date VALUES('1500','2025-05-25');
INSERT INTO report_date VALUES('1501','2025-05-26');
INSERT INTO report_date VALUES('1502','2025-05-27');
INSERT INTO report_date VALUES('1503','2025-05-28');
INSERT INTO report_date VALUES('1504','2025-05-29');
INSERT INTO report_date VALUES('1505','2025-05-30');
INSERT INTO report_date VALUES('1506','2025-05-31');
INSERT INTO report_date VALUES('1507','2025-06-01');
INSERT INTO report_date VALUES('1508','2025-06-02');
INSERT INTO report_date VALUES('1509','2025-06-03');
INSERT INTO report_date VALUES('1510','2025-06-04');
INSERT INTO report_date VALUES('1511','2025-06-05');
INSERT INTO report_date VALUES('1512','2025-06-06');
INSERT INTO report_date VALUES('1513','2025-06-07');
INSERT INTO report_date VALUES('1514','2025-06-08');
INSERT INTO report_date VALUES('1515','2025-06-09');
INSERT INTO report_date VALUES('1516','2025-06-10');
INSERT INTO report_date VALUES('1517','2025-06-11');
INSERT INTO report_date VALUES('1518','2025-06-12');
INSERT INTO report_date VALUES('1519','2025-06-13');
INSERT INTO report_date VALUES('1520','2025-06-14');
INSERT INTO report_date VALUES('1521','2025-06-15');
INSERT INTO report_date VALUES('1522','2025-06-16');
INSERT INTO report_date VALUES('1523','2025-06-17');
INSERT INTO report_date VALUES('1524','2025-06-18');
INSERT INTO report_date VALUES('1525','2025-06-19');
INSERT INTO report_date VALUES('1526','2025-06-20');



DROP TABLE IF EXISTS s_m_s;

CREATE TABLE `s_m_s` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO s_m_s VALUES('1','booking_sms_customer','<p>Your booking is confirmed. See booking details here: [link]</p>','1','1','2022-12-22 16:18:43','2023-01-01 12:22:56');
INSERT INTO s_m_s VALUES('2','booking_sms_driver','<p>You have a trip on [date].&nbsp;</p>','1','1','2023-01-01 12:22:12','2023-02-11 11:17:50');
INSERT INTO s_m_s VALUES('3','booking_sms_customer','<p>Dear Customer,</p>
<p>Your trip has been booke. For mre details: [link]</p>','2','1','2023-01-02 13:03:08','2023-01-02 13:03:08');
INSERT INTO s_m_s VALUES('4','booking_sms_driver','<p>Your have trip on [date]</p>','2','1','2023-01-02 13:08:14','2023-01-02 13:08:14');



DROP TABLE IF EXISTS sales_return;

CREATE TABLE `sales_return` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `return_date` date NOT NULL,
  `customer_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS sales_return_item_taxes;

CREATE TABLE `sales_return_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint NOT NULL,
  `sales_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS sales_return_items;

CREATE TABLE `sales_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS services;

CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO services VALUES('1','1','1000.00','exclusive','','','2022-11-01 11:02:37','2022-12-14 11:12:03');
INSERT INTO services VALUES('2','5','20000.00','exclusive','','','2022-12-14 13:17:05','2022-12-14 13:17:05');
INSERT INTO services VALUES('3','6','8000.00','exclusive','','','2023-01-02 12:58:50','2023-01-02 12:58:50');



DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','mail_type','smtp','','2023-01-03 11:02:37');
INSERT INTO settings VALUES('2','backend_direction','ltr','','2023-01-10 12:00:12');
INSERT INTO settings VALUES('3','membership_system','enabled','','2023-01-19 15:45:25');
INSERT INTO settings VALUES('4','trial_period','7','','2023-01-19 15:45:25');
INSERT INTO settings VALUES('5','allow_singup','yes','','2023-01-19 15:45:25');
INSERT INTO settings VALUES('6','email_verification','disabled','','2023-01-19 15:45:25');
INSERT INTO settings VALUES('7','hero_title','a:2:{s:6:\"Bangla\";s:38:\"Easily Manage Your Students Attendance\";s:7:\"English\";s:38:\"Easily Manage Your Students Attendance\";}','','2023-11-12 10:48:00');
INSERT INTO settings VALUES('8','hero_sub_title','a:2:{s:6:\"Bangla\";s:167:\"Attendance Keeper software will provide you fast and beautiful attendance keeping solution. It is online based so you can access it from multiple devices and anywhere.\";s:7:\"English\";s:167:\"Attendance Keeper software will provide you fast and beautiful attendance keeping solution. It is online based so you can access it from multiple devices and anywhere.\";}','','2023-11-12 10:48:00');
INSERT INTO settings VALUES('9','meta_keywords','invoice, projects, tasks, accounting, quotation, crm, business, erp, accounting software, live chat','','2022-11-01 10:27:46');
INSERT INTO settings VALUES('10','meta_description','A simple, easy to customize, and powerful business platform for managing and tracking Projects, Tasks, Invoices, Quotations, Leads, Customers, Transactions and many more!','','2022-11-01 10:27:46');
INSERT INTO settings VALUES('11','company_name','Attendance Keeper Pvt. Limited','2022-11-01 04:11:36','2023-04-02 11:34:47');
INSERT INTO settings VALUES('12','site_title','Attendance Keeper','2022-11-01 04:11:36','2023-04-02 11:34:47');
INSERT INTO settings VALUES('13','phone','+8801689655055','2022-11-01 04:11:36','2023-04-02 11:34:47');
INSERT INTO settings VALUES('14','email','akandmahfuz@gmail.com','2022-11-01 04:11:36','2023-04-02 11:34:47');
INSERT INTO settings VALUES('15','timezone','Asia/Dhaka','2022-11-01 04:11:36','2023-04-02 11:34:47');
INSERT INTO settings VALUES('16','language','English','2022-11-01 10:12:42','2023-04-02 11:34:47');
INSERT INTO settings VALUES('17','address','House 3, Road 9/B, Sector 5, Uttara, Dhaka - 1230','2022-11-01 10:12:42','2023-04-02 11:34:47');
INSERT INTO settings VALUES('18','website_enable','yes','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('19','website_language_dropdown','yes','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('20','currency_converter','fixer','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('21','fixer_api_key','tL0X6RUi8hqpPrfVO0U4AZyLqODbe4Dh','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('22','date_format','d M, Y','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('23','time_format','12','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('24','file_manager_file_type_supported','png,jpg,jpeg','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('25','file_manager_max_upload_size','2','2022-11-01 10:13:37','2023-01-10 12:00:12');
INSERT INTO settings VALUES('26','currency','BDT','2022-11-01 10:14:09','2023-01-19 15:45:25');
INSERT INTO settings VALUES('27','currency_position','right','2022-11-01 10:14:09','2023-01-19 15:45:25');
INSERT INTO settings VALUES('28','paypal_active','No','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('29','paypal_email','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('30','paypal_currency','USD','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('31','stripe_active','No','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('32','stripe_secret_key','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('33','stripe_publishable_key','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('34','stripe_currency','USD','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('35','razorpay_active','No','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('36','razorpay_key_id','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('37','razorpay_secret_key','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('38','razorpay_currency','INR','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('39','paystack_active','No','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('40','paystack_public_key','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('41','paystack_secret_key','','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('42','paystack_currency','GHS','2022-11-01 10:14:21','2023-01-04 11:06:31');
INSERT INTO settings VALUES('43','website_copyright','a:2:{s:6:\"Bangla\";s:25:\"Software Bazar Bangladesh\";s:7:\"English\";s:25:\"Software Bazar Bangladesh\";}','2022-11-01 10:27:25','2023-11-12 10:48:00');
INSERT INTO settings VALUES('44','website_title','Attendance Keeper','2022-11-01 10:27:46','2022-11-01 10:27:46');
INSERT INTO settings VALUES('45','promo_video_url','https://www.youtube.com/watch?v=9y927xiDtJo','2022-11-01 10:29:47','2023-11-06 12:20:09');
INSERT INTO settings VALUES('46','contact_email','akandmahfuz@gmail.com','2022-11-01 10:29:47','2023-11-06 12:20:09');
INSERT INTO settings VALUES('47','logo','logo.jpg','2022-11-01 11:39:37','2023-04-02 11:34:18');
INSERT INTO settings VALUES('48','favicon','file_1680413435.png','2022-11-01 11:41:14','2023-04-02 11:30:35');
INSERT INTO settings VALUES('49','from_email','system@transportkeeper.com','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('50','from_name','Transport Keeper System','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('51','smtp_host','mail.transportkeeper.com','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('52','smtp_port','465','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('53','smtp_username','system@transportkeeper.com','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('54','smtp_password','Bangladesh@123','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('55','smtp_encryption','ssl','2023-01-03 11:02:37','2023-01-03 11:02:37');
INSERT INTO settings VALUES('56','ssl_email','','2023-01-04 11:00:50','2023-03-14 10:53:02');
INSERT INTO settings VALUES('57','ssl_currency','BDT','2023-01-04 11:00:50','2023-03-14 10:53:02');
INSERT INTO settings VALUES('58','ssl_active','Yes','2023-01-04 11:03:53','2023-03-14 10:53:02');
INSERT INTO settings VALUES('59','ssl_store_id','softw63b257c889fa3','','');
INSERT INTO settings VALUES('60','ssl_store_pswd','softw63b257c889fa3@ssl','','');
INSERT INTO settings VALUES('61','home_banner_image','file_1699251609.jpg','2023-11-06 12:20:09','2023-11-06 12:20:09');
INSERT INTO settings VALUES('62','sub_banner_image','file_1699251609.jpg','2023-11-06 12:20:09','2023-11-06 12:20:09');
INSERT INTO settings VALUES('63','short_description','a:2:{s:6:\"Bangla\";s:1341:\"<pre class=\" language-markup\"><code class=\" language-markup\">অংশ অংশভাক আঁইশ ইঁচড়েপাকা ঈক্ষণ ঈদৃক অংশভাগী জওয়ান অংশাঙ্কিত ইউক্যালিপটাস অংশাবতার হালহদিশ পিতৃতর্পণ টকানো ঈক্ষিত জগজ্জন তকতনামা আঁকুবাঁকু পঁইছা
জগঝপ্প পঁহুছা দ্রাবিড়ী আঁকুড়ি ঈদৃক জগদম্বা টঙ্ক অংশিন্&zwnj; জগদ্গৌরী আঁচা তকরার তিলপিটালি গজ-দাঁত অংশু ঈপ্সনীয় পইতা শংকরাভরণ হংসগমন পকড় অংশুধর ঈপ্সু ঈর্ষী জগদ্ধাত্রী আঁজনাই তক্তি শংসনপত্র হংসারূঢ়া দংশল তক্ষক অংশুমান ইকেবানা জগদ্বন্ধু ঈশিত্ব ইক্ষ্বাকু আঁজি অংসকুট টঙ্কক তক্ষণাস্ত্র পকোড়া দংষ্ট্রা শকটিকা হকচকা বঁইচি শকল</code></pre>\";s:7:\"English\";s:452:\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\";}','2023-11-12 10:45:35','2023-11-12 10:48:00');



DROP TABLE IF EXISTS social_google_accounts;

CREATE TABLE `social_google_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS staff_roles;

CREATE TABLE `staff_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO staff_roles VALUES('1','HKF','','2','2022-12-06 12:00:53','2022-12-06 12:00:53');
INSERT INTO staff_roles VALUES('2','Manager','','2','2022-12-06 12:45:13','2022-12-06 12:45:13');
INSERT INTO staff_roles VALUES('3','Clerk','','2','2022-12-06 12:54:53','2022-12-06 12:54:53');
INSERT INTO staff_roles VALUES('4','Helper','','1','2022-12-14 12:46:42','2022-12-14 12:46:42');



DROP TABLE IF EXISTS suppliers;

CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES('1','Test','J & K','VT 101922','test@gmail.com','01715253866','','Bangladesh','','','','1','2022-12-08 12:01:33','2022-12-08 12:01:33');



DROP TABLE IF EXISTS task_statuses;

CREATE TABLE `task_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO task_statuses VALUES('1','Start','#000000','2','1','2022-12-19 14:37:14','2023-01-28 17:04:46');
INSERT INTO task_statuses VALUES('2','Finished','#37a91c','1','1','2023-01-09 16:59:03','2023-01-28 17:04:46');



DROP TABLE IF EXISTS tasks;

CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `project_id` bigint NOT NULL,
  `milestone_id` bigint DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_status_id` bigint NOT NULL,
  `assigned_user_id` bigint DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `custom_fields` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tasks VALUES('1','Test','','1','','low','1','8','2022-12-19','2023-01-07','','2','1','2022-12-19 14:37:37','2023-02-27 11:17:07');



DROP TABLE IF EXISTS taxs;

CREATE TABLE `taxs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxs VALUES('1','Road Tax','5.00','percent','1','2022-12-17 11:12:09','2022-12-17 11:12:09');
INSERT INTO taxs VALUES('2','Extra Police','2.00','fixed','1','2022-12-18 13:17:25','2022-12-18 13:18:59');



DROP TABLE IF EXISTS timesheets;

CREATE TABLE `timesheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_hour` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  `purchase_return_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','2022-11-01','1','1','income','cr','10000.00','10000.00','1','1','','','','1','38476','1667279218invoice_1001.pdf','Half Payment','1','2022-11-01 11:06:58','2022-11-01 11:06:58');
INSERT INTO transactions VALUES('2','2022-11-01','1','1','income','cr','5000.00','5000.00','1','1','','','','1','','','','1','2022-11-01 11:07:21','2022-11-01 11:07:21');
INSERT INTO transactions VALUES('3','2022-12-08','1','2','expense','dr','20.00','20.00','','','1','','','1','','','','1','2022-12-08 12:05:11','2022-12-08 12:05:11');
INSERT INTO transactions VALUES('4','2022-12-14','1','1','income','cr','100000.00','100000.00','6','2','','','','1','','','','1','2022-12-14 13:30:25','2022-12-14 13:30:25');
INSERT INTO transactions VALUES('5','2022-12-14','1','0','transfer','dr','500.00','500.00','','','','','','1','','','','1','2022-12-14 14:32:08','2022-12-14 14:32:08');
INSERT INTO transactions VALUES('6','2022-12-14','2','0','transfer','cr','500.00','500.00','','','','','','1','','','','1','2022-12-14 14:32:08','2022-12-14 14:32:08');
INSERT INTO transactions VALUES('7','2022-12-15','1','1','income','cr','1000.00','1000.00','6','4','','','','1','','','','1','2022-12-15 17:40:58','2022-12-15 17:40:58');
INSERT INTO transactions VALUES('8','2022-12-20','1','1','income','cr','1094.50','1094.50','1','11','','','','1','','','','1','2022-12-20 16:49:24','2022-12-20 16:49:24');
INSERT INTO transactions VALUES('9','2022-12-20','2','1','income','cr','1000.00','1000.00','1','6','','','','2','','','','1','2022-12-20 16:50:05','2022-12-20 16:50:05');
INSERT INTO transactions VALUES('10','2022-12-20','2','1','income','cr','15000.00','15000.00','6','8','','','','2','','','','1','2022-12-20 16:50:43','2022-12-20 16:50:43');
INSERT INTO transactions VALUES('11','2022-12-20','1','1','income','cr','1000.00','1000.00','1','10','','','','1','','','','1','2022-12-20 16:51:24','2022-12-20 16:51:24');
INSERT INTO transactions VALUES('12','2023-01-02','1','1','income','cr','2000.00','2000.00','6','75','','','','1','','','','1','2023-01-02 11:43:40','2023-01-02 11:43:40');
INSERT INTO transactions VALUES('13','2023-01-02','3','3','income','cr','5000.00','5000.00','2','76','','','','3','','','','2','2023-01-02 13:11:33','2023-01-02 13:11:33');
INSERT INTO transactions VALUES('14','2023-01-02','3','3','income','cr','8000.00','8000.00','2','80','','','','3','','','','2','2023-01-02 13:29:29','2023-01-02 13:29:29');
INSERT INTO transactions VALUES('15','2023-01-07','1','1','income','cr','10000.00','10000.00','6','75','','','','1','','','','1','2023-01-07 10:57:24','2023-01-07 10:57:24');
INSERT INTO transactions VALUES('16','2023-01-07','1','1','income','cr','20000.00','20000.00','6','74','','','','1','','','','1','2023-01-07 10:58:19','2023-01-07 10:58:19');
INSERT INTO transactions VALUES('17','2023-01-07','1','2','expense','dr','5.00','5.00','','','1','','','1','','','','1','2023-01-07 10:59:06','2023-01-07 10:59:06');
INSERT INTO transactions VALUES('18','2023-01-07','1','1','income','cr','8004.00','8004.00','6','75','','','','4','','','','1','2023-01-07 16:58:07','2023-01-07 16:58:07');
INSERT INTO transactions VALUES('19','2023-01-07','1','1','income','cr','1000.00','1000.00','1','62','','','','4','','','','1','2023-01-07 17:33:26','2023-01-07 17:33:26');
INSERT INTO transactions VALUES('20','2023-01-07','1','1','income','cr','1000.00','1000.00','1','61','','','','4','','','','1','2023-01-07 17:34:26','2023-01-07 17:34:26');
INSERT INTO transactions VALUES('21','2023-01-07','1','1','income','cr','1000.00','1000.00','6','59','','','','4','','','','1','2023-01-07 17:36:35','2023-01-07 17:36:35');
INSERT INTO transactions VALUES('22','2023-01-07','1','1','income','cr','1000.00','1000.00','6','57','','','','4','','','','1','2023-01-07 17:38:19','2023-01-07 17:38:19');
INSERT INTO transactions VALUES('23','2023-01-07','1','1','income','cr','1000.00','1000.00','6','54','','','','4','','','','1','2023-01-07 18:01:26','2023-01-07 18:01:26');
INSERT INTO transactions VALUES('24','2023-01-07','1','1','income','cr','1000.00','1000.00','1','53','','','','4','','','','1','2023-01-07 18:07:05','2023-01-07 18:07:05');
INSERT INTO transactions VALUES('25','2023-01-11','1','4','expense','dr','100.00','100.00','','85','','','','1','','','','1','2023-01-11 11:32:42','2023-01-11 11:32:42');
INSERT INTO transactions VALUES('27','2023-01-22','1','4','expense','dr','100.00','100.00','','3','','','','1','','','','1','2023-01-22 16:02:10','2023-01-26 12:28:46');
INSERT INTO transactions VALUES('28','2023-01-24','1','4','expense','dr','300.00','300.00','','86','','','','1','','','','1','2023-01-24 10:05:50','2023-01-24 10:05:50');
INSERT INTO transactions VALUES('29','2023-01-24','1','5','expense','dr','200.00','200.00','','86','','','','1','','','','1','2023-01-24 16:45:20','2023-01-24 16:45:20');
INSERT INTO transactions VALUES('30','2023-01-26','1','1','income','cr','2000.00','2000.00','6','85','','','','5','','','','1','2023-01-26 11:20:33','2023-01-26 11:20:33');
INSERT INTO transactions VALUES('31','2023-01-26','1','1','income','cr','1000.00','1000.00','6','83','','','','6','','','','1','2023-01-26 11:31:50','2023-01-26 11:31:50');
INSERT INTO transactions VALUES('32','2023-01-26','1','1','income','cr','950.00','950.00','6','82','','','','5','','','','1','2023-01-26 11:47:01','2023-01-26 11:47:01');
INSERT INTO transactions VALUES('33','2023-01-26','1','1','income','cr','1023.75','1023.75','6','73','','','','7','','','','1','2023-01-26 12:24:59','2023-01-26 12:24:59');
INSERT INTO transactions VALUES('34','2023-01-28','1','1','income','cr','1000.00','1000.00','6','86','','','','8','','','','1','2023-01-28 15:42:50','2023-01-28 15:42:50');
INSERT INTO transactions VALUES('35','2023-01-28','1','1','income','cr','5000.00','5000.00','6','72','','','','1','','','','1','2023-01-28 15:59:33','2023-01-28 15:59:33');
INSERT INTO transactions VALUES('36','2023-01-28','1','1','income','cr','15000.00','15000.00','6','72','','','','9','','','','1','2023-01-28 16:11:50','2023-01-28 16:11:50');
INSERT INTO transactions VALUES('37','2023-01-28','1','1','income','cr','7890.00','7890.00','6','71','','','','1','','','','1','2023-01-28 16:21:52','2023-01-28 16:21:52');
INSERT INTO transactions VALUES('38','2023-01-28','1','1','income','cr','20.35','20.35','6','71','','','','1','','','','1','2023-01-28 16:22:56','2023-01-28 16:22:56');
INSERT INTO transactions VALUES('39','2023-01-28','1','1','income','cr','13089.65','13089.65','6','71','','','','10','','','','1','2023-01-28 16:24:42','2023-01-28 16:24:42');
INSERT INTO transactions VALUES('40','2023-02-02','1','6','expense','dr','20.00','20.00','','','','','','1','','','','1','2023-02-02 12:42:15','2023-02-02 12:42:15');



DROP TABLE IF EXISTS upazilas;

CREATE TABLE `upazilas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `district_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO upazilas VALUES('1','1','Debidwar','দেবিদ্বার','debidwar.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('2','1','Barura','বরুড়া','barura.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('3','1','Brahmanpara','ব্রাহ্মণপাড়া','brahmanpara.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('4','1','Chandina','চান্দিনা','chandina.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('5','1','Chauddagram','চৌদ্দগ্রাম','chauddagram.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('6','1','Daudkandi','দাউদকান্দি','daudkandi.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('7','1','Homna','হোমনা','homna.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('8','1','Laksam','লাকসাম','laksam.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('9','1','Muradnagar','মুরাদনগর','muradnagar.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('10','1','Nangalkot','নাঙ্গলকোট','nangalkot.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('11','1','Comilla Sadar','কুমিল্লা সদর','comillasadar.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('12','1','Meghna','মেঘনা','meghna.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('13','1','Monohargonj','মনোহরগঞ্জ','monohargonj.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('14','1','Sadarsouth','সদর দক্ষিণ','sadarsouth.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('15','1','Titas','তিতাস','titas.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('16','1','Burichang','বুড়িচং','burichang.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('17','1','Lalmai','লালমাই','lalmai.comilla.gov.bd','','');
INSERT INTO upazilas VALUES('18','2','Chhagalnaiya','ছাগলনাইয়া','chhagalnaiya.feni.gov.bd','','');
INSERT INTO upazilas VALUES('19','2','Feni Sadar','ফেনী সদর','sadar.feni.gov.bd','','');
INSERT INTO upazilas VALUES('20','2','Sonagazi','সোনাগাজী','sonagazi.feni.gov.bd','','');
INSERT INTO upazilas VALUES('21','2','Fulgazi','ফুলগাজী','fulgazi.feni.gov.bd','','');
INSERT INTO upazilas VALUES('22','2','Parshuram','পরশুরাম','parshuram.feni.gov.bd','','');
INSERT INTO upazilas VALUES('23','2','Daganbhuiyan','দাগনভূঞা','daganbhuiyan.feni.gov.bd','','');
INSERT INTO upazilas VALUES('24','3','Brahmanbaria Sadar','ব্রাহ্মণবাড়িয়া সদর','sadar.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('25','3','Kasba','কসবা','kasba.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('26','3','Nasirnagar','নাসিরনগর','nasirnagar.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('27','3','Sarail','সরাইল','sarail.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('28','3','Ashuganj','আশুগঞ্জ','ashuganj.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('29','3','Akhaura','আখাউড়া','akhaura.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('30','3','Nabinagar','নবীনগর','nabinagar.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('31','3','Bancharampur','বাঞ্ছারামপুর','bancharampur.brahmanbaria.gov.bd','','');
INSERT INTO upazilas VALUES('32','3','Bijoynagar','বিজয়নগর','bijoynagar.brahmanbaria.gov.bd    ','','');
INSERT INTO upazilas VALUES('33','4','Rangamati Sadar','রাঙ্গামাটি সদর','sadar.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('34','4','Kaptai','কাপ্তাই','kaptai.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('35','4','Kawkhali','কাউখালী','kawkhali.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('36','4','Baghaichari','বাঘাইছড়ি','baghaichari.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('37','4','Barkal','বরকল','barkal.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('38','4','Langadu','লংগদু','langadu.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('39','4','Rajasthali','রাজস্থলী','rajasthali.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('40','4','Belaichari','বিলাইছড়ি','belaichari.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('41','4','Juraichari','জুরাছড়ি','juraichari.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('42','4','Naniarchar','নানিয়ারচর','naniarchar.rangamati.gov.bd','','');
INSERT INTO upazilas VALUES('43','5','Noakhali Sadar','নোয়াখালী সদর','sadar.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('44','5','Companiganj','কোম্পানীগঞ্জ','companiganj.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('45','5','Begumganj','বেগমগঞ্জ','begumganj.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('46','5','Hatia','হাতিয়া','hatia.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('47','5','Subarnachar','সুবর্ণচর','subarnachar.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('48','5','Kabirhat','কবিরহাট','kabirhat.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('49','5','Senbug','সেনবাগ','senbug.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('50','5','Chatkhil','চাটখিল','chatkhil.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('51','5','Sonaimori','সোনাইমুড়ী','sonaimori.noakhali.gov.bd','','');
INSERT INTO upazilas VALUES('52','6','Haimchar','হাইমচর','haimchar.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('53','6','Kachua','কচুয়া','kachua.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('54','6','Shahrasti','শাহরাস্তি	','shahrasti.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('55','6','Chandpur Sadar','চাঁদপুর সদর','sadar.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('56','6','Matlab South','মতলব দক্ষিণ','matlabsouth.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('57','6','Hajiganj','হাজীগঞ্জ','hajiganj.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('58','6','Matlab North','মতলব উত্তর','matlabnorth.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('59','6','Faridgonj','ফরিদগঞ্জ','faridgonj.chandpur.gov.bd','','');
INSERT INTO upazilas VALUES('60','7','Lakshmipur Sadar','লক্ষ্মীপুর সদর','sadar.lakshmipur.gov.bd','','');
INSERT INTO upazilas VALUES('61','7','Kamalnagar','কমলনগর','kamalnagar.lakshmipur.gov.bd','','');
INSERT INTO upazilas VALUES('62','7','Raipur','রায়পুর','raipur.lakshmipur.gov.bd','','');
INSERT INTO upazilas VALUES('63','7','Ramgati','রামগতি','ramgati.lakshmipur.gov.bd','','');
INSERT INTO upazilas VALUES('64','7','Ramganj','রামগঞ্জ','ramganj.lakshmipur.gov.bd','','');
INSERT INTO upazilas VALUES('65','8','Rangunia','রাঙ্গুনিয়া','rangunia.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('66','8','Sitakunda','সীতাকুন্ড','sitakunda.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('67','8','Mirsharai','মীরসরাই','mirsharai.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('68','8','Patiya','পটিয়া','patiya.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('69','8','Sandwip','সন্দ্বীপ','sandwip.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('70','8','Banshkhali','বাঁশখালী','banshkhali.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('71','8','Boalkhali','বোয়ালখালী','boalkhali.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('72','8','Anwara','আনোয়ারা','anwara.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('73','8','Chandanaish','চন্দনাইশ','chandanaish.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('74','8','Satkania','সাতকানিয়া','satkania.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('75','8','Lohagara','লোহাগাড়া','lohagara.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('76','8','Hathazari','হাটহাজারী','hathazari.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('77','8','Fatikchhari','ফটিকছড়ি','fatikchhari.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('78','8','Raozan','রাউজান','raozan.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('79','8','Karnafuli','কর্ণফুলী','karnafuli.chittagong.gov.bd','','');
INSERT INTO upazilas VALUES('80','9','Coxsbazar Sadar','কক্সবাজার সদর','sadar.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('81','9','Chakaria','চকরিয়া','chakaria.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('82','9','Kutubdia','কুতুবদিয়া','kutubdia.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('83','9','Ukhiya','উখিয়া','ukhiya.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('84','9','Moheshkhali','মহেশখালী','moheshkhali.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('85','9','Pekua','পেকুয়া','pekua.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('86','9','Ramu','রামু','ramu.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('87','9','Teknaf','টেকনাফ','teknaf.coxsbazar.gov.bd','','');
INSERT INTO upazilas VALUES('88','10','Khagrachhari Sadar','খাগড়াছড়ি সদর','sadar.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('89','10','Dighinala','দিঘীনালা','dighinala.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('90','10','Panchari','পানছড়ি','panchari.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('91','10','Laxmichhari','লক্ষীছড়ি','laxmichhari.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('92','10','Mohalchari','মহালছড়ি','mohalchari.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('93','10','Manikchari','মানিকছড়ি','manikchari.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('94','10','Ramgarh','রামগড়','ramgarh.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('95','10','Matiranga','মাটিরাঙ্গা','matiranga.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('96','10','Guimara','গুইমারা','guimara.khagrachhari.gov.bd','','');
INSERT INTO upazilas VALUES('97','11','Bandarban Sadar','বান্দরবান সদর','sadar.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('98','11','Alikadam','আলীকদম','alikadam.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('99','11','Naikhongchhari','নাইক্ষ্যংছড়ি','naikhongchhari.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('100','11','Rowangchhari','রোয়াংছড়ি','rowangchhari.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('101','11','Lama','লামা','lama.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('102','11','Ruma','রুমা','ruma.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('103','11','Thanchi','থানচি','thanchi.bandarban.gov.bd','','');
INSERT INTO upazilas VALUES('104','12','Belkuchi','বেলকুচি','belkuchi.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('105','12','Chauhali','চৌহালি','chauhali.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('106','12','Kamarkhand','কামারখন্দ','kamarkhand.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('107','12','Kazipur','কাজীপুর','kazipur.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('108','12','Raigonj','রায়গঞ্জ','raigonj.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('109','12','Shahjadpur','শাহজাদপুর','shahjadpur.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('110','12','Sirajganj Sadar','সিরাজগঞ্জ সদর','sirajganjsadar.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('111','12','Tarash','তাড়াশ','tarash.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('112','12','Ullapara','উল্লাপাড়া','ullapara.sirajganj.gov.bd','','');
INSERT INTO upazilas VALUES('113','13','Sujanagar','সুজানগর','sujanagar.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('114','13','Ishurdi','ঈশ্বরদী','ishurdi.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('115','13','Bhangura','ভাঙ্গুড়া','bhangura.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('116','13','Pabna Sadar','পাবনা সদর','pabnasadar.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('117','13','Bera','বেড়া','bera.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('118','13','Atghoria','আটঘরিয়া','atghoria.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('119','13','Chatmohar','চাটমোহর','chatmohar.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('120','13','Santhia','সাঁথিয়া','santhia.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('121','13','Faridpur','ফরিদপুর','faridpur.pabna.gov.bd','','');
INSERT INTO upazilas VALUES('122','14','Kahaloo','কাহালু','kahaloo.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('123','14','Bogra Sadar','বগুড়া সদর','sadar.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('124','14','Shariakandi','সারিয়াকান্দি','shariakandi.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('125','14','Shajahanpur','শাজাহানপুর','shajahanpur.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('126','14','Dupchanchia','দুপচাচিঁয়া','dupchanchia.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('127','14','Adamdighi','আদমদিঘি','adamdighi.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('128','14','Nondigram','নন্দিগ্রাম','nondigram.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('129','14','Sonatala','সোনাতলা','sonatala.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('130','14','Dhunot','ধুনট','dhunot.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('131','14','Gabtali','গাবতলী','gabtali.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('132','14','Sherpur','শেরপুর','sherpur.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('133','14','Shibganj','শিবগঞ্জ','shibganj.bogra.gov.bd','','');
INSERT INTO upazilas VALUES('134','15','Paba','পবা','paba.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('135','15','Durgapur','দুর্গাপুর','durgapur.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('136','15','Mohonpur','মোহনপুর','mohonpur.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('137','15','Charghat','চারঘাট','charghat.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('138','15','Puthia','পুঠিয়া','puthia.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('139','15','Bagha','বাঘা','bagha.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('140','15','Godagari','গোদাগাড়ী','godagari.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('141','15','Tanore','তানোর','tanore.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('142','15','Bagmara','বাগমারা','bagmara.rajshahi.gov.bd','','');
INSERT INTO upazilas VALUES('143','16','Natore Sadar','নাটোর সদর','natoresadar.natore.gov.bd','','');
INSERT INTO upazilas VALUES('144','16','Singra','সিংড়া','singra.natore.gov.bd','','');
INSERT INTO upazilas VALUES('145','16','Baraigram','বড়াইগ্রাম','baraigram.natore.gov.bd','','');
INSERT INTO upazilas VALUES('146','16','Bagatipara','বাগাতিপাড়া','bagatipara.natore.gov.bd','','');
INSERT INTO upazilas VALUES('147','16','Lalpur','লালপুর','lalpur.natore.gov.bd','','');
INSERT INTO upazilas VALUES('148','16','Gurudaspur','গুরুদাসপুর','gurudaspur.natore.gov.bd','','');
INSERT INTO upazilas VALUES('149','16','Naldanga','নলডাঙ্গা','naldanga.natore.gov.bd','','');
INSERT INTO upazilas VALUES('150','17','Akkelpur','আক্কেলপুর','akkelpur.joypurhat.gov.bd','','');
INSERT INTO upazilas VALUES('151','17','Kalai','কালাই','kalai.joypurhat.gov.bd','','');
INSERT INTO upazilas VALUES('152','17','Khetlal','ক্ষেতলাল','khetlal.joypurhat.gov.bd','','');
INSERT INTO upazilas VALUES('153','17','Panchbibi','পাঁচবিবি','panchbibi.joypurhat.gov.bd','','');
INSERT INTO upazilas VALUES('154','17','Joypurhat Sadar','জয়পুরহাট সদর','joypurhatsadar.joypurhat.gov.bd','','');
INSERT INTO upazilas VALUES('155','18','Chapainawabganj Sadar','চাঁপাইনবাবগঞ্জ সদর','chapainawabganjsadar.chapainawabganj.gov.bd','','');
INSERT INTO upazilas VALUES('156','18','Gomostapur','গোমস্তাপুর','gomostapur.chapainawabganj.gov.bd','','');
INSERT INTO upazilas VALUES('157','18','Nachol','নাচোল','nachol.chapainawabganj.gov.bd','','');
INSERT INTO upazilas VALUES('158','18','Bholahat','ভোলাহাট','bholahat.chapainawabganj.gov.bd','','');
INSERT INTO upazilas VALUES('159','18','Shibganj','শিবগঞ্জ','shibganj.chapainawabganj.gov.bd','','');
INSERT INTO upazilas VALUES('160','19','Mohadevpur','মহাদেবপুর','mohadevpur.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('161','19','Badalgachi','বদলগাছী','badalgachi.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('162','19','Patnitala','পত্নিতলা','patnitala.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('163','19','Dhamoirhat','ধামইরহাট','dhamoirhat.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('164','19','Niamatpur','নিয়ামতপুর','niamatpur.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('165','19','Manda','মান্দা','manda.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('166','19','Atrai','আত্রাই','atrai.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('167','19','Raninagar','রাণীনগর','raninagar.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('168','19','Naogaon Sadar','নওগাঁ সদর','naogaonsadar.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('169','19','Porsha','পোরশা','porsha.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('170','19','Sapahar','সাপাহার','sapahar.naogaon.gov.bd','','');
INSERT INTO upazilas VALUES('171','20','Manirampur','মণিরামপুর','manirampur.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('172','20','Abhaynagar','অভয়নগর','abhaynagar.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('173','20','Bagherpara','বাঘারপাড়া','bagherpara.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('174','20','Chougachha','চৌগাছা','chougachha.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('175','20','Jhikargacha','ঝিকরগাছা','jhikargacha.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('176','20','Keshabpur','কেশবপুর','keshabpur.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('177','20','Jessore Sadar','যশোর সদর','sadar.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('178','20','Sharsha','শার্শা','sharsha.jessore.gov.bd','','');
INSERT INTO upazilas VALUES('179','21','Assasuni','আশাশুনি','assasuni.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('180','21','Debhata','দেবহাটা','debhata.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('181','21','Kalaroa','কলারোয়া','kalaroa.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('182','21','Satkhira Sadar','সাতক্ষীরা সদর','satkhirasadar.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('183','21','Shyamnagar','শ্যামনগর','shyamnagar.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('184','21','Tala','তালা','tala.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('185','21','Kaliganj','কালিগঞ্জ','kaliganj.satkhira.gov.bd','','');
INSERT INTO upazilas VALUES('186','22','Mujibnagar','মুজিবনগর','mujibnagar.meherpur.gov.bd','','');
INSERT INTO upazilas VALUES('187','22','Meherpur Sadar','মেহেরপুর সদর','meherpursadar.meherpur.gov.bd','','');
INSERT INTO upazilas VALUES('188','22','Gangni','গাংনী','gangni.meherpur.gov.bd','','');
INSERT INTO upazilas VALUES('189','23','Narail Sadar','নড়াইল সদর','narailsadar.narail.gov.bd','','');
INSERT INTO upazilas VALUES('190','23','Lohagara','লোহাগড়া','lohagara.narail.gov.bd','','');
INSERT INTO upazilas VALUES('191','23','Kalia','কালিয়া','kalia.narail.gov.bd','','');
INSERT INTO upazilas VALUES('192','24','Chuadanga Sadar','চুয়াডাঙ্গা সদর','chuadangasadar.chuadanga.gov.bd','','');
INSERT INTO upazilas VALUES('193','24','Alamdanga','আলমডাঙ্গা','alamdanga.chuadanga.gov.bd','','');
INSERT INTO upazilas VALUES('194','24','Damurhuda','দামুড়হুদা','damurhuda.chuadanga.gov.bd','','');
INSERT INTO upazilas VALUES('195','24','Jibannagar','জীবননগর','jibannagar.chuadanga.gov.bd','','');
INSERT INTO upazilas VALUES('196','25','Kushtia Sadar','কুষ্টিয়া সদর','kushtiasadar.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('197','25','Kumarkhali','কুমারখালী','kumarkhali.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('198','25','Khoksa','খোকসা','khoksa.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('199','25','Mirpur','মিরপুর','mirpurkushtia.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('200','25','Daulatpur','দৌলতপুর','daulatpur.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('201','25','Bheramara','ভেড়ামারা','bheramara.kushtia.gov.bd','','');
INSERT INTO upazilas VALUES('202','26','Shalikha','শালিখা','shalikha.magura.gov.bd','','');
INSERT INTO upazilas VALUES('203','26','Sreepur','শ্রীপুর','sreepur.magura.gov.bd','','');
INSERT INTO upazilas VALUES('204','26','Magura Sadar','মাগুরা সদর','magurasadar.magura.gov.bd','','');
INSERT INTO upazilas VALUES('205','26','Mohammadpur','মহম্মদপুর','mohammadpur.magura.gov.bd','','');
INSERT INTO upazilas VALUES('206','27','Paikgasa','পাইকগাছা','paikgasa.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('207','27','Fultola','ফুলতলা','fultola.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('208','27','Digholia','দিঘলিয়া','digholia.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('209','27','Rupsha','রূপসা','rupsha.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('210','27','Terokhada','তেরখাদা','terokhada.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('211','27','Dumuria','ডুমুরিয়া','dumuria.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('212','27','Botiaghata','বটিয়াঘাটা','botiaghata.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('213','27','Dakop','দাকোপ','dakop.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('214','27','Koyra','কয়রা','koyra.khulna.gov.bd','','');
INSERT INTO upazilas VALUES('215','28','Fakirhat','ফকিরহাট','fakirhat.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('216','28','Bagerhat Sadar','বাগেরহাট সদর','sadar.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('217','28','Mollahat','মোল্লাহাট','mollahat.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('218','28','Sarankhola','শরণখোলা','sarankhola.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('219','28','Rampal','রামপাল','rampal.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('220','28','Morrelganj','মোড়েলগঞ্জ','morrelganj.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('221','28','Kachua','কচুয়া','kachua.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('222','28','Mongla','মোংলা','mongla.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('223','28','Chitalmari','চিতলমারী','chitalmari.bagerhat.gov.bd','','');
INSERT INTO upazilas VALUES('224','29','Jhenaidah Sadar','ঝিনাইদহ সদর','sadar.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('225','29','Shailkupa','শৈলকুপা','shailkupa.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('226','29','Harinakundu','হরিণাকুন্ডু','harinakundu.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('227','29','Kaliganj','কালীগঞ্জ','kaliganj.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('228','29','Kotchandpur','কোটচাঁদপুর','kotchandpur.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('229','29','Moheshpur','মহেশপুর','moheshpur.jhenaidah.gov.bd','','');
INSERT INTO upazilas VALUES('230','30','Jhalakathi Sadar','ঝালকাঠি সদর','sadar.jhalakathi.gov.bd','','');
INSERT INTO upazilas VALUES('231','30','Kathalia','কাঠালিয়া','kathalia.jhalakathi.gov.bd','','');
INSERT INTO upazilas VALUES('232','30','Nalchity','নলছিটি','nalchity.jhalakathi.gov.bd','','');
INSERT INTO upazilas VALUES('233','30','Rajapur','রাজাপুর','rajapur.jhalakathi.gov.bd','','');
INSERT INTO upazilas VALUES('234','31','Bauphal','বাউফল','bauphal.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('235','31','Patuakhali Sadar','পটুয়াখালী সদর','sadar.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('236','31','Dumki','দুমকি','dumki.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('237','31','Dashmina','দশমিনা','dashmina.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('238','31','Kalapara','কলাপাড়া','kalapara.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('239','31','Mirzaganj','মির্জাগঞ্জ','mirzaganj.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('240','31','Galachipa','গলাচিপা','galachipa.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('241','31','Rangabali','রাঙ্গাবালী','rangabali.patuakhali.gov.bd','','');
INSERT INTO upazilas VALUES('242','32','Pirojpur Sadar','পিরোজপুর সদর','sadar.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('243','32','Nazirpur','নাজিরপুর','nazirpur.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('244','32','Kawkhali','কাউখালী','kawkhali.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('245','32','Zianagar','জিয়ানগর','zianagar.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('246','32','Bhandaria','ভান্ডারিয়া','bhandaria.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('247','32','Mathbaria','মঠবাড়ীয়া','mathbaria.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('248','32','Nesarabad','নেছারাবাদ','nesarabad.pirojpur.gov.bd','','');
INSERT INTO upazilas VALUES('249','33','Barisal Sadar','বরিশাল সদর','barisalsadar.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('250','33','Bakerganj','বাকেরগঞ্জ','bakerganj.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('251','33','Babuganj','বাবুগঞ্জ','babuganj.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('252','33','Wazirpur','উজিরপুর','wazirpur.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('253','33','Banaripara','বানারীপাড়া','banaripara.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('254','33','Gournadi','গৌরনদী','gournadi.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('255','33','Agailjhara','আগৈলঝাড়া','agailjhara.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('256','33','Mehendiganj','মেহেন্দিগঞ্জ','mehendiganj.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('257','33','Muladi','মুলাদী','muladi.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('258','33','Hizla','হিজলা','hizla.barisal.gov.bd','','');
INSERT INTO upazilas VALUES('259','34','Bhola Sadar','ভোলা সদর','sadar.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('260','34','Borhan Sddin','বোরহান উদ্দিন','borhanuddin.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('261','34','Charfesson','চরফ্যাশন','charfesson.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('262','34','Doulatkhan','দৌলতখান','doulatkhan.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('263','34','Monpura','মনপুরা','monpura.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('264','34','Tazumuddin','তজুমদ্দিন','tazumuddin.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('265','34','Lalmohan','লালমোহন','lalmohan.bhola.gov.bd','','');
INSERT INTO upazilas VALUES('266','35','Amtali','আমতলী','amtali.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('267','35','Barguna Sadar','বরগুনা সদর','sadar.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('268','35','Betagi','বেতাগী','betagi.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('269','35','Bamna','বামনা','bamna.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('270','35','Pathorghata','পাথরঘাটা','pathorghata.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('271','35','Taltali','তালতলি','taltali.barguna.gov.bd','','');
INSERT INTO upazilas VALUES('272','36','Balaganj','বালাগঞ্জ','balaganj.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('273','36','Beanibazar','বিয়ানীবাজার','beanibazar.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('274','36','Bishwanath','বিশ্বনাথ','bishwanath.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('275','36','Companiganj','কোম্পানীগঞ্জ','companiganj.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('276','36','Fenchuganj','ফেঞ্চুগঞ্জ','fenchuganj.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('277','36','Golapganj','গোলাপগঞ্জ','golapganj.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('278','36','Gowainghat','গোয়াইনঘাট','gowainghat.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('279','36','Jaintiapur','জৈন্তাপুর','jaintiapur.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('280','36','Kanaighat','কানাইঘাট','kanaighat.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('281','36','Sylhet Sadar','সিলেট সদর','sylhetsadar.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('282','36','Zakiganj','জকিগঞ্জ','zakiganj.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('283','36','Dakshinsurma','দক্ষিণ সুরমা','dakshinsurma.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('284','36','Osmaninagar','ওসমানী নগর','osmaninagar.sylhet.gov.bd','','');
INSERT INTO upazilas VALUES('285','37','Barlekha','বড়লেখা','barlekha.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('286','37','Kamolganj','কমলগঞ্জ','kamolganj.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('287','37','Kulaura','কুলাউড়া','kulaura.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('288','37','Moulvibazar Sadar','মৌলভীবাজার সদর','moulvibazarsadar.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('289','37','Rajnagar','রাজনগর','rajnagar.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('290','37','Sreemangal','শ্রীমঙ্গল','sreemangal.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('291','37','Juri','জুড়ী','juri.moulvibazar.gov.bd','','');
INSERT INTO upazilas VALUES('292','38','Nabiganj','নবীগঞ্জ','nabiganj.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('293','38','Bahubal','বাহুবল','bahubal.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('294','38','Ajmiriganj','আজমিরীগঞ্জ','ajmiriganj.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('295','38','Baniachong','বানিয়াচং','baniachong.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('296','38','Lakhai','লাখাই','lakhai.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('297','38','Chunarughat','চুনারুঘাট','chunarughat.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('298','38','Habiganj Sadar','হবিগঞ্জ সদর','habiganjsadar.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('299','38','Madhabpur','মাধবপুর','madhabpur.habiganj.gov.bd','','');
INSERT INTO upazilas VALUES('300','39','Sunamganj Sadar','সুনামগঞ্জ সদর','sadar.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('301','39','South Sunamganj','দক্ষিণ সুনামগঞ্জ','southsunamganj.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('302','39','Bishwambarpur','বিশ্বম্ভরপুর','bishwambarpur.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('303','39','Chhatak','ছাতক','chhatak.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('304','39','Jagannathpur','জগন্নাথপুর','jagannathpur.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('305','39','Dowarabazar','দোয়ারাবাজার','dowarabazar.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('306','39','Tahirpur','তাহিরপুর','tahirpur.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('307','39','Dharmapasha','ধর্মপাশা','dharmapasha.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('308','39','Jamalganj','জামালগঞ্জ','jamalganj.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('309','39','Shalla','শাল্লা','shalla.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('310','39','Derai','দিরাই','derai.sunamganj.gov.bd','','');
INSERT INTO upazilas VALUES('311','40','Belabo','বেলাবো','belabo.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('312','40','Monohardi','মনোহরদী','monohardi.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('313','40','Narsingdi Sadar','নরসিংদী সদর','narsingdisadar.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('314','40','Palash','পলাশ','palash.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('315','40','Raipura','রায়পুরা','raipura.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('316','40','Shibpur','শিবপুর','shibpur.narsingdi.gov.bd','','');
INSERT INTO upazilas VALUES('317','41','Kaliganj','কালীগঞ্জ','kaliganj.gazipur.gov.bd','','');
INSERT INTO upazilas VALUES('318','41','Kaliakair','কালিয়াকৈর','kaliakair.gazipur.gov.bd','','');
INSERT INTO upazilas VALUES('319','41','Kapasia','কাপাসিয়া','kapasia.gazipur.gov.bd','','');
INSERT INTO upazilas VALUES('320','41','Gazipur Sadar','গাজীপুর সদর','sadar.gazipur.gov.bd','','');
INSERT INTO upazilas VALUES('321','41','Sreepur','শ্রীপুর','sreepur.gazipur.gov.bd','','');
INSERT INTO upazilas VALUES('322','42','Shariatpur Sadar','শরিয়তপুর সদর','sadar.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('323','42','Naria','নড়িয়া','naria.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('324','42','Zajira','জাজিরা','zajira.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('325','42','Gosairhat','গোসাইরহাট','gosairhat.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('326','42','Bhedarganj','ভেদরগঞ্জ','bhedarganj.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('327','42','Damudya','ডামুড্যা','damudya.shariatpur.gov.bd','','');
INSERT INTO upazilas VALUES('328','43','Araihazar','আড়াইহাজার','araihazar.narayanganj.gov.bd','','');
INSERT INTO upazilas VALUES('329','43','Bandar','বন্দর','bandar.narayanganj.gov.bd','','');
INSERT INTO upazilas VALUES('330','43','Narayanganj Sadar','নারায়নগঞ্জ সদর','narayanganjsadar.narayanganj.gov.bd','','');
INSERT INTO upazilas VALUES('331','43','Rupganj','রূপগঞ্জ','rupganj.narayanganj.gov.bd','','');
INSERT INTO upazilas VALUES('332','43','Sonargaon','সোনারগাঁ','sonargaon.narayanganj.gov.bd','','');
INSERT INTO upazilas VALUES('333','44','Basail','বাসাইল','basail.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('334','44','Bhuapur','ভুয়াপুর','bhuapur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('335','44','Delduar','দেলদুয়ার','delduar.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('336','44','Ghatail','ঘাটাইল','ghatail.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('337','44','Gopalpur','গোপালপুর','gopalpur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('338','44','Madhupur','মধুপুর','madhupur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('339','44','Mirzapur','মির্জাপুর','mirzapur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('340','44','Nagarpur','নাগরপুর','nagarpur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('341','44','Sakhipur','সখিপুর','sakhipur.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('342','44','Tangail Sadar','টাঙ্গাইল সদর','tangailsadar.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('343','44','Kalihati','কালিহাতী','kalihati.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('344','44','Dhanbari','ধনবাড়ী','dhanbari.tangail.gov.bd','','');
INSERT INTO upazilas VALUES('345','45','Itna','ইটনা','itna.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('346','45','Katiadi','কটিয়াদী','katiadi.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('347','45','Bhairab','ভৈরব','bhairab.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('348','45','Tarail','তাড়াইল','tarail.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('349','45','Hossainpur','হোসেনপুর','hossainpur.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('350','45','Pakundia','পাকুন্দিয়া','pakundia.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('351','45','Kuliarchar','কুলিয়ারচর','kuliarchar.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('352','45','Kishoreganj Sadar','কিশোরগঞ্জ সদর','kishoreganjsadar.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('353','45','Karimgonj','করিমগঞ্জ','karimgonj.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('354','45','Bajitpur','বাজিতপুর','bajitpur.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('355','45','Austagram','অষ্টগ্রাম','austagram.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('356','45','Mithamoin','মিঠামইন','mithamoin.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('357','45','Nikli','নিকলী','nikli.kishoreganj.gov.bd','','');
INSERT INTO upazilas VALUES('358','46','Harirampur','হরিরামপুর','harirampur.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('359','46','Saturia','সাটুরিয়া','saturia.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('360','46','Manikganj Sadar','মানিকগঞ্জ সদর','sadar.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('361','46','Gior','ঘিওর','gior.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('362','46','Shibaloy','শিবালয়','shibaloy.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('363','46','Doulatpur','দৌলতপুর','doulatpur.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('364','46','Singiar','সিংগাইর','singiar.manikganj.gov.bd','','');
INSERT INTO upazilas VALUES('365','47','Savar','সাভার','savar.dhaka.gov.bd','','');
INSERT INTO upazilas VALUES('366','47','Dhamrai','ধামরাই','dhamrai.dhaka.gov.bd','','');
INSERT INTO upazilas VALUES('367','47','Keraniganj','কেরাণীগঞ্জ','keraniganj.dhaka.gov.bd','','');
INSERT INTO upazilas VALUES('368','47','Nawabganj','নবাবগঞ্জ','nawabganj.dhaka.gov.bd','','');
INSERT INTO upazilas VALUES('369','47','Dohar','দোহার','dohar.dhaka.gov.bd','','');
INSERT INTO upazilas VALUES('370','48','Munshiganj Sadar','মুন্সিগঞ্জ সদর','sadar.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('371','48','Sreenagar','শ্রীনগর','sreenagar.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('372','48','Sirajdikhan','সিরাজদিখান','sirajdikhan.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('373','48','Louhajanj','লৌহজং','louhajanj.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('374','48','Gajaria','গজারিয়া','gajaria.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('375','48','Tongibari','টংগীবাড়ি','tongibari.munshiganj.gov.bd','','');
INSERT INTO upazilas VALUES('376','49','Rajbari Sadar','রাজবাড়ী সদর','sadar.rajbari.gov.bd','','');
INSERT INTO upazilas VALUES('377','49','Goalanda','গোয়ালন্দ','goalanda.rajbari.gov.bd','','');
INSERT INTO upazilas VALUES('378','49','Pangsa','পাংশা','pangsa.rajbari.gov.bd','','');
INSERT INTO upazilas VALUES('379','49','Baliakandi','বালিয়াকান্দি','baliakandi.rajbari.gov.bd','','');
INSERT INTO upazilas VALUES('380','49','Kalukhali','কালুখালী','kalukhali.rajbari.gov.bd','','');
INSERT INTO upazilas VALUES('381','50','Madaripur Sadar','মাদারীপুর সদর','sadar.madaripur.gov.bd','','');
INSERT INTO upazilas VALUES('382','50','Shibchar','শিবচর','shibchar.madaripur.gov.bd','','');
INSERT INTO upazilas VALUES('383','50','Kalkini','কালকিনি','kalkini.madaripur.gov.bd','','');
INSERT INTO upazilas VALUES('384','50','Rajoir','রাজৈর','rajoir.madaripur.gov.bd','','');
INSERT INTO upazilas VALUES('385','51','Gopalganj Sadar','গোপালগঞ্জ সদর','sadar.gopalganj.gov.bd','','');
INSERT INTO upazilas VALUES('386','51','Kashiani','কাশিয়ানী','kashiani.gopalganj.gov.bd','','');
INSERT INTO upazilas VALUES('387','51','Tungipara','টুংগীপাড়া','tungipara.gopalganj.gov.bd','','');
INSERT INTO upazilas VALUES('388','51','Kotalipara','কোটালীপাড়া','kotalipara.gopalganj.gov.bd','','');
INSERT INTO upazilas VALUES('389','51','Muksudpur','মুকসুদপুর','muksudpur.gopalganj.gov.bd','','');
INSERT INTO upazilas VALUES('390','52','Faridpur Sadar','ফরিদপুর সদর','sadar.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('391','52','Alfadanga','আলফাডাঙ্গা','alfadanga.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('392','52','Boalmari','বোয়ালমারী','boalmari.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('393','52','Sadarpur','সদরপুর','sadarpur.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('394','52','Nagarkanda','নগরকান্দা','nagarkanda.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('395','52','Bhanga','ভাঙ্গা','bhanga.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('396','52','Charbhadrasan','চরভদ্রাসন','charbhadrasan.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('397','52','Madhukhali','মধুখালী','madhukhali.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('398','52','Saltha','সালথা','saltha.faridpur.gov.bd','','');
INSERT INTO upazilas VALUES('399','53','Panchagarh Sadar','পঞ্চগড় সদর','panchagarhsadar.panchagarh.gov.bd','','');
INSERT INTO upazilas VALUES('400','53','Debiganj','দেবীগঞ্জ','debiganj.panchagarh.gov.bd','','');
INSERT INTO upazilas VALUES('401','53','Boda','বোদা','boda.panchagarh.gov.bd','','');
INSERT INTO upazilas VALUES('402','53','Atwari','আটোয়ারী','atwari.panchagarh.gov.bd','','');
INSERT INTO upazilas VALUES('403','53','Tetulia','তেতুলিয়া','tetulia.panchagarh.gov.bd','','');
INSERT INTO upazilas VALUES('404','54','Nawabganj','নবাবগঞ্জ','nawabganj.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('405','54','Birganj','বীরগঞ্জ','birganj.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('406','54','Ghoraghat','ঘোড়াঘাট','ghoraghat.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('407','54','Birampur','বিরামপুর','birampur.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('408','54','Parbatipur','পার্বতীপুর','parbatipur.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('409','54','Bochaganj','বোচাগঞ্জ','bochaganj.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('410','54','Kaharol','কাহারোল','kaharol.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('411','54','Fulbari','ফুলবাড়ী','fulbari.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('412','54','Dinajpur Sadar','দিনাজপুর সদর','dinajpursadar.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('413','54','Hakimpur','হাকিমপুর','hakimpur.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('414','54','Khansama','খানসামা','khansama.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('415','54','Birol','বিরল','birol.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('416','54','Chirirbandar','চিরিরবন্দর','chirirbandar.dinajpur.gov.bd','','');
INSERT INTO upazilas VALUES('417','55','Lalmonirhat Sadar','লালমনিরহাট সদর','sadar.lalmonirhat.gov.bd','','');
INSERT INTO upazilas VALUES('418','55','Kaliganj','কালীগঞ্জ','kaliganj.lalmonirhat.gov.bd','','');
INSERT INTO upazilas VALUES('419','55','Hatibandha','হাতীবান্ধা','hatibandha.lalmonirhat.gov.bd','','');
INSERT INTO upazilas VALUES('420','55','Patgram','পাটগ্রাম','patgram.lalmonirhat.gov.bd','','');
INSERT INTO upazilas VALUES('421','55','Aditmari','আদিতমারী','aditmari.lalmonirhat.gov.bd','','');
INSERT INTO upazilas VALUES('422','56','Syedpur','সৈয়দপুর','syedpur.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('423','56','Domar','ডোমার','domar.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('424','56','Dimla','ডিমলা','dimla.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('425','56','Jaldhaka','জলঢাকা','jaldhaka.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('426','56','Kishorganj','কিশোরগঞ্জ','kishorganj.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('427','56','Nilphamari Sadar','নীলফামারী সদর','nilphamarisadar.nilphamari.gov.bd','','');
INSERT INTO upazilas VALUES('428','57','Sadullapur','সাদুল্লাপুর','sadullapur.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('429','57','Gaibandha Sadar','গাইবান্ধা সদর','gaibandhasadar.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('430','57','Palashbari','পলাশবাড়ী','palashbari.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('431','57','Saghata','সাঘাটা','saghata.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('432','57','Gobindaganj','গোবিন্দগঞ্জ','gobindaganj.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('433','57','Sundarganj','সুন্দরগঞ্জ','sundarganj.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('434','57','Phulchari','ফুলছড়ি','phulchari.gaibandha.gov.bd','','');
INSERT INTO upazilas VALUES('435','58','Thakurgaon Sadar','ঠাকুরগাঁও সদর','thakurgaonsadar.thakurgaon.gov.bd','','');
INSERT INTO upazilas VALUES('436','58','Pirganj','পীরগঞ্জ','pirganj.thakurgaon.gov.bd','','');
INSERT INTO upazilas VALUES('437','58','Ranisankail','রাণীশংকৈল','ranisankail.thakurgaon.gov.bd','','');
INSERT INTO upazilas VALUES('438','58','Haripur','হরিপুর','haripur.thakurgaon.gov.bd','','');
INSERT INTO upazilas VALUES('439','58','Baliadangi','বালিয়াডাঙ্গী','baliadangi.thakurgaon.gov.bd','','');
INSERT INTO upazilas VALUES('440','59','Rangpur Sadar','রংপুর সদর','rangpursadar.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('441','59','Gangachara','গংগাচড়া','gangachara.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('442','59','Taragonj','তারাগঞ্জ','taragonj.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('443','59','Badargonj','বদরগঞ্জ','badargonj.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('444','59','Mithapukur','মিঠাপুকুর','mithapukur.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('445','59','Pirgonj','পীরগঞ্জ','pirgonj.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('446','59','Kaunia','কাউনিয়া','kaunia.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('447','59','Pirgacha','পীরগাছা','pirgacha.rangpur.gov.bd','','');
INSERT INTO upazilas VALUES('448','60','Kurigram Sadar','কুড়িগ্রাম সদর','kurigramsadar.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('449','60','Nageshwari','নাগেশ্বরী','nageshwari.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('450','60','Bhurungamari','ভুরুঙ্গামারী','bhurungamari.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('451','60','Phulbari','ফুলবাড়ী','phulbari.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('452','60','Rajarhat','রাজারহাট','rajarhat.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('453','60','Ulipur','উলিপুর','ulipur.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('454','60','Chilmari','চিলমারী','chilmari.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('455','60','Rowmari','রৌমারী','rowmari.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('456','60','Charrajibpur','চর রাজিবপুর','charrajibpur.kurigram.gov.bd','','');
INSERT INTO upazilas VALUES('457','61','Sherpur Sadar','শেরপুর সদর','sherpursadar.sherpur.gov.bd','','');
INSERT INTO upazilas VALUES('458','61','Nalitabari','নালিতাবাড়ী','nalitabari.sherpur.gov.bd','','');
INSERT INTO upazilas VALUES('459','61','Sreebordi','শ্রীবরদী','sreebordi.sherpur.gov.bd','','');
INSERT INTO upazilas VALUES('460','61','Nokla','নকলা','nokla.sherpur.gov.bd','','');
INSERT INTO upazilas VALUES('461','61','Jhenaigati','ঝিনাইগাতী','jhenaigati.sherpur.gov.bd','','');
INSERT INTO upazilas VALUES('462','62','Fulbaria','ফুলবাড়ীয়া','fulbaria.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('463','62','Trishal','ত্রিশাল','trishal.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('464','62','Bhaluka','ভালুকা','bhaluka.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('465','62','Muktagacha','মুক্তাগাছা','muktagacha.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('466','62','Mymensingh Sadar','ময়মনসিংহ সদর','mymensinghsadar.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('467','62','Dhobaura','ধোবাউড়া','dhobaura.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('468','62','Phulpur','ফুলপুর','phulpur.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('469','62','Haluaghat','হালুয়াঘাট','haluaghat.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('470','62','Gouripur','গৌরীপুর','gouripur.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('471','62','Gafargaon','গফরগাঁও','gafargaon.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('472','62','Iswarganj','ঈশ্বরগঞ্জ','iswarganj.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('473','62','Nandail','নান্দাইল','nandail.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('474','62','Tarakanda','তারাকান্দা','tarakanda.mymensingh.gov.bd','','');
INSERT INTO upazilas VALUES('475','63','Jamalpur Sadar','জামালপুর সদর','jamalpursadar.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('476','63','Melandah','মেলান্দহ','melandah.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('477','63','Islampur','ইসলামপুর','islampur.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('478','63','Dewangonj','দেওয়ানগঞ্জ','dewangonj.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('479','63','Sarishabari','সরিষাবাড়ী','sarishabari.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('480','63','Madarganj','মাদারগঞ্জ','madarganj.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('481','63','Bokshiganj','বকশীগঞ্জ','bokshiganj.jamalpur.gov.bd','','');
INSERT INTO upazilas VALUES('482','64','Barhatta','বারহাট্টা','barhatta.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('483','64','Durgapur','দুর্গাপুর','durgapur.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('484','64','Kendua','কেন্দুয়া','kendua.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('485','64','Atpara','আটপাড়া','atpara.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('486','64','Madan','মদন','madan.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('487','64','Khaliajuri','খালিয়াজুরী','khaliajuri.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('488','64','Kalmakanda','কলমাকান্দা','kalmakanda.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('489','64','Mohongonj','মোহনগঞ্জ','mohongonj.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('490','64','Purbadhala','পূর্বধলা','purbadhala.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('491','64','Netrokona Sadar','নেত্রকোণা সদর','netrokonasadar.netrokona.gov.bd','','');
INSERT INTO upazilas VALUES('500','47','Adabor','আদাবর','','','');
INSERT INTO upazilas VALUES('501','47','Badda','বাড্ডা','','','');
INSERT INTO upazilas VALUES('502','47','Bangshal ','বংশাল','','','');
INSERT INTO upazilas VALUES('503','47','Biman Bandar','বিমান বন্দর ','','','');
INSERT INTO upazilas VALUES('504','47','Cantonment','ক্যান্টনমেন্ট ','','','');
INSERT INTO upazilas VALUES('505','47','Chawkbazar','চকবাজার  ','','','');
INSERT INTO upazilas VALUES('506','47','Dakshinkhan','দক্ষিণখান ','','','');
INSERT INTO upazilas VALUES('507','47','Darus Salam','দার-উস-সালাম','','','');
INSERT INTO upazilas VALUES('508','47','Demra','ডেমরা','','','');
INSERT INTO upazilas VALUES('509','47','Dhanmondi','ধানমন্ডি','','','');
INSERT INTO upazilas VALUES('510','47','Gendaria','গেন্ডারিয়া','','','');
INSERT INTO upazilas VALUES('511','47','Gulshan','গুলশান','','','');
INSERT INTO upazilas VALUES('512','47','Hazaribagh','হাজারীবাগ','','','');
INSERT INTO upazilas VALUES('513','47','Jatrabari ','যাত্রাবাড়ি','','','');
INSERT INTO upazilas VALUES('514','47','Kadamatali','কদমতলী','','','');
INSERT INTO upazilas VALUES('515','47','Kapharula','কাফরুল','','','');
INSERT INTO upazilas VALUES('516','47','Kalabagan','কলাবাগান','','','');
INSERT INTO upazilas VALUES('517','47','Kamrangirchar','কামরাঙ্গিরচর','','','');
INSERT INTO upazilas VALUES('518','47','Khilgaon','খিলগাঁও','','','');
INSERT INTO upazilas VALUES('519','47','Khilkhet','খিলক্ষেত','','','');
INSERT INTO upazilas VALUES('520','47','Kotwali','কোতোয়ালী','','','');
INSERT INTO upazilas VALUES('521','47','Lalbagh','লালবাগ ','','','');
INSERT INTO upazilas VALUES('522','47','Mirpur','মিরপুর','','','');
INSERT INTO upazilas VALUES('523','47','Mohammadpur','মোহাম্মদপুর','','','');
INSERT INTO upazilas VALUES('524','47','Motijheel','মতিঝিল','','','');
INSERT INTO upazilas VALUES('525','47','New Market ','নিউমার্কেট ','','','');
INSERT INTO upazilas VALUES('526','47','Pallabi','পল্লবী','','','');
INSERT INTO upazilas VALUES('527','47','Paltan ','পল্টন','','','');
INSERT INTO upazilas VALUES('528','47','Ramna','রমনা','','','');
INSERT INTO upazilas VALUES('529','47','Rampura ','রামপুরা','','','');
INSERT INTO upazilas VALUES('530','47','Sabujbagh','সবুজবাগ','','','');
INSERT INTO upazilas VALUES('531','47','Shah Ali','শাহ আলী','','','');
INSERT INTO upazilas VALUES('532','47','Shahbagh ','শাহবাগ ','','','');
INSERT INTO upazilas VALUES('533','47','Sher-e-Bangla Nagar','শেরেবাংলা নগর','','','');
INSERT INTO upazilas VALUES('534','47','Shyampur','শ্যামপুর','','','');
INSERT INTO upazilas VALUES('535','47','Sutrapur','সূত্রাপুর','','','');
INSERT INTO upazilas VALUES('536','47','Tejgaon','তেজগাঁও','','','');
INSERT INTO upazilas VALUES('537','47','Tejgaon Industrial Area','তেজগাঁও শিল্পাঞ্চল','','','');
INSERT INTO upazilas VALUES('538','47','Turag','তুরাগ','','','');
INSERT INTO upazilas VALUES('539','47','Uttara','উত্তরা','','','');
INSERT INTO upazilas VALUES('540','47','Uttar Khan','উত্তর খান ','','','');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `father` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` bigint DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `gender` tinyint DEFAULT NULL COMMENT '0=female|1=male',
  `address` text COLLATE utf8mb4_unicode_ci,
  `staff_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` smallint NOT NULL,
  `district_id` smallint NOT NULL,
  `upazila_id` mediumint NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `house_rent` decimal(10,2) DEFAULT NULL,
  `mobile_rent` decimal(10,2) DEFAULT NULL,
  `other_bill` decimal(10,2) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Mahfuz Akand','','akandmahfuz@gmail.com','2022-11-01 04:10:51','$2y$10$Ch/HZ2vyGBWCvgc1xbESueZrgSnZjpxAEP.L5.acAjpL3Y/LII50W','admin','','default.png','1','English','','','','','','','','','','','0','0','0','','','','','','2022-11-01 04:10:51','2023-01-16 11:33:37');
INSERT INTO users VALUES('2','Mahfuz Akand','01689655055','hellomahfuz.xyz@gmail.com','2022-11-01 10:19:42','$2y$10$tCAWpWRM1Xg26ESYOC2bsu38PeCehUb/Y.CVyAwemGWdaI/kqgB7a','user','','profile_1676368401.png','1','English','','','','','','1','','House 3, Road No-9/B, Uttara 5 no. Sector Dhaka','','','6','40','311','','','','','','2022-11-01 10:19:42','2023-02-14 15:53:21');
INSERT INTO users VALUES('3','Mr. Client','','akand@gmail.com','2022-11-01 11:16:28','$2y$10$Pvd2mdy6YRypM55dFSsWfeX3yTAv7Bzw45qO2EUNzKoGtU09g3awW','client','','default.png','1','','','','','','','','','','','','0','0','0','','','','','','2022-11-01 11:16:28','2022-11-01 11:16:28');
INSERT INTO users VALUES('39','Test Name','01521484948','mfaridhossain24@gmail.com','2023-11-09 15:41:17','$2y$10$LAytHZfFDVZDtK7R7wCxueei8oOE11JnliuUAsL60YshopjvFTlR2','user','','default.png','1','','','','','','','29','','','','','0','14','123','','','','','','2023-11-09 15:41:17','2023-11-09 15:41:17');
INSERT INTO users VALUES('38','Mizbah','01521484948','miz@gmail.com','2023-11-07 15:12:53','$2y$10$4KIJc6DbbeL8lI6Wi8/jLuMQYUWCRK0.egdRIGjk1EOe28Q/tvGf.','user','','default.png','1','','','','','','','28','','','','','0','12','108','','','','','','2023-11-07 15:12:53','2023-11-07 15:12:53');
INSERT INTO users VALUES('27','test','13131311234234','','','','staff','4','default.png','1','','2023-01-17','2013-01-08','dad','mom','1232344412344','1','1','','1001','','0','0','0','10000.00','','','','','2023-01-17 16:18:49','2023-01-17 16:18:49');
INSERT INTO users VALUES('28','Test Staff','015223224242','','','','staff','4','default.png','1','','2023-01-17','2002-12-24','Papa','Mom','10224234423','1','1','test area','1002','sign_1673951403.png','0','0','0','3000.00','','','','','2023-01-17 16:30:03','2023-01-17 17:54:51');
INSERT INTO users VALUES('29','John','01819821602','','','','staff','4','default.png','1','','2004-01-16','1983-01-27','','','1032423423','1','1','House 10, Road No-8, Uttara 5 no. Sector Dhaka','1003','','0','0','0','1000.00','100.00','200.00','50.00','','2023-01-17 18:18:20','2023-01-18 12:24:01');



DROP TABLE IF EXISTS vehicle_types;

CREATE TABLE `vehicle_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0=deactive|1=active',
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO vehicle_types VALUES('1','Bus','20','1','1','2022-12-17 13:08:49','2022-12-17 13:08:54');
INSERT INTO vehicle_types VALUES('2','Truck','','0','1','2022-12-25 11:59:04','2022-12-25 11:59:35');
INSERT INTO vehicle_types VALUES('3','Covered Van','','1','2','2023-01-02 12:33:10','2023-01-02 12:33:17');
INSERT INTO vehicle_types VALUES('4','mini truck','','1','2','2023-01-02 12:34:38','2023-01-02 12:34:38');
INSERT INTO vehicle_types VALUES('5','temporary','','1','1','','');



DROP TABLE IF EXISTS vehicles;

CREATE TABLE `vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_plate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_exp_date` date DEFAULT NULL,
  `in_service` tinyint DEFAULT '1',
  `type_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `vehicle_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chassis_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eng_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` decimal(10,2) DEFAULT NULL,
  `mileage` decimal(10,2) DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'condition used|new',
  `ins_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int NOT NULL,
  `owner_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO vehicles VALUES('1','VTS200','DHK Metro-KA 45-3353','2022-11-28','1','1','1','l9vDHK Metro-KA 45-3353.jpeg','Bradford','','','5.00','4.34','new','','1','','','','2022-12-17 13:11:09','2023-01-25 12:59:29');
INSERT INTO vehicles VALUES('2','VTS200','Dhk Metro-GA 12334','','1','3','4','','','','','','','','','2','','','','2023-01-02 12:37:15','2023-01-02 12:37:36');
INSERT INTO vehicles VALUES('3','','CHATTA Metro-HA 55-2323','2032-09-24','1','1','1','mfJCHATTA Metro-HA 55-2323.png','TATA','2342sfsf','sfsfsf 34354','7.00','5.00','new','242424','1','','','','2023-01-18 17:31:49','2023-01-20 10:15:31');
INSERT INTO vehicles VALUES('4','TATA 5 Ton','DHK Metro DA-345343','2023-01-04','1','1','2','c2EDHK Metro DA-345343.jpg','TATA','TEST2323','2342 VTEDDC','5.00','5.00','used','INSw3234','1','','','','2023-01-18 18:00:09','2023-02-01 11:49:17');



