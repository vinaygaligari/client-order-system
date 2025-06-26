-- Database: customermanagement
CREATE DATABASE customermanagement;

USE customermanagement; 


-- Table: addclient
CREATE TABLE `addclient` (
  `CustomerID` varchar(30) NOT NULL PRIMARY KEY,
  `FirstName` varchar(30) NOT NULL,
  `SecondName` varchar(30) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `AltPhone` varchar(30),
  `Whatsapp` varchar(30),
  `Facebook` varchar(30),
  `Email` varchar(30)
);

INSERT INTO `addclient` VALUES
('ALeon_01', 'Alex', 'Leon', '9876543210', '9123456789', '9876543210', 'alexleon', 'alex.leon@example.com'),
('MClark_02', 'Maria', 'Clark', '9988776655', '9666554433', '9988776655', 'mariaclark', 'maria.clark@example.com'),
('JSmith_03', 'John', 'Smith', '9112233445', '9001122334', '9112233445', 'johnsmith', 'john.smith@example.com'),
('NDavis_04', 'Nina', 'Davis', '9332211000', NULL, '9332211000', NULL, 'nina.davis@example.com'),
('KChen_05', 'Kevin', 'Chen', '9223344556', '9887766554', '9223344556', 'kevinchen', 'kevin.chen@example.com');

-- Table: registration
CREATE TABLE `registration` (
  `EMPID` varchar(30) NOT NULL PRIMARY KEY,
  `FullName` varchar(30) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
);

INSERT INTO `registration` VALUES
('EMP001', 'Alex Leon', 'alex', 'alex@123'),
('EMP002', 'Maria Clark', 'maria', 'maria@456'),
('EMP003', 'John Smith', 'johns', 'john@789'),
('EMP004', 'Nina Davis', 'nina', 'nina@321'),
('EMP005', 'Kevin Chen', 'kevin', 'kevin@654');

-- Table: subject
CREATE TABLE `subject` (
  `SubjectID` varchar(30) NOT NULL PRIMARY KEY,
  `Subject` varchar(30) NOT NULL,
  `SubjectType` varchar(30) NOT NULL
);

INSERT INTO `subject` VALUES
('SUB001', 'Data Structures', 'Technical'),
('SUB002', 'Business Ethics', 'Theory'),
('SUB003', 'Cloud Computing', 'Technical'),
('SUB004', 'Financial Accounting', 'Theory'),
('SUB005', 'Machine Learning', 'Technical');

-- Table: university
CREATE TABLE `university` (
  `University` varchar(30) NOT NULL PRIMARY KEY,
  `Course` varchar(30) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `UniversityID` varchar(30) NOT NULL
);

INSERT INTO `university` VALUES
('Oxford', 'UG', 'UK', 'OXF001'),
('Stanford', 'PG', 'US', 'STF002'),
('IITDelhi', 'PG', 'India', 'IIT003'),
('Monash', 'UG', 'Australia', 'MON004'),
('Waterloo', 'PG', 'Canada', 'WAT005');

-- Table: task
CREATE TABLE `task` (
  `TaskID` varchar(30) NOT NULL PRIMARY KEY,
  `University` varchar(30) NOT NULL,
  `Cost` varchar(30) NOT NULL,
  `StartDate` varchar(30) NOT NULL,
  `EndDate` varchar(30) NOT NULL,
  `CustomerID` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  FOREIGN KEY (`CustomerID`) REFERENCES `addclient`(`CustomerID`),
  FOREIGN KEY (`University`) REFERENCES `university`(`University`)
);

INSERT INTO `task` VALUES
('TSK001', 'Oxford', '12000', '2025-01-10', '2025-01-20', 'ALeon_01', 'SUB001'),
('TSK002', 'Stanford', '18000', '2025-01-15', '2025-01-25', 'MClark_02', 'SUB003'),
('TSK003', 'IITDelhi', '15000', '2025-02-01', '2025-02-10', 'JSmith_03', 'SUB005'),
('TSK004', 'Monash', '13000', '2025-03-05', '2025-03-15', 'NDavis_04', 'SUB004'),
('TSK005', 'Waterloo', '17000', '2025-03-20', '2025-03-30', 'KChen_05', 'SUB002');

-- Table: payment
CREATE TABLE `payment` (
  `TransactionID` varchar(30) NOT NULL PRIMARY KEY,
  `CustomerID` varchar(30) NOT NULL,
  `PaymentAmount` varchar(30) NOT NULL,
  `PaymentDate` varchar(30) NOT NULL,
  `Cost` varchar(30) NOT NULL,
  `TaskID` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `TaskEndDate` varchar(30) NOT NULL,
  FOREIGN KEY (`CustomerID`) REFERENCES `addclient`(`CustomerID`),
  FOREIGN KEY (`TaskID`) REFERENCES `task`(`TaskID`)
);

INSERT INTO `payment` VALUES
('TRX001', 'ALeon_01', '12000', '2025-01-21', '12000', 'TSK001', 'close', '2025-01-20'),
('TRX002', 'MClark_02', '18000', '2025-01-26', '18000', 'TSK002', 'close', '2025-01-25'),
('TRX003', 'JSmith_03', '15000', '2025-02-11', '15000', 'TSK003', 'open', '2025-02-10'),
('TRX004', 'NDavis_04', '13000', '2025-03-16', '13000', 'TSK004', 'close', '2025-03-15'),
('TRX005', 'KChen_05', '17000', '2025-03-31', '17000', 'TSK005', 'close', '2025-03-30');
