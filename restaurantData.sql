
drop table if exists ReservationMadeByDate, Dishes_Menu_Items, Menu_Items, Menu_Type, Docket_Order, Payment,
Payment_Type, Order_Merchandices, Merchandices, Orders, Reservations, Customer, Branch;

drop database if exists restaurant;

CREATE DATABASE IF NOT EXISTS restaurant;
USE restaurant;


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
		

create table Customer   ( Customer_Id        int NOT NULL AUTO_INCREMENT,
						  Customer_ForeName  VARCHAR(50),
						  Customer_SurName   VARCHAR(50), 
						  Customer_Telephone VARCHAR(15),
						  Email              VARCHAR(50),    
PRIMARY KEY (Customer_Id));		
					  
					  
create table Reservations ( Reservation_Id      int NOT NULL AUTO_INCREMENT,
					        Branch_Id           int NOT NULL,
					        Customer_Id         int NOT NULL,
							Customers_At_Table  int NOT NULL,
							Table_Reserved      int NOT NULL,
							Date_Book           DATE NOT NULL,
							Time_Book           TIME NOT NULL,
							Booking_Fee         DECIMAL(7,2),
PRIMARY KEY (Reservation_Id),	
FOREIGN KEY (Branch_Id) REFERENCES Branch(Branch_Id),
FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id));	
			 
					 
create table Orders     ( Orders_Id        int NOT NULL AUTO_INCREMENT,
					      Branch_Id        int NOT NULL,
					      Customer_Id      int NOT NULL,
						  Order_placed     TIME NOT NULL,
						  Order_Delivered  TIME NOT NULL,
						  On_site          VARCHAR(50),
PRIMARY KEY (Orders_Id),										  
FOREIGN KEY (Branch_Id) REFERENCES Branch(Branch_Id),
FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id));	

																				
										  
create table Merchandices ( Merchandices_Id   int NOT NULL AUTO_INCREMENT,
					      	Merchandise_name  VARCHAR(100),	
							Cost              DECIMAL(7,2),  
PRIMARY KEY (Merchandices_Id));

									
create table Order_Merchandices ( Orders_Id int NOT NULL,
								  Merchandices_Id   int NOT NULL,
					      	      Quantity int NOT NULL,
PRIMARY KEY (Merchandices_Id, Orders_Id),
FOREIGN KEY (Merchandices_Id) REFERENCES Merchandices(Merchandices_Id),
FOREIGN KEY (Orders_Id) REFERENCES Orders(Orders_Id)); 	


CREATE table Payment_Type (Type_Id     int NOT NULL AUTO_INCREMENT,	
						   Type_Name  VARCHAR(50) NOT NULL,						
PRIMARY KEY (Type_Id));				

			
CREATE table Payment (Payment_Id     int NOT NULL AUTO_INCREMENT,
					  Orders_Id       int NOT NULL,
					  Type_Id        int NOT NULL,
					  Amount         DECIMAL(7,2),					  
					  Tip            DECIMAL(7,2),					  
PRIMARY KEY (Payment_Id),
FOREIGN KEY (Orders_Id) REFERENCES Orders(Orders_Id),
FOREIGN KEY (Type_Id) REFERENCES Payment_Type(Type_Id));										  
										  
				
										  
create table Docket_Order ( Docket_Order_Id    int NOT NULL AUTO_INCREMENT,
					      	Orders_Id          int NOT NULL,							  
PRIMARY KEY (Docket_Order_Id),
FOREIGN KEY (Orders_Id) REFERENCES Orders(Orders_Id)); 											  
										  									  
										  
create table Menu_Type (    Menu_Type_Id   int NOT NULL AUTO_INCREMENT,
					        Menu_Name     VARCHAR(50),
PRIMARY KEY (Menu_Type_Id));	
									  
										  										 		
		
create table Menu_Items (   Menu_Item_Id    int NOT NULL AUTO_INCREMENT,
					        Menu_Type_Id    int NOT NULL,
					        Menu_Item       VARCHAR(200),
							Cost            DECIMAL(7,2),
PRIMARY KEY (Menu_Item_Id),
FOREIGN KEY (Menu_Type_Id) REFERENCES Menu_Type(Menu_Type_Id)); 	
		

								  											  
create table Dishes_Menu_Items ( Docket_Order_Id   int NOT NULL,
					      	     Menu_Item_Id      int NOT NULL,							  
PRIMARY KEY (Docket_Order_Id, Menu_Item_Id),
FOREIGN KEY (Docket_Order_Id) REFERENCES Docket_Order(Docket_Order_Id),
FOREIGN KEY (Menu_Item_Id) REFERENCES Menu_Items(Menu_Item_Id)); 												  
										  							  
										  								  



INSERT INTO Branch VALUES 
("1",  "KFC Jervis",           "Jack Black",     "894148673","125 Abbey Street Upper", 	"North Dublin",     "Co. Dublin",  "D01 W3X5",     '2020/08/11'),                                             
("2",  "KFC Applegreen",       "Ryan Gosling",   "894149241","Demsesne",					"Dundalk",		    "Co. Louth",   "A94 R178", '2021/10/12'),
("3",  "KFC Dundalk Road",     "Amy Winehouse",  "894149809","Dundalk Rd", 				"Drogheda", 	    "Co. Louth",   "A42 A241",     '2020/10/13'),
("4",  "KFC Marshes",          "Andrew Garfield","874150377","Marshes Lower", 			"Dundalk",		    "Co. Louth",   "Z11 H463",     '1995/04/14'),
("5",  "KFC Drogheda",         "Jason Bourne",   "874180945","Park Ln",				    "Drogheda",		    "Co. Louth",   "N35 T785",     '2008/10/15'),
("6",  "KFC Galway City",   	 "Johnny Depp",    "874211513","Meadow Rd", 				"Galway City",      "Co. Galway",  "P24 J445", '2001/04/16'),
("7",  "KFC Castlebellingham", "Ariana Grande",  "874242081","Upper Heights",				"Castlebellingham", "Co. Louth",   "M46 W352", '2008/02/17'),
("8",  "KFC Ballymahon",       "Marylin Monroe", "874272649","Stallion Ave", 				"Ballymahon", 		"Co. Lonford", "J35 R456", '2007/10/18'),
("9",  "KFC Long Walk",        "Frank Sinatra",  "874303217","The Long Walk",				"Dundalk",			"Co. Louth",   "X33 X683", '2018/10/19'),
("10", "KFC Ravensdale",       "Billy Benson",   "894153785","Lumpers Rd", 				"Ravensdale", 		"Co. Louth",   "Z24 O757",     '2015/02/10');


INSERT INTO Customer VALUES 
('1', "Jack", "Son",        "876719593", "json@gmail.com"),
('2', "James", "Gun",       "876935030", "gunnarj@gmail.com"),
('3', "Peter", "Peterson",  "877150467", "ppson61@hotmail.com"),
('4', "Anne", "Anderson",   "877365904", "trainspotter@gmail.com"),
('5', "Charlie", "Brown",   "877581341", "fakeaccount@gmail.com"),
('6', "Jordan", "Jameson",  "877796778", "jordanj95@gmail.com"),
('7', "Violet", "Greene",   "893012215", "greenevioletbusiness@gmail.com"),
('8', "Karen", "White",     "893827652", "kwhite45@hotmail.com"),
('9', "Mark", "Zuckerberg", "894643089", "datalover@gmail.com"),
('10', "Derek", "Matthews", "895458526", "matthews5632@gmail.com");
	 

INSERT INTO Reservations VALUES 
("1","1","1","4", "1", '2023/01/01', "10:45", "10"),
("2","2","2","4", "2", '2023/01/02', "11:42", "10"),
("3","3","3","7", "3", '2023/01/03', "12:39", "25"),
("4","4","4","2", "4", '2022/12/04', "13:36", "5"),
("5","5","5","4", "5", '2022/12/05', "14:33", "5"),
("6","6","6","5", "6", '2022/12/06', "15:30", "10"),
("7","7","7","4", "7", '2022/12/01', "16:27", "25"),
("8","8","8","7", "8", '2022/12/01', "17:24", "10"),
("9","9","9","3", "9", '2022/12/02', "18:21", "7"),
("10","9","9","3", "9", '2022/12/02', "18:21", "10");


INSERT INTO Orders VALUES 
("300", "1", "1","10:24","10:53", "True"),
("301", "2", "2","13:01","13:17", "True"),
("302", "3", "3","19:45","20:01", "False"),
("303", "4", "4","19:18","19:44", "True"),
("304", "5", "5","14:00","14:33", "False"),
("305", "6", "6","13:50","14:13", "False"),
("306", "7", "7","11:03","11:04", "True"),
("307", "8", "8","10:10","10:23", "True"),
("308", "9", "9","18:14","18:19", "True"),
("309", "10", "10","20:00","20:26", "False");
	

INSERT INTO Merchandices VALUES 
("1", "KFC Hat", "12.5"),
("2", "KFC Hat", "12.5"),
("3", "KFC Shirt", "20.99"),
("4", "KFC Pencil", "1.99"),
("5", "KFC Mug", "5.99"),
("6", "KFC Scarf", "12.99"),
("7", "KFC Face Mask", "3.5"),
("8", "KFC Bag", "29.99"),
("9", "KFC Bobblehead", "7.5"),
("10", "KFC Poster", "6.99");


insert into Order_Merchandices values 
("301", "2", "30"),
("301", "3", "25"),
("300", "2", "30"),
("303", "5", "20"),
("305", "4", "25"),
("306", "6", "10"),
("308", "8", "15"),
("308", "9", "20"),
("308", "1", "30"),
("309", "7", "70");

	
insert into Payment_Type values 
(1,"Cash"),
(2,"Credit Card"),
(3,"Debit Card"),
(4,"Paypal"),
(5,"Google Pay"),
(6,"Apple Pay"),
(7,"Revolut"),
(8,"Amazon Pay");

insert into Payment values 
(1,300,1,100.00, 00.00),						  
(2,301,2,50.00, 10.00),						  
(3,302,4,80.00, 5.00),						  
(4,303,8,200.00, 6.00),						  
(5,304,6,120.00, 7.00),						  
(6,305,4,117.00, 10.00),						  
(7,306,5,85.00, 5.00),						  
(8,307,7,78.00, 8.00),
(9,308,3,65.00, 15.00),						  
(10,309,4,150.00, 5.00);	
			

insert into Docket_Order values 
(400,300),						  
(401,301),						  
(402,302),						  
(403,303),						  
(404,304),						  
(405,305),						  
(406,306),						  
(407,307),
(408,308),						  
(409,309);	

										  
insert into Menu_Type values 
(800,"Breakfast"),						  
(801,"Lunch"),						  
(802,"Dinner");	


insert into Menu_Items values 
(600, 801, "Chicken Fillet Roll", 20),
(601, 802, "Chicken Burger", 25),
(602, 801, "Chicken Salad", 30),
(603, 802, "Zinger Burger", 32),
(604, 801, "Chicken Selects Bucket", 15),
(605, 800, "Cereal", 17),
(606, 800, "Chicken Breakfast Bap", 27),
(607, 801, "Chicken and Beans Box", 18),
(608, 802, "Chicken Supreme Burger", 38),
(609, 801, "Chicken Nugget", 34);
							  
				
				
insert into Dishes_Menu_Items values 
(400,600),						  
(401,601),						  
(402,602),						  
(403,603),						  
(404,604),						  
(405,605),						  
(406,606),						  
(407,607),
(408,608),						  
(409,609);						  
		



/* =====================================================================================================================================*/
/* ======================================================== TRIGERS ====================================================================*/



/* *** 1) .. The next query will be created, to store in a new table whit the information of reservations and the date when was made..*/

			/*//*        Creating table for triger reservation.    */

			CREATE table ReservationMadeByDate (
											Customer_Id       varchar (50),
											Table_Reserved    varchar (50),
											Date_Book         DATE NOT NULL,
											Time_Book         TIME NOT NULL,
											ReservationMadeDate DATETIME
											);
											
			/*Creating a trigger that will show when the reservation was made.*/

			CREATE TRIGGER ReservationMadeOn AFTER INSERT ON reservations for each ROW
			insert into ReservationMadeByDate (Customer_Id, Table_Reserved,  Date_Book, Time_Book, ReservationMadeDate)
			values 
			(new.Customer_Id, new.Table_Reserved,  new.Date_Book, new.Time_Book, now());

			/*Extra Values to validate the trigger.*/
			INSERT INTO Reservations VALUES 
			("11","1","1","4", "1", '2022/12/20', "10:00", "10"),
			("22","2","2","4", "2", '2022/12/21', "11:00", "10");
			

			/*Consultin trigger by checking the new data on new table showing a new column with 
			the date and time when was made the reservation. */

			select * from reservationmadebydate;



/*2) *** .. The next table will be created to store the information updated by the next triggers when some changes ocurs in 
       tables: Menu_Items, Reservations, Menu_Type, Customer. */
  
			/*Queries before updates*/
			select * from reservations;
			select * from Menu_Items;
			select * from Menu_Type;
			select * from customer;
			/*-----------------------	*/
  
			create table history (id_history       int primary key not null AUTO_INCREMENT, 
						          tableDescription varchar(100), 
						          tableIdModified  int, 
						          oldValue         varchar(100));


		/* The next Trigger stores the old cost of any menu_item if is updated by a new cost... */
			DELIMITER //
			CREATE TRIGGER `updateCosto` AFTER UPDATE ON `Menu_Items` FOR EACH ROW BEGIN
			IF NEW.Cost != OLD.Cost then
			INSERT INTO history VALUES (NULL, 'Menu_Items',  old.Menu_Item_Id, old.Cost);
			END IF;
			END
			//
			DELIMITER ;

        /* The next Trigger stores the old date when a customer decide to change the date of booking for a new booking. */
			drop trigger if exists updateReservation;
			DELIMITER //
			CREATE TRIGGER `updateReservation` AFTER UPDATE ON `Reservations` FOR EACH ROW BEGIN
			IF NEW.date_book != OLD.date_book then
			INSERT INTO history VALUES (NULL, 'Reservations',  old.Reservation_Id, old.date_book);
			END IF;
			END
			//
			DELIMITER ;

        /* The next Trigger stores the old name given to a menu_name*/
			DELIMITER //
			CREATE TRIGGER `updateMenuTypeDesc` AFTER UPDATE ON `Menu_Type` FOR EACH ROW BEGIN
			IF NEW.Menu_Name != OLD.Menu_Name then
			INSERT INTO history VALUES (NULL, 'Menu_Type',  old.Menu_Type_Id, old.Menu_Name);
			END IF;
			END
			//
			DELIMITER ;

        /* The next Trigger stores the old email given by a customer.*/
			DELIMITER //
			CREATE TRIGGER `updateMail` AFTER UPDATE ON `Customer` FOR EACH ROW BEGIN
			IF NEW.Email != OLD.Email then
			INSERT INTO history VALUES (NULL, 'Customer',  old.Customer_Id, old.Email);
			END IF;
			END
			//
			DELIMITER ;

			/*queries to validate the previous triggers*/

			UPDATE Menu_Items SET cost = '100.00' WHERE Menu_Item_Id = 600;
			UPDATE Reservations SET date_book = '2024-02-02' WHERE Reservation_Id = 1;
			UPDATE Menu_Type SET Menu_Name = 'Super New Break Fast' WHERE Menu_Type_Id = 800;
			UPDATE Customer SET Email = 'SonSonSon@gmail.com' WHERE Customer_Id = 1;
			
			/* Consulting the table History that stores the old values will be giving you the history of the old values*/
			
			select * from history;
			
			
/*3) **** .. The next table will be created to store the information has been deleted from the table merchandises, 
	-------	Showing the date and time the data was deletedd....*/
  
			create table merchandicesHistoryDeleted (     Merchandices_Id   varchar(10), 
											Merchandise_name   varchar(100), 
											Cost               varchar(10),
											Usuario            varchar(50),
											DateDeleted        DATETIME);			
			
			/* Triger to store the the merchandises that has been deleted*/ 
			CREATE TRIGGER merchandicesHistoryDeleted AFTER DELETE ON merchandices for each ROW
			insert into merchandicesHistoryDeleted (Merchandices_Id, Merchandise_name,  Cost, Usuario,  DateDeleted)
			values 
			(old.Merchandices_Id, old.Merchandise_name,  old.Cost, current_user(), now());
			
			/* this queries are executed before are deleted from parent table*/ /* (reference to integrity)*/
			DELETE FROM order_merchandices where Orders_Id = '308';
			DELETE FROM order_merchandices where Orders_Id = '300';
			DELETE FROM order_merchandices where Orders_Id = '301';
		
			/* Queries to delet some merchandeces*/
			DELETE FROM merchandices WHERE Merchandices_Id='1';
			DELETE FROM merchandices WHERE Merchandices_Id='2';
			DELETE FROM merchandices WHERE Merchandices_Id='3';
			
			/* Consulting the table merchandicesHistoryDeleted to check the merchandices that has been deleted 
				including an extra column showing the date and time the data was deleted and the user who did the change... */
			
			SELECT * FROM merchandicesHistoryDeleted;

/* =====================================================================================================================================*/
/* =====================================================================================================================================*/



/* =====================================================================================================================================*/
/* ========================================================  VIEWS  ==================================================================*/


/*  1)  Thiw view will show the customers name whit the surname "Son".  */
			CREATE VIEW CustomerView AS
			select Customer_ForeName, Customer_Telephone from customer
			where Customer_SurName = "Son";
			
			select * from CustomerView;
			
			drop view if exists CustomerView;


/*  2)  This view will show the branches located in Dundalk with the phone Number.  */
			CREATE VIEW branchView AS
			select Branch_Id, Branch_Name, Telephone from branch
			where Address_Line2 = "Dundalk";
			
			select * from branchView;
			
			drop view if exists branchView;
			
			
/*  3)  This view will show the customers, phoneNumber, Date of Book and Fees, Where the Fees are 10.  */
			CREATE VIEW BookingFeeByTen AS
			select c.Customer_ForeName, c.Customer_Telephone, r.Date_Book, r.Booking_Fee
			from customer c, reservations r
			where c.customer_id = r.customer_id
			and Booking_Fee = 10;	

			select * from BookingFeeByTen;			
			
			drop view if exists BookingFeeByTen;
		
		
/*  4)  This view will show the Branches Name, phoneNumber where the orders was made On Site */
			CREATE VIEW BranchesOnSiteView AS
			select b.Branch_Name, b.Telephone, o.Order_placed
			from branch b, orders o
			where b.Branch_Id = o.Branch_Id
			and On_site = 'true';	

			select * from BranchesOnSiteView;			
			
			drop view if exists BranchesOnSiteView;



/* ========================================================================================================================================*/
/* ========================================================================================================================================*/



/* ========================================================================================================================================*/
/* ========================================================  PROCEDURES  ==================================================================*/

/*(1) ****** Create a stored procedure to list all of the records in the reservation table.*/

			drop procedure if exists GetAllReservations;

			DELIMITER //
			CREATE PROCEDURE GetAllReservations()
			   BEGIN
			   SELECT *  FROM reservations;
			   END //
			DELIMITER ;

			call GetAllReservations();

/*(2) *****	Create a stored procedure to list all records in the Reservation table on a given date.  The date is input as a parameter.*/

			drop procedure if exists GetReservationByDate;

			DELIMITER //
			CREATE PROCEDURE GetReservationByDate(IN Dat_Book date)
			   BEGIN
			   SELECT *  FROM reservations
			   where Date_Book = Dat_Book ;
			   END // 
			DELIMITER ;

			Call GetReservationByDate("2022-12-01");
			/*another test*/
			Call GetReservationByDate("2023-01-02");

/*(3) *****	Create a stored procedure to list all records in the Reservation table in a given month.  
			The month is input as a parameter (1-12).*/

			drop procedure if exists GetReservationByMonth;

			SELECT customer_Forename, Date_Book, month(Date_Book) FROM `reservations` JOIN `customer` 
			USING(customer_id) WHERE month(Date_Book) = 12;

			DELIMITER //
			CREATE PROCEDURE GetReservationByMonth(IN Dat_Book INT)
			BEGIN
			SELECT customer_Forename, Date_Book , month(Date_Book) from reservations, customer where reservations.Customer_Id = customer.Customer_Id and
			month(Date_Book) = Dat_Book;
			END //
			DELIMITER ;

			call GetReservationByMonth(12);

			/*another test*/

			call GetReservationByMonth(1);


/*(4) *******	Create a stored procedure to calculate the total value of sales in the order_merchandices table.*/
			/*Create stored procedure for all orders total*/

			drop procedure if exists TotalOrder_merchandices;


			SELECT sum(Quantity*Cost) as total_value from order_merchandices, merchandices where order_merchandices.Merchandices_id = merchandices.Merchandices_id;

			DELIMITER //
			CREATE PROCEDURE TotalOrder_merchandices(OUT total INT)
			BEGIN
			SELECT sum(Quantity*Cost) as total_value from order_merchandices, merchandices where order_merchandices.Merchandices_id = merchandices.Merchandices_id;
			END //
			DELIMITER ;

			call TotalOrder_merchandices(@total);


/*(5) ******* Create stored procedure for each order_merchandices total*/


			drop procedure if exists TotalEachOrder_merchandices;

			SELECT merchandise_name, sum(Quantity*Cost) as total_value from order_merchandices, merchandices where order_merchandices.Merchandices_id = merchandices.Merchandices_id  group by Orders_Id;

			DELIMITER //
			CREATE PROCEDURE TotalEachOrder_merchandices()
			BEGIN
			SELECT merchandise_name, sum(Quantity*Cost) as total_value from order_merchandices, merchandices where order_merchandices.Merchandices_id = merchandices.Merchandices_id  group by Orders_Id;
			END //
			DELIMITER ;

			call TotalEachOrder_merchandices();


/* ========================================================================================================================================*/
/* ========================================================================================================================================*/

/* ========================================================================================================================================*/
/* =====================================================  PRIVILEGES TO USER   ============================================================*/


/* CREATING A USER AND GIVEN PRIVILEGES */

			CREATE  USER 'superABIEL'@'localhost' IDENTIFIED BY 'superABIEL';
			
			SHOW GRANTS FOR 'superABIEL'@'localhost';  
			
			GRANT ALL  PRIVILEGES ON restaurant_db.* TO  'superABIEL'@'localhost';

			REVOKE ALL PRIVILEGES ON restaurant_db.* FROM 'superABIEL'@'localhost';
			
			DROP USER 'superABIEL'@'localhost';	

/* ========================================================================================================================================*/
/* ========================================================================================================================================*/



/* ==========================================================================================================================================*/
/* ======================================================== TRANSACTIONS ====================================================================*/


/*(1) Start new transaction inserting and updating values implementing rollback and commit*/
			
			Start TRANSACTION;

			/*SQL Statements*/
			insert into Customer values ("11", "Dunn", "Mcdonals", "898776546", "mcdunn@gmail.com");

			update Customer set Customer_ForeName = "Joan" where Customer_Id = 9;

			select *from Customer;

			/*Undo changes*/   /* If you do any change need to do before the roolback and then next commit 
								to save the changes if you do opposite it wont save your changes to the original state*/
			ROLLBACK ;

			/*Commit changes*/   
			COMMIT;
			select *from Customer;



/*(2) Start new transaction inserting, updating and deleting values implementing rollback and commit*/
			
			Start TRANSACTION;

			/*SQL Statements*/
			insert into Customer values ("12", "Donna", "Mcaffe", "892226546", "mcaffe@gmail.com");

			update Customer set Customer_ForeName = "Pietro" where Customer_Id =1;

			DELETE from Customer where Customer_Id = 11;

			select *from Customer; 

			/*Undo changes*/
			rollback;

			/*Commit changes*/
			commit;

			select *from Customer; 


/*(3) Start new transaction inserting, updating and deleting values implementing rollback and commit*/
			
			Start TRANSACTION;

			/*SQL Statements*/
			insert into Branch values ("11", "FKC Dublin", "Abi Lopez", "811226546", "Dublin Road", "Dublin", "Co. Dublin", "D02 W2X2", '2021/10/12');

			update Branch set Manager_Name = "Pablo Escobar" where Branch_Id  =1;

			DELETE from Branch where Branch_Id = 2;

			select *from Branch; 

			/*Undo changes*/
			rollback;

			/*Commit changes*/
			commit;
			select *from Branch; 



/* =====================================================================================================================================*/
/* =====================================================================================================================================*/

/* =====================================================================================================================================*/
/* ========================================================  INDEXES  ==================================================================*/
		
			
			CREATE INDEX MYINDEX ON CUSTOMER (Customer_ForeName);
			
			CREATE UNIQUE INDEX MYINDEXBRANCH ON BRANCH (Telephone);			
			
			ALTER TABLE `customer` ADD INDEX `email_index` (`email`);

			ALTER TABLE `branch` ADD INDEX `eircode_index` (`Eircode`);

			ALTER TABLE `Merchandices` ADD INDEX `Merchandices_id_index` (`Merchandices_id`);
		

/* ========================================================================================================================================*/
/* ========================================================================================================================================*/

/* =====================================================================================================================================*/
/* =================================================== GENERAL QUERIES =================================================================*/

/* 1) Selects for displaying all tables.  ****** */

			select * from Branch;
			select * from Customer;
			select * from Reservations;
			select * from Orders;
			select * from Merchandices;
			select * from Order_Merchandices;
			select * from Payment_Type;
			select * from Payment;
			select * from Docket_Order;
			select * from Menu_Items;
			select * from Menu_Type;
			select * from Dishes_Menu_Items;
			
			/* Another option to display a table in vertical form */
			
			select * from customer \G
		
			
/* 2) --- It shows the numbers of manu_Item that each menu_Name has ------------------------------------------------------------------------*/ 

			select Menu_Name, count(Menu_Item) as Menu_name_Offered
			from menu_type, menu_items where menu_type.menu_type_Id = menu_items.menu_type_Id 
			group by Menu_Name order by Menu_name_Offered;
			
/* 3) -- Display in a new table the Lowest_Amount_Paid, Highest_Amount_Paid,Average_Amount_Piad, Total_Amount_Paid from customers 
             for the table payment-----------------------------------------------------------------------------------------------------------*/

			select
			min(Amount) as Lowest_Amount_Paid, 
			max(Amount) as Highest_Amount_Paid, 
			avg(Amount) as Average_Amount_Paid, 
			sum(Amount) as Total_Amount_Paid
			from payment;
			
/* 4) -- /Get the full name of a customer who has bought merchandise, and a count of the different kinds 
             of merchandise items they've bought/ ------------------------------------------------------------------------------------------- */

			select concat(c.customer_forename, " ", c.customer_surname) as full_name, count(distinct om.merchandices_id) as Number_Of_Merchandices
			from customer = c, orders = o, order_merchandices = om
			where o.customer_id = c.customer_id
			and om.orders_id = o.orders_id
			group by o.customer_id;		
			
/* 5) --- /Find the top 3 branches by earnings/  -------------------------------------------------------------------------------------------------- */

			select b.branch_name, sum(p.amount)+sum(p.tip) as "Overall_earnings"
			from payment = p, branch = b, orders = o
			where p.orders_id = o.orders_id 
			and b.branch_id = o.branch_id
			group by o.orders_id
			order by sum(p.amount)+sum(p.tip) desc
			limit 3;			
			
/* 6) --- *Find the total cost of all items purchased in an order -----------------------------------------------------------------------------------*/
			
			select o.orders_id as Number_Receipt, sum(mi.cost) as Total_Receipt 
			from orders = o, Docket_Order, Dishes_Menu_Items, Menu_Items = mi
			where o.orders_id = Docket_Order.orders_id
			and Dishes_Menu_Items.Docket_Order_Id = Docket_Order.Docket_Order_Id
			and mi.Menu_Item_Id = Dishes_Menu_Items.Menu_Item_Id
			group by o.orders_id;
	

/* 7) ----- Reduce the booking cost for reservations booked in the afternoon (13:00-18:00) by 10% -----------------------------------------------------*/

			select * from reservations; /*(Select before update)*/
			
			update reservations set Booking_Fee = Booking_Fee*.90
			where time_book between "13:00:00" and "18:00:00" 
			and customers_at_table > 4;		

			select * from reservations;  /*(Select after update)*/			
			
		
/* 8) -- It has been decided not to have two columns for Customer_ForeName and Customer_SurName for the table customer,---------------------*/ 
/* -------------- it was decided to create a column joining the two names of the customer. ------------------------------------------------------*/

			update customer  set Customer_ForeName = replace(Customer_ForeName,Customer_ForeName, concat(Customer_ForeName,' ', Customer_SurName));
			 
			alter table customer change Customer_ForeName Full_Name_Customer varchar(100);

			alter table customer drop column Customer_SurName;

			select * from customer;


/* 9)	Find all merchandices which have a unit price
 between £10 and £25 and raise the unit price by £5.*/

		
/* 10)	/*The menu item "Chicken Nugget" does not indicate the fact that you are given a box of 12 chicken nuggets. Correct this name------------*/
			
			update menu_items
			set menu_item = "Dozen Box of Chicken Nuggets"
			where menu_item = "Chicken Nugget";



/* ==========================================================================================================================================*/
/* ==========================================================================================================================================*/


















