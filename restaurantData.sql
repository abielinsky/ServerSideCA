CREATE DATABASE IF NOT EXISTS FastFoodRestaurant;
USE FastFoodRestaurant;

CREATE TABLE MenuItems (
ItemID int PRIMARY KEY,
ItemName varchar(255) NOT NULL,
Price decimal(10, 2) NOT NULL,
Category varchar(50) NOT NULL
);

CREATE TABLE Orders (
OrderID int PRIMARY KEY,
OrderDate datetime NOT NULL,
TotalPrice decimal(10, 2) NOT NULL,
CustomerName varchar(255) NOT NULL,
CustomerAddress varchar(255) NOT NULL,
CustomerPhone varchar(15) NOT NULL
);

CREATE TABLE OrderDetails (
OrderID int,
ItemID int,
Quantity int,
PRIMARY KEY (OrderID, ItemID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- Insert data into MenuItems table
INSERT INTO MenuItems (ItemID, ItemName, Price, Category) VALUES 
(1, 'Hamburger', 3.99, 'Burgers'),
(2, 'Cheeseburger', 4.49, 'Burgers'),
(3, 'Chicken Sandwich', 5.99, 'Sandwiches'),
(4, 'Fish Sandwich', 6.99, 'Sandwiches'),
(5, 'French Fries', 2.49, 'Sides'),
(6, 'Onion Rings', 2.99, 'Sides'),
(7, 'Coca-Cola', 1.99, 'Drinks'),
(8, 'Sprite', 1.99, 'Drinks'),
(9, 'Vanilla Shake', 3.49, 'Shakes'),
(10, 'Chocolate Shake', 3.49, 'Shakes');

-- Insert data into Orders table
INSERT INTO Orders (OrderID, OrderDate, TotalPrice, CustomerName, CustomerAddress, CustomerPhone) VALUES
(1, '2022-02-15 12:30:00', 12.47, 'John Doe', '123 Main St, Laytown', '86836985'),
(2, '2022-02-16 17:45:00', 8.97, 'Jane Smith', '456 Oak St, Galway', '86325965'),
(3, '2022-02-18 13:15:00', 18.96, 'Bob Johnson', '789 Elm St, Cork', '83625412'),
(4, '2022-02-19 20:00:00', 7.47, 'Sara Williams', '321 Pine St, Dundalk', '82563256'),
(5, '2022-02-20 11:00:00', 21.44, 'Mike Davis', '654 Cedar St, Dundalk', '89632589'),
(6, '2022-02-21 14:30:00', 13.46, 'Emily Brown', '987 Maple St, Galway', '87452145'),
(7, '2022-02-22 18:00:00', 6.98, 'David Lee', '159 Birch St, Drogheda', '86523654'),
(8, '2022-02-23 12:45:00', 10.47, 'Lisa Chen', '753 Oak St, Drogheda', '82365412'),
(9, '2022-02-25 20:15:00', 7.48, 'Chris Taylor', '246 Elm St, Dublin', '89632589'),
(10, '2022-02-26 15:00:00', 15.94, 'Karen Lee', '369 Pine St, Dublin', '87541232');

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderID, ItemID, Quantity) VALUES
(1, 1, 2),
(1, 5, 1),
(1, 7, 2),
(2, 2, 1),
(2, 6, 2),
(2, 8, 1),
(3, 3, 1),
(3, 4, 1),
(3, 9, 2),
(4, 5, 2);




create table Branch ( Branch_Id   int NOT NULL AUTO_INCREMENT,
					  Branch_Name     VARCHAR(50),
					  Manager_Name    VARCHAR(100),
					  Telephone       VARCHAR(15),
					  Address_Line1   VARCHAR(200),
					  Address_Line2   VARCHAR(200),
					  Address_Line3   VARCHAR(200),
					  Eircode         VARCHAR(8),			
					  Established     DATE  ,			  
PRIMARY KEY (Branch_Id));


INSERT INTO Branch VALUES 
('1',  'KFC Jervis',           'Jack Black',     '894148673','125 Abbey Street Upper', 	'North Dublin',     'Co. Dublin',  'D01 W3X5',     '2020/08/11'),
('2',  'KFC Applegreen',       'Ryan Gosling',   '894149241','Demsesne',	        	'Dundalk',		    'Co. Louth',   'A94 R178',     '2021/10/12'),
('3',  'KFC Dundalk Road',     'Amy Winehous',   '894149809','Dundalk Rd', 				'Drogheda', 	    'Co. Louth',   'A42 A241',     '2020/10/13'),
('4',  'KFC Marshes',          'Andrew Garfield','874150377','Marshes Lower', 			'Dundalk',		    'Co. Louth',   'Z11 H463',     '1995/04/14'),
('5',  'KFC Drogheda',         'Jason Bourne',   '874180945','Park Ln',				    'Drogheda',		    'Co. Louth',   'N35 T785',     '2008/10/15'),
('6',  'KFC Galway City',      'Johnny Depp',    '874211513','Meadow Rd', 				'Galway City',      'Co. Galway',  'P24 J445',     '2001/04/16'),
('7',  'KFC Castlebellingham', 'Ariana Grande',  '874242081','Upper Heights',			'Castlebellingham', 'Co. Louth',   'M46 W352',     '2008/02/17'),
('8',  'KFC Ballymahon',       'Marylin Monroe', '874272649','Stallion Ave', 			'Ballymahon', 		'Co. Lonford', 'J35 R456',     '2007/10/18'),
('9',  'KFC Long Walk',        'Frank Sinatra',  '874303217','The Long Walk',			'Dundalk',			'Co. Louth',   'X33 X683',     '2018/10/19'),
('10', 'KFC Ravensdale',       'Billy Benson',   '894153785','Lumpers Rd', 				'Ravensdale', 		'Co. Louth',   'Z24 O757',     '2015/02/10'),
('11',  'KFC Jervis',           'Jack Black',     '894148673','125 Abbey Street Upper', 'North Dublin',     'Co. Dublin',  'D01 W3X5',     '2020/08/11'),
('12',  'KFC Applegreen',       'Ryan Gosling',   '894149241','Demsesne',	        	'Dundalk',		    'Co. Louth',   'A94 R178',     '2021/10/12'),
('13',  'KFC Dundalk Road',     'Amy Winehous',   '894149809','Dundalk Rd', 			'Drogheda', 	    'Co. Louth',   'A42 A241',     '2020/10/13'),
('14',  'KFC Marshes',          'Andrew Garfield','874150377','Marshes Lower', 			'Dundalk',		    'Co. Louth',   'Z11 H463',     '1995/04/14'),
('15',  'KFC Drogheda',         'Jason Bourne',   '874180945','Park Ln',				'Drogheda',		    'Co. Louth',   'N35 T785',     '2008/10/15'),
('16',  'KFC Galway City',      'Johnny Depp',    '874211513','Meadow Rd', 				'Galway City',      'Co. Galway',  'P24 J445',     '2001/04/16'),
('17',  'KFC Castlebellingham', 'Ariana Grande',  '874242081','Upper Heights',			'Castlebellingham', 'Co. Louth',   'M46 W352',     '2008/02/17'),
('18',  'KFC Ballymahon',       'Marylin Monroe', '874272649','Stallion Ave', 			'Ballymahon', 		'Co. Lonford', 'J35 R456',     '2007/10/18'),
('19',  'KFC Long Walk',        'Frank Sinatra',  '874303217','The Long Walk',			'Dundalk',			'Co. Louth',   'X33 X683',     '2018/10/19'),
('20', 'KFC Ravensdale',       'Billy Benson',   '894153785','Lumpers Rd', 				'Ravensdale', 		'Co. Louth',   'Z24 O757',     '2015/02/10');

