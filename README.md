
# eCommerce Database Project

This project contains the SQL schema and sample data for an eCommerce website database.
It was developed by Femi Oyinloye and Camille Asongtia as part of an academic exercise and demonstration.

## 📋 Project Overview
The database models a basic eCommerce system, covering:

- Product categories
- Customers
- Products
- Orders and Order Details
- Product Reviews

It also includes useful example queries to:
- Retrieve data
- Analyze customer behavior
- Identify active/inactive customers
- Find most loyal customers (MVCs)

## 🛠️ Database Tables

| Table Name   | Description |
|--------------|-------------|
| Categories   | Stores product category information. |
| Customers    | Stores customer personal and contact details. |
| Products     | Stores product information, linked to categories. |
| Orders       | Stores orders placed by customers. |
| OrderDetails | Stores detailed breakdown of each order's products. |
| Reviews      | Stores customer reviews for products. |

## 🗄️ Table Structures
Each table is created with appropriate primary keys, foreign keys, and constraints to maintain referential integrity.

Example:
- Products.CategoryID → Categories.CategoryID
- Orders.CustomerID → Customers.CustomerID
- OrderDetails.OrderID → Orders.OrderID
- OrderDetails.ProductID → Products.ProductID
- Reviews.ProductID → Products.ProductID
- Reviews.CustomerID → Customers.CustomerID


### Entity Relationship Diagrams (ERD)
![ERD](/img/eCommerceApp.png)

## 📈 Sample Queries Included

### Retrieve all data from each table:
```sql
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Reviews;
```

### Find active customers (those who placed orders):
```sql
SELECT CustomerID, FirstName, LastName, Email
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);
```

### Find inactive customers (those who have never placed orders):
```sql
SELECT CustomerID, FirstName, LastName, Email
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
```

### Count orders placed by each customer:
```sql
SELECT CustomerID, COUNT(*) AS 'Order Count'
FROM Orders
GROUP BY CustomerID;
```

### Identify Most Valuable Customer (MVC):
```sql
SELECT CustomerID, FirstName, LastName, TotalOrders
FROM (
  SELECT CustomerID, FirstName, LastName, COUNT(OrderID) AS TotalOrders
  FROM Customers
  JOIN Orders USING(CustomerID)
  GROUP BY CustomerID
  ORDER BY TotalOrders DESC
  LIMIT 1
) AS TopCustomer;
```

## 🚀 How to Use

### Setup Database:
- Create a new database (e.g., `ecommerce_db`).
- Execute the provided SQL script to create tables and insert sample data.

### Run Queries:
- Use a database management tool like MySQL Workbench, phpMyAdmin, or CLI to execute and test the sample queries.

## 👨‍💻 Authors
- Femi Oyinloye


## 📜 Notes
- Images in tables (Categories, Products) are currently left as empty blobs (`''`) — placeholders for future updates.
- Sample queries were selected randomly for demonstration and recording purposes.
- The schema supports basic CRUD operations and business analysis scenarios.

---

## 📊 SQL Queries for Business Scenarios

Below are several SQL queries that demonstrate common business needs and operations based on customer orders, reviews, inventory, and revenue tracking.

### 1. Display Positive Customer Reviews (4★ and 5★)
```sql
SELECT 
    Products.productname AS 'Product name', 
    CONCAT(customers.LastName, ' ', customers.FirstName) AS 'Customer name',
    Rating, 
    Comment
FROM reviews
INNER JOIN products ON reviews.productId = products.productID
INNER JOIN customers ON reviews.CustomerID = customers.customerId 
WHERE rating >= 4
ORDER BY Products.productname;
```
**Purpose:** Helps businesses highlight positive customer feedback on product pages, improving decision-making for potential buyers.

### 2. Count Total Positive Reviews Per Product
```sql
SELECT 
    Products.productname AS 'Product name', 
    COUNT(reviews.ReviewID) AS 'Total Positive Reviews'
FROM reviews
INNER JOIN products ON reviews.productId = products.productID
WHERE rating >= 4
GROUP BY Products.productname
ORDER BY COUNT(reviews.ReviewID) DESC;
```
**Purpose:** Tracks which products are loved most by customers.

### 3. Identify VIP Customers (Total Spent > 500)
```sql
SELECT * FROM (
    SELECT CustomerID, FirstName, LastName, SUM(TotalAmount) AS TotalSpent
    FROM Customers
    JOIN Orders USING(CustomerID)
    GROUP BY CustomerID
) AS CustomerTotals
WHERE TotalSpent > 500;
```
**Purpose:** Finds high-value customers based on total spending.

### 4. Identify Large Orders (Orders Over €1000)

**Quick Version:**
```sql
SELECT 
    OrderID, 
    SUM(Quantity * Price) AS 'Total Amount'
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity * Price) > 1000;
```

**With Customer Information:**
```sql
SELECT 
    orders.OrderID, 
    CONCAT(customers.LastName, ' ', customers.FirstName) AS CustomerName, 
    SUM(orderdetails.Quantity * orderdetails.Price) AS 'Total Amount'
FROM orders
INNER JOIN orderdetails ON orders.OrderID = orderdetails.OrderID
INNER JOIN customers ON orders.CustomerID = customers.customerID
GROUP BY orders.OrderID, CustomerName
HAVING SUM(orderdetails.Quantity * orderdetails.Price) > 1000;
```
**Purpose:** Recognize big buyers for loyalty programs or fraud detection.

### 5. Monitor Moderate Stock Levels (Between 10 and 20)
```sql
SELECT * FROM Products
WHERE StockQuantity BETWEEN 10 AND 20;
```
**Purpose:** Support inventory balancing and restocking strategies.

### 6. Generate Invoice Details for Specific Customer (CustomerID = 3)
```sql
SELECT 
    orders.orderid AS 'Order Id',
    orders.TotalAmount AS 'Total orders',
    products.price AS 'Price (€)',
    orderdetails.Quantity AS 'Quantity',
    orderdetails.Quantity * products.price AS 'Total price for the product (€)',
    products.productName AS 'Product Name',
    categories.categoryName AS 'Product category',
    products.description AS 'Product Description',
    CONCAT(customers.FirstName, ' ', customers.LastName) AS 'Customer Name',
    CONCAT(customers.Address, ', ', customers.Country) AS 'Customer Address',
    customers.Email AS 'Customer Email',
    customers.Phone AS 'Customer Phone Number'
FROM orders
INNER JOIN orderdetails ON orders.orderid = orderdetails.orderid
INNER JOIN products ON orderdetails.productid = products.productid
INNER JOIN customers ON orders.customerid = customers.customerid
INNER JOIN categories ON products.categoryid = categories.categoryid
WHERE customers.customerid = 3;
```
**Purpose:** Generate invoices with detailed product and customer information.

### 7. Count Customer Orders
```sql
SELECT 
    CustomerID, 
    COUNT(*) AS 'Order Id'
FROM orders
GROUP BY CustomerID;
```
**Purpose:** Identify frequent customers for loyalty programs.

### 8. Product Distribution Across Categories
```sql
SELECT 
    CategoryId,
    COUNT(*) AS Count
FROM products
GROUP BY CategoryId
ORDER BY Count DESC;
```
**Purpose:** Analyze product spread across different categories.

### 9. Update Product Name and Price
```sql
UPDATE 
    products  
SET  
    ProductName = 'Gaming Laptop Z17', 
    Price = 1600
WHERE  
    productId = 3;
```
**Purpose:** Manage product rebranding and price updates.

### 10. Orders and Customer Details (Including NULL Customers)
```sql
SELECT 
    orders.orderid AS 'Id number of ordered item',
    customers.firstname AS Firstname, 
    customers.lastname AS Lastname, 
    orderdate, 
    totalamount AS 'Total amount (€)',
    shippingAddress AS 'Customer shipping address'
FROM orders
LEFT JOIN customers ON orders.CustomerID = customers.customerId;
```

**Filter Orders by Date Range (Example: Q1 2024):**
```sql
SELECT 
    orders.orderid AS 'Id number of ordered item',
    customers.firstname AS Firstname, 
    customers.lastname AS Lastname, 
    customers.email AS 'Customer Email',
    customers.phone AS 'Customer Phone',
    orderdate, 
    totalamount AS 'Total amount (€)',
    shippingAddress AS 'Customer shipping address'
FROM orders
LEFT JOIN customers ON orders.CustomerID = customers.customerId
WHERE orderdate >= '2024-01-01' AND orderdate <= '2024-03-31';
```

### 11. Find Products with Low Stock (Below 20 Units)
```sql
SELECT 
    products.productName, 
    products.description, 
    categories.categoryName AS 'Product category', 
    products.StockQuantity AS 'Stock quantity'
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE StockQuantity < 20
ORDER BY StockQuantity;
```

### 12. Predict Days Until Out of Stock
```sql
SELECT 
    products.productName, 
    products.description, 
    categories.categoryName AS 'Product category', 
    products.StockQuantity AS 'Stock quantity', 
    ROUND(products.StockQuantity / AVG(orderdetails.Quantity), 2) AS 'Days Until Out of Stock'
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
INNER JOIN orderdetails ON products.productID = orderdetails.productID
WHERE StockQuantity < 20
GROUP BY products.productID
ORDER BY StockQuantity;
```
**Purpose:** Forecast stock depletion based on average sales.

---

## ⚡ Notes
- Some queries could not be fully implemented due to time constraints.
- Queries support business analysis like inventory management, customer segmentation, loyalty programs, sales monitoring, and fraud detection.
