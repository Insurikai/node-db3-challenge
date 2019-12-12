-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName FROM Product JOIN Category ON Product.CategoryId = Category.Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT OrderDetails.OrderID, ShipperName FROM OrderDetails JOIN Orders ON OrderDetails.OrderID = Orders.OrderID JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT ProductName, Quantity FROM OrderDetail JOIN Product ON OrderDetail.ProductId = Product.Id WHERE OrderId = 10251
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [Order].id as "Order ID", CompanyName as "Customer's Company Name",  LastName as "Employee's Last Name" FROM [Order] JOIN Customer ON [Order].CustomerId = Customer.Id JOIN Employee ON [Order].EmployeeId = Employee.Id