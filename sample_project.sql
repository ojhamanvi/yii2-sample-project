-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 01:48 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_code_two` char(2) DEFAULT NULL,
  `country_code_three` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `country_code_two`, `country_code_three`) VALUES
(1, 'Afghanistan', 'AF', 'AFG'),
(2, 'Aland Islands', 'AX', 'ALA'),
(3, 'Albania', 'AL', 'ALB'),
(4, 'Algeria', 'DZ', 'DZA'),
(5, 'American Samoa', 'AS', 'ASM'),
(6, 'Andorra', 'AD', 'AND'),
(7, 'Angola', 'AO', 'AGO'),
(8, 'Anguilla', 'AI', 'AIA'),
(9, 'Antarctica', 'AQ', 'ATA'),
(10, 'Antigua and Barbuda', 'AG', 'ATG'),
(11, 'Argentina', 'AR', 'ARG'),
(12, 'Armenia', 'AM', 'ARM'),
(13, 'Aruba', 'AW', 'ABW'),
(14, 'Australia', 'AU', 'AUS'),
(15, 'Austria', 'AT', 'AUT'),
(16, 'Azerbaijan', 'AZ', 'AZE'),
(17, 'Bahamas', 'BS', 'BHS'),
(18, 'Bahrain', 'BH', 'BHR'),
(19, 'Bangladesh', 'BD', 'BGD'),
(20, 'Barbados', 'BB', 'BRB'),
(21, 'Belarus', 'BY', 'BLR'),
(22, 'Belgium', 'BE', 'BEL'),
(23, 'Belize', 'BZ', 'BLZ'),
(24, 'Benin', 'BJ', 'BEN'),
(25, 'Bermuda', 'BM', 'BMU'),
(26, 'Bhutan', 'BT', 'BTN'),
(27, 'Bolivia', 'BO', 'BOL'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES'),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH'),
(30, 'Botswana', 'BW', 'BWA'),
(31, 'Bouvet Island', 'BV', 'BVT'),
(32, 'Brazil', 'BR', 'BRA'),
(33, 'British Indian Ocean Territory', 'IO', 'IOT'),
(34, 'Brunei', 'BN', 'BRN'),
(35, 'Bulgaria', 'BG', 'BGR'),
(36, 'Burkina Faso', 'BF', 'BFA'),
(37, 'Burundi', 'BI', 'BDI'),
(38, 'Cambodia', 'KH', 'KHM'),
(39, 'Cameroon', 'CM', 'CMR'),
(40, 'Canada', 'CA', 'CAN'),
(41, 'Cape Verde', 'CV', 'CPV'),
(42, 'Cayman Islands', 'KY', 'CYM'),
(43, 'Central African Republic', 'CF', 'CAF'),
(44, 'Chad', 'TD', 'TCD'),
(45, 'Chile', 'CL', 'CHL'),
(46, 'China', 'CN', 'CHN'),
(47, 'Christmas Island', 'CX', 'CXR'),
(48, 'Cocos (Keeling) Islands', 'CC', 'CCK'),
(49, 'Colombia', 'CO', 'COL'),
(50, 'Comoros', 'KM', 'COM'),
(51, 'Congo', 'CG', 'COG'),
(52, 'Cook Islands', 'CK', 'COK'),
(53, 'Costa Rica', 'CR', 'CRI'),
(54, 'Ivory Coast', 'CI', 'CIV'),
(55, 'Croatia', 'HR', 'HRV'),
(56, 'Cuba', 'CU', 'CUB'),
(57, 'Curacao', 'CW', 'CUW'),
(58, 'Cyprus', 'CY', 'CYP'),
(59, 'Czech Republic', 'CZ', 'CZE'),
(60, 'Democratic Republic of the Congo', 'CD', 'COD'),
(61, 'Denmark', 'DK', 'DNK'),
(62, 'Djibouti', 'DJ', 'DJI'),
(63, 'Dominica', 'DM', 'DMA'),
(64, 'Dominican Republic', 'DO', 'DOM'),
(65, 'Ecuador', 'EC', 'ECU'),
(66, 'Egypt', 'EG', 'EGY'),
(67, 'El Salvador', 'SV', 'SLV'),
(68, 'Equatorial Guinea', 'GQ', 'GNQ'),
(69, 'Eritrea', 'ER', 'ERI'),
(70, 'Estonia', 'EE', 'EST'),
(71, 'Ethiopia', 'ET', 'ETH'),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK'),
(73, 'Faroe Islands', 'FO', 'FRO'),
(74, 'Fiji', 'FJ', 'FJI'),
(75, 'Finland', 'FI', 'FIN'),
(76, 'France', 'FR', 'FRA'),
(77, 'French Guiana', 'GF', 'GUF'),
(78, 'French Polynesia', 'PF', 'PYF'),
(79, 'French Southern Territories', 'TF', 'ATF'),
(80, 'Gabon', 'GA', 'GAB'),
(81, 'Gambia', 'GM', 'GMB'),
(82, 'Georgia', 'GE', 'GEO'),
(83, 'Germany', 'DE', 'DEU'),
(84, 'Ghana', 'GH', 'GHA'),
(85, 'Gibraltar', 'GI', 'GIB'),
(86, 'Greece', 'GR', 'GRC'),
(87, 'Greenland', 'GL', 'GRL'),
(88, 'Grenada', 'GD', 'GRD'),
(89, 'Guadaloupe', 'GP', 'GLP'),
(90, 'Guam', 'GU', 'GUM'),
(91, 'Guatemala', 'GT', 'GTM'),
(92, 'Guernsey', 'GG', 'GGY'),
(93, 'Guinea', 'GN', 'GIN'),
(94, 'Guinea-Bissau', 'GW', 'GNB'),
(95, 'Guyana', 'GY', 'GUY'),
(96, 'Haiti', 'HT', 'HTI'),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD'),
(98, 'Honduras', 'HN', 'HND'),
(99, 'Hong Kong', 'HK', 'HKG'),
(100, 'Hungary', 'HU', 'HUN'),
(101, 'Iceland', 'IS', 'ISL'),
(102, 'India', 'IN', 'IND'),
(103, 'Indonesia', 'ID', 'IDN'),
(104, 'Iran', 'IR', 'IRN'),
(105, 'Iraq', 'IQ', 'IRQ'),
(106, 'Ireland', 'IE', 'IRL'),
(107, 'Isle of Man', 'IM', 'IMN'),
(108, 'Israel', 'IL', 'ISR'),
(109, 'Italy', 'IT', 'ITA'),
(110, 'Jamaica', 'JM', 'JAM'),
(111, 'Japan', 'JP', 'JPN'),
(112, 'Jersey', 'JE', 'JEY'),
(113, 'Jordan', 'JO', 'JOR'),
(114, 'Kazakhstan', 'KZ', 'KAZ'),
(115, 'Kenya', 'KE', 'KEN'),
(116, 'Kiribati', 'KI', 'KIR'),
(117, 'Kosovo', 'XK', '---'),
(118, 'Kuwait', 'KW', 'KWT'),
(119, 'Kyrgyzstan', 'KG', 'KGZ'),
(120, 'Laos', 'LA', 'LAO'),
(121, 'Latvia', 'LV', 'LVA'),
(122, 'Lebanon', 'LB', 'LBN'),
(123, 'Lesotho', 'LS', 'LSO'),
(124, 'Liberia', 'LR', 'LBR'),
(125, 'Libya', 'LY', 'LBY'),
(126, 'Liechtenstein', 'LI', 'LIE'),
(127, 'Lithuania', 'LT', 'LTU'),
(128, 'Luxembourg', 'LU', 'LUX'),
(129, 'Macao', 'MO', 'MAC'),
(130, 'Macedonia', 'MK', 'MKD'),
(131, 'Madagascar', 'MG', 'MDG'),
(132, 'Malawi', 'MW', 'MWI'),
(133, 'Malaysia', 'MY', 'MYS'),
(134, 'Maldives', 'MV', 'MDV'),
(135, 'Mali', 'ML', 'MLI'),
(136, 'Malta', 'MT', 'MLT'),
(137, 'Marshall Islands', 'MH', 'MHL'),
(138, 'Martinique', 'MQ', 'MTQ'),
(139, 'Mauritania', 'MR', 'MRT'),
(140, 'Mauritius', 'MU', 'MUS'),
(141, 'Mayotte', 'YT', 'MYT'),
(142, 'Mexico', 'MX', 'MEX'),
(143, 'Micronesia', 'FM', 'FSM'),
(144, 'Moldava', 'MD', 'MDA'),
(145, 'Monaco', 'MC', 'MCO'),
(146, 'Mongolia', 'MN', 'MNG'),
(147, 'Montenegro', 'ME', 'MNE'),
(148, 'Montserrat', 'MS', 'MSR'),
(149, 'Morocco', 'MA', 'MAR'),
(150, 'Mozambique', 'MZ', 'MOZ'),
(151, 'Myanmar (Burma)', 'MM', 'MMR'),
(152, 'Namibia', 'NA', 'NAM'),
(153, 'Nauru', 'NR', 'NRU'),
(154, 'Nepal', 'NP', 'NPL'),
(155, 'Netherlands', 'NL', 'NLD'),
(156, 'New Caledonia', 'NC', 'NCL'),
(157, 'New Zealand', 'NZ', 'NZL'),
(158, 'Nicaragua', 'NI', 'NIC'),
(159, 'Niger', 'NE', 'NER'),
(160, 'Nigeria', 'NG', 'NGA'),
(161, 'Niue', 'NU', 'NIU'),
(162, 'Norfolk Island', 'NF', 'NFK'),
(163, 'North Korea', 'KP', 'PRK'),
(164, 'Northern Mariana Islands', 'MP', 'MNP'),
(165, 'Norway', 'NO', 'NOR'),
(166, 'Oman', 'OM', 'OMN'),
(167, 'Pakistan', 'PK', 'PAK'),
(168, 'Palau', 'PW', 'PLW'),
(169, 'Palestine', 'PS', 'PSE'),
(170, 'Panama', 'PA', 'PAN'),
(171, 'Papua New Guinea', 'PG', 'PNG'),
(172, 'Paraguay', 'PY', 'PRY'),
(173, 'Peru', 'PE', 'PER'),
(174, 'Phillipines', 'PH', 'PHL'),
(175, 'Pitcairn', 'PN', 'PCN'),
(176, 'Poland', 'PL', 'POL'),
(177, 'Portugal', 'PT', 'PRT'),
(178, 'Puerto Rico', 'PR', 'PRI'),
(179, 'Qatar', 'QA', 'QAT'),
(180, 'Reunion', 'RE', 'REU'),
(181, 'Romania', 'RO', 'ROU'),
(182, 'Russia', 'RU', 'RUS'),
(183, 'Rwanda', 'RW', 'RWA'),
(184, 'Saint Barthelemy', 'BL', 'BLM'),
(185, 'Saint Helena', 'SH', 'SHN'),
(186, 'Saint Kitts and Nevis', 'KN', 'KNA'),
(187, 'Saint Lucia', 'LC', 'LCA'),
(188, 'Saint Martin', 'MF', 'MAF'),
(189, 'Saint Pierre and Miquelon', 'PM', 'SPM'),
(190, 'Saint Vincent and the Grenadines', 'VC', 'VCT'),
(191, 'Samoa', 'WS', 'WSM'),
(192, 'San Marino', 'SM', 'SMR'),
(193, 'Sao Tome and Principe', 'ST', 'STP'),
(194, 'Saudi Arabia', 'SA', 'SAU'),
(195, 'Senegal', 'SN', 'SEN'),
(196, 'Serbia', 'RS', 'SRB'),
(197, 'Seychelles', 'SC', 'SYC'),
(198, 'Sierra Leone', 'SL', 'SLE'),
(199, 'Singapore', 'SG', 'SGP'),
(200, 'Sint Maarten', 'SX', 'SXM'),
(201, 'Slovakia', 'SK', 'SVK'),
(202, 'Slovenia', 'SI', 'SVN'),
(203, 'Solomon Islands', 'SB', 'SLB'),
(204, 'Somalia', 'SO', 'SOM'),
(205, 'South Africa', 'ZA', 'ZAF'),
(206, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS'),
(207, 'South Korea', 'KR', 'KOR'),
(208, 'South Sudan', 'SS', 'SSD'),
(209, 'Spain', 'ES', 'ESP'),
(210, 'Sri Lanka', 'LK', 'LKA'),
(211, 'Sudan', 'SD', 'SDN'),
(212, 'Suriname', 'SR', 'SUR'),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM'),
(214, 'Swaziland', 'SZ', 'SWZ'),
(215, 'Sweden', 'SE', 'SWE'),
(216, 'Switzerland', 'CH', 'CHE'),
(217, 'Syria', 'SY', 'SYR'),
(218, 'Taiwan', 'TW', 'TWN'),
(219, 'Tajikistan', 'TJ', 'TJK'),
(220, 'Tanzania', 'TZ', 'TZA'),
(221, 'Thailand', 'TH', 'THA'),
(222, 'Timor-Leste (East Timor)', 'TL', 'TLS'),
(223, 'Togo', 'TG', 'TGO'),
(224, 'Tokelau', 'TK', 'TKL'),
(225, 'Tonga', 'TO', 'TON'),
(226, 'Trinidad and Tobago', 'TT', 'TTO'),
(227, 'Tunisia', 'TN', 'TUN'),
(228, 'Turkey', 'TR', 'TUR'),
(229, 'Turkmenistan', 'TM', 'TKM'),
(230, 'Turks and Caicos Islands', 'TC', 'TCA'),
(231, 'Tuvalu', 'TV', 'TUV'),
(232, 'Uganda', 'UG', 'UGA'),
(233, 'Ukraine', 'UA', 'UKR'),
(234, 'United Arab Emirates', 'AE', 'ARE'),
(235, 'United Kingdom', 'GB', 'GBR'),
(236, 'United States', 'US', 'USA'),
(237, 'United States Minor Outlying Islands', 'UM', 'UMI'),
(238, 'Uruguay', 'UY', 'URY'),
(239, 'Uzbekistan', 'UZ', 'UZB'),
(240, 'Vanuatu', 'VU', 'VUT'),
(241, 'Vatican City', 'VA', 'VAT'),
(242, 'Venezuela', 'VE', 'VEN'),
(243, 'Vietnam', 'VN', 'VNM'),
(244, 'Virgin Islands, British', 'VG', 'VGB'),
(245, 'Virgin Islands, US', 'VI', 'VIR'),
(246, 'Wallis and Futuna', 'WF', 'WLF'),
(247, 'Western Sahara', 'EH', 'ESH'),
(248, 'Yemen', 'YE', 'YEM'),
(249, 'Zambia', 'ZM', 'ZMB'),
(250, 'Zimbabwe', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state_name`) VALUES
(36, 102, 'ANDHRA PRADESH'),
(37, 102, 'ASSAM'),
(38, 102, 'ARUNACHAL PRADESH'),
(39, 102, 'GUJRAT'),
(40, 102, 'BIHAR'),
(41, 102, 'HARYANA'),
(42, 102, 'HIMACHAL PRADESH'),
(43, 102, 'JAMMU & KASHMIR'),
(44, 102, 'KARNATAKA'),
(45, 102, 'KERALA'),
(46, 102, 'MADHYA PRADESH'),
(47, 102, 'MAHARASHTRA'),
(48, 102, 'MANIPUR'),
(49, 102, 'MEGHALAYA'),
(50, 102, 'MIZORAM'),
(51, 102, 'NAGALAND'),
(52, 102, 'ORISSA'),
(53, 102, 'PUNJAB'),
(54, 102, 'RAJASTHAN'),
(55, 102, 'SIKKIM'),
(56, 102, 'TAMIL NADU'),
(57, 102, 'TRIPURA'),
(58, 102, 'UTTAR PRADESH'),
(59, 102, 'WEST BENGAL'),
(60, 102, 'DELHI'),
(61, 102, 'GOA'),
(62, 102, 'PONDICHERY'),
(63, 102, 'LAKSHDWEEP'),
(64, 102, 'DAMAN & DIU'),
(65, 102, 'DADRA & NAGAR'),
(66, 102, 'CHANDIGARH'),
(67, 102, 'ANDAMAN & NICOBAR'),
(68, 102, 'UTTARANCHAL'),
(69, 102, 'JHARKHAND'),
(70, 102, 'CHATTISGARH');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ipaddr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
