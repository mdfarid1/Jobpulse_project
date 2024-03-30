-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2024 at 05:33 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `account_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_date` date NOT NULL,
  `account_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` decimal(10,2) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_title`, `opening_date`, `account_number`, `account_currency`, `opening_balance`, `note`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2022-11-01', 'cash', 'BDT', 0.00, NULL, 1, '2022-11-01 05:05:49', '2022-11-01 05:05:49'),
(2, 'Bank', '2022-12-14', '2234 3434 0343 2222', 'BDT', 5000.00, NULL, 1, '2022-12-14 08:31:42', '2022-12-14 08:31:42'),
(3, 'Cash', '2023-01-02', NULL, 'BDT', 0.00, NULL, 2, '2023-01-02 07:10:28', '2023-01-02 07:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `related_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `activity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `related_to`, `related_id`, `activity`, `user_id`, `company_id`, `created_at`, `updated_at`) VALUES
(3, 'projects', 1, 'Assign To Kamal', 2, 1, '2022-12-14 08:50:17', '2022-12-14 08:50:17'),
(4, 'projects', 1, 'Change Project Status - In Progress', 2, 1, '2022-12-14 08:53:06', '2022-12-14 08:53:06'),
(5, 'projects', 1, 'Updated Project', 2, 1, '2022-12-14 08:53:06', '2022-12-14 08:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `applies`
--

CREATE TABLE `applies` (
  `id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bio` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cv` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `blog_id` int DEFAULT NULL,
  `stuff_id` int DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'On Hold',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applies`
--

INSERT INTO `applies` (`id`, `name`, `email`, `phone`, `dob`, `bio`, `cv`, `user_id`, `company_id`, `blog_id`, `stuff_id`, `status`, `created_at`, `updated_at`) VALUES
(17, 'Md Farid Hossain', 'mfaridhossain242@gmail.com', '01309323741', '2024-03-06', 'hi', 'cv_1709273780.pdf', 92, 98, 17, NULL, 'approved', '2024-03-01 00:16:20', '2024-03-01 09:39:46'),
(18, 'Md Farid Hossain', 'mfardknj54@gmail.com', '01309323741', '2024-02-27', 'ki', 'cv_1709306282.pdf', 94, 97, 19, NULL, 'approved', '2024-03-01 09:18:02', '2024-03-01 09:40:17'),
(19, 'Md Farid Hossain', 'mfaridhossain242@gmail.com', '01309323741', '2024-03-06', 'hi', 'cv_1709309824.pdf', 94, 98, 19, NULL, 'approved', '2024-03-01 10:17:04', '2024-03-05 09:54:37'),
(20, 'Md Farid Hossain', 'mfaridhossain242@gmail.com', '01309323741', '2024-03-06', 'hi', 'cv_1709309866.pdf', 94, 98, 19, NULL, 'approved', '2024-03-01 10:17:46', '2024-03-05 09:54:44'),
(21, 'Md Arif Hossain', 'akandmbvvahfuz@gmail.com', '01309323741', '2024-03-22', 'hi', 'cv_1709471875.pdf', 94, 99, 19, NULL, 'On Hold', '2024-03-03 07:17:55', '2024-03-03 07:17:55'),
(24, 'Md Farid Hossain', 'mfardknj54@gmail.com', '01309323741', '2024-03-22', 'ji', 'cv_1709653972.pdf', 92, 97, 31, NULL, 'approved', '2024-03-05 09:52:52', '2024-03-07 02:20:29'),
(25, 'arafat', 'mfardknj54@gmail.com', '01309323741', '2024-03-14', 'ji', 'cv_1709654027.pdf', 94, 97, 20, NULL, 'On Hold', '2024-03-05 09:53:47', '2024-03-05 09:53:47'),
(26, 'Md Farid Hossain', 'farid24@gmail.com', '01309323741', '2024-03-03', 'Hello', 'cv_1709799422.pdf', 94, 108, 33, NULL, 'On Hold', '2024-03-07 02:17:02', '2024-03-07 02:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int NOT NULL,
  `entry_at` time DEFAULT NULL,
  `exit_at` time DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `student_id`, `class_id`, `entry_at`, `exit_at`, `company_id`, `created_at`, `updated_at`) VALUES
(101, '13131', 6, '16:32:54', NULL, 1, '2023-12-12 10:33:07', '2023-12-12 10:33:07'),
(102, '13131', 6, '15:21:03', '15:23:15', 1, '2023-12-20 09:21:15', '2023-12-20 09:23:18'),
(103, '323232', 2, '15:56:34', '16:00:39', 1, '2023-12-20 09:57:24', '2023-12-20 10:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` smallint DEFAULT '1' COMMENT '0\r\n-hide||1-hold||2-show',
  `blog_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int DEFAULT NULL,
  `social_link_fb` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_link_gg` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `description`, `status`, `blog_img`, `category`, `view_count`, `social_link_fb`, `social_link_gg`, `created_at`, `updated_at`) VALUES
(16, 92, 'Laravel - message: \"Trying to get property \'first_name\' of non-object\", exception: \"ErrorException\"', '<h1 class=\"fs-headline1 ow-break-word mb8 flex--item fl1\"><span style=\"color: #ff0000;\"><strong>Hello&nbsp;</strong></span></h1>\r\n<p class=\"fs-headline1 ow-break-word mb8 flex--item fl1\"><span style=\"color: #000000;\"><strong>Make sure you\'ve already fetched the <code>$categories</code> variable in your controller and passed it to the view. This code will render a select dropdown with Bootstrap styling applied to it. Adjust the classes and styles according to your specific design requirements.</strong></span></p>', 2, 'blog_1708148760.png', '3', NULL, NULL, NULL, '2024-02-16 23:46:00', '2024-03-05 10:14:02'),
(17, 92, 'section and turn off the option for \"Show.\"', '<p>Google Sheets: In Google Sheets,&nbsp;<strong>right-click on the data point in the graph and select \"Format Data Point.\" In the format menu, navigate to the \"Data Labels\" section and turn off the option for \"Show.\"</strong></p>', 2, 'blog_img1709655258.png', '4', NULL, NULL, NULL, '2024-02-17 04:19:20', '2024-03-05 10:14:18'),
(18, 92, '\"Format Data Point.\" In the forma', '<p>Google Sheets: In Google Sheets,&nbsp;<strong>right-click on the data point in the graph and select \"Format Data Point.\" In the format menu, navigate to the \"Data Labels\" section and turn off the option for \"Show.\"</strong></p>', 2, 'blog_img1709655284.png', '4', NULL, NULL, NULL, '2024-02-17 04:56:20', '2024-03-05 10:14:44'),
(19, 94, 'The error \"Property [user_id] does not exist', '<p>The error \"Property [user_id] does not exist on this collection instance\" suggests that you\'re trying to access the <code>user_id</code> property on a collection object, but it doesn\'t exist because you need to access it on each individual <code>Apply</code> object within the collection.</p>\r\n<p>To resolve this, you should ensure that you\'re accessing the <code>user_id</code> property on each <code>Apply</code> object inside the loop, not on the collection itself. Here\'s the corrected code:</p>', 2, 'blog_1709273897.png', '2', NULL, NULL, NULL, '2024-03-01 00:18:17', '2024-03-01 00:18:17'),
(20, 94, 'Full Stack PHP Laravel Web Developer', '<p>Job Description:</p>\r\n<p>As a Full Stack PHP Laravel Web Developer at Kinoyee IT , you will play a key role in the end-to-end development of web applications, from concept to deployment. You will work on both the front-end and back-end, collaborating with cross-functional teams to deliver high-quality solutions. The ideal candidate should possess a deep understanding of PHP, Laravel, and a strong proficiency in both front-end and back-end technologies.</p>\r\n<p>&nbsp;</p>\r\n<p>Responsibilities:</p>\r\n<p>1. Develop, test, and deploy scalable and responsive web applications using PHP Laravel.</p>\r\n<p>2. Design and implement user-friendly interfaces and experiences with HTML, CSS, and JavaScript.</p>\r\n<p>3. Collaborate with UX/UI designers to bring design concepts to life.</p>\r\n<p>4. Create and maintain databases (MySQL, PostgreSQL) and optimize for performance.</p>\r\n<p>5. Implement and integrate RESTful APIs for seamless data exchange.</p>\r\n<p>6. Collaborate with the team to define and implement new features and functionalities.</p>\r\n<p>7. Troubleshoot, debug, and resolve issues across the full stack in a timely manner.</p>\r\n<p>8. Stay updated on emerging technologies and industry trends.</p>\r\n<p>9. Participate in code reviews and maintain code quality and best practices.</p>\r\n<p>10. Contribute to the continuous improvement of development processes and workflows.</p>\r\n<p>&nbsp;</p>\r\n<p>Requirements:</p>\r\n<p>1. Bachelor\'s degree in Computer Science, Engineering, or a related field, or equivalent work experience.</p>\r\n<p>2. Proven experience as a Full Stack PHP Laravel Developer with a strong portfolio of web applications.</p>\r\n<p>3. Proficiency in PHP, Laravel, HTML, CSS, and JavaScript.</p>\r\n<p>4. Experience with front-end frameworks/libraries such as Vue.js or React.</p>\r\n<p>5. Strong knowledge of database systems such as MySQL or PostgreSQL.</p>\r\n<p>6. Familiarity with version control systems, preferably Git.</p>\r\n<p>7. Ability to work independently and collaboratively within a team.</p>\r\n<p>8. Excellent problem-solving and communication skills.</p>\r\n<p>9. Up-to-date with the latest industry trends and technologies.</p>\r\n<p>&nbsp;</p>\r\n<p>Preferred Qualifications:</p>\r\n<p>1. Experience with other PHP frameworks.</p>\r\n<p>2. Knowledge of containerization technologies (Docker).</p>\r\n<p>3. Familiarity with continuous integration and deployment tools.</p>\r\n<p>4. Understanding of server management and cloud services.</p>', 2, 'blog_1709652557.jpg', '5', NULL, NULL, NULL, '2024-03-05 09:29:17', '2024-03-05 10:12:01'),
(21, 94, 'Digital Marketing Executive', '<p><strong>Job Context:</strong></p>\r\n<p>SEOPAGE1 is a digital marketing agency located in Ring Road, Dhaka. We are currently looking for a few Junior WordPress Developers to assist our senior developers. They will work directly under our Lead Developers.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Job Responsibilities:</strong></p>\r\n<ul>\r\n<li>Designing, implementing, and managing websites using WordPress\'s most popular builders, Elementor, Divi, Beaver, Thrive builder, etc.</li>\r\n<li>Managing both front-end and back-end website development</li>\r\n<li>Troubleshoot and resolve website problems for clients and co-workers</li>\r\n<li>PSD to HTML conversion.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Requirements:</strong></p>\r\n<ul>\r\n<li>At least 1 year of proven work experience as a WordPress Developer.</li>\r\n<li>Bachelor\'s degree, preferably in computer science, or a related field.</li>\r\n<li>Good knowledge of front-end technologies CSS, CSS3, Javascript, HTML5, and jQuery</li>\r\n<li>Good knowledge of PHP</li>\r\n<li>Sound Knowledge in WordPress action hook filtering</li>\r\n<li>Good communication skill</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>What we offer:</strong></p>\r\n<ul>\r\n<li>Tk. 15,000 to 25,000 (Monthly)</li>\r\n<li>Friendly and competitive working environment to encourage collaboration and growth opportunities.</li>\r\n<li>Two yearly bonuses by company policy.</li>\r\n<li>Yearly salary review to recognize and reward your contributions.</li>\r\n<li>Fully subsidized breakfast to start your day energized.</li>\r\n<li>Partially subsidized lunch for a fulfilling mid-day break.</li>\r\n</ul>\r\n<p>&nbsp;</p>', 2, 'blog_1709653039.png', '3', NULL, NULL, NULL, '2024-03-05 09:37:19', '2024-03-05 10:12:20'),
(22, 94, 'Graphic Designer', '<p>The ideal candidate will have strong creative skills and a portfolio of work which demonstrates their passion for illustrative design and typography. This candidate will have experiences in working with numerous different design platforms such as digital and print forms. <br /><strong>Responsibilities<br /></strong></p>\r\n<ul>\r\n<li>Collaborate with the team to ensure consistency of designs across various media outlets</li>\r\n<li>Create compelling and effective logos, designs, print and digital media</li>\r\n<li>Maintain awareness of current industry and technology standards, social media, competitive landscape and market trends<br /><br /></li>\r\n</ul>\r\n<p><strong>Qualifications<br /></strong></p>\r\n<ul>\r\n<li>Bachelor\'s degree in Graphic Design or related field</li>\r\n<li>2-4 years of experience in graphic design</li>\r\n<li>Proficient in Adobe Creative Suite</li>\r\n<li>Strong communication, conceptual thinking, typography skills and design skills</li>\r\n<li>Portfolio of work</li>\r\n</ul>', 2, 'blog_1709653103.png', '1', NULL, NULL, NULL, '2024-03-05 09:38:23', '2024-03-05 10:12:32'),
(23, 94, 'Senior MTA Email Engineer', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p>Join QueriesAI and redefine email technology. Use your skills in Postfix and Sendgrid to change business communication. You\'ll make big impacts with focused efforts. Work from anywhere, be part of a dedicated team.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Your Role:</strong></p>\r\n<ul>\r\n<li>Come up with innovative ideas for engaging email readers.</li>\r\n<li>Build and fine-tune email systems using Postfix and Sendgrid for better performance and scalability.</li>\r\n<li>Set up Postfix to meet complex business needs.</li>\r\n<li>Lead powerful email campaigns to reach more subscribers and engage them fully.</li>\r\n<li>Manage DNS records to ensure emails find their way.</li>\r\n<li>Apply strategic tactics to engage email readers, from verifying senders to analyzing user actions.</li>\r\n<li>Integrate Sendgrid and Cloudflare APIs for smoother operations.</li>\r\n<li>Analyze email performance to improve delivery and solve problems.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>We Need:</strong></p>\r\n<ul>\r\n<li>A degree in Computer Science/IT or similar, or equivalent experience.</li>\r\n<li>Deep knowledge of Postfix and a knack for solving tough problems.</li>\r\n<li>Experience with Sendgrid in handling large amounts of emails.</li>\r\n<li>Skills in DNS and email verification.</li>\r\n<li>Strong coding abilities, especially with Sendgrid and Cloudflare APIs.</li>\r\n<li>An analytical mind to monitor and optimize email systems.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Why This Job Is Great:</strong></p>\r\n<p>- Competitive pay and bonuses.</p>\r\n<p>- Full healthcare benefits.</p>\r\n<p>- Work from anywhere.</p>\r\n<p>- Opportunities for professional growth.</p>\r\n<p>- A supportive, diverse work environment.</p>\r\n<p>- Be part of a team that\'s pushing boundaries.</p>', 2, 'blog_1709653221.png', '4', NULL, NULL, NULL, '2024-03-05 09:40:21', '2024-03-05 10:12:44'),
(24, 94, 'Freelance Video Editor', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p>We are currently seeking a skilled and creative Freelance Video Editor to join our team. As a Freelance Video Editor, you will have a significant impact in creating visually captivating and engaging video content that aligns with our client\'s vision and objectives.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Responsibilities:</strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Edit raw video footage into compelling and visually appealing videos that effectively convey the desired message.</li>\r\n<li>Collaborate with the production team to understand project requirements, objectives, and timelines.</li>\r\n<li>Implement creative editing techniques, transitions, and visual effects to enhance video quality.</li>\r\n<li>Ensure consistency and adherence to brand guidelines throughout the editing process.</li>\r\n<li>Stay updated with the latest video editing trends, tools, and techniques to continually improve your skills.</li>\r\n<li>Conduct thorough quality checks to deliver polished and error-free videos.</li>\r\n<li>Brainstorm ideas and provide creative input for video projects in collaboration with the team.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Requirements:</strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Proven work experience as a Video Editor or in a similar freelance role.</li>\r\n<li>Proficiency in video editing software such as Adobe Premiere Pro, Final Cut Pro, or similar tools.</li>\r\n<li>Strong understanding of video editing principles, techniques, and best practices.</li>\r\n<li>Creative mindset with a keen eye for visual storytelling and aesthetics.</li>\r\n<li>Ability to work collaboratively in a fast-paced environment and meet project deadlines.</li>\r\n<li>Strong communication and organizational skills.</li>\r\n</ul>', 2, 'blog_img1709653296.png', '2', NULL, NULL, NULL, '2024-03-05 09:40:58', '2024-03-05 10:07:15'),
(25, 92, 'Email & Web Designer (Remote)', '<p><strong>WHO ARE WE!<br /><br /></strong>Susan G. Komen brings a 100% virtual working environment, and you can work anywhere within the U.S. We are a force united by a promise to end breast cancer forever. For over 40 years, we\'ve led the way by funding groundbreaking research, community health initiatives and advocacy programs in local communities across the U.S. Susan G. Komen is the ONLY organization that addresses breast cancer on multiple fronts such as research, community health, outreach, and public policy initiatives in order to make the biggest impact against this disease.<br /><br />Komen strives to have a culture of passionate, growth-minded professionals who thrive in a team environment, and work collaboratively to inspire greatness in others! We take an ongoing approach to ensure open communication from all levels throughout the organization. It&rsquo;s encouraged to give and receive feedback to ensure two-way accountability with a focus on continual improvement both personally and professionally!<br /><br /><strong> What you\'ll be doing in the role of Email &amp; Web Designer <br /><br /></strong>Our team is seeking a candidate with a strong graphic/visual design ability to create intuitive emails and graphics and bring them together for an optimal user experience. Our ideal candidate can design and update email templates, break designs into responsive code, and implement them on our email platform and content management systems. Utilizing strong project management skills, this role interfaces with various cross-functional teams to build, manage and execute projects in collaboration with internal and external stakeholders. The individual is the point person who creates and implements programs across multiple digital channels in support of the organization&rsquo;s strategic priorities.<br /><br /><strong>What You Will Bring To The Table<br /><br /></strong></p>\r\n<ul>\r\n<li>Design graphics for email, web, and social media.</li>\r\n<li>Design and code outgoing monthly emails leveraging knowledge of HTML/CSS.</li>\r\n<li>Create and/or update email templates.</li>\r\n<li>Troubleshoot HTML/CSS emails.</li>\r\n<li>Prepare and build emails on a weekly basis, while applying email best practices in email development.</li>\r\n<li>Test email compatibility with all web browsers and devices while ensuring links and images are rendering correctly.</li>\r\n<li>Provide general support across the Marketing Team, including designing landing pages, graphics, and publishing website content.</li>\r\n<li>Manage approvals with stakeholders on tight timelines.</li>\r\n<li>Maintain branding across digital channels.</li>\r\n</ul>', 2, 'blog_1709653370.png', '5', NULL, NULL, NULL, '2024-03-05 09:42:50', '2024-03-05 10:15:21'),
(26, 92, 'Sr DevOps Engineer', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p><strong>Project Role: </strong>Sr DevOps Engineer</p>\r\n<p><strong>Work Experience: </strong>6 to 15 Years</p>\r\n<p><strong>Work location: </strong>Dhaka, Bangladesh</p>\r\n<p><strong>Work Mode: </strong>Hybrid</p>\r\n<p><strong>Must Have Skills: </strong>Kubernetes/Docker, AWS/Azure, Gitlab CI/CD</p>\r\n<p><strong>Good to have Skills:</strong> Terraform/ Prometheus/Ansible/EKS/Helm</p>\r\n<p>&nbsp;</p>\r\n<p>The Orchestrated Analytics team is looking for a Dev-Ops Engineer focusing on microservice architecture, cloud computing and scalability within our SaaS and mobile products which deliver highly available and scalable data management, analytics and AIML capabilities to our largest pharmaceutical clients.</p>\r\n<p>&nbsp;</p>\r\n<p><strong> Key Skillset: </strong></p>\r\n<ul>\r\n<li>Docker/Kubernetes</li>\r\n<li>GitLab CI/CD</li>\r\n<li>AWS Cloud</li>\r\n<li>Terraform</li>\r\n<li>Prometheus</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong> Principle Responsibilities:</strong></p>\r\n<ul>\r\n<li>Validate and track Kubernetes, and Amazon Cloud infrastructure.</li>\r\n<li>Design, implement and optimize CI/CD solutions in Gitlab integrating Infrastructure-As-Code, Software Development, and Testing Pipelines</li>\r\n<li>Optimize Kubernetes and Cloud Native Observability solutions based on Prometheus, Grafana, Kibana, Elastic Search, and Jaeger.</li>\r\n<li>Design and manage platform tuning scenarios and recommend platform and its services configurations which are cost-efficient as well as suitable to a particular implementation using Observability tooling (above) and an understanding of Kubernetes performance tuning.</li>\r\n<li>Develop and extend container-based solutions using Docker.</li>\r\n<li>Deploy, understand, and validate content in Kubernetes and AWS using tools like AWS CLI and kubectl</li>\r\n<li>Contribute to solution architectural decisions and influence decision-making at the management level.</li>\r\n<li>Develop and communicate plans and priorities to meet team performance and results requirements.</li>\r\n<li>Collaborate with team members in an Agile method</li>\r\n</ul>', 2, 'blog_1709653412.png', '5', NULL, NULL, NULL, '2024-03-05 09:43:32', '2024-03-05 10:15:07'),
(27, 92, 'Junior Video Editor (Remote) - For Alpha Iota BPO', '<p><strong>Job Description / Responsibility</strong></p>\r\n<p><strong>Join Our Alpha Iota Family, Where Everyone Wins!</strong></p>\r\n<ul>\r\n<li>Exciting Work-from-Home Opportunities</li>\r\n<li>Learning &amp; Development Programs to Upskill Yourself</li>\r\n<li>Lucrative Salary Package</li>\r\n<li>Health and Wellness Perks &amp; Benefits</li>\r\n<li>Motivating and Supportive Teams</li>\r\n</ul>\r\n<p>&hellip;.and lots more!</p>\r\n<p>Alpha Iota is based in Southeast Asia, where we are rapidly growing and are constantly on the lookout for talented individuals like yourself who want to make a difference and kickstart their successful careers. Here&rsquo;s what awaits you at Alpha Iota!</p>\r\n<p><strong>What would you be doing:</strong></p>\r\n<ul>\r\n<li>As a Video Editor, you will be responsible for producing high-quality video content from start to finish, including shooting, editing, and graphics design.</li>\r\n<li>Work closely with marketing and creative teams to create engaging videos that align with our brand and marketing goals.</li>\r\n<li>Create compelling video content for various platforms, including social media, websites, and other digital channels.</li>\r\n<li>Video editing using software such as Adobe Premiere Pro, Adobe After Effects, Adobe Audition, Capcut or similar tools.</li>\r\n<li>Editing, managing, and organizing raw footage and assets.</li>\r\n<li>Ensuring a smooth flow and continuity in the final edited video.</li>\r\n<li>Creating and editing motion graphics, titles, and other visual elements.</li>\r\n<li>Stay updated on industry trends and best practices in video production and</li>\r\n</ul>', 2, 'blog_1709653447.png', '2', NULL, NULL, NULL, '2024-03-05 09:44:07', '2024-03-05 10:15:32'),
(28, 92, 'Graphic Designer - For Proficient Information System', '<p><strong>Proficient Information System</strong> is looking for <strong>Graphic Designer</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Job Description / Responsibility</strong></p>\r\n<p><strong>Create Engaging Social Media Graphics:</strong></p>\r\n<ul>\r\n<li>Develop eye-catching graphics for various social media platforms.</li>\r\n<li>Design content that aligns with brand aesthetics and messaging.</li>\r\n<li>Stay updated on design trends to ensure the content is modern and relevant.</li>\r\n</ul>\r\n<p><strong>Design Product Labels:</strong></p>\r\n<ul>\r\n<li>Collaborate with cross-functional teams to understand product requirements.</li>\r\n<li>Create product labels that convey essential information and enhance product appeal.</li>\r\n<li>Ensure designs comply with industry regulations and standards.</li>\r\n</ul>\r\n<p><strong>Craft Compelling Brochures:</strong></p>\r\n<ul>\r\n<li>Conceptualize and design brochures that effectively communicate brand values and product features.</li>\r\n<li>Work closely with marketing teams to ensure alignment with promotional strategies.</li>\r\n<li>Maintain consistency in design elements across different collateral.</li>\r\n</ul>\r\n<p><strong>Develop Striking Banners:</strong></p>\r\n<ul>\r\n<li>Design visually appealing banners for various purposes, including online and offline events.</li>\r\n<li>Collaborate with marketing teams to understand campaign goals and objectives.</li>\r\n<li>Optimize designs for different platforms and formats.</li>\r\n</ul>\r\n<p><strong>Bonus: Animation Skills:</strong></p>\r\n<ul>\r\n<li>Animate graphics and designs to create engaging and dynamic content.</li>\r\n<li>Collaborate with marketing and content teams to incorporate animations into promotional materials.</li>\r\n<li>Stay updated on animation trends and techniques</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Educational Requirements</strong></p>\r\n<ul>\r\n<li>Bachelor of Science (BSc)</li>\r\n<li>Skills Required: Graphic Design (Computer Aided), Graphics Design, Graphic Designing, Graphic Design</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Experience Requirements</strong></p>\r\n<ul>\r\n<li>1 to 3 year(s)</li>\r\n</ul>\r\n<p>&nbsp;</p>', 2, 'blog_1709653487.png', '1', NULL, NULL, NULL, '2024-03-05 09:44:47', '2024-03-05 10:15:45'),
(29, 92, 'Graphics Designer - For Hotel Sarina', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p><strong>Hotel Sarina is looking for </strong>Graphics Designer</p>\r\n<p><strong>Job Description / Responsibility</strong></p>\r\n<ul>\r\n<li>Developing and Delivering Marketing Programs and Initiatives.&middot;</li>\r\n<li>Develops creative design, original graphics, and production layout and provides marketing support.&middot;</li>\r\n<li>Provides design solutions from concept to completion with substantial creativity, innovation, and technical expertise in areas of communication, technology, and business.&middot;</li>\r\n<li>Liaising with external printers or production teams to ensure deadlines are met and material is printed or presented to the highest quality.&middot;</li>\r\n<li>Under the direction of the Hotel Marketing Manager, manages the look and feel, concept, visual development and final execution of all design directions.&middot;</li>\r\n<li>Consults and works with marketing staff to ascertain needs and develop graphic directions, concepts and specifications for assigned projects; coordinating with such to help distribute and integrate as needed the resulting information and graphics.&middot;</li>\r\n<li>Provides technical advice and guidance to production personnel, property marketing and corporate marketing staff on design and technical graphics issues.&middot;</li>\r\n<li>Monitors the development and maintenance of brand and hotel graphic standards, assisting with integration of new standards and elements.&middot;</li>\r\n<li>Provides technical advice and guidance to production personnel, property marketing and corporate marketing staff on design and technical graphics issues.&middot;</li>\r\n<li>Providing art direction, photo research and maintaining proper copyright verification as needed.&middot;</li>\r\n<li>Must be capable of being able to convert designs to formats needed for digital advertising, social media channel uploads and printing per vendor specifications.&middot;</li>\r\n<li>Carry out any reasonable requests made by Management, and seek to comply with company`s policies and procedures.</li>\r\n</ul>\r\n<p><strong>Experience Requirements</strong></p>\r\n<ul>\r\n<li>3 to 7 year(s)</li>\r\n<li>The applicants should have experience in the following business area(s): Hotel</li>\r\n</ul>\r\n<p><strong>Additional Requirements</strong></p>\r\n<ul>\r\n<li>Advanced knowledge and proven experience with Adobe products such as InDesign, Photoshop, and Illustrator.&middot;</li>\r\n<li>Exceptional creativity and innovation.&middot;</li>\r\n<li>Excellent time management and organizational skills.&middot;</li>\r\n<li>Accuracy and attention to detail.&middot;</li>\r\n<li>An understanding of the latest trends and their role within a commercial environment.&middot;</li>\r\n</ul>', 2, 'blog_1709653526.png', '2', NULL, NULL, NULL, '2024-03-05 09:45:26', '2024-03-05 10:15:56'),
(30, 92, 'Senior Graphics & Print Designer (Fashion)', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p>The backend of Apparel and Fashion is close to 2 trillion dollars industry. For the last century, fashion has evolved from couture design and tailored production to mainstream retail, bulk design, and overseas production. But in most cases, it was highly segregated, inefficient, and non-sustainable. NITEX is reimagining the way fashion brands design and buy sustainable apparel products.</p>\r\n<p>&nbsp;</p>\r\n<p>We\'re establishing the largest and most influential Design and Innovation Labs on Earth. With DesignLabs set to open in major fashion capitals worldwide, we\'re revolutionizing the buying experience for fashion brands. Our goal is to provide a globally connected, sustainable supply chain, with DesignLabs conveniently located near fashion offices.</p>\r\n<p>&nbsp;</p>\r\n<p>Currently, our DesignLabs are operational in London, Barcelona, Istanbul, and Dhaka, with plans to expand to New York, Milan, Berlin, Paris, Tokyo, and beyond by the end of 2024. Join us on this thrilling journey of ecosystem transformation.</p>\r\n<p>&nbsp;</p>\r\n<p>We\'re seeking a Senior Graphics &amp; Print Designer to join our dynamic team. You\'ll collaborate with creative minds, focusing on innovative graphics and prints with a rapid turnaround. This hands-on role demands strong technical skills and a keen eye for emerging trends. If you\'re passionate about fashion design, and trend research, and thrive in a fast-paced environment, this opportunity is for you. Proficiency in Adobe Photoshop, Illustrator, Procreate, and CAD is essential.</p>\r\n<p>&nbsp;</p>\r\n<p>We believe that if you have the passion and the right potential, you will surely illuminate even if you don\'t have any typical Educational Certificates. Our requirements include the following (but not limiting others):</p>\r\n<ul>\r\n<li>Graduate in Fine Arts or related fields is given priority</li>\r\n<li>Expertise in Adobe Photoshop, Illustrator, Procreate &amp; and CAD is a must</li>\r\n<li>Excellent communication in English</li>\r\n<li>8 to 10 years of experience in the area of Graphics and Print</li>\r\n</ul>', 2, 'blog_1709653564.png', '1', NULL, NULL, NULL, '2024-03-05 09:46:04', '2024-03-05 10:16:06'),
(31, 92, 'AsstMgr-Marketing', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p><strong>ジョブ番号</strong> 24021187<br /><br /><strong>求人カテゴリ</strong> Sales &amp; Marketing<br /><br /><strong>場所</strong> Le M&eacute;ridien Dhaka, 79 A Commercial Area Airport Rd, Dhaka, Bangladesh, Bangladesh 地図で表示<br /><br /><strong>スケジュール</strong> Full-Time<br /><br /><strong>遠隔地ですか?</strong> N<br /><br /><strong>配置転換ですか?</strong> N<br /><br /><strong>職位の種類</strong> Management<br /><br /><em>マリオット・インターナショナルでは雇用機会均等の実現に向けて、多種多様な人材の雇用、従業員を第一に考え受け入れる企業文化の維持に取り組んでいます。当社は、身体障害者や退役軍人など、保護された根拠に基づく差別、あるいは準拠法の適用を受けるあらゆる根拠に基づく差別の撤廃に取り組んでいます。</em></p>', 2, 'blog_1709653601.png', '4', NULL, NULL, NULL, '2024-03-05 09:46:41', '2024-03-05 10:16:19'),
(32, 92, 'Digital Advertising Sales Manager', '<h2 class=\"text-heading-large\r\n                mb4\">About the job</h2>\r\n<p>Responsibilities</p>\r\n<p>1.Reach out to top global mobile partners and initiate business proposals to achieve partners&rsquo; growth and successes in emerging markets</p>\r\n<p>2.Expand and grow existing partners by identifying new areas of collaboration and troubleshoot partners&rsquo; issues efficiently and effectively</p>\r\n<p>3.Work cross-functionally with internal product, engineering and operation teams to develop and execute business strategy</p>\r\n<p>4.Tell a compelling and excited story to the global partners via data-driven insights and local market knowhow</p>\r\n<p>&nbsp;</p>\r\n<p>Requirements</p>\r\n<p>1.Bachelor degree at least</p>\r\n<p>2.3+ years of experience in mobile OEM, global key account management or related field with proven track record</p>\r\n<p>3.Strong communication skills, both written and verbal, with the ability to effectively communicate with internal and external stakeholders</p>\r\n<p>4.Excellent organizational and time management skills, with the ability to prioritize tasks effectively</p>\r\n<p>5.A self-starter who is able to work independently and as part of a team.</p>\r\n<p>&nbsp;</p>', 2, 'blog_1709653635.png', '3', NULL, NULL, NULL, '2024-03-05 09:47:15', '2024-03-05 10:16:31'),
(33, 94, 'circular/createcircular/createcircular/createcircular/createcircular/create', '<p>circular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/createcircular/create</p>', 2, 'blog_1709655104.png', '4', NULL, NULL, NULL, '2024-03-05 10:11:44', '2024-03-05 10:13:09'),
(34, 92, 'Graphic designer', '<p>YouTube Shorts, the platform\'s answer to TikTok, presents exciting monetization opportunities for creators. While still evolving, it offers creative avenues to grow your audience and turn your short-form magic into tangible rewards. Here\'s how you can turn those 60-second masterpieces into profit:</p>\r\n<p>Join the YouTube Partner Program (YPP):</p>\r\n<p>This is your gateway to accessing various monetization features on YouTube, including Shorts. To qualify, you need either:</p>\r\n<p>1,000 subscribers and 4,000 watch hours over the past year, OR<br />1,000 subscribers with 10 million valid public Shorts views within the past 90 days.<br />Shorts Ad Revenue Sharing:</p>\r\n<p>Once you\'re in the YPP, participate in Shorts ad revenue sharing. Ads displayed between Shorts feed videos generate a pool of revenue, shared among eligible creators based on watch time their Shorts content receives. Remember, YouTube takes a significant share, so diversify your income streams for optimum growth.</p>\r\n<p>Brand Partnerships:</p>\r\n<p>Reach out to brands relevant to your niche and propose collaborations. Create sponsored Shorts showcasing their products, hosting fun challenges, or weaving their message into your storytelling.</p>\r\n<p>Affiliate Marketing:</p>\r\n<p>Promote products you genuinely like through affiliate links in your Shorts descriptions or video overlays. Earn commissions for every purchase made through your link, directly from the retailers.</p>\r\n<p>Merchandise:</p>\r\n<p>Design and sell branded merchandise like T-shirts, phone cases, or even custom accessories inspired by your Short\'s content.</p>\r\n<p>Live Streaming Super Chats &amp; Stickers:</p>\r\n<p>Engage with your audience through live streams, where viewers can send you virtual gifts and messages in the form of Super Chats and Stickers. Be interactive, fun, and offer exclusive content during live sessions.</p>\r\n<p>Crowdfunding:</p>', 2, 'blog_1709799598.png', NULL, NULL, NULL, NULL, '2024-03-07 02:19:58', '2024-03-07 02:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `name`, `description`, `img`, `company_id`, `created_at`, `updated_at`) VALUES
(8, 'Driver', '<p>control mechanisms which a notice is sent to the registered</p>', 'img1709652179.jpg', 3, '2022-12-27 04:04:44', '2024-03-05 09:22:59'),
(9, 'User Account', '<p>control mechanisms which a notice is sent to the registered</p>', 'img1709652191.jpg', 3, '2022-12-27 04:06:44', '2024-03-05 09:23:11'),
(10, 'Packages', '<p>control mechanisms which a notice is sent to the registered</p>', 'img1709652327.jpg', 2, '2022-12-27 04:07:41', '2024-03-05 09:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `category_circulars`
--

CREATE TABLE `category_circulars` (
  `id` int NOT NULL,
  `name` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_circulars`
--

INSERT INTO `category_circulars` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Web Developer', '2024-02-17 05:11:53', '2024-02-17 05:11:53'),
(2, 'Graphic Designer', '2024-02-17 05:11:53', '2024-02-17 05:11:53'),
(3, 'Video Editor', '2024-02-17 05:11:53', '2024-02-17 05:11:53'),
(4, 'Digital Marketor', '2024-02-17 05:11:53', '2024-02-17 05:11:53'),
(5, 'Others', '2024-02-17 05:11:53', '2024-02-17 05:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `name`, `type`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Trip Income', 'income', 1, '2022-11-01 05:06:17', '2022-11-01 05:06:17'),
(2, 'Purchase', 'expense', 1, '2022-12-08 06:05:07', '2022-12-08 06:05:07'),
(3, 'Trip_Income', 'income', 2, '2023-01-02 07:11:10', '2023-01-02 07:11:10'),
(4, 'Driver Expense', 'expense', 1, '2023-01-11 05:20:43', '2023-01-11 05:20:43'),
(5, 'Bakshish', 'expense', 1, '2023-01-24 10:44:27', '2023-01-24 10:44:27'),
(6, 'Fuel', 'expense', 1, '2023-02-02 06:03:03', '2023-02-02 06:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `chat_groups`
--

CREATE TABLE `chat_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_group_users`
--

CREATE TABLE `chat_group_users` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `from` bigint NOT NULL,
  `to` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `circulars`
--

CREATE TABLE `circulars` (
  `id` int NOT NULL,
  `title` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `img` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `circulars`
--

INSERT INTO `circulars` (`id`, `title`, `description`, `img`, `created_at`, `updated_at`) VALUES
(3, 'Where does it come from?', 'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).   Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.  The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham', 'img1707281221.jpg', '2024-02-06 22:47:01', '2024-02-06 22:47:01'),
(4, 'Hello', 'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,', 'img1709480039.png', '2024-03-03 09:33:59', '2024-03-03 09:33:59'),
(5, 'How To Make Money on YouTube', '<p>Making money on YouTube can be an exciting and rewarding journey, but it requires more than just uploading videos and hoping for the best. Here\'s a breakdown of the key steps to turn your YouTube passion into profit:</p>\r\n<p>1. Build a Strong Foundation:</p>\r\n<p>Find your niche: What are you passionate about? What can you offer that viewers can\'t find elsewhere? Choose a niche you\'re knowledgeable and excited about, as it will fuel your content creation and attract a dedicated audience.<br />Create high-quality content: Focus on delivering value to your viewers. Inform, entertain, or educate them with consistently high-quality video and audio. Invest in good equipment and editing software if necessary.<br />Grow your audience: Optimize your titles, descriptions, and thumbnails for search. Promote your videos on social media, collaborate with other creators, and engage with your viewers in the comments section.<br />2. Explore Monetization Options:</p>\r\n<p>Join the YouTube Partner Program (YPP): This is the gateway to various monetization features like ads, channel memberships, and merchandise. To qualify, you need 1,000 subscribers and 4,000 watch hours in the past year, or 1,000 subscribers with 10 million valid public Shorts views within the past 90 days.<br />Ads: Earn revenue from pre-roll, mid-roll, and display ads that run on your videos. While it\'s a passive income source, YouTube takes a significant share of ad revenue.<br />Channel memberships: Offer exclusive content, early access, live chats, and personalized shoutouts to viewers who subscribe to your channel. This fosters a closer relationship with your fans and generates recurring income.<br />Brand deals: Partner with companies relevant to your niche for sponsored videos, product placements, or brand-themed challenges. This can be a lucrative revenue stream, but ensure the brand aligns with your values and your audience\'s interests.<br />Affiliate marketing: Promote other companies\' products through your videos and earn commissions for sales made through your affiliate links. Choose products you genuinely believe in and disclose your affiliate partnerships transparently.<br />Merchandise: Design and sell branded T-shirts, mugs, phone cases, or even custom products related to your niche. This can be a fun way to engage your fans and generate additional income.<br />Live streaming Super Chats &amp; Stickers: During live streams, viewers can send you virtual gifts and messages, which can be a fun and interactive way to earn money.<br />Crowdfunding: Platforms like Kickstarter and Patreon allow fans to directly invest in your creative endeavors. Offer exclusive rewards for their support, such as early access to content or behind-the-scenes insights.<br />3. Diversify and Adapt:</p>\r\n<p>Don\'t rely solely on one monetization method. Experiment with different options to find what works best for you and your audience. Be prepared to adapt your strategies as trends and YouTube policies change.</p>\r\n<p>4. Focus on Value and Community:</p>\r\n<p>Remember, at the heart of it all, YouTube is about connecting with your viewers. Create content that they find valuable and engaging, and build a positive and supportive community. When you focus on providing value and nurturing your audience, the financial rewards will naturally follow.</p>\r\n<p>Additional Tips:</p>\r\n<p>Track your analytics: Use YouTube Analytics to understand your audience demographics, watch time, engagement rates, and click-through rates. This data helps you refine your content and monetization strategies.<br />Invest in yourself: Continuously learn and improve your skills. Take online courses, attend workshops, and collaborate with experienced creators.<br />Stay updated: Keep an eye on the latest trends and monetization opportunities on YouTube. Be willing to learn and adapt your approach to stay ahead of the curve.<br />Making money on YouTube takes time, dedication, and hard work. However, by following these steps and focusing on creating high-quality content and building a strong community, you can turn your YouTube passion into a profitable career.</p>\r\n<p>&nbsp;</p>', 'img1709798572.png', '2024-03-07 02:02:52', '2024-03-07 02:02:52'),
(6, 'how to make money on youtube without making videos', '<p>While creating captivating videos is the traditional path to YouTube success, there are several creative ways to tap into the platform\'s potential for income without actually being on camera. Here are some methods to consider:</p>\r\n<p>1. Leverage Existing Content:</p>\r\n<p>Re-purpose and share other creators\' content: With proper permissions, you can curate and present compilations, reactions, or educational breakdowns of existing videos. Add your own unique commentary or perspective to stand out.<br />Create text-based content: Use captivating visuals and audio narration to create explainer videos, educational tutorials, or even animated stories without appearing on camera yourself.<br />2. Become a YouTube Mastermind:</p>\r\n<p>Channel management and optimization: Offer expertise in optimizing titles, descriptions, thumbnails, and SEO for channels looking to grow.<br />Scriptwriting and editing: Craft engaging scripts and provide editing services for creators who need help polishing their videos.<br />Social media and marketing: Assist channels with building their social media presence and developing audience engagement strategies.<br />3. Monetize Audio Content:</p>\r\n<p>Guided meditations and ASMR: If you have a soothing voice, create guided meditations, relaxation videos, or ASMR recordings for viewers seeking calming content.<br />Podcasts and audio storytelling: Launch a podcast on YouTube focused on your niche or narrate compelling fictional stories to engage listeners.<br />Music production and sound effects: Provide royalty-free music and sound effects for creators to use in their videos.<br />4. Content Curation and Aggregation:</p>\r\n<p>News and commentary channels: Stay updated on trending topics and curate video clips from various sources, adding your own commentary and analysis.<br />Educational playlists and compilations: Compile videos on specific educational topics or skills, creating valuable resources for viewers looking to learn.<br />Funny or heartwarming compilations: Put together humorous or heartwarming video clips from around YouTube, bringing smiles and laughter to viewers.<br />5. Partner with Other Creators:</p>\r\n<p>Affiliate marketing: Partner with brands and promote their products through text descriptions, calls to action, or product reviews within your non-video content.<br />Collaborations and cross-promotion: Team up with other creators in your niche for interviews, discussions, or joint projects to expand your reach and audience.<br />Virtual assistant or community manager: Assist busy creators with managing their comments, scheduling videos, and interacting with their communities.<br />Remember:</p>\r\n<p>High-quality content is key: Regardless of the format, focus on creating engaging and informative content that adds value to viewers\' experience.<br />Consistency is crucial: Regularly upload new content, maintain a schedule, and actively engage with your audience to build a loyal following.<br />Adapt and experiment: Stay updated on YouTube trends and explore new methods to keep your content fresh and appealing.<br />Earning money on YouTube without creating videos requires creativity, resourcefulness, and dedication. However, by leveraging your skills and focusing on building a valuable audience, you can unlock exciting opportunities to turn the platform into a source of income.</p>', 'img1709798615.png', '2024-03-07 02:03:35', '2024-03-07 02:03:35'),
(7, 'how to make money on youtube as a kid', '<p>Making money on YouTube as a kid can be a tricky and complex topic, with specific guidelines and limitations. It\'s crucial to prioritize transparency and ethical practices while ensuring it remains a safe and enriching experience. Here are some responsible ways kids can consider exploring YouTube income:</p>\r\n<p>Content Ideas:</p>\r\n<p>Educational and Creative Content: Share your talents and passions! Teach viewers how to draw, cook, play an instrument, or create crafts. Share unique skills like solving Rubik\'s cubes or performing magic tricks.<br />Reviews and Recommendations: Review toys, books, video games, or activities suitable for your age group. Offer honest and insightful opinions while maintaining a safe and family-friendly environment.<br />Gaming and Entertainment: If you enjoy playing video games, you can create gameplay walkthroughs, reviews, or funny commentary videos. Remember to stay age-appropriate and avoid mature content.<br />Challenges and DIY Projects: Take on fun and creative challenges or show viewers how to make slime, build Lego creations, or complete science experiments.<br />Monetization Options:</p>\r\n<p>Collaborations with Parents: Many successful kids\' channels operate with parental guidance and assistance. Parents can handle aspects like managing AdSense accounts, ensuring age-appropriate content, and navigating advertising regulations.<br />Brand Sponsorships: Partner with family-friendly brands for product placements or sponsored segments in your videos. Ensure transparency and disclose collaborations clearly.<br />Merchandise Sales: Design and sell kid-friendly T-shirts, mugs, or other merchandise with your channel\'s branding. Parental involvement in production and sales is essential.<br />Important Considerations:</p>\r\n<p>YouTube\'s Child Content Policy: Understand and comply with YouTube\'s strict guidelines for child-directed content. Avoid potentially harmful topics, misleading information, or promoting unhealthy practices.<br />Parental Supervision and Support: Parents play a crucial role in ensuring a safe and positive YouTube experience for their children. Monitor content creation, manage comments, and discuss online safety and privacy measures.<br />Focus on Fun and Education: Prioritize enjoying the creative process and sharing your passions with others. Monetization should come secondary to educational or entertainment value.<br />Age Restrictions: YouTube allows monetization only for accounts belonging to individuals 18 years or older. Alternative methods like collaborations with parents or age-appropriate sponsorships are necessary for younger creators.<br />Final Note:</p>\r\n<p>Making money on YouTube as a kid should be a fun and enriching experience, but it\'s important to approach it responsibly and prioritize safety and ethical practices. Always involve parents in the process, comply with YouTube\'s guidelines, and focus on creating engaging content that entertains and inspires others.</p>\r\n<p>&nbsp;</p>', 'img1709798644.png', '2024-03-07 02:04:04', '2024-03-07 02:04:04'),
(8, 'how to make money on youtube shorts', '<p>YouTube Shorts, the platform\'s answer to TikTok, presents exciting monetization opportunities for creators. While still evolving, it offers creative avenues to grow your audience and turn your short-form magic into tangible rewards. Here\'s how you can turn those 60-second masterpieces into profit:</p>\r\n<p>Join the YouTube Partner Program (YPP):</p>\r\n<p>This is your gateway to accessing various monetization features on YouTube, including Shorts. To qualify, you need either:</p>\r\n<p>1,000 subscribers and 4,000 watch hours over the past year, OR<br />1,000 subscribers with 10 million valid public Shorts views within the past 90 days.<br />Shorts Ad Revenue Sharing:</p>\r\n<p>Once you\'re in the YPP, participate in Shorts ad revenue sharing. Ads displayed between Shorts feed videos generate a pool of revenue, shared among eligible creators based on watch time their Shorts content receives. Remember, YouTube takes a significant share, so diversify your income streams for optimum growth.</p>\r\n<p>Brand Partnerships:</p>\r\n<p>Reach out to brands relevant to your niche and propose collaborations. Create sponsored Shorts showcasing their products, hosting fun challenges, or weaving their message into your storytelling.</p>\r\n<p>Affiliate Marketing:</p>\r\n<p>Promote products you genuinely like through affiliate links in your Shorts descriptions or video overlays. Earn commissions for every purchase made through your link, directly from the retailers.</p>\r\n<p>Merchandise:</p>\r\n<p>Design and sell branded merchandise like T-shirts, phone cases, or even custom accessories inspired by your Short\'s content.</p>\r\n<p>Live Streaming Super Chats &amp; Stickers:</p>\r\n<p>Engage with your audience through live streams, where viewers can send you virtual gifts and messages in the form of Super Chats and Stickers. Be interactive, fun, and offer exclusive content during live sessions.</p>\r\n<p>Crowdfunding:</p>\r\n<p>Platforms like Kickstarter and Patreon allow fans to directly support your creative endeavors. Offer early access to Shorts content, behind-the-scenes insights, or exclusive merch for dedicated backers.</p>\r\n<p>Bonus Tips:</p>\r\n<p>Experiment and analyze: Try different video styles, trending topics, and engagement strategies. Track your analytics to see what resonates with your audience and adapt accordingly.<br />Community matters: Respond to comments, engage in discussions, and participate in conversations. Building a loyal community fosters support and drives viewership.<br />Collaborations: Team up with other Shorts creators for cross-promotion and audience expansion. Leverage each other\'s strengths and create engaging collaborative content.<br />Stay updated: Keep an eye on new monetization features, trending challenges, and platform updates. Adapt your content and strategies to stay ahead of the curve.<br />Remember, success on YouTube Shorts takes time, dedication, and consistent creativity. Focus on entertaining your audience, building a strong community, and exploring a variety of monetization options. With passion, patience, and these strategies, you can turn your Shorts into a gold mine of opportunities on YouTube!</p>\r\n<p>&nbsp;</p>', 'img1709798671.png', '2024-03-07 02:04:31', '2024-03-07 02:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `cm_email_subscribers`
--

CREATE TABLE `cm_email_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cm_faqs`
--

CREATE TABLE `cm_faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cm_faqs`
--

INSERT INTO `cm_faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'a:2:{s:6:\"Bangla\";s:19:\"How Can I register?\";s:7:\"English\";s:19:\"How Can I register?\";}', 'a:2:{s:6:\"Bangla\";s:52:\"<p>Click to Sign Up button and fill up the form.</p>\";s:7:\"English\";s:52:\"<p>Click to Sign Up button and fill up the form.</p>\";}', '2023-11-12 10:23:17', '2023-11-12 10:23:17'),
(3, 'a:2:{s:6:\"Bangla\";s:30:\"How Do I Apply For Membership?\";s:7:\"English\";s:30:\"How Do I Apply For Membership?\";}', 'a:2:{s:6:\"Bangla\";s:258:\"<p>Online Application is easy! Simply navigate to the \' https://bhetiaa.com\' section on the website and follow the guided steps to apply for bhetiaaMembership. Don\'t forget to provide accurate and updated information to stay connected with our community.</p>\";s:7:\"English\";s:258:\"<p>Online Application is easy! Simply navigate to the \' https://bhetiaa.com\' section on the website and follow the guided steps to apply for bhetiaaMembership. Don\'t forget to provide accurate and updated information to stay connected with our community.</p>\";}', '2024-01-20 11:05:18', '2024-01-23 14:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `cm_features`
--

CREATE TABLE `cm_features` (
  `id` bigint UNSIGNED NOT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cm_features`
--

INSERT INTO `cm_features` (`id`, `icon`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, '<i class=\'lni lni-package\'></i>', 'Easy Accounting', 'Manage Account without any accounting knowledge', NULL, NULL),
(2, '<i class=\'lni lni-files\'></i>', 'Invoice', 'Create professional Invoice and accept online payments', NULL, NULL),
(3, '<i class=\'lni lni-user\'></i>', 'CRM', 'Contacts with Contact Group and Rich Customer Portal', NULL, NULL),
(4, '<i class=\'lni lni-phone-set\'></i>', 'Leads', 'Manage leads from different lead sources with kanban view', NULL, NULL),
(5, '<i class=\'lni lni-briefcase\'></i>', 'Projects', 'Manage different types of projects with milestone', NULL, NULL),
(6, '<i class=\'lni lni-alarm\'></i>', 'Tasks', 'Manage tasks with kanban view and assign task to staff', NULL, NULL),
(7, '<i class=\'lni lni-empty-file\'></i>', 'Quotation', 'Create Professional Quotation for getting customer attention', NULL, NULL),
(8, '<i class=\'lni lni-facebook-messenger\'></i>', 'Live Chat', 'Real time Chat with staffs, customers and private groups', NULL, NULL),
(9, '<i class=\'lni lni-credit-cards\'></i>', 'Online Payments', 'Accept Online Payments from Clients', NULL, NULL),
(11, 'a:2:{s:6:\"Bangla\";s:6:\"hammer\";s:7:\"English\";s:6:\"hammer\";}', 'a:2:{s:6:\"Bangla\";s:4:\"Test\";s:7:\"English\";s:4:\"Test\";}', 'a:2:{s:6:\"Bangla\";N;s:7:\"English\";N;}', '2023-11-22 05:33:07', '2023-11-22 05:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `business_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int UNSIGNED NOT NULL,
  `package_id` int DEFAULT NULL,
  `package_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` date NOT NULL,
  `last_email` date DEFAULT NULL,
  `staff_limit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacts_limit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drivers_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicles_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `invoice_limit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_limit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurring_transaction` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_chat` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_manager` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventory_module` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_module` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrm_module` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_module` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_management_module` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_payment` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_panel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `business_name`, `status`, `package_id`, `package_type`, `membership_type`, `valid_to`, `last_email`, `staff_limit`, `contacts_limit`, `drivers_limit`, `vehicles_limit`, `invoice_limit`, `quotation_limit`, `recurring_transaction`, `live_chat`, `file_manager`, `inventory_module`, `pos_module`, `hrm_module`, `payroll_module`, `project_management_module`, `online_payment`, `sms_panel`, `created_at`, `updated_at`) VALUES
(1, 'jobpulse', 1, 2, 'monthly', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', '3', '0', '300', '300', 'Yes', 'Yes', 'Yes', 'Yes', NULL, NULL, NULL, 'Yes', 'Yes', 'No', '2022-11-01 04:19:42', '2024-02-05 04:48:37'),
(38, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 04:58:26', '2024-02-05 04:58:26'),
(31, 'Kafco School & College', 1, 2, 'yearly', 'member', '2090-01-04', NULL, NULL, 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-11-13 07:12:53', '2023-12-03 23:01:32'),
(28, 'Mizbah School & College', 1, 1, 'monthly', 'trial', '2090-01-04', NULL, NULL, '500', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-11-07 09:12:53', '2024-02-05 04:39:11'),
(29, 'Test School & College', 1, 1, 'monthly', 'member', '2090-01-04', NULL, NULL, '499', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', '2023-11-09 09:41:17', '2024-02-05 04:39:03'),
(30, 'Kafco School & College', 1, 1, 'yearly', 'trial', '2090-01-04', NULL, NULL, '1000', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '2023-11-13 07:06:13', '2023-11-13 07:06:13'),
(34, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-01-17 00:54:58', '2024-01-17 00:54:58'),
(36, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-01-17 10:26:02', '2024-01-17 10:26:02'),
(37, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-01-18 09:39:07', '2024-02-05 04:24:14'),
(39, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:02:27', '2024-02-05 05:02:27'),
(40, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:05:05', '2024-02-05 05:05:05'),
(41, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:08:14', '2024-02-05 05:08:14'),
(42, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:09:47', '2024-02-05 05:09:47'),
(43, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:13:02', '2024-02-05 05:13:02'),
(44, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:14:46', '2024-02-05 05:14:46'),
(45, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:17:41', '2024-02-05 05:17:41'),
(46, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:18:51', '2024-02-05 05:18:51'),
(47, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:30:25', '2024-02-05 05:30:25'),
(48, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:32:35', '2024-02-05 05:32:35'),
(49, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:33:37', '2024-02-05 05:33:37'),
(50, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:35:32', '2024-02-05 05:35:32'),
(51, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 05:53:25', '2024-02-05 05:53:25'),
(52, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 06:00:35', '2024-02-05 06:00:35'),
(53, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 06:04:10', '2024-02-05 06:04:10'),
(54, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 06:05:39', '2024-02-05 06:05:39'),
(55, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 11:34:13', '2024-02-05 11:34:13'),
(72, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-06 03:36:31', '2024-02-06 03:36:31'),
(61, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-05 22:28:06', '2024-02-05 22:28:06'),
(71, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-06 03:28:55', '2024-02-06 03:28:55'),
(64, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-06 03:02:53', '2024-02-06 03:02:53'),
(65, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-06 03:05:33', '2024-02-06 03:05:33'),
(79, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-16 10:56:19', '2024-02-16 11:12:56'),
(81, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-02-20 07:39:30', '2024-02-29 02:20:35'),
(82, 'Club Member', 1, 1, 'Basic', 'member', '2090-01-04', NULL, 'Unlimited', 'Unlimited', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2024-03-07 02:23:45', '2024-03-07 02:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `company_email_template`
--

CREATE TABLE `company_email_template` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_email_template`
--

INSERT INTO `company_email_template` (`id`, `name`, `subject`, `body`, `related_to`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Transport', 'Test', '<p><strong>Hello,&nbsp;</strong></p>\r\n<p><strong>This is test SMS<br /><br />Regards.</strong></p>', 'invoice', 1, '2022-12-22 06:14:21', '2022-12-22 06:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `name`, `value`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'invoice_starting', '1082', 1, '2022-11-01 05:04:23', '2023-01-24 09:38:00'),
(2, 'default_account', '1', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(3, 'default_chart_id', '1', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(4, 'paypal_active', 'no', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(5, 'paypal_currency', 'USD', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(6, 'paypal_email', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(7, 'stripe_active', 'no', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(8, 'stripe_currency', 'USD', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(9, 'stripe_secret_key', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(10, 'stripe_publishable_key', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(11, 'razorpay_active', 'no', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(12, 'razorpay_currency', 'INR', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(13, 'razorpay_key_id', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(14, 'razorpay_secret_key', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(15, 'paystack_active', 'no', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(16, 'paystack_public_key', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(17, 'paystack_secret_key', '', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(18, 'paystack_currency', 'GHS', 1, '2022-11-01 05:11:34', '2023-01-07 06:25:03'),
(19, 'base_currency', 'BDT', 1, '2022-11-01 05:11:58', '2022-11-01 05:11:58'),
(20, 'currency_position', 'right', 1, '2022-11-01 05:11:58', '2022-11-01 05:11:58'),
(21, 'backend_direction', 'ltr', 1, '2022-11-01 05:11:58', '2023-03-01 04:17:45'),
(22, 'timezone', 'Asia/Dhaka', 1, '2022-11-01 05:11:58', '2023-12-20 03:21:39'),
(23, 'date_format', 'd-m-Y', 1, '2022-11-01 05:11:58', '2023-12-20 03:21:39'),
(24, 'time_format', '12', 1, '2022-11-01 05:11:58', '2023-12-20 03:21:39'),
(25, 'quotation_starting', '1', 1, '2022-12-14 08:29:01', '2023-01-24 09:38:00'),
(26, 'company_name', 'ABC Public School & College', 1, '2022-12-18 05:43:19', '2023-11-07 06:06:39'),
(27, 'phone', '01615352866', 1, '2022-12-18 05:43:19', '2023-11-07 06:06:39'),
(28, 'vat_id', '', 1, '2022-12-18 05:43:19', '2023-02-22 10:25:29'),
(29, 'reg_no', '', 1, '2022-12-18 05:43:19', '2023-11-07 06:06:39'),
(30, 'email', 'abcmail@mail.com', 1, '2022-12-18 05:43:19', '2023-11-07 06:06:39'),
(31, 'address', 'House 3, Road No-9/B, Uttara 5 no. Sector Dhaka', 1, '2022-12-18 05:43:19', '2023-11-07 06:06:39'),
(32, 'invoice_prefix', 'ATA', 1, '2022-12-21 11:42:48', '2023-01-24 09:38:00'),
(33, 'quotation_prefix', 'QATA', 1, '2022-12-21 11:42:48', '2023-01-24 09:38:00'),
(34, 'invoice_footer', '<p>Powered by&nbsp;Akand Transport Agency</p>', 1, '2022-12-21 11:42:48', '2023-01-24 09:38:00'),
(35, 'quotation_footer', '', 1, '2022-12-21 11:42:48', '2023-01-24 09:38:00'),
(36, 'sms_api_link', 'http://bulksmsbd.net/api/smsapi?api_key=IBPJuXuI2JXlzglJkS3Z&type=text&senderid=8809612440788', 1, '2022-12-22 05:16:52', '2023-11-07 05:45:11'),
(37, 'sms_api_username', '01689655055', 1, '2022-12-22 05:16:52', '2022-12-22 05:37:11'),
(38, 'sms_api_password', '01689655055', 1, '2022-12-22 05:16:52', '2022-12-22 05:37:11'),
(39, 'invoice_prefix', 'MTC', 2, '2023-01-02 05:57:44', '2023-01-02 05:57:44'),
(40, 'invoice_starting', '1007', 2, '2023-01-02 05:57:44', '2023-01-02 07:31:47'),
(41, 'quotation_prefix', '', 2, '2023-01-02 05:57:44', '2023-01-02 05:57:44'),
(42, 'quotation_starting', '1001', 2, '2023-01-02 05:57:44', '2023-01-02 05:57:44'),
(43, 'invoice_footer', '', 2, '2023-01-02 05:57:44', '2023-01-02 05:57:44'),
(44, 'quotation_footer', '', 2, '2023-01-02 05:57:44', '2023-01-02 05:57:44'),
(45, 'sms_api_link', 'http://66.45.237.70/api.php?', 2, '2023-01-02 07:06:59', '2023-01-02 07:06:59'),
(46, 'sms_api_username', '01689655055', 2, '2023-01-02 07:06:59', '2023-01-02 07:06:59'),
(47, 'sms_api_password', '01689655055', 2, '2023-01-02 07:06:59', '2023-01-02 07:06:59'),
(48, 'ssl_active', 'yes', 1, '2023-01-07 05:37:56', '2023-01-07 06:25:03'),
(49, 'ssl_currency', 'BDT', 1, '2023-01-07 05:37:56', '2023-01-07 06:25:03'),
(51, 'ssl_store_id', 'softw63b257c889fa3', 1, '2023-01-07 06:25:03', '2023-01-07 06:25:03'),
(52, 'ssl_store_pswd', 'softw63b257c889fa3@ssl', 1, '2023-01-07 06:25:03', '2023-01-07 06:25:03'),
(53, 'product_active', 'no', 1, '2023-01-08 06:13:06', '2023-01-24 09:38:00'),
(54, 'max_entry_time', '120', 1, '2023-02-15 08:27:35', '2023-12-20 03:21:39'),
(55, 'duration_time', '2', 1, '2023-02-15 08:27:35', '2023-12-20 03:21:39'),
(56, 'company_logo', 'company_logo1677061617.png', 1, '2023-02-16 07:01:00', '2023-02-22 10:26:57'),
(57, 'default_holidays', 'Friday,Saturday', 1, '2023-11-05 06:28:33', '2023-12-11 00:05:33'),
(58, 'access_code', '1234', 1, '2023-11-05 06:28:33', '2023-11-19 05:58:00'),
(59, 'friday_holiday', 'yes', 1, '2023-11-05 06:30:49', '2023-11-05 06:30:49'),
(61, 'duration_time', '20', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(68, 'instant_absent_sms', 'yes', 1, '2023-12-02 00:38:53', '2023-12-20 03:21:39'),
(60, 'max_entry_time', '10', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(62, 'timezone', 'Asia/Dhaka', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(63, 'date_format', 'Y-m-d', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(64, 'time_format', '24', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(65, 'default_holidays', 'Friday,Saturday', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(66, 'access_code', '1234', 27, '2023-11-07 05:19:24', '2023-11-07 05:19:24'),
(67, 'institute_short_name', 'ABCPSC', 1, '2023-11-07 06:06:39', '2023-11-07 06:06:39'),
(69, 'company_name', 'Test School & College', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(70, 'institute_short_name', 'TSC', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(71, 'phone', '01309323741', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(72, 'reg_no', '', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(73, 'email', '', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(74, 'address', 'test', 29, '2023-12-04 23:21:56', '2023-12-04 23:21:56'),
(75, 'max_entry_time', '30', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(76, 'duration_time', '20', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(77, 'timezone', 'Asia/Dhaka', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(78, 'date_format', 'd-m-Y', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(79, 'time_format', '12', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(80, 'default_holidays', 'Friday,Saturday', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(81, 'instant_absent_sms', 'yes', 29, '2023-12-04 23:22:26', '2023-12-04 23:22:26'),
(82, 'max_entry_time', '60', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(83, 'duration_time', '60', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(84, 'timezone', 'Asia/Dhaka', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(85, 'date_format', 'd-m-Y', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(86, 'time_format', '12', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(87, 'default_holidays', 'Friday,Saturday', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(88, 'instant_absent_sms', 'yes', 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(89, 'sms_api_link', 'http://bulksmsbd.net/api/smsapi?api_key=IBPJuXuI2JXlzglJkS3Z&type=text&senderid=8809612440788', 32, '2023-12-11 03:22:52', '2023-12-11 03:22:52'),
(90, 'max_entry_time', '60', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(91, 'duration_time', '60', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(92, 'timezone', 'Asia/Dhaka', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(93, 'date_format', 'd-m-Y', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(94, 'time_format', '12', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(95, 'default_holidays', 'Friday,Saturday', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(96, 'instant_absent_sms', 'yes', 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(97, 'company_logo', 'company_logo1705480892.png', 35, '2024-01-17 02:41:32', '2024-01-17 02:41:32'),
(98, 'company_logo', 'company_logo1709654274.png', 79, '2024-03-05 09:57:54', '2024-03-05 09:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `company_sms_templates`
--

CREATE TABLE `company_sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_sms_templates`
--

INSERT INTO `company_sms_templates` (`id`, `name`, `subject`, `body`, `related_to`, `status`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 'Enter', 'Student Exit', '<pre class=\"border border-info p-2\">{student_name} প্রতিষ্ঠানে প্রবেশ করেছে {enter_time} | {company_short_name}</pre>', 'enter', 1, 1, '2023-03-28 08:36:48', '2023-11-19 10:06:35'),
(3, 'Exit', 'Exit Message', '<p>{student_name} - প্রতিষ্ঠান থেকে বের হয়েছে। {exit_time} | {company_short_name}</p>', 'exit', 1, 1, '2023-03-28 08:39:57', '2023-11-19 10:05:47'),
(15, 'Enter', 'Student Enter', '<pre class=\"border border-info p-2\">{student_name} প্রতিষ্ঠানে প্রবেশ করেছে {enter_time} | {company_short_name}</pre>', 'enter', 1, 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(16, 'Exit', 'Exit Message', '<pre class=\"border border-info p-2\">{student_name} - প্রতিষ্ঠান থেকে বের হয়েছে।  {exit_time} | {company_short_name}</pre>', 'exit', 1, 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(20, 'Absent', 'Absent Message', '<pre class=\"border border-info p-2\">{student_name} আজকে প্রতিষ্ঠানে অনুস্পস্থিত ছিল। {company_short_name}</pre>', 'absent', 1, 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(19, 'Exit', 'Exit Message', '<pre class=\"border border-info p-2\">{student_name} - প্রতিষ্ঠান থেকে বের হয়েছে।  {exit_time} | {company_short_name}</pre>', 'exit', 1, 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(18, 'Enter', 'Student Enter', '<pre class=\"border border-info p-2\">{student_name} প্রতিষ্ঠানে প্রবেশ করেছে {enter_time} | {company_short_name}</pre>', 'enter', 1, 33, '2023-12-19 00:51:29', '2023-12-19 00:51:29'),
(17, 'Absent', 'Absent Message', '<pre class=\"border border-info p-2\">{student_name} আজকে প্রতিষ্ঠানে অনুস্পস্থিত ছিল। {company_short_name}</pre>', 'absent', 1, 32, '2023-12-11 00:21:34', '2023-12-11 00:21:34'),
(14, 'Absent', NULL, '<pre class=\"border border-info p-2\">{student_name} আজকে প্রতিষ্ঠানে অনুস্পস্থিত ছিল। {company_short_name}</pre>', 'absent', 1, 1, '2023-11-13 11:52:57', '2023-11-19 10:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `profile_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roll_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `class_id`, `profile_type`, `company_name`, `contact_name`, `contact_email`, `roll_no`, `reg_no`, `contact_phone`, `blood_group`, `country`, `currency`, `city`, `state`, `zip`, `address`, `facebook`, `twitter`, `linkedin`, `remarks`, `contact_image`, `group_id`, `user_id`, `company_id`, `custom_fields`, `created_at`, `updated_at`) VALUES
(11, 2, '', NULL, 'Sinhath', 'sin@gmail.com', '02', '0007250470', '012324242542', 'B-', NULL, 'BDT', NULL, NULL, NULL, 'Gazipur', NULL, NULL, NULL, NULL, 'contact_image1699513347.jpg', NULL, 42, 1, NULL, '2023-11-09 07:02:27', '2023-12-12 09:13:41'),
(14, 2, NULL, NULL, 'Jason', NULL, '23', '323232', '01615352866', 'B-', NULL, 'BDT', NULL, NULL, NULL, 'test arae', NULL, NULL, NULL, NULL, 'avatar.png', NULL, NULL, 1, NULL, '2023-11-20 06:31:51', '2023-12-12 10:37:58'),
(15, 3, NULL, NULL, 'Mizbah', NULL, NULL, '123456', '01521484948', NULL, NULL, 'BDT', NULL, NULL, NULL, 'Chattogram', NULL, NULL, NULL, NULL, 'avatar.png', NULL, NULL, 29, NULL, '2023-12-04 05:22:25', '2023-12-04 05:22:25'),
(16, 3, NULL, NULL, 'Johnson', NULL, NULL, '0007176026', '01615352866', 'A+', NULL, 'BDT', NULL, NULL, NULL, 'Dhaka', NULL, NULL, NULL, NULL, 'avatar.png', NULL, NULL, 29, NULL, '2023-12-05 05:35:51', '2023-12-05 05:35:51'),
(17, 6, NULL, NULL, 'Mac', NULL, '01', '13131', '01521484948', 'B+', NULL, 'BDT', NULL, NULL, NULL, 'California, USA', NULL, NULL, NULL, NULL, 'contact_image1702281656.png', NULL, NULL, 1, NULL, '2023-12-07 11:34:32', '2023-12-12 09:11:57'),
(19, 7, NULL, NULL, 'Jamil', NULL, NULL, '1001', '01521484948', 'A+', NULL, 'BDT', NULL, NULL, NULL, 'Ctg', NULL, NULL, NULL, NULL, 'avatar.png', NULL, NULL, 32, NULL, '2023-12-11 09:21:29', '2023-12-11 09:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `contact_groups`
--

CREATE TABLE `contact_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_groups`
--

INSERT INTO `contact_groups` (`id`, `name`, `note`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Regular', NULL, 1, '2022-11-01 04:59:23', '2022-11-01 04:59:23'),
(2, 'Test', NULL, 2, '2022-12-06 05:50:51', '2022-12-06 05:50:51'),
(3, 'hghf', NULL, 2, '2022-12-06 05:58:14', '2022-12-06 05:58:14'),
(4, 'Section 1', 'test', 29, '2023-12-03 23:21:22', '2023-12-03 23:21:22'),
(5, 'Korotoa', NULL, 1, '2023-12-05 00:44:11', '2023-12-05 00:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `currency_rates`
--

CREATE TABLE `currency_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_rates`
--

INSERT INTO `currency_rates` (`id`, `currency`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'AED', 4.101083, NULL, NULL),
(2, 'AFN', 85.378309, NULL, NULL),
(3, 'ALL', 123.510844, NULL, NULL),
(4, 'AMD', 548.849773, NULL, NULL),
(5, 'ANG', 2.008050, NULL, NULL),
(6, 'AOA', 556.155120, NULL, NULL),
(7, 'ARS', 70.205746, NULL, NULL),
(8, 'AUD', 1.809050, NULL, NULL),
(9, 'AWG', 2.009782, NULL, NULL),
(10, 'AZN', 1.833159, NULL, NULL),
(11, 'BAM', 1.966840, NULL, NULL),
(12, 'BBD', 2.245460, NULL, NULL),
(13, 'BDT', 95.162306, NULL, NULL),
(14, 'BGN', 1.952383, NULL, NULL),
(15, 'BHD', 0.421787, NULL, NULL),
(16, 'BIF', 2117.865003, NULL, NULL),
(17, 'BMD', 1.116545, NULL, NULL),
(18, 'BND', 1.583270, NULL, NULL),
(19, 'BOB', 7.718004, NULL, NULL),
(20, 'BRL', 5.425949, NULL, NULL),
(21, 'BSD', 1.121775, NULL, NULL),
(22, 'BTC', 0.000244, NULL, NULL),
(23, 'BTN', 82.818317, NULL, NULL),
(24, 'BWP', 12.683055, NULL, NULL),
(25, 'BYN', 2.621037, NULL, NULL),
(26, 'BYR', 9999.999999, NULL, NULL),
(27, 'BZD', 2.261248, NULL, NULL),
(28, 'CAD', 1.552879, NULL, NULL),
(29, 'CDF', 1898.127343, NULL, NULL),
(30, 'CHF', 1.056023, NULL, NULL),
(31, 'CLF', 0.033950, NULL, NULL),
(32, 'CLP', 936.781769, NULL, NULL),
(33, 'CNY', 7.827878, NULL, NULL),
(34, 'COP', 4491.872864, NULL, NULL),
(35, 'CRC', 635.520417, NULL, NULL),
(36, 'CUC', 1.116545, NULL, NULL),
(37, 'CUP', 29.588450, NULL, NULL),
(38, 'CVE', 110.887227, NULL, NULL),
(39, 'CZK', 26.906059, NULL, NULL),
(40, 'DJF', 198.432393, NULL, NULL),
(41, 'DKK', 7.472892, NULL, NULL),
(42, 'DOP', 60.196240, NULL, NULL),
(43, 'DZD', 134.499489, NULL, NULL),
(44, 'EGP', 17.585483, NULL, NULL),
(45, 'ERN', 16.748349, NULL, NULL),
(46, 'ETB', 36.696587, NULL, NULL),
(47, 'EUR', 1.000000, NULL, NULL),
(48, 'FJD', 2.549240, NULL, NULL),
(49, 'FKP', 0.908257, NULL, NULL),
(50, 'GBP', 0.907964, NULL, NULL),
(51, 'GEL', 3.115301, NULL, NULL),
(52, 'GGP', 0.908257, NULL, NULL),
(53, 'GHS', 6.220337, NULL, NULL),
(54, 'GIP', 0.908257, NULL, NULL),
(55, 'GMD', 56.605069, NULL, NULL),
(56, 'GNF', 9999.999999, NULL, NULL),
(57, 'GTQ', 8.576324, NULL, NULL),
(58, 'GYD', 234.489495, NULL, NULL),
(59, 'HKD', 8.674753, NULL, NULL),
(60, 'HNL', 27.678062, NULL, NULL),
(61, 'HRK', 7.590196, NULL, NULL),
(62, 'HTG', 106.356510, NULL, NULL),
(63, 'HUF', 341.150311, NULL, NULL),
(64, 'IDR', 9999.999999, NULL, NULL),
(65, 'ILS', 4.159226, NULL, NULL),
(66, 'IMP', 0.908257, NULL, NULL),
(67, 'INR', 82.763894, NULL, NULL),
(68, 'IQD', 1339.198712, NULL, NULL),
(69, 'IRR', 9999.999999, NULL, NULL),
(70, 'ISK', 151.202539, NULL, NULL),
(71, 'JEP', 0.908257, NULL, NULL),
(72, 'JMD', 151.606351, NULL, NULL),
(73, 'JOD', 0.791685, NULL, NULL),
(74, 'JPY', 118.278988, NULL, NULL),
(75, 'KES', 115.283224, NULL, NULL),
(76, 'KGS', 81.395812, NULL, NULL),
(77, 'KHR', 4603.144194, NULL, NULL),
(78, 'KMF', 495.355724, NULL, NULL),
(79, 'KPW', 1004.922902, NULL, NULL),
(80, 'KRW', 1372.190164, NULL, NULL),
(81, 'KWD', 0.344879, NULL, NULL),
(82, 'KYD', 0.934921, NULL, NULL),
(83, 'KZT', 456.318281, NULL, NULL),
(84, 'LAK', 9978.233671, NULL, NULL),
(85, 'LBP', 1696.373291, NULL, NULL),
(86, 'LKR', 206.967335, NULL, NULL),
(87, 'LRD', 221.076044, NULL, NULL),
(88, 'LSL', 18.121543, NULL, NULL),
(89, 'LTL', 3.296868, NULL, NULL),
(90, 'LVL', 0.675387, NULL, NULL),
(91, 'LYD', 1.557311, NULL, NULL),
(92, 'MAD', 10.730569, NULL, NULL),
(93, 'MDL', 19.734707, NULL, NULL),
(94, 'MGA', 4165.265277, NULL, NULL),
(95, 'MKD', 61.516342, NULL, NULL),
(96, 'MMK', 1566.586511, NULL, NULL),
(97, 'MNT', 3088.650418, NULL, NULL),
(98, 'MOP', 8.975925, NULL, NULL),
(99, 'MRO', 398.607011, NULL, NULL),
(100, 'MUR', 43.205754, NULL, NULL),
(101, 'MVR', 17.250725, NULL, NULL),
(102, 'MWK', 825.239292, NULL, NULL),
(103, 'MXN', 24.963329, NULL, NULL),
(104, 'MYR', 4.810633, NULL, NULL),
(105, 'MZN', 73.591410, NULL, NULL),
(106, 'NAD', 18.121621, NULL, NULL),
(107, 'NGN', 408.099790, NULL, NULL),
(108, 'NIO', 37.844015, NULL, NULL),
(109, 'NOK', 11.405599, NULL, NULL),
(110, 'NPR', 132.508354, NULL, NULL),
(111, 'NZD', 1.847363, NULL, NULL),
(112, 'OMR', 0.429801, NULL, NULL),
(113, 'PAB', 1.121880, NULL, NULL),
(114, 'PEN', 3.958258, NULL, NULL),
(115, 'PGK', 3.838505, NULL, NULL),
(116, 'PHP', 57.698037, NULL, NULL),
(117, 'PKR', 176.121721, NULL, NULL),
(118, 'PLN', 4.386058, NULL, NULL),
(119, 'PYG', 7386.917924, NULL, NULL),
(120, 'QAR', 4.065302, NULL, NULL),
(121, 'RON', 4.826717, NULL, NULL),
(122, 'RSD', 117.627735, NULL, NULL),
(123, 'RUB', 83.568390, NULL, NULL),
(124, 'RWF', 1067.822267, NULL, NULL),
(125, 'SAR', 4.190432, NULL, NULL),
(126, 'SBD', 9.235251, NULL, NULL),
(127, 'SCR', 14.529548, NULL, NULL),
(128, 'SDG', 61.772847, NULL, NULL),
(129, 'SEK', 10.785247, NULL, NULL),
(130, 'SGD', 1.587844, NULL, NULL),
(131, 'SHP', 0.908257, NULL, NULL),
(132, 'SLL', 9999.999999, NULL, NULL),
(133, 'SOS', 653.732410, NULL, NULL),
(134, 'SRD', 8.327212, NULL, NULL),
(135, 'STD', 9999.999999, NULL, NULL),
(136, 'SVC', 9.816821, NULL, NULL),
(137, 'SYP', 575.019506, NULL, NULL),
(138, 'SZL', 18.038821, NULL, NULL),
(139, 'THB', 35.884679, NULL, NULL),
(140, 'TJS', 10.875343, NULL, NULL),
(141, 'TMT', 3.907909, NULL, NULL),
(142, 'TND', 3.186636, NULL, NULL),
(143, 'TOP', 2.635661, NULL, NULL),
(144, 'TRY', 7.131927, NULL, NULL),
(145, 'TTD', 7.585158, NULL, NULL),
(146, 'TWD', 33.739208, NULL, NULL),
(147, 'TZS', 2582.397529, NULL, NULL),
(148, 'UAH', 29.335146, NULL, NULL),
(149, 'UGX', 4169.685347, NULL, NULL),
(150, 'USD', 1.116545, NULL, NULL),
(151, 'UYU', 48.718630, NULL, NULL),
(152, 'UZS', 9999.999999, NULL, NULL),
(153, 'VEF', 11.151499, NULL, NULL),
(154, 'VND', 9999.999999, NULL, NULL),
(155, 'VUV', 133.944917, NULL, NULL),
(156, 'WST', 3.074259, NULL, NULL),
(157, 'XAF', 659.652615, NULL, NULL),
(158, 'XAG', 0.088073, NULL, NULL),
(159, 'XAU', 0.000756, NULL, NULL),
(160, 'XCD', 3.017519, NULL, NULL),
(161, 'XDR', 0.809234, NULL, NULL),
(162, 'XOF', 659.646672, NULL, NULL),
(163, 'XPF', 119.931356, NULL, NULL),
(164, 'YER', 279.475009, NULL, NULL),
(165, 'ZAR', 18.603040, NULL, NULL),
(166, 'ZMK', 9999.999999, NULL, NULL),
(167, 'ZMW', 17.892580, NULL, NULL),
(168, 'ZWL', 359.527584, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `current_stocks`
--

CREATE TABLE `current_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `current_stocks`
--

INSERT INTO `current_stocks` (`id`, `product_id`, `quantity`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1.00, 1, '2022-12-08 06:02:51', '2023-01-07 04:59:39'),
(2, 3, 0.00, 1, '2022-12-10 09:31:19', '2022-12-10 09:31:19'),
(3, 4, 0.00, 1, '2022-12-14 05:21:44', '2022-12-14 05:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint UNSIGNED NOT NULL,
  `division_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `lat`, `lon`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Comilla', 'কুমিল্লা', '23.4682747', '91.1788135', 'www.comilla.gov.bd', NULL, NULL),
(2, 1, 'Feni', 'ফেনী', '23.023231', '91.3840844', 'www.feni.gov.bd', NULL, NULL),
(3, 1, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', '23.9570904', '91.1119286', 'www.brahmanbaria.gov.bd', NULL, NULL),
(4, 1, 'Rangamati', 'রাঙ্গামাটি', NULL, NULL, 'www.rangamati.gov.bd', NULL, NULL),
(5, 1, 'Noakhali', 'নোয়াখালী', '22.869563', '91.099398', 'www.noakhali.gov.bd', NULL, NULL),
(6, 1, 'Chandpur', 'চাঁদপুর', '23.2332585', '90.6712912', 'www.chandpur.gov.bd', NULL, NULL),
(7, 1, 'Lakshmipur', 'লক্ষ্মীপুর', '22.942477', '90.841184', 'www.lakshmipur.gov.bd', NULL, NULL),
(8, 1, 'Chattogram', 'চট্টগ্রাম', '22.335109', '91.834073', 'www.chittagong.gov.bd', NULL, NULL),
(9, 1, 'Coxsbazar', 'কক্সবাজার', NULL, NULL, 'www.coxsbazar.gov.bd', NULL, NULL),
(10, 1, 'Khagrachhari', 'খাগড়াছড়ি', '23.119285', '91.984663', 'www.khagrachhari.gov.bd', NULL, NULL),
(11, 1, 'Bandarban', 'বান্দরবান', '22.1953275', '92.2183773', 'www.bandarban.gov.bd', NULL, NULL),
(12, 2, 'Sirajganj', 'সিরাজগঞ্জ', '24.4533978', '89.7006815', 'www.sirajganj.gov.bd', NULL, NULL),
(13, 2, 'Pabna', 'পাবনা', '23.998524', '89.233645', 'www.pabna.gov.bd', NULL, NULL),
(14, 2, 'Bogura', 'বগুড়া', '24.8465228', '89.377755', 'www.bogra.gov.bd', NULL, NULL),
(15, 2, 'Rajshahi', 'রাজশাহী', NULL, NULL, 'www.rajshahi.gov.bd', NULL, NULL),
(16, 2, 'Natore', 'নাটোর', '24.420556', '89.000282', 'www.natore.gov.bd', NULL, NULL),
(17, 2, 'Joypurhat', 'জয়পুরহাট', NULL, NULL, 'www.joypurhat.gov.bd', NULL, NULL),
(18, 2, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', '24.5965034', '88.2775122', 'www.chapainawabganj.gov.bd', NULL, NULL),
(19, 2, 'Naogaon', 'নওগাঁ', NULL, NULL, 'www.naogaon.gov.bd', NULL, NULL),
(20, 3, 'Jashore', 'যশোর', '23.16643', '89.2081126', 'www.jessore.gov.bd', NULL, NULL),
(21, 3, 'Satkhira', 'সাতক্ষীরা', NULL, NULL, 'www.satkhira.gov.bd', NULL, NULL),
(22, 3, 'Meherpur', 'মেহেরপুর', '23.762213', '88.631821', 'www.meherpur.gov.bd', NULL, NULL),
(23, 3, 'Narail', 'নড়াইল', '23.172534', '89.512672', 'www.narail.gov.bd', NULL, NULL),
(24, 3, 'Chuadanga', 'চুয়াডাঙ্গা', '23.6401961', '88.841841', 'www.chuadanga.gov.bd', NULL, NULL),
(25, 3, 'Kushtia', 'কুষ্টিয়া', '23.901258', '89.120482', 'www.kushtia.gov.bd', NULL, NULL),
(26, 3, 'Magura', 'মাগুরা', '23.487337', '89.419956', 'www.magura.gov.bd', NULL, NULL),
(27, 3, 'Khulna', 'খুলনা', '22.815774', '89.568679', 'www.khulna.gov.bd', NULL, NULL),
(28, 3, 'Bagerhat', 'বাগেরহাট', '22.651568', '89.785938', 'www.bagerhat.gov.bd', NULL, NULL),
(29, 3, 'Jhenaidah', 'ঝিনাইদহ', '23.5448176', '89.1539213', 'www.jhenaidah.gov.bd', NULL, NULL),
(30, 4, 'Jhalakathi', 'ঝালকাঠি', NULL, NULL, 'www.jhalakathi.gov.bd', NULL, NULL),
(31, 4, 'Patuakhali', 'পটুয়াখালী', '22.3596316', '90.3298712', 'www.patuakhali.gov.bd', NULL, NULL),
(32, 4, 'Pirojpur', 'পিরোজপুর', NULL, NULL, 'www.pirojpur.gov.bd', NULL, NULL),
(33, 4, 'Barisal', 'বরিশাল', NULL, NULL, 'www.barisal.gov.bd', NULL, NULL),
(34, 4, 'Bhola', 'ভোলা', '22.685923', '90.648179', 'www.bhola.gov.bd', NULL, NULL),
(35, 4, 'Barguna', 'বরগুনা', NULL, NULL, 'www.barguna.gov.bd', NULL, NULL),
(36, 5, 'Sylhet', 'সিলেট', '24.8897956', '91.8697894', 'www.sylhet.gov.bd', NULL, NULL),
(37, 5, 'Moulvibazar', 'মৌলভীবাজার', '24.482934', '91.777417', 'www.moulvibazar.gov.bd', NULL, NULL),
(38, 5, 'Habiganj', 'হবিগঞ্জ', '24.374945', '91.41553', 'www.habiganj.gov.bd', NULL, NULL),
(39, 5, 'Sunamganj', 'সুনামগঞ্জ', '25.0658042', '91.3950115', 'www.sunamganj.gov.bd', NULL, NULL),
(40, 6, 'Narsingdi', 'নরসিংদী', '23.932233', '90.71541', 'www.narsingdi.gov.bd', NULL, NULL),
(41, 6, 'Gazipur', 'গাজীপুর', '24.0022858', '90.4264283', 'www.gazipur.gov.bd', NULL, NULL),
(42, 6, 'Shariatpur', 'শরীয়তপুর', NULL, NULL, 'www.shariatpur.gov.bd', NULL, NULL),
(43, 6, 'Narayanganj', 'নারায়ণগঞ্জ', '23.63366', '90.496482', 'www.narayanganj.gov.bd', NULL, NULL),
(44, 6, 'Tangail', 'টাঙ্গাইল', NULL, NULL, 'www.tangail.gov.bd', NULL, NULL),
(45, 6, 'Kishoreganj', 'কিশোরগঞ্জ', '24.444937', '90.776575', 'www.kishoreganj.gov.bd', NULL, NULL),
(46, 6, 'Manikganj', 'মানিকগঞ্জ', NULL, NULL, 'www.manikganj.gov.bd', NULL, NULL),
(47, 6, 'Dhaka', 'ঢাকা', '23.7115253', '90.4111451', 'www.dhaka.gov.bd', NULL, NULL),
(48, 6, 'Munshiganj', 'মুন্সিগঞ্জ', NULL, NULL, 'www.munshiganj.gov.bd', NULL, NULL),
(49, 6, 'Rajbari', 'রাজবাড়ী', '23.7574305', '89.6444665', 'www.rajbari.gov.bd', NULL, NULL),
(50, 6, 'Madaripur', 'মাদারীপুর', '23.164102', '90.1896805', 'www.madaripur.gov.bd', NULL, NULL),
(51, 6, 'Gopalganj', 'গোপালগঞ্জ', '23.0050857', '89.8266059', 'www.gopalganj.gov.bd', NULL, NULL),
(52, 6, 'Faridpur', 'ফরিদপুর', '23.6070822', '89.8429406', 'www.faridpur.gov.bd', NULL, NULL),
(53, 7, 'Panchagarh', 'পঞ্চগড়', '26.3411', '88.5541606', 'www.panchagarh.gov.bd', NULL, NULL),
(54, 7, 'Dinajpur', 'দিনাজপুর', '25.6217061', '88.6354504', 'www.dinajpur.gov.bd', NULL, NULL),
(55, 7, 'Lalmonirhat', 'লালমনিরহাট', NULL, NULL, 'www.lalmonirhat.gov.bd', NULL, NULL),
(56, 7, 'Nilphamari', 'নীলফামারী', '25.931794', '88.856006', 'www.nilphamari.gov.bd', NULL, NULL),
(57, 7, 'Gaibandha', 'গাইবান্ধা', '25.328751', '89.528088', 'www.gaibandha.gov.bd', NULL, NULL),
(58, 7, 'Thakurgaon', 'ঠাকুরগাঁও', '26.0336945', '88.4616834', 'www.thakurgaon.gov.bd', NULL, NULL),
(59, 7, 'Rangpur', 'রংপুর', '25.7558096', '89.244462', 'www.rangpur.gov.bd', NULL, NULL),
(60, 7, 'Kurigram', 'কুড়িগ্রাম', '25.805445', '89.636174', 'www.kurigram.gov.bd', NULL, NULL),
(61, 8, 'Sherpur', 'শেরপুর', '25.0204933', '90.0152966', 'www.sherpur.gov.bd', NULL, NULL),
(62, 8, 'Mymensingh', 'ময়মনসিংহ', NULL, NULL, 'www.mymensingh.gov.bd', NULL, NULL),
(63, 8, 'Jamalpur', 'জামালপুর', '24.937533', '89.937775', 'www.jamalpur.gov.bd', NULL, NULL),
(64, 8, 'Netrokona', 'নেত্রকোণা', '24.870955', '90.727887', 'www.netrokona.gov.bd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Chattagram', 'চট্টগ্রাম', 'www.chittagongdiv.gov.bd', NULL, NULL),
(2, 'Rajshahi', 'রাজশাহী', 'www.rajshahidiv.gov.bd', NULL, NULL),
(3, 'Khulna', 'খুলনা', 'www.khulnadiv.gov.bd', NULL, NULL),
(4, 'Barisal', 'বরিশাল', 'www.barisaldiv.gov.bd', NULL, NULL),
(5, 'Sylhet', 'সিলেট', 'www.sylhetdiv.gov.bd', NULL, NULL),
(6, 'Dhaka', 'ঢাকা', 'www.dhakadiv.gov.bd', NULL, NULL),
(7, 'Rangpur', 'রংপুর', 'www.rangpurdiv.gov.bd', NULL, NULL),
(8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensinghdiv.gov.bd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_issue_date` date NOT NULL,
  `license_expiry_date` date DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `mobile`, `license_no`, `license_issue_date`, `license_expiry_date`, `address`, `profile_picture`, `license_picture`, `father`, `mother`, `nid`, `birth_date`, `salary`, `house_rent`, `mobile_rent`, `other_bill`, `status`, `company_id`, `temporary`, `created_at`, `updated_at`) VALUES
(1, 'Sultan', '01615352866', 'RG324 54543', '2022-12-01', '2023-01-06', 'test dvdvd dvdsd fdvdvd', 'profile_picture1671261029.jpeg', 'license_picture1671261029.png', NULL, NULL, NULL, '1997-04-08', NULL, NULL, NULL, NULL, 1, 1, NULL, '2022-12-17 07:10:29', '2022-12-17 07:10:33'),
(2, 'Monir', '01313223423', '1234242 2424 2222', '2022-09-29', '2025-03-07', 'test sds wdrww sfsf sdfsdsf.', 'DatMonir.jpeg', 'license_picture1671346256.png', NULL, NULL, 10393424224, '2005-01-20', 15000.00, 500.50, 700.09, 30.91, 1, 1, NULL, '2022-12-18 06:50:56', '2023-01-18 06:33:56'),
(4, 'Sultan', '01615352866', '12123213232', '2023-01-01', NULL, NULL, 'avatar.png', 'avatar.png', NULL, NULL, NULL, '1983-09-23', NULL, NULL, NULL, NULL, 1, 2, NULL, '2023-01-02 06:11:11', '2023-01-02 06:11:11'),
(7, 'testsd', '01521484948', 'ewerr 6634 erer', '2023-01-09', '2023-01-13', 'tedst area', 'YEDtestsd.jpeg', NULL, NULL, NULL, NULL, '1983-09-29', NULL, NULL, NULL, NULL, 1, 1, 1, '2023-01-09 09:55:24', '2023-01-16 10:07:58'),
(8, 'John Test', '01615232151', 'DP0132324343', '2005-12-30', '2023-01-31', 'eedfgd', 'profile_picture1674019633.png', 'license_picture1674019633.png', 'papa', 'mamma', 11231232131, '2000-06-04', 40034.00, NULL, NULL, NULL, 1, 1, NULL, '2023-01-18 05:27:13', '2023-01-18 06:32:19'),
(9, 'Test', '01454546466', 'DL3424254245', '2021-01-22', '2026-08-18', 'Marjal - Kamrabo Rd, Bhairab Bazar-3403, Bangladesh.', 'SUlTest.jpeg', 'Tz3Test.png', 'father', 'mother', 101231312312, '1993-03-18', 10232.34, 200.00, 121.00, 213.00, 1, 1, NULL, '2023-01-18 06:44:44', '2023-01-18 07:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'registration', 'Registration Sucessfully', '<div style=\"padding: 15px 30px;\">\r\n<h2 style=\"color: #555555;\">Registration Successful</h2>\r\n<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\">Welcome to Attendance Keeper and thank you for joining with us. You can now sign in to your account using your email and password.<br /><br />Regards<br />Attendance Keeper</span></p>\r\n</div>', NULL, '2023-04-01 07:14:51'),
(2, 'premium_membership', 'Premium Membership', '<div style=\"padding: 15px 30px;\">\r\n<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\"><strong>Congratulations</strong> your payment was made sucessfully. Your current membership is valid <strong>until</strong> <strong>{valid_to}</strong></span><span style=\"color: #555555;\"><strong>.</strong></span></p>\r\n<p style=\"color: #555555;\"><span style=\"color: #555555;\">Thank You Attendance Keeper Ltd.</span></p>\r\n</div>', NULL, '2023-12-03 22:58:44'),
(3, 'alert_notification', 'Attendance Keeper Renewals', '<div style=\"padding: 15px 30px;\">\r\n<h2 style=\"color: #555555;\">Account Renew Notification</h2>\r\n<p style=\"color: #555555;\">Hi {name},<br /><span style=\"color: #555555;\">Your package is due to <strong>expire on {valid_to}</strong> s</span><span style=\"color: #555555;\">o you will need to renew by then to keep your account active.</span></p>\r\n<p><br style=\"color: #555555;\" /><span style=\"color: #555555;\">Regards</span><br style=\"color: #555555;\" /><span style=\"color: #555555;\">Attendance Keeper</span></p>\r\n</div>', NULL, '2023-04-02 04:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `related_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_manager`
--

CREATE TABLE `file_manager` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_dir` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuels`
--

CREATE TABLE `fuels` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_id` int NOT NULL,
  `meter_start` decimal(10,2) NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fuel_date` date DEFAULT NULL,
  `fuel_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fuels`
--

INSERT INTO `fuels` (`id`, `vehicle_id`, `meter_start`, `address`, `reference`, `note`, `fuel_date`, `fuel_from`, `supplier_id`, `qty`, `cost`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 3, 10023.32, 'test', 'test expense', 'test note', '2023-02-02', 'nd', 1, 100.00, 500.00, 1, '2023-02-02 05:34:26', '2023-02-02 05:34:26'),
(2, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:03:03', '2023-02-02 06:03:03'),
(3, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:10:06', '2023-02-02 06:10:06'),
(4, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:11:07', '2023-02-02 06:11:07'),
(5, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:11:54', '2023-02-02 06:11:54'),
(6, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:12:24', '2023-02-02 06:12:24'),
(7, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:12:43', '2023-02-02 06:12:43'),
(8, 1, 198.87, 'test', 'test', 'test', '2023-02-02', 'vendor', 1, 100.00, 50.67, 1, '2023-02-02 06:27:10', '2023-02-02 06:27:10'),
(9, 1, 100.00, NULL, NULL, NULL, '2023-02-02', 'vendor', 1, 100.00, 20.00, 1, '2023-02-02 06:34:43', '2023-02-02 06:34:43'),
(10, 1, 100.90, NULL, NULL, NULL, '2023-02-02', 'vendor', 1, 100.00, 20.00, 1, '2023-02-02 06:37:33', '2023-02-02 06:37:33'),
(11, 1, 100.90, NULL, NULL, NULL, '2023-02-02', 'vendor', 1, 100.00, 20.00, 1, '2023-02-02 06:41:00', '2023-02-02 06:41:00'),
(12, 1, 100.90, NULL, NULL, NULL, '2023-02-02', 'vendor', 1, 100.00, 20.00, 1, '2023-02-02 06:42:01', '2023-02-02 06:42:01'),
(13, 1, 100.90, NULL, NULL, NULL, '2023-02-02', 'vendor', 1, 100.00, 20.00, 1, '2023-02-02 06:42:15', '2023-02-02 06:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gallery_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `gallery_img`, `created_at`, `updated_at`) VALUES
(3, NULL, 'gallery_img1705993211.jpg', '2024-01-23 01:00:11', '2024-01-23 01:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `governors`
--

CREATE TABLE `governors` (
  `id` bigint NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(199) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `governors`
--

INSERT INTO `governors` (`id`, `name`, `title`, `img`, `created_at`, `updated_at`) VALUES
(2, 'md farid hossain', 'admin', 'img1707204755.png', '2024-02-06 01:32:35', '2024-02-06 01:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_messages`
--

CREATE TABLE `group_chat_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sender_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_message_status`
--

CREATE TABLE `group_chat_message_status` (
  `id` bigint UNSIGNED NOT NULL,
  `message_id` bigint NOT NULL,
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `start_date`, `end_date`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Shab-e-barat', '2023-03-08', '2023-03-10', 1, '2023-03-01 11:18:24', '0000-00-00 00:00:00'),
(2, 'Bangabandhu Birth Anniversary', '2023-03-17', '2023-03-17', 1, '2023-03-02 09:23:15', '2023-03-02 09:23:15'),
(3, 'Mother Language Day', '2023-02-21', '2023-02-21', 1, '2023-03-04 04:09:58', '2023-03-04 04:09:58'),
(5, 'Shab-e-Miraj', '2023-02-19', '2023-02-19', 1, '2023-03-04 10:09:47', '2023-03-04 10:09:47'),
(18, 'Winter holiday', '2023-02-02', '2023-02-05', 1, '2023-03-05 06:08:17', '2023-03-05 06:08:17'),
(19, 'Winter holiday', '2023-02-03', '2023-02-05', 1, '2023-03-05 06:08:17', '2023-03-05 06:08:17'),
(20, 'Winter holiday', '2023-02-04', '2023-02-05', 1, '2023-03-05 06:08:17', '2023-03-05 06:08:17'),
(21, 'Winter holiday', '2023-02-05', '2023-02-05', 1, '2023-03-05 06:08:17', '2023-03-05 06:08:17'),
(39, 'Winter', '2023-12-06', '2023-12-06', 29, '2023-12-04 23:22:59', '2023-12-04 23:22:59'),
(40, 'Victory', '2023-12-07', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(41, 'Victory', '2023-12-08', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(42, 'Victory', '2023-12-09', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(43, 'Victory', '2023-12-10', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(44, 'Victory', '2023-12-11', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(45, 'Victory', '2023-12-12', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(46, 'Victory', '2023-12-13', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(47, 'Victory', '2023-12-14', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(48, 'Victory', '2023-12-15', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(49, 'Victory', '2023-12-16', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(50, 'Victory', '2023-12-17', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(51, 'Victory', '2023-12-18', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(52, 'Victory', '2023-12-19', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(53, 'Victory', '2023-12-20', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(54, 'Victory', '2023-12-21', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(55, 'Victory', '2023-12-22', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(56, 'Victory', '2023-12-23', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(57, 'Victory', '2023-12-24', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27'),
(58, 'Victory', '2023-12-25', '2023-12-25', 29, '2023-12-04 23:23:27', '2023-12-04 23:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `institute_classes`
--

CREATE TABLE `institute_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `institute_classes`
--

INSERT INTO `institute_classes` (`id`, `class_name`, `start_time`, `end_time`, `group_id`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 'Class Two', '15:35:00', '17:30:00', 1, 1, '2023-03-27 04:38:57', '2023-12-20 03:57:02'),
(3, 'One', '11:21:00', '12:21:00', 4, 29, '2023-12-03 23:21:46', '2023-12-03 23:21:46'),
(6, 'CLass One', '14:53:00', '15:55:00', NULL, 1, '2023-12-11 01:53:36', '2023-12-11 01:53:36'),
(7, 'Class One', '15:20:00', '17:20:00', NULL, 32, '2023-12-11 03:20:28', '2023-12-11 03:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `pickup_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dest_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meter_start` double DEFAULT NULL,
  `meter_end` double DEFAULT NULL,
  `mile` decimal(10,2) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `related_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `client_id` bigint NOT NULL,
  `driver_id` int DEFAULT NULL,
  `vehicle_id` int NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `booking_status`, `invoice_date`, `due_date`, `delivery_date`, `pickup_addr`, `dest_addr`, `grand_total`, `tax_total`, `paid`, `converted_total`, `status`, `template`, `meter_start`, `meter_end`, `mile`, `note`, `related_to`, `related_id`, `client_id`, `driver_id`, `vehicle_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '1001', 'booked', '2022-11-01', '2022-11-01', '2023-01-31', '12/D/E, Main Avenue, Dhaka 1229', '105 Pragati Swarani, Dhaka 1212', 20000.00, 0.00, 15000.00, 20000.00, 'Partially_Paid', 'classic-red', NULL, NULL, NULL, 'Thanks for business with us', 'contacts', 1, 1, 2, 1, 1, '2022-11-01 05:04:23', '2022-12-20 10:42:23'),
(3, '1003', 'booked', '2022-12-14', '2022-12-14', '2023-01-30', 'Test Area', 'Test 1 area', 910.00, 0.00, 0.00, 910.00, 'Unpaid', 'classic-red', NULL, 0, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-14 08:30:34', '2023-01-22 10:05:59'),
(4, '1004', 'delivered', '2022-12-01', '2023-01-06', NULL, 'Badda Link Road, Dhaka 1212\r\nDhaka, 1212\r\nBangladesh', 'Dhanmondi Plaza, H-18, Rd No. 6, Dhaka 1205', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, 'test', 'contacts', 6, 6, 1, 1, 1, '2022-12-15 08:48:43', '2022-12-20 10:49:35'),
(6, '1006', 'delivered', '2022-11-27', '2023-01-07', NULL, 'Test area 1234', 'Test area 5678', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 2, 1, 1, '2022-12-15 09:20:21', '2022-12-20 10:50:14'),
(7, '1007', 'ongoing', '2022-11-29', '2023-01-13', NULL, 'Bashundhara Main Gate, Dhaka 1229', 'V9FR+W99, Gareeb-e-Nawaz Ave, Dhaka 1230', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, 'sdgs ddtgrs', 'contacts', 6, 6, 2, 1, 1, '2022-12-15 09:34:31', '2022-12-20 10:45:29'),
(8, '1008', 'ongoing', '2022-11-27', '2023-02-03', NULL, 'House-5, 1st Floor, Probal Housing, রিং রোড, ঢাকা 1207', 'চট্টগ্রাম বিশ্ববিদ্যালয় সড়ক, 4331', 20000.00, 0.00, 15000.00, 20000.00, 'Partially_Paid', 'classic-red', NULL, NULL, NULL, 'Thanks for business with us.', 'contacts', 6, 6, 2, 1, 1, '2022-12-15 10:43:03', '2022-12-20 10:50:55'),
(9, '1009', 'booked', '2022-12-01', '2023-01-07', NULL, 'Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230', 'Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230', 1097.80, 49.90, 0.00, 1097.80, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 2, 1, 1, '2022-12-17 05:50:00', '2022-12-20 10:47:16'),
(10, '1010', 'delivered', '2022-11-28', '2022-12-28', NULL, 'Trust Family Needs, House#07 Rabindra Sarani, Dhaka 1230', 'House-5, 1st Floor, Probal Housing, রিং রোড, ঢাকা 1207', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, 'Thanks for business with us.', 'contacts', 1, 1, 1, 1, 1, '2022-12-17 09:23:56', '2022-12-20 10:51:45'),
(11, '1011', 'delivered', '2022-11-27', '2022-12-17', NULL, 'Test adreess 1', 'Test Address 2', 1094.50, 49.75, 1094.50, 1094.50, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-17 10:58:22', '2022-12-20 10:52:03'),
(12, '1012', 'delivered', '2022-12-02', '2022-12-18', NULL, 'Test area 123 dd ddv,', 'Test area 123 dd ddv,', 1094.50, 49.75, 0.00, 1094.50, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 2, 1, 1, '2022-12-18 06:07:49', '2022-12-18 09:39:43'),
(13, '1013', 'cancelled', '2022-12-18', '2022-12-18', NULL, 'Test', 'Test2', 1000.00, 0.00, 0.00, 1000.00, 'Canceled', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 2, 1, 1, '2022-12-18 11:34:23', '2022-12-20 05:57:54'),
(18, '1018', 'booked', '2022-12-21', '2022-12-21', NULL, 'test 1', 'test 2', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-21 09:17:54', '2022-12-21 09:17:54'),
(15, '1014', 'ongoing', '2022-12-21', '2022-12-21', NULL, 'Test area 123', 'Test area 542', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2022-12-21 06:25:30', '2022-12-21 06:35:45'),
(17, '1017', 'delivered', '2022-12-01', '2022-12-31', NULL, 'rtests rrv', 'tetdsec edcec', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, 'Thanks for using', 'contacts', 6, 6, 1, 1, 1, '2022-12-21 06:36:54', '2022-12-21 06:37:38'),
(19, 'ATA1019', 'cancelled', '2022-12-24', '2022-12-24', NULL, 'Test area 1', 'test area 2', 1000.00, 0.00, 0.00, 1000.00, 'Canceled', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-24 05:50:32', '2022-12-26 10:50:21'),
(20, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'Test adress 1', 'Test adress 123', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:17:29', '2022-12-25 04:17:29'),
(21, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'Test adress 1', 'Test adress 123', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:52:24', '2022-12-25 04:52:24'),
(22, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:54:04', '2022-12-25 04:54:04'),
(23, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:55:03', '2022-12-25 04:55:03'),
(24, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:55:35', '2022-12-25 04:55:35'),
(25, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:56:59', '2022-12-25 04:56:59'),
(26, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 04:58:50', '2022-12-25 04:58:50'),
(27, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:02:26', '2022-12-25 05:02:26'),
(28, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:02:39', '2022-12-25 05:02:39'),
(29, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:04:08', '2022-12-25 05:04:08'),
(30, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:08:50', '2022-12-25 05:08:50'),
(31, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:09:11', '2022-12-25 05:09:11'),
(32, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:10:11', '2022-12-25 05:10:11'),
(33, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:14:20', '2022-12-25 05:14:20'),
(34, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:14:33', '2022-12-25 05:14:33'),
(35, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:15:02', '2022-12-25 05:15:02'),
(36, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:15:18', '2022-12-25 05:15:18'),
(37, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:17:45', '2022-12-25 05:17:45'),
(38, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:18:26', '2022-12-25 05:18:26'),
(39, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:19:48', '2022-12-25 05:19:48'),
(40, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:38:41', '2022-12-25 05:38:41'),
(41, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:39:24', '2022-12-25 05:39:24'),
(42, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:40:43', '2022-12-25 05:40:43'),
(43, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:41:20', '2022-12-25 05:41:20'),
(44, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:42:11', '2022-12-25 05:42:11'),
(45, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:42:23', '2022-12-25 05:42:23'),
(46, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:42:58', '2022-12-25 05:42:58'),
(47, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:44:10', '2022-12-25 05:44:10'),
(48, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:44:49', '2022-12-25 05:44:49'),
(49, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:46:21', '2022-12-25 05:46:21'),
(50, 'ATA1020', 'booked', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:47:07', '2022-12-25 05:47:07'),
(51, 'ATA1020', 'cancelled', '2022-12-25', '2022-12-25', NULL, 'test', 'test', 1000.00, 0.00, 0.00, 1000.00, 'Canceled', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:47:40', '2022-12-26 10:52:12'),
(52, 'ATA1052', 'booked', '2022-12-25', '2022-12-25', NULL, 'Test 1 dfd g sfdgsd', 'Tesadsffv vdsjg', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:50:51', '2022-12-25 05:50:51'),
(53, 'ATA1053', 'booked', '2022-12-14', '2022-12-25', NULL, 'Test  bfdgvbdf vdgvbdv', 'Test dcvb dc cfbdfbv', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-25 05:54:52', '2023-01-07 12:07:05'),
(54, 'ATA1054', 'booked', '2022-12-25', '2022-12-25', NULL, 'tewtdsadc sfvsdv', 'vds dfvbsdf cbdfb', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2022-12-25 05:56:11', '2023-01-07 12:01:26'),
(83, 'ATA1077', 'delivered', '2023-01-09', '2023-01-09', '2023-01-09', 'test', 'test', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', 343.332, 390.33, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2023-01-09 04:20:18', '2023-01-26 10:54:22'),
(82, 'ATA1076', 'delivered', '2023-01-08', '2023-01-08', '2023-01-08', 'Paschim Nasirabad, Chattogram, Bangladesh', 'House 3 Road-9/B, Dhaka 1230, Bangladesh', 950.00, 0.00, 950.00, 950.00, 'Paid', 'classic-red', NULL, 190, 267.35, 'test', 'contacts', 6, 6, 2, 3, 1, '2023-01-08 11:57:38', '2023-01-26 10:56:17'),
(57, 'ATA1057', 'booked', '2022-12-01', '2022-12-25', NULL, 'test 1 dfd dgvdf b', 'Test 2 dfgvbd  fdgvdfg', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 2, 1, 1, '2022-12-25 06:07:38', '2023-01-07 11:38:19'),
(58, 'ATA1057', 'booked', '2022-12-01', '2022-12-25', NULL, 'test 1 dfd dgvdf b', 'Test 2 dfgvbd  fdgvdfg', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 2, 1, 1, '2022-12-25 06:10:39', '2022-12-25 06:10:39'),
(59, 'ATA1059', 'booked', '2022-12-22', '2022-12-25', NULL, 'Test aread', 'Tets sdfsdfv', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2022-12-25 06:11:52', '2023-01-07 11:36:35'),
(60, 'ATA1060', 'cancelled', '2022-12-26', '2022-12-26', NULL, 'Dhaka', 'CTG', 1000.00, 0.00, 0.00, 1000.00, 'Canceled', 'classic-red', NULL, NULL, NULL, 'Note', 'contacts', 7, 7, 2, 1, 1, '2022-12-26 05:33:35', '2022-12-26 10:42:54'),
(61, 'ATA1061', 'booked', '2022-12-01', '2022-12-28', NULL, 'Test area dhaka', 'Test area ctg', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, 'rerefdfdvd fbdbvdf fsgdfsvb', 'contacts', 1, 1, 1, 1, 1, '2022-12-28 04:51:03', '2023-01-07 11:34:26'),
(62, 'ATA1062', 'booked', '2022-12-28', '2022-12-28', NULL, 'Test is here', 'Test is here asrea', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', NULL, NULL, NULL, 'Test', 'contacts', 1, 1, 1, 1, 1, '2022-12-28 05:09:31', '2023-01-07 11:33:26'),
(63, 'ATA1062', 'booked', '2022-12-28', '2022-12-28', NULL, 'Test is here', 'Test is here asrea', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, 'Test', 'contacts', 1, 1, 1, 1, 1, '2022-12-28 05:10:40', '2022-12-28 05:10:40'),
(65, 'ATA1065', 'booked', '2022-12-28', '2022-12-28', NULL, 'tesr', 'test \\233b  u7u 77bgy', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-28 05:14:03', '2022-12-28 05:14:03'),
(66, 'ATA1066', 'booked', '2022-12-27', '2023-01-12', NULL, 'Test is dhaka', 'Test is ctg', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2022-12-28 06:51:29', '2022-12-28 06:51:29'),
(67, 'ATA1067', 'booked', '2022-12-28', '2022-12-28', '2023-01-01', '41 Chan Mia Rd, Dhaka, Bangladesh', 'WC4M+7F4, Mahendranagar, Bangladesh', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', 778.34, 999, 346.57, NULL, 'contacts', 1, 1, 1, 1, 1, '2022-12-28 07:33:31', '2023-02-01 05:04:13'),
(68, 'ATA1068', 'booked', '2022-12-29', '2023-01-07', NULL, 'ctg', 'dhk', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', 10343.34, 10554, NULL, 'test', 'contacts', 6, 6, 1, 1, 1, '2022-12-29 04:46:40', '2022-12-29 04:46:40'),
(69, 'ATA1069', 'booked', '2022-12-29', '2023-01-31', NULL, 'Dhaka', 'Rajshahi', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2022-12-29 04:58:05', '2022-12-29 04:58:05'),
(70, 'ATA1070', 'booked', '2023-01-01', '2023-02-04', NULL, 'Dhaka', 'Ctg', 1000.00, 0.00, 0.00, 1000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 6, 6, 2, 1, 1, '2023-01-01 05:27:07', '2023-01-01 05:27:07'),
(71, 'ATA1071', 'ongoing', '2023-01-01', '2023-02-04', '2023-01-28', 'medical college road, laxmipur, Rajshahi 6000, Bangladesh', 'GFRG+38Q, Gasua, Bangladesh', 21000.00, 1000.00, 21000.00, 21000.00, 'Paid', 'classic-red', 101.23, 306, 483.28, NULL, 'contacts', 6, 6, 1, 1, 1, '2023-01-01 05:52:13', '2023-01-28 10:24:42'),
(72, 'ATA1072', 'ongoing', '2023-01-01', '2023-02-04', '2023-01-28', 'Rajshahi, Bangladesh', 'Paribagh Mosque, 10 Paribagh - Shonargaon St, Dhaka 1000, Bangladesh', 20000.00, 0.00, 20000.00, 20000.00, 'Paid', 'classic-red', NULL, 198, 252.56, NULL, 'contacts', 6, 6, 1, 1, 1, '2023-01-01 05:55:47', '2023-01-28 10:14:31'),
(73, 'ATA1073', 'booked', '2023-01-01', '2023-02-04', '2023-01-31', 'House 3 Road-9/B, Dhaka 1230, Bangladesh', 'medical college road, laxmipur, Rajshahi 6000, Bangladesh', 1023.75, 48.75, 1023.75, 1023.75, 'Paid', 'classic-red', NULL, 149, 237.55, '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', 'contacts', 6, 6, 1, 1, 1, '2023-01-01 06:17:35', '2023-01-26 10:58:09'),
(75, 'ATA1074', 'delivered', '2023-01-01', '2023-02-24', '2023-02-12', 'Test is area', 'Area from Dhaka', 20002.00, 2.00, 20004.00, 20002.00, 'Paid', 'classic-red', NULL, 106, NULL, 'This is comment section', 'contacts', 6, 6, 1, 1, 1, '2023-01-01 06:58:37', '2023-01-26 10:57:10'),
(76, 'MTC1001', 'booked', '2023-01-02', '2023-01-02', NULL, 'plot No, 41 Gareeb-e-Nawaz Ave, Dhaka:1230 1230', 'Dhaka - Ashulia Hwy, Dhaka 1341', 8000.00, 0.00, 5000.00, 84.07, 'Partially_Paid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 2, 2, 4, 2, 2, '2023-01-02 07:01:28', '2023-01-02 07:11:33'),
(77, 'MTC1002', 'booked', '2023-01-02', '2023-01-02', NULL, 'Dhaka - Ashulia Hwy, Dhaka 1341', 'plot No, 41 Gareeb-e-Nawaz Ave, Dhaka:1230 1230', 8000.00, 0.00, 0.00, 8000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 2, 2, 4, 2, 2, '2023-01-02 07:12:33', '2023-01-02 07:12:33'),
(84, 'ATA1078', 'cancelled', '2023-01-09', '2023-01-09', '2023-02-04', 't1', 't2', 21000.00, 0.00, 0.00, 21000.00, 'Canceled', 'classic-red', 2312.232, 2433.33, NULL, NULL, 'contacts', 6, 6, 1, 1, 1, '2023-01-09 05:04:21', '2023-01-26 10:52:45'),
(85, 'ATA1079', 'ongoing', '2023-01-09', '2023-01-27', '2023-02-01', 'test area 1', 'test area 2', 2000.00, 0.00, 2000.00, 2000.00, 'Paid', 'classic-red', 434.03, 900, NULL, NULL, 'contacts', 6, 6, 7, 1, 1, '2023-01-09 09:55:24', '2023-01-26 10:52:01'),
(81, 'MTC1006', 'booked', '2023-01-02', '2023-02-03', NULL, 'Uttara 3rd Phase Connecting, Road সোনারগাঁ জনপথ, ঢাকা 1230', 'রোড নং ২১, Dhaka 1216', 8000.00, 0.00, 0.00, 8000.00, 'Unpaid', 'classic-red', NULL, NULL, NULL, NULL, 'contacts', 2, 2, 4, 2, 2, '2023-01-02 07:31:47', '2023-01-02 07:31:47'),
(80, 'MTC1003', 'delivered', '2023-01-02', '2023-01-02', NULL, 'Plot No : 276, Narshinghapur, Dhaka 1341', 'Uttara 3rd Phase Connecting, Road Sonargaon Janapath, Dhaka 1230', 8000.00, 0.00, 8000.00, 8000.00, 'Paid', 'classic-red', 312.343, 44321.3432, NULL, NULL, 'contacts', 2, 2, 4, 2, 2, '2023-01-02 07:28:14', '2023-01-02 07:29:37'),
(86, 'ATA1080', 'ongoing', '2023-01-09', '2023-01-09', '2023-02-04', 'Plot No : 276, Narshinghapur, Dhaka 1341', 'Sonargaon Janapath, Dhaka 1230, Bangladesh', 1000.00, 0.00, 1000.00, 1000.00, 'Paid', 'classic-red', 123.23, 232, 7.65, NULL, 'contacts', 6, 6, 1, 1, 1, '2023-01-09 11:27:27', '2023-01-28 09:56:45'),
(87, 'ATA1081', 'cancelled', '2023-01-22', '2023-01-22', '2023-01-31', '4 Shah Makhdum Ave, Dhaka 1230, Bangladesh', 'Aricha Port, RQPH+PPP, Dhaka - Aricha Hwy, শিবালয়, Bangladesh', 1000.00, 0.00, 0.00, 1000.00, 'Canceled', 'classic-red', 20.32, NULL, NULL, 'Test', 'contacts', 6, 6, 2, 1, 1, '2023-01-22 09:49:42', '2023-01-23 09:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `item_id`, `description`, `quantity`, `unit_cost`, `discount`, `tax_method`, `tax_id`, `tax_amount`, `sub_total`, `company_id`, `created_at`, `updated_at`) VALUES
(23, 1, 1, 'Dhaka - Rangpur', 2.00, 10000.00, 0.00, NULL, NULL, 0.00, 20000.00, 1, '2022-12-20 10:42:23', '2022-12-20 10:42:23'),
(36, 18, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-21 09:17:54', '2022-12-21 09:17:54'),
(31, 15, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-21 06:25:30', '2022-12-21 06:25:30'),
(114, 3, 1, NULL, 1.00, 1000.00, 90.00, NULL, NULL, 0.00, 910.00, 1, '2023-01-22 10:05:59', '2023-01-22 10:05:59'),
(24, 4, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-20 10:43:59', '2022-12-20 10:43:59'),
(25, 6, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-20 10:44:39', '2022-12-20 10:44:39'),
(26, 7, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-20 10:45:29', '2022-12-20 10:45:29'),
(27, 8, 5, NULL, 1.00, 20000.00, 0.00, NULL, NULL, 0.00, 20000.00, 1, '2022-12-20 10:46:13', '2022-12-20 10:46:13'),
(28, 9, 1, NULL, 1.00, 1000.00, 2.00, NULL, NULL, 49.90, 998.00, 1, '2022-12-20 10:47:16', '2022-12-20 10:47:16'),
(29, 10, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-20 10:48:12', '2022-12-20 10:48:12'),
(14, 11, 1, NULL, 1.00, 1000.00, 5.00, NULL, NULL, 49.75, 995.00, 1, '2022-12-17 10:58:22', '2022-12-17 10:58:22'),
(19, 12, 1, NULL, 1.00, 1000.00, 5.00, NULL, NULL, 49.75, 995.00, 1, '2022-12-18 09:39:43', '2022-12-18 09:39:43'),
(21, 13, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-18 11:50:31', '2022-12-18 11:50:31'),
(35, 17, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-21 06:37:24', '2022-12-21 06:37:24'),
(37, 19, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-24 05:50:32', '2022-12-24 05:50:32'),
(38, 20, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:17:29', '2022-12-25 04:17:29'),
(39, 21, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:52:24', '2022-12-25 04:52:24'),
(40, 22, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:54:04', '2022-12-25 04:54:04'),
(41, 23, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:55:03', '2022-12-25 04:55:03'),
(42, 24, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:55:35', '2022-12-25 04:55:35'),
(43, 25, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:56:59', '2022-12-25 04:56:59'),
(44, 26, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 04:58:50', '2022-12-25 04:58:50'),
(45, 27, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:02:26', '2022-12-25 05:02:26'),
(46, 28, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:02:39', '2022-12-25 05:02:39'),
(47, 29, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:04:08', '2022-12-25 05:04:08'),
(48, 30, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:08:50', '2022-12-25 05:08:50'),
(49, 31, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:09:11', '2022-12-25 05:09:11'),
(50, 32, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:10:11', '2022-12-25 05:10:11'),
(51, 33, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:14:20', '2022-12-25 05:14:20'),
(52, 34, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:14:33', '2022-12-25 05:14:33'),
(53, 35, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:15:02', '2022-12-25 05:15:02'),
(54, 36, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:15:18', '2022-12-25 05:15:18'),
(55, 37, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:17:45', '2022-12-25 05:17:45'),
(56, 38, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:18:26', '2022-12-25 05:18:26'),
(57, 39, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:19:48', '2022-12-25 05:19:48'),
(58, 40, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:38:41', '2022-12-25 05:38:41'),
(59, 41, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:39:24', '2022-12-25 05:39:24'),
(60, 42, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:40:43', '2022-12-25 05:40:43'),
(61, 43, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:41:20', '2022-12-25 05:41:20'),
(62, 44, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:42:11', '2022-12-25 05:42:11'),
(63, 45, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:42:23', '2022-12-25 05:42:23'),
(64, 46, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:42:58', '2022-12-25 05:42:58'),
(65, 47, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:44:10', '2022-12-25 05:44:10'),
(66, 48, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:44:49', '2022-12-25 05:44:49'),
(67, 49, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:46:21', '2022-12-25 05:46:21'),
(68, 50, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:47:07', '2022-12-25 05:47:07'),
(69, 51, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:47:40', '2022-12-25 05:47:40'),
(70, 52, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:50:51', '2022-12-25 05:50:51'),
(71, 53, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:54:52', '2022-12-25 05:54:52'),
(72, 54, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 05:56:11', '2022-12-25 05:56:11'),
(131, 83, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-01-26 10:54:22', '2023-01-26 10:54:22'),
(132, 82, 1, NULL, 1.00, 1000.00, 50.00, NULL, NULL, 0.00, 950.00, 1, '2023-01-26 10:56:17', '2023-01-26 10:56:17'),
(75, 57, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 06:07:38', '2022-12-25 06:07:38'),
(76, 58, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 06:10:39', '2022-12-25 06:10:39'),
(77, 59, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-25 06:11:52', '2022-12-25 06:11:52'),
(78, 60, 1, 'agf', 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-26 05:33:35', '2022-12-26 05:33:35'),
(79, 61, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-28 04:51:03', '2022-12-28 04:51:03'),
(80, 62, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-28 05:09:31', '2022-12-28 05:09:31'),
(81, 63, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-28 05:10:40', '2022-12-28 05:10:40'),
(83, 65, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-28 05:14:03', '2022-12-28 05:14:03'),
(84, 66, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-28 06:51:29', '2022-12-28 06:51:29'),
(139, 67, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-02-01 05:04:13', '2023-02-01 05:04:13'),
(86, 68, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-29 04:46:40', '2022-12-29 04:46:40'),
(87, 69, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2022-12-29 04:58:05', '2022-12-29 04:58:05'),
(88, 70, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-01-01 05:27:07', '2023-01-01 05:27:07'),
(136, 71, 5, NULL, 1.00, 20000.00, 0.00, NULL, NULL, 1000.00, 20000.00, 1, '2023-01-28 10:21:01', '2023-01-28 10:21:01'),
(135, 72, 5, NULL, 1.00, 20000.00, 0.00, NULL, NULL, 0.00, 20000.00, 1, '2023-01-28 09:58:56', '2023-01-28 09:58:56'),
(134, 73, 1, NULL, 1.00, 1000.00, 25.00, NULL, NULL, 48.75, 975.00, 1, '2023-01-26 10:58:09', '2023-01-26 10:58:09'),
(130, 84, 5, NULL, 1.00, 20000.00, 0.00, NULL, NULL, 0.00, 20000.00, 1, '2023-01-26 10:52:45', '2023-01-26 10:52:45'),
(133, 75, 5, NULL, 1.00, 20000.00, 0.00, NULL, NULL, 2.00, 20000.00, 1, '2023-01-26 10:57:10', '2023-01-26 10:57:10'),
(94, 76, 6, NULL, 1.00, 8000.00, 0.00, NULL, NULL, 0.00, 8000.00, 2, '2023-01-02 07:01:28', '2023-01-02 07:01:28'),
(95, 77, 6, NULL, 1.00, 8000.00, 0.00, NULL, NULL, 0.00, 8000.00, 2, '2023-01-02 07:12:33', '2023-01-02 07:12:33'),
(129, 84, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-01-26 10:52:45', '2023-01-26 10:52:45'),
(99, 81, 6, NULL, 1.00, 8000.00, 0.00, NULL, NULL, 0.00, 8000.00, 2, '2023-01-02 07:31:47', '2023-01-02 07:31:47'),
(98, 80, 6, NULL, 1.00, 8000.00, 0.00, NULL, NULL, 0.00, 8000.00, 2, '2023-01-02 07:28:14', '2023-01-02 07:28:14'),
(128, 85, 1, NULL, 2.00, 1000.00, 0.00, NULL, NULL, 0.00, 2000.00, 1, '2023-01-26 10:52:01', '2023-01-26 10:52:01'),
(119, 86, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-01-25 10:37:26', '2023-01-25 10:37:26'),
(113, 87, 1, NULL, 1.00, 1000.00, 0.00, NULL, NULL, 0.00, 1000.00, 1, '2023-01-22 09:49:42', '2023-01-22 09:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_taxes`
--

CREATE TABLE `invoice_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint NOT NULL,
  `invoice_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_item_taxes`
--

INSERT INTO `invoice_item_taxes` (`id`, `invoice_id`, `invoice_item_id`, `tax_id`, `name`, `amount`, `company_id`, `created_at`, `updated_at`) VALUES
(6, 9, 28, 1, 'Road Tax @ 5.00%', 49.90, 1, '2022-12-20 10:47:16', '2022-12-20 10:47:16'),
(2, 11, 14, 1, 'Road Tax @ 5.00%', 49.75, 1, '2022-12-17 10:58:22', '2022-12-17 10:58:22'),
(5, 12, 19, 1, 'Road Tax @ 5.00%', 49.75, 1, '2022-12-18 09:39:43', '2022-12-18 09:39:43'),
(20, 71, 136, 1, 'Road Tax @ 5.00%', 1000.00, 1, '2023-01-28 10:21:01', '2023-01-28 10:21:01'),
(19, 73, 134, 1, 'Road Tax @ 5.00%', 48.75, 1, '2023-01-26 10:58:09', '2023-01-26 10:58:09'),
(18, 75, 133, 2, 'Extra Police @ 2.00', 2.00, 1, '2023-01-26 10:57:10', '2023-01-26 10:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_templates`
--

CREATE TABLE `invoice_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `img`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'lorem Ipsum is simply dummy text of the', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\'</p>', 'blog_1705504461.png', 1, '2022-11-01 05:02:37', '2024-01-21 23:52:29'),
(2, 'It is a long established fact that a reader will', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from</p>', 'img1705902763.png', 1, '2022-12-08 06:02:51', '2024-01-21 23:52:43'),
(5, 'There are many variations of passages of Lorem', '<p>popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from</p>', 'img1705902777.png', 1, '2022-12-14 07:17:05', '2024-01-21 23:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted_lead` int DEFAULT NULL,
  `lead_status_id` bigint NOT NULL,
  `lead_source_id` bigint NOT NULL,
  `assigned_user_id` bigint NOT NULL,
  `created_user_id` bigint NOT NULL,
  `contact_date` date NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `company_name`, `email`, `converted_lead`, `lead_status_id`, `lead_source_id`, `assigned_user_id`, `created_user_id`, `contact_date`, `phone`, `website`, `country`, `currency`, `vat_id`, `reg_no`, `city`, `state`, `zip`, `address`, `custom_fields`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test', NULL, NULL, 1, 1, 8, 2, '2022-12-31', '01723231234', 'test.com', 'Bangladesh', 'BDT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-12-19 08:35:46', '2022-12-19 08:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `title`, `order`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'TYest', NULL, 1, '2022-12-19 08:34:32', '2022-12-19 08:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `lead_statuses`
--

CREATE TABLE `lead_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_statuses`
--

INSERT INTO `lead_statuses` (`id`, `title`, `color`, `order`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', '#642222', 2, 1, '2022-12-19 08:34:11', '2022-12-19 08:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `leave_statuses`
--

CREATE TABLE `leave_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `reference` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_statuses`
--

INSERT INTO `leave_statuses` (`id`, `reference`, `start_date`, `end_date`, `reason`, `contact_id`, `company_id`, `created_at`, `updated_at`) VALUES
(3, 'test', '2023-03-01', '2023-03-05', 'dengue', 7, 1, '2023-03-01 07:17:14', '2023-03-01 07:17:14'),
(6, 'r3ede', '2023-02-28', '2023-03-07', 'diarrhea', 1, 1, '2023-03-01 07:25:07', '2023-03-01 07:25:07'),
(7, 'Cold break', '2023-11-30', '2023-12-04', 'cold break', 14, 1, '2023-11-30 09:49:26', '2023-11-30 09:49:26'),
(8, 'Cold break', '2023-12-01', '2023-12-04', 'cold break', 14, 1, '2023-11-30 09:49:26', '2023-11-30 09:49:26'),
(9, 'Cold break', '2023-12-02', '2023-12-04', 'cold break', 14, 1, '2023-11-30 09:49:26', '2023-11-30 09:49:26'),
(10, 'Cold break', '2023-12-03', '2023-12-04', 'cold break', 14, 1, '2023-11-30 09:49:26', '2023-11-30 09:49:26'),
(11, 'Cold break', '2023-12-04', '2023-12-04', 'cold break', 14, 1, '2023-11-30 09:49:26', '2023-11-30 09:49:26'),
(12, 'test', '2023-12-02', '2023-12-03', 'Fever', 7, 1, '2023-12-02 05:34:39', '2023-12-02 05:34:39'),
(13, 'test', '2023-12-03', '2023-12-03', 'Fever', 7, 1, '2023-12-02 05:34:39', '2023-12-02 05:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_06_01_080940_create_settings_table', 1),
(4, '2018_08_29_084110_create_permissions_table', 1),
(5, '2018_10_28_101819_create_contact_groups_table', 1),
(6, '2018_10_28_104344_create_contacts_table', 1),
(7, '2018_10_28_151911_create_taxs_table', 1),
(8, '2018_10_29_095644_create_items_table', 1),
(9, '2018_10_29_100449_create_products_table', 1),
(10, '2018_10_29_101301_create_services_table', 1),
(11, '2018_10_29_101756_create_suppliers_table', 1),
(12, '2018_11_12_152015_create_email_templates_table', 1),
(13, '2018_11_13_063551_create_accounts_table', 1),
(14, '2018_11_13_082226_create_chart_of_accounts_table', 1),
(15, '2018_11_13_082512_create_payment_methods_table', 1),
(16, '2018_11_13_141249_create_transactions_table', 1),
(17, '2018_11_14_134254_create_repeating_transactions_table', 1),
(18, '2018_11_17_142037_create_payment_histories_table', 1),
(19, '2019_03_07_084028_create_purchase_orders_table', 1),
(20, '2019_03_07_085537_create_purchase_order_items_table', 1),
(21, '2019_03_19_070903_create_current_stocks_table', 1),
(22, '2019_03_19_123527_create_company_settings_table', 1),
(23, '2019_03_19_133922_create_product_units_table', 1),
(24, '2019_03_20_113605_create_invoices_table', 1),
(25, '2019_03_20_113618_create_invoice_items_table', 1),
(26, '2019_05_11_080519_create_purchase_return_table', 1),
(27, '2019_05_11_080546_create_purchase_return_items_table', 1),
(28, '2019_05_27_153656_create_quotations_table', 1),
(29, '2019_05_27_153712_create_quotation_items_table', 1),
(30, '2019_06_22_062221_create_sales_return_table', 1),
(31, '2019_06_22_062233_create_sales_return_items_table', 1),
(32, '2019_06_23_055645_create_company_email_template_table', 1),
(33, '2019_10_31_172912_create_social_google_accounts_table', 1),
(34, '2019_11_04_133151_create_chat_messages_table', 1),
(35, '2019_11_07_105822_create_chat_groups_table', 1),
(36, '2019_11_08_063856_create_chat_group_users', 1),
(37, '2019_11_08_143329_create_group_chat_messages_table', 1),
(38, '2019_11_08_143607_create_group_chat_message_status_table', 1),
(39, '2019_11_11_170656_create_file_manager_table', 1),
(40, '2020_03_15_154649_create_currency_rates_table', 1),
(41, '2020_03_21_052934_create_companies_table', 1),
(42, '2020_03_21_070022_create_packages_table', 1),
(43, '2020_04_02_155956_create_cm_features_table', 1),
(44, '2020_04_02_160209_create_cm_faqs_table', 1),
(45, '2020_04_02_160249_create_cm_email_subscribers_table', 1),
(46, '2020_05_18_104400_create_invoice_templates_table', 1),
(47, '2020_05_24_152947_create_lead_statuses_table', 1),
(48, '2020_05_24_153000_create_lead_sources_table', 1),
(49, '2020_05_24_153224_create_leads_table', 1),
(50, '2020_06_03_112519_create_files_table', 1),
(51, '2020_06_03_112538_create_notes_table', 1),
(52, '2020_06_03_112553_create_activity_logs_table', 1),
(53, '2020_06_22_083001_create_projects_table', 1),
(54, '2020_06_22_095143_create_project_members_table', 1),
(55, '2020_06_23_083455_create_project_milestones_table', 1),
(56, '2020_06_23_112159_create_task_statuses_table', 1),
(57, '2020_06_23_144512_create_tasks_table', 1),
(58, '2020_06_25_065937_create_timesheets_table', 1),
(59, '2020_06_27_152210_create_notifications_table', 1),
(60, '2020_08_21_063443_add_related_to_company_email_template', 1),
(61, '2020_10_19_082621_create_staff_roles_table', 1),
(62, '2020_10_20_080849_add_description_to_invoice_items', 1),
(63, '2020_12_13_150320_create_invoice_item_taxes_table', 1),
(64, '2020_12_15_055832_create_quotation_item_taxes_table', 1),
(65, '2020_12_15_102722_create_purchase_order_item_taxes_table', 1),
(66, '2020_12_16_070412_create_purchase_return_item_taxes_table', 1),
(67, '2020_12_17_065847_create_sales_return_item_taxes_table', 1),
(71, '2022_12_03_091435_create_drivers_table', 2),
(72, '2022_12_10_051911_create_vehicle_types_table', 2),
(73, '2022_12_11_062858_create_vehicles_table', 2),
(75, '2022_12_21_115955_create_s_m_s_table', 3),
(76, '2019_11_27_040657_create_divisions_table', 4),
(77, '2019_11_27_040723_create_districts_table', 4),
(78, '2019_11_27_040803_create_upazilas_table', 4),
(79, '2023_01_31_044830_create_fuels_table', 5),
(80, '2014_10_12_100000_create_password_reset_tokens_table', 6),
(81, '2019_08_19_000000_create_failed_jobs_table', 6),
(82, '2019_12_14_000001_create_personal_access_tokens_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint UNSIGNED NOT NULL,
  `related_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT '1' COMMENT '0 = Deactive | 1 = Active',
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `body`, `status`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 'Test Notice', 'School will be closed tomorrow', 1, 1, '2023-03-13 06:32:27', '2023-03-13 06:32:27'),
(3, 'Exam Notice', 'Exam will starts from 22/02/23', 1, 1, '2023-03-13 06:33:00', '2023-03-13 06:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `user_id`, `read_at`, `created_at`, `updated_at`) VALUES
('94165480-4249-44ac-b237-832a7ab7c5bb', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":3,\"url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"client_url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1003\"}', 2, NULL, '2022-12-14 08:30:34', '2022-12-14 08:30:34'),
('d5b2596d-fe97-465d-8587-358fb38dc547', 'App\\Notifications\\ProjectCreated', 'App\\User', 2, '{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Created New Project\",\"content\":\"Project 1# Test\"}', 2, '2022-12-15 11:04:18', '2022-12-14 08:50:17', '2022-12-15 11:04:18'),
('fa301d17-b8e2-4524-bcd2-2355c5bea446', 'App\\Notifications\\ProjectCreated', 'App\\User', 8, '{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Created New Project\",\"content\":\"Project 1# Test\"}', 2, NULL, '2022-12-14 08:50:17', '2022-12-14 08:50:17'),
('fa6c2acf-7108-4a87-981d-e1baafee942c', 'App\\Notifications\\ProjectUpdated', 'App\\User', 2, '{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Updated Project\",\"content\":\"Project 1# Test\"}', 2, '2022-12-15 11:04:03', '2022-12-14 08:53:06', '2022-12-15 11:04:03'),
('80842890-f73b-445c-a454-db7d8dcaccfa', 'App\\Notifications\\ProjectUpdated', 'App\\User', 8, '{\"id\":1,\"url\":\"projects\\/1\",\"client_url\":\"client\\/projects\\/1\",\"title\":\"Updated Project\",\"content\":\"Project 1# Test\"}', 2, NULL, '2022-12-14 08:53:06', '2022-12-14 08:53:06'),
('d60ff09f-9af0-44c7-901a-6f7b71547314', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":6,\"url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"client_url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1006\"}', 2, NULL, '2022-12-15 09:20:22', '2022-12-15 09:20:22'),
('40f798a0-0a90-40f8-8f8b-64559cdd0781', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":10,\"url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"client_url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1010\"}', 2, NULL, '2022-12-17 09:23:56', '2022-12-17 09:23:56'),
('a933c303-3079-4a84-bc23-45dc7f542b11', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":11,\"url\":\"client\\/view_invoice\\/6512bd43d9caa6e02c990b0a82652dca\",\"client_url\":\"client\\/view_invoice\\/6512bd43d9caa6e02c990b0a82652dca\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1011\"}', 2, NULL, '2022-12-17 10:58:22', '2022-12-17 10:58:22'),
('cb52910e-73e5-4302-a5f5-10e19ac63e46', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1012\"}', 2, NULL, '2022-12-18 06:07:50', '2022-12-18 06:07:50'),
('68f058fd-fe49-4795-97e7-352b3c05f8a8', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}', 2, NULL, '2022-12-18 07:08:16', '2022-12-18 07:08:16'),
('1457186c-31e6-457d-b612-16f60abac897', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}', 2, NULL, '2022-12-18 07:09:43', '2022-12-18 07:09:43'),
('496d2189-b43c-4d1e-b747-aa61c888064f', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":12,\"url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"client_url\":\"client\\/view_invoice\\/c20ad4d76fe97759aa27a0c99bff6710\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1012\"}', 2, NULL, '2022-12-18 09:39:43', '2022-12-18 09:39:43'),
('577e138c-1137-4f7a-8020-7805407e8598', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":13,\"url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"client_url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1013\"}', 2, NULL, '2022-12-18 11:34:23', '2022-12-18 11:34:23'),
('647f1c82-5f55-4dc1-b1aa-81396cdeeddd', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":13,\"url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"client_url\":\"client\\/view_invoice\\/c51ce410c124a10e0db5e4b97fc2af39\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1013\"}', 2, NULL, '2022-12-18 11:50:31', '2022-12-18 11:50:31'),
('bef194ef-28ce-4c96-81da-bd75b0182289', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":3,\"url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"client_url\":\"client\\/view_invoice\\/eccbc87e4b5ce2fe28308fd9f2a7baf3\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}', 2, NULL, '2022-12-20 10:39:28', '2022-12-20 10:39:28'),
('27db471c-1764-4385-bd40-09a404cf3ed8', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":1,\"url\":\"client\\/view_invoice\\/c4ca4238a0b923820dcc509a6f75849b\",\"client_url\":\"client\\/view_invoice\\/c4ca4238a0b923820dcc509a6f75849b\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1001\"}', 2, NULL, '2022-12-20 10:42:23', '2022-12-20 10:42:23'),
('21d59e01-96e3-4645-a510-fc71f74261fe', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":6,\"url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"client_url\":\"client\\/view_invoice\\/1679091c5a880faf6fb5e6087eb1b2dc\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1006\"}', 2, NULL, '2022-12-20 10:44:39', '2022-12-20 10:44:39'),
('60f2cc92-1bba-492f-991b-98330043818f', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":10,\"url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"client_url\":\"client\\/view_invoice\\/d3d9446802a44259755d38e6d163e820\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1010\"}', 2, NULL, '2022-12-20 10:48:12', '2022-12-20 10:48:12'),
('f395e279-2c19-463a-9fe3-a5efdbb320ec', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":16,\"url\":\"client\\/view_invoice\\/c74d97b01eae257e44aa9d5bade97baf\",\"client_url\":\"client\\/view_invoice\\/c74d97b01eae257e44aa9d5bade97baf\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1014\"}', 2, '2022-12-21 06:29:01', '2022-12-21 06:28:47', '2022-12-21 06:29:01'),
('40fe482e-872a-4f3a-b01d-82d396bbf5b9', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":14,\"url\":\"client\\/view_invoice\\/aab3238922bcc25a6f606eb525ffdc56\",\"client_url\":\"client\\/view_invoice\\/aab3238922bcc25a6f606eb525ffdc56\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1014\"}', 2, '2022-12-21 06:39:21', '2022-12-21 06:33:39', '2022-12-21 06:39:21'),
('66c6f895-e3ce-48dd-9e3d-d18d172bf750', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":15,\"url\":\"client\\/view_invoice\\/9bf31c7ff062936a96d3c8bd1f8f2ff3\",\"client_url\":\"client\\/view_invoice\\/9bf31c7ff062936a96d3c8bd1f8f2ff3\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1014\"}', 2, '2022-12-21 06:40:29', '2022-12-21 06:35:45', '2022-12-21 06:40:29'),
('27d02035-3151-4ee7-9665-ce09bd3982cf', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1017\"}', 2, '2022-12-21 06:39:58', '2022-12-21 06:36:54', '2022-12-21 06:39:58'),
('dd9d2461-01af-4a6c-a85d-0d1dc176a187', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1017\"}', 2, '2022-12-21 06:40:14', '2022-12-21 06:37:24', '2022-12-21 06:40:14'),
('80ede486-3ecc-4b6c-9657-2bf484056864', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":17,\"url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"client_url\":\"client\\/view_invoice\\/70efdf2ec9b086079795c442636b55fb\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1017\"}', 2, '2022-12-21 06:39:49', '2022-12-21 06:37:38', '2022-12-21 06:39:49'),
('f1d71a15-a2e0-4bf0-ace4-d0a0095768b7', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":18,\"url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"client_url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1018\"}', 2, NULL, '2022-12-21 09:17:55', '2022-12-21 09:17:55'),
('6029dcff-61ba-4cb1-9540-9e93143ebb53', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":18,\"url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"client_url\":\"client\\/view_invoice\\/6f4922f45568161a8cdf4ad2299f6d23\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# 1018\"}', 2, '2022-12-22 05:18:46', '2022-12-21 09:17:55', '2022-12-22 05:18:46'),
('93346288-ffd4-4e1f-a947-c512e38984b8', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":19,\"url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"client_url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1019\"}', 2, NULL, '2022-12-24 05:50:32', '2022-12-24 05:50:32'),
('94bfc74d-a35e-4f32-86a3-40cc42d2e546', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":19,\"url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"client_url\":\"client\\/view_invoice\\/1f0e3dad99908345f7439f8ffabdffc4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1019\"}', 2, NULL, '2022-12-24 05:50:32', '2022-12-24 05:50:32'),
('3cba59e2-294b-480b-acef-c429505515bb', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":20,\"url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"client_url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:17:29', '2022-12-25 04:17:29'),
('d72495eb-4596-45af-a62d-ecca52af4376', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":20,\"url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"client_url\":\"client\\/view_invoice\\/98f13708210194c475687be6106a3b84\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:17:29', '2022-12-25 04:17:29'),
('596de77b-4220-4742-a03d-aead89382083', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":21,\"url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"client_url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:52:24', '2022-12-25 04:52:24'),
('11f197c2-5829-40a7-9f03-3f7307290b25', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":21,\"url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"client_url\":\"client\\/view_invoice\\/3c59dc048e8850243be8079a5c74d079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:12', '2022-12-25 04:52:24', '2022-12-26 04:37:12'),
('0b053c06-cdf4-4d21-8ca8-055fd24a4971', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":22,\"url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"client_url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:54:04', '2022-12-25 04:54:04'),
('ce9a2c1b-0dd4-4ded-9e08-43c5961293a7', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":22,\"url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"client_url\":\"client\\/view_invoice\\/b6d767d2f8ed5d21a44b0e5886680cb9\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:19', '2022-12-25 04:54:04', '2022-12-26 04:37:19'),
('cdadb0a4-c1df-461a-9df6-b425dc34027e', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":23,\"url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"client_url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:55:03', '2022-12-25 04:55:03'),
('1c376145-7536-497b-abfb-659fba4d447f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":23,\"url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"client_url\":\"client\\/view_invoice\\/37693cfc748049e45d87b8c7d8b9aacd\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:25', '2022-12-25 04:55:03', '2022-12-26 04:37:25'),
('ecb22514-639e-4cc2-a680-4001e9cb1f2a', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":24,\"url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"client_url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:55:35', '2022-12-25 04:55:35'),
('faa2ade6-831d-483d-b18e-02fafca7642c', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":24,\"url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"client_url\":\"client\\/view_invoice\\/1ff1de774005f8da13f42943881c655f\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:31', '2022-12-25 04:55:35', '2022-12-26 04:37:31'),
('803e3a65-9136-4a48-b1f8-feb1950808d3', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":25,\"url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"client_url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 04:56:59', '2022-12-25 04:56:59'),
('7f3d2a07-342d-42cc-82f4-f46f6d7c8aff', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":25,\"url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"client_url\":\"client\\/view_invoice\\/8e296a067a37563370ded05f5a3bf3ec\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:48', '2022-12-25 04:56:59', '2022-12-26 04:37:48'),
('3b80ffc0-b6b3-4ef4-a910-3d96fb6d9ef4', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":49,\"url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"client_url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 05:46:21', '2022-12-25 05:46:21'),
('792760d5-09b6-4178-96b6-0ba98b408c82', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":49,\"url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"client_url\":\"client\\/view_invoice\\/f457c545a9ded88f18ecee47145a72c0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-26 04:37:42', '2022-12-25 05:46:21', '2022-12-26 04:37:42'),
('3eea9ada-a013-4935-baff-57f47a3368bb', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":50,\"url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"client_url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 05:47:07', '2022-12-25 05:47:07'),
('23bf0dda-5fa5-4e37-b258-6c7d2b768c36', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":50,\"url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"client_url\":\"client\\/view_invoice\\/c0c7c76d30bd3dcaefc96f40275bdc0a\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-25 06:01:23', '2022-12-25 05:47:07', '2022-12-25 06:01:23'),
('5e8da4dc-754a-4f71-a301-7c86e0dacbfc', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":51,\"url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"client_url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, NULL, '2022-12-25 05:47:40', '2022-12-25 05:47:40'),
('beafe61e-ace7-42d2-9e25-89b5ae90c7e9', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":51,\"url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"client_url\":\"client\\/view_invoice\\/2838023a778dfaecdc212708f721b788\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1020\"}', 2, '2022-12-25 05:49:19', '2022-12-25 05:47:40', '2022-12-25 05:49:19'),
('fe5f2bef-2002-4e71-bf4e-93dec906b1d9', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":52,\"url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"client_url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1052\"}', 2, NULL, '2022-12-25 05:50:51', '2022-12-25 05:50:51'),
('1854d665-db7d-4974-b60e-f27f352d58dd', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":52,\"url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"client_url\":\"client\\/view_invoice\\/9a1158154dfa42caddbd0694a4e9bdc8\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1052\"}', 2, '2022-12-25 06:00:08', '2022-12-25 05:50:51', '2022-12-25 06:00:08'),
('1554dae8-c5eb-43d6-826f-540758caa1a7', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":53,\"url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"client_url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1053\"}', 2, NULL, '2022-12-25 05:54:52', '2022-12-25 05:54:52'),
('c66af9ce-b111-460d-a2b0-906cd0e70a9e', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":53,\"url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"client_url\":\"client\\/view_invoice\\/d82c8d1619ad8176d665453cfb2e55f0\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1053\"}', 2, '2022-12-25 06:00:01', '2022-12-25 05:54:52', '2022-12-25 06:00:01'),
('d7ebe3fe-fc10-4c68-bf36-7e9420f1234f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":54,\"url\":\"client\\/view_invoice\\/a684eceee76fc522773286a895bc8436\",\"client_url\":\"client\\/view_invoice\\/a684eceee76fc522773286a895bc8436\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}', 2, '2022-12-25 06:01:09', '2022-12-25 05:56:11', '2022-12-25 06:01:09'),
('a4e7a1a5-cf09-4945-b1f9-0072709e40f3', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":55,\"url\":\"client\\/view_invoice\\/b53b3a3d6ab90ce0268229151c9bde11\",\"client_url\":\"client\\/view_invoice\\/b53b3a3d6ab90ce0268229151c9bde11\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}', 2, '2022-12-25 05:59:56', '2022-12-25 05:56:46', '2022-12-25 05:59:56'),
('1c4678d0-2dfa-42db-bc7a-6e42de522414', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":56,\"url\":\"client\\/view_invoice\\/9f61408e3afb633e50cdf1b20de6f466\",\"client_url\":\"client\\/view_invoice\\/9f61408e3afb633e50cdf1b20de6f466\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1054\"}', 2, '2022-12-25 05:57:42', '2022-12-25 05:57:00', '2022-12-25 05:57:42'),
('e206e0b1-820e-4a4f-bf0a-c5d1efa723f0', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":58,\"url\":\"client\\/view_invoice\\/66f041e16a60928b05a7e228a89c3799\",\"client_url\":\"client\\/view_invoice\\/66f041e16a60928b05a7e228a89c3799\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1057\"}', 2, '2022-12-26 04:36:52', '2022-12-25 06:10:39', '2022-12-26 04:36:52'),
('974bcec4-7464-4de7-8708-9d550a22f173', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":59,\"url\":\"client\\/view_invoice\\/093f65e080a295f8076b1c5722a46aa2\",\"client_url\":\"client\\/view_invoice\\/093f65e080a295f8076b1c5722a46aa2\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1059\"}', 2, '2022-12-26 04:37:01', '2022-12-25 06:11:52', '2022-12-26 04:37:01'),
('f980b3ca-085f-49b2-acf6-0b16b97f263a', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":60,\"url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"client_url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1060\"}', 2, '2022-12-27 10:32:54', '2022-12-26 05:33:36', '2022-12-27 10:32:54'),
('64cbd18f-ab8e-4578-b29e-a09ff21e83de', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":60,\"url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"client_url\":\"client\\/view_invoice\\/072b030ba126b2f4b2374f342be9ed44\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1060\"}', 2, '2022-12-27 10:33:01', '2022-12-26 05:55:35', '2022-12-27 10:33:01'),
('c286e30f-a261-4eca-bfef-a20a8d42d210', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":61,\"url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"client_url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1061\"}', 2, NULL, '2022-12-28 04:51:03', '2022-12-28 04:51:03'),
('e9dcdd8b-8ec6-4d42-afb7-0ada51405d91', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":61,\"url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"client_url\":\"client\\/view_invoice\\/7f39f8317fbdb1988ef4c628eba02591\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1061\"}', 2, '2022-12-29 04:22:49', '2022-12-28 04:51:03', '2022-12-29 04:22:49'),
('9843ce4a-9484-42d5-b4a6-f31b239e4684', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":62,\"url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"client_url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, NULL, '2022-12-28 05:09:31', '2022-12-28 05:09:31'),
('5b440dd6-3c9c-4b6b-b771-dabe17cff6db', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":62,\"url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"client_url\":\"client\\/view_invoice\\/44f683a84163b3523afe57c2e008bc8c\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, '2022-12-29 04:26:47', '2022-12-28 05:09:31', '2022-12-29 04:26:47'),
('ae379963-a90e-45b3-a680-85568f1d0139', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":63,\"url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"client_url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, NULL, '2022-12-28 05:10:40', '2022-12-28 05:10:40'),
('cb824827-8160-4d0e-b52f-8707abb86d4a', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":63,\"url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"client_url\":\"client\\/view_invoice\\/03afdbd66e7929b125f8597834fa83a4\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, '2022-12-29 04:19:24', '2022-12-28 05:10:40', '2022-12-29 04:19:24'),
('ebc01edd-683f-4ae7-b5c3-969926b5813f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":64,\"url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"client_url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, NULL, '2022-12-28 05:11:05', '2022-12-28 05:11:05'),
('aae9a9cf-1f53-4b71-8c9c-6d224042ba30', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":64,\"url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"client_url\":\"client\\/view_invoice\\/ea5d2f1c4608232e07d3aa3d998e5135\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1062\"}', 2, '2022-12-29 04:19:14', '2022-12-28 05:11:05', '2022-12-29 04:19:14'),
('23e380d3-6409-45d3-808e-eb6cb4430f3f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":65,\"url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"client_url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1065\"}', 2, NULL, '2022-12-28 05:14:03', '2022-12-28 05:14:03'),
('ea18f903-78e8-47a9-a7c6-5f8e3bd64398', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":65,\"url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"client_url\":\"client\\/view_invoice\\/fc490ca45c00b1249bbe3554a4fdf6fb\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1065\"}', 2, '2022-12-28 05:36:29', '2022-12-28 05:14:03', '2022-12-28 05:36:29'),
('654d91c4-e45f-492a-88d8-e384665975ac', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":66,\"url\":\"client\\/view_invoice\\/3295c76acbf4caaed33c36b1b5fc2cb1\",\"client_url\":\"client\\/view_invoice\\/3295c76acbf4caaed33c36b1b5fc2cb1\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1066\"}', 2, '2022-12-29 04:19:06', '2022-12-28 06:51:29', '2022-12-29 04:19:06'),
('62f4783b-f5ef-4ee9-8a68-28c220a6c6eb', 'App\\Notifications\\InvoiceCreated', 'App\\User', 3, '{\"id\":67,\"url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"client_url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, NULL, '2022-12-28 07:33:31', '2022-12-28 07:33:31'),
('5d066577-8647-4c4e-87c3-9e08a22cdf92', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":67,\"url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"client_url\":\"client\\/view_invoice\\/735b90b4568125ed6c3f678819b6e058\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, '2022-12-29 04:17:35', '2022-12-28 07:33:31', '2022-12-29 04:17:35'),
('5230aef7-01e9-44df-b79b-3717f643ef45', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":68,\"url\":\"c\\/i\\/68\",\"client_url\":\"c\\/i\\/68\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1068\"}', 2, '2022-12-29 04:47:05', '2022-12-29 04:46:41', '2022-12-29 04:47:05'),
('2a12c296-0897-4122-96d8-f35712bb579b', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":69,\"url\":\"c\\/i\\/ATA1069\",\"client_url\":\"c\\/i\\/ATA1069\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1069\"}', 2, '2022-12-29 04:58:11', '2022-12-29 04:58:05', '2022-12-29 04:58:11'),
('5a537980-2686-47b7-a0ba-bafb4e631cf1', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":70,\"url\":\"c\\/i\\/ATA1070\",\"client_url\":\"c\\/i\\/ATA1070\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1070\"}', 2, '2023-01-01 08:45:56', '2023-01-01 05:27:08', '2023-01-01 08:45:56'),
('0e532485-9fb9-4725-82f2-91d95513f57f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-01 09:39:57', '2023-01-01 06:17:37', '2023-01-01 09:39:57'),
('e634b963-1719-494e-b6b9-918db6fc829d', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, '2023-01-01 09:39:50', '2023-01-01 06:58:38', '2023-01-01 09:39:50'),
('a96db23a-0a83-446a-8a49-f2be02cb25ae', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, '2023-01-02 05:56:36', '2023-01-02 05:43:49', '2023-01-02 05:56:36'),
('d1f38402-49c5-4030-8bdb-d277fc70090f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 5, '{\"id\":77,\"url\":\"c\\/i\\/MTC1002\",\"client_url\":\"c\\/i\\/MTC1002\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1002\"}', 5, NULL, '2023-01-02 07:12:36', '2023-01-02 07:12:36'),
('09d112f9-0f38-4703-83c2-12ea70800f05', 'App\\Notifications\\InvoiceCreated', 'App\\User', 5, '{\"id\":80,\"url\":\"c\\/i\\/MTC1003\",\"client_url\":\"c\\/i\\/MTC1003\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1003\"}', 5, NULL, '2023-01-02 07:28:14', '2023-01-02 07:28:14'),
('08c9c558-8dd8-468a-b65d-907527f31336', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 5, '{\"id\":80,\"url\":\"c\\/i\\/MTC1003\",\"client_url\":\"c\\/i\\/MTC1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# MTC1003\"}', 5, NULL, '2023-01-02 07:29:37', '2023-01-02 07:29:37'),
('18dcb29a-ff2a-4a92-bc08-c6465300a74c', 'App\\Notifications\\InvoiceCreated', 'App\\User', 5, '{\"id\":81,\"url\":\"c\\/i\\/MTC1006\",\"client_url\":\"c\\/i\\/MTC1006\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# MTC1006\"}', 5, NULL, '2023-01-02 07:31:47', '2023-01-02 07:31:47'),
('547a8210-3401-416d-8819-1699e0c99b20', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, '2023-01-07 11:46:25', '2023-01-07 11:32:42', '2023-01-07 11:46:25'),
('7b17d3a0-ffa9-4444-b8f5-fdfe9e231127', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, '2023-01-08 04:05:00', '2023-01-07 11:32:47', '2023-01-08 04:05:00'),
('1863c305-1f35-483c-a809-be93722b0897', 'App\\Notifications\\InvoiceCreated', 'App\\User', 26, '{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1077\"}', 2, NULL, '2023-01-09 04:20:21', '2023-01-09 04:20:21'),
('47aa1f91-2326-41d6-aa84-ec45e2889118', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1077\"}', 2, '2023-01-09 05:04:39', '2023-01-09 04:20:21', '2023-01-09 05:04:39'),
('2aef0ea0-c38b-4915-86e4-7db04ce7559d', 'App\\Notifications\\InvoiceCreated', 'App\\User', 26, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, NULL, '2023-01-09 05:04:23', '2023-01-09 05:04:23'),
('324565eb-a215-41ab-8c81-211d8a7d6b2e', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, '2023-01-09 05:04:29', '2023-01-09 05:04:23', '2023-01-09 05:04:29'),
('b0855cf6-c7f2-422f-921e-c5f74da95b1b', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, NULL, '2023-01-09 06:47:35', '2023-01-09 06:47:35'),
('5d7cbc4c-998d-4aad-838b-7143ef4e272f', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, '2023-01-09 06:52:24', '2023-01-09 06:47:35', '2023-01-09 06:52:24'),
('fa1219de-012f-45fd-9a4f-8c93bbdbe767', 'App\\Notifications\\InvoiceCreated', 'App\\User', 26, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, NULL, '2023-01-09 09:55:24', '2023-01-09 09:55:24'),
('c7a7d9fa-9173-4dc9-a413-203d95d7c9bb', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-09 10:57:17', '2023-01-09 09:55:24', '2023-01-09 10:57:17'),
('1244c76c-8fc8-4299-94f9-264df4b4f8b8', 'App\\Notifications\\InvoiceCreated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-09 11:27:27', '2023-01-09 11:27:27'),
('a254d436-c1f3-4851-b886-b7eedde2ea5e', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 05:17:27', '2023-01-09 11:27:27', '2023-01-10 05:17:27'),
('f376db2b-9f91-47e9-801c-45d52334ece1', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-09 11:27:54', '2023-01-09 11:27:54'),
('cc2f61a3-c39d-46ca-8273-ee8a33ee3c49', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 05:18:01', '2023-01-09 11:27:54', '2023-01-10 05:18:01'),
('3ad5b065-1fe1-441d-a019-940e68aa55c9', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-09 11:28:11', '2023-01-09 11:28:11'),
('2a822c81-b54c-4b03-88a7-1ecd042cfd2a', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 05:17:45', '2023-01-09 11:28:11', '2023-01-10 05:17:45'),
('271f59d1-2191-409b-ac88-8b1898396ca1', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-09 11:28:27', '2023-01-09 11:28:27'),
('06ea92d1-25c8-4a41-827a-bd3b4b68ebd2', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 05:30:11', '2023-01-09 11:28:27', '2023-01-10 05:30:11'),
('df921046-f7b6-450f-a79e-d24a6154c82d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-09 11:29:02', '2023-01-09 11:29:02'),
('4f2d5727-2f4a-475e-9b7c-efef7db71767', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 04:10:14', '2023-01-09 11:29:02', '2023-01-10 04:10:14'),
('d01af875-a200-45b6-b6b0-1c76240c09d9', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, NULL, '2023-01-09 11:37:55', '2023-01-09 11:37:55'),
('d97bd79c-c5b7-4116-816e-efa6fff8cdc7', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-10 04:06:55', '2023-01-09 11:37:55', '2023-01-10 04:06:55'),
('4ce4b794-09f4-4a36-9dd3-e3b5b4f83b11', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-10 05:16:00', '2023-01-10 05:16:00'),
('bfbb0e9d-ac50-44f0-89e3-56e96f21e14d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-10 05:17:18', '2023-01-10 05:16:00', '2023-01-10 05:17:18'),
('e3c3afb8-2d12-4280-bb95-7e7bcbb5483f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 26, '{\"id\":87,\"url\":\"c\\/i\\/ATA1081\",\"client_url\":\"c\\/i\\/ATA1081\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1081\"}', 2, NULL, '2023-01-22 09:49:44', '2023-01-22 09:49:44'),
('ea79374b-702d-4c5e-a139-9cbe8982be3f', 'App\\Notifications\\InvoiceCreated', 'App\\User', 2, '{\"id\":87,\"url\":\"c\\/i\\/ATA1081\",\"client_url\":\"c\\/i\\/ATA1081\",\"title\":\"Created New Invoice\",\"content\":\"Invoice# ATA1081\"}', 2, '2023-01-22 11:44:33', '2023-01-22 09:49:44', '2023-01-22 11:44:33'),
('85998aaa-dc6e-44d7-a89e-b45cec8ceeb3', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 3, '{\"id\":3,\"url\":\"c\\/i\\/1003\",\"client_url\":\"c\\/i\\/1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}', 2, NULL, '2023-01-22 10:05:59', '2023-01-22 10:05:59'),
('bf384833-88f9-4f6c-a6d5-ae0aa1b1933d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":3,\"url\":\"c\\/i\\/1003\",\"client_url\":\"c\\/i\\/1003\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# 1003\"}', 2, '2023-01-22 11:44:27', '2023-01-22 10:05:59', '2023-01-22 11:44:27'),
('05f746c8-96eb-4987-8ab7-e2ec49748534', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-23 06:15:27', '2023-01-23 06:15:27'),
('5ce3d912-7a16-4fbe-9596-f1d8d8eec2a7', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-24 04:30:05', '2023-01-23 06:15:27', '2023-01-24 04:30:05'),
('af49590e-b516-43e4-b652-2a22f5a24520', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-23 06:26:16', '2023-01-23 06:26:16'),
('288d05fb-a713-4180-afc8-8e6cd9f41fcd', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-24 04:29:58', '2023-01-23 06:26:16', '2023-01-24 04:29:58'),
('c524f242-6adf-44a2-a5f9-d0704ee6cc64', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-23 06:36:23', '2023-01-23 06:36:23'),
('9de5580d-3099-449d-8193-39013886611a', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-24 04:29:47', '2023-01-23 06:36:23', '2023-01-24 04:29:47'),
('db35af34-a821-42f9-8a78-fce643d666c1', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-23 06:40:45', '2023-01-23 06:40:45'),
('b150f478-7350-4ef9-a84e-d7a2b788a7ef', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-23 09:17:00', '2023-01-23 06:40:45', '2023-01-23 09:17:00'),
('eb564107-d089-4f65-b577-5f546167eace', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, NULL, '2023-01-25 10:37:26', '2023-01-25 10:37:26'),
('44f90d88-1a18-4a13-970f-752290d2bc50', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-26 06:01:15', '2023-01-25 10:37:26', '2023-01-26 06:01:15'),
('ad411c83-5f38-4aa9-b268-be54b0637f7d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-26 06:01:06', '2023-01-26 05:21:27', '2023-01-26 06:01:06'),
('672cc4e6-4020-482c-8d51-d472dea1b918', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}', 2, '2023-01-26 06:01:01', '2023-01-26 05:41:32', '2023-01-26 06:01:01'),
('1b6eba6c-d2d6-45a9-ab23-09bce633f5a9', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, NULL, '2023-01-26 05:44:55', '2023-01-26 05:44:55'),
('42d1349e-a708-4d36-bd52-10d6aa850dcd', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, '2023-01-26 06:00:56', '2023-01-26 05:44:55', '2023-01-26 06:00:56'),
('2b22c29d-8e38-4834-801b-3c2efe3cc24c', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, NULL, '2023-01-26 05:45:24', '2023-01-26 05:45:24'),
('d2428bf0-80c5-46f8-9d92-74573064c75c', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, '2023-01-26 06:00:51', '2023-01-26 05:45:24', '2023-01-26 06:00:51'),
('0bf1e0ea-189b-4df8-b2ab-f5953ab0757b', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, NULL, '2023-01-26 05:46:22', '2023-01-26 05:46:22'),
('41f6c862-fc74-40e2-9f82-5a21b759d188', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, '2023-01-26 06:00:45', '2023-01-26 05:46:22', '2023-01-26 06:00:45'),
('c32a1fb5-b720-4bbe-afe2-16bfdc838e1e', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, '2023-01-26 06:21:02', '2023-01-26 06:18:27', '2023-01-26 06:21:02'),
('96e418a3-40c6-40d4-ba18-595b74c0342c', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-26 06:19:17', '2023-01-26 06:19:17'),
('1a86f3a3-b4e1-43e2-866d-9e914d7c1797', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-26 06:21:08', '2023-01-26 06:19:17', '2023-01-26 06:21:08'),
('f280c356-2d8e-4e2c-a4e3-7aaf60bd9416', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-26 06:19:42', '2023-01-26 06:19:42'),
('a767d38e-a9f4-46e3-874a-d14cd5da86f6', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-26 06:21:42', '2023-01-26 06:19:42', '2023-01-26 06:21:42'),
('ed967596-747b-4b32-b0c4-f35afe24a57a', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-26 06:20:57', '2023-01-26 06:20:57'),
('9eba70c7-7894-455c-a113-98af6482b2e2', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-26 06:21:46', '2023-01-26 06:20:57', '2023-01-26 06:21:46'),
('37637d9c-6937-4f19-a480-68a24ad71901', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, NULL, '2023-01-26 10:37:04', '2023-01-26 10:37:04'),
('6b1b4809-6397-4fcf-9f90-7024dbf9c4c6', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-28 04:28:47', '2023-01-26 10:37:04', '2023-01-28 04:28:47'),
('dde2e9e7-b100-4e94-80bc-b8d684570c35', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, NULL, '2023-01-26 10:37:43', '2023-01-26 10:37:43'),
('051f75b0-03ef-454a-8524-bf55df7bb198', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-28 04:29:03', '2023-01-26 10:37:43', '2023-01-28 04:29:03'),
('e008c4d5-38dd-4c21-8113-246fa5913385', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, NULL, '2023-01-26 10:52:01', '2023-01-26 10:52:01'),
('f64b41e3-9815-441e-b57a-7744d06d2dde', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":85,\"url\":\"c\\/i\\/ATA1079\",\"client_url\":\"c\\/i\\/ATA1079\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1079\"}', 2, '2023-01-28 04:28:40', '2023-01-26 10:52:01', '2023-01-28 04:28:40'),
('833fb6cb-9065-40c0-8061-f7bd931e9d63', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, NULL, '2023-01-26 10:52:45', '2023-01-26 10:52:45'),
('63dc0f6c-324f-4970-8631-7d90dd8d9674', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":84,\"url\":\"c\\/i\\/ATA1078\",\"client_url\":\"c\\/i\\/ATA1078\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1078\"}', 2, '2023-01-28 04:28:34', '2023-01-26 10:52:45', '2023-01-28 04:28:34'),
('aedab74c-4740-4d10-a30f-8ac325ee9dfd', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}', 2, NULL, '2023-01-26 10:54:22', '2023-01-26 10:54:22'),
('8c023755-6617-4680-bc5b-aaeacbc530f3', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":83,\"url\":\"c\\/i\\/ATA1077\",\"client_url\":\"c\\/i\\/ATA1077\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1077\"}', 2, '2023-01-28 04:28:29', '2023-01-26 10:54:22', '2023-01-28 04:28:29'),
('801b3279-685a-4301-9790-8ea5833f4ced', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, NULL, '2023-01-26 10:56:17', '2023-01-26 10:56:17'),
('8afac1d2-f68d-4fe6-a96c-6c9ebcaf1e8a', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":82,\"url\":\"c\\/i\\/ATA1076\",\"client_url\":\"c\\/i\\/ATA1076\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1076\"}', 2, '2023-01-28 04:28:16', '2023-01-26 10:56:17', '2023-01-28 04:28:16'),
('f1a38d20-c65d-45e9-ba5d-5f620ca7e2b5', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, NULL, '2023-01-26 10:57:10', '2023-01-26 10:57:10'),
('6e6adf5b-b4be-4846-8e99-05b40c8b4234', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":75,\"url\":\"c\\/i\\/ATA1074\",\"client_url\":\"c\\/i\\/ATA1074\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1074\"}', 2, '2023-01-28 04:28:02', '2023-01-26 10:57:10', '2023-01-28 04:28:02'),
('c48d7f15-d2ba-4621-ba14-3888a9a1adc9', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, NULL, '2023-01-26 10:58:09', '2023-01-26 10:58:09');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `user_id`, `read_at`, `created_at`, `updated_at`) VALUES
('4b383386-f88f-4a31-a376-5172e2612e36', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":73,\"url\":\"c\\/i\\/ATA1073\",\"client_url\":\"c\\/i\\/ATA1073\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1073\"}', 2, '2023-01-28 04:27:29', '2023-01-26 10:58:09', '2023-01-28 04:27:29'),
('b97e2cfd-1a44-4305-ac4b-f36b6ad8137d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":86,\"url\":\"c\\/i\\/ATA1080\",\"client_url\":\"c\\/i\\/ATA1080\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1080\"}', 2, '2023-01-28 11:04:00', '2023-01-28 09:56:46', '2023-01-28 11:04:00'),
('9fa3dd20-eeee-4731-88b4-b8d5e855b3c0', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}', 2, NULL, '2023-01-28 09:58:56', '2023-01-28 09:58:56'),
('73cf007b-98da-4717-b5b5-198c1e7930e2', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}', 2, '2023-01-28 11:03:56', '2023-01-28 09:58:56', '2023-01-28 11:03:56'),
('b836e40f-a06f-4d18-bfb3-49377ffba037', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":72,\"url\":\"c\\/i\\/ATA1072\",\"client_url\":\"c\\/i\\/ATA1072\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1072\"}', 2, '2023-01-28 11:03:51', '2023-01-28 10:14:31', '2023-01-28 11:03:51'),
('d0128c7a-77a0-455f-8048-3e4ef11dae68', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 26, '{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}', 2, NULL, '2023-01-28 10:21:01', '2023-01-28 10:21:01'),
('35d7091f-12c8-49d8-86b8-186552974123', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}', 2, '2023-01-28 11:03:46', '2023-01-28 10:21:01', '2023-01-28 11:03:46'),
('5dd70b44-9214-4813-9112-06a2539add64', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":71,\"url\":\"c\\/i\\/ATA1071\",\"client_url\":\"c\\/i\\/ATA1071\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1071\"}', 2, '2023-01-28 11:03:41', '2023-01-28 10:22:10', '2023-01-28 11:03:41'),
('0d8ccdbb-e463-4daa-b0cb-686b6e165f79', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 4, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, NULL, '2023-02-01 04:52:55', '2023-02-01 04:52:55'),
('63317cd8-061b-4565-8f51-46a88ba57dd5', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, '2023-02-01 05:05:03', '2023-02-01 04:52:55', '2023-02-01 05:05:03'),
('fcd925a2-1f61-4da8-a7a5-fb62e9f6ac8d', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 4, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, NULL, '2023-02-01 05:03:44', '2023-02-01 05:03:44'),
('7587815f-7aaf-45d1-843e-5f5ba4c3464a', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, '2023-02-01 05:04:58', '2023-02-01 05:03:44', '2023-02-01 05:04:58'),
('f5699db1-5f2c-4e2e-8ed5-4ded0664d481', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 4, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, NULL, '2023-02-01 05:04:13', '2023-02-01 05:04:13'),
('6b85a03b-61b3-44d6-a19f-d86d852db45b', 'App\\Notifications\\InvoiceUpdated', 'App\\User', 2, '{\"id\":67,\"url\":\"c\\/i\\/ATA1067\",\"client_url\":\"c\\/i\\/ATA1067\",\"title\":\"Updated Invoice\",\"content\":\"Invoice# ATA1067\"}', 2, '2023-02-01 05:04:52', '2023-02-01 05:04:13', '2023-02-01 05:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int UNSIGNED NOT NULL,
  `package_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_per_month` decimal(10,2) NOT NULL,
  `cost_per_year` decimal(10,2) NOT NULL,
  `staff_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicles_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `invoice_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_transaction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `live_chat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_manager` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inventory_module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrm_module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_management_module` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_panel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `others` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `cost_per_month`, `cost_per_year`, `staff_limit`, `contacts_limit`, `vehicles_limit`, `invoice_limit`, `quotation_limit`, `recurring_transaction`, `live_chat`, `file_manager`, `inventory_module`, `pos_module`, `hrm_module`, `payroll_module`, `project_management_module`, `online_payment`, `sms_panel`, `description`, `is_featured`, `others`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 1.00, 1.00, 'N;', 'a:2:{s:7:\"monthly\";s:3:\"500\";s:6:\"yearly\";s:4:\"1000\";}', 'N;', 'N;', 'N;', 'N;', 'N;', 'N;', 'N;', NULL, NULL, NULL, 'N;', 'N;', 'a:2:{s:7:\"monthly\";s:2:\"No\";s:6:\"yearly\";s:3:\"Yes\";}', 'a:2:{s:7:\"monthly\";s:238:\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\";s:6:\"yearly\";s:34:\"<p>Yearly Package is important</p>\";}', 1, NULL, NULL, '2024-01-09 04:01:07'),
(2, 'Standard', 1.00, 1.00, 'N;', 'a:2:{s:7:\"monthly\";s:4:\"1500\";s:6:\"yearly\";s:9:\"Unlimited\";}', 'N;', 'N;', 'N;', 'N;', 'N;', 'N;', 'N;', NULL, NULL, NULL, 'N;', 'N;', 'a:2:{s:7:\"monthly\";s:2:\"No\";s:6:\"yearly\";s:2:\"No\";}', 'a:2:{s:7:\"monthly\";s:27:\"<p>Test Package Monthly</p>\";s:6:\"yearly\";s:26:\"<p>Test Package Yearly</p>\";}', 1, NULL, NULL, '2024-01-09 04:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `company_id` bigint NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `package_id` int NOT NULL,
  `package_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_histories`
--

INSERT INTO `payment_histories` (`id`, `company_id`, `title`, `method`, `currency`, `amount`, `package_id`, `package_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Buy Basic Package', 'Offline', 'BDT', 10.00, 1, 'monthly', 'paid', '2022-11-01 04:24:37', '2022-11-01 04:24:37'),
(2, 2, 'Buy Standard Package', 'Offline', 'BDT', 10000.00, 2, 'yearly', 'paid', '2022-12-06 04:51:16', '2022-12-06 04:51:16'),
(3, 17, 'Buy Standard Package', 'Offline', 'BDT', 10000.00, 2, 'yearly', 'paid', '2023-01-04 06:23:46', '2023-01-04 06:23:46'),
(74, 19, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 10000.00, 2, 'yearly', 'paid', '2023-01-05 06:45:10', '2023-01-05 06:45:20'),
(73, 1, 'Buy Business Plus Package', 'BKash Mobile Banking', 'BDT', 2000.00, 3, 'monthly', 'paid', '2023-01-05 06:34:05', '2023-01-05 06:34:15'),
(72, 1, 'Buy Basic Package', 'BKash Mobile Banking', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-01-05 06:31:14', '2023-01-05 06:31:23'),
(71, 18, 'Buy Business Plus Package', 'BKash Mobile Banking', 'BDT', 2000.00, 3, 'monthly', 'paid', '2023-01-05 06:29:58', '2023-01-05 06:30:09'),
(70, 18, 'Buy Business Plus Package', 'BKash Mobile Banking', 'BDT', 20000.00, 3, 'yearly', 'paid', '2023-01-05 06:27:52', '2023-01-05 06:28:01'),
(69, 18, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 06:25:21', '2023-01-05 06:25:30'),
(68, 18, 'Buy Standard Package', 'City Bank', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 06:23:27', '2023-01-05 06:23:39'),
(67, 18, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 06:16:48', '2023-01-05 06:17:00'),
(66, 18, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 06:12:56', '2023-01-05 06:13:05'),
(76, 1, 'Buy Business Plus Package', 'BKash Mobile Banking', 'BDT', 20000.00, 3, 'yearly', 'paid', '2023-01-07 04:55:43', '2023-01-07 04:55:54'),
(59, 18, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 05:29:18', '2023-01-05 05:32:57'),
(77, 1, 'Buy Business Plus Package', 'Offline', 'BDT', 2000.00, 3, 'monthly', 'paid', '2023-01-11 10:48:18', '2023-01-11 10:48:18'),
(61, 1, 'Buy Basic Package', 'BKash Mobile Banking', 'BDT', 5000.00, 1, 'yearly', 'paid', '2023-01-05 05:35:36', '2023-01-05 05:35:45'),
(62, 1, 'Buy Basic Package', 'QCASH', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-01-05 05:36:54', '2023-01-05 05:39:16'),
(63, 1, 'Buy Basic Package', 'BKash Mobile Banking', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-01-05 05:48:43', '2023-01-05 05:48:52'),
(64, 1, 'Buy Basic Package', 'City Bank', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-01-05 05:51:12', '2023-01-05 05:51:24'),
(65, 18, 'Buy Standard Package', 'BKash Mobile Banking', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-01-05 05:57:39', '2023-01-05 05:57:48'),
(254, 29, 'Buy Basic Package', 'Bkash Payment', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-12-04 07:16:01', '2023-12-04 01:16:41'),
(277, 1, 'Buy Standard Package', '', 'BDT', 1.00, 2, 'monthly', 'pending', '2024-01-09 04:04:42', '2024-01-09 04:04:42'),
(276, 1, 'Buy Standard Package', '', 'BDT', 1000.00, 2, 'monthly', 'pending', '2024-01-09 03:57:32', '2024-01-09 03:57:32'),
(242, 29, 'Buy Basic Package', 'Bkash Payment', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-12-04 05:27:00', '2023-12-03 23:27:36'),
(241, 29, 'Buy Basic Package', 'Bkash Payment', 'BDT', 500.00, 1, 'monthly', 'paid', '2023-12-04 05:17:02', '2023-12-03 23:17:30'),
(238, 31, 'Buy Standard Package', 'Bkash Payment', 'BDT', 10000.00, 2, 'yearly', 'paid', '2023-12-04 05:04:44', '2023-12-03 23:05:24'),
(275, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 09:34:14', '2023-12-11 09:34:14'),
(274, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 09:33:17', '2023-12-11 09:33:17'),
(236, 31, 'Buy Standard Package', 'Bkash Payment', 'BDT', 10000.00, 2, 'yearly', 'paid', '2023-12-04 05:00:58', '2023-12-03 23:01:32'),
(235, 1, 'Buy Standard Package', 'Bkash Payment', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-12-04 04:59:03', '2023-12-03 22:59:33'),
(273, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 09:27:40', '2023-12-11 09:27:40'),
(234, 1, 'Buy Standard Package', 'Bkash Payment', 'BDT', 1000.00, 2, 'monthly', 'paid', '2023-12-04 04:55:40', '2023-12-03 22:56:12'),
(272, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 09:17:09', '2023-12-11 09:17:09'),
(263, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 07:07:42', '2023-12-11 07:07:42'),
(271, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 09:14:06', '2023-12-11 09:14:06'),
(266, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 07:20:12', '2023-12-11 07:20:12'),
(267, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 07:29:53', '2023-12-11 07:29:53'),
(268, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 07:41:06', '2023-12-11 07:41:06'),
(269, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 08:57:27', '2023-12-11 08:57:27'),
(270, 32, 'Buy Basic Package', '', 'BDT', 500.00, 1, 'monthly', 'pending', '2023-12-11 08:59:18', '2023-12-11 08:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2022-11-01 05:06:28', '2022-11-01 05:06:28'),
(2, 'Bank', 1, '2022-12-14 08:42:28', '2022-12-14 08:42:28'),
(3, 'Cash', 2, '2023-01-02 07:11:30', '2023-01-02 07:11:30'),
(4, 'BKash Mobile Banking', 1, '2023-01-07 10:58:07', '2023-01-07 10:58:07'),
(5, 'Nagad', 1, '2023-01-26 05:20:33', '2023-01-26 05:20:33'),
(6, 'DBBL Mobile Banking', 1, '2023-01-26 05:31:50', '2023-01-26 05:31:50'),
(7, 'City Bank', 1, '2023-01-26 06:24:59', '2023-01-26 06:24:59'),
(8, 'TRUST BANK, LTD.', 1, '2023-01-28 09:42:50', '2023-01-28 09:42:50'),
(9, 'EASTERN BANK, LTD.', 1, '2023-01-28 10:11:50', '2023-01-28 10:11:50'),
(10, 'STANDARD CHARTERED BANK', 1, '2023-01-28 10:24:42', '2023-01-28 10:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint NOT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `permission`, `created_at`, `updated_at`) VALUES
(53, 5, 'attendance.subject', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(51, 5, 'list.attendance', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(50, 5, 'attendance', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(49, 5, 'leave_list', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(15, 6, 'contacts.import', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(16, 6, 'contact.leave', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(17, 6, 'show.list', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(18, 6, 'attend.destroy', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(19, 6, 'contacts.send_email', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(20, 6, 'students.index', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(21, 6, 'students.create', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(22, 6, 'students.show', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(23, 6, 'students.edit', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(24, 6, 'students.destroy', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(25, 6, 'leave_list', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(26, 6, 'attendance', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(27, 6, 'list.attendance', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(28, 6, 'attendance.create', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(29, 6, 'attendance.subject', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(30, 6, 'attendance.subject_wise_attendance', '2023-12-10 00:20:32', '2023-12-10 00:20:32'),
(52, 5, 'attendance.create', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(48, 5, 'students.destroy', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(47, 5, 'students.edit', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(46, 5, 'students.show', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(45, 5, 'attend.destroy', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(54, 5, 'attendance.subject_wise_attendance', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(55, 5, 'subjects.index', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(56, 5, 'subjects.create', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(57, 5, 'subjects.show', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(58, 5, 'subjects.edit', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(59, 5, 'subjects.destroy', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(60, 5, 'classes.index', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(61, 5, 'classes.create', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(62, 5, 'classes.show', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(63, 5, 'classes.edit', '2023-12-13 23:25:12', '2023-12-13 23:25:12'),
(64, 5, 'classes.destroy', '2023-12-13 23:25:12', '2023-12-13 23:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `product_cost` decimal(10,2) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `item_id`, `supplier_id`, `product_cost`, `product_price`, `product_unit`, `tax_method`, `tax_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 10.00, 20.00, 'kg', 'exclusive', NULL, 'test', '2022-12-08 06:02:51', '2022-12-08 06:02:51'),
(2, 3, 1, 120.00, 150.00, 'kg', 'exclusive', NULL, 'Test Description', '2022-12-10 09:31:19', '2022-12-10 09:31:19'),
(3, 4, 1, 120.00, 100.00, 'kg', 'exclusive', NULL, NULL, '2022-12-14 05:21:44', '2022-12-14 05:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` bigint UNSIGNED NOT NULL,
  `unit_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_units`
--

INSERT INTO `product_units` (`id`, `unit_name`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'kg', 1, '2022-12-08 06:02:45', '2022-12-08 06:02:45'),
(2, 'Ton', 1, '2023-01-18 07:41:45', '2023-01-18 07:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint NOT NULL,
  `progress` int DEFAULT NULL,
  `billing_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixed_rate` decimal(10,2) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` bigint UNSIGNED NOT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-12-14 08:50:17', '2022-12-14 08:50:17'),
(2, 1, 8, '2022-12-14 08:50:17', '2022-12-14 08:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
--

CREATE TABLE `project_milestones` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `due_date` date NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `project_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint UNSIGNED NOT NULL,
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
  `attachemnt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `order_date`, `supplier_id`, `order_status`, `order_tax_id`, `order_tax`, `order_discount`, `shipping_cost`, `product_total`, `grand_total`, `paid`, `payment_status`, `attachemnt`, `note`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '2022-12-08', 1, 3, NULL, 0.00, 0.00, 5.00, 20.00, 25.00, 25.00, 2, '1670479414storage.zip', NULL, 1, '2022-12-08 06:03:34', '2023-01-07 04:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `product_id`, `description`, `quantity`, `unit_cost`, `discount`, `tax_method`, `tax_id`, `tax_amount`, `sub_total`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'test', 1.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 1, '2023-01-07 04:59:39', '2023-01-07 04:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_item_taxes`
--

CREATE TABLE `purchase_order_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_order_id` bigint NOT NULL,
  `purchase_order_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `id` bigint UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `attachemnt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_return_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_item_taxes`
--

CREATE TABLE `purchase_return_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_return_id` bigint NOT NULL,
  `purchase_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint UNSIGNED NOT NULL,
  `quotation_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_date` date NOT NULL,
  `template` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `related_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `quotation_number`, `quotation_date`, `template`, `grand_total`, `converted_total`, `tax_total`, `note`, `related_to`, `related_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '1001', '2022-12-14', 'classic', 100000.00, 100000.00, 0.00, 'test', 'contacts', 6, 1, '2022-12-14 08:29:01', '2022-12-14 08:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` bigint UNSIGNED NOT NULL,
  `quotation_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_items`
--

INSERT INTO `quotation_items` (`id`, `quotation_id`, `item_id`, `description`, `quantity`, `unit_cost`, `discount`, `tax_method`, `tax_id`, `tax_amount`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 5, NULL, 5.00, 20000.00, 0.00, NULL, NULL, 0.00, 100000.00, '2022-12-14 08:29:01', '2022-12-14 08:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item_taxes`
--

CREATE TABLE `quotation_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `quotation_id` bigint NOT NULL,
  `quotation_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repeating_transactions`
--

CREATE TABLE `repeating_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `status` tinyint DEFAULT '0',
  `trans_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_date`
--

CREATE TABLE `report_date` (
  `id` int NOT NULL,
  `rdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_date`
--

INSERT INTO `report_date` (`id`, `rdate`) VALUES
(1, '2022-09-01'),
(2, '2022-09-02'),
(3, '2022-09-03'),
(4, '2022-09-04'),
(6, '2022-09-05'),
(7, '2022-09-06'),
(8, '2022-09-07'),
(9, '2022-09-08'),
(13, '2022-09-09'),
(14, '2022-09-10'),
(15, '2022-09-11'),
(16, '2022-09-12'),
(17, '2022-09-13'),
(18, '2022-09-14'),
(19, '2022-09-15'),
(20, '2022-09-16'),
(28, '2022-09-17'),
(29, '2022-09-18'),
(30, '2022-09-19'),
(31, '2022-09-20'),
(32, '2022-09-21'),
(33, '2022-09-22'),
(34, '2022-09-23'),
(35, '2022-09-24'),
(36, '2022-09-25'),
(37, '2022-09-26'),
(38, '2022-09-27'),
(39, '2022-09-28'),
(40, '2022-09-29'),
(41, '2022-09-30'),
(42, '2022-10-01'),
(43, '2022-10-02'),
(59, '2022-10-03'),
(60, '2022-10-04'),
(61, '2022-10-05'),
(62, '2022-10-06'),
(63, '2022-10-07'),
(64, '2022-10-08'),
(65, '2022-10-09'),
(66, '2022-10-10'),
(67, '2022-10-11'),
(68, '2022-10-12'),
(69, '2022-10-13'),
(70, '2022-10-14'),
(71, '2022-10-15'),
(72, '2022-10-16'),
(73, '2022-10-17'),
(74, '2022-10-18'),
(75, '2022-10-19'),
(76, '2022-10-20'),
(77, '2022-10-21'),
(78, '2022-10-22'),
(79, '2022-10-23'),
(80, '2022-10-24'),
(81, '2022-10-25'),
(82, '2022-10-26'),
(83, '2022-10-27'),
(84, '2022-10-28'),
(85, '2022-10-29'),
(86, '2022-10-30'),
(87, '2022-10-31'),
(88, '2022-11-01'),
(89, '2022-11-02'),
(90, '2022-11-03'),
(122, '2022-11-04'),
(123, '2022-11-05'),
(124, '2022-11-06'),
(125, '2022-11-07'),
(126, '2022-11-08'),
(127, '2022-11-09'),
(128, '2022-11-10'),
(129, '2022-11-11'),
(130, '2022-11-12'),
(131, '2022-11-13'),
(132, '2022-11-14'),
(133, '2022-11-15'),
(134, '2022-11-16'),
(135, '2022-11-17'),
(136, '2022-11-18'),
(137, '2022-11-19'),
(138, '2022-11-20'),
(139, '2022-11-21'),
(140, '2022-11-22'),
(141, '2022-11-23'),
(142, '2022-11-24'),
(143, '2022-11-25'),
(144, '2022-11-26'),
(145, '2022-11-27'),
(146, '2022-11-28'),
(147, '2022-11-29'),
(148, '2022-11-30'),
(149, '2022-12-01'),
(150, '2022-12-02'),
(151, '2022-12-03'),
(152, '2022-12-04'),
(153, '2022-12-05'),
(154, '2022-12-06'),
(155, '2022-12-07'),
(156, '2022-12-08'),
(157, '2022-12-09'),
(158, '2022-12-10'),
(159, '2022-12-11'),
(160, '2022-12-12'),
(161, '2022-12-13'),
(162, '2022-12-14'),
(163, '2022-12-15'),
(164, '2022-12-16'),
(165, '2022-12-17'),
(166, '2022-12-18'),
(167, '2022-12-19'),
(168, '2022-12-20'),
(169, '2022-12-21'),
(170, '2022-12-22'),
(171, '2022-12-23'),
(172, '2022-12-24'),
(173, '2022-12-25'),
(174, '2022-12-26'),
(175, '2022-12-27'),
(176, '2022-12-28'),
(177, '2022-12-29'),
(178, '2022-12-30'),
(179, '2022-12-31'),
(180, '2023-01-01'),
(181, '2023-01-02'),
(182, '2023-01-03'),
(183, '2023-01-04'),
(184, '2023-01-05'),
(185, '2023-01-06'),
(249, '2023-01-07'),
(250, '2023-01-08'),
(251, '2023-01-09'),
(252, '2023-01-10'),
(253, '2023-01-11'),
(254, '2023-01-12'),
(255, '2023-01-13'),
(256, '2023-01-14'),
(257, '2023-01-15'),
(258, '2023-01-16'),
(259, '2023-01-17'),
(260, '2023-01-18'),
(261, '2023-01-19'),
(262, '2023-01-20'),
(263, '2023-01-21'),
(264, '2023-01-22'),
(265, '2023-01-23'),
(266, '2023-01-24'),
(267, '2023-01-25'),
(268, '2023-01-26'),
(269, '2023-01-27'),
(270, '2023-01-28'),
(271, '2023-01-29'),
(272, '2023-01-30'),
(273, '2023-01-31'),
(274, '2023-02-01'),
(275, '2023-02-02'),
(276, '2023-02-03'),
(277, '2023-02-04'),
(278, '2023-02-05'),
(279, '2023-02-06'),
(280, '2023-02-07'),
(281, '2023-02-08'),
(282, '2023-02-09'),
(283, '2023-02-10'),
(284, '2023-02-11'),
(285, '2023-02-12'),
(286, '2023-02-13'),
(287, '2023-02-14'),
(288, '2023-02-15'),
(289, '2023-02-16'),
(290, '2023-02-17'),
(291, '2023-02-18'),
(292, '2023-02-19'),
(293, '2023-02-20'),
(294, '2023-02-21'),
(295, '2023-02-22'),
(296, '2023-02-23'),
(297, '2023-02-24'),
(298, '2023-02-25'),
(299, '2023-02-26'),
(300, '2023-02-27'),
(301, '2023-02-28'),
(302, '2023-03-01'),
(303, '2023-03-02'),
(304, '2023-03-03'),
(305, '2023-03-04'),
(306, '2023-03-05'),
(307, '2023-03-06'),
(308, '2023-03-07'),
(309, '2023-03-08'),
(310, '2023-03-09'),
(311, '2023-03-10'),
(312, '2023-03-11'),
(313, '2023-03-12'),
(314, '2023-03-13'),
(315, '2023-03-14'),
(316, '2023-03-15'),
(317, '2023-03-16'),
(318, '2023-03-17'),
(319, '2023-03-18'),
(320, '2023-03-19'),
(321, '2023-03-20'),
(322, '2023-03-21'),
(323, '2023-03-22'),
(324, '2023-03-23'),
(325, '2023-03-24'),
(326, '2023-03-25'),
(327, '2023-03-26'),
(328, '2023-03-27'),
(329, '2023-03-28'),
(330, '2023-03-29'),
(331, '2023-03-30'),
(332, '2023-03-31'),
(333, '2023-04-01'),
(334, '2023-04-02'),
(335, '2023-04-03'),
(336, '2023-04-04'),
(337, '2023-04-05'),
(338, '2023-04-06'),
(339, '2023-04-07'),
(340, '2023-04-08'),
(341, '2023-04-09'),
(342, '2023-04-10'),
(343, '2023-04-11'),
(344, '2023-04-12'),
(345, '2023-04-13'),
(346, '2023-04-14'),
(347, '2023-04-15'),
(348, '2023-04-16'),
(349, '2023-04-17'),
(350, '2023-04-18'),
(351, '2023-04-19'),
(352, '2023-04-20'),
(353, '2023-04-21'),
(354, '2023-04-22'),
(355, '2023-04-23'),
(356, '2023-04-24'),
(357, '2023-04-25'),
(358, '2023-04-26'),
(359, '2023-04-27'),
(360, '2023-04-28'),
(361, '2023-04-29'),
(362, '2023-04-30'),
(363, '2023-05-01'),
(364, '2023-05-02'),
(365, '2023-05-03'),
(366, '2023-05-04'),
(367, '2023-05-05'),
(368, '2023-05-06'),
(369, '2023-05-07'),
(370, '2023-05-08'),
(371, '2023-05-09'),
(372, '2023-05-10'),
(373, '2023-05-11'),
(374, '2023-05-12'),
(375, '2023-05-13'),
(376, '2023-05-14'),
(504, '2023-05-15'),
(505, '2023-05-16'),
(506, '2023-05-17'),
(507, '2023-05-18'),
(508, '2023-05-19'),
(509, '2023-05-20'),
(510, '2023-05-21'),
(511, '2023-05-22'),
(512, '2023-05-23'),
(513, '2023-05-24'),
(514, '2023-05-25'),
(515, '2023-05-26'),
(516, '2023-05-27'),
(517, '2023-05-28'),
(518, '2023-05-29'),
(519, '2023-05-30'),
(520, '2023-05-31'),
(521, '2023-06-01'),
(522, '2023-06-02'),
(523, '2023-06-03'),
(524, '2023-06-04'),
(525, '2023-06-05'),
(526, '2023-06-06'),
(527, '2023-06-07'),
(528, '2023-06-08'),
(529, '2023-06-09'),
(530, '2023-06-10'),
(531, '2023-06-11'),
(532, '2023-06-12'),
(533, '2023-06-13'),
(534, '2023-06-14'),
(535, '2023-06-15'),
(536, '2023-06-16'),
(537, '2023-06-17'),
(538, '2023-06-18'),
(539, '2023-06-19'),
(540, '2023-06-20'),
(541, '2023-06-21'),
(542, '2023-06-22'),
(543, '2023-06-23'),
(544, '2023-06-24'),
(545, '2023-06-25'),
(546, '2023-06-26'),
(547, '2023-06-27'),
(548, '2023-06-28'),
(549, '2023-06-29'),
(550, '2023-06-30'),
(551, '2023-07-01'),
(552, '2023-07-02'),
(553, '2023-07-03'),
(554, '2023-07-04'),
(555, '2023-07-05'),
(556, '2023-07-06'),
(557, '2023-07-07'),
(558, '2023-07-08'),
(559, '2023-07-09'),
(560, '2023-07-10'),
(561, '2023-07-11'),
(562, '2023-07-12'),
(563, '2023-07-13'),
(564, '2023-07-14'),
(565, '2023-07-15'),
(566, '2023-07-16'),
(567, '2023-07-17'),
(568, '2023-07-18'),
(569, '2023-07-19'),
(570, '2023-07-20'),
(571, '2023-07-21'),
(572, '2023-07-22'),
(573, '2023-07-23'),
(574, '2023-07-24'),
(575, '2023-07-25'),
(576, '2023-07-26'),
(577, '2023-07-27'),
(578, '2023-07-28'),
(579, '2023-07-29'),
(580, '2023-07-30'),
(581, '2023-07-31'),
(582, '2023-08-01'),
(583, '2023-08-02'),
(584, '2023-08-03'),
(585, '2023-08-04'),
(586, '2023-08-05'),
(587, '2023-08-06'),
(588, '2023-08-07'),
(589, '2023-08-08'),
(590, '2023-08-09'),
(591, '2023-08-10'),
(592, '2023-08-11'),
(593, '2023-08-12'),
(594, '2023-08-13'),
(595, '2023-08-14'),
(596, '2023-08-15'),
(597, '2023-08-16'),
(598, '2023-08-17'),
(599, '2023-08-18'),
(600, '2023-08-19'),
(601, '2023-08-20'),
(602, '2023-08-21'),
(603, '2023-08-22'),
(604, '2023-08-23'),
(605, '2023-08-24'),
(606, '2023-08-25'),
(607, '2023-08-26'),
(608, '2023-08-27'),
(609, '2023-08-28'),
(610, '2023-08-29'),
(611, '2023-08-30'),
(612, '2023-08-31'),
(613, '2023-09-01'),
(614, '2023-09-02'),
(615, '2023-09-03'),
(616, '2023-09-04'),
(617, '2023-09-05'),
(618, '2023-09-06'),
(619, '2023-09-07'),
(620, '2023-09-08'),
(621, '2023-09-09'),
(622, '2023-09-10'),
(623, '2023-09-11'),
(624, '2023-09-12'),
(625, '2023-09-13'),
(626, '2023-09-14'),
(627, '2023-09-15'),
(628, '2023-09-16'),
(629, '2023-09-17'),
(630, '2023-09-18'),
(631, '2023-09-19'),
(632, '2023-09-20'),
(633, '2023-09-21'),
(634, '2023-09-22'),
(635, '2023-09-23'),
(636, '2023-09-24'),
(637, '2023-09-25'),
(638, '2023-09-26'),
(639, '2023-09-27'),
(640, '2023-09-28'),
(641, '2023-09-29'),
(642, '2023-09-30'),
(643, '2023-10-01'),
(644, '2023-10-02'),
(645, '2023-10-03'),
(646, '2023-10-04'),
(647, '2023-10-05'),
(648, '2023-10-06'),
(649, '2023-10-07'),
(650, '2023-10-08'),
(651, '2023-10-09'),
(652, '2023-10-10'),
(653, '2023-10-11'),
(654, '2023-10-12'),
(655, '2023-10-13'),
(656, '2023-10-14'),
(657, '2023-10-15'),
(658, '2023-10-16'),
(659, '2023-10-17'),
(660, '2023-10-18'),
(661, '2023-10-19'),
(662, '2023-10-20'),
(663, '2023-10-21'),
(664, '2023-10-22'),
(665, '2023-10-23'),
(666, '2023-10-24'),
(667, '2023-10-25'),
(668, '2023-10-26'),
(669, '2023-10-27'),
(670, '2023-10-28'),
(671, '2023-10-29'),
(672, '2023-10-30'),
(673, '2023-10-31'),
(674, '2023-11-01'),
(675, '2023-11-02'),
(676, '2023-11-03'),
(677, '2023-11-04'),
(678, '2023-11-05'),
(679, '2023-11-06'),
(680, '2023-11-07'),
(681, '2023-11-08'),
(682, '2023-11-09'),
(683, '2023-11-10'),
(684, '2023-11-11'),
(685, '2023-11-12'),
(686, '2023-11-13'),
(687, '2023-11-14'),
(688, '2023-11-15'),
(689, '2023-11-16'),
(690, '2023-11-17'),
(691, '2023-11-18'),
(692, '2023-11-19'),
(693, '2023-11-20'),
(694, '2023-11-21'),
(695, '2023-11-22'),
(696, '2023-11-23'),
(697, '2023-11-24'),
(698, '2023-11-25'),
(699, '2023-11-26'),
(700, '2023-11-27'),
(701, '2023-11-28'),
(702, '2023-11-29'),
(703, '2023-11-30'),
(704, '2023-12-01'),
(705, '2023-12-02'),
(706, '2023-12-03'),
(707, '2023-12-04'),
(708, '2023-12-05'),
(709, '2023-12-06'),
(710, '2023-12-07'),
(711, '2023-12-08'),
(712, '2023-12-09'),
(713, '2023-12-10'),
(714, '2023-12-11'),
(715, '2023-12-12'),
(716, '2023-12-13'),
(717, '2023-12-14'),
(718, '2023-12-15'),
(719, '2023-12-16'),
(720, '2023-12-17'),
(721, '2023-12-18'),
(722, '2023-12-19'),
(723, '2023-12-20'),
(724, '2023-12-21'),
(725, '2023-12-22'),
(726, '2023-12-23'),
(727, '2023-12-24'),
(728, '2023-12-25'),
(729, '2023-12-26'),
(730, '2023-12-27'),
(731, '2023-12-28'),
(732, '2023-12-29'),
(733, '2023-12-30'),
(734, '2023-12-31'),
(735, '2024-01-01'),
(736, '2024-01-02'),
(737, '2024-01-03'),
(738, '2024-01-04'),
(739, '2024-01-05'),
(740, '2024-01-06'),
(741, '2024-01-07'),
(742, '2024-01-08'),
(743, '2024-01-09'),
(744, '2024-01-10'),
(745, '2024-01-11'),
(746, '2024-01-12'),
(747, '2024-01-13'),
(748, '2024-01-14'),
(749, '2024-01-15'),
(750, '2024-01-16'),
(751, '2024-01-17'),
(752, '2024-01-18'),
(753, '2024-01-19'),
(754, '2024-01-20'),
(755, '2024-01-21'),
(756, '2024-01-22'),
(757, '2024-01-23'),
(758, '2024-01-24'),
(759, '2024-01-25'),
(1015, '2024-01-26'),
(1016, '2024-01-27'),
(1017, '2024-01-28'),
(1018, '2024-01-29'),
(1019, '2024-01-30'),
(1020, '2024-01-31'),
(1021, '2024-02-01'),
(1022, '2024-02-02'),
(1023, '2024-02-03'),
(1024, '2024-02-04'),
(1025, '2024-02-05'),
(1026, '2024-02-06'),
(1027, '2024-02-07'),
(1028, '2024-02-08'),
(1029, '2024-02-09'),
(1030, '2024-02-10'),
(1031, '2024-02-11'),
(1032, '2024-02-12'),
(1033, '2024-02-13'),
(1034, '2024-02-14'),
(1035, '2024-02-15'),
(1036, '2024-02-16'),
(1037, '2024-02-17'),
(1038, '2024-02-18'),
(1039, '2024-02-19'),
(1040, '2024-02-20'),
(1041, '2024-02-21'),
(1042, '2024-02-22'),
(1043, '2024-02-23'),
(1044, '2024-02-24'),
(1045, '2024-02-25'),
(1046, '2024-02-26'),
(1047, '2024-02-27'),
(1048, '2024-02-28'),
(1049, '2024-02-29'),
(1050, '2024-03-01'),
(1051, '2024-03-02'),
(1052, '2024-03-03'),
(1053, '2024-03-04'),
(1054, '2024-03-05'),
(1055, '2024-03-06'),
(1056, '2024-03-07'),
(1057, '2024-03-08'),
(1058, '2024-03-09'),
(1059, '2024-03-10'),
(1060, '2024-03-11'),
(1061, '2024-03-12'),
(1062, '2024-03-13'),
(1063, '2024-03-14'),
(1064, '2024-03-15'),
(1065, '2024-03-16'),
(1066, '2024-03-17'),
(1067, '2024-03-18'),
(1068, '2024-03-19'),
(1069, '2024-03-20'),
(1070, '2024-03-21'),
(1071, '2024-03-22'),
(1072, '2024-03-23'),
(1073, '2024-03-24'),
(1074, '2024-03-25'),
(1075, '2024-03-26'),
(1076, '2024-03-27'),
(1077, '2024-03-28'),
(1078, '2024-03-29'),
(1079, '2024-03-30'),
(1080, '2024-03-31'),
(1081, '2024-04-01'),
(1082, '2024-04-02'),
(1083, '2024-04-03'),
(1084, '2024-04-04'),
(1085, '2024-04-05'),
(1086, '2024-04-06'),
(1087, '2024-04-07'),
(1088, '2024-04-08'),
(1089, '2024-04-09'),
(1090, '2024-04-10'),
(1091, '2024-04-11'),
(1092, '2024-04-12'),
(1093, '2024-04-13'),
(1094, '2024-04-14'),
(1095, '2024-04-15'),
(1096, '2024-04-16'),
(1097, '2024-04-17'),
(1098, '2024-04-18'),
(1099, '2024-04-19'),
(1100, '2024-04-20'),
(1101, '2024-04-21'),
(1102, '2024-04-22'),
(1103, '2024-04-23'),
(1104, '2024-04-24'),
(1105, '2024-04-25'),
(1106, '2024-04-26'),
(1107, '2024-04-27'),
(1108, '2024-04-28'),
(1109, '2024-04-29'),
(1110, '2024-04-30'),
(1111, '2024-05-01'),
(1112, '2024-05-02'),
(1113, '2024-05-03'),
(1114, '2024-05-04'),
(1115, '2024-05-05'),
(1116, '2024-05-06'),
(1117, '2024-05-07'),
(1118, '2024-05-08'),
(1119, '2024-05-09'),
(1120, '2024-05-10'),
(1121, '2024-05-11'),
(1122, '2024-05-12'),
(1123, '2024-05-13'),
(1124, '2024-05-14'),
(1125, '2024-05-15'),
(1126, '2024-05-16'),
(1127, '2024-05-17'),
(1128, '2024-05-18'),
(1129, '2024-05-19'),
(1130, '2024-05-20'),
(1131, '2024-05-21'),
(1132, '2024-05-22'),
(1133, '2024-05-23'),
(1134, '2024-05-24'),
(1135, '2024-05-25'),
(1136, '2024-05-26'),
(1137, '2024-05-27'),
(1138, '2024-05-28'),
(1139, '2024-05-29'),
(1140, '2024-05-30'),
(1141, '2024-05-31'),
(1142, '2024-06-01'),
(1143, '2024-06-02'),
(1144, '2024-06-03'),
(1145, '2024-06-04'),
(1146, '2024-06-05'),
(1147, '2024-06-06'),
(1148, '2024-06-07'),
(1149, '2024-06-08'),
(1150, '2024-06-09'),
(1151, '2024-06-10'),
(1152, '2024-06-11'),
(1153, '2024-06-12'),
(1154, '2024-06-13'),
(1155, '2024-06-14'),
(1156, '2024-06-15'),
(1157, '2024-06-16'),
(1158, '2024-06-17'),
(1159, '2024-06-18'),
(1160, '2024-06-19'),
(1161, '2024-06-20'),
(1162, '2024-06-21'),
(1163, '2024-06-22'),
(1164, '2024-06-23'),
(1165, '2024-06-24'),
(1166, '2024-06-25'),
(1167, '2024-06-26'),
(1168, '2024-06-27'),
(1169, '2024-06-28'),
(1170, '2024-06-29'),
(1171, '2024-06-30'),
(1172, '2024-07-01'),
(1173, '2024-07-02'),
(1174, '2024-07-03'),
(1175, '2024-07-04'),
(1176, '2024-07-05'),
(1177, '2024-07-06'),
(1178, '2024-07-07'),
(1179, '2024-07-08'),
(1180, '2024-07-09'),
(1181, '2024-07-10'),
(1182, '2024-07-11'),
(1183, '2024-07-12'),
(1184, '2024-07-13'),
(1185, '2024-07-14'),
(1186, '2024-07-15'),
(1187, '2024-07-16'),
(1188, '2024-07-17'),
(1189, '2024-07-18'),
(1190, '2024-07-19'),
(1191, '2024-07-20'),
(1192, '2024-07-21'),
(1193, '2024-07-22'),
(1194, '2024-07-23'),
(1195, '2024-07-24'),
(1196, '2024-07-25'),
(1197, '2024-07-26'),
(1198, '2024-07-27'),
(1199, '2024-07-28'),
(1200, '2024-07-29'),
(1201, '2024-07-30'),
(1202, '2024-07-31'),
(1203, '2024-08-01'),
(1204, '2024-08-02'),
(1205, '2024-08-03'),
(1206, '2024-08-04'),
(1207, '2024-08-05'),
(1208, '2024-08-06'),
(1209, '2024-08-07'),
(1210, '2024-08-08'),
(1211, '2024-08-09'),
(1212, '2024-08-10'),
(1213, '2024-08-11'),
(1214, '2024-08-12'),
(1215, '2024-08-13'),
(1216, '2024-08-14'),
(1217, '2024-08-15'),
(1218, '2024-08-16'),
(1219, '2024-08-17'),
(1220, '2024-08-18'),
(1221, '2024-08-19'),
(1222, '2024-08-20'),
(1223, '2024-08-21'),
(1224, '2024-08-22'),
(1225, '2024-08-23'),
(1226, '2024-08-24'),
(1227, '2024-08-25'),
(1228, '2024-08-26'),
(1229, '2024-08-27'),
(1230, '2024-08-28'),
(1231, '2024-08-29'),
(1232, '2024-08-30'),
(1233, '2024-08-31'),
(1234, '2024-09-01'),
(1235, '2024-09-02'),
(1236, '2024-09-03'),
(1237, '2024-09-04'),
(1238, '2024-09-05'),
(1239, '2024-09-06'),
(1240, '2024-09-07'),
(1241, '2024-09-08'),
(1242, '2024-09-09'),
(1243, '2024-09-10'),
(1244, '2024-09-11'),
(1245, '2024-09-12'),
(1246, '2024-09-13'),
(1247, '2024-09-14'),
(1248, '2024-09-15'),
(1249, '2024-09-16'),
(1250, '2024-09-17'),
(1251, '2024-09-18'),
(1252, '2024-09-19'),
(1253, '2024-09-20'),
(1254, '2024-09-21'),
(1255, '2024-09-22'),
(1256, '2024-09-23'),
(1257, '2024-09-24'),
(1258, '2024-09-25'),
(1259, '2024-09-26'),
(1260, '2024-09-27'),
(1261, '2024-09-28'),
(1262, '2024-09-29'),
(1263, '2024-09-30'),
(1264, '2024-10-01'),
(1265, '2024-10-02'),
(1266, '2024-10-03'),
(1267, '2024-10-04'),
(1268, '2024-10-05'),
(1269, '2024-10-06'),
(1270, '2024-10-07'),
(1271, '2024-10-08'),
(1272, '2024-10-09'),
(1273, '2024-10-10'),
(1274, '2024-10-11'),
(1275, '2024-10-12'),
(1276, '2024-10-13'),
(1277, '2024-10-14'),
(1278, '2024-10-15'),
(1279, '2024-10-16'),
(1280, '2024-10-17'),
(1281, '2024-10-18'),
(1282, '2024-10-19'),
(1283, '2024-10-20'),
(1284, '2024-10-21'),
(1285, '2024-10-22'),
(1286, '2024-10-23'),
(1287, '2024-10-24'),
(1288, '2024-10-25'),
(1289, '2024-10-26'),
(1290, '2024-10-27'),
(1291, '2024-10-28'),
(1292, '2024-10-29'),
(1293, '2024-10-30'),
(1294, '2024-10-31'),
(1295, '2024-11-01'),
(1296, '2024-11-02'),
(1297, '2024-11-03'),
(1298, '2024-11-04'),
(1299, '2024-11-05'),
(1300, '2024-11-06'),
(1301, '2024-11-07'),
(1302, '2024-11-08'),
(1303, '2024-11-09'),
(1304, '2024-11-10'),
(1305, '2024-11-11'),
(1306, '2024-11-12'),
(1307, '2024-11-13'),
(1308, '2024-11-14'),
(1309, '2024-11-15'),
(1310, '2024-11-16'),
(1311, '2024-11-17'),
(1312, '2024-11-18'),
(1313, '2024-11-19'),
(1314, '2024-11-20'),
(1315, '2024-11-21'),
(1316, '2024-11-22'),
(1317, '2024-11-23'),
(1318, '2024-11-24'),
(1319, '2024-11-25'),
(1320, '2024-11-26'),
(1321, '2024-11-27'),
(1322, '2024-11-28'),
(1323, '2024-11-29'),
(1324, '2024-11-30'),
(1325, '2024-12-01'),
(1326, '2024-12-02'),
(1327, '2024-12-03'),
(1328, '2024-12-04'),
(1329, '2024-12-05'),
(1330, '2024-12-06'),
(1331, '2024-12-07'),
(1332, '2024-12-08'),
(1333, '2024-12-09'),
(1334, '2024-12-10'),
(1335, '2024-12-11'),
(1336, '2024-12-12'),
(1337, '2024-12-13'),
(1338, '2024-12-14'),
(1339, '2024-12-15'),
(1340, '2024-12-16'),
(1341, '2024-12-17'),
(1342, '2024-12-18'),
(1343, '2024-12-19'),
(1344, '2024-12-20'),
(1345, '2024-12-21'),
(1346, '2024-12-22'),
(1347, '2024-12-23'),
(1348, '2024-12-24'),
(1349, '2024-12-25'),
(1350, '2024-12-26'),
(1351, '2024-12-27'),
(1352, '2024-12-28'),
(1353, '2024-12-29'),
(1354, '2024-12-30'),
(1355, '2024-12-31'),
(1356, '2025-01-01'),
(1357, '2025-01-02'),
(1358, '2025-01-03'),
(1359, '2025-01-04'),
(1360, '2025-01-05'),
(1361, '2025-01-06'),
(1362, '2025-01-07'),
(1363, '2025-01-08'),
(1364, '2025-01-09'),
(1365, '2025-01-10'),
(1366, '2025-01-11'),
(1367, '2025-01-12'),
(1368, '2025-01-13'),
(1369, '2025-01-14'),
(1370, '2025-01-15'),
(1371, '2025-01-16'),
(1372, '2025-01-17'),
(1373, '2025-01-18'),
(1374, '2025-01-19'),
(1375, '2025-01-20'),
(1376, '2025-01-21'),
(1377, '2025-01-22'),
(1378, '2025-01-23'),
(1379, '2025-01-24'),
(1380, '2025-01-25'),
(1381, '2025-01-26'),
(1382, '2025-01-27'),
(1383, '2025-01-28'),
(1384, '2025-01-29'),
(1385, '2025-01-30'),
(1386, '2025-01-31'),
(1387, '2025-02-01'),
(1388, '2025-02-02'),
(1389, '2025-02-03'),
(1390, '2025-02-04'),
(1391, '2025-02-05'),
(1392, '2025-02-06'),
(1393, '2025-02-07'),
(1394, '2025-02-08'),
(1395, '2025-02-09'),
(1396, '2025-02-10'),
(1397, '2025-02-11'),
(1398, '2025-02-12'),
(1399, '2025-02-13'),
(1400, '2025-02-14'),
(1401, '2025-02-15'),
(1402, '2025-02-16'),
(1403, '2025-02-17'),
(1404, '2025-02-18'),
(1405, '2025-02-19'),
(1406, '2025-02-20'),
(1407, '2025-02-21'),
(1408, '2025-02-22'),
(1409, '2025-02-23'),
(1410, '2025-02-24'),
(1411, '2025-02-25'),
(1412, '2025-02-26'),
(1413, '2025-02-27'),
(1414, '2025-02-28'),
(1415, '2025-03-01'),
(1416, '2025-03-02'),
(1417, '2025-03-03'),
(1418, '2025-03-04'),
(1419, '2025-03-05'),
(1420, '2025-03-06'),
(1421, '2025-03-07'),
(1422, '2025-03-08'),
(1423, '2025-03-09'),
(1424, '2025-03-10'),
(1425, '2025-03-11'),
(1426, '2025-03-12'),
(1427, '2025-03-13'),
(1428, '2025-03-14'),
(1429, '2025-03-15'),
(1430, '2025-03-16'),
(1431, '2025-03-17'),
(1432, '2025-03-18'),
(1433, '2025-03-19'),
(1434, '2025-03-20'),
(1435, '2025-03-21'),
(1436, '2025-03-22'),
(1437, '2025-03-23'),
(1438, '2025-03-24'),
(1439, '2025-03-25'),
(1440, '2025-03-26'),
(1441, '2025-03-27'),
(1442, '2025-03-28'),
(1443, '2025-03-29'),
(1444, '2025-03-30'),
(1445, '2025-03-31'),
(1446, '2025-04-01'),
(1447, '2025-04-02'),
(1448, '2025-04-03'),
(1449, '2025-04-04'),
(1450, '2025-04-05'),
(1451, '2025-04-06'),
(1452, '2025-04-07'),
(1453, '2025-04-08'),
(1454, '2025-04-09'),
(1455, '2025-04-10'),
(1456, '2025-04-11'),
(1457, '2025-04-12'),
(1458, '2025-04-13'),
(1459, '2025-04-14'),
(1460, '2025-04-15'),
(1461, '2025-04-16'),
(1462, '2025-04-17'),
(1463, '2025-04-18'),
(1464, '2025-04-19'),
(1465, '2025-04-20'),
(1466, '2025-04-21'),
(1467, '2025-04-22'),
(1468, '2025-04-23'),
(1469, '2025-04-24'),
(1470, '2025-04-25'),
(1471, '2025-04-26'),
(1472, '2025-04-27'),
(1473, '2025-04-28'),
(1474, '2025-04-29'),
(1475, '2025-04-30'),
(1476, '2025-05-01'),
(1477, '2025-05-02'),
(1478, '2025-05-03'),
(1479, '2025-05-04'),
(1480, '2025-05-05'),
(1481, '2025-05-06'),
(1482, '2025-05-07'),
(1483, '2025-05-08'),
(1484, '2025-05-09'),
(1485, '2025-05-10'),
(1486, '2025-05-11'),
(1487, '2025-05-12'),
(1488, '2025-05-13'),
(1489, '2025-05-14'),
(1490, '2025-05-15'),
(1491, '2025-05-16'),
(1492, '2025-05-17'),
(1493, '2025-05-18'),
(1494, '2025-05-19'),
(1495, '2025-05-20'),
(1496, '2025-05-21'),
(1497, '2025-05-22'),
(1498, '2025-05-23'),
(1499, '2025-05-24'),
(1500, '2025-05-25'),
(1501, '2025-05-26'),
(1502, '2025-05-27'),
(1503, '2025-05-28'),
(1504, '2025-05-29'),
(1505, '2025-05-30'),
(1506, '2025-05-31'),
(1507, '2025-06-01'),
(1508, '2025-06-02'),
(1509, '2025-06-03'),
(1510, '2025-06-04'),
(1511, '2025-06-05'),
(1512, '2025-06-06'),
(1513, '2025-06-07'),
(1514, '2025-06-08'),
(1515, '2025-06-09'),
(1516, '2025-06-10'),
(1517, '2025-06-11'),
(1518, '2025-06-12'),
(1519, '2025-06-13'),
(1520, '2025-06-14'),
(1521, '2025-06-15'),
(1522, '2025-06-16'),
(1523, '2025-06-17'),
(1524, '2025-06-18'),
(1525, '2025-06-19'),
(1526, '2025-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `id` bigint UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `customer_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `converted_total` decimal(10,2) DEFAULT NULL,
  `attachemnt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_items`
--

CREATE TABLE `sales_return_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sales_return_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_item_taxes`
--

CREATE TABLE `sales_return_item_taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `sales_return_id` bigint NOT NULL,
  `sales_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `item_id`, `cost`, `tax_method`, `tax_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1000.00, 'exclusive', NULL, NULL, '2022-11-01 05:02:37', '2022-12-14 05:12:03'),
(2, 5, 20000.00, 'exclusive', NULL, NULL, '2022-12-14 07:17:05', '2022-12-14 07:17:05'),
(3, 6, 8000.00, 'exclusive', NULL, NULL, '2023-01-02 06:58:50', '2023-01-02 06:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'mail_type', 'smtp', NULL, '2023-12-19 06:26:37'),
(2, 'backend_direction', 'ltr', NULL, '2023-01-10 06:00:12'),
(3, 'membership_system', 'enabled', NULL, '2023-01-19 09:45:25'),
(4, 'trial_period', '7', NULL, '2023-01-19 09:45:25'),
(5, 'allow_singup', 'yes', NULL, '2023-01-19 09:45:25'),
(6, 'email_verification', 'disabled', NULL, '2023-01-19 09:45:25'),
(7, 'hero_title', 'a:2:{s:6:\"Bangla\";s:8:\"JOBPULSE\";s:7:\"English\";s:8:\"JOBPULSE\";}', NULL, '2024-02-16 18:05:35'),
(8, 'hero_sub_title', 'a:2:{s:6:\"Bangla\";s:49:\"A Place for Students to Find Latest Jobs in Tech.\";s:7:\"English\";s:49:\"A Place for Students to Find Latest Jobs in Tech.\";}', NULL, '2024-02-16 18:05:35'),
(9, 'meta_keywords', 'JobPulse,jobpulse,circular,job,circular', NULL, '2024-02-16 18:04:21'),
(10, 'meta_description', 'A simple, easy to customize, and powerful business platform for managing and tracking job circular, Leads, Customers, Transactions and many more!', NULL, '2024-02-16 18:04:21'),
(11, 'company_name', 'bhetiaa', '2022-10-31 22:11:36', '2024-01-23 14:30:45'),
(12, 'site_title', 'bhetiaa', '2022-10-31 22:11:36', '2024-01-23 14:30:45'),
(13, 'phone', '01309323741', '2022-10-31 22:11:36', '2024-01-23 14:30:45'),
(14, 'email', 'mdm029844@gmail.com', '2022-10-31 22:11:36', '2024-01-23 14:30:45'),
(15, 'timezone', 'Asia/Dhaka', '2022-10-31 22:11:36', '2024-01-23 14:30:45'),
(16, 'language', 'English', '2022-11-01 04:12:42', '2024-01-23 14:30:45'),
(17, 'address', 'Sreepur,Gazipur', '2022-11-01 04:12:42', '2024-01-23 14:30:45'),
(18, 'website_enable', 'yes', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(19, 'website_language_dropdown', 'yes', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(20, 'currency_converter', 'fixer', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(21, 'fixer_api_key', 'tL0X6RUi8hqpPrfVO0U4AZyLqODbe4Dh', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(22, 'date_format', 'd M, Y', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(23, 'time_format', '12', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(24, 'file_manager_file_type_supported', 'png,jpg,jpeg', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(25, 'file_manager_max_upload_size', '2', '2022-11-01 04:13:37', '2023-01-10 06:00:12'),
(26, 'currency', 'BDT', '2022-11-01 04:14:09', '2023-01-19 09:45:25'),
(27, 'currency_position', 'right', '2022-11-01 04:14:09', '2023-01-19 09:45:25'),
(28, 'paypal_active', 'No', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(29, 'paypal_email', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(30, 'paypal_currency', 'USD', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(31, 'stripe_active', 'No', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(32, 'stripe_secret_key', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(33, 'stripe_publishable_key', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(34, 'stripe_currency', 'USD', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(35, 'razorpay_active', 'No', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(36, 'razorpay_key_id', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(37, 'razorpay_secret_key', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(38, 'razorpay_currency', 'INR', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(39, 'paystack_active', 'No', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(40, 'paystack_public_key', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(41, 'paystack_secret_key', '', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(42, 'paystack_currency', 'GHS', '2022-11-01 04:14:21', '2023-01-04 05:06:31'),
(43, 'website_copyright', 'a:2:{s:6:\"Bangla\";s:25:\"Software Bazar Bangladesh\";s:7:\"English\";s:25:\"Software Bazar Bangladesh\";}', '2022-11-01 04:27:25', '2024-02-16 18:05:35'),
(44, 'website_title', 'JobPulse', '2022-11-01 04:27:46', '2024-02-16 18:04:21'),
(45, 'promo_video_url', 'https://www.youtube.com/watch?v=9y927xiDtJo', '2022-11-01 04:29:47', '2024-01-23 13:36:40'),
(46, 'contact_email', 'akandmahfuz@gmail.com', '2022-11-01 04:29:47', '2024-01-23 13:36:40'),
(47, 'logo', 'logo.png', '2022-11-01 05:39:37', '2024-03-05 16:04:26'),
(48, 'favicon', 'file_1706008311.png', '2022-11-01 05:41:14', '2024-01-23 11:11:51'),
(49, 'from_email', 'system@attendance-keeper.com', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(50, 'from_name', 'Attendance Keeper System', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(51, 'smtp_host', 'mail.attendance-keeper.com', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(52, 'smtp_port', '465', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(53, 'smtp_username', 'system@attendance-keeper.com', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(54, 'smtp_password', 'Bangladesh@123', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(55, 'smtp_encryption', 'ssl', '2023-01-03 05:02:37', '2023-12-19 06:26:37'),
(56, 'ssl_email', '', '2023-01-04 05:00:50', '2023-12-04 06:10:15'),
(57, 'ssl_currency', 'BDT', '2023-01-04 05:00:50', '2023-12-04 06:10:15'),
(58, 'ssl_active', 'No', '2023-01-04 05:03:53', '2023-12-04 06:10:15'),
(59, 'ssl_store_id', 'softw63b257c889fa3', NULL, NULL),
(60, 'ssl_store_pswd', 'softw63b257c889fa3@ssl', NULL, NULL),
(61, 'home_banner_image', 'file_1706017000.jpg', '2023-11-06 06:20:09', '2024-01-23 13:36:40'),
(62, 'sub_banner_image', 'file_1706017000.jpg', '2023-11-06 06:20:09', '2024-01-23 13:36:40'),
(63, 'short_description', 'a:2:{s:6:\"Bangla\";s:78:\"<p>Bangladesh handloom education and training Institute Alumni Association</p>\";s:7:\"English\";s:452:\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\";}', '2023-11-12 04:45:35', '2024-02-16 18:05:35'),
(69, 'about_image', 'file_1705750900.png', '2024-01-20 11:41:40', '2024-01-20 11:41:40'),
(64, 'short_description_bottom', 'a:2:{s:6:\"Bangla\";s:73:\"<p><strong>A Place for Students to Find Latest Jobs in Tech</strong>.</p>\";s:7:\"English\";s:73:\"<p><strong>A Place for Students to Find Latest Jobs in Tech</strong>.</p>\";}', '2023-11-19 04:07:27', '2024-02-16 18:05:35'),
(65, 'faq_content', 'a:2:{s:6:\"Bangla\";s:446:\"<p>&nbsp;dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\";s:7:\"English\";s:0:\"\";}', '2023-12-02 05:01:55', '2024-01-28 11:41:19'),
(66, 'about_content', 'a:2:{s:6:\"Bangla\";s:452:\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\";s:7:\"English\";s:452:\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\";}', '2023-12-02 05:14:53', '2024-01-20 11:41:40'),
(67, 'bkash_active', 'Yes', '2023-12-03 04:32:15', '2023-12-04 06:10:15'),
(68, 'bkash_currency', 'BDT', '2023-12-03 04:32:15', '2023-12-04 06:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `social_google_accounts`
--

CREATE TABLE `social_google_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `provider_user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `name`, `description`, `company_id`, `created_at`, `updated_at`) VALUES
(7, 'Editor', NULL, 79, '2024-03-03 14:04:03', '2024-03-03 14:04:03'),
(8, 'SEO Manager', NULL, 79, '2024-03-03 14:04:20', '2024-03-03 14:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher` bigint DEFAULT NULL,
  `class_id` bigint DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `teacher`, `class_id`, `start_time`, `end_time`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 'Math', 43, 2, '15:09:00', '16:10:00', 1, '2023-12-06 03:09:34', '2023-12-11 02:07:01'),
(5, 'Math', 43, 6, '10:10:00', '11:10:00', 1, '2023-12-09 23:10:39', '2023-12-11 02:06:54'),
(6, 'English', 46, 6, '10:39:00', '11:39:00', 1, '2023-12-12 22:39:48', '2023-12-12 22:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint NOT NULL,
  `subject_id` int DEFAULT NULL,
  `class_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_teachers`
--

INSERT INTO `subject_teachers` (`id`, `subject_id`, `class_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(9, 2, '1', 43, '2023-12-06 03:09:34', '2023-12-06 03:09:34'),
(12, 5, '5', 43, '2023-12-09 23:10:39', '2023-12-09 23:10:39'),
(13, 5, '5', 43, '2023-12-09 23:30:39', '2023-12-09 23:30:39'),
(15, 2, '5', 43, '2023-12-11 02:03:24', '2023-12-11 02:03:24'),
(16, 5, '6', 43, '2023-12-11 02:06:54', '2023-12-11 02:06:54'),
(17, 2, '2', 43, '2023-12-11 02:07:01', '2023-12-11 02:07:01'),
(18, 6, '6', 46, '2023-12-12 22:39:48', '2023-12-12 22:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `subject_wise_attendances`
--

CREATE TABLE `subject_wise_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `present_time` time DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_wise_attendances`
--

INSERT INTO `subject_wise_attendances` (`id`, `student_id`, `class_id`, `subject_id`, `present_time`, `company_id`, `created_at`, `updated_at`) VALUES
(6, '1', 1, 4, '15:43:52', 1, '2023-12-02 09:44:07', '2023-12-02 09:44:07'),
(7, '1', 1, 1, '15:52:02', 1, '2023-12-02 09:52:09', '2023-12-02 09:52:09'),
(8, '1', 1, 1, '10:11:23', 1, '2023-12-03 04:11:56', '2023-12-03 04:11:56'),
(9, '1', 1, 1, '12:14:27', 1, '2023-12-05 06:15:36', '2023-12-05 06:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `company_name`, `vat_number`, `email`, `phone`, `address`, `country`, `city`, `state`, `postal_code`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'J & K', 'VT 101922', 'test@gmail.com', '01715253866', NULL, 'Bangladesh', NULL, NULL, NULL, 1, '2022-12-08 06:01:33', '2022-12-08 06:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `s_m_s`
--

CREATE TABLE `s_m_s` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `s_m_s`
--

INSERT INTO `s_m_s` (`id`, `name`, `body`, `company_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'booking_sms_customer', '<p>Your booking is confirmed. See booking details here: [link]</p>', 1, 1, '2022-12-22 10:18:43', '2023-01-01 06:22:56'),
(2, 'booking_sms_driver', '<p>You have a trip on [date].&nbsp;</p>', 1, 1, '2023-01-01 06:22:12', '2023-02-11 05:17:50'),
(3, 'booking_sms_customer', '<p>Dear Customer,</p>\r\n<p>Your trip has been booke. For mre details: [link]</p>', 2, 1, '2023-01-02 07:03:08', '2023-01-02 07:03:08'),
(4, 'booking_sms_driver', '<p>Your have trip on [date]</p>', 2, 1, '2023-01-02 07:08:14', '2023-01-02 07:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` bigint NOT NULL,
  `milestone_id` bigint DEFAULT NULL,
  `priority` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_status_id` bigint NOT NULL,
  `assigned_user_id` bigint DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `project_id`, `milestone_id`, `priority`, `task_status_id`, `assigned_user_id`, `start_date`, `end_date`, `custom_fields`, `user_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', NULL, 1, NULL, 'low', 2, 8, '2022-12-19', '2023-01-07', NULL, 2, 1, '2022-12-19 08:37:37', '2023-11-13 11:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `task_statuses`
--

CREATE TABLE `task_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_statuses`
--

INSERT INTO `task_statuses` (`id`, `title`, `color`, `order`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Start', '#000000', 2, 1, '2022-12-19 08:37:14', '2023-01-28 11:04:46'),
(2, 'Finished', '#37a91c', 1, 1, '2023-01-09 10:59:03', '2023-01-28 11:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `taxs`
--

CREATE TABLE `taxs` (
  `id` bigint UNSIGNED NOT NULL,
  `tax_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxs`
--

INSERT INTO `taxs` (`id`, `tax_name`, `rate`, `type`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Road Tax', 5.00, 'percent', 1, '2022-12-17 05:12:09', '2022-12-17 05:12:09'),
(2, 'Extra Police', 2.00, 'fixed', 1, '2022-12-18 07:17:25', '2022-12-18 07:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_hour` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `project_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `base_amount` decimal(10,2) DEFAULT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  `purchase_return_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `trans_date`, `account_id`, `chart_id`, `type`, `dr_cr`, `amount`, `base_amount`, `payer_payee_id`, `invoice_id`, `purchase_id`, `purchase_return_id`, `project_id`, `payment_method_id`, `reference`, `attachment`, `note`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '2022-11-01', 1, 1, 'income', 'cr', 10000.00, 10000.00, 1, 1, NULL, NULL, NULL, 1, '38476', '1667279218invoice_1001.pdf', 'Half Payment', 1, '2022-11-01 05:06:58', '2022-11-01 05:06:58'),
(2, '2022-11-01', 1, 1, 'income', 'cr', 5000.00, 5000.00, 1, 1, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2022-11-01 05:07:21', '2022-11-01 05:07:21'),
(3, '2022-12-08', 1, 2, 'expense', 'dr', 20.00, 20.00, NULL, NULL, 1, NULL, NULL, 1, NULL, '', NULL, 1, '2022-12-08 06:05:11', '2022-12-08 06:05:11'),
(4, '2022-12-14', 1, 1, 'income', 'cr', 100000.00, 100000.00, 6, 2, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2022-12-14 07:30:25', '2022-12-14 07:30:25'),
(5, '2022-12-14', 1, 0, 'transfer', 'dr', 500.00, 500.00, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2022-12-14 08:32:08', '2022-12-14 08:32:08'),
(6, '2022-12-14', 2, 0, 'transfer', 'cr', 500.00, 500.00, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2022-12-14 08:32:08', '2022-12-14 08:32:08'),
(7, '2022-12-15', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 4, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2022-12-15 11:40:58', '2022-12-15 11:40:58'),
(8, '2022-12-20', 1, 1, 'income', 'cr', 1094.50, 1094.50, 1, 11, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2022-12-20 10:49:24', '2022-12-20 10:49:24'),
(9, '2022-12-20', 2, 1, 'income', 'cr', 1000.00, 1000.00, 1, 6, NULL, NULL, NULL, 2, NULL, '', NULL, 1, '2022-12-20 10:50:05', '2022-12-20 10:50:05'),
(10, '2022-12-20', 2, 1, 'income', 'cr', 15000.00, 15000.00, 6, 8, NULL, NULL, NULL, 2, NULL, '', NULL, 1, '2022-12-20 10:50:43', '2022-12-20 10:50:43'),
(11, '2022-12-20', 1, 1, 'income', 'cr', 1000.00, 1000.00, 1, 10, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2022-12-20 10:51:24', '2022-12-20 10:51:24'),
(12, '2023-01-02', 1, 1, 'income', 'cr', 2000.00, 2000.00, 6, 75, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-02 05:43:40', '2023-01-02 05:43:40'),
(13, '2023-01-02', 3, 3, 'income', 'cr', 5000.00, 5000.00, 2, 76, NULL, NULL, NULL, 3, NULL, '', NULL, 2, '2023-01-02 07:11:33', '2023-01-02 07:11:33'),
(14, '2023-01-02', 3, 3, 'income', 'cr', 8000.00, 8000.00, 2, 80, NULL, NULL, NULL, 3, NULL, '', NULL, 2, '2023-01-02 07:29:29', '2023-01-02 07:29:29'),
(15, '2023-01-07', 1, 1, 'income', 'cr', 10000.00, 10000.00, 6, 75, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-07 04:57:24', '2023-01-07 04:57:24'),
(16, '2023-01-07', 1, 1, 'income', 'cr', 20000.00, 20000.00, 6, 74, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-07 04:58:19', '2023-01-07 04:58:19'),
(17, '2023-01-07', 1, 2, 'expense', 'dr', 5.00, 5.00, NULL, NULL, 1, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-07 04:59:06', '2023-01-07 04:59:06'),
(18, '2023-01-07', 1, 1, 'income', 'cr', 8004.00, 8004.00, 6, 75, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 10:58:07', '2023-01-07 10:58:07'),
(19, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 1, 62, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 11:33:26', '2023-01-07 11:33:26'),
(20, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 1, 61, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 11:34:26', '2023-01-07 11:34:26'),
(21, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 59, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 11:36:35', '2023-01-07 11:36:35'),
(22, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 57, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 11:38:19', '2023-01-07 11:38:19'),
(23, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 54, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 12:01:26', '2023-01-07 12:01:26'),
(24, '2023-01-07', 1, 1, 'income', 'cr', 1000.00, 1000.00, 1, 53, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2023-01-07 12:07:05', '2023-01-07 12:07:05'),
(25, '2023-01-11', 1, 4, 'expense', 'dr', 100.00, 100.00, NULL, 85, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-11 05:32:42', '2023-01-11 05:32:42'),
(27, '2023-01-22', 1, 4, 'expense', 'dr', 100.00, 100.00, NULL, 3, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-22 10:02:10', '2023-01-26 06:28:46'),
(28, '2023-01-24', 1, 4, 'expense', 'dr', 300.00, 300.00, NULL, 86, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-24 04:05:50', '2023-01-24 04:05:50'),
(29, '2023-01-24', 1, 5, 'expense', 'dr', 200.00, 200.00, NULL, 86, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-24 10:45:20', '2023-01-24 10:45:20'),
(30, '2023-01-26', 1, 1, 'income', 'cr', 2000.00, 2000.00, 6, 85, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2023-01-26 05:20:33', '2023-01-26 05:20:33'),
(31, '2023-01-26', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 83, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, '2023-01-26 05:31:50', '2023-01-26 05:31:50'),
(32, '2023-01-26', 1, 1, 'income', 'cr', 950.00, 950.00, 6, 82, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2023-01-26 05:47:01', '2023-01-26 05:47:01'),
(33, '2023-01-26', 1, 1, 'income', 'cr', 1023.75, 1023.75, 6, 73, NULL, NULL, NULL, 7, NULL, NULL, NULL, 1, '2023-01-26 06:24:59', '2023-01-26 06:24:59'),
(34, '2023-01-28', 1, 1, 'income', 'cr', 1000.00, 1000.00, 6, 86, NULL, NULL, NULL, 8, NULL, NULL, NULL, 1, '2023-01-28 09:42:50', '2023-01-28 09:42:50'),
(35, '2023-01-28', 1, 1, 'income', 'cr', 5000.00, 5000.00, 6, 72, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-28 09:59:33', '2023-01-28 09:59:33'),
(36, '2023-01-28', 1, 1, 'income', 'cr', 15000.00, 15000.00, 6, 72, NULL, NULL, NULL, 9, NULL, NULL, NULL, 1, '2023-01-28 10:11:50', '2023-01-28 10:11:50'),
(37, '2023-01-28', 1, 1, 'income', 'cr', 7890.00, 7890.00, 6, 71, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-28 10:21:52', '2023-01-28 10:21:52'),
(38, '2023-01-28', 1, 1, 'income', 'cr', 20.35, 20.35, 6, 71, NULL, NULL, NULL, 1, NULL, '', NULL, 1, '2023-01-28 10:22:56', '2023-01-28 10:22:56'),
(39, '2023-01-28', 1, 1, 'income', 'cr', 13089.65, 13089.65, 6, 71, NULL, NULL, NULL, 10, NULL, NULL, NULL, 1, '2023-01-28 10:24:42', '2023-01-28 10:24:42'),
(40, '2023-02-02', 1, 6, 'expense', 'dr', 20.00, 20.00, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2023-02-02 06:42:15', '2023-02-02 06:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `district_id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', NULL, NULL),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd', NULL, NULL),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', NULL, NULL),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', NULL, NULL),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', NULL, NULL),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', NULL, NULL),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd', NULL, NULL),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd', NULL, NULL),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', NULL, NULL),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', NULL, NULL),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', NULL, NULL),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd', NULL, NULL),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', NULL, NULL),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', NULL, NULL),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd', NULL, NULL),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', NULL, NULL),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', NULL, NULL),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', NULL, NULL),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', NULL, NULL),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', NULL, NULL),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', NULL, NULL),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', NULL, NULL),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', NULL, NULL),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', NULL, NULL),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', NULL, NULL),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', NULL, NULL),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', NULL, NULL),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', NULL, NULL),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', NULL, NULL),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', NULL, NULL),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', NULL, NULL),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', NULL, NULL),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', NULL, NULL),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', NULL, NULL),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd', NULL, NULL),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', NULL, NULL),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd', NULL, NULL),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd', NULL, NULL),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', NULL, NULL),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', NULL, NULL),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', NULL, NULL),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', NULL, NULL),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', NULL, NULL),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', NULL, NULL),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', NULL, NULL),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', NULL, NULL),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', NULL, NULL),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', NULL, NULL),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', NULL, NULL),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', NULL, NULL),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', NULL, NULL),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', NULL, NULL),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd', NULL, NULL),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', NULL, NULL),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', NULL, NULL),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', NULL, NULL),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', NULL, NULL),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', NULL, NULL),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', NULL, NULL),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', NULL, NULL),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', NULL, NULL),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', NULL, NULL),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', NULL, NULL),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', NULL, NULL),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', NULL, NULL),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', NULL, NULL),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', NULL, NULL),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', NULL, NULL),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', NULL, NULL),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', NULL, NULL),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', NULL, NULL),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', NULL, NULL),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', NULL, NULL),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', NULL, NULL),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', NULL, NULL),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', NULL, NULL),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', NULL, NULL),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd', NULL, NULL),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', NULL, NULL),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', NULL, NULL),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', NULL, NULL),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', NULL, NULL),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', NULL, NULL),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', NULL, NULL),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', NULL, NULL),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd', NULL, NULL),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', NULL, NULL),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', NULL, NULL),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', NULL, NULL),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', NULL, NULL),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', NULL, NULL),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', NULL, NULL),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', NULL, NULL),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', NULL, NULL),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', NULL, NULL),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', NULL, NULL),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', NULL, NULL),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', NULL, NULL),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', NULL, NULL),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', NULL, NULL),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd', NULL, NULL),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd', NULL, NULL),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', NULL, NULL),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', NULL, NULL),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', NULL, NULL),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', NULL, NULL),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', NULL, NULL),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', NULL, NULL),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', NULL, NULL),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', NULL, NULL),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', NULL, NULL),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', NULL, NULL),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', NULL, NULL),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', NULL, NULL),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', NULL, NULL),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', NULL, NULL),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd', NULL, NULL),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', NULL, NULL),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', NULL, NULL),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', NULL, NULL),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', NULL, NULL),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', NULL, NULL),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', NULL, NULL),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', NULL, NULL),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', NULL, NULL),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', NULL, NULL),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', NULL, NULL),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', NULL, NULL),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', NULL, NULL),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', NULL, NULL),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', NULL, NULL),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', NULL, NULL),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', NULL, NULL),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd', NULL, NULL),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', NULL, NULL),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', NULL, NULL),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', NULL, NULL),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', NULL, NULL),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', NULL, NULL),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', NULL, NULL),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd', NULL, NULL),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', NULL, NULL),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', NULL, NULL),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd', NULL, NULL),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', NULL, NULL),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', NULL, NULL),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd', NULL, NULL),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', NULL, NULL),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', NULL, NULL),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', NULL, NULL),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd', NULL, NULL),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', NULL, NULL),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', NULL, NULL),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', NULL, NULL),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', NULL, NULL),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', NULL, NULL),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', NULL, NULL),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', NULL, NULL),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', NULL, NULL),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', NULL, NULL),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', NULL, NULL),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', NULL, NULL),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', NULL, NULL),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', NULL, NULL),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd', NULL, NULL),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', NULL, NULL),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', NULL, NULL),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', NULL, NULL),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd', NULL, NULL),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', NULL, NULL),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', NULL, NULL),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', NULL, NULL),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', NULL, NULL),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', NULL, NULL),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', NULL, NULL),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', NULL, NULL),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', NULL, NULL),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', NULL, NULL),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', NULL, NULL),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', NULL, NULL),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', NULL, NULL),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', NULL, NULL),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', NULL, NULL),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd', NULL, NULL),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', NULL, NULL),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', NULL, NULL),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', NULL, NULL),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd', NULL, NULL),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', NULL, NULL),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', NULL, NULL),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd', NULL, NULL),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', NULL, NULL),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', NULL, NULL),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', NULL, NULL),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', NULL, NULL),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', NULL, NULL),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', NULL, NULL),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', NULL, NULL),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', NULL, NULL),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', NULL, NULL),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', NULL, NULL),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd', NULL, NULL),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd', NULL, NULL),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', NULL, NULL),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', NULL, NULL),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', NULL, NULL),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', NULL, NULL),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', NULL, NULL),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', NULL, NULL),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', NULL, NULL),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', NULL, NULL),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', NULL, NULL),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd', NULL, NULL),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd', NULL, NULL),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', NULL, NULL),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', NULL, NULL),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', NULL, NULL),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', NULL, NULL),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', NULL, NULL),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', NULL, NULL),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', NULL, NULL),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', NULL, NULL),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', NULL, NULL),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', NULL, NULL),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', NULL, NULL),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', NULL, NULL),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', NULL, NULL),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', NULL, NULL),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', NULL, NULL),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', NULL, NULL),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', NULL, NULL),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', NULL, NULL),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', NULL, NULL),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', NULL, NULL),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', NULL, NULL),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', NULL, NULL),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', NULL, NULL),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', NULL, NULL),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', NULL, NULL),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', NULL, NULL),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', NULL, NULL),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', NULL, NULL),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', NULL, NULL),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', NULL, NULL),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', NULL, NULL),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', NULL, NULL),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', NULL, NULL),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', NULL, NULL),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', NULL, NULL),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', NULL, NULL),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', NULL, NULL),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', NULL, NULL),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', NULL, NULL),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', NULL, NULL),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', NULL, NULL),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', NULL, NULL),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd', NULL, NULL),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd', NULL, NULL),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', NULL, NULL),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', NULL, NULL),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', NULL, NULL),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', NULL, NULL),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd', NULL, NULL),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', NULL, NULL),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', NULL, NULL),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd', NULL, NULL),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', NULL, NULL),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd', NULL, NULL),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd', NULL, NULL),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', NULL, NULL),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd', NULL, NULL),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', NULL, NULL),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', NULL, NULL),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', NULL, NULL),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', NULL, NULL),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', NULL, NULL),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', NULL, NULL),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', NULL, NULL),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', NULL, NULL),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', NULL, NULL),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', NULL, NULL),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', NULL, NULL),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', NULL, NULL),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', NULL, NULL),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', NULL, NULL),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', NULL, NULL),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', NULL, NULL),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', NULL, NULL),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', NULL, NULL),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', NULL, NULL),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', NULL, NULL),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', NULL, NULL),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', NULL, NULL),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', NULL, NULL),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', NULL, NULL),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', NULL, NULL),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', NULL, NULL),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', NULL, NULL),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', NULL, NULL),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', NULL, NULL),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', NULL, NULL),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', NULL, NULL),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', NULL, NULL),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', NULL, NULL),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', NULL, NULL),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', NULL, NULL),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', NULL, NULL),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', NULL, NULL),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', NULL, NULL),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd', NULL, NULL),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', NULL, NULL),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', NULL, NULL),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', NULL, NULL),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd', NULL, NULL),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', NULL, NULL),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', NULL, NULL),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', NULL, NULL),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', NULL, NULL),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', NULL, NULL),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', NULL, NULL),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', NULL, NULL),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', NULL, NULL),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', NULL, NULL),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', NULL, NULL),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', NULL, NULL),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', NULL, NULL),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', NULL, NULL),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', NULL, NULL),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', NULL, NULL),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', NULL, NULL),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', NULL, NULL),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', NULL, NULL),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd', NULL, NULL),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', NULL, NULL),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', NULL, NULL),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', NULL, NULL),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', NULL, NULL),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', NULL, NULL),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', NULL, NULL),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', NULL, NULL),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', NULL, NULL),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', NULL, NULL),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', NULL, NULL),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', NULL, NULL),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd', NULL, NULL),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', NULL, NULL),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', NULL, NULL),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', NULL, NULL),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', NULL, NULL),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', NULL, NULL),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', NULL, NULL),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', NULL, NULL),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', NULL, NULL),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', NULL, NULL),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', NULL, NULL),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', NULL, NULL),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', NULL, NULL),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', NULL, NULL),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', NULL, NULL),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', NULL, NULL),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd', NULL, NULL),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', NULL, NULL),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', NULL, NULL),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', NULL, NULL),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd', NULL, NULL),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', NULL, NULL),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', NULL, NULL),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', NULL, NULL),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd', NULL, NULL),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', NULL, NULL),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', NULL, NULL),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', NULL, NULL),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', NULL, NULL),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', NULL, NULL),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', NULL, NULL),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', NULL, NULL),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', NULL, NULL),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', NULL, NULL),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', NULL, NULL),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', NULL, NULL),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', NULL, NULL),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', NULL, NULL),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', NULL, NULL),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', NULL, NULL),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', NULL, NULL),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', NULL, NULL),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', NULL, NULL),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', NULL, NULL),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', NULL, NULL),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', NULL, NULL),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', NULL, NULL),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', NULL, NULL),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', NULL, NULL),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', NULL, NULL),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', NULL, NULL),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', NULL, NULL),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', NULL, NULL),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd', NULL, NULL),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', NULL, NULL),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', NULL, NULL),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd', NULL, NULL),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', NULL, NULL),
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', NULL, NULL),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', NULL, NULL),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', NULL, NULL),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', NULL, NULL),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', NULL, NULL),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', NULL, NULL),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', NULL, NULL),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', NULL, NULL),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', NULL, NULL),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', NULL, NULL),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', NULL, NULL),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', NULL, NULL),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd', NULL, NULL),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', NULL, NULL),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', NULL, NULL),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', NULL, NULL),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', NULL, NULL),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', NULL, NULL),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', NULL, NULL),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', NULL, NULL),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd', NULL, NULL),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', NULL, NULL),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', NULL, NULL),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', NULL, NULL),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', NULL, NULL),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', NULL, NULL),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', NULL, NULL),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', NULL, NULL),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', NULL, NULL),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', NULL, NULL),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', NULL, NULL),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', NULL, NULL),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', NULL, NULL),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', NULL, NULL),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', NULL, NULL),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', NULL, NULL),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', NULL, NULL),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', NULL, NULL),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', NULL, NULL),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', NULL, NULL),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', NULL, NULL),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', NULL, NULL),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', NULL, NULL),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', NULL, NULL),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', NULL, NULL),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', NULL, NULL),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', NULL, NULL),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', NULL, NULL),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', NULL, NULL),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', NULL, NULL),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', NULL, NULL),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', NULL, NULL),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', NULL, NULL),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', NULL, NULL),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', NULL, NULL),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', NULL, NULL),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', NULL, NULL),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd', NULL, NULL),
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', NULL, NULL),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', NULL, NULL),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', NULL, NULL),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', NULL, NULL),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', NULL, NULL),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', NULL, NULL),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', NULL, NULL),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', NULL, NULL),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', NULL, NULL),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', NULL, NULL),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', NULL, NULL),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', NULL, NULL),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', NULL, NULL),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', NULL, NULL),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', NULL, NULL),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', NULL, NULL),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', NULL, NULL),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', NULL, NULL),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', NULL, NULL),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', NULL, NULL),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', NULL, NULL),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', NULL, NULL),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', NULL, NULL),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', NULL, NULL),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', NULL, NULL),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd', NULL, NULL),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', NULL, NULL),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', NULL, NULL),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', NULL, NULL),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', NULL, NULL),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', NULL, NULL),
(500, 47, 'Adabor', 'আদাবর', '', NULL, NULL),
(501, 47, 'Badda', 'বাড্ডা', '', NULL, NULL),
(502, 47, 'Bangshal ', 'বংশাল', '', NULL, NULL),
(503, 47, 'Biman Bandar', 'বিমান বন্দর ', '', NULL, NULL),
(504, 47, 'Cantonment', 'ক্যান্টনমেন্ট ', '', NULL, NULL),
(505, 47, 'Chawkbazar', 'চকবাজার  ', '', NULL, NULL),
(506, 47, 'Dakshinkhan', 'দক্ষিণখান ', '', NULL, NULL),
(507, 47, 'Darus Salam', 'দার-উস-সালাম', '', NULL, NULL),
(508, 47, 'Demra', 'ডেমরা', '', NULL, NULL),
(509, 47, 'Dhanmondi', 'ধানমন্ডি', '', NULL, NULL),
(510, 47, 'Gendaria', 'গেন্ডারিয়া', '', NULL, NULL),
(511, 47, 'Gulshan', 'গুলশান', '', NULL, NULL),
(512, 47, 'Hazaribagh', 'হাজারীবাগ', '', NULL, NULL),
(513, 47, 'Jatrabari ', 'যাত্রাবাড়ি', '', NULL, NULL),
(514, 47, 'Kadamatali', 'কদমতলী', '', NULL, NULL),
(515, 47, 'Kapharula', 'কাফরুল', '', NULL, NULL),
(516, 47, 'Kalabagan', 'কলাবাগান', '', NULL, NULL),
(517, 47, 'Kamrangirchar', 'কামরাঙ্গিরচর', '', NULL, NULL),
(518, 47, 'Khilgaon', 'খিলগাঁও', '', NULL, NULL),
(519, 47, 'Khilkhet', 'খিলক্ষেত', '', NULL, NULL),
(520, 47, 'Kotwali', 'কোতোয়ালী', '', NULL, NULL),
(521, 47, 'Lalbagh', 'লালবাগ ', '', NULL, NULL),
(522, 47, 'Mirpur', 'মিরপুর', '', NULL, NULL),
(523, 47, 'Mohammadpur', 'মোহাম্মদপুর', '', NULL, NULL),
(524, 47, 'Motijheel', 'মতিঝিল', '', NULL, NULL),
(525, 47, 'New Market ', 'নিউমার্কেট ', '', NULL, NULL),
(526, 47, 'Pallabi', 'পল্লবী', '', NULL, NULL),
(527, 47, 'Paltan ', 'পল্টন', '', NULL, NULL),
(528, 47, 'Ramna', 'রমনা', '', NULL, NULL),
(529, 47, 'Rampura ', 'রামপুরা', '', NULL, NULL),
(530, 47, 'Sabujbagh', 'সবুজবাগ', '', NULL, NULL),
(531, 47, 'Shah Ali', 'শাহ আলী', '', NULL, NULL),
(532, 47, 'Shahbagh ', 'শাহবাগ ', '', NULL, NULL),
(533, 47, 'Sher-e-Bangla Nagar', 'শেরেবাংলা নগর', '', NULL, NULL),
(534, 47, 'Shyampur', 'শ্যামপুর', '', NULL, NULL),
(535, 47, 'Sutrapur', 'সূত্রাপুর', '', NULL, NULL),
(536, 47, 'Tejgaon', 'তেজগাঁও', '', NULL, NULL),
(537, 47, 'Tejgaon Industrial Area', 'তেজগাঁও শিল্পাঞ্চল', '', NULL, NULL),
(538, 47, 'Turag', 'তুরাগ', '', NULL, NULL),
(539, 47, 'Uttara', 'উত্তরা', '', NULL, NULL),
(540, 47, 'Uttar Khan', 'উত্তর খান ', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `profile_picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Group member',
  `facebook` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instragram` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `father` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` bigint DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `gender` tinyint DEFAULT NULL COMMENT '0=female|1=male',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` smallint DEFAULT NULL,
  `district_id` smallint DEFAULT NULL,
  `upazila_id` mediumint DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `house_rent` decimal(10,2) DEFAULT NULL,
  `mobile_rent` decimal(10,2) DEFAULT NULL,
  `other_bill` decimal(10,2) DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `email_verified_at`, `password`, `user_type`, `role_id`, `profile_picture`, `bio`, `facebook`, `linkedin`, `instragram`, `tiktok`, `status`, `language`, `joining_date`, `birth_date`, `father`, `mother`, `nid`, `company_id`, `gender`, `address`, `staff_id`, `sign`, `division_id`, `district_id`, `upazila_id`, `salary`, `house_rent`, `mobile_rent`, `other_bill`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '01689655055', 'akandmahfuz@gmail.com', '2022-10-31 22:10:51', '$2y$12$ACOGp7E7MCc4aka2X/8/VepQoT7t.z/.J5eM3chLVuTwcZ2IOlF.y', 'admin', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2022-10-31 22:10:51', '2024-02-06 22:03:07'),
(110, 'Md Arafat', '01309323741', 'arafat24@gmail.com', '2024-03-07 02:23:45', '$2y$12$zJ1P8SNlLaIy7CPu.o3Nc.LJHpuBT.yKFrsjdzpWWP1ze5Vgysnpe', 'user', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, NULL, NULL, 9, 81, NULL, NULL, NULL, NULL, NULL, '2024-03-07 02:23:46', '2024-03-07 02:24:27'),
(92, 'Md Farid Hossain', '01309323741', 'mdm029844@gmail.com', '2024-02-16 10:56:19', '$2y$12$f48cSJH6mftGQj/7oS4jhOzhRLSHG.CWaB5r8K12nVfAQoaaGrnx6', 'user', NULL, 'profile_1708144420.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, 10, 91, NULL, NULL, NULL, NULL, NULL, '2024-02-16 10:56:19', '2024-02-16 22:33:40'),
(94, 'Md Nahid Hasan', '01309323741', 'mfaridhossain24@gmail.com', '2024-02-20 07:39:30', '$2y$12$UDwFh2rmFAZMhHIl7juohu.kIoMCrP3ZqLNssrCkXkRuAt5ICebEK', 'user', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, 10, 91, NULL, NULL, NULL, NULL, NULL, '2024-02-20 07:39:30', '2024-03-05 09:26:56'),
(98, 'farid', NULL, 'mfaridhossain242@gmail.com', '2024-02-27 11:47:19', '$2y$12$76AwvBAHZgajKXoYSXgtA.mMvksqCkS4QS/m7IQLHhxrOpBlPz6Jm', 'client', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-27 11:47:20', '2024-02-27 11:47:20'),
(97, 'ghfghfg', NULL, 'mfardknj54@gmail.com', '2024-02-27 08:34:03', '$2y$12$ZpfQQXS1EdnX3LGnQaU2jeLWABbxXMpROHhPeMhYPy4LbGlpplu7.', 'client', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-27 08:34:03', '2024-02-27 08:34:03'),
(99, 'farid', NULL, 'akandmbvvahfuz@gmail.com', '2024-03-03 07:17:01', '$2y$12$/nfHSWuHdcu8zMfZ6X6GqeZpOjs10jGGrqZNgvVpsgjVe4gZgWwRG', 'client', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-03 07:17:01', '2024-03-03 07:17:01'),
(106, 'farid', NULL, 'mdfarid2001618@gmail.com', '2024-03-03 08:53:13', '$2y$12$11fbceAhrTupMdq.7z1sLukOw5whBCcmBUYWorEMqTuZWaI19cCj.', 'staff', 8, 'profile_1709477593.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-03 08:53:14', '2024-03-03 08:53:14'),
(107, 'Arif', NULL, 'msshimol2001@gmail.com', '2024-03-03 08:57:09', '$2y$12$t0ZgnsgrTBV6duRfp4gSuOygbv092nYMDBpOsBZXQS2.6HUYKGU/m', 'staff', 7, 'profile_1709477841.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-03 08:57:09', '2024-03-03 08:57:22'),
(108, 'Farid', NULL, 'farid24@gmail.com', '2024-03-07 02:16:05', '$2y$12$owHrE8nKtVZMvJkeBsS9hefF.SBjkP.wDdmE70P9UVTVxBV0/Pb1a', 'client', NULL, 'default.png', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 02:16:06', '2024-03-07 02:16:06'),
(109, 'Farid Hosain', NULL, 'farid245@gmail.com', '2024-03-07 02:21:36', '$2y$12$aWrFu0KW8T7CPppcYAiV7ubFzABprbkx2BEV8QGO6AB5/j9J8zBZu', 'staff', 8, 'profile_1709799696.jpg', 'Group member', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 02:21:37', '2024-03-07 02:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `model` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_plate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_exp_date` date DEFAULT NULL,
  `in_service` tinyint DEFAULT '1',
  `type_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `vehicle_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chassis_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eng_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` decimal(10,2) DEFAULT NULL,
  `mileage` decimal(10,2) DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'condition used|new',
  `ins_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int NOT NULL,
  `owner_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `model`, `reg_plate`, `reg_exp_date`, `in_service`, `type_id`, `driver_id`, `vehicle_img`, `brand`, `chassis_no`, `eng_no`, `capacity`, `mileage`, `state`, `ins_no`, `company_id`, `owner_name`, `owner_phone`, `owner_address`, `created_at`, `updated_at`) VALUES
(1, 'VTS200', 'DHK Metro-KA 45-3353', '2022-11-28', 1, 1, 1, 'l9vDHK Metro-KA 45-3353.jpeg', 'Bradford', NULL, NULL, 5.00, 4.34, 'new', NULL, 1, NULL, NULL, NULL, '2022-12-17 07:11:09', '2023-01-25 06:59:29'),
(2, 'VTS200', 'Dhk Metro-GA 12334', NULL, 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2023-01-02 06:37:15', '2023-01-02 06:37:36'),
(3, NULL, 'CHATTA Metro-HA 55-2323', '2032-09-24', 1, 1, 1, 'mfJCHATTA Metro-HA 55-2323.png', 'TATA', '2342sfsf', 'sfsfsf 34354', 7.00, 5.00, 'new', '242424', 1, NULL, NULL, NULL, '2023-01-18 11:31:49', '2023-01-20 04:15:31'),
(4, 'TATA 5 Ton', 'DHK Metro DA-345343', '2023-01-04', 1, 1, 2, 'c2EDHK Metro DA-345343.jpg', 'TATA', 'TEST2323', '2342 VTEDDC', 5.00, 5.00, 'used', 'INSw3234', 1, NULL, NULL, NULL, '2023-01-18 12:00:09', '2023-02-01 05:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` int DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '0=deactive|1=active',
  `company_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `type_name`, `seats`, `status`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Bus', 20, 1, 1, '2022-12-17 07:08:49', '2022-12-17 07:08:54'),
(2, 'Truck', NULL, 0, 1, '2022-12-25 05:59:04', '2022-12-25 05:59:35'),
(3, 'Covered Van', NULL, 1, 2, '2023-01-02 06:33:10', '2023-01-02 06:33:17'),
(4, 'mini truck', NULL, 1, 2, '2023-01-02 06:34:38', '2023-01-02 06:34:38'),
(5, 'temporary', NULL, 1, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applies`
--
ALTER TABLE `applies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_circulars`
--
ALTER TABLE `category_circulars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_groups`
--
ALTER TABLE `chat_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_group_users`
--
ALTER TABLE `chat_group_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `circulars`
--
ALTER TABLE `circulars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_email_subscribers`
--
ALTER TABLE `cm_email_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_faqs`
--
ALTER TABLE `cm_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cm_features`
--
ALTER TABLE `cm_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_email_template`
--
ALTER TABLE `company_email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_sms_templates`
--
ALTER TABLE `company_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_rates`
--
ALTER TABLE `currency_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_stocks`
--
ALTER TABLE `current_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drivers_license_no_unique` (`license_no`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_manager`
--
ALTER TABLE `file_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuels`
--
ALTER TABLE `fuels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `governors`
--
ALTER TABLE `governors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_chat_messages`
--
ALTER TABLE `group_chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_chat_message_status`
--
ALTER TABLE `group_chat_message_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institute_classes`
--
ALTER TABLE `institute_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_item_taxes`
--
ALTER TABLE `invoice_item_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_statuses`
--
ALTER TABLE `leave_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_item_taxes`
--
ALTER TABLE `purchase_order_item_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return_item_taxes`
--
ALTER TABLE `purchase_return_item_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_item_taxes`
--
ALTER TABLE `quotation_item_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repeating_transactions`
--
ALTER TABLE `repeating_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_date`
--
ALTER TABLE `report_date`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rdate` (`rdate`);

--
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_item_taxes`
--
ALTER TABLE `sales_return_item_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_google_accounts`
--
ALTER TABLE `social_google_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_wise_attendances`
--
ALTER TABLE `subject_wise_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_m_s`
--
ALTER TABLE `s_m_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_statuses`
--
ALTER TABLE `task_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxs`
--
ALTER TABLE `taxs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `applies`
--
ALTER TABLE `applies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category_circulars`
--
ALTER TABLE `category_circulars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_groups`
--
ALTER TABLE `chat_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_group_users`
--
ALTER TABLE `chat_group_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `circulars`
--
ALTER TABLE `circulars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cm_email_subscribers`
--
ALTER TABLE `cm_email_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cm_faqs`
--
ALTER TABLE `cm_faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cm_features`
--
ALTER TABLE `cm_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `company_email_template`
--
ALTER TABLE `company_email_template`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_settings`
--
ALTER TABLE `company_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `company_sms_templates`
--
ALTER TABLE `company_sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currency_rates`
--
ALTER TABLE `currency_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `current_stocks`
--
ALTER TABLE `current_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_manager`
--
ALTER TABLE `file_manager`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuels`
--
ALTER TABLE `fuels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `governors`
--
ALTER TABLE `governors`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `group_chat_messages`
--
ALTER TABLE `group_chat_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_chat_message_status`
--
ALTER TABLE `group_chat_message_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `institute_classes`
--
ALTER TABLE `institute_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `invoice_item_taxes`
--
ALTER TABLE `invoice_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lead_statuses`
--
ALTER TABLE `lead_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_statuses`
--
ALTER TABLE `leave_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_item_taxes`
--
ALTER TABLE `purchase_order_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return`
--
ALTER TABLE `purchase_return`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_item_taxes`
--
ALTER TABLE `purchase_return_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_item_taxes`
--
ALTER TABLE `quotation_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repeating_transactions`
--
ALTER TABLE `repeating_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_date`
--
ALTER TABLE `report_date`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1528;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return_item_taxes`
--
ALTER TABLE `sales_return_item_taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `social_google_accounts`
--
ALTER TABLE `social_google_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subject_wise_attendances`
--
ALTER TABLE `subject_wise_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `s_m_s`
--
ALTER TABLE `s_m_s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_statuses`
--
ALTER TABLE `task_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=543;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
