-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select category.CategoryName, product.ProductName
from product
join category on product.CategoryId = category.Id
order by category.categoryName;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [order].id, shipper.CompanyName
from [order]
join shipper on [order].ShippedVia = shipper.id
where [order].ShippedDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.productName, [OrderDetail].quantity
FROM [OrderDetail]
JOIN Product on [OrderDetail].ProductId = Product.Id
WHERE [OrderDetail].OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [Order].id as "Order ID", Customer.CompanyName as "Customer's Company Name", Employee.LastName as "Employee's Last Name"
FROM [Order] 
JOIN Customer on [Order].CustomerId = Customer.Id
JOIN Employee on [Order].EmployeeId = Employee.Id
