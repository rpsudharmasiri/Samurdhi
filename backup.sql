DROP TABLE acc_type;

CREATE TABLE `acc_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `intrest_rate` varchar(10) NOT NULL,
  `open_payment` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE account;

CREATE TABLE `account` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `acc_no` varchar(40) NOT NULL,
  `balance` double NOT NULL,
  `nic` varchar(10) NOT NULL,
  `opening_date` date NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `nic` (`nic`),
  KEY `type` (`type`),
  KEY `acc_no` (`acc_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO account VALUES("4","Current","5822555","45000","931758000V","2019-08-04");
INSERT INTO account VALUES("5","Sisuraka","785624556","1500","981752537V","2019-08-14");



DROP TABLE backup;

CREATE TABLE `backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_backup_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO backup VALUES("1","2019-01-29 23:05:10","1");



DROP TABLE branch;

CREATE TABLE `branch` (
  `bid` int(11) NOT NULL,
  `b_name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE customer;

CREATE TABLE `customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `nic` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `contact` int(10) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `transactionpin` varchar(20) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO customer VALUES("3","931752538V","chathu","770160807","Medawachchciya","m.c.s.mahindapala@gmail.com","1455","chathu","chayju123");
INSERT INTO customer VALUES("6","931752545V","csm","710875032","Poonewa","umesha1994samudi@gmail.com","1445","csm","csm123");
INSERT INTO customer VALUES("9","931752700V","chathu","770160807","Medawachchciya","m.c.s.mahindapala@gmail.com","1455","chathu","chayju123");
INSERT INTO customer VALUES("10","931758000V","csm","710875032","Poonewa","umesha1994samudi@gmail.com","1445","csm","csm123");



DROP TABLE employee;

CREATE TABLE `employee` (
  `name` varchar(50) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `contact` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO employee VALUES("Lakshani","Gampaha","758652544","m.c.s.mahindapala@gmail.com","lak","123","8");



DROP TABLE loan;

CREATE TABLE `loan` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` int(11) NOT NULL,
  `loan_type` varchar(20) NOT NULL,
  `lan_amount` decimal(10,0) NOT NULL,
  `due_amount` decimal(10,0) NOT NULL,
  `intrest_rate` int(11) NOT NULL,
  `maturity` int(11) NOT NULL,
  `requesting_date` date NOT NULL,
  `document1` varchar(200) NOT NULL,
  `document2` varchar(200) NOT NULL,
  `document3` varchar(200) NOT NULL,
  `guranter1_nic` varchar(11) NOT NULL,
  `guranter2_nic` varchar(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `granted_date` date NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

INSERT INTO loan VALUES("38","5822555","Isuru","100000","100000","10","12","2019-08-16","48419610_618392805230546_1561592917041086464_n.jpg","67060960_712837309176613_4410425714952634368_n.jpg","67090993_371394157087694_5744234049312915456_n.jpg","931752580V","931752700V","rejected","0000-00-00");
INSERT INTO loan VALUES("39","5822555","Cultivation","250000","250000","6","12","2019-08-16","IMG_20180306_183550.jpg","IMG_20180308_075934.jpg","IMG_20180310_114242.jpg","45566","551","rejected","0000-00-00");
INSERT INTO loan VALUES("40","5822555","Fhisheries","250000","216874","6","24","2019-08-16","appointment-reminders.png","bank.png","bank.png","5655458","515","Approved","2019-08-16");



DROP TABLE loan_payment;

CREATE TABLE `loan_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `paid date` date NOT NULL,
  `month_payment` varchar(20) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

INSERT INTO loan_payment VALUES("122","40","2019-09-16","2019-08-16","11041.666666667","paid");
INSERT INTO loan_payment VALUES("123","40","2019-10-16","2019-08-16","11041.666666667","paid");
INSERT INTO loan_payment VALUES("124","40","2019-11-16","2019-08-16","11041.666666667","paid");
INSERT INTO loan_payment VALUES("125","40","2019-12-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("126","40","2020-01-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("127","40","2020-02-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("128","40","2020-03-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("129","40","2020-04-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("130","40","2020-05-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("131","40","2020-06-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("132","40","2020-07-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("133","40","2020-08-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("134","40","2020-09-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("135","40","2020-10-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("136","40","2020-11-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("137","40","2020-12-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("138","40","2021-01-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("139","40","2021-02-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("140","40","2021-03-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("141","40","2021-04-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("142","40","2021-05-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("143","40","2021-06-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("144","40","2021-07-16","0000-00-00","11041.666666667","Not paid");
INSERT INTO loan_payment VALUES("145","40","2021-08-16","0000-00-00","11041.666666667","Not paid");



DROP TABLE logintracking;

CREATE TABLE `logintracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `url` text,
  `name` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_logintracking_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=utf8;

INSERT INTO logintracking VALUES("3","2019-01-29 22:55:50","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("4","2019-01-29 22:56:27","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/getbackup","Get Database Backup","getbackup","","1");
INSERT INTO logintracking VALUES("5","2019-01-29 22:56:31","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("6","2019-01-29 23:02:26","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("7","2019-01-29 23:03:10","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("8","2019-01-29 23:04:01","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("9","2019-01-29 23:04:48","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("10","2019-01-29 23:04:51","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("11","2019-01-29 23:05:04","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("12","2019-01-29 23:05:10","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/getbackup","Get Database Backup","getbackup","","1");
INSERT INTO logintracking VALUES("13","2019-01-29 23:05:15","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("14","2019-01-29 23:05:17","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","","1");
INSERT INTO logintracking VALUES("15","2019-01-30 21:19:59","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("16","2019-01-30 21:20:08","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("17","2019-01-30 21:20:53","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/addUser","New User Added","addUser","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("18","2019-01-30 21:20:55","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("19","2019-01-30 21:22:15","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("20","2019-01-30 21:22:50","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/logout","Logged Out","logout","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("21","2019-01-30 21:24:39","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("22","2019-01-30 21:24:48","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("23","2019-01-30 21:29:08","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("24","2019-01-30 21:34:00","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("25","2019-01-30 21:37:24","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("26","2019-01-30 21:37:51","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("27","2019-01-30 21:38:57","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("28","2019-01-30 21:40:42","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("29","2019-01-30 21:41:44","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("30","2019-01-30 21:42:20","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("31","2019-01-30 22:31:19","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("32","2019-01-30 22:39:33","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("33","2019-01-30 22:56:01","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/addExpense","Add Expense","addExpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("34","2019-01-30 22:56:18","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/addExpense","Add Expense","addExpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("35","2019-01-30 22:56:19","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("36","2019-01-30 22:57:09","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Backup Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("37","2019-01-30 22:59:34","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("38","2019-01-30 23:01:32","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("39","2019-01-30 23:01:48","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("40","2019-01-30 23:02:23","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("41","2019-01-30 23:02:28","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("42","2019-01-30 23:02:54","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("43","2019-01-30 23:03:25","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("44","2019-01-30 23:05:03","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("45","2019-01-30 23:06:46","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("46","2019-01-30 23:08:37","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/view","View User Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("47","2019-01-30 23:09:13","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("48","2019-01-30 23:09:35","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/addUser","New User Added","addUser","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("49","2019-01-30 23:09:36","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("50","2019-01-30 23:09:40","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/view","View User Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("51","2019-01-30 23:11:00","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("52","2019-01-30 23:11:07","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("53","2019-01-30 23:11:41","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("54","2019-01-30 23:12:42","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("55","2019-01-30 23:14:57","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("56","2019-01-30 23:15:00","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/editUI","View User Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("57","2019-01-30 23:15:06","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("58","2019-01-30 23:15:08","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("59","2019-01-30 23:15:19","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("60","2019-01-30 23:16:29","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("61","2019-01-30 23:16:35","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("62","2019-01-30 23:21:15","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/delete","Delete Expense","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("63","2019-01-30 23:21:16","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("64","2019-01-30 23:23:02","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("65","2019-01-30 23:23:10","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("66","2019-01-30 23:23:34","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("67","2019-01-30 23:23:41","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("68","2019-01-30 23:23:45","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/delete","Delete Expense","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("69","2019-01-30 23:23:45","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("70","2019-01-30 23:29:26","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("71","2019-01-30 23:31:42","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("72","2019-01-30 23:31:56","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("73","2019-01-30 23:32:22","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("74","2019-01-30 23:38:46","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("75","2019-01-30 23:39:42","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("76","2019-01-30 23:42:50","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("77","2019-01-30 23:43:16","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("78","2019-01-30 23:43:43","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("79","2019-01-30 23:47:13","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("80","2019-01-30 23:53:25","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("81","2019-01-30 23:53:25","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("82","2019-01-30 23:54:04","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("83","2019-01-30 23:54:09","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("84","2019-01-30 23:54:44","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("85","2019-01-30 23:54:56","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("86","2019-01-30 23:55:15","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("87","2019-01-30 23:55:51","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("88","2019-01-30 23:55:51","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("89","2019-01-30 23:55:57","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("90","2019-01-30 23:56:09","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("91","2019-01-30 23:56:09","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("92","2019-01-31 00:40:10","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("93","2019-01-31 00:40:20","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/logout","Logged Out","logout","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("94","2019-01-31 00:40:36","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("95","2019-01-31 00:40:39","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("96","2019-01-31 00:42:26","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("97","2019-01-31 00:42:29","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("98","2019-01-31 00:44:11","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("99","2019-01-31 00:44:53","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("100","2019-01-31 00:45:07","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("101","2019-01-31 00:51:37","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("102","2019-01-31 00:54:01","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("103","2019-01-31 00:54:14","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("104","2019-01-31 00:54:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("105","2019-01-31 00:55:42","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("106","2019-01-31 01:02:37","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("107","2019-01-31 01:11:46","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("108","2019-01-31 01:12:00","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("109","2019-01-31 01:12:00","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("110","2019-01-31 01:12:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("111","2019-01-31 01:12:49","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("112","2019-01-31 01:15:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("113","2019-01-31 01:16:19","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("114","2019-01-31 01:16:31","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("115","2019-01-31 01:16:31","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("116","2019-01-31 01:17:42","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("117","2019-01-31 01:17:47","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("118","2019-01-31 01:17:47","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("119","2019-01-31 01:18:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("120","2019-01-31 01:19:39","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("121","2019-01-31 01:20:01","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("122","2019-01-31 01:20:03","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("123","2019-01-31 01:20:29","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("124","2019-01-31 01:20:49","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("125","2019-01-31 01:22:27","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("126","2019-01-31 01:22:39","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("127","2019-01-31 01:22:39","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("128","2019-01-31 01:23:10","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("129","2019-01-31 01:23:13","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("130","2019-01-31 01:23:18","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("131","2019-01-31 01:23:30","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("132","2019-01-31 01:23:50","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("133","2019-01-31 01:24:29","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("134","2019-01-31 01:27:32","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("135","2019-01-31 01:29:34","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("136","2019-01-31 01:30:04","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("137","2019-01-31 01:30:26","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("138","2019-02-02 13:08:24","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("139","2019-02-02 13:08:28","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("140","2019-02-02 13:08:41","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("141","2019-02-02 13:08:45","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("142","2019-02-02 13:11:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("143","2019-02-02 13:12:02","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("144","2019-02-02 13:12:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("145","2019-02-02 13:12:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("146","2019-02-02 13:12:53","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("147","2019-02-02 13:12:58","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("148","2019-02-02 13:13:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("149","2019-02-02 13:14:00","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("150","2019-02-02 13:14:48","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("151","2019-02-02 13:14:55","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("152","2019-02-02 13:14:59","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("153","2019-02-02 13:19:30","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("154","2019-02-02 13:19:35","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("155","2019-02-02 13:19:36","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("156","2019-02-02 13:19:53","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("157","2019-02-02 13:19:57","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("158","2019-02-02 13:20:01","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("159","2019-02-02 13:20:37","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("160","2019-02-02 13:20:54","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("161","2019-02-02 13:21:36","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("162","2019-02-02 13:21:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("163","2019-02-02 13:21:54","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("164","2019-02-02 13:21:54","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("165","2019-02-02 13:21:59","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("166","2019-02-02 13:22:05","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("167","2019-02-02 13:22:05","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("168","2019-02-02 13:23:09","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/delete","Delete Customer","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("169","2019-02-02 13:23:09","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("170","2019-02-02 13:23:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/delete","Delete Customer","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("171","2019-02-02 13:23:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("172","2019-02-02 13:23:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("173","2019-02-02 13:23:43","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("174","2019-02-02 13:24:08","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("175","2019-02-02 13:24:14","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("176","2019-02-02 13:24:20","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/delete","Delete Customer","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("177","2019-02-02 13:24:20","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("178","2019-02-02 13:25:37","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("179","2019-02-02 13:29:52","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("180","2019-02-02 13:30:20","http://localhost:8181/UltraHub/UHSJMS/index.php/backup/Backup/view","View Backup Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("181","2019-02-02 13:37:58","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("182","2019-02-02 13:39:51","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/addUser","New User Added","addUser","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("183","2019-02-02 13:39:51","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/add","View Add User Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("184","2019-02-02 13:40:10","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("185","2019-02-02 13:40:13","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/delete","Delete Expense","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("186","2019-02-02 13:40:13","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("187","2019-02-02 13:40:19","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/view","View User Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("188","2019-02-02 13:40:32","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/delete","User Deleted","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("189","2019-02-02 13:40:32","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/view","View User Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("190","2019-02-02 13:44:53","http://localhost:8181/UltraHub/UHSJMS/index.php/user/User/view","View User Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("191","2019-02-02 13:44:58","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("192","2019-02-02 13:45:02","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("193","2019-02-02 13:45:08","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("194","2019-02-02 13:45:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/delete","Delete Customer","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("195","2019-02-02 13:45:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("196","2019-02-02 13:46:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("197","2019-02-02 13:47:13","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("198","2019-02-02 13:47:13","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("199","2019-02-02 13:47:18","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("200","2019-02-02 13:52:20","http://barcodejms.ultrahubsolutions.com/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("201","2019-02-02 13:52:25","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("202","2019-02-02 13:52:30","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("203","2019-02-02 13:52:32","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("204","2019-02-02 13:52:36","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("205","2019-02-02 13:52:52","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("206","2019-02-02 13:52:52","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("207","2019-02-02 13:52:56","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/delete","Delete Customer","delete","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("208","2019-02-02 13:52:56","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("209","2019-02-02 13:53:31","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("210","2019-02-02 13:53:45","http://barcodejms.ultrahubsolutions.com/index.php/supplier/Supplier/add","View Add Supplier Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("211","2019-02-07 15:23:15","http://barcodejms.ultrahubsolutions.com/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("212","2019-02-07 15:24:27","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/add","View Add Expense Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("213","2019-02-07 15:24:32","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("214","2019-02-07 15:24:53","http://barcodejms.ultrahubsolutions.com/index.php/login/Login/logout","Logged Out","logout","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("215","2019-02-07 15:25:26","http://barcodejms.ultrahubsolutions.com/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("216","2019-02-07 15:25:31","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/add","View Add Expense Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("217","2019-02-07 15:26:07","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/addExpense","Add Expense","addExpense","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("218","2019-02-07 15:26:07","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/add","View Add Expense Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("219","2019-02-07 15:27:01","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/addExpense","Add Expense","addExpense","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("220","2019-02-07 15:27:01","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/add","View Add Expense Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("221","2019-02-07 15:27:49","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("222","2019-02-07 15:36:34","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/delete","Delete Expense","delete","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("223","2019-02-07 15:36:34","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("224","2019-02-07 15:36:42","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("225","2019-02-07 15:36:50","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("226","2019-02-07 15:36:56","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("227","2019-02-07 15:37:01","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("228","2019-02-07 15:37:07","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("229","2019-02-07 15:37:11","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("230","2019-02-07 15:37:15","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("231","2019-02-07 15:37:19","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("232","2019-02-07 15:37:26","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("233","2019-02-07 15:37:54","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("234","2019-02-07 15:38:08","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("235","2019-02-07 15:38:36","http://barcodejms.ultrahubsolutions.com/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("236","2019-02-07 15:38:42","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("237","2019-02-07 15:38:46","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("238","2019-02-07 15:41:06","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("239","2019-02-07 15:41:13","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("240","2019-02-07 15:41:30","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editexpense","Expense Detail Updated Added","editexpense","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("241","2019-02-07 15:41:30","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("242","2019-02-07 15:42:04","http://barcodejms.ultrahubsolutions.com/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("243","2019-02-07 15:43:38","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("244","2019-02-07 15:43:56","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("245","2019-02-07 15:45:03","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/addCustomer","Add Customer","addCustomer","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("246","2019-02-07 15:45:04","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("247","2019-02-07 15:45:19","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("248","2019-02-07 15:46:44","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("249","2019-02-07 15:46:54","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("250","2019-02-07 15:47:29","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/editcustomer","Customer Detail Updated Added","editcustomer","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("251","2019-02-07 15:47:29","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("252","2019-02-07 15:51:14","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/delete","Delete Customer","delete","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("253","2019-02-07 15:51:15","http://barcodejms.ultrahubsolutions.com/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("254","2019-02-07 16:32:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("255","2019-02-07 16:32:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("256","2019-02-07 16:32:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("257","2019-02-07 16:32:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editUI","Edit Bank Page","editUI","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("258","2019-02-07 16:32:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editBank","Update a Bank","editBank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("259","2019-02-07 16:32:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("260","2019-02-07 16:33:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editUI","Edit Bank Page","editUI","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("261","2019-02-07 16:33:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editBank","Update a Bank","editBank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("262","2019-02-07 16:33:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("263","2019-02-07 16:33:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editUI","Edit Bank Page","editUI","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("264","2019-02-07 16:33:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editBank","Update a Bank","editBank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("265","2019-02-07 16:33:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu Upeksha","1");
INSERT INTO logintracking VALUES("266","2019-02-08 10:43:32","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("267","2019-02-08 11:17:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("268","2019-02-11 09:09:54","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("269","2019-02-11 09:11:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("270","2019-02-11 09:22:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("271","2019-02-11 09:23:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("272","2019-02-11 09:23:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("273","2019-02-11 09:27:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("274","2019-02-11 09:29:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("275","2019-02-11 09:29:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("276","2019-02-11 09:32:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("277","2019-02-11 09:33:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("278","2019-02-11 09:33:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("279","2019-02-11 09:33:46","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("280","2019-02-11 09:33:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("281","2019-02-11 09:36:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("282","2019-02-11 09:36:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("283","2019-02-11 09:37:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("284","2019-02-11 09:37:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("285","2019-02-11 09:37:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/delete","Bank Deleted","delete","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("286","2019-02-11 09:37:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("287","2019-02-11 09:37:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("288","2019-02-11 09:37:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("289","2019-02-11 09:37:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("290","2019-02-11 09:38:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("291","2019-02-11 09:39:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("292","2019-02-11 09:39:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("293","2019-02-11 09:39:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("294","2019-02-11 09:39:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("295","2019-02-11 09:40:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("296","2019-02-11 09:41:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("297","2019-02-11 09:41:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("298","2019-02-11 09:41:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("299","2019-02-11 09:41:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("300","2019-02-11 09:41:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("301","2019-02-11 09:41:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("302","2019-02-11 09:42:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("303","2019-02-11 09:42:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("304","2019-02-11 09:42:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("305","2019-02-11 09:42:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("306","2019-02-11 09:43:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addBank","Add a New Bank","addBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("307","2019-02-11 09:43:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("308","2019-02-11 09:43:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("309","2019-02-11 09:43:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("310","2019-02-11 09:43:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("311","2019-02-11 09:44:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("312","2019-02-11 09:44:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("313","2019-02-11 09:45:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("314","2019-02-11 09:46:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("315","2019-02-11 09:46:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("316","2019-02-11 09:47:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("317","2019-02-11 09:47:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("318","2019-02-11 09:48:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("319","2019-02-11 09:48:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("320","2019-02-11 09:48:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("321","2019-02-11 09:48:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editUI","Edit Bank Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("322","2019-02-11 09:49:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editBank","Update a Bank","editBank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("323","2019-02-11 09:49:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("324","2019-02-11 09:49:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("325","2019-02-11 09:50:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("326","2019-02-11 09:51:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("327","2019-02-11 09:51:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("328","2019-02-11 09:51:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("329","2019-02-11 09:51:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("330","2019-02-11 09:57:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("331","2019-02-11 09:58:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("332","2019-02-11 09:58:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("333","2019-02-11 09:58:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("334","2019-02-11 09:58:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("335","2019-02-11 09:58:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("336","2019-02-11 09:58:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("337","2019-02-11 09:58:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("338","2019-02-11 09:58:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("339","2019-02-11 10:00:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("340","2019-02-11 10:00:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("341","2019-02-11 10:00:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("342","2019-02-11 10:02:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("343","2019-02-11 10:04:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("344","2019-02-11 10:06:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("345","2019-02-11 10:06:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("346","2019-02-11 10:06:47","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("347","2019-02-11 10:06:56","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("348","2019-02-11 10:06:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("349","2019-02-11 10:07:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("350","2019-02-11 10:10:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("351","2019-02-11 10:10:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("352","2019-02-11 10:11:12","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("353","2019-02-11 10:11:24","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("354","2019-02-11 10:11:28","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("355","2019-02-11 10:11:35","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("356","2019-02-11 10:11:35","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("357","2019-02-11 10:12:10","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("358","2019-02-11 10:12:14","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("359","2019-02-11 10:12:14","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("360","2019-02-11 10:16:35","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/delete","Supplier Deleted","delete","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("361","2019-02-11 10:16:35","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("362","2019-02-11 10:16:52","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("363","2019-02-11 10:36:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("364","2019-02-11 10:37:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("365","2019-02-11 10:39:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("366","2019-02-11 10:39:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("367","2019-02-11 10:41:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("368","2019-02-11 10:50:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("369","2019-02-11 10:51:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("370","2019-02-11 10:52:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("371","2019-02-11 10:52:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("372","2019-02-11 10:52:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("373","2019-02-11 10:52:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("374","2019-02-11 10:54:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("375","2019-02-11 10:57:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("376","2019-02-11 10:58:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("377","2019-02-11 11:01:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("378","2019-02-11 11:02:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("379","2019-02-11 11:02:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("380","2019-02-11 11:02:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("381","2019-02-11 11:04:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("382","2019-02-11 11:05:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("383","2019-02-11 11:06:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("384","2019-02-11 11:06:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("385","2019-02-11 11:06:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("386","2019-02-11 11:07:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("387","2019-02-11 11:07:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("388","2019-02-11 11:09:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("389","2019-02-11 11:10:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("390","2019-02-11 11:10:28","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("391","2019-02-11 11:11:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("392","2019-02-11 11:12:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("393","2019-02-11 11:13:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("394","2019-02-11 11:13:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("395","2019-02-11 11:14:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("396","2019-02-11 11:16:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("397","2019-02-11 11:19:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("398","2019-02-11 11:20:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("399","2019-02-11 11:22:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("400","2019-02-11 11:26:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("401","2019-02-11 11:28:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("402","2019-02-11 11:28:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("403","2019-02-11 11:31:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("404","2019-02-11 11:31:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("405","2019-02-11 11:33:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("406","2019-02-11 11:33:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("407","2019-02-11 11:33:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("408","2019-02-11 11:33:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("409","2019-02-11 11:35:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("410","2019-02-11 11:35:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("411","2019-02-11 11:36:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("412","2019-02-11 11:37:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("413","2019-02-11 11:38:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("414","2019-02-11 11:38:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("415","2019-02-11 11:38:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("416","2019-02-11 11:40:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("417","2019-02-11 11:40:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("418","2019-02-11 11:40:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("419","2019-02-11 11:40:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("420","2019-02-11 11:45:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("421","2019-02-11 11:46:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("422","2019-02-11 11:46:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("423","2019-02-11 11:46:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("424","2019-02-11 11:47:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("425","2019-02-11 11:47:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("426","2019-02-11 11:47:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("427","2019-02-11 11:49:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("428","2019-02-11 11:55:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("429","2019-02-11 11:55:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("430","2019-02-11 11:57:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("431","2019-02-11 11:57:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("432","2019-02-11 11:57:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("433","2019-02-11 12:06:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("434","2019-02-11 12:07:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("435","2019-02-11 12:08:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("436","2019-02-11 12:11:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("437","2019-02-11 12:12:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("438","2019-02-11 12:12:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("439","2019-02-11 12:12:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("440","2019-02-11 12:12:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("441","2019-02-11 12:12:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("442","2019-02-11 12:12:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("443","2019-02-11 12:12:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("444","2019-02-11 12:12:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("445","2019-02-11 12:12:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("446","2019-02-11 12:12:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("447","2019-02-11 12:12:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("448","2019-02-11 12:12:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("449","2019-02-11 12:12:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("450","2019-02-11 12:12:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("451","2019-02-11 12:12:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("452","2019-02-11 12:13:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("453","2019-02-11 12:14:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("454","2019-02-11 12:14:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("455","2019-02-11 12:14:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("456","2019-02-11 12:14:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("457","2019-02-11 12:14:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("458","2019-02-11 12:14:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("459","2019-02-11 12:14:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("460","2019-02-11 12:17:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("461","2019-02-11 12:17:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("462","2019-02-11 12:17:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("463","2019-02-11 12:17:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("464","2019-02-11 12:17:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("465","2019-02-11 12:17:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("466","2019-02-11 12:17:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("467","2019-02-11 12:17:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("468","2019-02-11 12:17:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("469","2019-02-11 12:17:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("470","2019-02-11 12:17:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("471","2019-02-11 12:19:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("472","2019-02-11 12:19:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("473","2019-02-11 12:19:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("474","2019-02-11 12:19:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("475","2019-02-11 12:20:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("476","2019-02-11 12:20:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("477","2019-02-11 12:20:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("478","2019-02-11 12:20:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("479","2019-02-11 12:20:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("480","2019-02-11 12:20:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("481","2019-02-11 12:25:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("482","2019-02-11 12:26:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("483","2019-02-11 12:26:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("484","2019-02-11 12:26:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("485","2019-02-11 12:26:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("486","2019-02-11 12:26:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("487","2019-02-11 12:27:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("488","2019-02-11 12:27:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("489","2019-02-11 12:33:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("490","2019-02-11 12:33:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("491","2019-02-11 12:33:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("492","2019-02-11 12:33:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("493","2019-02-11 12:33:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("494","2019-02-11 12:33:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("495","2019-02-11 12:33:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("496","2019-02-11 12:33:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("497","2019-02-11 12:33:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("498","2019-02-11 12:33:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("499","2019-02-11 12:33:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("500","2019-02-11 12:33:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("501","2019-02-11 12:33:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("502","2019-02-11 12:34:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("503","2019-02-11 12:34:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("504","2019-02-11 12:34:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("505","2019-02-11 12:34:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("506","2019-02-11 12:34:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("507","2019-02-11 12:34:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("508","2019-02-11 12:34:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("509","2019-02-11 12:34:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("510","2019-02-11 12:34:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("511","2019-02-11 12:34:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("512","2019-02-11 12:34:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("513","2019-02-11 12:34:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("514","2019-02-11 12:34:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("515","2019-02-11 12:36:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("516","2019-02-11 12:36:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("517","2019-02-11 12:36:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("518","2019-02-11 12:36:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("519","2019-02-11 12:36:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("520","2019-02-11 12:36:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("521","2019-02-11 12:36:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("522","2019-02-11 12:36:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("523","2019-02-11 12:36:28","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("524","2019-02-11 12:36:31","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("525","2019-02-11 12:36:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("526","2019-02-11 12:37:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("527","2019-02-11 12:37:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("528","2019-02-11 12:37:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("529","2019-02-11 12:37:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("530","2019-02-11 12:38:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("531","2019-02-11 12:38:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("532","2019-02-11 12:38:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("533","2019-02-11 12:38:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("534","2019-02-11 12:38:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("535","2019-02-11 12:38:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("536","2019-02-11 12:38:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("537","2019-02-11 12:38:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("538","2019-02-11 12:38:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("539","2019-02-11 12:38:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("540","2019-02-11 12:38:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("541","2019-02-11 12:39:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("542","2019-02-11 12:39:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("543","2019-02-11 12:39:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("544","2019-02-11 12:39:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("545","2019-02-11 12:39:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("546","2019-02-11 12:39:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("547","2019-02-11 12:39:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("548","2019-02-11 12:39:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("549","2019-02-11 12:40:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("550","2019-02-11 12:40:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("551","2019-02-11 12:40:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("552","2019-02-11 12:40:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("553","2019-02-11 12:40:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("554","2019-02-11 12:58:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("555","2019-02-11 13:42:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("556","2019-02-11 13:42:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("557","2019-02-11 13:42:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("558","2019-02-11 13:42:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("559","2019-02-11 13:42:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("560","2019-02-11 13:43:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("561","2019-02-11 13:43:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("562","2019-02-11 13:44:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("563","2019-02-11 13:45:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("564","2019-02-11 13:45:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("565","2019-02-11 13:56:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("566","2019-02-11 13:56:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("567","2019-02-11 13:56:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("568","2019-02-11 13:56:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("569","2019-02-11 13:57:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("570","2019-02-11 13:57:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("571","2019-02-11 13:57:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("572","2019-02-11 13:57:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("573","2019-02-11 13:57:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("574","2019-02-11 13:57:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("575","2019-02-11 13:57:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("576","2019-02-11 13:57:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("577","2019-02-11 13:58:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("578","2019-02-11 13:58:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("579","2019-02-11 13:58:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("580","2019-02-11 13:58:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("581","2019-02-11 13:58:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("582","2019-02-11 13:59:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("583","2019-02-11 14:00:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("584","2019-02-11 14:00:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("585","2019-02-11 14:00:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("586","2019-02-11 14:02:06","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("587","2019-02-11 14:02:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("588","2019-02-11 14:02:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("589","2019-02-11 14:03:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("590","2019-02-11 14:03:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("591","2019-02-11 14:03:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("592","2019-02-11 14:03:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("593","2019-02-11 14:08:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("594","2019-02-11 14:08:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("595","2019-02-11 14:08:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("596","2019-02-11 14:08:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("597","2019-02-11 14:08:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("598","2019-02-11 14:09:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("599","2019-02-11 14:09:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("600","2019-02-11 14:09:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("601","2019-02-11 14:09:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("602","2019-02-11 14:09:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("603","2019-02-11 14:09:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("604","2019-02-11 14:10:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("605","2019-02-11 14:10:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("606","2019-02-11 14:10:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("607","2019-02-11 14:10:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("608","2019-02-11 14:10:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("609","2019-02-11 14:10:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("610","2019-02-11 14:10:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("611","2019-02-11 14:12:21","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("612","2019-02-11 14:13:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("613","2019-02-11 14:13:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("614","2019-02-11 14:13:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("615","2019-02-11 14:13:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("616","2019-02-11 14:13:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("617","2019-02-11 14:13:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("618","2019-02-11 14:13:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("619","2019-02-11 14:13:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("620","2019-02-11 14:13:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("621","2019-02-11 14:13:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("622","2019-02-11 14:13:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("623","2019-02-11 14:14:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("624","2019-02-11 14:14:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("625","2019-02-11 14:14:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("626","2019-02-11 14:14:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("627","2019-02-11 14:14:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("628","2019-02-11 14:14:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("629","2019-02-11 14:14:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("630","2019-02-11 14:14:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("631","2019-02-11 14:14:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("632","2019-02-11 14:15:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("633","2019-02-11 14:15:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("634","2019-02-11 14:15:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("635","2019-02-11 14:15:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("636","2019-02-11 14:15:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("637","2019-02-11 14:16:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("638","2019-02-11 14:16:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("639","2019-02-11 14:17:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("640","2019-02-11 14:17:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("641","2019-02-11 14:17:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("642","2019-02-11 14:17:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("643","2019-02-11 14:17:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("644","2019-02-11 14:17:28","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("645","2019-02-11 14:17:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("646","2019-02-11 14:17:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("647","2019-02-11 14:18:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("648","2019-02-11 14:18:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("649","2019-02-11 14:18:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("650","2019-02-11 14:21:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("651","2019-02-11 14:22:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addviewbank","View Bank Page","addviewbank","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("652","2019-02-11 14:23:03","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/view","View Suppliers Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("653","2019-02-11 14:23:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("654","2019-02-11 14:23:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("655","2019-02-11 14:23:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("656","2019-02-11 14:23:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("657","2019-02-11 14:23:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("658","2019-02-11 14:26:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("659","2019-02-11 14:26:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("660","2019-02-11 14:26:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("661","2019-02-11 14:27:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("662","2019-02-11 14:27:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransaction","Added a Transaction","addTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("663","2019-02-11 14:27:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("664","2019-02-11 14:27:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("665","2019-02-11 14:28:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("666","2019-02-11 14:28:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("667","2019-02-11 14:28:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("668","2019-02-11 14:30:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("669","2019-02-11 14:30:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("670","2019-02-11 14:30:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("671","2019-02-11 14:30:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("672","2019-02-11 14:31:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("673","2019-02-11 14:31:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("674","2019-02-11 14:31:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("675","2019-02-11 14:31:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("676","2019-02-11 14:31:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("677","2019-02-11 14:31:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("678","2019-02-11 14:31:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("679","2019-02-11 14:31:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("680","2019-02-11 14:31:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("681","2019-02-11 14:31:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("682","2019-02-11 14:32:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("683","2019-02-11 14:32:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("684","2019-02-11 14:32:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("685","2019-02-11 14:32:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("686","2019-02-11 14:32:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("687","2019-02-11 14:32:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("688","2019-02-11 14:32:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("689","2019-02-11 14:32:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("690","2019-02-11 14:32:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("691","2019-02-11 14:32:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("692","2019-02-11 14:32:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("693","2019-02-11 14:32:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("694","2019-02-11 14:34:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("695","2019-02-11 14:34:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("696","2019-02-11 14:34:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("697","2019-02-11 14:34:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("698","2019-02-11 14:34:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("699","2019-02-11 14:34:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("700","2019-02-11 14:34:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("701","2019-02-11 14:34:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("702","2019-02-11 14:35:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("703","2019-02-11 14:35:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("704","2019-02-11 14:35:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("705","2019-02-11 14:35:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("706","2019-02-11 14:35:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("707","2019-02-11 14:35:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("708","2019-02-11 14:35:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("709","2019-02-11 14:35:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("710","2019-02-11 14:35:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("711","2019-02-11 14:35:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("712","2019-02-11 14:35:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("713","2019-02-11 14:35:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("714","2019-02-11 14:36:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("715","2019-02-11 14:36:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("716","2019-02-11 14:36:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("717","2019-02-11 14:36:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("718","2019-02-11 14:36:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("719","2019-02-11 14:36:46","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("720","2019-02-11 14:40:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("721","2019-02-11 14:40:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("722","2019-02-11 14:40:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("723","2019-02-11 14:40:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("724","2019-02-11 14:40:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("725","2019-02-11 14:40:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("726","2019-02-11 14:40:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("727","2019-02-11 14:40:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("728","2019-02-11 14:40:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("729","2019-02-11 14:40:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("730","2019-02-11 14:40:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("731","2019-02-11 14:40:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("732","2019-02-11 14:40:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("733","2019-02-11 14:43:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("734","2019-02-11 14:43:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("735","2019-02-11 14:43:28","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("736","2019-02-11 14:43:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("737","2019-02-11 14:43:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("738","2019-02-11 14:43:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("739","2019-02-11 14:43:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("740","2019-02-11 14:43:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("741","2019-02-11 14:43:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("742","2019-02-11 14:43:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("743","2019-02-11 14:44:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("744","2019-02-11 14:44:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("745","2019-02-11 14:44:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("746","2019-02-11 14:44:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("747","2019-02-11 14:45:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("748","2019-02-11 14:45:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("749","2019-02-11 14:45:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("750","2019-02-11 14:45:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("751","2019-02-11 14:45:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("752","2019-02-11 14:45:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("753","2019-02-11 14:45:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("754","2019-02-11 14:45:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("755","2019-02-11 14:45:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("756","2019-02-11 14:45:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("757","2019-02-11 14:45:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("758","2019-02-11 14:45:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("759","2019-02-11 14:46:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("760","2019-02-11 14:46:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("761","2019-02-11 14:46:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("762","2019-02-11 14:46:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("763","2019-02-11 14:46:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("764","2019-02-11 14:46:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("765","2019-02-11 14:46:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("766","2019-02-11 14:46:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("767","2019-02-11 14:46:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("768","2019-02-11 14:47:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("769","2019-02-11 14:47:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("770","2019-02-11 14:47:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("771","2019-02-11 14:47:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("772","2019-02-11 14:47:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("773","2019-02-11 14:47:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("774","2019-02-11 14:47:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("775","2019-02-11 14:47:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("776","2019-02-11 14:47:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("777","2019-02-11 14:47:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("778","2019-02-11 14:48:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("779","2019-02-11 14:48:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("780","2019-02-11 14:48:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("781","2019-02-11 14:48:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("782","2019-02-11 14:48:28","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("783","2019-02-11 14:48:30","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("784","2019-02-11 14:48:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("785","2019-02-11 14:48:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("786","2019-02-11 14:48:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("787","2019-02-11 14:48:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("788","2019-02-11 14:48:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("789","2019-02-11 14:48:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("790","2019-02-11 14:48:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("791","2019-02-11 14:48:59","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("792","2019-02-11 14:49:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("793","2019-02-11 14:49:04","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("794","2019-02-11 14:49:31","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("795","2019-02-11 14:49:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("796","2019-02-11 14:49:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("797","2019-02-11 14:49:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("798","2019-02-11 14:49:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("799","2019-02-11 14:49:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("800","2019-02-11 14:49:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("801","2019-02-11 14:50:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("802","2019-02-11 14:50:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("803","2019-02-11 14:50:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("804","2019-02-11 14:50:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("805","2019-02-11 14:50:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("806","2019-02-11 14:50:48","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("807","2019-02-11 14:51:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("808","2019-02-11 14:51:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("809","2019-02-11 14:51:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("810","2019-02-11 14:51:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("811","2019-02-11 14:51:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("812","2019-02-11 14:51:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("813","2019-02-11 14:55:22","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("814","2019-02-11 14:56:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("815","2019-02-11 14:57:00","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("816","2019-02-11 14:59:45","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("817","2019-02-11 14:59:57","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("818","2019-02-11 15:00:31","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("819","2019-02-11 15:00:44","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("820","2019-02-11 15:00:58","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("821","2019-02-11 15:00:59","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("822","2019-02-11 15:01:01","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("823","2019-02-11 15:01:02","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("824","2019-02-11 15:01:03","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("825","2019-02-11 15:01:06","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("826","2019-02-11 15:01:06","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("827","2019-02-11 15:01:06","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("828","2019-02-11 15:02:06","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("829","2019-02-11 15:02:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("830","2019-02-11 15:02:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("831","2019-02-11 16:17:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("832","2019-02-11 16:17:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("833","2019-02-11 16:17:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("834","2019-02-11 16:18:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/deleteTransaction","Deleted a Transaction","deleteTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("835","2019-02-11 16:21:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("836","2019-02-11 16:21:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("837","2019-02-11 16:22:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/deleteTransaction","Deleted a Transaction","deleteTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("838","2019-02-11 16:22:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("839","2019-02-12 11:31:21","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("840","2019-02-12 11:31:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("841","2019-02-12 11:31:32","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("842","2019-02-12 11:31:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("843","2019-02-12 11:40:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("844","2019-02-12 11:40:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("845","2019-02-12 11:40:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("846","2019-02-12 11:41:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("847","2019-02-12 11:42:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("848","2019-02-12 11:45:55","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("849","2019-02-12 11:46:31","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("850","2019-02-12 11:46:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("851","2019-02-12 11:46:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("852","2019-02-12 11:46:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("853","2019-02-12 11:46:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("854","2019-02-12 11:46:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("855","2019-02-12 11:47:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("856","2019-02-12 11:47:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("857","2019-02-12 11:48:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("858","2019-02-12 11:48:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("859","2019-02-12 11:49:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("860","2019-02-12 11:49:02","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("861","2019-02-12 11:49:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("862","2019-02-12 11:49:46","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("863","2019-02-12 11:49:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("864","2019-02-12 11:49:51","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("865","2019-02-12 11:51:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("866","2019-02-12 11:52:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("867","2019-02-12 11:52:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("868","2019-02-12 11:53:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("869","2019-02-12 11:53:12","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("870","2019-02-12 11:53:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("871","2019-02-12 11:53:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("872","2019-02-12 12:10:00","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("873","2019-02-12 12:12:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("874","2019-02-12 12:15:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("875","2019-02-12 12:15:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("876","2019-02-12 12:15:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("877","2019-02-12 12:15:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("878","2019-02-12 12:16:34","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("879","2019-02-12 12:16:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("880","2019-02-12 12:16:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("881","2019-02-12 12:16:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("882","2019-02-12 12:16:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("883","2019-02-12 12:17:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("884","2019-02-12 12:19:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("885","2019-02-12 12:19:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("886","2019-02-12 12:20:10","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("887","2019-02-12 12:20:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("888","2019-02-12 12:21:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("889","2019-02-12 12:23:12","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("890","2019-02-12 12:23:15","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/editUI","View Customer Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("891","2019-02-12 12:23:25","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/view","View Expense Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("892","2019-02-12 12:23:27","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/editUI","View Edit Page","editUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("893","2019-02-12 12:30:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("894","2019-02-12 12:30:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("895","2019-02-12 12:30:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("896","2019-02-12 12:33:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("897","2019-02-12 12:39:36","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("898","2019-02-12 12:41:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("899","2019-02-12 12:42:35","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("900","2019-02-12 12:43:01","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("901","2019-02-12 12:43:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("902","2019-02-12 12:49:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("903","2019-02-12 12:50:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("904","2019-02-12 12:50:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("905","2019-02-12 12:50:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("906","2019-02-12 12:51:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("907","2019-02-12 12:51:18","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("908","2019-02-12 12:51:57","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("909","2019-02-12 12:52:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("910","2019-02-12 12:52:11","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("911","2019-02-12 12:52:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("912","2019-02-12 12:52:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("913","2019-02-12 12:52:38","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("914","2019-02-12 12:54:39","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("915","2019-02-12 12:54:41","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("916","2019-02-12 12:55:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("917","2019-02-12 12:57:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("918","2019-02-12 12:57:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("919","2019-02-12 12:57:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("920","2019-02-12 12:57:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransaction","Updated a Transaction","editTransaction","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("921","2019-02-12 12:57:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("922","2019-02-12 12:57:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("923","2019-02-12 14:08:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("924","2019-02-12 14:09:03","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/editTransactionUI","View Edit Transaction Page","editTransactionUI","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("925","2019-02-12 14:14:39","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("926","2019-02-12 14:23:16","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("927","2019-02-12 14:23:34","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("928","2019-02-12 14:25:55","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("929","2019-02-12 14:26:16","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("930","2019-02-12 14:26:28","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("931","2019-02-12 14:27:06","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("932","2019-02-12 14:27:13","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("933","2019-02-12 14:39:02","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("934","2019-02-12 14:39:23","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("935","2019-02-12 14:40:02","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("936","2019-02-12 14:40:15","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("937","2019-02-12 14:40:20","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("938","2019-02-12 14:40:30","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("939","2019-02-12 14:40:39","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("940","2019-02-12 14:41:45","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("941","2019-02-12 14:42:00","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("942","2019-02-12 14:42:10","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("943","2019-02-12 14:42:55","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("944","2019-02-12 14:43:11","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("945","2019-02-12 14:44:19","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("946","2019-02-12 14:44:27","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("947","2019-02-12 14:44:39","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("948","2019-02-12 14:45:12","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("949","2019-02-12 14:45:32","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("950","2019-02-12 14:49:00","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("951","2019-02-12 14:51:58","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("952","2019-02-12 14:52:37","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("953","2019-02-12 14:54:30","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("954","2019-02-12 14:55:29","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("955","2019-02-12 15:00:19","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("956","2019-02-12 15:00:52","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("957","2019-02-12 15:01:51","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("958","2019-02-12 15:02:20","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("959","2019-02-12 15:05:01","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("960","2019-02-12 15:05:16","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("961","2019-02-12 15:05:31","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("962","2019-02-12 15:07:31","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("963","2019-02-12 15:08:42","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("964","2019-02-12 15:10:19","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("965","2019-02-12 15:11:07","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("966","2019-02-12 15:11:17","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("967","2019-02-12 15:11:27","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("968","2019-02-12 15:11:38","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("969","2019-02-12 15:12:04","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("970","2019-02-12 15:12:18","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("971","2019-02-12 15:12:29","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("972","2019-02-12 15:13:01","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("973","2019-02-12 15:14:30","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("974","2019-02-12 15:15:00","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("975","2019-02-12 15:16:03","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("976","2019-02-12 15:16:21","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("977","2019-02-12 15:17:20","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("978","2019-02-12 15:18:15","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("979","2019-02-12 15:18:52","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("980","2019-02-12 15:19:56","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("981","2019-02-12 15:20:23","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("982","2019-02-12 15:20:39","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("983","2019-02-12 15:20:42","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("984","2019-02-12 15:21:02","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("985","2019-02-12 15:31:28","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("986","2019-02-12 15:35:20","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("987","2019-02-12 15:35:28","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("988","2019-02-12 15:35:31","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/logout","Logged Out","logout","Ruwanthi Tissera","6");
INSERT INTO logintracking VALUES("989","2019-02-12 15:35:33","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("990","2019-02-13 14:26:19","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("991","2019-02-13 14:26:22","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("992","2019-02-13 14:28:25","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("993","2019-02-13 14:29:04","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("994","2019-02-13 14:31:39","http://localhost:8181/UltraHub/UHSJMS/index.php/tracking/Tracking/view","View Tracking Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("995","2019-02-13 14:36:24","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/add","View Add Stock Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("996","2019-02-13 14:37:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/add","View Add Stock Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("997","2019-02-13 14:54:28","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/add","View Add Stock Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("998","2019-02-13 15:51:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("999","2019-02-14 11:31:20","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1000","2019-02-14 11:31:34","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1001","2019-02-14 11:34:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1002","2019-02-14 11:53:07","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1003","2019-02-14 12:02:34","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1004","2019-02-14 12:03:15","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1005","2019-02-14 12:04:23","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1006","2019-02-14 12:05:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1007","2019-02-14 12:05:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1008","2019-02-14 12:06:18","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1009","2019-02-14 12:14:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1010","2019-02-14 12:16:58","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1011","2019-02-14 12:45:24","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1012","2019-02-14 13:12:11","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1013","2019-02-14 13:36:16","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1014","2019-02-14 13:42:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1015","2019-02-14 13:44:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1016","2019-02-14 14:00:06","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1017","2019-02-14 14:03:19","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1018","2019-02-14 14:30:19","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1019","2019-02-14 14:36:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1020","2019-02-14 14:58:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1021","2019-02-14 15:05:34","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1022","2019-02-14 15:06:23","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1023","2019-02-14 15:07:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1024","2019-02-14 15:12:28","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1025","2019-02-14 15:14:12","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1026","2019-02-14 15:14:34","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1027","2019-02-14 15:15:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1028","2019-02-14 15:15:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1029","2019-02-14 15:15:37","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1030","2019-02-14 15:16:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1031","2019-02-14 15:17:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1032","2019-02-14 15:17:39","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1033","2019-02-14 15:17:43","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1034","2019-02-14 15:17:57","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1035","2019-02-14 15:18:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1036","2019-02-14 15:18:13","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1037","2019-02-14 15:18:55","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1038","2019-02-14 15:19:07","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1039","2019-02-14 15:19:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1040","2019-02-14 15:19:44","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1041","2019-02-14 15:19:49","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1042","2019-02-14 15:19:52","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1043","2019-02-14 15:20:01","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1044","2019-02-14 15:20:27","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1045","2019-02-14 15:20:39","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1046","2019-02-14 15:21:27","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1047","2019-02-14 15:21:28","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1048","2019-02-14 15:21:32","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1049","2019-02-14 15:22:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1050","2019-02-14 15:22:12","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1051","2019-02-14 15:22:15","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1052","2019-02-14 15:22:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1053","2019-02-14 15:30:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1054","2019-02-14 15:30:57","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1055","2019-02-14 15:30:58","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1056","2019-02-14 15:31:12","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1057","2019-02-14 15:31:41","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1058","2019-02-14 15:31:43","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1059","2019-02-14 15:35:08","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1060","2019-02-14 15:35:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1061","2019-02-14 15:35:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1062","2019-02-15 08:47:11","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1063","2019-02-15 08:52:23","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1064","2019-02-15 09:37:06","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1065","2019-02-15 09:37:42","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1066","2019-02-15 09:40:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1067","2019-02-15 09:40:47","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1068","2019-02-15 09:46:11","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1069","2019-02-15 09:46:25","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1070","2019-02-15 09:46:29","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1071","2019-02-15 09:47:13","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1072","2019-02-15 09:47:33","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1073","2019-02-15 09:48:01","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1074","2019-02-15 09:48:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1075","2019-02-15 09:49:00","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1076","2019-02-15 09:49:40","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/view","View Customer Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1077","2019-02-15 09:49:52","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1078","2019-02-15 09:51:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1079","2019-02-15 09:51:37","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1080","2019-02-15 09:52:05","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1081","2019-02-15 09:52:40","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgoldstock","Gold item added","addgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1082","2019-02-15 09:52:40","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1083","2019-02-15 09:52:48","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1084","2019-02-15 09:54:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1085","2019-02-15 09:54:41","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1086","2019-02-15 09:55:02","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1087","2019-02-15 09:55:30","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1088","2019-02-15 09:55:42","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1089","2019-02-15 09:56:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1090","2019-02-15 09:56:52","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1091","2019-02-15 09:57:05","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1092","2019-02-15 09:57:26","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1093","2019-02-15 09:58:01","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1094","2019-02-15 09:58:03","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1095","2019-02-15 09:58:05","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1096","2019-02-15 09:58:06","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1097","2019-02-15 09:58:08","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1098","2019-02-15 09:58:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1099","2019-02-15 09:58:16","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1100","2019-02-15 10:00:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1101","2019-02-15 10:05:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1102","2019-02-15 10:05:14","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/delete","Gold item Deleted","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1103","2019-02-15 10:05:14","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1104","2019-02-15 10:05:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/delete","Gold item Deleted","delete","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1105","2019-02-15 10:05:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1106","2019-02-15 10:18:51","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1107","2019-02-15 10:34:13","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1108","2019-02-15 10:34:30","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1109","2019-02-15 10:42:41","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1110","2019-02-15 10:43:44","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1111","2019-02-15 10:43:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1112","2019-02-15 10:44:04","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1113","2019-02-15 10:46:54","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1114","2019-02-15 10:50:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1115","2019-02-15 10:50:43","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1116","2019-02-15 10:50:54","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1117","2019-02-15 10:50:59","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1118","2019-02-15 10:51:05","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1119","2019-02-15 10:52:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1120","2019-02-15 10:54:09","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1121","2019-02-15 10:54:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1122","2019-02-15 10:54:20","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1123","2019-02-15 10:54:26","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold items Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1124","2019-02-15 10:54:29","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1125","2019-02-15 10:54:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1126","2019-02-15 10:54:31","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1127","2019-02-15 10:56:48","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1128","2019-02-15 10:56:48","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1129","2019-02-15 10:56:51","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1130","2019-02-15 10:56:51","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1131","2019-02-15 10:57:07","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1132","2019-02-15 10:57:07","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1133","2019-02-15 10:57:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1134","2019-02-15 10:58:00","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1135","2019-02-15 10:58:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1136","2019-02-15 10:58:27","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1137","2019-02-15 10:58:27","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1138","2019-02-15 10:58:35","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1139","2019-02-15 10:58:35","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1140","2019-02-15 10:59:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1141","2019-02-15 10:59:10","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1142","2019-02-15 10:59:16","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1143","2019-02-15 11:01:40","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1144","2019-02-15 11:01:40","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1145","2019-02-15 11:01:45","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1146","2019-02-15 11:01:45","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1147","2019-02-15 11:01:54","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1148","2019-02-15 11:01:54","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1149","2019-02-15 11:02:51","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1150","2019-02-15 11:03:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editgoldstock","Gold item edited","editgoldstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1151","2019-02-15 11:03:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1152","2019-02-15 11:11:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilver","View Add Silver Stock Page","addsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1153","2019-02-15 11:12:04","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilverstock","Silver item added","addsilverstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1154","2019-02-15 11:12:05","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilver","View Add Silver Stock Page","addsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1155","2019-02-15 11:15:11","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1156","2019-02-15 11:17:19","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1157","2019-02-15 11:17:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/deleteSilver","Silver item Deleted","deleteSilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1158","2019-02-15 11:17:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1159","2019-02-15 11:18:18","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilver","View Add Silver Stock Page","addsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1160","2019-02-15 11:18:28","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilverstock","Silver item added","addsilverstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1161","2019-02-15 11:18:29","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilver","View Add Silver Stock Page","addsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1162","2019-02-15 11:18:33","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1163","2019-02-15 11:18:35","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/deleteSilver","Silver item Deleted","deleteSilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1164","2019-02-15 11:18:35","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1165","2019-02-15 11:18:53","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1166","2019-02-15 11:22:47","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1167","2019-02-15 11:22:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editsilverstock","Silver item edited","editsilverstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1168","2019-02-15 11:22:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1169","2019-02-15 11:23:08","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editsilverstock","Silver item edited","editsilverstock","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1170","2019-02-15 11:23:08","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1171","2019-02-15 11:23:19","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1172","2019-02-15 11:23:23","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1173","2019-02-15 11:25:28","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1174","2019-02-15 11:26:23","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1175","2019-02-15 11:26:25","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1176","2019-02-15 11:26:29","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1177","2019-02-15 11:26:43","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1178","2019-02-15 11:26:47","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold Stock Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1179","2019-02-15 11:26:50","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1180","2019-02-15 11:26:53","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1181","2019-02-15 11:27:11","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1182","2019-02-15 11:27:17","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editSilverUI","View Silver item edit page","editSilverUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1183","2019-02-15 11:27:21","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold Stock Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1184","2019-02-15 11:27:24","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/editUI","View gold item edit page","editUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1185","2019-02-15 11:27:27","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold Stock Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1186","2019-02-15 11:29:38","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Gold Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1187","2019-02-15 11:47:18","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Gold Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1188","2019-02-15 11:47:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1189","2019-02-15 11:47:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1190","2019-02-15 11:47:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1191","2019-02-15 11:47:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1192","2019-02-15 11:48:22","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1193","2019-02-15 11:48:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1194","2019-02-15 11:48:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1195","2019-02-15 11:49:08","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1196","2019-02-15 11:49:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1197","2019-02-15 11:49:24","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1198","2019-02-15 11:50:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1199","2019-02-15 11:51:16","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1200","2019-02-15 11:53:05","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1201","2019-02-15 11:53:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1202","2019-02-15 11:53:49","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1203","2019-02-15 11:54:26","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1204","2019-02-15 11:54:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1205","2019-02-15 11:54:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1206","2019-02-15 11:54:40","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1207","2019-02-15 11:54:42","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1208","2019-02-15 11:54:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1209","2019-02-15 11:54:47","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1210","2019-02-15 11:55:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1211","2019-02-15 11:55:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1212","2019-02-15 11:58:37","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1213","2019-02-15 11:58:58","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1214","2019-02-15 11:59:07","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1215","2019-02-15 11:59:09","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1216","2019-02-15 11:59:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1217","2019-02-15 11:59:33","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1218","2019-02-15 12:00:46","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1219","2019-02-15 12:01:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1220","2019-02-15 12:01:14","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1221","2019-02-15 12:01:17","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1222","2019-02-15 12:01:19","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1223","2019-02-15 12:01:20","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1224","2019-02-15 12:01:23","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1225","2019-02-15 13:40:19","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Gold Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1226","2019-02-15 13:40:22","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold Stock Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1227","2019-02-15 13:40:45","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewgold","View Gold Stock Page","viewgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1228","2019-02-15 13:40:49","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1229","2019-02-15 13:40:52","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addsilver","View Add Silver Stock Page","addsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1230","2019-02-15 13:40:56","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/viewsilver","View Silver Stock Page","viewsilver","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1231","2019-02-15 13:41:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/view","View Select a Bank Page","view","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1232","2019-02-15 13:41:54","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1233","2019-02-15 13:43:13","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1234","2019-02-15 13:43:50","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1235","2019-02-15 13:43:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1236","2019-02-15 13:43:56","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1237","2019-02-15 13:45:43","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1238","2019-02-15 13:45:44","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1239","2019-02-15 13:46:53","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1240","2019-02-15 13:48:15","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1241","2019-02-15 13:50:45","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1242","2019-02-15 13:51:21","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1243","2019-02-15 13:51:25","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1244","2019-02-15 13:51:27","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/viewTransactionUI","View Transaction Page","viewTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1245","2019-02-15 13:51:29","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/addTransactionUI","View Add Transaction Page","addTransactionUI","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1246","2019-02-20 15:54:45","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1247","2019-02-20 16:05:39","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1248","2019-02-20 16:05:58","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1249","2019-02-20 16:06:33","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1250","2019-02-20 16:06:55","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1251","2019-02-20 16:07:08","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1252","2019-02-20 16:07:32","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1253","2019-02-20 16:07:52","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1254","2019-02-20 16:07:59","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1255","2019-02-27 16:00:17","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1256","2019-03-28 15:02:40","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1257","2019-03-28 15:03:07","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1258","2019-03-28 15:03:10","http://localhost:8181/UltraHub/UHSJMS/index.php/login/Login/login","Logged In","login","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1259","2019-03-28 15:03:25","http://localhost:8181/UltraHub/UHSJMS/index.php/stock/Stock/addgold","View Add Gold Stock Page","addgold","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1260","2019-03-28 15:03:37","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1261","2019-03-28 15:04:16","http://localhost:8181/UltraHub/UHSJMS/index.php/oldgold/Oldgold/add","View Add Old Gold Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1262","2019-03-28 15:04:33","http://localhost:8181/UltraHub/UHSJMS/index.php/purchase/Purchase/add","View Purchase Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1263","2019-03-28 15:04:39","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1264","2019-03-28 15:04:44","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1265","2019-03-28 15:04:49","http://localhost:8181/UltraHub/UHSJMS/index.php/customer/Customer/add","View Add Customer Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1266","2019-03-28 15:04:52","http://localhost:8181/UltraHub/UHSJMS/index.php/bank/Bank/add","View Select a Bank Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1267","2019-03-28 15:04:57","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1268","2019-03-28 15:05:02","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1269","2019-03-28 15:05:09","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1270","2019-03-28 15:05:09","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1271","2019-03-28 15:05:12","http://localhost:8181/UltraHub/UHSJMS/index.php/expenses/Expenses/add","View Add Expense Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1272","2019-03-28 15:05:16","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1273","2019-03-28 15:05:29","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1274","2019-03-28 15:05:41","http://localhost:8181/UltraHub/UHSJMS/index.php/supplier/Supplier/add","View Add Supplier Page","add","Lakindu  Upeksha","2");
INSERT INTO logintracking VALUES("1275","2019-03-28 15:05:43","http://localhost:8181/UltraHub/UHSJMS/index.php/barcode/Barcode/add","View Generate Barcode Page","add","Lakindu  Upeksha","2");



DROP TABLE manager;

CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO manager VALUES("1","csm","123");



DROP TABLE transaction;

CREATE TABLE `transaction` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `acc_no` varchar(40) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `transfer_acc` varchar(40) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `account` (`acc_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO transaction VALUES("12","5822555","2019-08-14","Saving","4500","");
INSERT INTO transaction VALUES("13","5822555","2019-08-15","Saving","1500","");
INSERT INTO transaction VALUES("14","5822555","2019-08-15","Saving","2000","");
INSERT INTO transaction VALUES("15","5822555","2019-08-16","Saving","7000","");
INSERT INTO transaction VALUES("16","5822555","2019-08-16","Saving","5000","");



