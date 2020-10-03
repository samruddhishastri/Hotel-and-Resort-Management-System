DROP DATABASE IF EXISTS `HOTEL_RESORT`;
CREATE SCHEMA `HOTEL_RESORT`;
USE `HOTEL_RESORT`;

DROP TABLE IF EXISTS `HOTEL`;

CREATE TABLE `HOTEL` (
	`Hotel_id` int(10) NOT NULL,
	`Hotel_name` varchar(50) NOT NULL,
	`Hotel_contact_number` varchar(10) NOT NULL,
	`Street_number` varchar(5) NOT NULL UNIQUE,
	`City` varchar(20) NOT NULL UNIQUE,
	`Ratings` int(2) DEFAULT NULL,
	PRIMARY KEY (`Hotel_id`),
	UNIQUE KEY `Hotel_name` (`Hotel_name`)	
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `HOTEL` WRITE;
INSERT INTO `HOTEL` VALUES ('1', 'Ajanta', '1234567890', 'A1', 'Aurangabad', '5'),('2', 'Radison', '9182736455', 'I1', 'Indore', '6'),('3', 'Paradise', '1234567820', 'H1', 'Hyderabad', '6');
UNLOCK TABLES;

DROP TABLE IF EXISTS `DEPARTMENT`;

CREATE TABLE `DEPARTMENT` (
	`Department_number` varchar(12) NOT NULL,
	`Department_name` varchar(50) NOT NULL,
	`Department_contact_number` varchar(10) NOT NULL,
	`H_id` int(10) NOT NULL,
	PRIMARY KEY (`Department_number`),
	CONSTRAINT `DEPARTMENT_ibfk_1` FOREIGN KEY (`H_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `DEPARTMENT` WRITE;
INSERT INTO `DEPARTMENT` VALUES ('D11', 'Housekeeping', '1234567891', '1'),('D12', 'Food service', '1234567892', '1'),('D13', 'Receptionist', '1234567893', '1'), ('D14', 'Administration', '1234567894', '1'), ('D15', 'Kitchen', '1234567895', '1'),
('D21', 'Housekeeping', '2234567891', '2'),('D22', 'Food service', '2234567892', '2'),('D23', 'Receptionist', '2234567893', '2'), ('D24', 'Administration', '2234567894', '2'), ('D25', 'Kitchen', '2234567895', '2'),
('D31', 'Housekeeping', '3234567891', '3'),('D32', 'Food service', '3234567892', '3'),('D33', 'Receptionist', '3234567893', '3'), ('D34', 'Administration', '3234567894', '3'), ('D35', 'Kitchen', '3234567895', '3');
UNLOCK TABLES;

DROP TABLE IF EXISTS `ROOM`;

CREATE TABLE `ROOM` (
	`Room_number` varchar(12) UNIQUE NOT NULL,
	`Room_category` varchar(50) NOT NULL,
	`Is_available` int(1) NOT NULL,
	`Cost` int(5) NOT NULL,
	`Number_of_people_staying` int(2) NOT NULL,
	`H_id` int(10) NOT NULL,
	CONSTRAINT `ROOM_ibfk_1` FOREIGN KEY (`H_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ROOM` WRITE;
INSERT INTO `ROOM` VALUES ('R11', 'a', '1', '2000', '2', '1'),('R12', 'b', '0', '1500', '3', '1'),('R13', 'c', '1', '3000', '2', '1'),('R14', 'd', '1', '2000', '2', '1'),
('R21', 'a', '1', '2000', '2', '2'),('R22', 'b', '0', '1500', '3', '2'),('R23', 'c', '1', '3000', '2', '2'),('R24', 'd', '1', '2000', '2', '2'),
('R31', 'a', '1', '2000', '2', '3'),('R32', 'b', '0', '1500', '3', '3'),('R33', 'c', '1', '3000', '2', '3'),('R34', 'd', '1', '2000', '2', '3');
UNLOCK TABLES;


DROP TABLE IF EXISTS `PAYMENT`;

CREATE TABLE `PAYMENT` (
	`Payment_id` varchar(12) NOT NULL,
	`Amount` int(10) NOT NULL,
	`Payment_mode` varchar(50) NOT NULL,
	`Date` date NOT NULL,
	PRIMARY KEY (`Payment_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `PAYMENT` WRITE;
INSERT INTO `PAYMENT` VALUES ('H112345','2000', 'Cash', '2020-5-13'), ('H112346','2500', 'Credit Card', '2020-2-6'), ('H112347','3000', 'Debit Card', '2020-9-30'),
('H212345','2000', 'Cash', '2020-4-1'), ('H212346','2500', 'Credit Card', '2020-5-1'), ('H212347','3000', 'Debit Card', '2020-11-7'),
('H312345','2000', 'Cash', '2020-5-13'), ('H312346','2500', 'Credit Card', '2020-2-6'), ('H312347','3000', 'Debit Card', '2020-7-9');
UNLOCK TABLES;


DROP TABLE IF EXISTS `CUSTOMER`;

CREATE TABLE `CUSTOMER` (
	`Customer_id` varchar(12) NOT NULL,
	`Email` varchar(50),
	`F_name` varchar(50) NOT NULL,
	`L_name` varchar(50) NOT NULL,
	PRIMARY KEY (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER` WRITE;
INSERT INTO `CUSTOMER` VALUES ('H10001', 's@s.com', 'Samruddhi', 'Shastri'),('H20001', 't@n.com', 'Tanvi', 'Narsapur'),('H30001', 'p@j.com', 'Pranjal', 'Jain');
UNLOCK TABLES;

CREATE TABLE `CUSTOMER_CONTACT` (
	`Cust_id` varchar(12) NOT NULL,
	`C_contact_no` int(10) NOT NULL,
	PRIMARY KEY (`C_contact_no`),
	CONSTRAINT `CUSTOMER_CONTACT_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER_CONTACT` WRITE;
INSERT INTO `CUSTOMER_CONTACT` VALUES ('H10001', '1234567890'),('H20001', '1234567891'), ('H20001', '1234567892'), ('H30001', '1234967890');
UNLOCK TABLES;

CREATE TABLE `CUSTOMER_ADDRESS` (
	`Cust_id` varchar(12) NOT NULL,
	`Cust_address` varchar(100),
	PRIMARY KEY (`Cust_address`),
	CONSTRAINT `CUSTOMER_ADDRESS_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CUSTOMER_ADDRESS` WRITE;
INSERT INTO `CUSTOMER_ADDRESS` VALUES ('H10001', 'cidco, abad'),('H20001', 'padampura, abad'), ('H30001', 'indore');
UNLOCK TABLES;


DROP TABLE IF EXISTS `ID_PROOF`;

CREATE TABLE `ID_PROOF` (
	`Gender` char NOT NULL,
	`ID_Type` varchar(50) NOT NULL,
	`ID_Number` varchar(50) NOT NULL,
	`DOB` date NOT NULL,
	`Cust_id` varchar(12) NOT NULL,
	CONSTRAINT `ID_PROOF_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ID_PROOF` WRITE;
INSERT INTO `ID_PROOF` VALUES ('F', 'Aadhar number', '123456780987', '2001-04-20', 'H10001'),('F', 'Passport', '23456789987', '2001-01-27', 'H20001'),('F', 'PAN', '234567899HW87', '2001-01-27', 'H30001');
UNLOCK TABLES;

DROP TABLE IF EXISTS `RESERVATION`;

CREATE TABLE `RESERVATION` (
	`Pay_id` varchar(12) NOT NULL,
	`Hotel_id` int(10) NOT NULL,
	`Room_num` varchar(12) NOT NULL,
	`Cust_id_num` varchar(12) NOT NULL,
	`Reserve_id` varchar(15) NOT NULL,
	`Checkin_date` date NOT NULL,
	`Checkout_date` date NOT NULL,
	PRIMARY KEY (`Reserve_id`),
	CONSTRAINT `RESERVATION_ibfk_1` FOREIGN KEY (`Cust_id_num`) REFERENCES `CUSTOMER` (`Customer_id`),
	CONSTRAINT `RESERVATION_ibfk_2` FOREIGN KEY (`Room_num`) REFERENCES `ROOM` (`Room_number`),
	CONSTRAINT `RESERVATION_ibfk_3` FOREIGN KEY (`Pay_id`) REFERENCES `PAYMENT` (`Payment_id`),
	CONSTRAINT `RESERVATION_ibfk_4` FOREIGN KEY (`Hotel_id`) REFERENCES `HOTEL` (`Hotel_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `RESERVATION` WRITE;
INSERT INTO `RESERVATION` VALUES ('H112345', '1', 'R11', 'H10001', 'RH112345', '2020-6-4', '2020-6-9'), ('H212346', '2', 'R22', 'H20001', 'RH212345', '2020-8-1', '2020-8-12'), ('H312347', '3', 'R32', 'H30001', 'RH312345', '2020-3-5', '2020-3-10');
UNLOCK TABLES;

DROP TABLE IF EXISTS `FOOD_ITEM2`;

CREATE TABLE `FOOD_ITEM2` (
	`Item_name` varchar(50) NOT NULL,
	`Price` int(5) NOT NULL,
	`Item_num` int(5) NOT NULL,
	PRIMARY KEY (`Item_num`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `FOOD_ITEM2` WRITE;
INSERT INTO `FOOD_ITEM2` VALUES ('Pasta', '170', '1'),('Pizza', '300', '2'),('Manchurian', '140', '3'), ('Pani Puri', '20', '4'), ('Pav bhaji', '80', '5'), ('Ice cream', '40', '6'), ('Thai curry with Lemon Rice', '400', '7');
UNLOCK TABLES;


DROP TABLE IF EXISTS `FOOD_ITEM1`;

CREATE TABLE `FOOD_ITEM1` (
	`Item_no` int(5) NOT NULL,
	`Cust_id` varchar(50) NOT NULL,
	CONSTRAINT `FOOD_ITEM1_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `CUSTOMER` (`Customer_id`),
	CONSTRAINT `FOOD_ITEM1_ibfk_2` FOREIGN KEY (`Item_no`) REFERENCES `FOOD_ITEM2` (`Item_num`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `FOOD_ITEM1` WRITE;
INSERT INTO `FOOD_ITEM1` VALUES ('4', 'H10001'),('2', 'H10001'),('3', 'H20001'), ('5', 'H30001'), ('2', 'H20001');
UNLOCK TABLES;

DROP TABLE IF EXISTS `EMPLOYEE`;

CREATE TABLE `EMPLOYEE` (
	`Dept_no` varchar(12) NOT NULL,
	`Ssn` varchar(12) NOT NULL,
	`F_name` varchar(20) NOT NULL,
	`L_name` varchar(20) NOT NULL,
	`Salary` int(6) NOT NULL,
	CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`Dept_no`) REFERENCES `DEPARTMENT` (`Department_number`),
	PRIMARY KEY(`Ssn`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EMPLOYEE` WRITE;
INSERT INTO `EMPLOYEE` VALUES ('D11', 'HE11', 'Pragya', 'Singhal', '120000'), ('D22', 'HE21', 'Gunjan', 'Gupta', '141000'), ('D11', 'HE12', 'Isha', 'Gupta', '150000');
UNLOCK TABLES;

DROP TABLE IF EXISTS `MANAGER`;

CREATE TABLE `MANAGER` (
	`Ssn` varchar(12) NOT NULL,
	`Number_of_people_managing` int(2) NOT NULL,
	PRIMARY KEY(`Ssn`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `MANAGER` WRITE;
INSERT INTO `MANAGER` VALUES ('HE11', '20'), ('HE21', '25'), ('HE12', '30');
UNLOCK TABLES;

