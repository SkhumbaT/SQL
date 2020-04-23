-- Adminer 4.7.6 PostgreSQL dump


CREATE DATABASE umuzi ;

-- Creating database "umuzi" which contains the following tables:
-- Customers with COLUMNS CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country.
-- Employees with COLUMNS EmployeeID, FirstName, LastName, Email, JobTitle.
-- Orders with COLUMNS OrderId, ProductID(foreign key referenced from products), PaymentID(foreign key referenced   from          
-- payments), FulfilledByEmployeeID(foreign key referenced from employees), DateRequired, DateShipped, Status.
-- Payments with COLUMNS CustomerId (foreign key referenced from customers), PaymentID, PaymentDate, Amount.
-- Products with COLUMNS ProductId, ProductName, Description, BuyPrice.

-- customer John Hibert's name has been updated to Lerato Mabitso, and John Hibert's contact details are stored in Customers table.
-- customer Leon Glen's contact details are stored in Customers table.
-- customer Charl Muller's contact details are stored in Customers table.
-- customer Julia Stein's contact details are stored in Customers table.

-- Kani	Matthew's personal details are stored in Employees table.
-- Lesly Cronje's personal details are stored in Employees table.
-- Gideon Maduku's personal details are stored in Employees table.

-- customerid field in the orders table links/references employeeid from customers.
-- productid field in the orders table links/references productId from products.
-- paymentid field in the orders table links/references paymentsid from payment.
-- fulfilledbyemployeeid field in the orders table links/references employeeid from employees.


-- all the order information is stored inside the orders table.
-- all the payment information is stored inside the payments table.
-- all the product information is stored inside the products table.


-- 2020-04-22 17:27:05.125535+00
