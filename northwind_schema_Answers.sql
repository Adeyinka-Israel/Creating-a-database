
-- Q1 Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select categoryName, Description
from categories
order by CategoryName;

-- Q2 Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select ContactName, companyName, ContactTitle, Phone
from customers
order by Phone;

-- Q3 Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname -
-- respectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(firstName) "FirstName", upper(lastname) "LastName", HireDate
from employees
order by HireDate desc;

-- Q4 Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
select OrderID, OrderDate, ShippedDate, CustomerID, Freight
from orders
order by Freight desc
limit 10;

-- Q5 Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(CustomerID) as "ID"
from customers;

-- Q6 Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the-
-- -Country in descending order then by CompanyName in ascending order.
select CompanyName, Fax, Phone, Country, HomePage
from suppliers
order by country desc, CompanyName asc;

-- Q7 Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
select CompanyName, ContactName, city
from customers
where city = "Buenos Aires";

-- Q8 Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
from products
having UnitsInStock < 1;

-- Q9 Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select ContactName, Address, City
from customers
where country NOT IN ('Germany', 'Mexico', 'Spain');

-- Q10 Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select OrderDate, ShippedDate, CustomerID, Freight
from orders
where OrderDate = "1996-05-21";

-- Q11 Create a report showing FirstName, LastName, Country from the employees not from United States
select FirstName, LastName, Country
from employees
where country NOT IN ('USA');

-- Q12 Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
from orders
where ShippedDate > RequiredDate;

-- Q13 Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B
select City, CompanyName, ContactName
from customers
where City like ('B%');

-- Q14 Create a report showing all the even numbers of OrderID from the orders table.
select OrderID
from orders
where OrderID % 2 = 0;

-- Q15 Create a report that shows all the orders where the freight cost more than $500.
select * 
from orders
where Freight > 500;

-- Q16 Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from products
where ReorderLevel > UnitsInStock;

-- Q17 Create a report that shows the CompanyName, ContactName, Phone number of all customer that have no fax number *************
select CompanyName, ContactName, Phone, fax
from customers
where fax IS NULL;

-- Q18 Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName, ReportsTo
from employees
where ReportsTo IS NULL;

-- Q19 Create a report showing all the odd numbers of OrderID from the orders table.
select OrderID
from orders
where OrderID % 2 <> 0;

-- Q20 Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName
select CompanyName, ContactName, Fax
from customers
where fax IS NULL
order by ContactName;

-- Q21 Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
select City, CompanyName, ContactName
from customers
where city like ('%l%')
order by ContactName;

-- Q22 Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s
select FirstName, LastName, BirthDate
from employees
where BirthDate like ('195%');

-- Q23 Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table
select FirstName, LastName, year(Birthdate) as "Birth Year"
from employees;

-- Q24 Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by 
-- OrderID and sorted by NumberofOrders in descending order.
select OrderID, count(OrderID) as "Number of Orders"
from  `order details`
group by OrderID
order by count(OrderID) desc;

-- Q25 Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,...
-- ...Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select products.SupplierID, ProductName, CompanyName
from products
inner join suppliers on products.SupplierID = suppliers.SupplierID
where CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by SupplierID;

-- Q26 Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
where ShipPostalCode like ('98124%');

-- Q27 Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle
select ContactName, ContactTitle, CompanyName
from customers
where not ContactTitle like ('%sales%');

-- Q28 Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"
select LastName, FirstName, City
from employees
where city NOT IN ('Seattle');

-- Q29 Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country
from customers
where country IN ('Mexico');

-- Q30 Create a select statement that outputs the following "contact info":
select concat(firstName," ",LastName," ","can be reached at"," ",HomePhone) as "Contact Info"
from employees;

-- Q31 Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select ContactName
from customers
where not ContactName like ('_A%');

-- Q32 Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and...
-- maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively
select round(avg(UnitPrice)) as AveragePrice, sum(UnitsInStock) as TotalStock, max(UnitsOnOrder) as MaxOrder
from products;

-- Q33 Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table
select p.SupplierID, CompanyName, CategoryName, ProductName, UnitPrice
from products as p
inner join suppliers as s on p.SupplierID = s.SupplierID
inner join categories as c on p.CategoryID = c.CategoryID;

-- Q34 Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped
-- by CustomerID
select CustomerID, sum(Freight)
from orders
group by CustomerID
having sum(Freight) > 200;

-- Q35 Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and
-- customers table with discount given on every purchase.
select o.OrderID, ContactName, UnitPrice, Quantity, Discount
from customers as c
inner join orders as o on c.CustomerID = o.CustomerID
inner join `order details` as od on o.OrderID = od.OrderID;

-- Q36 Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of
-- who they report to as manager from the employees table sorted by Employee
select e.EmployeeID, concat(e.firstname," ",e.lastname) as 'Employee', concat(m.firstname," ",m.lastname) as 'Manager'
from employees as e
inner join employees as m on m.employeeID = e.ReportsTo;

-- Q37 Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.
select avg(UnitPrice) as AveragePrice, min(UnitPrice) MinimumPrice, max(UnitPrice) MaximumPrice
from products;

-- Q38 Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
-- Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
create view CustomerInfo as
select c.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate
from customers as c
inner join orders as o on c.CustomerID = o.CustomerID;

-- Q39 Change the name of the view you created from customerinfo to customer details.
Rename Table CustomerInfo to customer_details;

-- Q40 Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description,
-- QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and
-- categories tables. HINT: Create a View

create view ProductDetails as
select ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
from categories as c
inner join products as p on c.CategoryID = p.CategoryID
inner join suppliers as s on p.SupplierID = s.SupplierID;

-- Q41 Drop the customer details view.
Drop view customer_details;

-- Q42 Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
SELECT LEFT(categoryname, 5) AS ShortInfo
FROM categories;

-- Q43 Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create
-- a Table, use the LIKE Statement and INSERT INTO statement
Create table shippers_duplicate like shippers;
insert into shippers_duplicate select * from Shippers;

-- Q44 Create a select statement that outputs the following from the shippers_duplicate Table:
select * from shippers_duplicate;

-- Q45 45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
select CategoryName, CompanyName, ProductName
from suppliers as s
inner join products as p on s.SupplierID = p.SupplierID
inner join categories as c on p.CategoryID = c.CategoryID
where CategoryName in ('seafood');

-- Q46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select CategoryID, CompanyName, ProductName
from products as p
inner join suppliers as s on p.supplierID = s.supplierID
where CategoryID = 5;

-- Q47. Delete the shippers_duplicate table
drop table shippers_duplicate;

-- Q48. Create a select statement that ouputs the following from the employees table
select lastname, firstname, title, 2023-year(BirthDate) as Age
from employees;

-- Q49 Create a report that the CompanyName and total number of orders by customer renamed as number of orders since
-- Decemeber 31, 1994. Show number of Orders greater than 10
select companyName, count(OrderID)
from customers as Cr
inner join orders as o on cr.customerID = o.CustomerID
where orderdate >= "1994-12-31"
group by CompanyName having count(OrderID)>10;

-- Q50. Create a select statement that ouputs the following from the product table NB: It should return 77rows
select concat(productname," ","weighs/is"," ",QuantityPerUnit," ","and cost $",round(UnitPrice)) as ProductInfo
from products;