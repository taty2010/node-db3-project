-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM Product as p
JOIN Category as c
ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, o.OrderDate, s.CompanyName
FROM [Order] as o
JOIN Shipper as s
ON o.ShipVia = s.Id
WHERE o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT od.OrderId, p.ProductName, od.Quantity
FROM OrderDetail as od
JOIN Product as p
ON od.ProductId = p.Id
WHERE od.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, c.CompanyName, Employee.LastName
FROM [Order] as o
INNER JOIN Employee
INNER JOIN Customer as c
ON o.CustomerId = c.Id  AND o.EmployeeId = Employee.id


-- Stretch 1
SELECT c.CategoryName, COUNT(p.CategoryID)
AS [Count]
FROM Products as p
JOIN Categories as c
On p.CategoryID = c.CategoryID
GROUP BY c.CategoryName

-- Stretch 2
SELECT o.OrderID, COUNT(o.OrderID)
AS ItemCount
FROM [Orders] as o
JOIN OrderDetails as od
On o.OrderID = od.OrderID
GROUP BY o.OrderID

        


