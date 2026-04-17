-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2026 at 02:37 PM
-- Server version: 8.2.0
-- PHP Version: 8.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_syllabus`
--

DROP TABLE IF EXISTS `academic_syllabus`;
CREATE TABLE IF NOT EXISTS `academic_syllabus` (
  `academic_syllabus_id` int NOT NULL AUTO_INCREMENT,
  `academic_syllabus_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` int DEFAULT NULL,
  `uploader_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `uploader_id` int DEFAULT NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `subject_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`academic_syllabus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
CREATE TABLE IF NOT EXISTS `accountant` (
  `accountant_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`accountant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `bank_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `branch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `account_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `account_type` int NOT NULL,
  `opening_balance` double DEFAULT '0',
  `current_balance` double DEFAULT '0',
  `account_is_bank` int NOT NULL DEFAULT '0',
  `account_is_transferrable` int NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_payable`
--

DROP TABLE IF EXISTS `accounts_payable`;
CREATE TABLE IF NOT EXISTS `accounts_payable` (
  `accounts_payable_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `po_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `amount` double DEFAULT '0',
  `amount_paid` double DEFAULT '0',
  `amount_due` double DEFAULT '0',
  `creation_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `payment_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `payment_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `account_id` int DEFAULT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `track_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `p_prev_paid` double NOT NULL DEFAULT '0',
  `prev_paid` double NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`accounts_payable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
CREATE TABLE IF NOT EXISTS `account_type` (
  `account_type_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`account_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addition`
--

DROP TABLE IF EXISTS `addition`;
CREATE TABLE IF NOT EXISTS `addition` (
  `addi_id` int NOT NULL AUTO_INCREMENT,
  `salary_id` int NOT NULL,
  `basic` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `medical` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `house_rent` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `conveyance` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`addi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_code` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `other_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `ssnit_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ghana_card_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `petra_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `level` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `account_number` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_details` longtext COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `can_collect_daily_fees` tinyint(1) DEFAULT '0' COMMENT '1=can collect fees, 0=cannot',
  `collection_point` enum('classroom','office','bus') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transport_only` tinyint(1) DEFAULT '0' COMMENT '1=can only collect transport fare, 0=can collect all fees',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_category`
--

DROP TABLE IF EXISTS `admission_category`;
CREATE TABLE IF NOT EXISTS `admission_category` (
  `admission_category_id` int NOT NULL AUTO_INCREMENT,
  `admission_category_name` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`admission_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admission_logs`
--

DROP TABLE IF EXISTS `admission_logs`;
CREATE TABLE IF NOT EXISTS `admission_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `admitted_by` int NOT NULL COMMENT 'Admin ID who admitted the student',
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `residence_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bill_items` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'JSON array of bill items with amounts',
  `total_bill_amount` decimal(10,2) NOT NULL,
  `admission_date` int NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `student_id` (`student_id`),
  KEY `admitted_by` (`admitted_by`),
  KEY `admission_date` (`admission_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aggregation`
--

DROP TABLE IF EXISTS `aggregation`;
CREATE TABLE IF NOT EXISTS `aggregation` (
  `aggregate_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `aggregate_mark` double DEFAULT NULL,
  `raw_score` double DEFAULT NULL,
  `grand_total` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `attitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `conduct` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `interest` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c6` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c7` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c8` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c9` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c11` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c12` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c13` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c14` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `c15` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `head_teacher_remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_teacher_remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `days_opened` int DEFAULT '0',
  `days_present` int DEFAULT '0',
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`aggregate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aging_report_snapshots`
--

DROP TABLE IF EXISTS `aging_report_snapshots`;
CREATE TABLE IF NOT EXISTS `aging_report_snapshots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `snapshot_date` date NOT NULL COMMENT 'Date of snapshot',
  `student_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `invoice_code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `days_outstanding` int NOT NULL,
  `age_category` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'current, 30days, 60days, 90days',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `snapshot_date` (`snapshot_date`),
  KEY `student_id` (`student_id`),
  KEY `age_category` (`age_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Historical aging report snapshots';

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
CREATE TABLE IF NOT EXISTS `alumni` (
  `alumni_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `year_batch` longtext COLLATE utf8mb4_unicode_520_ci,
  `class_id` int NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`alumni_id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Alumni, list of completed students';

-- --------------------------------------------------------

--
-- Table structure for table `approval_requests`
--

DROP TABLE IF EXISTS `approval_requests`;
CREATE TABLE IF NOT EXISTS `approval_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_type` enum('invoice_edit','invoice_delete','payment_edit','payment_delete') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `record_id` int NOT NULL COMMENT 'ID of invoice or payment',
  `record_type` enum('invoice','payment') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `requested_by` int NOT NULL,
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `handled_by` int DEFAULT NULL,
  `handled_at` timestamp NULL DEFAULT NULL,
  `handler_notes` text COLLATE utf8mb4_unicode_520_ci,
  `record_data` json DEFAULT NULL COMMENT 'Snapshot of record at request time',
  PRIMARY KEY (`id`),
  KEY `idx_record` (`record_type`,`record_id`),
  KEY `idx_status` (`status`),
  KEY `idx_requested_by` (`requested_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `ass_id` int NOT NULL AUTO_INCREMENT,
  `catid` varchar(14) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ass_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ass_brand` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ass_model` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ass_code` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `configuration` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `purchasing_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ass_price` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ass_qty` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `in_stock` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`ass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets_category`
--

DROP TABLE IF EXISTS `assets_category`;
CREATE TABLE IF NOT EXISTS `assets_category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_status` enum('ASSETS','LOGISTIC') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ASSETS',
  `cat_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_leave`
--

DROP TABLE IF EXISTS `assign_leave`;
CREATE TABLE IF NOT EXISTS `assign_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_id` varchar(11) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type_id` int NOT NULL,
  `day` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `hour` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `total_day` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateyear` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_task`
--

DROP TABLE IF EXISTS `assign_task`;
CREATE TABLE IF NOT EXISTS `assign_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `project_id` int NOT NULL,
  `assign_user` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_type` enum('Team Head','Collaborators') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Collaborators',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `student_id` int NOT NULL,
  `class_routine_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `checked_in` int NOT NULL DEFAULT '0',
  `checked_in_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `checked_out` int NOT NULL DEFAULT '0',
  `checked_out_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mute` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `feeding_charged` decimal(10,2) DEFAULT '0.00' COMMENT 'Feeding amount charged for this day',
  `breakfast_charged` decimal(10,2) DEFAULT '0.00' COMMENT 'Breakfast amount charged for this day',
  `classes_charged` decimal(10,2) DEFAULT '0.00' COMMENT 'Classes amount charged for this day',
  `water_charged` decimal(10,2) DEFAULT '0.00' COMMENT 'Water amount charged for this day',
  `transport_charged` decimal(10,2) DEFAULT '0.00' COMMENT 'Transport amount charged for this day',
  `transport_status` enum('none','in','out','both') COLLATE utf8mb4_unicode_520_ci DEFAULT 'none' COMMENT 'Transport usage for the day',
  `breakfast_opted` tinyint(1) DEFAULT '0' COMMENT '1=student took breakfast, 0=did not take',
  `payment_status` enum('paid','unpaid','partial','advance') COLLATE utf8mb4_unicode_520_ci DEFAULT 'unpaid',
  `marked_by` int DEFAULT NULL COMMENT 'User ID who marked attendance',
  `marked_by_role` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'teacher, cashier, conductor',
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`attendance_id`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_billing_log`
--

DROP TABLE IF EXISTS `attendance_billing_log`;
CREATE TABLE IF NOT EXISTS `attendance_billing_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operation_type` enum('auto_bill','payment','bulk_payment','adjustment') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `performed_by` int DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_operation_date` (`operation_type`,`created_at`),
  KEY `idx_student_log` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
CREATE TABLE IF NOT EXISTS `audit_trail` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `record_type` enum('invoice','payment','journal','budget','expense','account','discount','other') NOT NULL,
  `record_id` int NOT NULL,
  `action` enum('create','update','delete','lock','unlock','post','void','approve','reject') NOT NULL,
  `old_values` text COMMENT 'JSON encoded old values',
  `new_values` text COMMENT 'JSON encoded new values',
  `performed_by` int NOT NULL,
  `performed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`audit_id`),
  KEY `idx_record_type` (`record_type`),
  KEY `idx_record_id` (`record_id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`),
  KEY `idx_performed_at` (`performed_at`),
  KEY `idx_composite` (`record_type`,`record_id`,`performed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `bank_account_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_number` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_type` enum('checking','savings','credit_card','mobile_money') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT 'GHS',
  `opening_balance` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `chart_account_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `branch` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `swift_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_account_id`),
  KEY `chart_account_id` (`chart_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_reconciliations`
--

DROP TABLE IF EXISTS `bank_reconciliations`;
CREATE TABLE IF NOT EXISTS `bank_reconciliations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_account_id` int NOT NULL COMMENT 'Reference to bank account',
  `reconciliation_date` date NOT NULL COMMENT 'Date of reconciliation',
  `statement_date` date NOT NULL COMMENT 'Bank statement date',
  `statement_balance` decimal(12,2) NOT NULL COMMENT 'Balance per bank statement',
  `book_balance` decimal(12,2) NOT NULL COMMENT 'Balance per books',
  `difference` decimal(12,2) NOT NULL COMMENT 'Difference amount',
  `reconciled_items_count` int DEFAULT '0' COMMENT 'Number of items reconciled',
  `reconciled_amount` decimal(12,2) DEFAULT '0.00' COMMENT 'Total reconciled amount',
  `status` enum('pending','completed','reviewed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending' COMMENT 'Reconciliation status',
  `notes` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Reconciliation notes',
  `reconciled_by` int NOT NULL COMMENT 'User who performed reconciliation',
  `reviewed_by` int DEFAULT NULL COMMENT 'User who reviewed',
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bank_account_id` (`bank_account_id`),
  KEY `reconciliation_date` (`reconciliation_date`),
  KEY `status` (`status`),
  KEY `idx_account_date` (`bank_account_id`,`reconciliation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Bank reconciliation records';

-- --------------------------------------------------------

--
-- Table structure for table `bank_transactions`
--

DROP TABLE IF EXISTS `bank_transactions`;
CREATE TABLE IF NOT EXISTS `bank_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `bank_account_id` int NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` enum('deposit','withdrawal','transfer','fee','interest') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `balance_after` decimal(15,2) DEFAULT NULL,
  `reference_number` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `payee_payer` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `journal_entry_id` int DEFAULT NULL,
  `is_reconciled` tinyint(1) DEFAULT '0',
  `reconciled_by` int DEFAULT NULL,
  `reconciled_at` datetime DEFAULT NULL,
  `reconciled_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `bank_account_id` (`bank_account_id`),
  KEY `transaction_date` (`transaction_date`),
  KEY `journal_entry_id` (`journal_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_list`
--

DROP TABLE IF EXISTS `beneficiary_list`;
CREATE TABLE IF NOT EXISTS `beneficiary_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `categories` json NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `year_term` (`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `benefit_category`
--

DROP TABLE IF EXISTS `benefit_category`;
CREATE TABLE IF NOT EXISTS `benefit_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `discount_type_id` int DEFAULT NULL COMMENT 'Optional reference to discount_types for governance',
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `icon` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Visual icon (emoji) for category',
  `details` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1' COMMENT 'Active status flag',
  `created_by` int DEFAULT NULL COMMENT 'Admin ID who created this category',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation timestamp',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update timestamp',
  `sync` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`),
  KEY `idx_discount_type` (`discount_type_id`),
  KEY `idx_is_active` (`is_active`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_history`
--

DROP TABLE IF EXISTS `billing_history`;
CREATE TABLE IF NOT EXISTS `billing_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `billing_date` date NOT NULL,
  `billing_type` enum('feeding','classes','transport') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `amount_charged` decimal(10,2) DEFAULT '0.00',
  `amount_paid` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) DEFAULT '0.00',
  `benefit_category_id` int DEFAULT NULL,
  `discount_applied` decimal(10,2) DEFAULT '0.00',
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_student_billing` (`student_id`,`billing_date`,`billing_type`),
  KEY `idx_billing_date` (`billing_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_category`
--

DROP TABLE IF EXISTS `bill_category`;
CREATE TABLE IF NOT EXISTS `bill_category` (
  `bill_category_id` int NOT NULL AUTO_INCREMENT,
  `bill_category_name` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`bill_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_item`
--

DROP TABLE IF EXISTS `bill_item`;
CREATE TABLE IF NOT EXISTS `bill_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bill_category_id` int NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_item_history`
--

DROP TABLE IF EXISTS `bill_item_history`;
CREATE TABLE IF NOT EXISTS `bill_item_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_item_id` int NOT NULL,
  `class_id` int NOT NULL,
  `term` int NOT NULL,
  `year` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bill_item_amount` double NOT NULL DEFAULT '0',
  `timestamp` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `residence_type` enum('Day','Boarding','Both') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Day',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
CREATE TABLE IF NOT EXISTS `blood_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boarding_bed`
--

DROP TABLE IF EXISTS `boarding_bed`;
CREATE TABLE IF NOT EXISTS `boarding_bed` (
  `bed_id` int NOT NULL AUTO_INCREMENT,
  `bed_code` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dormitory_id` int NOT NULL,
  `bed_status` enum('Available','Assigned','Maintenance','Unknown') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Available',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`bed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boarding_dormitory`
--

DROP TABLE IF EXISTS `boarding_dormitory`;
CREATE TABLE IF NOT EXISTS `boarding_dormitory` (
  `dormitory_id` int NOT NULL AUTO_INCREMENT,
  `dormitory_name` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dormitory_capacity` int DEFAULT NULL,
  `dormitory_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dormitory_floor` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dormitory_description` longtext COLLATE utf8mb4_unicode_520_ci,
  `house_id` int NOT NULL,
  `dormitory_prefect_id` int DEFAULT NULL,
  `dormitory_bed_capacity` bigint NOT NULL DEFAULT '0',
  `dormitory_status` enum('Available','Assigned','Maintenance','Unknown') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Available',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`dormitory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boarding_house`
--

DROP TABLE IF EXISTS `boarding_house`;
CREATE TABLE IF NOT EXISTS `boarding_house` (
  `house_id` int NOT NULL AUTO_INCREMENT,
  `house_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `house_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `house_image_link` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `house_master_id` int DEFAULT NULL,
  `house_gps_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `house_prefect_id` int DEFAULT NULL,
  `house_capacity` bigint NOT NULL DEFAULT '0',
  `house_year_established` text COLLATE utf8mb4_unicode_520_ci,
  `house_user_fee` double NOT NULL DEFAULT '0',
  `house_status` enum('Available','Assigned','Maintenance','Unknown') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Available',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `author` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `total_copies` int DEFAULT NULL,
  `issued_copies` int DEFAULT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_request`
--

DROP TABLE IF EXISTS `book_request`;
CREATE TABLE IF NOT EXISTS `book_request` (
  `book_request_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `issue_start_date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `issue_end_date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `status` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`book_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
CREATE TABLE IF NOT EXISTS `budgets` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `budget_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fiscal_year` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_amount` decimal(15,2) DEFAULT '0.00',
  `status` enum('draft','approved','active','closed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'draft',
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`budget_id`),
  KEY `fiscal_year` (`fiscal_year`),
  KEY `status` (`status`),
  KEY `idx_year_status` (`fiscal_year`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_lines`
--

DROP TABLE IF EXISTS `budget_lines`;
CREATE TABLE IF NOT EXISTS `budget_lines` (
  `budget_line_id` int NOT NULL AUTO_INCREMENT,
  `budget_id` int NOT NULL,
  `account_id` int NOT NULL,
  `budgeted_amount` decimal(15,2) NOT NULL,
  `actual_amount` decimal(15,2) DEFAULT '0.00',
  `variance` decimal(15,2) DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `utilized_amount` decimal(10,2) DEFAULT '0.00',
  `utilization_percentage` decimal(5,2) DEFAULT '0.00',
  `remaining_amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`budget_line_id`),
  KEY `budget_id` (`budget_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budget_utilization_log`
--

DROP TABLE IF EXISTS `budget_utilization_log`;
CREATE TABLE IF NOT EXISTS `budget_utilization_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `budget_id` int NOT NULL,
  `budget_line_id` int NOT NULL,
  `expense_id` int DEFAULT NULL COMMENT 'Reference to expense',
  `amount` decimal(10,2) NOT NULL COMMENT 'Amount utilized',
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recorded_by` int NOT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `budget_id` (`budget_id`),
  KEY `budget_line_id` (`budget_line_id`),
  KEY `expense_id` (`expense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Budget utilization tracking';

-- --------------------------------------------------------

--
-- Table structure for table `bus_attendance`
--

DROP TABLE IF EXISTS `bus_attendance`;
CREATE TABLE IF NOT EXISTS `bus_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `route_id` int DEFAULT NULL,
  `attendance_date` int NOT NULL,
  `transport_direction` varchar(10) DEFAULT 'none',
  `boarded_in` tinyint(1) DEFAULT '0',
  `boarded_out` tinyint(1) DEFAULT '0',
  `in_time` varchar(10) DEFAULT NULL,
  `out_time` varchar(10) DEFAULT NULL,
  `in_fare` decimal(10,2) DEFAULT '0.00',
  `out_fare` decimal(10,2) DEFAULT '0.00',
  `total_fare` decimal(10,2) DEFAULT '0.00',
  `amount_charged` decimal(10,2) DEFAULT '0.00',
  `payment_status` varchar(20) DEFAULT 'pending',
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `payment_time` int DEFAULT NULL,
  `payment_source` varchar(20) DEFAULT NULL,
  `cash_collected` decimal(10,2) DEFAULT '0.00',
  `prepaid_deducted` decimal(10,2) DEFAULT '0.00',
  `collected_by` int DEFAULT NULL,
  `collected_by_role` varchar(20) DEFAULT NULL,
  `collection_point` varchar(20) DEFAULT 'office',
  `conductor_id` int DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `term` varchar(10) DEFAULT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `attendance_date` (`attendance_date`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

DROP TABLE IF EXISTS `chart_of_accounts`;
CREATE TABLE IF NOT EXISTS `chart_of_accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_type` enum('asset','liability','equity','revenue','expense') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `account_category` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `parent_account_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `opening_balance` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_code` (`account_code`),
  KEY `parent_account_id` (`parent_account_id`),
  KEY `account_type` (`account_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `category` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT 'Pre-School',
  `name_numeric` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `teacher_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`class_id`),
  KEY `idx_category` (`category`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_routine`
--

DROP TABLE IF EXISTS `class_routine`;
CREATE TABLE IF NOT EXISTS `class_routine` (
  `class_routine_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `time_start` int DEFAULT NULL,
  `time_end` int DEFAULT NULL,
  `time_start_min` int DEFAULT NULL,
  `time_end_min` int DEFAULT NULL,
  `day` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`class_routine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_applications`
--

DROP TABLE IF EXISTS `credit_applications`;
CREATE TABLE IF NOT EXISTS `credit_applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `credit_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `invoice_code` varchar(50) DEFAULT NULL,
  `applied_amount` decimal(10,2) NOT NULL,
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `applied_by` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`application_id`),
  KEY `idx_credit_id` (`credit_id`),
  KEY `idx_invoice_id` (`invoice_id`),
  KEY `idx_applied_at` (`applied_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

DROP TABLE IF EXISTS `credit_notes`;
CREATE TABLE IF NOT EXISTS `credit_notes` (
  `credit_note_id` int NOT NULL AUTO_INCREMENT,
  `credit_note_number` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('pending','approved','applied','cancelled') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `created_at` int NOT NULL,
  `created_by` int NOT NULL,
  `approved_at` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `applied_at` int DEFAULT NULL,
  PRIMARY KEY (`credit_note_id`),
  UNIQUE KEY `unique_credit_note_number` (`credit_note_number`),
  KEY `idx_student` (`student_id`),
  KEY `idx_invoice` (`invoice_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_system_logs`
--

DROP TABLE IF EXISTS `credit_system_logs`;
CREATE TABLE IF NOT EXISTS `credit_system_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `action` enum('credit_created','credit_applied','credit_adjusted','credit_expired') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference_id` int DEFAULT NULL,
  `reference_type` enum('payment','invoice','adjustment') DEFAULT NULL,
  `performed_by` int DEFAULT NULL,
  `details` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `idx_student_action` (`student_id`,`action`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_indicators`
--

DROP TABLE IF EXISTS `curriculum_indicators`;
CREATE TABLE IF NOT EXISTS `curriculum_indicators` (
  `indicator_id` int NOT NULL AUTO_INCREMENT,
  `sub_strand_id` int NOT NULL,
  `indicator_code` varchar(20) NOT NULL,
  `indicator_text` text NOT NULL,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`indicator_id`),
  UNIQUE KEY `unique_indicator` (`indicator_code`,`sub_strand_id`),
  KEY `idx_sub_strand` (`sub_strand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_strands`
--

DROP TABLE IF EXISTS `curriculum_strands`;
CREATE TABLE IF NOT EXISTS `curriculum_strands` (
  `strand_id` int NOT NULL AUTO_INCREMENT,
  `strand_code` varchar(20) NOT NULL,
  `strand_name` varchar(200) NOT NULL,
  `subject_id` int NOT NULL,
  `class_category` varchar(50) NOT NULL,
  `description` text,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`strand_id`),
  UNIQUE KEY `unique_strand` (`strand_code`,`subject_id`,`class_category`),
  KEY `idx_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_sub_strands`
--

DROP TABLE IF EXISTS `curriculum_sub_strands`;
CREATE TABLE IF NOT EXISTS `curriculum_sub_strands` (
  `sub_strand_id` int NOT NULL AUTO_INCREMENT,
  `strand_id` int NOT NULL,
  `sub_strand_code` varchar(20) NOT NULL,
  `sub_strand_name` varchar(200) NOT NULL,
  `description` text,
  `display_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_strand_id`),
  UNIQUE KEY `unique_sub_strand` (`sub_strand_code`,`strand_id`),
  KEY `idx_strand` (`strand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_charge_log`
--

DROP TABLE IF EXISTS `daily_charge_log`;
CREATE TABLE IF NOT EXISTS `daily_charge_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `charge_date` int NOT NULL COMMENT 'Midnight timestamp of the day',
  `feeding_charged` decimal(10,2) DEFAULT '0.00',
  `breakfast_charged` decimal(10,2) DEFAULT '0.00',
  `classes_charged` decimal(10,2) DEFAULT '0.00',
  `water_charged` decimal(10,2) DEFAULT '0.00',
  `transport_charged` decimal(10,2) DEFAULT '0.00',
  `total_charged` decimal(10,2) DEFAULT '0.00',
  `charged_at` int NOT NULL,
  `synced_to_ledger` tinyint(1) DEFAULT '0' COMMENT 'Whether synced to student ledger',
  `ledger_entry_id` int DEFAULT NULL COMMENT 'Reference to student_ledger table',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_date` (`student_id`,`charge_date`),
  KEY `charge_date` (`charge_date`),
  KEY `idx_charge_sync` (`synced_to_ledger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_fee_audit_log`
--

DROP TABLE IF EXISTS `daily_fee_audit_log`;
CREATE TABLE IF NOT EXISTS `daily_fee_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `action_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'charge, payment, adjustment, refund',
  `fee_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'feeding, breakfast, classes, water, transport',
  `amount` decimal(10,2) NOT NULL,
  `balance_before` decimal(10,2) DEFAULT '0.00',
  `balance_after` decimal(10,2) DEFAULT '0.00',
  `arrears_before` decimal(10,2) DEFAULT '0.00',
  `arrears_after` decimal(10,2) DEFAULT '0.00',
  `performed_by` int NOT NULL,
  `performed_by_role` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference_id` int DEFAULT NULL COMMENT 'Reference to transaction or attendance ID',
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `created_at` int NOT NULL,
  `modified_at` int NOT NULL,
  `modified_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_fee_rates`
--

DROP TABLE IF EXISTS `daily_fee_rates`;
CREATE TABLE IF NOT EXISTS `daily_fee_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `feeding_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'Daily feeding/lunch charge',
  `breakfast_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'Daily breakfast charge',
  `classes_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'Daily classes charge',
  `water_rate` decimal(10,2) DEFAULT '0.00' COMMENT 'Weekly water charge',
  `breakfast_enabled` tinyint(1) DEFAULT '0' COMMENT '1=breakfast available, 0=not available',
  `water_enabled` tinyint(1) DEFAULT '0' COMMENT '1=water charge enabled, 0=disabled',
  `year` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` int DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`,`year`,`term`,`sem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_fee_transactions`
--

DROP TABLE IF EXISTS `daily_fee_transactions`;
CREATE TABLE IF NOT EXISTS `daily_fee_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int NOT NULL,
  `payment_date` int NOT NULL,
  `feeding_amount` decimal(10,2) DEFAULT '0.00',
  `breakfast_amount` decimal(10,2) DEFAULT '0.00',
  `classes_amount` decimal(10,2) DEFAULT '0.00',
  `water_amount` decimal(10,2) DEFAULT '0.00',
  `transport_amount` decimal(10,2) DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL,
  `payment_type` enum('arrears','current','advance','mixed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'current',
  `payment_method` int DEFAULT '1' COMMENT '1=cash, 2=cheque, 3=momo, 4=bank',
  `collected_by` int NOT NULL COMMENT 'User ID who collected payment',
  `collection_point` enum('classroom','office','bus') COLLATE utf8mb4_unicode_520_ci DEFAULT 'office',
  `receipt_number` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `synced_to_accounts` tinyint(1) DEFAULT '0',
  `journal_entry_id` int DEFAULT NULL,
  `synced_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `modified_at` int NOT NULL,
  `modified_by` int NOT NULL,
  `modification_count` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `student_id` (`student_id`,`payment_date`),
  KEY `idx_year_term` (`year`,`term`),
  KEY `idx_synced` (`synced_to_accounts`),
  KEY `idx_journal_entry` (`journal_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_fee_wallet`
--

DROP TABLE IF EXISTS `daily_fee_wallet`;
CREATE TABLE IF NOT EXISTS `daily_fee_wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `feeding_balance` decimal(10,2) DEFAULT '0.00' COMMENT 'Prepaid balance for feeding/lunch',
  `breakfast_balance` decimal(10,2) DEFAULT '0.00' COMMENT 'Prepaid balance for breakfast',
  `classes_balance` decimal(10,2) DEFAULT '0.00' COMMENT 'Prepaid balance for classes',
  `water_balance` decimal(10,2) DEFAULT '0.00' COMMENT 'Prepaid balance for water',
  `transport_balance` decimal(10,2) DEFAULT '0.00' COMMENT 'Prepaid balance for transport',
  `feeding_arrears` decimal(10,2) DEFAULT '0.00' COMMENT 'Outstanding feeding debt',
  `breakfast_arrears` decimal(10,2) DEFAULT '0.00' COMMENT 'Outstanding breakfast debt',
  `classes_arrears` decimal(10,2) DEFAULT '0.00' COMMENT 'Outstanding classes debt',
  `water_arrears` decimal(10,2) DEFAULT '0.00' COMMENT 'Outstanding water debt',
  `transport_arrears` decimal(10,2) DEFAULT '0.00' COMMENT 'Outstanding transport debt',
  `last_updated` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  KEY `idx_year_term` (`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_transport_choices`
--

DROP TABLE IF EXISTS `daily_transport_choices`;
CREATE TABLE IF NOT EXISTS `daily_transport_choices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `choice_date` int NOT NULL COMMENT 'Date for which choice is made',
  `transport_direction` enum('none','in','out','both') COLLATE utf8mb4_unicode_520_ci DEFAULT 'none',
  `choice_made_at` int NOT NULL COMMENT 'When parent made the choice',
  `choice_made_by` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'parent, teacher, admin',
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Optional reason/note',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_date` (`student_id`,`choice_date`),
  KEY `student_id` (`student_id`,`choice_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desciplinary`
--

DROP TABLE IF EXISTS `desciplinary`;
CREATE TABLE IF NOT EXISTS `desciplinary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `action` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `des_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_applications`
--

DROP TABLE IF EXISTS `discount_applications`;
CREATE TABLE IF NOT EXISTS `discount_applications` (
  `application_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `discount_category` enum('invoice','daily_fees') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'invoice, daily_fee_transaction',
  `reference_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'invoice_code or transaction_id',
  `bill_item_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'school_fees, feeding, classes, etc',
  `original_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `final_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `year` int NOT NULL,
  `term` int DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `applied_by` int NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`application_id`),
  KEY `idx_student` (`student_id`),
  KEY `idx_profile` (`profile_id`),
  KEY `idx_category` (`discount_category`),
  KEY `idx_year_term` (`year`,`term`),
  KEY `idx_applied_at` (`applied_at`),
  KEY `idx_reference` (`reference_type`,`reference_id`),
  KEY `idx_reporting` (`discount_category`,`year`,`term`,`applied_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Enterprise discount application ledger';

-- --------------------------------------------------------

--
-- Table structure for table `discount_approvals`
--

DROP TABLE IF EXISTS `discount_approvals`;
CREATE TABLE IF NOT EXISTS `discount_approvals` (
  `approval_id` int NOT NULL AUTO_INCREMENT,
  `discount_type_id` int NOT NULL,
  `requested_by` int NOT NULL,
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `reason` text COLLATE utf8mb4_unicode_520_ci,
  `approval_notes` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`approval_id`),
  KEY `discount_type_id` (`discount_type_id`),
  KEY `idx_status` (`status`),
  KEY `idx_requested_by` (`requested_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_audit_log`
--

DROP TABLE IF EXISTS `discount_audit_log`;
CREATE TABLE IF NOT EXISTS `discount_audit_log` (
  `audit_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `application_id` bigint UNSIGNED DEFAULT NULL,
  `action` enum('created','modified','reversed','approved','rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `entity_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `entity_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `performed_by` int NOT NULL,
  `performed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`audit_id`),
  KEY `idx_application` (`application_id`),
  KEY `idx_entity` (`entity_type`,`entity_id`),
  KEY `idx_performed_at` (`performed_at`),
  KEY `idx_performed_by` (`performed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Comprehensive audit trail for discount operations';

-- --------------------------------------------------------

--
-- Table structure for table `discount_audit_trail`
--

DROP TABLE IF EXISTS `discount_audit_trail`;
CREATE TABLE IF NOT EXISTS `discount_audit_trail` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `entity_type` enum('discount_type','benefit_category','student_assignment') COLLATE utf8mb4_unicode_520_ci DEFAULT 'discount_type' COMMENT 'Type of entity being audited',
  `entity_id` int NOT NULL COMMENT 'ID of discount_type or benefit_category',
  `action` enum('created','updated','deleted','activated','deactivated') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_520_ci,
  `new_values` text COLLATE utf8mb4_unicode_520_ci,
  `changed_by` int NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  KEY `idx_discount_type` (`entity_id`),
  KEY `idx_action` (`action`),
  KEY `idx_changed_at` (`changed_at`),
  KEY `idx_entity` (`entity_type`,`entity_id`),
  KEY `idx_changed_by` (`changed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_categories`
--

DROP TABLE IF EXISTS `discount_categories`;
CREATE TABLE IF NOT EXISTS `discount_categories` (
  `category_id` tinyint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_code` (`code`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_profiles`
--

DROP TABLE IF EXISTS `discount_profiles`;
CREATE TABLE IF NOT EXISTS `discount_profiles` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bill_item_ids` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `discount_category` enum('invoice','daily_fees') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'invoice',
  `discount_method` enum('percentage','fixed') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `profile_name` (`profile_name`),
  KEY `idx_discount_category` (`discount_category`,`is_active`),
  KEY `idx_bill_item_ids` (`bill_item_ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_profile_rules`
--

DROP TABLE IF EXISTS `discount_profile_rules`;
CREATE TABLE IF NOT EXISTS `discount_profile_rules` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `class_id` int DEFAULT NULL COMMENT 'NULL or 0 means all classes',
  `bill_category_id` int DEFAULT NULL COMMENT 'NULL means all bill categories',
  `discount_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rule_id`),
  KEY `profile_id` (`profile_id`),
  KEY `class_id` (`class_id`),
  KEY `bill_category_id` (`bill_category_id`),
  KEY `idx_profile_class` (`profile_id`,`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_summary_cache`
--

DROP TABLE IF EXISTS `discount_summary_cache`;
CREATE TABLE IF NOT EXISTS `discount_summary_cache` (
  `cache_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `discount_category` enum('invoice','daily_fees') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `year` int NOT NULL,
  `term` int DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `total_applications` int NOT NULL DEFAULT '0',
  `total_original_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_final_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `unique_students` int NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cache_id`),
  UNIQUE KEY `idx_unique_summary` (`discount_category`,`year`,`term`,`profile_id`),
  KEY `idx_category_period` (`discount_category`,`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Aggregated discount statistics cache';

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `file_path` longtext COLLATE utf8mb4_unicode_520_ci,
  `file_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `teacher_id` int DEFAULT NULL,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `start_date` longtext COLLATE utf8mb4_unicode_520_ci,
  `end_date` longtext COLLATE utf8mb4_unicode_520_ci,
  `subject_id` int DEFAULT NULL,
  `status` enum('Approved','Declined','Pending') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Pending',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE IF NOT EXISTS `dormitory` (
  `dormitory_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `number_of_room` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`dormitory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earned_leave`
--

DROP TABLE IF EXISTS `earned_leave`;
CREATE TABLE IF NOT EXISTS `earned_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `present_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `hour` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `edu_type` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `institute` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `result` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `year` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` enum('invoice','receipt','notification','other') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sent_at` int NOT NULL,
  `status` enum('sent','failed','pending') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `error_message` text COLLATE utf8mb4_unicode_520_ci,
  `sent_by` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_recipient` (`recipient`),
  KEY `idx_type` (`type`),
  KEY `idx_reference` (`reference_id`),
  KEY `idx_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

DROP TABLE IF EXISTS `email_logs`;
CREATE TABLE IF NOT EXISTS `email_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('sent','failed') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'sent',
  `sent_at` datetime NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `recipient` (`recipient`),
  KEY `status` (`status`),
  KEY `sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_code` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `des_id` int DEFAULT NULL,
  `dep_id` int DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_email` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_password` varchar(512) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `em_role` enum('ADMIN','EMPLOYEE','SUPER ADMIN') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'EMPLOYEE',
  `em_address` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVE',
  `em_gender` enum('Male','Female') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Male',
  `em_phone` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_phone2` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_birthday` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_blood_group` enum('O+','O-','A+','A-','B+','B-','AB+','OB+') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_joining_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_contact_end` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_image` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `em_nid` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_file`
--

DROP TABLE IF EXISTS `employee_file`;
CREATE TABLE IF NOT EXISTS `employee_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `file_title` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `file_url` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_address`
--

DROP TABLE IF EXISTS `emp_address`;
CREATE TABLE IF NOT EXISTS `emp_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` enum('Present','Permanent') COLLATE utf8mb4_unicode_520_ci DEFAULT 'Present',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_assets`
--

DROP TABLE IF EXISTS `emp_assets`;
CREATE TABLE IF NOT EXISTS `emp_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `assets_id` int NOT NULL,
  `given_date` date NOT NULL,
  `return_date` date NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

DROP TABLE IF EXISTS `emp_attendance`;
CREATE TABLE IF NOT EXISTS `emp_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `atten_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `signin_time` time DEFAULT NULL,
  `signout_time` time DEFAULT NULL,
  `working_hour` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `absence` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `overtime` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `earnleave` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_bank_info`
--

DROP TABLE IF EXISTS `emp_bank_info`;
CREATE TABLE IF NOT EXISTS `emp_bank_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `holder_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bank_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `branch_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_number` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_type` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_experience`
--

DROP TABLE IF EXISTS `emp_experience`;
CREATE TABLE IF NOT EXISTS `emp_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `exp_company` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `exp_com_position` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `exp_com_address` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `exp_workduration` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

DROP TABLE IF EXISTS `emp_leave`;
CREATE TABLE IF NOT EXISTS `emp_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `em_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `typeid` int NOT NULL,
  `leave_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `end_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `leave_duration` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `apply_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `reason` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `leave_status` enum('Approve','Not Approve','Rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Not Approve',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_penalty`
--

DROP TABLE IF EXISTS `emp_penalty`;
CREATE TABLE IF NOT EXISTS `emp_penalty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `penalty_id` int NOT NULL,
  `penalty_desc` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_salary`
--

DROP TABLE IF EXISTS `emp_salary`;
CREATE TABLE IF NOT EXISTS `emp_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type_id` int NOT NULL,
  `total` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emp_training`
--

DROP TABLE IF EXISTS `emp_training`;
CREATE TABLE IF NOT EXISTS `emp_training` (
  `id` int NOT NULL,
  `trainig_id` int NOT NULL,
  `emp_id` int NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
CREATE TABLE IF NOT EXISTS `enroll` (
  `enroll_id` int NOT NULL AUTO_INCREMENT,
  `enroll_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `transport_id` int DEFAULT NULL,
  `roll` int DEFAULT NULL,
  `date_added` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `status` enum('open','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'open',
  `status_attendance` enum('open','close') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'open',
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mute` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `residence_type` enum('Day','Boarding') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Day',
  `house_id` int DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `bed_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`enroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_exams`
--

DROP TABLE IF EXISTS `enterprise_exams`;
CREATE TABLE IF NOT EXISTS `enterprise_exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(100) NOT NULL,
  `exam_type` enum('mid_term','end_term','mock','waec') NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` varchar(10) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('draft','active','completed','published') DEFAULT 'draft',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`),
  KEY `idx_class_year_term` (`class_id`,`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_exam_subjects`
--

DROP TABLE IF EXISTS `enterprise_exam_subjects`;
CREATE TABLE IF NOT EXISTS `enterprise_exam_subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `total_marks` int DEFAULT '100',
  `pass_mark` int DEFAULT '50',
  `weight_percentage` decimal(5,2) DEFAULT '100.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_exam_subject` (`exam_id`,`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_student_marks`
--

DROP TABLE IF EXISTS `enterprise_student_marks`;
CREATE TABLE IF NOT EXISTS `enterprise_student_marks` (
  `mark_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_score` decimal(5,2) DEFAULT '0.00',
  `exam_score` decimal(5,2) DEFAULT '0.00',
  `total_score` decimal(5,2) GENERATED ALWAYS AS ((`class_score` + `exam_score`)) STORED,
  `grade` varchar(2) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `recorded_by` int DEFAULT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mark_id`),
  UNIQUE KEY `unique_student_exam_subject` (`exam_id`,`student_id`,`subject_id`),
  KEY `idx_student_exam` (`student_id`,`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enterprise_terminal_reports`
--

DROP TABLE IF EXISTS `enterprise_terminal_reports`;
CREATE TABLE IF NOT EXISTS `enterprise_terminal_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` varchar(10) NOT NULL,
  `total_score` decimal(8,2) DEFAULT NULL,
  `average_score` decimal(5,2) DEFAULT NULL,
  `aggregate` decimal(5,2) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `out_of` int DEFAULT NULL,
  `attendance_present` int DEFAULT '0',
  `attendance_total` int DEFAULT '0',
  `conduct` text,
  `interest` text,
  `head_teacher_remarks` text,
  `status` enum('draft','published') DEFAULT 'draft',
  `generated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `unique_student_exam` (`student_id`,`exam_id`),
  KEY `idx_class_year_term` (`class_id`,`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `category_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_category`
--

DROP TABLE IF EXISTS `exam_category`;
CREATE TABLE IF NOT EXISTS `exam_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

DROP TABLE IF EXISTS `exam_marks`;
CREATE TABLE IF NOT EXISTS `exam_marks` (
  `mark_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` varchar(10) NOT NULL,
  `total_score` decimal(5,2) DEFAULT '0.00',
  `grade` varchar(2) DEFAULT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mark_id`),
  UNIQUE KEY `unique_student_subject` (`student_id`,`subject_id`,`year`,`term`),
  KEY `idx_student` (`student_id`),
  KEY `idx_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_enhanced`
--

DROP TABLE IF EXISTS `expenses_enhanced`;
CREATE TABLE IF NOT EXISTS `expenses_enhanced` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL COMMENT 'Date of expense',
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Expense description',
  `category_id` int NOT NULL COMMENT 'Expense category',
  `budget_line_id` int DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Vendor/Supplier name',
  `amount` decimal(10,2) NOT NULL COMMENT 'Expense amount',
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'cash, bank_transfer, cheque, mobile_money',
  `reference_number` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Payment reference',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Receipt/invoice file path',
  `notes` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Additional notes',
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending' COMMENT 'Approval status',
  `requested_by` int NOT NULL COMMENT 'User who submitted',
  `approved_by` int DEFAULT NULL COMMENT 'User who approved/rejected',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT 'Approval timestamp',
  `rejection_reason` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Reason for rejection',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `linked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_date` (`expense_date`),
  KEY `category_id` (`category_id`),
  KEY `status` (`status`),
  KEY `requested_by` (`requested_by`),
  KEY `approved_by` (`approved_by`),
  KEY `idx_date_status` (`expense_date`,`status`),
  KEY `budget_line_id` (`budget_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Enhanced expense tracking with approval workflow';

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories_enhanced`
--

DROP TABLE IF EXISTS `expense_categories_enhanced`;
CREATE TABLE IF NOT EXISTS `expense_categories_enhanced` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Category name',
  `description` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Category description',
  `budget_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Budget account code',
  `requires_approval` tinyint(1) DEFAULT '1' COMMENT 'Requires approval flag',
  `approval_threshold` decimal(10,2) DEFAULT NULL COMMENT 'Auto-approve below this amount',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Expense categories';

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

DROP TABLE IF EXISTS `expense_category`;
CREATE TABLE IF NOT EXISTS `expense_category` (
  `expense_category_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `icon` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT 'folder',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_collection_assignments`
--

DROP TABLE IF EXISTS `fee_collection_assignments`;
CREATE TABLE IF NOT EXISTS `fee_collection_assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `class_id` int NOT NULL,
  `can_collect_feeding` tinyint(1) DEFAULT '0',
  `can_collect_classes` tinyint(1) DEFAULT '0',
  `can_collect_transport` tinyint(1) DEFAULT '0',
  `can_collect_breakfast` tinyint(1) NOT NULL DEFAULT '0',
  `can_collect_water` tinyint(1) NOT NULL DEFAULT '0',
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_assignment` (`teacher_id`,`class_id`,`year`,`term`),
  KEY `teacher_id` (`teacher_id`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_structures`
--

DROP TABLE IF EXISTS `fee_structures`;
CREATE TABLE IF NOT EXISTS `fee_structures` (
  `structure_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `academic_year` int NOT NULL,
  `term` int NOT NULL,
  `fee_items` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'JSON array of fee items',
  `total_amount` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`structure_id`),
  KEY `class_id` (`class_id`),
  KEY `academic_year` (`academic_year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_visit`
--

DROP TABLE IF EXISTS `field_visit`;
CREATE TABLE IF NOT EXISTS `field_visit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` varchar(256) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `field_location` varchar(512) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `approx_end_date` varchar(28) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `total_days` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `actual_return_date` varchar(28) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('Approved','Not Approve','Rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Not Approve',
  `attendance_updated` varchar(11) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_audit_trail`
--

DROP TABLE IF EXISTS `finance_audit_trail`;
CREATE TABLE IF NOT EXISTS `finance_audit_trail` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `record_id` int NOT NULL,
  `action` enum('create','update','delete','post','void') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_520_ci,
  `new_values` text COLLATE utf8mb4_unicode_520_ci,
  `user_id` int NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`),
  KEY `table_record` (`table_name`,`record_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_dashboard_cache`
--

DROP TABLE IF EXISTS `finance_dashboard_cache`;
CREATE TABLE IF NOT EXISTS `finance_dashboard_cache` (
  `cache_id` int NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cache_data` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `year` int NOT NULL,
  `term` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cache_id`),
  UNIQUE KEY `cache_key_year_term` (`cache_key`,`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_alert_resolutions`
--

DROP TABLE IF EXISTS `financial_alert_resolutions`;
CREATE TABLE IF NOT EXISTS `financial_alert_resolutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alert_key` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `resolved_by` int NOT NULL,
  `resolved_at` int NOT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `alert_key` (`alert_key`),
  KEY `resolved_at` (`resolved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_analytics_cache`
--

DROP TABLE IF EXISTS `financial_analytics_cache`;
CREATE TABLE IF NOT EXISTS `financial_analytics_cache` (
  `cache_id` int NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cache_data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `period` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` int NOT NULL,
  `expires_at` int NOT NULL,
  PRIMARY KEY (`cache_id`),
  UNIQUE KEY `unique_cache_key` (`cache_key`,`period`),
  KEY `idx_expires` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_audit_trail`
--

DROP TABLE IF EXISTS `financial_audit_trail`;
CREATE TABLE IF NOT EXISTS `financial_audit_trail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Module name (expense, budget, reconciliation, etc)',
  `action` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Action performed (create, update, delete, approve, etc)',
  `record_id` int NOT NULL COMMENT 'ID of affected record',
  `old_values` text COLLATE utf8mb4_unicode_520_ci COMMENT 'JSON of old values',
  `new_values` text COLLATE utf8mb4_unicode_520_ci COMMENT 'JSON of new values',
  `user_id` int NOT NULL COMMENT 'User who performed action',
  `user_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'admin, teacher, etc',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `action` (`action`),
  KEY `record_id` (`record_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Audit trail for financial operations';

-- --------------------------------------------------------

--
-- Table structure for table `financial_integration_log`
--

DROP TABLE IF EXISTS `financial_integration_log`;
CREATE TABLE IF NOT EXISTS `financial_integration_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `integration_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'fee_to_accounts, invoice_to_accounts, etc',
  `source_table` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source_id` int NOT NULL,
  `target_table` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `target_id` int DEFAULT NULL,
  `status` enum('pending','success','failed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `error_message` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` int NOT NULL,
  `processed_at` int DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `idx_integration_type` (`integration_type`),
  KEY `idx_status` (`status`),
  KEY `idx_source` (`source_table`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_reports_cache`
--

DROP TABLE IF EXISTS `financial_reports_cache`;
CREATE TABLE IF NOT EXISTS `financial_reports_cache` (
  `cache_id` int NOT NULL AUTO_INCREMENT,
  `report_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `report_parameters` text COLLATE utf8mb4_unicode_520_ci,
  `report_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `generated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `report_type` (`report_type`),
  KEY `expires_at` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_periods`
--

DROP TABLE IF EXISTS `fiscal_periods`;
CREATE TABLE IF NOT EXISTS `fiscal_periods` (
  `period_id` int NOT NULL AUTO_INCREMENT,
  `fiscal_year_id` int NOT NULL,
  `period_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `period_number` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('open','closed','locked') COLLATE utf8mb4_unicode_520_ci DEFAULT 'open',
  `closed_by` int DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`period_id`),
  KEY `fiscal_year_id` (`fiscal_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_years`
--

DROP TABLE IF EXISTS `fiscal_years`;
CREATE TABLE IF NOT EXISTS `fiscal_years` (
  `fiscal_year_id` int NOT NULL AUTO_INCREMENT,
  `year_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('open','closed','locked') COLLATE utf8mb4_unicode_520_ci DEFAULT 'open',
  `is_current` tinyint(1) DEFAULT '0',
  `closed_by` int DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fiscal_year_id`),
  UNIQUE KEY `year_name` (`year_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flutter_user`
--

DROP TABLE IF EXISTS `flutter_user`;
CREATE TABLE IF NOT EXISTS `flutter_user` (
  `flutter_id` int NOT NULL AUTO_INCREMENT,
  `flutter_name` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `flutter_phone` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `flutter_email` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `flutter_password` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`flutter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_preferences`
--

DROP TABLE IF EXISTS `form_field_preferences`;
CREATE TABLE IF NOT EXISTS `form_field_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(100) NOT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_field` (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_events`
--

DROP TABLE IF EXISTS `frontend_events`;
CREATE TABLE IF NOT EXISTS `frontend_events` (
  `frontend_events_id` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`frontend_events_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_gallery`
--

DROP TABLE IF EXISTS `frontend_gallery`;
CREATE TABLE IF NOT EXISTS `frontend_gallery` (
  `frontend_gallery_id` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date_added` int DEFAULT NULL,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `show_on_website` int NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`frontend_gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_gallery_image`
--

DROP TABLE IF EXISTS `frontend_gallery_image`;
CREATE TABLE IF NOT EXISTS `frontend_gallery_image` (
  `frontend_gallery_image_id` int NOT NULL AUTO_INCREMENT,
  `frontend_gallery_id` int DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`frontend_gallery_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_general_settings`
--

DROP TABLE IF EXISTS `frontend_general_settings`;
CREATE TABLE IF NOT EXISTS `frontend_general_settings` (
  `frontend_general_settings_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`frontend_general_settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_news`
--

DROP TABLE IF EXISTS `frontend_news`;
CREATE TABLE IF NOT EXISTS `frontend_news` (
  `frontend_news_id` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date_added` int DEFAULT NULL,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`frontend_news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `grade_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `grade_point_numeric` double NOT NULL DEFAULT '0',
  `mark_from` double DEFAULT NULL,
  `mark_upto` double DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_2`
--

DROP TABLE IF EXISTS `grade_2`;
CREATE TABLE IF NOT EXISTS `grade_2` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `grade_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mark_from` double DEFAULT NULL,
  `mark_upto` double DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_creche`
--

DROP TABLE IF EXISTS `grade_creche`;
CREATE TABLE IF NOT EXISTS `grade_creche` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `full_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `abbrev` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_message`
--

DROP TABLE IF EXISTS `group_message`;
CREATE TABLE IF NOT EXISTS `group_message` (
  `group_message_id` int NOT NULL AUTO_INCREMENT,
  `group_message_thread_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_status` int DEFAULT NULL,
  `attached_file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`group_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_message_other`
--

DROP TABLE IF EXISTS `group_message_other`;
CREATE TABLE IF NOT EXISTS `group_message_other` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `group_message_thread` int NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_message_thread`
--

DROP TABLE IF EXISTS `group_message_thread`;
CREATE TABLE IF NOT EXISTS `group_message_thread` (
  `group_message_thread_id` int NOT NULL AUTO_INCREMENT,
  `group_message_thread_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `group_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `last_message_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `created_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`group_message_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
CREATE TABLE IF NOT EXISTS `holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `from_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `to_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `number_of_days` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `year` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hubtel_transaction_logs`
--

DROP TABLE IF EXISTS `hubtel_transaction_logs`;
CREATE TABLE IF NOT EXISTS `hubtel_transaction_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `transaction_ref` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `request_data` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `response_data` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `response_code` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `transaction_ref` (`transaction_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomplete_fee_transactions`
--

DROP TABLE IF EXISTS `incomplete_fee_transactions`;
CREATE TABLE IF NOT EXISTS `incomplete_fee_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `fees` text COLLATE utf8mb4_unicode_520_ci,
  `tendered` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_date` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_audit_log`
--

DROP TABLE IF EXISTS `inventory_audit_log`;
CREATE TABLE IF NOT EXISTS `inventory_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_type` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int NOT NULL,
  `old_values` text,
  `new_values` text,
  `performed_by` int NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_record` (`table_name`,`record_id`),
  KEY `idx_date` (`created_at`),
  KEY `idx_action` (`action_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_categories`
--

DROP TABLE IF EXISTS `inventory_categories`;
CREATE TABLE IF NOT EXISTS `inventory_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_locations`
--

DROP TABLE IF EXISTS `inventory_locations`;
CREATE TABLE IF NOT EXISTS `inventory_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `manager_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_products`
--

DROP TABLE IF EXISTS `inventory_products`;
CREATE TABLE IF NOT EXISTS `inventory_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `last_restocked` date DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_asset` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `selling_price` decimal(10,2) DEFAULT '0.00',
  `quantity` int DEFAULT '0',
  `unit_of_measure` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pieces',
  `reorder_level` int DEFAULT '10',
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `idx_category` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_quantity` (`quantity`),
  KEY `idx_barcode` (`barcode`),
  KEY `idx_supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sales`
--

DROP TABLE IF EXISTS `inventory_sales`;
CREATE TABLE IF NOT EXISTS `inventory_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` tinyint(1) DEFAULT '1' COMMENT '1=Cash, 2=Bank, 3=Mobile Money',
  `served_by` int DEFAULT NULL,
  `sale_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_student` (`student_id`),
  KEY `idx_sale_date` (`sale_date`),
  KEY `idx_served_by` (`served_by`),
  KEY `idx_date` (`sale_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sale_items`
--

DROP TABLE IF EXISTS `inventory_sale_items`;
CREATE TABLE IF NOT EXISTS `inventory_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sale` (`sale_id`),
  KEY `idx_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stock_movements`
--

DROP TABLE IF EXISTS `inventory_stock_movements`;
CREATE TABLE IF NOT EXISTS `inventory_stock_movements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `movement_type` enum('in','out','adjustment','transfer') NOT NULL,
  `quantity` int NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` int DEFAULT NULL,
  `notes` text,
  `performed_by` int NOT NULL,
  `movement_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_product` (`product_id`),
  KEY `idx_date` (`movement_date`),
  KEY `idx_type` (`movement_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_suppliers`
--

DROP TABLE IF EXISTS `inventory_suppliers`;
CREATE TABLE IF NOT EXISTS `inventory_suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `invoice_code` bigint DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `amount_paid` double DEFAULT NULL,
  `credit_applied` decimal(10,2) DEFAULT '0.00',
  `original_due` decimal(10,2) GENERATED ALWAYS AS ((`amount` - `amount_paid`)) STORED,
  `net_due` decimal(10,2) GENERATED ALWAYS AS (((`amount` - `amount_paid`) - `credit_applied`)) STORED,
  `due` double DEFAULT NULL,
  `due_date` date DEFAULT NULL COMMENT 'Payment due date',
  `discount_applied` tinyint(1) DEFAULT '0',
  `benefit_category_id` int DEFAULT NULL,
  `benefit_category_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `benefit_discount_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `benefit_feeding_amount` decimal(10,2) DEFAULT '0.00',
  `benefit_classes_amount` decimal(10,2) DEFAULT '0.00',
  `benefit_tuition_amount` decimal(10,2) DEFAULT '0.00',
  `benefit_total_discount` decimal(10,2) DEFAULT '0.00',
  `creation_timestamp` int DEFAULT NULL,
  `payment_timestamp` int DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `payment_details` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `residence_type` enum('Day','Boarding') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Day',
  `year` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` int DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `mute` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `can_delete` enum('default','request','approved','declined','trash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `can_edit` enum('default','request','approved','declined') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `delete_request_issuer_id` int DEFAULT NULL,
  `edit_request_issuer_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `locked_at` timestamp NULL DEFAULT NULL COMMENT 'When the record was locked',
  `locked_reason` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Why the record was locked',
  `approval_status` enum('none','pending','approved','rejected') COLLATE utf8mb4_unicode_520_ci DEFAULT 'none',
  `approval_requested_by` int DEFAULT NULL,
  `approval_requested_at` timestamp NULL DEFAULT NULL,
  `approval_handled_by` int DEFAULT NULL,
  `approval_handled_at` timestamp NULL DEFAULT NULL,
  `approval_notes` text COLLATE utf8mb4_unicode_520_ci,
  `synced_to_ledger` tinyint(1) DEFAULT '0',
  `ledger_entry_id` int DEFAULT NULL,
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`invoice_id`),
  KEY `idx_student_term` (`student_id`,`year`,`term`),
  KEY `idx_invoice_code` (`invoice_code`),
  KEY `idx_status_year_term` (`status`,`year`,`term`),
  KEY `idx_student_invoice_code` (`student_id`,`invoice_code`),
  KEY `idx_benefit_category` (`benefit_category_id`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`),
  KEY `idx_invoice_net_due` (`net_due`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_access_tokens`
--

DROP TABLE IF EXISTS `invoice_access_tokens`;
CREATE TABLE IF NOT EXISTS `invoice_access_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expires_at` int NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `invoice_code` (`invoice_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_discounts`
--

DROP TABLE IF EXISTS `invoice_discounts`;
CREATE TABLE IF NOT EXISTS `invoice_discounts` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `invoice_code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discount_category` enum('invoice','daily_fees') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'invoice',
  `profile_id` int DEFAULT NULL,
  `discount_method` enum('percentage','fixed') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `applied_by` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_by` int DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','approved','rejected','pending_removal') COLLATE utf8mb4_unicode_520_ci DEFAULT 'approved',
  `rejection_reason` text COLLATE utf8mb4_unicode_520_ci,
  `year` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` int DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `idx_invoice` (`invoice_code`),
  KEY `idx_student` (`student_id`),
  KEY `idx_status` (`status`),
  KEY `idx_student_category_status` (`student_id`,`status`),
  KEY `idx_category_status` (`status`),
  KEY `idx_type_status` (`status`),
  KEY `idx_year_term` (`year`,`term`),
  KEY `idx_status_post` (`status`),
  KEY `idx_created_by_post` (`created_by`),
  KEY `idx_discount_category` (`discount_category`,`status`),
  KEY `idx_profile_category` (`profile_id`,`discount_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_discount_items`
--

DROP TABLE IF EXISTS `invoice_discount_items`;
CREATE TABLE IF NOT EXISTS `invoice_discount_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount_id` int NOT NULL COMMENT 'FK to invoice_discounts.id',
  `invoice_id` int NOT NULL COMMENT 'FK to invoice.invoice_id',
  `invoice_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int NOT NULL,
  `item_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `original_amount` decimal(10,2) NOT NULL COMMENT 'Original item amount before discount',
  `discount_amount` decimal(10,2) NOT NULL COMMENT 'Exact discount applied to this item',
  `discounted_amount` decimal(10,2) NOT NULL COMMENT 'Final amount after discount',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_discount_id` (`discount_id`),
  KEY `idx_invoice_id` (`invoice_id`),
  KEY `idx_invoice_code` (`invoice_code`),
  KEY `idx_student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_modification_requests`
--

DROP TABLE IF EXISTS `invoice_modification_requests`;
CREATE TABLE IF NOT EXISTS `invoice_modification_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(50) NOT NULL,
  `student_id` int NOT NULL,
  `request_type` enum('edit','delete') NOT NULL,
  `requested_by` int NOT NULL,
  `request_reason` text NOT NULL,
  `old_data` text NOT NULL COMMENT 'JSON of original invoice items',
  `new_data` text COMMENT 'JSON of new invoice items for edit',
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `reviewed_by` int DEFAULT NULL,
  `review_comment` text,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`),
  KEY `invoice_code` (`invoice_code`),
  KEY `student_id` (`student_id`),
  KEY `status` (`status`),
  KEY `requested_by` (`requested_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment_audit_log`
--

DROP TABLE IF EXISTS `invoice_payment_audit_log`;
CREATE TABLE IF NOT EXISTS `invoice_payment_audit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `record_type` enum('invoice','payment') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `record_id` int NOT NULL,
  `action` enum('create','edit','delete','lock','unlock','approve','reject') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `performed_by` int NOT NULL,
  `performed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record` (`record_type`,`record_id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payment_links`
--

DROP TABLE IF EXISTS `invoice_payment_links`;
CREATE TABLE IF NOT EXISTS `invoice_payment_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `linked_at` datetime NOT NULL,
  `linked_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `payment_id` (`payment_id`),
  KEY `linked_by` (`linked_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_sms_log`
--

DROP TABLE IF EXISTS `invoice_sms_log`;
CREATE TABLE IF NOT EXISTS `invoice_sms_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `reference_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sent_at` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoice_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `invoice_summary`;
CREATE TABLE IF NOT EXISTS `invoice_summary` (
`class_name` varchar(11)
,`invoice_code` bigint
,`invoice_date` int
,`item_count` bigint
,`last_payment_date` int
,`payment_status` varchar(7)
,`student_code` longtext
,`student_id` int
,`student_name` longtext
,`term` int
,`total_amount` double
,`total_discount` decimal(10,2)
,`total_due` double
,`total_paid` double
,`year` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

DROP TABLE IF EXISTS `journal_entries`;
CREATE TABLE IF NOT EXISTS `journal_entries` (
  `entry_id` int NOT NULL AUTO_INCREMENT,
  `entry_number` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `entry_date` date NOT NULL,
  `entry_type` enum('general','adjustment','closing','opening','reversal') COLLATE utf8mb4_unicode_520_ci DEFAULT 'general',
  `reference_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'invoice, payment, expense, etc',
  `reference_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `source_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `total_debit` decimal(15,2) DEFAULT '0.00',
  `total_credit` decimal(15,2) DEFAULT '0.00',
  `status` enum('draft','posted','void') COLLATE utf8mb4_unicode_520_ci DEFAULT 'draft',
  `posted_by` int DEFAULT NULL,
  `posted_at` timestamp NULL DEFAULT NULL,
  `fiscal_year` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fiscal_period` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`entry_id`),
  UNIQUE KEY `entry_number` (`entry_number`),
  KEY `entry_date` (`entry_date`),
  KEY `status` (`status`),
  KEY `reference` (`reference_type`,`reference_id`),
  KEY `idx_source` (`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_lines`
--

DROP TABLE IF EXISTS `journal_entry_lines`;
CREATE TABLE IF NOT EXISTS `journal_entry_lines` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `account_id` int NOT NULL,
  `debit_amount` decimal(15,2) DEFAULT '0.00',
  `credit_amount` decimal(15,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`line_id`),
  KEY `entry_id` (`entry_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int NOT NULL AUTO_INCREMENT,
  `phrase` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `english` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `bengali` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `spanish` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `arabic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `dutch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `russian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `chinese` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `turkish` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `portuguese` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `hungarian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `french` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `greek` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `german` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `italian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `thai` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `urdu` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `hindi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `latin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `indonesian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `japanese` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `korean` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `late_payment_settings`
--

DROP TABLE IF EXISTS `late_payment_settings`;
CREATE TABLE IF NOT EXISTS `late_payment_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `grace_period_days` int DEFAULT '7',
  `late_fee_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_520_ci DEFAULT 'fixed',
  `late_fee_value` decimal(10,2) DEFAULT '0.00',
  `reminder_days` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '7,14,21',
  `restrict_exams` tinyint(1) DEFAULT '0',
  `restrict_reports` tinyint(1) DEFAULT '0',
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `leave_day` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
CREATE TABLE IF NOT EXISTS `librarian` (
  `librarian_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`librarian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `interest_percentage` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `total_amount` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `total_pay` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `total_due` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `installment` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `loan_number` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `loan_details` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `approve_date` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `install_period` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` enum('Granted','Deny','Pause','Done') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Pause',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_installment`
--

DROP TABLE IF EXISTS `loan_installment`;
CREATE TABLE IF NOT EXISTS `loan_installment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int NOT NULL,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `loan_number` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `install_amount` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pay_amount` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `app_date` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `receiver` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `install_no` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logistic_asset`
--

DROP TABLE IF EXISTS `logistic_asset`;
CREATE TABLE IF NOT EXISTS `logistic_asset` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `qty` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `entry_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logistic_assign`
--

DROP TABLE IF EXISTS `logistic_assign`;
CREATE TABLE IF NOT EXISTS `logistic_assign` (
  `ass_id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `assign_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `project_id` int NOT NULL,
  `task_id` int NOT NULL,
  `log_qty` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `end_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `back_date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `back_qty` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `remarks` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`ass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
CREATE TABLE IF NOT EXISTS `mark` (
  `mark_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `test1` double DEFAULT NULL,
  `group_work` double DEFAULT NULL,
  `test2` double DEFAULT NULL,
  `project` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `term_exam` double DEFAULT NULL,
  `class_score` double DEFAULT NULL,
  `exam_score` double DEFAULT NULL,
  `mark_obtained` double DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `mark_total` double DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mute` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_status` int DEFAULT NULL,
  `attached_file_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
CREATE TABLE IF NOT EXISTS `message_thread` (
  `message_thread_id` int NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `reciever` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `last_message_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_money_payment`
--

DROP TABLE IF EXISTS `mobile_money_payment`;
CREATE TABLE IF NOT EXISTS `mobile_money_payment` (
  `mo_id` int NOT NULL AUTO_INCREMENT,
  `expense_category_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `payment_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `invoice_id` int DEFAULT NULL,
  `invoice_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `student_id` int DEFAULT NULL,
  `method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mo_a_paid` double DEFAULT NULL,
  `t_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `date_time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`mo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `file_url` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `notice_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `notice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `create_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `created_on` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `status` int DEFAULT '1',
  `show_on_website` int DEFAULT '0',
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'Admin ID who will receive the notification',
  `user_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'super admin, admin, teacher, student, parent',
  `type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Type: admission, payment, etc',
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_520_ci COMMENT 'JSON data with additional details',
  `icon` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  KEY `is_read` (`is_read`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

DROP TABLE IF EXISTS `online_exam`;
CREATE TABLE IF NOT EXISTS `online_exam` (
  `online_exam_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `exam_date` int DEFAULT NULL,
  `time_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `time_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `duration` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci COMMENT 'duration in second',
  `minimum_percentage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `instruction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `running_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`online_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_result`
--

DROP TABLE IF EXISTS `online_exam_result`;
CREATE TABLE IF NOT EXISTS `online_exam_result` (
  `online_exam_result_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `online_exam_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `answer_script` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `obtained_mark` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `status` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `exam_started_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `result` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`online_exam_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `id` int NOT NULL,
  `owner_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `owner_position` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `note` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `parent_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `guardian_gender` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `profession` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `designation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `father_name` longtext COLLATE utf8mb4_unicode_520_ci,
  `father_phone` longtext COLLATE utf8mb4_unicode_520_ci,
  `father_occupation` longtext COLLATE utf8mb4_unicode_520_ci,
  `mother_name` longtext COLLATE utf8mb4_unicode_520_ci,
  `mother_phone` longtext COLLATE utf8mb4_unicode_520_ci,
  `mother_occupation` longtext COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `expense_category_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `journal_id` int DEFAULT NULL,
  `invoice_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `receipt_code` bigint DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `payment_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_printed` tinyint(1) DEFAULT '0' COMMENT 'Receipt printed status',
  `is_emailed` tinyint(1) DEFAULT '0' COMMENT 'Receipt emailed status',
  `printed_at` int DEFAULT NULL COMMENT 'Timestamp when printed',
  `emailed_at` int DEFAULT NULL COMMENT 'Timestamp when emailed',
  `synced_to_accounts` tinyint(1) DEFAULT '0',
  `journal_entry_id` int DEFAULT NULL,
  `synced_at` int DEFAULT NULL,
  `receipt_id` int DEFAULT NULL,
  `installment_id` int DEFAULT NULL,
  `transaction_id` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `bank_name` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `cheque_number` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `amount` double DEFAULT NULL,
  `issuer_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `due` double NOT NULL DEFAULT '0',
  `timestamp` int DEFAULT NULL,
  `day_timestamp` int DEFAULT NULL,
  `residence_type` enum('Day','Boarding') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Day',
  `year` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `term` int DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `can_delete` enum('default','request','approved','declined','trash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `can_edit` enum('default','request','approved','declined') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `delete_request_issuer_id` int DEFAULT NULL,
  `edit_request_issuer_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `locked_at` timestamp NULL DEFAULT NULL COMMENT 'When the record was locked',
  `locked_reason` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Why the record was locked',
  `approval_status` enum('none','pending','approved','rejected') COLLATE utf8mb4_unicode_520_ci DEFAULT 'none',
  `approval_requested_by` int DEFAULT NULL,
  `approval_requested_at` timestamp NULL DEFAULT NULL,
  `approval_handled_by` int DEFAULT NULL,
  `approval_handled_at` timestamp NULL DEFAULT NULL,
  `approval_notes` text COLLATE utf8mb4_unicode_520_ci,
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`payment_id`),
  KEY `idx_student_term` (`student_id`,`year`,`term`),
  KEY `idx_student_day_timestamp` (`student_id`,`day_timestamp`),
  KEY `idx_receipt_id` (`receipt_id`),
  KEY `idx_installment_id` (`installment_id`),
  KEY `idx_printed` (`is_printed`),
  KEY `idx_emailed` (`is_emailed`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_installments`
--

DROP TABLE IF EXISTS `payment_installments`;
CREATE TABLE IF NOT EXISTS `payment_installments` (
  `installment_id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `installment_number` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `paid_date` datetime DEFAULT NULL,
  `status` enum('pending','paid','overdue','partial') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `late_fee` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`installment_id`),
  KEY `plan_id` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `display_order` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_plans`
--

DROP TABLE IF EXISTS `payment_plans`;
CREATE TABLE IF NOT EXISTS `payment_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `invoice_code` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `installments` int NOT NULL,
  `paid_installments` int DEFAULT '0',
  `frequency` enum('weekly','monthly','quarterly') COLLATE utf8mb4_unicode_520_ci DEFAULT 'monthly',
  `start_date` date NOT NULL,
  `status` enum('active','completed','cancelled') COLLATE utf8mb4_unicode_520_ci DEFAULT 'active',
  `created_at` int NOT NULL,
  `created_by` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `idx_student` (`student_id`),
  KEY `idx_status` (`status`),
  KEY `idx_invoice` (`invoice_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
CREATE TABLE IF NOT EXISTS `payment_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_ref` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int NOT NULL,
  `invoice_code` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `gateway` enum('hubtel','mtn_momo','vodafone_cash','airteltigo_money','paystack','stripe','flutterwave') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `gateway_ref` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `network` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` enum('pending','success','failed','cancelled') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `response_data` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_ref` (`transaction_ref`),
  KEY `student_id` (`student_id`),
  KEY `gateway_ref` (`gateway_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_salary`
--

DROP TABLE IF EXISTS `pay_salary`;
CREATE TABLE IF NOT EXISTS `pay_salary` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `month` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `year` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paid_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_days` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `basic_salary` double DEFAULT '0',
  `market_premium_allowance` double NOT NULL DEFAULT '0',
  `teaching_allowance` double NOT NULL DEFAULT '0',
  `responsibility_allowance` double NOT NULL DEFAULT '0',
  `rural_allowance` double NOT NULL DEFAULT '0',
  `extra_class_allowance` double NOT NULL DEFAULT '0',
  `other_allowances` double NOT NULL DEFAULT '0',
  `total_allowances` double DEFAULT '0',
  `gross_salary` double DEFAULT '0',
  `ssnit` double DEFAULT '0',
  `petra` double DEFAULT '0',
  `loan` double DEFAULT '0',
  `income_tax` double NOT NULL DEFAULT '0',
  `get_fund` double NOT NULL DEFAULT '0',
  `gnat_dues` double NOT NULL DEFAULT '0',
  `salary_advance` double NOT NULL DEFAULT '0',
  `nhil` double NOT NULL DEFAULT '0',
  `welfare_dues` double NOT NULL DEFAULT '0',
  `other_deductions` int NOT NULL DEFAULT '0',
  `total_deductions` double NOT NULL DEFAULT '0',
  `total_deductions_without_ssnit` double NOT NULL DEFAULT '0',
  `net_salary` double DEFAULT '0',
  `working_days` int NOT NULL DEFAULT '0',
  `days_present` int NOT NULL DEFAULT '0',
  `days_absent` int NOT NULL DEFAULT '0',
  `status` enum('Paid','Process') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'Paid',
  `paid_type` enum('Hand Cash','Bank') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Bank',
  `employment_category` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paid_by` int NOT NULL,
  `reference` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
CREATE TABLE IF NOT EXISTS `penalty` (
  `id` int NOT NULL,
  `penalty_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pending_approvals_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `pending_approvals_view`;
CREATE TABLE IF NOT EXISTS `pending_approvals_view` (
`id` int
,`reason` text
,`record_code` bigint
,`record_id` int
,`record_type` enum('invoice','payment')
,`request_type` enum('invoice_edit','invoice_delete','payment_edit','payment_delete')
,`requested_at` timestamp
,`requested_by_name` longtext
,`status` enum('pending','approved','rejected')
,`student_name` longtext
);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_aggregates`
--

DROP TABLE IF EXISTS `portfolio_aggregates`;
CREATE TABLE IF NOT EXISTS `portfolio_aggregates` (
  `aggregate_id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` enum('1','2','3') NOT NULL,
  `semester` enum('1','2') DEFAULT NULL,
  `weekly_average` decimal(5,2) DEFAULT NULL COMMENT 'Average for specific week',
  `term_average` decimal(5,2) DEFAULT NULL COMMENT 'Overall term portfolio average',
  `total_assessments` int DEFAULT '0',
  `computed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aggregate_id`),
  UNIQUE KEY `unique_student_subject_term` (`student_id`,`subject_id`,`year`,`term`,`semester`),
  KEY `idx_student_term` (`student_id`,`year`,`term`),
  KEY `idx_subject` (`subject_id`),
  KEY `idx_aggregate_class_year_term` (`class_id`,`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_assessment`
--

DROP TABLE IF EXISTS `portfolio_assessment`;
CREATE TABLE IF NOT EXISTS `portfolio_assessment` (
  `assessment_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int DEFAULT NULL,
  `code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject_id` int NOT NULL,
  `strand_score` double DEFAULT NULL,
  `week` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`assessment_id`),
  UNIQUE KEY `assessment_id` (`assessment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_audit_trail`
--

DROP TABLE IF EXISTS `portfolio_audit_trail`;
CREATE TABLE IF NOT EXISTS `portfolio_audit_trail` (
  `audit_id` bigint NOT NULL AUTO_INCREMENT,
  `action_type` enum('create','update','delete','compute','sync_sba') NOT NULL,
  `entity_type` enum('header','score','aggregate','sba') NOT NULL,
  `entity_id` bigint NOT NULL,
  `old_value` text,
  `new_value` text,
  `user_id` int NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`),
  KEY `idx_entity` (`entity_type`,`entity_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_action` (`action_type`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_headers`
--

DROP TABLE IF EXISTS `portfolio_headers`;
CREATE TABLE IF NOT EXISTS `portfolio_headers` (
  `header_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` enum('1','2','3') NOT NULL,
  `semester` enum('1','2') DEFAULT NULL,
  `week_number` tinyint NOT NULL,
  `strand_topic` varchar(200) NOT NULL,
  `strand_id` int DEFAULT NULL,
  `sub_strand_id` int DEFAULT NULL,
  `indicator_id` int DEFAULT NULL,
  `assessment_date` date NOT NULL,
  `max_score` decimal(5,2) DEFAULT '10.00',
  `status` enum('draft','published','locked') DEFAULT 'draft',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`header_id`),
  KEY `idx_class_subject` (`class_id`,`subject_id`,`year`,`term`),
  KEY `idx_teacher` (`teacher_id`),
  KEY `idx_week` (`week_number`,`term`,`year`),
  KEY `idx_strand` (`strand_id`),
  KEY `idx_sub_strand` (`sub_strand_id`),
  KEY `idx_indicator` (`indicator_id`),
  KEY `idx_portfolio_class_year_term` (`class_id`,`year`,`term`),
  KEY `portfolio_headers_ibfk_2` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `portfolio_headers_with_curriculum`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `portfolio_headers_with_curriculum`;
CREATE TABLE IF NOT EXISTS `portfolio_headers_with_curriculum` (
`assessment_date` date
,`class_id` int
,`created_at` timestamp
,`created_by` int
,`deleted_at` timestamp
,`full_curriculum_path` varchar(200)
,`header_id` int
,`indicator_id` int
,`indicator_text` text
,`max_score` decimal(5,2)
,`semester` enum('1','2')
,`status` enum('draft','published','locked')
,`strand_id` int
,`strand_name` varchar(200)
,`strand_topic` varchar(200)
,`sub_strand_id` int
,`sub_strand_name` varchar(200)
,`subject_id` int
,`teacher_id` int
,`term` enum('1','2','3')
,`updated_at` timestamp
,`week_number` tinyint
,`year` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_scores`
--

DROP TABLE IF EXISTS `portfolio_scores`;
CREATE TABLE IF NOT EXISTS `portfolio_scores` (
  `score_id` bigint NOT NULL AUTO_INCREMENT,
  `header_id` int NOT NULL,
  `student_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `recorded_by` int NOT NULL,
  `recorded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  UNIQUE KEY `unique_student_header` (`header_id`,`student_id`,`deleted_at`),
  KEY `idx_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_start_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_end_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_description` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_summary` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_status` enum('upcoming','complete','running') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'running',
  `progress` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_file`
--

DROP TABLE IF EXISTS `project_file`;
CREATE TABLE IF NOT EXISTS `project_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_id` int NOT NULL,
  `file_details` varchar(1028) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `file_url` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `assigned_to` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_expenses`
--

DROP TABLE IF EXISTS `pro_expenses`;
CREATE TABLE IF NOT EXISTS `pro_expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_id` int NOT NULL,
  `assign_to` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `details` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_notes`
--

DROP TABLE IF EXISTS `pro_notes`;
CREATE TABLE IF NOT EXISTS `pro_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assign_to` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pro_id` int NOT NULL,
  `details` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_task`
--

DROP TABLE IF EXISTS `pro_task`;
CREATE TABLE IF NOT EXISTS `pro_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_id` int NOT NULL,
  `task_title` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `end_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(2048) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `task_type` enum('Office','Field') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Office',
  `status` enum('running','complete','cancel') COLLATE utf8mb4_unicode_520_ci DEFAULT 'running',
  `location` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `return_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `total_days` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `create_date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `approve_status` enum('Approved','Not Approve','Rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Not Approve',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pro_task_assets`
--

DROP TABLE IF EXISTS `pro_task_assets`;
CREATE TABLE IF NOT EXISTS `pro_task_assets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_task_id` int NOT NULL,
  `assign_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_bank`
--

DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE IF NOT EXISTS `question_bank` (
  `question_bank_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `online_exam_id` int DEFAULT NULL,
  `question_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `number_of_options` int DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `correct_answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`question_bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_paper`
--

DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE IF NOT EXISTS `question_paper` (
  `question_paper_id` int NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `question_paper` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`question_paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raw_score_grade`
--

DROP TABLE IF EXISTS `raw_score_grade`;
CREATE TABLE IF NOT EXISTS `raw_score_grade` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `grade_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `grade_point_numeric` double NOT NULL DEFAULT '0',
  `mark_from` double DEFAULT NULL,
  `mark_upto` double DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
  `receipt_id` int NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `student_id` int NOT NULL,
  `invoice_code` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','bank_transfer','mobile_money','card','cheque') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `payment_reference` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `received_by` int NOT NULL,
  `received_date` datetime NOT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `is_printed` tinyint(1) DEFAULT '0',
  `is_emailed` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`receipt_id`),
  UNIQUE KEY `receipt_number` (`receipt_number`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_modification_audit`
--

DROP TABLE IF EXISTS `receipt_modification_audit`;
CREATE TABLE IF NOT EXISTS `receipt_modification_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(50) NOT NULL,
  `request_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `action` enum('edit','delete') NOT NULL,
  `performed_by` int NOT NULL,
  `performed_at` int NOT NULL,
  `before_data` text,
  `after_data` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  PRIMARY KEY (`audit_id`),
  KEY `idx_request` (`request_id`),
  KEY `idx_payment` (`payment_id`),
  KEY `idx_audit_date` (`performed_at`),
  KEY `idx_audit_receipt_code` (`receipt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_modification_requests`
--

DROP TABLE IF EXISTS `receipt_modification_requests`;
CREATE TABLE IF NOT EXISTS `receipt_modification_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `receipt_code` varchar(50) NOT NULL,
  `payment_id` int NOT NULL COMMENT 'FK to payment table',
  `request_type` enum('edit','delete') NOT NULL,
  `requested_by` int NOT NULL COMMENT 'User who requested',
  `requested_at` int NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected','revoked') NOT NULL DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `approved_at` int DEFAULT NULL,
  `rejection_reason` text,
  `revoked_by` int DEFAULT NULL,
  `revoked_at` int DEFAULT NULL,
  `original_data` text COMMENT 'JSON of original payment data',
  `new_data` text COMMENT 'JSON of new payment data (for edits)',
  `notification_sent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`request_id`),
  KEY `idx_payment` (`payment_id`),
  KEY `idx_status` (`status`),
  KEY `idx_requested_by` (`requested_by`),
  KEY `idx_pending_requests` (`status`,`requested_at`),
  KEY `idx_status_revoked` (`status`,`revoked_at`),
  KEY `idx_receipt_code` (`receipt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reconciliation_items`
--

DROP TABLE IF EXISTS `reconciliation_items`;
CREATE TABLE IF NOT EXISTS `reconciliation_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reconciliation_id` int NOT NULL COMMENT 'Reference to reconciliation',
  `transaction_id` int NOT NULL COMMENT 'Transaction ID',
  `transaction_type` enum('book','bank') COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Source of transaction',
  `transaction_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `debit` decimal(10,2) DEFAULT '0.00',
  `credit` decimal(10,2) DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL COMMENT 'Transaction amount',
  `matched` tinyint(1) DEFAULT '0' COMMENT 'Whether matched with counterpart',
  `matched_with_id` int DEFAULT NULL COMMENT 'ID of matched item',
  PRIMARY KEY (`id`),
  KEY `reconciliation_id` (`reconciliation_id`),
  KEY `transaction_type` (`transaction_type`),
  KEY `matched` (`matched`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Reconciliation line items';

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
CREATE TABLE IF NOT EXISTS `religion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `religion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `request_description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `request_issuer_id` int NOT NULL,
  `request_table` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `request_ids` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'this should be string of ids since we can have more than one id',
  `request_created_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request_modified_timestamp` datetime DEFAULT NULL,
  `response_timestamp` datetime DEFAULT NULL,
  `approved_by_id` int DEFAULT NULL,
  `approval_status` enum('Pending','Approved','Declined') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Pending',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_approval_audit`
--

DROP TABLE IF EXISTS `result_approval_audit`;
CREATE TABLE IF NOT EXISTS `result_approval_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approval_status_id` int NOT NULL,
  `action` enum('submit','approve','lock','unlock','reject') NOT NULL,
  `previous_status` varchar(20) DEFAULT NULL,
  `new_status` varchar(20) DEFAULT NULL,
  `performed_by` int NOT NULL,
  `reason` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `performed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_approval_status` (`approval_status_id`),
  KEY `idx_action` (`action`),
  KEY `idx_performed_by` (`performed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_approval_status`
--

DROP TABLE IF EXISTS `result_approval_status`;
CREATE TABLE IF NOT EXISTS `result_approval_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `term` varchar(10) NOT NULL,
  `status` enum('draft','submitted','approved','locked') DEFAULT 'draft',
  `submitted_by` int DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `locked_by` int DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `notes` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_class_year_term` (`class_id`,`academic_year`,`term`),
  KEY `idx_status` (`status`),
  KEY `idx_class_year_term` (`class_id`,`academic_year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_type`
--

DROP TABLE IF EXISTS `salary_type`;
CREATE TABLE IF NOT EXISTS `salary_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary_type` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `create_date` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sba_components`
--

DROP TABLE IF EXISTS `sba_components`;
CREATE TABLE IF NOT EXISTS `sba_components` (
  `component_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` enum('1','2','3') NOT NULL,
  `semester` enum('1','2') DEFAULT NULL,
  `class_test` decimal(5,2) DEFAULT NULL COMMENT 'Auto-filled from portfolio',
  `applied_class_test_weight` decimal(5,2) DEFAULT NULL,
  `project_work` decimal(5,2) DEFAULT NULL,
  `applied_project_weight` decimal(5,2) DEFAULT NULL,
  `homework` decimal(5,2) DEFAULT NULL,
  `group_work` decimal(5,2) DEFAULT NULL,
  `applied_exam_weight` decimal(5,2) DEFAULT NULL,
  `total_sba` decimal(5,2) GENERATED ALWAYS AS ((((coalesce(`class_test`,0) + coalesce(`project_work`,0)) + coalesce(`homework`,0)) + coalesce(`group_work`,0))) STORED,
  `auto_filled` tinyint(1) DEFAULT '0' COMMENT 'True if class_test auto-filled from portfolio',
  `last_sync_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `weight_config_id` int DEFAULT NULL COMMENT 'Reference to sba_weight_config used',
  PRIMARY KEY (`component_id`),
  UNIQUE KEY `unique_student_subject_sba` (`student_id`,`subject_id`,`year`,`term`,`semester`),
  KEY `idx_student_sba` (`student_id`,`year`,`term`),
  KEY `idx_weight_config` (`weight_config_id`),
  KEY `idx_sba_class_year_term` (`class_id`,`year`,`term`),
  KEY `sba_components_ibfk_2` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sba_score_sources`
--

DROP TABLE IF EXISTS `sba_score_sources`;
CREATE TABLE IF NOT EXISTS `sba_score_sources` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sba_component_id` int NOT NULL,
  `component_type` enum('class_test','project_work','homework','group_work') NOT NULL,
  `source_type` enum('portfolio','manual_entry','import','migration') NOT NULL,
  `source_reference_id` bigint DEFAULT NULL COMMENT 'portfolio_aggregates.id or import batch id',
  `original_value` decimal(5,2) DEFAULT NULL,
  `computed_value` decimal(5,2) NOT NULL,
  `computation_formula` varchar(255) DEFAULT NULL,
  `computed_by` int NOT NULL,
  `computed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `idx_sba_component` (`sba_component_id`),
  KEY `idx_source_type` (`source_type`),
  KEY `idx_computed_by` (`computed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sba_weight_config`
--

DROP TABLE IF EXISTS `sba_weight_config`;
CREATE TABLE IF NOT EXISTS `sba_weight_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(10) NOT NULL,
  `term` enum('1','2','3') NOT NULL,
  `class_category` varchar(50) NOT NULL COMMENT 'JHS, Upper Primary, SHS, etc',
  `class_test_weight` decimal(5,2) NOT NULL DEFAULT '30.00',
  `project_weight` decimal(5,2) NOT NULL DEFAULT '10.00',
  `exam_weight` decimal(5,2) NOT NULL DEFAULT '60.00',
  `portfolio_as_class_test` tinyint(1) DEFAULT '1' COMMENT 'Use portfolio for class test',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_config` (`academic_year`,`term`,`class_category`,`deleted_at`),
  KEY `idx_year_term` (`academic_year`,`term`),
  KEY `idx_category` (`class_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `nick_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `class_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sems`
--

DROP TABLE IF EXISTS `sems`;
CREATE TABLE IF NOT EXISTS `sems` (
  `sem_id` int NOT NULL,
  `sem_ending` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `next_sem_begins` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `full_payment_date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`sem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_automations`
--

DROP TABLE IF EXISTS `sms_automations`;
CREATE TABLE IF NOT EXISTS `sms_automations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Automation name',
  `trigger_event` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Event that triggers SMS',
  `recipients` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Target recipients (parents, students, teachers, all)',
  `message_template` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'SMS template with placeholders',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '1=Active, 0=Inactive',
  `created_by` int DEFAULT NULL COMMENT 'Admin who created',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trigger_days` int DEFAULT '0' COMMENT 'Days before/after event (negative for after)',
  `last_run` datetime DEFAULT NULL,
  `next_run` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trigger_event` (`trigger_event`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='SMS automation rules';

-- --------------------------------------------------------

--
-- Table structure for table `sms_automation_logs`
--

DROP TABLE IF EXISTS `sms_automation_logs`;
CREATE TABLE IF NOT EXISTS `sms_automation_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `automation_id` int NOT NULL COMMENT 'Reference to automation',
  `recipient_phone` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Phone number',
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Recipient name',
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Actual message sent',
  `status` enum('sent','failed','pending') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `error_message` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Error details if failed',
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `automation_id` (`automation_id`),
  KEY `status` (`status`),
  KEY `sent_at` (`sent_at`),
  KEY `idx_automation_date` (`automation_id`,`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='SMS automation execution logs';

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE IF NOT EXISTS `sms_log` (
  `sms_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` enum('payment_reminder','receipt','statement','general') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sent_at` int NOT NULL,
  `status` enum('pending','sent','failed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `response` mediumtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`sms_id`),
  KEY `idx_student` (`student_id`),
  KEY `idx_type` (`type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
CREATE TABLE IF NOT EXISTS `sms_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('sent','failed') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'sent',
  `sent_at` datetime NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_schedules`
--

DROP TABLE IF EXISTS `sms_schedules`;
CREATE TABLE IF NOT EXISTS `sms_schedules` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `template_code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `schedule_type` enum('daily','weekly','monthly','once') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `schedule_time` time NOT NULL,
  `schedule_day` int DEFAULT NULL COMMENT 'Day of week (1-7) or day of month (1-31)',
  `target_criteria` text COLLATE utf8mb4_unicode_520_ci COMMENT 'JSON criteria for selecting recipients',
  `is_active` tinyint(1) DEFAULT '1',
  `last_run` timestamp NULL DEFAULT NULL,
  `next_run` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_id`),
  KEY `idx_next_run` (`next_run`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

DROP TABLE IF EXISTS `sms_templates`;
CREATE TABLE IF NOT EXISTS `sms_templates` (
  `template_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `variables` text COLLATE utf8mb4_unicode_520_ci COMMENT 'JSON array of available variables',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_code` (`code`),
  KEY `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int NOT NULL,
  `emp_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `facebook` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `twitter` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `google_plus` varchar(512) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `skype_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `birthday` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sex` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `religion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `blood_group` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT 'Ghanaian',
  `ghana_card_id` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `admission_date` date DEFAULT NULL,
  `allergies` text COLLATE utf8mb4_unicode_520_ci,
  `medical_conditions` text COLLATE utf8mb4_unicode_520_ci,
  `emergency_contact` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `parent_email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `student_phone` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `parent_id` int DEFAULT NULL,
  `dormitory_room_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `mute` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `special_diet` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `tribe` longtext COLLATE utf8mb4_unicode_520_ci,
  `former_school` longtext COLLATE utf8mb4_unicode_520_ci,
  `student_health` longtext COLLATE utf8mb4_unicode_520_ci,
  `student_special_diet_details` longtext COLLATE utf8mb4_unicode_520_ci,
  `class_reached` longtext COLLATE utf8mb4_unicode_520_ci,
  `can_delete` enum('default','request','approved','declined','trash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `can_edit` enum('default','request','approved','declined') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'default',
  `delete_request_issuer_id` int DEFAULT NULL,
  `edit_request_issuer_id` int DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `place_of_birth` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nhis_number` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nhis_status` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `disability_status` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `learning_support` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `digital_literacy` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `home_technology_access` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `special_needs` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1' COMMENT 'Optimistic locking',
  PRIMARY KEY (`student_id`),
  KEY `idx_first_name` (`first_name`),
  KEY `idx_last_name` (`last_name`),
  KEY `idx_ghana_card` (`ghana_card_id`),
  KEY `idx_admission_date` (`admission_date`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_last_modified` (`last_modified_at`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_account_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `student_account_summary`;
CREATE TABLE IF NOT EXISTS `student_account_summary` (
`class_name` varchar(11)
,`fully_paid_amount` double
,`parent_id` int
,`student_id` int
,`student_name` longtext
,`term` int
,`total_billed` double
,`total_invoices` bigint
,`total_outstanding` double
,`total_paid` double
,`unpaid_amount` double
,`year` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `student_credits`
--

DROP TABLE IF EXISTS `student_credits`;
CREATE TABLE IF NOT EXISTS `student_credits` (
  `credit_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `credit_amount` decimal(10,2) NOT NULL,
  `source_payment_id` int DEFAULT NULL,
  `source_receipt_code` varchar(50) DEFAULT NULL,
  `source_invoice_code` varchar(50) DEFAULT NULL,
  `applied_amount` decimal(10,2) DEFAULT '0.00',
  `remaining_amount` decimal(10,2) GENERATED ALWAYS AS ((`credit_amount` - `applied_amount`)) STORED,
  `status` enum('active','fully_applied','expired','cancelled') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`credit_id`),
  KEY `idx_student_active` (`student_id`,`status`),
  KEY `idx_remaining` (`remaining_amount`),
  KEY `idx_source_receipt` (`source_receipt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_credit_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `student_credit_summary`;
CREATE TABLE IF NOT EXISTS `student_credit_summary` (
`last_credit_date` timestamp
,`student_id` int
,`student_name` longtext
,`total_available_credit` decimal(32,2)
,`total_credit_records` bigint
,`total_credits_earned` decimal(32,2)
,`total_credits_used` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `student_daily_fee_preferences`
--

DROP TABLE IF EXISTS `student_daily_fee_preferences`;
CREATE TABLE IF NOT EXISTS `student_daily_fee_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `breakfast_subscribed` tinyint(1) DEFAULT '0' COMMENT '1=parent subscribed to breakfast, 0=not subscribed',
  `water_subscribed` tinyint(1) DEFAULT '1' COMMENT '1=subscribed to water, 0=not subscribed',
  `auto_deduct_enabled` tinyint(1) DEFAULT '1' COMMENT '1=auto-deduct from balance, 0=manual payment',
  `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_discount_assignments`
--

DROP TABLE IF EXISTS `student_discount_assignments`;
CREATE TABLE IF NOT EXISTS `student_discount_assignments` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `discount_category` enum('invoice','daily_fees') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `discount_method` enum('percentage','fixed') COLLATE utf8mb4_unicode_520_ci DEFAULT 'percentage',
  `discount_value` decimal(10,2) DEFAULT '0.00',
  `discount_type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'For daily_fees: feeding,classes,water,etc',
  `bill_item_ids` text COLLATE utf8mb4_unicode_520_ci COMMENT 'For invoice: comma-separated IDs or *',
  `year` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `term` int DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `assigned_by` int NOT NULL,
  `assigned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','rejected','pending_removal') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `created_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text COLLATE utf8mb4_unicode_520_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `deactivated_at` int DEFAULT NULL,
  `deactivated_by` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`assignment_id`),
  KEY `student_id` (`student_id`),
  KEY `profile_id` (`profile_id`),
  KEY `year_term` (`year`,`term`),
  KEY `idx_student_year_term` (`student_id`,`year`,`term`,`is_active`),
  KEY `idx_discount_method` (`discount_method`),
  KEY `idx_status_pre` (`status`),
  KEY `idx_created_by_pre` (`created_by`),
  KEY `idx_profile_year_term` (`profile_id`,`year`,`term`,`is_active`),
  KEY `idx_category_status` (`discount_category`,`status`,`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_ledger`
--

DROP TABLE IF EXISTS `student_ledger`;
CREATE TABLE IF NOT EXISTS `student_ledger` (
  `ledger_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` enum('invoice','payment','discount','credit_note','adjustment','refund') NOT NULL,
  `reference_type` varchar(50) NOT NULL,
  `reference_id` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `debit_amount` decimal(10,2) DEFAULT '0.00',
  `credit_amount` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`ledger_id`),
  KEY `idx_student` (`student_id`),
  KEY `idx_date` (`transaction_date`),
  KEY `idx_type` (`transaction_type`),
  KEY `idx_year_term` (`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `subject_type` enum('core','elective') COLLATE utf8mb4_unicode_520_ci DEFAULT 'elective',
  `status` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`subject_id`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_category_creche`
--

DROP TABLE IF EXISTS `subject_category_creche`;
CREATE TABLE IF NOT EXISTS `subject_category_creche` (
  `category_id` int NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_creche`
--

DROP TABLE IF EXISTS `subject_creche`;
CREATE TABLE IF NOT EXISTS `subject_creche` (
  `subject_id` int NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `category_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `class_id` int DEFAULT '0',
  `teacher_id` int DEFAULT NULL,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_config`
--

DROP TABLE IF EXISTS `sync_config`;
CREATE TABLE IF NOT EXISTS `sync_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) NOT NULL,
  `config_value` text,
  `description` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_conflicts`
--

DROP TABLE IF EXISTS `sync_conflicts`;
CREATE TABLE IF NOT EXISTS `sync_conflicts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `record_id` varchar(100) NOT NULL,
  `local_data` text,
  `server_data` text,
  `local_timestamp` timestamp NULL DEFAULT NULL,
  `server_timestamp` timestamp NULL DEFAULT NULL,
  `resolution` enum('PENDING','LOCAL_WINS','SERVER_WINS','MERGED') DEFAULT 'PENDING',
  `resolved_at` timestamp NULL DEFAULT NULL,
  `resolved_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_resolution` (`resolution`),
  KEY `idx_table` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_devices`
--

DROP TABLE IF EXISTS `sync_devices`;
CREATE TABLE IF NOT EXISTS `sync_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) NOT NULL,
  `device_name` varchar(200) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `last_sync_at` timestamp NULL DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','BLOCKED') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL COMMENT 'Admin/Teacher using this device',
  `user_type` enum('admin','teacher') DEFAULT NULL COMMENT 'User role',
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id` (`device_id`),
  KEY `idx_device_id` (`device_id`),
  KEY `idx_status` (`status`),
  KEY `idx_user` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_log`
--

DROP TABLE IF EXISTS `sync_log`;
CREATE TABLE IF NOT EXISTS `sync_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sync_type` enum('PUSH','PULL') NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `records_count` int DEFAULT '0',
  `status` enum('SUCCESS','FAILED','PARTIAL') NOT NULL,
  `started_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `error_details` text,
  PRIMARY KEY (`id`),
  KEY `idx_sync_type` (`sync_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_metadata`
--

DROP TABLE IF EXISTS `sync_metadata`;
CREATE TABLE IF NOT EXISTS `sync_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `last_pull_at` timestamp NULL DEFAULT NULL,
  `last_push_at` timestamp NULL DEFAULT NULL,
  `last_record_id` bigint DEFAULT '0',
  `sync_enabled` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sync_queue`
--

DROP TABLE IF EXISTS `sync_queue`;
CREATE TABLE IF NOT EXISTS `sync_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `table_name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `operation` enum('insert','update','delete') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `record_data` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `synced` tinyint(1) NOT NULL DEFAULT '0',
  `synced_at` timestamp NULL DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `synced` (`synced`),
  KEY `timestamp` (`timestamp`),
  KEY `idx_device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `other_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `teacher_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `birthday` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sex` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `religion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `blood_group` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `phone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `ssnit_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ghana_card_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `petra_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_number` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_details` longtext COLLATE utf8mb4_unicode_520_ci,
  `authentication_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `social_links` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `show_on_website` int DEFAULT '0',
  `read_notice_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `block_limit` int DEFAULT '0',
  `active_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `online_status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  `can_collect_daily_fees` tinyint(1) DEFAULT '0' COMMENT '1=can collect fees, 0=cannot',
  `collection_point` enum('classroom','office','bus') COLLATE utf8mb4_unicode_520_ci DEFAULT 'classroom',
  `sync_status` enum('SYNCED','PENDING','CONFLICT') COLLATE utf8mb4_unicode_520_ci DEFAULT 'SYNCED',
  `last_modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int DEFAULT NULL,
  `last_modified_by_type` enum('admin','teacher') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `device_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  PRIMARY KEY (`teacher_id`),
  KEY `idx_sync_status` (`sync_status`),
  KEY `idx_device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminal_reports`
--

DROP TABLE IF EXISTS `terminal_reports`;
CREATE TABLE IF NOT EXISTS `terminal_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` varchar(10) NOT NULL,
  `attendance_present` int DEFAULT '0',
  `attendance_total` int DEFAULT '0',
  `conduct` varchar(50) DEFAULT NULL,
  `attitude` varchar(50) DEFAULT NULL,
  `interest` varchar(50) DEFAULT NULL,
  `teacher_remark` text,
  `headmaster_remark` text,
  `generated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `unique_student_year_term` (`student_id`,`year`,`term`),
  KEY `idx_student` (`student_id`),
  KEY `idx_year_term` (`year`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` int NOT NULL,
  `term_ending` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `next_term_begins` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `full_payment_date` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `year` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `term` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `to_do_list`
--

DROP TABLE IF EXISTS `to_do_list`;
CREATE TABLE IF NOT EXISTS `to_do_list` (
  `id` int NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `to_dodata` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` varchar(14) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `transport_id` int NOT NULL AUTO_INCREMENT,
  `route_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `number_of_vehicle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `route_fare` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `sync` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`transport_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_auto_billing`
--

DROP TABLE IF EXISTS `transport_auto_billing`;
CREATE TABLE IF NOT EXISTS `transport_auto_billing` (
  `billing_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `transport_id` int NOT NULL,
  `billing_date` date NOT NULL,
  `fare_amount` decimal(10,2) NOT NULL,
  `was_present` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'no',
  `boarded_bus` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'no',
  `billing_status` enum('pending','confirmed','reversed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`billing_id`),
  KEY `student_id` (`student_id`),
  KEY `billing_date` (`billing_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_daily_log`
--

DROP TABLE IF EXISTS `transport_daily_log`;
CREATE TABLE IF NOT EXISTS `transport_daily_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `transport_id` int NOT NULL,
  `log_date` date NOT NULL,
  `boarded_bus` enum('yes','no') COLLATE utf8mb4_unicode_520_ci DEFAULT 'no',
  `paid_fare` enum('yes','no') COLLATE utf8mb4_unicode_520_ci DEFAULT 'no',
  `conductor_id` int DEFAULT NULL,
  `remarks` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `student_date` (`student_id`,`log_date`),
  KEY `log_date` (`log_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE IF NOT EXISTS `user_permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_type` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_level` int DEFAULT NULL,
  `permission_status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_tracker`
--

DROP TABLE IF EXISTS `visitor_tracker`;
CREATE TABLE IF NOT EXISTS `visitor_tracker` (
  `id` int NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `page_view` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `date` int NOT NULL,
  `sync` enum('yes','no') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_summary_by_category`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_expense_summary_by_category`;
CREATE TABLE IF NOT EXISTS `v_expense_summary_by_category` (
`approved_amount` decimal(32,2)
,`category_name` varchar(100)
,`expense_count` bigint
,`pending_amount` decimal(32,2)
,`rejected_amount` decimal(32,2)
,`total_amount` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `waec_grading_scale`
--

DROP TABLE IF EXISTS `waec_grading_scale`;
CREATE TABLE IF NOT EXISTS `waec_grading_scale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` varchar(2) NOT NULL,
  `min_score` int NOT NULL,
  `max_score` int NOT NULL,
  `grade_point` decimal(3,2) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `is_pass` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `water_charge_log`
--

DROP TABLE IF EXISTS `water_charge_log`;
CREATE TABLE IF NOT EXISTS `water_charge_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `week_start_date` int NOT NULL,
  `week_end_date` int NOT NULL,
  `amount_charged` decimal(10,2) NOT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_520_ci DEFAULT 'unpaid',
  `year` int NOT NULL,
  `term` int DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `charged_at` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`,`week_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure for view `invoice_summary`
--
DROP TABLE IF EXISTS `invoice_summary`;

DROP VIEW IF EXISTS `invoice_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `invoice_summary`  AS SELECT `i`.`student_id` AS `student_id`, `i`.`invoice_code` AS `invoice_code`, `i`.`year` AS `year`, `i`.`term` AS `term`, `s`.`name` AS `student_name`, `s`.`student_code` AS `student_code`, `c`.`name` AS `class_name`, sum(`i`.`amount`) AS `total_amount`, sum(`i`.`amount_paid`) AS `total_paid`, sum(`i`.`due`) AS `total_due`, coalesce((select `d`.`discount_amount` from `invoice_discounts` `d` where ((`d`.`student_id` = `i`.`student_id`) and (`d`.`invoice_code` = `i`.`invoice_code`) and (`d`.`status` = 'approved')) limit 1),0) AS `total_discount`, count(distinct `i`.`invoice_id`) AS `item_count`, min(`i`.`creation_timestamp`) AS `invoice_date`, max(`i`.`payment_timestamp`) AS `last_payment_date`, (case when (sum(`i`.`due`) = 0) then 'paid' when sum(`i`.`amount_paid`) then 'partial' else 'unpaid' end) AS `payment_status` FROM (((`invoice` `i` left join `student` `s` on((`i`.`student_id` = `s`.`student_id`))) left join `enroll` `e` on(((`s`.`student_id` = `e`.`student_id`) and (`i`.`year` = `e`.`year`) and (`i`.`term` = `e`.`term`)))) left join `class` `c` on((`e`.`class_id` = `c`.`class_id`))) GROUP BY `i`.`student_id`, `i`.`invoice_code`, `i`.`year`, `i`.`term`, `s`.`name`, `s`.`student_code`, `c`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `pending_approvals_view`
--
DROP TABLE IF EXISTS `pending_approvals_view`;

DROP VIEW IF EXISTS `pending_approvals_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pending_approvals_view`  AS SELECT `ar`.`id` AS `id`, `ar`.`request_type` AS `request_type`, `ar`.`record_type` AS `record_type`, `ar`.`record_id` AS `record_id`, `ar`.`requested_at` AS `requested_at`, `ar`.`reason` AS `reason`, `ar`.`status` AS `status`, (case when `ar`.`requested_by` in (select `admin`.`admin_id` from `admin`) then (select `admin`.`name` from `admin` where (`admin`.`admin_id` = `ar`.`requested_by`)) when `ar`.`requested_by` in (select `teacher`.`teacher_id` from `teacher`) then (select `teacher`.`name` from `teacher` where (`teacher`.`teacher_id` = `ar`.`requested_by`)) else 'Unknown' end) AS `requested_by_name`, (case when (`ar`.`record_type` = 'invoice') then (select `invoice`.`invoice_code` from `invoice` where (`invoice`.`invoice_id` = `ar`.`record_id`)) when (`ar`.`record_type` = 'payment') then (select `payment`.`receipt_code` from `payment` where (`payment`.`payment_id` = `ar`.`record_id`)) end) AS `record_code`, (case when (`ar`.`record_type` = 'invoice') then (select `s`.`name` from (`invoice` `i` join `student` `s` on((`i`.`student_id` = `s`.`student_id`))) where (`i`.`invoice_id` = `ar`.`record_id`)) when (`ar`.`record_type` = 'payment') then (select `s`.`name` from (`payment` `p` join `student` `s` on((`p`.`student_id` = `s`.`student_id`))) where (`p`.`payment_id` = `ar`.`record_id`)) end) AS `student_name` FROM `approval_requests` AS `ar` WHERE (`ar`.`status` = 'pending') ORDER BY `ar`.`requested_at` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `portfolio_headers_with_curriculum`
--
DROP TABLE IF EXISTS `portfolio_headers_with_curriculum`;

DROP VIEW IF EXISTS `portfolio_headers_with_curriculum`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `portfolio_headers_with_curriculum`  AS SELECT `ph`.`header_id` AS `header_id`, `ph`.`class_id` AS `class_id`, `ph`.`subject_id` AS `subject_id`, `ph`.`teacher_id` AS `teacher_id`, `ph`.`year` AS `year`, `ph`.`term` AS `term`, `ph`.`semester` AS `semester`, `ph`.`week_number` AS `week_number`, `ph`.`strand_topic` AS `strand_topic`, `ph`.`strand_id` AS `strand_id`, `ph`.`sub_strand_id` AS `sub_strand_id`, `ph`.`indicator_id` AS `indicator_id`, `ph`.`assessment_date` AS `assessment_date`, `ph`.`max_score` AS `max_score`, `ph`.`status` AS `status`, `ph`.`created_by` AS `created_by`, `ph`.`created_at` AS `created_at`, `ph`.`updated_at` AS `updated_at`, `ph`.`deleted_at` AS `deleted_at`, `cs`.`strand_name` AS `strand_name`, `css`.`sub_strand_name` AS `sub_strand_name`, `ci`.`indicator_text` AS `indicator_text`, coalesce(concat(`cs`.`strand_code`,' - ',`css`.`sub_strand_code`,' - ',`ci`.`indicator_code`),`ph`.`strand_topic`) AS `full_curriculum_path` FROM (((`portfolio_headers` `ph` left join `curriculum_strands` `cs` on((`cs`.`strand_id` = `ph`.`strand_id`))) left join `curriculum_sub_strands` `css` on((`css`.`sub_strand_id` = `ph`.`sub_strand_id`))) left join `curriculum_indicators` `ci` on((`ci`.`indicator_id` = `ph`.`indicator_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `student_account_summary`
--
DROP TABLE IF EXISTS `student_account_summary`;

DROP VIEW IF EXISTS `student_account_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_account_summary`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`name` AS `student_name`, `s`.`parent_id` AS `parent_id`, `c`.`name` AS `class_name`, coalesce(sum(`i`.`amount`),0) AS `total_billed`, coalesce(sum(`i`.`amount_paid`),0) AS `total_paid`, coalesce(sum(`i`.`due`),0) AS `total_outstanding`, coalesce(sum((case when (`i`.`status` = 'paid') then `i`.`amount` else 0 end)),0) AS `fully_paid_amount`, coalesce(sum((case when (`i`.`status` = 'due') then `i`.`amount` else 0 end)),0) AS `unpaid_amount`, count(distinct `i`.`invoice_id`) AS `total_invoices`, `i`.`year` AS `year`, `i`.`term` AS `term` FROM (((`student` `s` left join `enroll` `e` on((`s`.`student_id` = `e`.`student_id`))) left join `class` `c` on((`e`.`class_id` = `c`.`class_id`))) left join `invoice` `i` on((`s`.`student_id` = `i`.`student_id`))) GROUP BY `s`.`student_id`, `i`.`year`, `i`.`term` ;

-- --------------------------------------------------------

--
-- Structure for view `student_credit_summary`
--
DROP TABLE IF EXISTS `student_credit_summary`;

DROP VIEW IF EXISTS `student_credit_summary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_credit_summary`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`name` AS `student_name`, coalesce(sum(`sc`.`remaining_amount`),0) AS `total_available_credit`, coalesce(sum(`sc`.`credit_amount`),0) AS `total_credits_earned`, coalesce(sum(`sc`.`applied_amount`),0) AS `total_credits_used`, count(`sc`.`credit_id`) AS `total_credit_records`, max(`sc`.`created_at`) AS `last_credit_date` FROM (`student` `s` left join `student_credits` `sc` on(((`s`.`student_id` = `sc`.`student_id`) and (`sc`.`status` = 'active')))) GROUP BY `s`.`student_id`, `s`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_summary_by_category`
--
DROP TABLE IF EXISTS `v_expense_summary_by_category`;

DROP VIEW IF EXISTS `v_expense_summary_by_category`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_expense_summary_by_category`  AS SELECT `ec`.`name` AS `category_name`, count(`e`.`id`) AS `expense_count`, sum((case when (`e`.`status` = 'pending') then `e`.`amount` else 0 end)) AS `pending_amount`, sum((case when (`e`.`status` = 'approved') then `e`.`amount` else 0 end)) AS `approved_amount`, sum((case when (`e`.`status` = 'rejected') then `e`.`amount` else 0 end)) AS `rejected_amount`, sum(`e`.`amount`) AS `total_amount` FROM (`expense_categories_enhanced` `ec` left join `expenses_enhanced` `e` on((`ec`.`id` = `e`.`category_id`))) GROUP BY `ec`.`id`, `ec`.`name` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `fk_bank_accounts_chart` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_of_accounts` (`account_id`);

--
-- Constraints for table `bank_reconciliations`
--
ALTER TABLE `bank_reconciliations`
  ADD CONSTRAINT `fk_reconciliation_account` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`bank_account_id`) ON DELETE CASCADE;

--
-- Constraints for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD CONSTRAINT `fk_bank_trans_account` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`bank_account_id`),
  ADD CONSTRAINT `fk_bank_trans_journal` FOREIGN KEY (`journal_entry_id`) REFERENCES `journal_entries` (`entry_id`);

--
-- Constraints for table `budget_lines`
--
ALTER TABLE `budget_lines`
  ADD CONSTRAINT `fk_budget_line_budget` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`budget_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_budget_lines_account` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`account_id`),
  ADD CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`budget_id`) ON DELETE CASCADE;

--
-- Constraints for table `budget_utilization_log`
--
ALTER TABLE `budget_utilization_log`
  ADD CONSTRAINT `fk_budget_util_budget` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`budget_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_budget_util_line` FOREIGN KEY (`budget_line_id`) REFERENCES `budget_lines` (`budget_line_id`) ON DELETE CASCADE;

--
-- Constraints for table `credit_applications`
--
ALTER TABLE `credit_applications`
  ADD CONSTRAINT `credit_applications_ibfk_1` FOREIGN KEY (`credit_id`) REFERENCES `student_credits` (`credit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `credit_applications_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE;

--
-- Constraints for table `credit_system_logs`
--
ALTER TABLE `credit_system_logs`
  ADD CONSTRAINT `credit_system_logs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `curriculum_indicators`
--
ALTER TABLE `curriculum_indicators`
  ADD CONSTRAINT `curriculum_indicators_ibfk_1` FOREIGN KEY (`sub_strand_id`) REFERENCES `curriculum_sub_strands` (`sub_strand_id`) ON DELETE CASCADE;

--
-- Constraints for table `curriculum_strands`
--
ALTER TABLE `curriculum_strands`
  ADD CONSTRAINT `curriculum_strands_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `curriculum_sub_strands`
--
ALTER TABLE `curriculum_sub_strands`
  ADD CONSTRAINT `curriculum_sub_strands_ibfk_1` FOREIGN KEY (`strand_id`) REFERENCES `curriculum_strands` (`strand_id`) ON DELETE CASCADE;

--
-- Constraints for table `discount_applications`
--
ALTER TABLE `discount_applications`
  ADD CONSTRAINT `fk_discount_app_profile` FOREIGN KEY (`profile_id`) REFERENCES `discount_profiles` (`profile_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_discount_app_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `discount_profile_rules`
--
ALTER TABLE `discount_profile_rules`
  ADD CONSTRAINT `discount_profile_rules_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `discount_profiles` (`profile_id`) ON DELETE CASCADE;

--
-- Constraints for table `enterprise_exam_subjects`
--
ALTER TABLE `enterprise_exam_subjects`
  ADD CONSTRAINT `enterprise_exam_subjects_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `enterprise_exams` (`exam_id`) ON DELETE CASCADE;

--
-- Constraints for table `enterprise_student_marks`
--
ALTER TABLE `enterprise_student_marks`
  ADD CONSTRAINT `enterprise_student_marks_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `enterprise_exams` (`exam_id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD CONSTRAINT `exam_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `fiscal_periods`
--
ALTER TABLE `fiscal_periods`
  ADD CONSTRAINT `fk_periods_year` FOREIGN KEY (`fiscal_year_id`) REFERENCES `fiscal_years` (`fiscal_year_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_products`
--
ALTER TABLE `inventory_products`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `inventory_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `inventory_sale_items`
--
ALTER TABLE `inventory_sale_items`
  ADD CONSTRAINT `fk_sale_item_product` FOREIGN KEY (`product_id`) REFERENCES `inventory_products` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_sale_item_sale` FOREIGN KEY (`sale_id`) REFERENCES `inventory_sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_stock_movements`
--
ALTER TABLE `inventory_stock_movements`
  ADD CONSTRAINT `inventory_stock_movements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `inventory_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journal_entry_lines`
--
ALTER TABLE `journal_entry_lines`
  ADD CONSTRAINT `fk_journal_lines_account` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`account_id`),
  ADD CONSTRAINT `fk_journal_lines_entry` FOREIGN KEY (`entry_id`) REFERENCES `journal_entries` (`entry_id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_aggregates`
--
ALTER TABLE `portfolio_aggregates`
  ADD CONSTRAINT `portfolio_aggregates_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolio_aggregates_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `portfolio_headers`
--
ALTER TABLE `portfolio_headers`
  ADD CONSTRAINT `portfolio_headers_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `portfolio_headers_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `portfolio_scores`
--
ALTER TABLE `portfolio_scores`
  ADD CONSTRAINT `portfolio_scores_ibfk_1` FOREIGN KEY (`header_id`) REFERENCES `portfolio_headers` (`header_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `portfolio_scores_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `reconciliation_items`
--
ALTER TABLE `reconciliation_items`
  ADD CONSTRAINT `fk_recon_item_reconciliation` FOREIGN KEY (`reconciliation_id`) REFERENCES `bank_reconciliations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `result_approval_audit`
--
ALTER TABLE `result_approval_audit`
  ADD CONSTRAINT `result_approval_audit_ibfk_1` FOREIGN KEY (`approval_status_id`) REFERENCES `result_approval_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sba_components`
--
ALTER TABLE `sba_components`
  ADD CONSTRAINT `sba_components_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sba_components_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sba_score_sources`
--
ALTER TABLE `sba_score_sources`
  ADD CONSTRAINT `sba_score_sources_ibfk_1` FOREIGN KEY (`sba_component_id`) REFERENCES `sba_components` (`component_id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_automation_logs`
--
ALTER TABLE `sms_automation_logs`
  ADD CONSTRAINT `fk_sms_log_automation` FOREIGN KEY (`automation_id`) REFERENCES `sms_automations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_credits`
--
ALTER TABLE `student_credits`
  ADD CONSTRAINT `student_credits_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_discount_assignments`
--
ALTER TABLE `student_discount_assignments`
  ADD CONSTRAINT `fk_student_discount_profile` FOREIGN KEY (`profile_id`) REFERENCES `discount_profiles` (`profile_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_discount_assignments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_ledger`
--
ALTER TABLE `student_ledger`
  ADD CONSTRAINT `student_ledger_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `terminal_reports`
--
ALTER TABLE `terminal_reports`
  ADD CONSTRAINT `terminal_reports_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
